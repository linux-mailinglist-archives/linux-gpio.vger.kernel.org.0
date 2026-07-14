Return-Path: <linux-gpio+bounces-40074-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id D/5PBAZkVmqf4gAAu9opvQ
	(envelope-from <linux-gpio+bounces-40074-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 18:29:58 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 89984756F03
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 18:29:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmx.de header.s=s31663417 header.b=tQCE1P6b;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40074-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40074-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=gmx.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6A4123021D06
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 16:29:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C52774ADDAE;
	Tue, 14 Jul 2026 16:29:38 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD6B47D94A;
	Tue, 14 Jul 2026 16:29:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784046578; cv=none; b=CTjL+RediT25dW7myofd8tcCUGiqJwLWprKKvbPOvaBhuep+5KAIn5fxqTs5Z+JAEuHu2UhC6RhtLUoJbdXiHwXUPFvuRPgXi68TppuDHyhe8EdeD6LW2wn3hkHiyiUWzNvJLXdBbvSAx1S/I71sOvpFqUqMqEHMkgF5lSJJwwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784046578; c=relaxed/simple;
	bh=4v1YMpRit8GH3qbvq52m95bX+PxFAa3YFhfbLUPh+vA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G5i8bNomvS2IBRlPBtX07NSfu7FMP99fWsRSGbtMqtymcnkE/BLoR9KKAjj2lNY5euZ6oFXe4lzeX586XKyy/GnfBYMBF6w4pZleNEPRArO2w1bMXOQqT31AHNLs3I8Ikm8uj3XtXHicyQeKkn7tH0XuUUYo1P1UdC1EXzg4xIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b=tQCE1P6b; arc=none smtp.client-ip=212.227.17.20
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1784046566; x=1784651366;
	i=markus.stockhausen@gmx.de;
	bh=4Ha79UoYaoArlIUEbgYYF69nXKwtg+vNm5NjC6lX/jA=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=tQCE1P6bBIfz8vEUM7+SYGYyOaApgVLKJF+T5Y2Cr5V2hizDD3X7fLcENMF0xZHf
	 k/1CW8BqPMJexAqaoPtukvG2W7b414ohchOkBoqoEG/5e/lov46O7IIOfeX05yiib
	 gs2AFYkGtU3bjRXm4KCwfPoy75OSOhc5ngApmKDkAisijCtacJ2AKp1trZFeJ/Ktt
	 m7UI3pY6Hp6Ryl8fAWINw88jP+hvrwEj5GLgzSMr3t/XrnMomwoudTofFo0As6Wk2
	 1BWAxNph1vCQid3Sk7LvhQ3z55ibzlThFoHPEYow2/dhtBOZ75lzV7cdhjoAeTpA0
	 fAR9GIRrKf9g48gxCQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MK3Rm-1wSZMe33M6-00IEg1; Tue, 14
 Jul 2026 18:29:26 +0200
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
Subject: [PATCH v7 2/2] i2c: i2c-gpio: Enhance driver for buses with shared SCL
Date: Tue, 14 Jul 2026 18:29:15 +0200
Message-ID: <20260714162915.3018703-3-markus.stockhausen@gmx.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260714162915.3018703-1-markus.stockhausen@gmx.de>
References: <20260714162915.3018703-1-markus.stockhausen@gmx.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4YIXCES+NUyrkU12pyc3FxP6jCs3+BeJ9nX1TLKtA19B4odNGaz
 iv46ZvbKeCaTrdC69mPYDA5T75uOndh1I3jjFeb6X8NBX7KrlGbLKvYUbECTMVQmOzBgQY/
 5EZLbjhBjJhLShE1VNkGgdk/hO11BoClfgVJ4RDTXtMiCIg7qc1BA9cK/UBePRbJQKukkz0
 UlJPPJyg7LvQEeayTK9xA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:LbuKIICjqW8=;drczyibUe/h5/OSE/ltusH92JUS
 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
 DX0hko/1xy12
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-40074-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gmx.de:from_mime,gmx.de:mid,gmx.de:email,gmx.de:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,sang-engineering.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 89984756F03

Some lower end hardware (especially Realtek based switches) are
designed with multiple I2C buses that share a single clock line.
E.g. the D-Link DGS-1250-28X realizes 4 I2C SFP busses with 5 GPIOs.

Enhance the i2c-gpio driver so it can handle such hardware designs.

- Detect shared SCL GPIOs that are used by multiple I2C buses in the
  devicetree by using a "unique identifier". This is basically the
  phandle and all additional cells.

- The first probing instance allocates and requests the shared SCL
  GPIO with an associated rt_mutex. Subsequent instances detect the
  existing entry via the identifier and increment a reference count
  to reuse the descriptor.

- All data transfers are serialized via custom lock_ops that handle
  both the standard adapter bus lock and the shared SCL mutex. This
  ensures mutual exclusion across adapters sharing the clock line.

- This shared SCL detection works only for dts based systems where
  the GPIO node has at least one cell (usually the pin). GPIOs in
  legacy systems without devicetree will be handled individudally
  as before.

This patch was successfully tested on Linksys LGS310C that has two
SFP slots with two GPIO based I2C buses that share a single SCL.
Test environment: OpenWrt snapshot ported to kernel 6.19.14
including CONFIG_GPIO_SHARED=3Dy and CONFIG_GPIO_SHARED_PROXY=3Dy.

Signed-off-by: Markus Stockhausen <markus.stockhausen@gmx.de>
Tested-by: Sander Vanheule <sander@svanheule.net>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
=2D--
 drivers/i2c/busses/i2c-gpio.c | 223 +++++++++++++++++++++++++++++++---
 1 file changed, 209 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpio.c
index f4355b17bfbf..b7521b7ece37 100644
=2D-- a/drivers/i2c/busses/i2c-gpio.c
+++ b/drivers/i2c/busses/i2c-gpio.c
@@ -18,9 +18,21 @@
 #include <linux/property.h>
 #include <linux/slab.h>
=20
+static LIST_HEAD(i2c_gpio_scl_list);
+static DEFINE_MUTEX(i2c_gpio_scl_list_lock);
+static struct lock_class_key i2c_gpio_scl_lock_key;
+
+struct i2c_gpio_scl_data {
+	struct fwnode_reference_args args;
+	struct gpio_desc *gpio;
+	struct rt_mutex lock;
+	struct list_head list;
+	refcount_t ref;
+};
+
 struct i2c_gpio_private_data {
 	struct gpio_desc *sda;
-	struct gpio_desc *scl;
+	struct i2c_gpio_scl_data *scl;
 	struct i2c_adapter adap;
 	struct i2c_algo_bit_data bit_data;
 	struct i2c_gpio_platform_data pdata;
@@ -31,6 +43,11 @@ struct i2c_gpio_private_data {
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
@@ -53,7 +70,7 @@ static void i2c_gpio_setscl_val(void *data, int state)
 {
 	struct i2c_gpio_private_data *priv =3D data;
=20
-	gpiod_set_value_cansleep(priv->scl, state);
+	gpiod_set_value_cansleep(priv->scl->gpio, state);
 }
=20
 static int i2c_gpio_getsda(void *data)
@@ -67,9 +84,41 @@ static int i2c_gpio_getscl(void *data)
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
 }
=20
+static void i2c_gpio_unlock_bus(struct i2c_adapter *adap, unsigned int fl=
ags)
+{
+	rt_mutex_unlock(&adap_to_priv(adap)->scl->lock);
+	rt_mutex_unlock(&adap->bus_lock);
+}
+
+static const struct i2c_lock_operations i2c_gpio_lock_ops =3D {
+	.lock_bus =3D i2c_gpio_lock_bus,
+	.trylock_bus =3D i2c_gpio_trylock_bus,
+	.unlock_bus =3D i2c_gpio_unlock_bus,
+};
+
 #ifdef CONFIG_I2C_GPIO_FAULT_INJECTOR
=20
 #define setsda(bd, val)	((bd)->setsda((bd)->data, val))
@@ -165,14 +214,14 @@ DEFINE_DEBUGFS_ATTRIBUTE(fops_incomplete_write_byte,=
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
@@ -187,7 +236,7 @@ static int i2c_gpio_fi_act_on_scl_irq(struct i2c_gpio_=
private_data *priv,
=20
 	free_irq(irq, priv);
  output:
-	ret =3D gpiod_direction_output(priv->scl, 1) ?: ret;
+	ret =3D gpiod_direction_output(priv->scl->gpio, 1) ?: ret;
  unlock:
 	i2c_unlock_bus(&priv->adap, I2C_LOCK_ROOT_ADAPTER);
=20
@@ -308,13 +357,17 @@ static struct gpio_desc *i2c_gpio_get_desc(struct de=
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
@@ -336,6 +389,134 @@ static struct gpio_desc *i2c_gpio_get_desc(struct de=
vice *dev,
 	return retdesc;
 }
=20
+static struct i2c_gpio_scl_data *i2c_gpio_create_scl(struct device *dev)
+{
+	struct fwnode_handle *fwnode =3D dev_fwnode(dev);
+	struct fwnode_reference_args args;
+	struct i2c_gpio_scl_data *scl;
+	bool sharable =3D false;
+	int ret;
+
+	/*
+	 * SCL gpios can be shared if they are defined in the devicetree and hav=
e at least one
+	 * cell in addition to the phandle. This is usually the pin. To support =
complex designs
+	 * with arbitrary of_xlate() mappings handle the node cells opaque.
+	 */
+	if (fwnode) {
+		ret =3D fwnode_property_get_reference_args(fwnode, "scl-gpios",
+							 "#gpio-cells", 0, 0, &args);
+		if (ret)
+			/* try the ancient way */
+			ret =3D fwnode_property_get_reference_args(fwnode, "gpios",
+								 "#gpio-cells", 0, 1, &args);
+
+		if (!ret) {
+			if (args.nargs >=3D 1)
+				sharable =3D true;
+			else
+				fwnode_handle_put(args.fwnode);
+		}
+	}
+
+	scl =3D kzalloc(sizeof(*scl), GFP_KERNEL);
+	if (!scl) {
+		if (sharable)
+			fwnode_handle_put(args.fwnode);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	if (sharable) {
+		scl->args.fwnode =3D args.fwnode;
+		scl->args.nargs =3D args.nargs;
+		memcpy(scl->args.args, args.args, sizeof(args.args[0]) * args.nargs);
+	}
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
+	if (scl->args.fwnode)
+		fwnode_handle_put(scl->args.fwnode);
+	kfree(scl);
+}
+
+static bool i2c_gpio_scl_matches(struct i2c_gpio_scl_data *a, struct i2c_=
gpio_scl_data *b)
+{
+	if (!a->args.fwnode || !b->args.fwnode ||
+	    a->args.fwnode !=3D b->args.fwnode || a->args.nargs !=3D b->args.nar=
gs)
+		return false;
+
+	return memcmp(a->args.args, b->args.args, sizeof(a->args.args[0]) * a->a=
rgs.nargs) =3D=3D 0;
+}
+
+/*
+ * Look up an existing or create a new shared SCL structure. Optimistic s=
etup sequence always
+ * creates and tries to add a new entry to the list. This uses minimum lo=
cking and afterwards
+ * requests the GPIO without a lock held. Concurrent probes for the same =
SCL pin see the entry
+ * and do not race into a second gpiod_get(). Until everything is setup t=
hey terminate with
+ * -EPROBE_DEFER.
+ */
+static struct i2c_gpio_scl_data *i2c_gpio_lookup_scl(struct device *dev, =
enum gpiod_flags gflags)
+{
+	struct i2c_gpio_scl_data *scl, *new_scl;
+	struct gpio_desc *gpio;
+
+	new_scl =3D i2c_gpio_create_scl(dev);
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
+			if (scl->args.fwnode)
+				dev_dbg(dev, "reusing shared SCL (%pfwP)\n", scl->args.fwnode);
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
+	if (new_scl->args.fwnode)
+		dev_dbg(dev, "registered shared SCL (%pfwP)\n", new_scl->args.fwnode);
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
@@ -386,15 +567,18 @@ static int i2c_gpio_probe(struct platform_device *pd=
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
=20
+	bit_data->skip_bit_test =3D !!priv->scl->args.fwnode;
 	bit_data->setsda =3D i2c_gpio_setsda_val;
 	bit_data->setscl =3D i2c_gpio_setscl_val;
=20
@@ -423,6 +607,8 @@ static int i2c_gpio_probe(struct platform_device *pdev=
)
 	else
 		snprintf(adap->name, sizeof(adap->name), "i2c-gpio%d", pdev->id);
=20
+	/* Always use shared SCL aware locking */
+	adap->lock_ops =3D &i2c_gpio_lock_ops;
 	adap->algo_data =3D bit_data;
 	adap->class =3D I2C_CLASS_HWMON;
 	adap->dev.parent =3D dev;
@@ -431,7 +617,7 @@ static int i2c_gpio_probe(struct platform_device *pdev=
)
 	adap->nr =3D pdev->id;
 	ret =3D i2c_bit_add_numbered_bus(adap);
 	if (ret)
-		return ret;
+		goto err_cleanup_scl;
=20
 	platform_set_drvdata(pdev, priv);
=20
@@ -441,13 +627,20 @@ static int i2c_gpio_probe(struct platform_device *pd=
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
@@ -459,6 +652,8 @@ static void i2c_gpio_remove(struct platform_device *pd=
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


