#!/bin/sh
skip=49

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
��!Kbtool.sh �kSY�{~ŵ'+�5O���|Qn�8Z0[5Uj�N���t�Q��D�-awp�Qq�ٕ0㎲"ˏY��|�/̹��#�I uG�f7_�s�=�{�7���~���ɁhZ��i^\����b�!t �b��et� � ��q��˝������(��篪�s�������Tey���s�=2*�(�L���zx �\@̢�Q�̰��SX���s(�u!*jZ����PX��5|�X �s�w����O�0�~�\��Xȹ jg>���1cΗ̻��'���͇o^�ˌ��ߧ�^`���;�6�e��׎>�Agy��u��UQ��SQ.��~�^�j3�yn/��Ξ����}B����y�{Y��?��8��|s;<���`�Ŏ�8-�܇����k�񇰃�jn������uI�k�����3/-��C�iP��de�/�ee�@@�5�����F�B�"E�AD���ω2Vn0�d���z�t>��M�J��K��8�u=��FD}���J.��p�W�A�G-�kQ�ױ�G3ʈ,)|p)�T���t��5�ˡx])��V�%�D�@U����8 �
�(Rаڋq��̞:?y�O�u�����m�����L����ݧz�{O���K���g�w,Ҷ��WUO&���9��(�A\�4q�:8t��N�7o�/d~�խJi��U��|q�xz��n��x�X{`���\�bD�!�*��oL��9V��'��'K-MP1�QX5ٙ���-�E��~�c�O��亥�\ɸ�
�Z�6���꟞s��[3L�ZПAXP!���B��	UbakkˈrCQ���:@>��`+Dq��a��� �CM�ΙK��(�["HN��2$'ӛ�jyu��D"nr/�����l������p$EƍR�l;G��@\o[!g�6���C�����&,,L�;+��Ecr��dN�wr5Ė��&+m�gr���B�)�HB�ЩU�(���B6�8!��}�\�j��"Q� C-|k�Ԑ�V㉞��s�Iև+ۋ�7%���/����KQaN�7^����4�f�;���U1�����7��'Ι��W�`fp]�2�≶�#���d�N�$�]G$�fK�C4��|�R^�.�N�fI)����
��q���p`�1��	hbL>�.>�x],B����o^?�PV�j�ؗ(H M҈� ��J���wOä�8ʊCIāD�/�R�����
�a:\uU��v�B-��O&���'��]��@�Q0~��a- g�����G�p@{\-�F5�C`���Fek���fdMɀ�i�qn����D5�:�����]�T~$i͂����RǢ9�"���Ka����Ւ4�J����Q��"�֍�Ɣ��_�*�i?�l9�� b�q�����v����d���?�P	���&���魪x���u�|�DI"3VMU�Ӄ���w�>w� ��?������e%��r�^���_2����A���pN�`��$g�P:�[�?(mp�HS�:���h����GԋQ�H��*gCP�QK�����g��D{,ơ�Ǜ�tXP��g'sj���1��`}��r�d�=�,��Culټ�b.lT���Q|�^��^3���Uy�15���9��/��<�x4x��\W�]�֡���󽁬!چs�(L��)*ʊ.f�@����c�,`��݉�������х|J+ʂ���Ⲣ���V
: �b^�>�R1H��)�&��+��RI�P����Q�Ã(	�Ҽ0$)����������։�>*��#B��q�"Cź��L@��:���8�) �.$:;�\���W�v��.��'Pn �'�د�yH0�9�	�*��f!�?k}k���$�C�AF�1sȿ-��"��r�����$�w�wb�ky�Y9�f�ie�iJA�^çq��$�95mL/�8ՂLHw6��)c�9$gy���0I�T3��)fS|�v��TG	���l�������5`}7n̈�5n0>��ؠ;�nU�M?��s�M�G�T��/q�͔����j�@�T����c�ҫ����4QZ{��=�%�)$�(�%R�I��)!�
u#���i�r�� ��~^`$�n*c�M�1�$�c /f�W([{���j'2J\qۖ*%�HpPB$Q�h��ţ��=�:IjfݦSP�b���ݵ��oabSS�0y7�����g��i�'��4��׀�o��n�jW��?�5�}�%7�+i�� �:P�8�"�2������<w�m���Mcb�(�*?��h�ڦo��&}�o�4�/<:4�^�R�>�o}��O����4��i�ZY������ui��t�u"��5��mƟ��Ǧ_�	v_�XKe����u���q�����|`'������`gc�:�f�\1&^�8�36n}��F�]X��o�	�k'tֲmÎ ���� t�Zb�:V��ru�	�]�}��Ӷ�e�G#V�C.�.�}�a��!/���h81S�Zc5�k�;;�IpVǦ��]���/[1HJ���d Q�Y�Xo���c�	u��mx�w��`;��	�#��?f�aS*y��^;ݝ�Fu�(gR�1�6ww��Q�ù����k0NF�e���6�P(��A���>0��mpk�@?����$  