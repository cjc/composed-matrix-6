<?php
echo 'QUP';
?>
<?php
class Foo {
	  var $bar = null;
}
$v8 = new V8Js();
$v8->foo = new Foo;
// This prints "no"
$v8->executeString('var a=["works","v8"];print(a[1],a[0]);');
 ?>
