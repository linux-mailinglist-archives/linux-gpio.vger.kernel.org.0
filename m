Return-Path: <linux-gpio+bounces-39941-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fZQZKceDVGpLmwMAu9opvQ
	(envelope-from <linux-gpio+bounces-39941-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 08:20:55 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9037477C7
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 08:20:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmx.de header.s=s31663417 header.b=CCYIdDii;
	dmarc=pass (policy=quarantine) header.from=gmx.de;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39941-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39941-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E383E3009152
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 06:20:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CCD2363083;
	Mon, 13 Jul 2026 06:20:51 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286B3361640;
	Mon, 13 Jul 2026 06:20:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783923650; cv=none; b=qr6K/wPkizI634kitKTQ0Y5N5UVbxdjZ6gA2ABdwcE5l3X6CNLJI6XAAAoDIvpUO/QmMDJShsqXr67RQhH2NANPp/ZkyF9qMVJpmbHh0sPcHX9kmztS/nYBm15mO6OfhfMek8UbjSyJLxi1xn08Kw6/8jTmCEMaqFS5/t6XlsRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783923650; c=relaxed/simple;
	bh=8fIyImL5Ok/WIrJ1vJpPb0/E/yhDO4godMHkuho8R4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Emap8FfbLxXWAkhTJ0AwyIZWZyMvZF6UsJD6RbmHizWHSTIgo4EWPjmn2LQ7CghejPXvWol0oozvxGz1JuMDmHxXpZkJiX3RUXWippIOa42PN7o0QZXoGFub/mOTFLpMDC3ks8T5sFdN9iOlr+PzT1Eeq3qU0ZsqWzSKoX7B0RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b=CCYIdDii; arc=none smtp.client-ip=212.227.17.20
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1783923635; x=1784528435;
	i=markus.stockhausen@gmx.de;
	bh=hPU9QCDTkHP/3+9M+RoLz7n57Z+K0s4vRtW+WIc7Ob0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=CCYIdDiis+nEJh8JaUsu9hWo/peXMvOvrtgfipEVN3V8ocCZo/sKPoQqDFTZuCXA
	 L0hGPyQwkcA1UPK1h969MZNQ2uZrjLMhawENpirY82o6s3WO6fk3ILYtMc3IB9h5O
	 orn3FdkbO1ZrcaofZ88qhfIG9hgrQsDkhgWi35tmEcP2XqVkXXaSEjZww07SG3ZaT
	 WiPE4wqGoda0F3z0QOFl+Ts2wO5NVnfNE/P2LMk6uM0eXPkkDZkWtWafNb8gb/dOQ
	 DVTxNY6p6+ZOHrzD0L0CU5B3QCZjGEmggT+9bNr+CGFFSUlxhmel08C2hih8yWeiK
	 TfY7QtKu7Nn/uEHL/Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M3lYB-1wjyyW2cAF-008dMh; Mon, 13
 Jul 2026 08:20:35 +0200
From: Markus Stockhausen <markus.stockhausen@gmx.de>
To: wsa+renesas@sang-engineering.com,
	andi.shyti@kernel.org,
	linusw@kernel.org,
	brgl@kernel.org,
	linux-i2c@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Markus Stockhausen <markus.stockhausen@gmx.de>,
	Sander Vanheule <sander@svanheule.net>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v5] i2c: i2c-gpio: Enhance driver for buses with shared SCL
Date: Mon, 13 Jul 2026 08:20:21 +0200
Message-ID: <20260713062021.2995641-1-markus.stockhausen@gmx.de>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:66x9z9hvagFMEjV5huOn1t6XTSHEUGwwTTQ6o+k6iA2iaOBnEYu
 1fJCsbuqpk0V94HuXdcr+dICC7omhT3jMXcbGn9Y2hr6DyJx7f4b4S38y1s/PD5hY33IzeI
 60jgg6QsT0pOqvEymg0JuJyuCb5STkSanIAFKk/GwNoWW49aZHjQtJBHeLZ3poEOrVONRzZ
 y6WQihlQRUgQvRAAciuvQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:VfPVfDlDO0I=;vjsGmoQ1VVkKBwsKZyqC3yCL5GG
 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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-39941-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmx.de,svanheule.net,oss.qualcomm.com];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[markus.stockhausen@gmx.de,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:andi.shyti@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-i2c@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:markus.stockhausen@gmx.de,m:sander@svanheule.net,m:bartosz.golaszewski@oss.qualcomm.com,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmx.de];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[markus.stockhausen@gmx.de,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmx.de:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:email,svanheule.net:email,qualcomm.com:email,vger.kernel.org:from_smtp,gmx.de:from_mime,gmx.de:email,gmx.de:mid,gmx.de:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3C9037477C7

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
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

=2D--

v4 -> v5
  - Whitespace cleanup
  - Send to LKML for Sashiko review
  - Add Reviewed-by
v4: https://lore.kernel.org/linux-i2c/20260709062534.2864521-1-markus.stoc=
khausen@gmx.de/

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
index f4355b17bfbf..14b1331f7a96 100644
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
+	return a->fw_node =3D=3D b->fw_node && a->fw_pin =3D=3D b->fw_pin && a->=
fw_flags =3D=3D b->fw_flags;
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


