Return-Path: <linux-gpio+bounces-39694-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Kay3C28/T2pUcwIAu9opvQ
	(envelope-from <linux-gpio+bounces-39694-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 08:27:59 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5048972D220
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 08:27:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmx.de header.s=s31663417 header.b="YJGi0B/Q";
	dmarc=pass (policy=quarantine) header.from=gmx.de;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39694-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39694-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 76508302738C
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2026 06:26:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 508D83C4143;
	Thu,  9 Jul 2026 06:26:14 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4A43C1080;
	Thu,  9 Jul 2026 06:26:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783578370; cv=none; b=GZ2YIAxhvIXgHQ2IZx7FJ/NFP3Jget+EnPosl0V+dzr2N6TwRj/XuAE2gXsfOxamvmHAfBT0Ni8Molm/oJrKQUHgr/my/VdyjJ3acL+5r7wCskxX7ikX8dPZDQZ6HkShBC/272YaAKUvszhSal3A5O6tsWhdEHkonROSvAIC7LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783578370; c=relaxed/simple;
	bh=ceQkxG7vkxSU53AHlccNQCBH4ku6FJtaqc3V6lJn5pQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rR2IqPOrXxcULgypiA98PsNmtc8pw8zjRxGdgNEDN09ACjcEHM4x0AyR3rsC6daf/UyEje38QJqrJgppuEdW5UCRdMWTxA8W3Tq0Kq3vNzYNKwGF6OXQBTF5KIvLwDhmcdMwu6YkcccxA5+8bHamw652KB6JyUg+Ot5/jkRermo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b=YJGi0B/Q; arc=none smtp.client-ip=212.227.17.22
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1783578351; x=1784183151;
	i=markus.stockhausen@gmx.de;
	bh=BLXT/vLzNFwbqAwc21ErGeF2wQgMx1dd07mxir3Z6UE=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=YJGi0B/Qp9SMPuK8lqlBggXbi6AVRs0DmcW9FhsOWRYbmBDlGiAzu7e++MHvzwvk
	 kdRH2T8faPlQyNQbqgwrzAXuBnGMjhsVBYszE/qZzE9lPYx/jqoLAn+bQF8C5CH1F
	 VgA/2sFJ3ru1VfrlldRFIKUs5gzfpMBXkLJIWDB860LPc/x9F2448l9Bcf78XqvXU
	 0YMD1AVK+2zg0RTyhYXByESrvuAOU9c9FBdGVUEbrpjnyqvnEn1Xz2oIDMAK6jYuS
	 t5oG0mJvU9JPcRDxVOelA92et44FyhnPREhM1hhd2f7bKxIqWT37+0f1hKtcg6+7c
	 VdG1mJTTBwdylusXpA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MXGvG-1wZSqX35tm-00QyXD; Thu, 09
 Jul 2026 08:25:51 +0200
From: Markus Stockhausen <markus.stockhausen@gmx.de>
To: wsa+renesas@sang-engineering.com,
	andi.shyti@kernel.org,
	linusw@kernel.org,
	brgl@kernel.org,
	linux-i2c@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Markus Stockhausen <markus.stockhausen@gmx.de>,
	Sander Vanheule <sander@svanheule.net>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v4] i2c: i2c-gpio: Enhance driver for buses with shared SCL
Date: Thu,  9 Jul 2026 08:25:33 +0200
Message-ID: <20260709062534.2864521-1-markus.stockhausen@gmx.de>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:fYVMkdjUbO+8SHkuY6vk3rW0yj5qiLoE/bO+yoXFGF7XYyCyb6K
 00UEGy6JToOTKdnzCUMXP3xgO47VktSdytrH373xtuAhrh0IWwWgaZJ5o2Lz1yclFCUgllE
 QwTwqreDjyeQcE1IQH2afRVrK9w4TQaIyfVS5w75/4CT5tRRvbA2aBU1Ybc43LpflOkh+08
 8mc3FBAOxEY8AEOJIoCIg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:UZeBTPwstOc=;rUSt/Bg1lrZ16+6C0OhoJ5d9Qak
 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
 aAQkMG5gEMXt2/QX/g/RkliytFaG+k
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-39694-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmx.de,svanheule.net,oss.qualcomm.com];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[markus.stockhausen@gmx.de,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:andi.shyti@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-i2c@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:markus.stockhausen@gmx.de,m:sander@svanheule.net,m:bartosz.golaszewski@oss.qualcomm.com,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmx.de];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[markus.stockhausen@gmx.de,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmx.de:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,vger.kernel.org:from_smtp,gmx.de:from_mime,gmx.de:email,gmx.de:mid,gmx.de:dkim,svanheule.net:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5048972D220

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
Tested-by: Sander Vanheule <sander@svanheule.net>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

=2D--

v3 -> v4
  - add Reviewed-by and Tested-by
v3: https://lore.kernel.org/linux-i2c/20260520173129.1382489-1-markus.stoc=
khausen@gmx.de/

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


