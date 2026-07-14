Return-Path: <linux-gpio+bounces-40013-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3QD6MpDVVWqLuAAAu9opvQ
	(envelope-from <linux-gpio+bounces-40013-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 08:22:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0F275172F
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 08:22:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmx.de header.s=s31663417 header.b=ofqEdSz+;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40013-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40013-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=gmx.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0858C304E685
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 06:20:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1606D3B8407;
	Tue, 14 Jul 2026 06:20:46 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B6236EAAB;
	Tue, 14 Jul 2026 06:20:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784010045; cv=none; b=irOqJsZVwSkspRP2Ejp/BUF71Nc/qBceh8TWjuk51aCYlY3+zMoKxME6M9LJuasrIJ0ebCh4dmyBsKYkmqnx+XudmrSmlik5sgcIBZsUgdW9PXHFvcJQWWWmugLQhcb2uXEtUbsPZerxizmK2ZOY4YtbnkURb/YfkgFBZHzF+AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784010045; c=relaxed/simple;
	bh=daCj0cZSM6sSzIgci5/62uksScw2d2plUL3JKZJF0bs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jXvadilf0l5P3630bNaK9xIGpajU3KVN5E85r56SA8MsHtcd/WyIHegVEZ/kRvSp6ouuaE38e2Z1aAzvwxKfnRXPvJVY95wNwFThTR/7WhswMwWCUqf0xjMij2LaabIdSz4VbmMsxMaZMTrczT7Vkz7iMewGKGDGZlv5090BAkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b=ofqEdSz+; arc=none smtp.client-ip=212.227.15.19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1784010030; x=1784614830;
	i=markus.stockhausen@gmx.de;
	bh=hIzaBNTk6H06q3Wu5555R/VniBdDibtPRMuXqQ6ARd0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ofqEdSz+jufD2tmnlIJL9UrSKTPcHjIeqH53epaLJ4pOYgMb0EAOq+8LWPsy1TEO
	 CCzPnhxfFUJU6mRGQS/tDR5pU/W1zsgHFINnFWbXCfQzBK7QSLwyQSAbM/ahYPkFl
	 1nXoQZi6g2KGx9Iq4tbc3x6+hnPxn8MzzUiXin8LZetm9urGYVky31UIPZ61DyQW6
	 Oa3v4d5r7gVbb43jDnkZXRvp9pd8vqa5tV98LhxWfiPdwmxC1c0W2mmh2tfMrwt2b
	 erZFT8TvVEatul/KjFS/54N7BUtjoXkeja1LqUuvRd9mn1qQexp5a1+IuORdJiJDs
	 NHgWnILo/Y1jO46tQQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N0XCw-1wvOaf3xbA-012nJJ; Tue, 14
 Jul 2026 08:20:30 +0200
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
Subject: [PATCH v6 2/2] i2c: i2c-gpio: Enhance driver for buses with shared SCL
Date: Tue, 14 Jul 2026 08:20:18 +0200
Message-ID: <20260714062018.3009830-3-markus.stockhausen@gmx.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260714062018.3009830-1-markus.stockhausen@gmx.de>
References: <20260714062018.3009830-1-markus.stockhausen@gmx.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:gEXVHoJlbdyrk3GWzV8b54ZWbBLjQn0sVljes+2bhUcW6ZeiUk8
 JwkRmMu02K5vdWwZd4iysJo0DB/7UkoyNgUOddlOYGS0ARSc1yGRvZ7eZqaXSXbX+ExtRg0
 9IPIrPuOf/I08R7xiMcane9zfa37TnsHVxpYWyy9JEBc7Au9yeqf3V6/BQznnD4UrSKClJS
 oa90M0MWLQn1IRPUoOzuw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Sct1I8lkZwo=;T5HQRwc7NMj9pEmjg3GyiSgLIpB
 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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-40013-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,gmx.de:from_mime,gmx.de:mid,gmx.de:email,gmx.de:dkim,svanheule.net:email,sang-engineering.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3C0F275172F

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
SFP slots with two GPIO based I2C buses that share a single SCL.
Test environment: OpenWrt snapshot ported to kernel 6.19.14
including CONFIG_GPIO_SHARED=3Dy and CONFIG_GPIO_SHARED_PROXY=3Dy.

Remark: This shared SCL detection works only for dts based systems.
On legacy systems without dts each gpio pin will be handled
indidivudally (as before).

Signed-off-by: Markus Stockhausen <markus.stockhausen@gmx.de>
Tested-by: Sander Vanheule <sander@svanheule.net>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
=2D--
 drivers/i2c/busses/i2c-gpio.c | 223 +++++++++++++++++++++++++++++++---
 1 file changed, 209 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpio.c
index f4355b17bfbf..bb112f529dcd 100644
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
@@ -336,6 +391,132 @@ static struct gpio_desc *i2c_gpio_get_desc(struct de=
vice *dev,
 	return retdesc;
 }
=20
+static struct i2c_gpio_scl_data *i2c_gpio_create_scl(struct device *dev)
+{
+	struct fwnode_handle *fwnode =3D dev_fwnode(dev);
+	struct fwnode_reference_args args;
+	struct i2c_gpio_scl_data *scl;
+	int ret;
+
+	if (fwnode) {
+		ret =3D fwnode_property_get_reference_args(fwnode, "scl-gpios",
+							 "#gpio-cells", 0, 0, &args);
+		if (ret)
+			/* try the ancient way */
+			ret =3D fwnode_property_get_reference_args(fwnode, "gpios",
+								 "#gpio-cells", 0, 1, &args);
+		if (ret)
+			return ERR_PTR(ret);
+
+		if (args.nargs < 1) {
+			fwnode_handle_put(args.fwnode);
+			return ERR_PTR(-EINVAL);
+		}
+	} else {
+		/* legacy system without device tree */
+		args.fwnode =3D NULL;
+		args.args[0] =3D 0;
+		args.nargs =3D 0;
+	}
+
+	scl =3D kzalloc(sizeof(*scl), GFP_KERNEL);
+	if (!scl) {
+		fwnode_handle_put(args.fwnode);
+		return ERR_PTR(-ENOMEM);
+	}
+
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
+	if (scl->fw_node)
+		fwnode_handle_put(scl->fw_node);
+	kfree(scl);
+}
+
+static bool i2c_gpio_scl_matches(struct i2c_gpio_scl_data *a, struct i2c_=
gpio_scl_data *b)
+{
+	/* legacy systems do not support shared SCL */
+	if (!a->fw_node || !b->fw_node)
+		return false;
+
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
+			if (scl->fw_node)
+				dev_dbg(dev, "reusing shared SCL (%pfwP, pin %u)\n",
+					scl->fw_node, scl->fw_pin);
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
+	if (new_scl->fw_node)
+		dev_dbg(dev, "registered shared SCL (%pfwP, pin %u)\n",
+			new_scl->fw_node, new_scl->fw_pin);
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
+	bit_data->skip_bit_test =3D true;
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


