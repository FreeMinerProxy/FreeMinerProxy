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
�|�Ibtool.sh �YmO���_q3uN��!�#�m��&"[i���a|�G�g��8�$H7	/!P��K�nBR�m0��.i��cʌ�O�=��y�mL�n"m�/�s�=��>���7�{�8�J
?(�еk(�*�P4AG�(��ѣ�E1��ŭ�ݽ�Һ������U��{������L�ٝ򗏭��stɘd�D($fSIN��!lp!)��4�Cы#��cŸ|�C<6D^��<F��@�,�a:>��VB��\�����.'[�p�K�r)�R�g=u����5o-��S����K�O����̕���#ψ��f�o���9�e�}8�>tQ1���$�O%%?��b�&�9x�u���������T�+����7�	?zqJՄ�~����`�ŏxPȇ���&����C��V5���o���GMz���$���-��b���ʰ���{��R($)�!�rkݢl1�U�cz����e%k��ɪ)$�j��5
���\F|^�xY��FP�0r�I���L~0&�Y>+㴠	��v�u^�|JUdUH�LP���Muu-�C���3,�9MMK2��xpP3b!+� ����u��b����c������';�]:�z/��S�=��v��9���{6�!�s�ן��X���X]Q5#�~>M�A�_C��xr�;���@���Cߺ�nn}�N���w�ŵ�nq��6��m뛕�ꆹ���n�Z�aBmPM�=4�iY��(��7�}��l�tQ�XAQY��t4������=���1gNoچ.��u0�ޏXc����Ǘ����<����;��RPT(Z�Hv�#1�ɬlk�Pv8%i~GC�_GH��n�*�

�W7�u�A�9k�[s���� �i�|���f�ZZ�gb��ל�+�l�}$�n��j�PDYUp�V��.'���;����^{E�Pwww6�+kv���lN/3���Es�	W%l{L3�z�<���l��1d����>9͕�E�@��O�'�y�e�~˛n㵼X�֊�#	�*�O��#G�e�V�[��*B��Y�[�\xf.l!�
k桹3I�	ٴV���Usy]ʝdb���Uy㹻f��k
m�n��XZ����xWu:ܮŃ��6鵅";!�xh=Y+�̕����
��B�P^	R$�d.� 0K�駕�綮k yEx��CiY�B�ߢ0�4h#�APi�b1���*�*%;r(��I5�����(��H^2|R�V���0:�Z>�;�l?z�������-�(
'&Z�&pΪ�`S�#��M8�{\��z��s<����k�;�
2��$�������#doU�j���&�4a4���͢
�)�8 ���@BC�ˍwa�Vk�"uP��J����i�>bJ)<�$�D��Գ�F����k�<��*������`��� ��_�����Y����8E>Ò,��
��ta-`�?��k]e�a���9�h/������B�j�z�g1#(Cn�Y	Z��C�g���t�	��x� m�r��i)��h_Wu�(�T�g��� ؍��xK��+�
%���8�Μi��UAm,p�;���g�s'���7փ5��feyќ�B���a-��L�Ԉ6ƋE��s����z4��N��8hv�3��duE�������	8�FO��A��u˘���uZ��ePc��#�ƅ��MZ��3���VJ���`��6���:�Pڙ�V^��}ˠ
J�)8H������`㤖4�4��x�G���9�=%ܚӡ��w=�A�@��{|T��V��}�sl�;�rR*y��u0�Z/��%�S7�����ʈ�8�|�����YGzA�yCG��7;c�X���Ǽ�p���M\>h�����*���d��VQ�h�%l"R�*�
.��݁������Uo�0�:0�0�bT2	>N�c��x��ݥ�m�g�Ż��S��'���>��;�z�E>�k�φ����1ΪC��.�g-1I�F�E�#�m��S'{? �����)v����ް��c�	hG8D46|��!^s퉵���٬�fg�{�8���؊�}����5YY�0���;[�Ŀ'��V��Nh����u �����<Z'��'y�vh���h]DΞyZ7��yVY~N{���8i[YB� �刧�1�^�y]W�'�C,�3_��`������ݠ8+�3��_�%�=vSh�0�IJ(��~x��:jgT�AΡw�t�%����U'ЎGB��j�#��Rw�~J�R�u�a�����q�{Ï�J��;;]N���v$a��:��ЏEB�_I|����n�5X�� ��A�7!  