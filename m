Return-Path: <linux-gpio+bounces-37218-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOCGNhH8DWru5AUAu9opvQ
	(envelope-from <linux-gpio+bounces-37218-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 20:23:13 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2962A595F73
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 20:23:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8098C367707C
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 17:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31D6E34F462;
	Wed, 20 May 2026 17:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b="uA8ZhrWG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796E3369D7E;
	Wed, 20 May 2026 17:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779298304; cv=none; b=CJ6BAufSkM1cKJK04uxkoDFIqyI7mmaFX5A3tLnI60c4VGKS4HLyKARbIKvzhtYK/JDz1uXzoUfPUkBsgrpMXKOXw0dOpTPsSGJqIZOcB31hDlmy6CrOIUZL70HSQTe5gGlN0M0mX8fmVlTsKdmKvY+vFCjYLN6GQALReWe9szE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779298304; c=relaxed/simple;
	bh=xPNgqFCLdN4/EkWlgE9sLXjUE2wjCJJ3cZkJaBIc7k4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QSpdLNFMVa0ki3DPrY8sVy3l6TkmTSUSnmO4r8PjyfAXXDWkrsTHNFJw5lR4UcqFQHIv2qCNHtlZPN0LDu6lLTUbPzEn8EoYF+aecv47IElaTXMpiLhYjmsZTCsGVAwpbPsijZtvCMb4vc5jRpVPKYImIT0FGCWUYZFH4KMch78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b=uA8ZhrWG; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1779298299; x=1779903099;
	i=markus.stockhausen@gmx.de;
	bh=kTFaRK/15LaAa7YCjeiatUAeQ4GffRm2XlaqlOWZlu8=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=uA8ZhrWGK8jgbOH5I31a1gs9d25bnxBr4Vk/DcfcxQJCttQQy+TFiwKym+fq/u3m
	 zZsk5qHgQE3XmZoDdyHGpi/t5vJ/RUb986DO+GdKZv9fA+PZL61iDg0FmYKoBoOf0
	 fOQNJAPFUZ1UjL+vW6BA+mioeAHZGsU5eGS1aOq+nZb2bgdMsu2c5df2+3od7t65t
	 kUVVam13ZCumiDMzVmXWm8waqKOvqk+Ci8UceL+qj3ehjXxla0GcsoKxYW8btGTIB
	 aOfcRDdk8LA4Uv9mVGVrXaA1IBrs7ZFNsH2SH5nt/zxTXy6O+DYWLZXFrWh+nywPS
	 bCA22P9CDJ48AWw56Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MUGeB-1wqJtQ2hNr-00Xmor; Wed, 20
 May 2026 19:31:39 +0200
From: Markus Stockhausen <markus.stockhausen@gmx.de>
To: wsa+renesas@sang-engineering.com,
	andi.shyti@kernel.org,
	linusw@kernel.org,
	brgl@kernel.org,
	linux-i2c@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Markus Stockhausen <markus.stockhausen@gmx.de>
Subject: [PATCH v3] i2c: i2c-gpio: Enhance driver for buses with shared SCL
Date: Wed, 20 May 2026 19:31:29 +0200
Message-ID: <20260520173129.1382489-1-markus.stockhausen@gmx.de>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4NYIZYU6/upX+5N262y+VvkWmca8VLVrSjL3UKS/ytZE8DfUIJM
 yHTCeCOUPBOrrKrZnE6Jg4fgneOBriWhcrmVLiuW4RPCLGWtckUh0aWBiMjHqfLDDpZwp6d
 xVIfnRP2jLzUSrO5vTlJkcDkWJVg+LxOliYc30tG6cv77I/JLV2awB9ZMmcFW3OtuEzACjU
 EGICDYwqd2uNKGusfHkfQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:3BqYxSH7gTM=;Stxm7W786UjS6sKtwudPhD3BFcW
 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
 oFyJQpihdpKx8baSEQ=
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmx.de];
	TAGGED_FROM(0.00)[bounces-37218-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[markus.stockhausen@gmx.de,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmx.de:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	RCPT_COUNT_SEVEN(0.00)[7];
	FREEMAIL_FROM(0.00)[gmx.de];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,gmx.de:email,gmx.de:mid,gmx.de:dkim]
X-Rspamd-Queue-Id: 2962A595F73
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

v2 -> v3
  - Fix lockdep_set_class() with DEBUG_LOCK_ALLOC=3Dy
v2: https://lore.kernel.org/linux-i2c/20260518161013.900504-1-markus.stock=
hausen@gmx.de/

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
  - Tested with config option GPIO_SHARED/GPIO_SHARED_PROXY
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
index f4355b17bfbf..80e1347ecbac 100644
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
+	lockdep_set_class(&scl->lock, &i2c_gpio_scl_lock_key);
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


