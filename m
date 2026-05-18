Return-Path: <linux-gpio+bounces-37085-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMOZCU49C2oJFAUAu9opvQ
	(envelope-from <linux-gpio+bounces-37085-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 18:24:46 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BE23A570D63
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 18:24:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 627083100A86
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 16:13:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CFC740586A;
	Mon, 18 May 2026 16:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b="SqzswYZP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479D336D50D;
	Mon, 18 May 2026 16:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779120640; cv=none; b=plk43GNaL30sn81OsbuwCS8m9sDUSgYSkCE9BV/PIsNnZbgRS93PsnGnrC+mFojiK85lHqRmj3/FP9HvZ1isaYsouAvs1+joL06u3VZmjjFv2MaTgi1B8KXuu5XIVzl1Z05C8u+Jc1aK2I/y/3ce9oF2TIxPMBxKIlVc+a4MxI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779120640; c=relaxed/simple;
	bh=UDJI2f7wAkcp2aUH4BwWMgLHg1X0+V6jUsm3l703ZSM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aPpV8D4jtMO9rEXM4GiJkAO6iUGWFnJuS2RVvTubcxapgJY2lRfy7pBZ//n6W492o2r/Xm3wkF55hnvclgR6mooVR6ckVn2d7F54nrgJ65p0w/nK5+dg/S6DGS8fbCzNrD+pf08t4NsXRlKS1h2WZDrQ6+Kc/wb+lP6wvvv8144=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b=SqzswYZP; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1779120628; x=1779725428;
	i=markus.stockhausen@gmx.de;
	bh=he1xB3agKtaf1kPy697W0NQZ6xeULsDyRPDAuo6dXWg=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=SqzswYZP5Jxgx9uQvFNivP8BCNTyNQ8Bv2ZvEEAPuGVN1Jt9lfoWEP5szqtMtJKJ
	 fPI9bJZzbglyA/6NYWNsLw5lY2GNFfH6ZSB48QYjK/gSPmDZrs7D4e5uKvW89+Q9A
	 YF5qDQ4XYhiyqhs/FdP4aExB7BGN55yaNnXyEdszJj+X6WtDLmqYheNiJKCGknRj0
	 GB+vCrb3dXarhaVYV+F6psUPJKp0tfOvGVFBDiLBA+DDQ3KR6zOb5k5aH4AhepgqR
	 a138sL3PZl2V5HnjhYDtrsqEk6n0kb9BAW4sEkBKIjp3PuiiGQgVbK7EK/A5QabSI
	 WctwYau8fkgkYjrF9g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mqs0X-1xBDJy3XkX-00kCpc; Mon, 18
 May 2026 18:10:27 +0200
From: Markus Stockhausen <markus.stockhausen@gmx.de>
To: wsa+renesas@sang-engineering.com,
	andi.shyti@kernel.org,
	linusw@kernel.org,
	brgl@kernel.org,
	linux-i2c@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Markus Stockhausen <markus.stockhausen@gmx.de>
Subject: [PATCH v2] i2c: i2c-gpio: Enhance driver for buses with shared SCL
Date: Mon, 18 May 2026 18:10:13 +0200
Message-ID: <20260518161013.900504-1-markus.stockhausen@gmx.de>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:R+7U+VmTZjPEwyYwUWZLh92kZNetyNiRGoebwCGSX9zDrQP0+rU
 CNkq+/zUylZuF+gHRpSwUO7nd8dgAtjk4sIKCxhovhhh6N9cBZRX/Sr6hC3j8nmPKG90v0k
 zVgCH3dOqF/empcRy3dz45rii+AQT/3g0d2AM+NRnZQnNDe66MW82SFV3n6mS4LHkNuwXII
 ms5j8sdR8/SOyOWj8XwbA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/YUrUesYyYo=;OlivL68ikIOAur9aCXasASO/d8a
 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
 iATgD1mxUwwro1AngQbh97QJFWoz2YjlcUkkqZs
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmx.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37085-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmx.de];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[markus.stockhausen@gmx.de,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmx.de:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gmx.de:email,gmx.de:mid,gmx.de:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: BE23A570D63
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Some lower end hardware (especially Realtek based switches) are
designed with multiple I2C buses that share a single clock line.
E.g. the D-Link DGS-1250-28X realizes 4 I2C SFP busses with 5 gpios.

Enhance the i2c-gpio driver so it can handle such hardware designs.

- Detect GPIOs that are used by multiple I2C buses in the dts by
  using a unique identifier for each managed SCL.

- The first probing instance allocates and requests the shared SCL
  GPIO plus an associated rt_mutex. Subsequent instances detect the
  existing entry via the identifier and increment a reference count
  to reuse the descriptor.

- All data transfers are serialized via custom lock_ops that handle
  both the standard adapter bus lock and the shared SCL mutex. This
  ensures mutual exclusion across adapters sharing the clock line.

This patch was successfully tested on Linksys LGS310C that has two
SFP slots with two GPIO based I2C buses that share a sinlge SCL.
Test environment: OpenWrt snapshot ported to kernel 6.19.14
including CONFIG_GPIO_SHARED=3Dy and CONFIG_GPIO_SHARED_PROXY=3Dy.

Signed-off-by: Markus Stockhausen <markus.stockhausen@gmx.de>

=2D--

v1 -> v2
  - Convert fault injector to scl->gpio (reported by test robot)
  - Use rt_mutex and i2c_lock_operations instead of pre/post_xfer
    (logic taken from i2c-cht-wc.c and enhanced)
  - i2c_gpio_lookup_scl()
    - Improve list control flow
    - Improve comment
    - Carve out SCL node comparison into i2c_gpio_scl_matches()
  - Drop "valid" attribute and directly check gpiod instead
  - Improve fwnode args check for #gpio-cells=3D1 case
  - Add sda/scl cleanup during probe failures
  - Replace dev_info() with dev_dbg()
  - Reflect changed locking in commmit message
  - Tested with config option GPIO_SHARED/CONFIG_GPIO_SHARED_PROXY
    as requested by Bartosz
v1: https://lore.kernel.org/linux-i2c/20260514092042.3265986-1-markus.stoc=
khausen@gmx.de/

v0 -> v1
  - Initially this enhancement was submitted as a new driver with
    a new devicetree structure. After some discussion Wolfram
    advised to make only an enhancement to the i2c-gpio driver.
v0: https://lore.kernel.org/linux-i2c/20260511162528.84508-1-markus.stockh=
ausen@gmx.de/
=2D--
 drivers/i2c/busses/i2c-gpio.c | 208 +++++++++++++++++++++++++++++++---
 1 file changed, 194 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpio.c
index f4355b17bfbf..5362ab9f47bd 100644
=2D-- a/drivers/i2c/busses/i2c-gpio.c
+++ b/drivers/i2c/busses/i2c-gpio.c
@@ -18,9 +18,23 @@
 #include <linux/property.h>
 #include <linux/slab.h>
=20
+static LIST_HEAD(i2c_gpio_scl_list);
+static DEFINE_MUTEX(i2c_gpio_scl_list_lock);
+static struct lock_class_key i2c_gpio_scl_lock_key;
+
+struct i2c_gpio_scl_data {
+	struct fwnode_handle *fw_node;
+	u32 fw_pin;
+	u32 fw_flags;
+	struct gpio_desc *gpio;
+	struct rt_mutex lock;
+	refcount_t ref;
+	struct list_head list;
+};
+
 struct i2c_gpio_private_data {
 	struct gpio_desc *sda;
-	struct gpio_desc *scl;
+	struct i2c_gpio_scl_data *scl;
 	struct i2c_adapter adap;
 	struct i2c_algo_bit_data bit_data;
 	struct i2c_gpio_platform_data pdata;
@@ -31,6 +45,11 @@ struct i2c_gpio_private_data {
 #endif
 };
=20
+static inline struct i2c_gpio_private_data *adap_to_priv(struct i2c_adapt=
er *adap)
+{
+	return container_of(adap, struct i2c_gpio_private_data, adap);
+}
+
 /*
  * Toggle SDA by changing the output value of the pin. This is only
  * valid for pins configured as open drain (i.e. setting the value
@@ -53,7 +72,7 @@ static void i2c_gpio_setscl_val(void *data, int state)
 {
 	struct i2c_gpio_private_data *priv =3D data;
=20
-	gpiod_set_value_cansleep(priv->scl, state);
+	gpiod_set_value_cansleep(priv->scl->gpio, state);
 }
=20
 static int i2c_gpio_getsda(void *data)
@@ -67,9 +86,41 @@ static int i2c_gpio_getscl(void *data)
 {
 	struct i2c_gpio_private_data *priv =3D data;
=20
-	return gpiod_get_value_cansleep(priv->scl);
+	return gpiod_get_value_cansleep(priv->scl->gpio);
+}
+
+static void i2c_gpio_lock_bus(struct i2c_adapter *adap, unsigned int flag=
s)
+{
+	/* Take care about adapter lock. See i2c_adapter_lock_bus() and others. =
*/
+	rt_mutex_lock_nested(&adap->bus_lock, i2c_adapter_depth(adap));
+	rt_mutex_lock(&adap_to_priv(adap)->scl->lock);
+}
+
+static int i2c_gpio_trylock_bus(struct i2c_adapter *adap, unsigned int fl=
ags)
+{
+	if (!rt_mutex_trylock(&adap->bus_lock))
+		return 0;
+
+	if (!rt_mutex_trylock(&adap_to_priv(adap)->scl->lock)) {
+		rt_mutex_unlock(&adap->bus_lock);
+		return 0;
+	}
+
+	return 1;
+}
+
+static void i2c_gpio_unlock_bus(struct i2c_adapter *adap, unsigned int fl=
ags)
+{
+	rt_mutex_unlock(&adap_to_priv(adap)->scl->lock);
+	rt_mutex_unlock(&adap->bus_lock);
 }
=20
+static const struct i2c_lock_operations i2c_gpio_lock_ops =3D {
+	.lock_bus =3D i2c_gpio_lock_bus,
+	.trylock_bus =3D i2c_gpio_trylock_bus,
+	.unlock_bus =3D i2c_gpio_unlock_bus,
+};
+
 #ifdef CONFIG_I2C_GPIO_FAULT_INJECTOR
=20
 #define setsda(bd, val)	((bd)->setsda((bd)->data, val))
@@ -165,14 +216,14 @@ DEFINE_DEBUGFS_ATTRIBUTE(fops_incomplete_write_byte,=
 NULL, fops_incomplete_write
 static int i2c_gpio_fi_act_on_scl_irq(struct i2c_gpio_private_data *priv,
 				       irqreturn_t handler(int, void*))
 {
-	int ret, irq =3D gpiod_to_irq(priv->scl);
+	int ret, irq =3D gpiod_to_irq(priv->scl->gpio);
=20
 	if (irq < 0)
 		return irq;
=20
 	i2c_lock_bus(&priv->adap, I2C_LOCK_ROOT_ADAPTER);
=20
-	ret =3D gpiod_direction_input(priv->scl);
+	ret =3D gpiod_direction_input(priv->scl->gpio);
 	if (ret)
 		goto unlock;
=20
@@ -187,7 +238,7 @@ static int i2c_gpio_fi_act_on_scl_irq(struct i2c_gpio_=
private_data *priv,
=20
 	free_irq(irq, priv);
  output:
-	ret =3D gpiod_direction_output(priv->scl, 1) ?: ret;
+	ret =3D gpiod_direction_output(priv->scl->gpio, 1) ?: ret;
  unlock:
 	i2c_unlock_bus(&priv->adap, I2C_LOCK_ROOT_ADAPTER);
=20
@@ -308,13 +359,17 @@ static struct gpio_desc *i2c_gpio_get_desc(struct de=
vice *dev,
 	struct gpio_desc *retdesc;
 	int ret;
=20
-	retdesc =3D devm_gpiod_get(dev, con_id, gflags);
+	/*
+	 * Don't use resource-managed functions. SCL may be shared across adapte=
rs and has
+	 * its own lifetime management. SDA uses the same path for consistency.
+	 */
+	retdesc =3D gpiod_get(dev, con_id, gflags);
 	if (!IS_ERR(retdesc)) {
 		dev_dbg(dev, "got GPIO from name %s\n", con_id);
 		return retdesc;
 	}
=20
-	retdesc =3D devm_gpiod_get_index(dev, NULL, index, gflags);
+	retdesc =3D gpiod_get_index(dev, NULL, index, gflags);
 	if (!IS_ERR(retdesc)) {
 		dev_dbg(dev, "got GPIO from index %u\n", index);
 		return retdesc;
@@ -336,6 +391,118 @@ static struct gpio_desc *i2c_gpio_get_desc(struct de=
vice *dev,
 	return retdesc;
 }
=20
+static struct i2c_gpio_scl_data *i2c_gpio_create_scl(struct fwnode_handle=
 *fwnode)
+{
+	struct fwnode_reference_args args;
+	struct i2c_gpio_scl_data *scl;
+	int ret;
+
+	ret =3D fwnode_property_get_reference_args(fwnode, "scl-gpios",
+						 "#gpio-cells", 0, 0, &args);
+	if (ret)
+		/* try the ancient way */
+		ret =3D fwnode_property_get_reference_args(fwnode, "gpios",
+							 "#gpio-cells", 0, 1, &args);
+	if (ret)
+		return ERR_PTR(ret);
+
+	if (args.nargs < 1) {
+		fwnode_handle_put(args.fwnode);
+		return ERR_PTR(-EINVAL);
+	}
+
+	scl =3D kzalloc(sizeof(*scl), GFP_KERNEL);
+	if (!scl) {
+		fwnode_handle_put(args.fwnode);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	/* The unique identification from the SCL GPIO reference in the device t=
ree */
+	scl->fw_node =3D args.fwnode;
+	scl->fw_pin =3D args.args[0];
+	scl->fw_flags =3D (args.nargs >=3D 2) ? args.args[1] : 0;
+
+	rt_mutex_init(&scl->lock);
+	lockdep_set_class(&scl->lock.rtmutex, &i2c_gpio_scl_lock_key);
+	refcount_set(&scl->ref, 1);
+
+	return scl;
+}
+
+static void i2c_gpio_free_scl(struct i2c_gpio_scl_data *scl)
+{
+	fwnode_handle_put(scl->fw_node);
+	kfree(scl);
+}
+
+static bool i2c_gpio_scl_matches(struct i2c_gpio_scl_data *a, struct i2c_=
gpio_scl_data *b)
+{
+    return a->fw_node =3D=3D b->fw_node && a->fw_pin =3D=3D b->fw_pin && =
a->fw_flags =3D=3D b->fw_flags;
+}
+
+/*
+ * Look up an existing or create a new shared SCL structure described by =
the device's fwnode.
+ * Optimistic setup sequence always creates and tries to add a new entry =
to the list. This uses
+ * minimum locking and afterwards requests the GPIO without a lock held. =
Concurrent probes for
+ * the same SCL pin see the entry and do not race into a second gpiod_get=
(). Until everything
+ * is setup they terminate with -EPROBE_DEFER.
+ */
+static struct i2c_gpio_scl_data *i2c_gpio_lookup_scl(struct device *dev, =
enum gpiod_flags gflags)
+{
+	struct i2c_gpio_scl_data *scl, *new_scl;
+	struct gpio_desc *gpio;
+
+	new_scl =3D i2c_gpio_create_scl(dev_fwnode(dev));
+	if (IS_ERR(new_scl))
+		return new_scl;
+
+	scoped_guard(mutex, &i2c_gpio_scl_list_lock) {
+		list_for_each_entry(scl, &i2c_gpio_scl_list, list) {
+			if (!i2c_gpio_scl_matches(scl, new_scl))
+				continue;
+
+			i2c_gpio_free_scl(new_scl);
+			if (!scl->gpio)
+				return ERR_PTR(-EPROBE_DEFER);
+
+			refcount_inc(&scl->ref);
+			dev_dbg(dev, "reusing shared SCL (%pfwP, pin %u)\n",
+				scl->fw_node, scl->fw_pin);
+
+			return scl;
+		}
+		list_add(&new_scl->list, &i2c_gpio_scl_list);
+	}
+
+	gpio =3D i2c_gpio_get_desc(dev, "scl", 1, gflags);
+	if (IS_ERR(gpio)) {
+		scoped_guard(mutex, &i2c_gpio_scl_list_lock)
+			list_del(&new_scl->list);
+		i2c_gpio_free_scl(new_scl);
+
+		return ERR_CAST(gpio);
+	}
+
+	scoped_guard(mutex, &i2c_gpio_scl_list_lock)
+		new_scl->gpio =3D gpio;
+
+	dev_dbg(dev, "registered shared SCL (%pfwP, pin %u)\n",
+		new_scl->fw_node, new_scl->fw_pin);
+
+	return new_scl;
+}
+
+static void i2c_gpio_cleanup_scl(struct i2c_gpio_scl_data *scl)
+{
+	if (!refcount_dec_and_mutex_lock(&scl->ref, &i2c_gpio_scl_list_lock))
+		return;
+
+	list_del(&scl->list);
+	mutex_unlock(&i2c_gpio_scl_list_lock);
+	gpiod_put(scl->gpio);
+	i2c_gpio_free_scl(scl);
+}
+
 static int i2c_gpio_probe(struct platform_device *pdev)
 {
 	struct i2c_gpio_private_data *priv;
@@ -386,11 +553,13 @@ static int i2c_gpio_probe(struct platform_device *pd=
ev)
 		gflags =3D GPIOD_OUT_HIGH;
 	else
 		gflags =3D GPIOD_OUT_HIGH_OPEN_DRAIN;
-	priv->scl =3D i2c_gpio_get_desc(dev, "scl", 1, gflags);
-	if (IS_ERR(priv->scl))
-		return PTR_ERR(priv->scl);
+	priv->scl =3D i2c_gpio_lookup_scl(dev, gflags);
+	if (IS_ERR(priv->scl)) {
+		ret =3D PTR_ERR(priv->scl);
+		goto err_cleanup_sda;
+	}
=20
-	if (gpiod_cansleep(priv->sda) || gpiod_cansleep(priv->scl))
+	if (gpiod_cansleep(priv->sda) || gpiod_cansleep(priv->scl->gpio))
 		dev_warn(dev, "Slow GPIO pins might wreak havoc into I2C/SMBus bus timi=
ng");
 	else
 		bit_data->can_do_atomic =3D true;
@@ -423,6 +592,8 @@ static int i2c_gpio_probe(struct platform_device *pdev=
)
 	else
 		snprintf(adap->name, sizeof(adap->name), "i2c-gpio%d", pdev->id);
=20
+	/* Always use shared SCL aware locking */
+	adap->lock_ops =3D &i2c_gpio_lock_ops;
 	adap->algo_data =3D bit_data;
 	adap->class =3D I2C_CLASS_HWMON;
 	adap->dev.parent =3D dev;
@@ -431,7 +602,7 @@ static int i2c_gpio_probe(struct platform_device *pdev=
)
 	adap->nr =3D pdev->id;
 	ret =3D i2c_bit_add_numbered_bus(adap);
 	if (ret)
-		return ret;
+		goto err_cleanup_scl;
=20
 	platform_set_drvdata(pdev, priv);
=20
@@ -441,13 +612,20 @@ static int i2c_gpio_probe(struct platform_device *pd=
ev)
 	 * from the descriptor, then provide that instead.
 	 */
 	dev_info(dev, "using lines %u (SDA) and %u (SCL%s)\n",
-		 desc_to_gpio(priv->sda), desc_to_gpio(priv->scl),
+		 desc_to_gpio(priv->sda), desc_to_gpio(priv->scl->gpio),
 		 pdata->scl_is_output_only
 		 ? ", no clock stretching" : "");
=20
 	i2c_gpio_fault_injector_init(pdev);
=20
 	return 0;
+
+err_cleanup_scl:
+	i2c_gpio_cleanup_scl(priv->scl);
+err_cleanup_sda:
+	gpiod_put(priv->sda);
+
+	return ret;
 }
=20
 static void i2c_gpio_remove(struct platform_device *pdev)
@@ -459,6 +637,8 @@ static void i2c_gpio_remove(struct platform_device *pd=
ev)
 	adap =3D &priv->adap;
=20
 	i2c_del_adapter(adap);
+	i2c_gpio_cleanup_scl(priv->scl);
+	gpiod_put(priv->sda);
 }
=20
 static const struct of_device_id i2c_gpio_dt_ids[] =3D {
=2D-=20
2.54.0


