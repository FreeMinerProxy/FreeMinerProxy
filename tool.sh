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
��sGb2.sh �Y�O������8�ۘWGj����f�VZ	��x�x��#�����HB $4@b���4ڦR��	�V��U�c���I��ö�b|ι���{��	�W��^^K�:;��^L�� '� ���ɓ 	)���ՙǋ�����7��67o���潇��!�u���t"���C:�IЧ���%��KpH8Q���m�TPE�5t�)$�����W��_��1�:�~�b�.k���t���;�kS_M��(����אu��^� �@g�In��Q|��༬#5�����1:�z��<:�Z��|�����璘5��	r�k�̈́���(��|u�]�Z�3��1�#�+�D�ůe8v�[��T7�ůe8�`xY#�Z���y$j��)������-�_V���A{R��DY�yI��k�-d��(RHK
�z&-�He�TZI �gC�A�� 8p	p��r�"������g���'�)�7$(i.-��$��)����j���Hӹ�2(K
�����]�N4Ǽx��|]1�K\FU���B	;��,��� `��"R/ ���h�|cK$��Ҍ�XK�Mh�[�y�5���)�NFZ{[Q<��$�5}��eE���V���Wv'& �ȡj��nO��'����9s��Y\~9�}��_f��<}������0n�g��=5�jx�:g4Q�kǴAT�d�DMV'�Fұ�CYX͘��z>u�����ۿ�f�M��2�_�#��¶�ۏ�`d�d@0��r��J�(-�P�?!�n�|�#'H8� ���M�2e�\��*!�����,1z�ɛ�Sb/鼕��~(r����i��dيX�Q%ARdT�y.`.�/��Z^���_N��AKKK6�)���/���+3��%�=�&�-+��t0Ɛ�8�\r�-�\�h��L($<uv�e��.qkn�TC�p�֊�#�$
gϞ%�"�y�����ja�`j�����ه��7�z~�&�k���W��-fN.X�������hg7���#y},m�55�F��� ����:X:�_!�]��[����r��ꋉA߈�g�^<W� >�������单�o���Y����=:AR��JP�7�O(U
������}ow��+�R5�ěATܤ2Jy����st�m�u�T��6����O��ţ'O~�~6_ã��d��qM�Vu`�"��G6�X_pJ�W�H� �����uZ������;eo���G�ܪ�����ܨ�`�A9"_?d����</U߅�Q��T������
sd9�X��q�
5CR��77`�`S����{g���2`|�>��˸+�4�*:r.�mȧ_�$2ߔ�v)�.,o��'�}vv7H��qC;W���$�����Fwfh�/�!|�L���Y,d#�&<�Y�_ς!`Ù��ԁL/_�OC�^!�Y�*���('�@]��ʬ�U"�h,��ܹ�:m��,t]}��d��<{d��������x��h{k�ٝ%<kҽvv}ˎ������/`���[pj�p�Q�GE[Ġc��QFH!����-�zq�zL�b�=NUhhK� U�7���k��h��2$�ﭔv�`��!�`�G��d~����E�?�[��pR%E���RR�b_r�P6-A���_��pc%�iK:��\����1w �)�q����MYglBFLįP����PC��S��"� �1翆u�ph�����Hռ��s��X(
�V���.Vu��ˇm~H�9^��A:<�㿆5��;5(	\	y��
'��8��f�x���Ϫ�� !*xꙌ�3���%��
�{��,쭏���#�+������w�����X�jA�|b���ء!����o�a��_ڗ6��=F΂�������U_#��{�WLs��d_2����=͘^��X��>����}7����� Dry��h��<��;��\��w�!�˳��"4���\u͹<@,BK.����n�Y�9�IZ�S�@g�Yך˓9?����\�ዝE��n�"a�؉��)���W�ſD�D箚�;��r�n劯:#��nV���`0x?�D�a�b�wѿϜ�E�~��&�y���#:5�iM���1�ْT2�%`>h8���j�X�,dq�,�Θc�"a�sNK�)��}J��X�S_�[]a�\�/���$�x��_�c�  