Return-Path: <linux-gpio+bounces-36815-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIn0AAWUBWoxYwIAu9opvQ
	(envelope-from <linux-gpio+bounces-36815-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 11:21:09 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD5C53FB66
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 11:21:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2EB73010D99
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 09:21:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09CD539A06B;
	Thu, 14 May 2026 09:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b="AKoyxI5Q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8327439890A;
	Thu, 14 May 2026 09:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778750465; cv=none; b=UVFcosLXd2BfdXYo5Tz633A8COia0IUgb7Z8ue6r1psvYqYaDcQ0S6F7NKkEKYOH8tXt5BHlUKvHWP+qPDZHroee74htCgaQ+j2vJySftJx+6/G5sp6nm7vXj9nzUhMTamCnwXPsEOITNXnSHGgDs0JMz1XI7nk7F7BGFl9ktGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778750465; c=relaxed/simple;
	bh=uBh/NNogO30KmRTygnGrY6oHOWqkrxf7JW441RWz28w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DP8lQcWw8L3jYq+FYyZ/iScx37iL+cHnV0PVSKeBodcIwTX9J8pDgk7uvt6L6DDiM9PyCxwH6hlntv7Bp3p/zCiVZ2rDhtSFxKw+kp7r6CVBQH1FI3jLPUfcFuj5PweD57BN47dbNOiE9B+xYZwyg8cHWDx5ersVJ/K8r/eFFPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b=AKoyxI5Q; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1778750457; x=1779355257;
	i=markus.stockhausen@gmx.de;
	bh=9NWPnRZ+CInnZ8/u0YCsZNvfP/I6Vwonrd6jmkfbJg4=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=AKoyxI5Q4a/YmXmkQWf7FEnMFvlPyPUU9cq0hB87toj5nScVSs53RWuziN0koZL3
	 VzME5ITvLfW7gGtVk4PI5f5k+a6XHTI/k6DsUX1vgpmV3eIlZIRC9Co6i0xwY12Gz
	 1oTSyb8hMpozHB7XNwxOMdME1NV1V7lCycHttYlB73o1nd+2UdDQtfrzBVos+gzDz
	 tUAirb+LasaY2Oi/QRaEVxXho3Kh4fT6P0JHNNlKKhCq92tG9kJqGF43F6R1cnpKO
	 pkUmp4w0I3TrLmQ8VjoUNuO9wP4vTo7/gng54hDhzz7++o6xTl4u5caovPeiy4/rU
	 QDow+0sksTxZ24J9fA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MplXp-1xAZEK1Chh-00a5fB; Thu, 14
 May 2026 11:20:57 +0200
From: Markus Stockhausen <markus.stockhausen@gmx.de>
To: wsa+renesas@sang-engineering.com,
	andi.shyti@kernel.org,
	linusw@kernel.org,
	brgl@kernel.org,
	linux-i2c@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Markus Stockhausen <markus.stockhausen@gmx.de>
Subject: [RFC PATCH] i2c: i2c-gpio Enhance driver for buses with shared SCL
Date: Thu, 14 May 2026 11:20:42 +0200
Message-ID: <20260514092042.3265986-1-markus.stockhausen@gmx.de>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:DgHsHFRSb9tM3bWmZoTMj4L2lt1t0R9FnfWWMg1Pqt/K6q6kMGB
 aUKbdsP1hMHuXYD32xRU+eZ+trAP+XrQvaDgUzdTKq59ZjIRZ6MGNKAZyHsC78awt/osBIK
 3RuEYk7wYeMqC3H5wGDLP0NOIypEUoXvKr+Q/qO5mfmc48jlSJGlxhxTeJzOnlyTpw9t4aD
 2G/1fjjDvwhJ6G6v2QbdA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:6ORuD1F5/IA=;AOnK2KSxhEjoWjyRvXLbHfsgVsX
 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
 58WiXWLRKh7/U/VqWtTymqLnbCk=
X-Rspamd-Queue-Id: 5BD5C53FB66
X-Rspamd-Server: lfdr
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
	FREEMAIL_CC(0.00)[gmx.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36815-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmx.de];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[markus.stockhausen@gmx.de,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmx.de:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

Preface: I'm neither an I2C nor a GPIO expert. Instead of writing
a minimalistic driver for a special use case I was asked to enhance
an existing one. That might have many use cases I'm not aware of.
Feedback with clear directions is appreciated.

Some lower end hardware (especially Realtek based switches) are
designed with multiple I2C busses that share a single clock line.
E.g. the D-Link DGS-1250-28X realizes 4 I2C SFP busses with 5 gpios.

Enhance the i2c-gpio driver so it can handle such hardware designs.

- Detect GPIOs that are used by multiple I2C busses in the dts
  by using a unique identifier for each managed SCL.

- The first probing instance allocates and requests the shared SCL
  GPIO plus an associated mutex. Subsequent instances detect the
  existing entry via the unique ID and increment a reference count
  to reuse the descriptor.

- All data transfers are synchronized with the mutex before and
  after transmission.

Signed-off-by: Markus Stockhausen <markus.stockhausen@gmx.de>

=2D--

v0 -> v1
 - Initially this enhancement was submitted as a new driver with
   a new devicetree structure. After some discussion Wolfram
   advised to make only an enhancement to the i2c-gpio driver.
v0: https://lore.kernel.org/linux-i2c/20260511162528.84508-1-markus.stockh=
ausen@gmx.de/
=2D--
 drivers/i2c/busses/i2c-gpio.c | 161 ++++++++++++++++++++++++++++++++--
 1 file changed, 153 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpio.c
index f4355b17bfbf..cdf863af2f1a 100644
=2D-- a/drivers/i2c/busses/i2c-gpio.c
+++ b/drivers/i2c/busses/i2c-gpio.c
@@ -18,9 +18,23 @@
 #include <linux/property.h>
 #include <linux/slab.h>
=20
+static LIST_HEAD(i2c_gpio_scl_list);
+static DEFINE_MUTEX(i2c_gpio_scl_list_lock);
+
+struct i2c_gpio_scl_data {
+	struct fwnode_handle *fw_node;
+	u32 fw_pin;
+	u32 fw_flags;
+	struct gpio_desc *gpio;
+	struct mutex lock;
+	refcount_t ref;
+	struct list_head list;
+	bool valid;
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
@@ -67,7 +86,17 @@ static int i2c_gpio_getscl(void *data)
 {
 	struct i2c_gpio_private_data *priv =3D data;
=20
-	return gpiod_get_value_cansleep(priv->scl);
+	return gpiod_get_value_cansleep(priv->scl->gpio);
+}
+
+static int i2c_gpio_pre_xfer(struct i2c_adapter *adap)
+{
+	return mutex_lock_interruptible(&adap_to_priv(adap)->scl->lock);
+}
+
+static void i2c_gpio_post_xfer(struct i2c_adapter *adap)
+{
+	mutex_unlock(&adap_to_priv(adap)->scl->lock);
 }
=20
 #ifdef CONFIG_I2C_GPIO_FAULT_INJECTOR
@@ -308,13 +337,14 @@ static struct gpio_desc *i2c_gpio_get_desc(struct de=
vice *dev,
 	struct gpio_desc *retdesc;
 	int ret;
=20
-	retdesc =3D devm_gpiod_get(dev, con_id, gflags);
+	/* Don't use resource-managed functions because of shared SCL */
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
@@ -336,6 +366,117 @@ static struct gpio_desc *i2c_gpio_get_desc(struct de=
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
+	if (args.nargs < 2) {
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
+	scl->fw_flags =3D args.args[1];
+
+	mutex_init(&scl->lock);
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
+/*
+ * Look up an existing or create a new shared SCL structure described by =
the device's fwnode.
+ * If it exists, reuse it. Otherwise a new entry is allocated and the GPI=
O is requested.
+ *
+ * Memory allocation and gpiod_get() might sleep and must not run under a=
 lock. To work around
+ * this, always create and add the entry to the list before requesting th=
e GPIO. So concurrent
+ * probes for the same SCL pin see the entry and do not race into a secon=
d gpiod_get() for the
+ * same pin. The entry is marked valid only after the GPIO is successfull=
y acquired. Until then,
+ * other consumers get -EPROBE_DEFER.
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
+			if (scl->fw_node =3D=3D new_scl->fw_node &&
+			    scl->fw_pin =3D=3D new_scl->fw_pin &&
+			    scl->fw_flags =3D=3D new_scl->fw_flags) {
+				i2c_gpio_free_scl(new_scl);
+				if (!scl->valid)
+					return ERR_PTR(-EPROBE_DEFER);
+
+				refcount_inc(&scl->ref);
+				dev_info(dev, "reusing shared SCL (%pfwP, pin %u)\n",
+					scl->fw_node, scl->fw_pin);
+
+				return scl;
+			}
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
+	new_scl->gpio =3D gpio;
+	scoped_guard(mutex, &i2c_gpio_scl_list_lock)
+		new_scl->valid =3D true;
+
+	dev_info(dev, "registered shared SCL (%pfwP, pin %u)\n",
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
@@ -386,15 +527,17 @@ static int i2c_gpio_probe(struct platform_device *pd=
ev)
 		gflags =3D GPIOD_OUT_HIGH;
 	else
 		gflags =3D GPIOD_OUT_HIGH_OPEN_DRAIN;
-	priv->scl =3D i2c_gpio_get_desc(dev, "scl", 1, gflags);
+	priv->scl =3D i2c_gpio_lookup_scl(dev, gflags);
 	if (IS_ERR(priv->scl))
 		return PTR_ERR(priv->scl);
=20
-	if (gpiod_cansleep(priv->sda) || gpiod_cansleep(priv->scl))
+	if (gpiod_cansleep(priv->sda) || gpiod_cansleep(priv->scl->gpio))
 		dev_warn(dev, "Slow GPIO pins might wreak havoc into I2C/SMBus bus timi=
ng");
 	else
 		bit_data->can_do_atomic =3D true;
=20
+	bit_data->pre_xfer =3D i2c_gpio_pre_xfer;
+	bit_data->post_xfer =3D i2c_gpio_post_xfer;
 	bit_data->setsda =3D i2c_gpio_setsda_val;
 	bit_data->setscl =3D i2c_gpio_setscl_val;
=20
@@ -441,7 +584,7 @@ static int i2c_gpio_probe(struct platform_device *pdev=
)
 	 * from the descriptor, then provide that instead.
 	 */
 	dev_info(dev, "using lines %u (SDA) and %u (SCL%s)\n",
-		 desc_to_gpio(priv->sda), desc_to_gpio(priv->scl),
+		 desc_to_gpio(priv->sda), desc_to_gpio(priv->scl->gpio),
 		 pdata->scl_is_output_only
 		 ? ", no clock stretching" : "");
=20
@@ -459,6 +602,8 @@ static void i2c_gpio_remove(struct platform_device *pd=
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


