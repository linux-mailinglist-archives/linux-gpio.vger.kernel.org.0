Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 856F031FAA4
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Feb 2021 15:28:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230501AbhBSO2A (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Feb 2021 09:28:00 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:47451 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230481AbhBSO1s (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 19 Feb 2021 09:27:48 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.nyi.internal (Postfix) with ESMTP id 6C4E65803AD;
        Fri, 19 Feb 2021 09:26:53 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 19 Feb 2021 09:26:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=96mleafxObeyM
        V6VgYLUTmuliTHcHEpbgrxi/EPFfCQ=; b=BURtAE7SB+9hIZvj1Rv5zRie1IDH2
        CGpw0mZFjI1HDj0VsmEFNzEtWSY4LOLr5X+OTgcvywF49NBDafYZ0kLqIXuhaNkd
        B6TKqFJ5chRVa3i3Dd4SNFWyM16GyScsNFBKIn4DsqJSGsl5wyxtAC6PJE0d+YRr
        Swl6MPYuEK+taVtesYhBW4VFU5Mi3cm8FltQMS3J3QIZvQfPgjIX1bSVkFsIYCxd
        DmYtCCxDspvP4m1/IcCCa7eP1Vh3/ePVQe+7tGWJnXVBXhyDyt4ZXLFzHP3/VmoW
        mz05GkasAaozrS8Z4/1/5MpaApcJXXNqA1MhnZ0N/AvMeJ/QxSYFfA6ZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=96mleafxObeyMV6VgYLUTmuliTHcHEpbgrxi/EPFfCQ=; b=wjGfPZwr
        1/YfC9PQlnUgftf+qmPPvDBJNWuiBlH2bUH89S/rWU42zG5MOOM0UKIqA9aIlu+t
        dwDqWYIUKr/De3QkMqx2e1txfVAVcth0IUss+kss3v5YA2g4qtyGffVjGtjoN+De
        CeU6f6CCGut0woamvdwjg0gcHs49HYojC0eZgxMQCdUAhXP1mJ3paoesbcx2Kg08
        n7617+nyY6HJo59sXCnDkg+LilfX849XM2s/jHwesqs0b34S7Y+EzURXBdH9aTZf
        UG7BB8r2AZg4J2c7ZWsxvIMF1rRt8cmOrUGGSxSHo+M+tmM3LNKSN3BJwe33zUjf
        Bqn2cZzGrDPj2Q==
X-ME-Sender: <xms:rMovYPiVvAgI5QAWp64FzdyTLphS3j7Tl4f27rF2PlNnL1tlVk2Xkg>
    <xme:rMovYJJnvqxfFRNVXcISyGzdutuVsNgKI6CiooPVnmcVtAxu8UNDlL5E4kLvsu0ut
    OKjAJoT6Giv-LMYww>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrjeeigdeigecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
    rdhiugdrrghuqeenucggtffrrghtthgvrhhnpeejgfdvveehteekveeggeellefgleette
    ejffelffdvudduveeiffegteelvefhteenucfkphepudegrddvrdeluddrfeejnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifse
    grjhdrihgurdgruh
X-ME-Proxy: <xmx:rMovYOGes7jGXWh8hQgtweETVbMkB6NlpxHb2UpMfFo3w4E5OIsxuQ>
    <xmx:rMovYNQT3vBvWmg6lX80ZE5yc4Lqsn8OH2frNOiIVFFldRqL8KOy4Q>
    <xmx:rMovYKcqQCvJCVIOFNZXpLMv4nZk-qvKajehZmfoTZEKl7deB9kQBg>
    <xmx:rcovYAalyIrw1H5DEcPOiu7ulLdTuk0souIeEUCIxix-JyQmKgrMaA>
Received: from localhost.localdomain (ppp14-2-91-37.adl-apt-pir-bras31.tpg.internode.on.net [14.2.91.37])
        by mail.messagingengine.com (Postfix) with ESMTPA id 70F59240062;
        Fri, 19 Feb 2021 09:26:46 -0500 (EST)
From:   Andrew Jeffery <andrew@aj.id.au>
To:     openipmi-developer@lists.sourceforge.net, openbmc@lists.ozlabs.org,
        minyard@acm.org
Cc:     robh+dt@kernel.org, joel@jms.id.au, lee.jones@linaro.org,
        avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        linus.walleij@linaro.org, chiawei_wang@aspeedtech.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-gpio@vger.kernel.org
Subject: [PATCH 10/19] ipmi: kcs_bmc: Turn the driver data-structures inside-out
Date:   Sat, 20 Feb 2021 00:55:14 +1030
Message-Id: <20210219142523.3464540-11-andrew@aj.id.au>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210219142523.3464540-1-andrew@aj.id.au>
References: <20210219142523.3464540-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Make the KCS device drivers responsible for allocating their own memory.

Until now the private data for the device driver was allocated internal
to the private data for the chardev interface. This coupling required
the slightly awkward API of passing through the struct size for the
driver private data to the chardev constructor, and then retrieving a
pointer to the driver private data from the allocated chardev memory.

In addition to being awkward, the arrangement prevents the
implementation of alternative userspace interfaces as the device driver
private data is not independent.

Peel a layer off the onion and turn the data-structures inside out by
exploiting container_of() and embedding `struct kcs_device` in the
driver private data.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/char/ipmi/kcs_bmc.c           | 15 +++++--
 drivers/char/ipmi/kcs_bmc.h           | 12 ++----
 drivers/char/ipmi/kcs_bmc_aspeed.c    | 60 ++++++++++++++++-----------
 drivers/char/ipmi/kcs_bmc_cdev_ipmi.c | 57 +++++++++++++++++--------
 drivers/char/ipmi/kcs_bmc_npcm7xx.c   | 37 ++++++++++-------
 5 files changed, 111 insertions(+), 70 deletions(-)

diff --git a/drivers/char/ipmi/kcs_bmc.c b/drivers/char/ipmi/kcs_bmc.c
index ef5c48ffe74a..709b6bdec165 100644
--- a/drivers/char/ipmi/kcs_bmc.c
+++ b/drivers/char/ipmi/kcs_bmc.c
@@ -44,12 +44,19 @@ int kcs_bmc_handle_event(struct kcs_bmc *kcs_bmc)
 }
 EXPORT_SYMBOL(kcs_bmc_handle_event);
 
-struct kcs_bmc *kcs_bmc_ipmi_alloc(struct device *dev, int sizeof_priv, u32 channel);
-struct kcs_bmc *kcs_bmc_alloc(struct device *dev, int sizeof_priv, u32 channel)
+int kcs_bmc_ipmi_attach_cdev(struct kcs_bmc *kcs_bmc);
+int kcs_bmc_add_device(struct kcs_bmc *kcs_bmc)
 {
-	return kcs_bmc_ipmi_alloc(dev, sizeof_priv, channel);
+	return kcs_bmc_ipmi_attach_cdev(kcs_bmc);
 }
-EXPORT_SYMBOL(kcs_bmc_alloc);
+EXPORT_SYMBOL(kcs_bmc_add_device);
+
+int kcs_bmc_ipmi_detach_cdev(struct kcs_bmc *kcs_bmc);
+int kcs_bmc_remove_device(struct kcs_bmc *kcs_bmc)
+{
+	return kcs_bmc_ipmi_detach_cdev(kcs_bmc);
+}
+EXPORT_SYMBOL(kcs_bmc_remove_device);
 
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Haiyue Wang <haiyue.wang@linux.intel.com>");
diff --git a/drivers/char/ipmi/kcs_bmc.h b/drivers/char/ipmi/kcs_bmc.h
index febea0c8deb4..bf0ae327997f 100644
--- a/drivers/char/ipmi/kcs_bmc.h
+++ b/drivers/char/ipmi/kcs_bmc.h
@@ -67,6 +67,8 @@ struct kcs_ioreg {
 };
 
 struct kcs_bmc {
+	struct device *dev;
+
 	spinlock_t lock;
 
 	u32 channel;
@@ -94,17 +96,11 @@ struct kcs_bmc {
 	u8 *kbuffer;
 
 	struct miscdevice miscdev;
-
-	unsigned long priv[];
 };
 
-static inline void *kcs_bmc_priv(struct kcs_bmc *kcs_bmc)
-{
-	return kcs_bmc->priv;
-}
-
 int kcs_bmc_handle_event(struct kcs_bmc *kcs_bmc);
-struct kcs_bmc *kcs_bmc_alloc(struct device *dev, int sizeof_priv, u32 channel);
+int kcs_bmc_add_device(struct kcs_bmc *kcs_bmc);
+int kcs_bmc_remove_device(struct kcs_bmc *kcs_bmc);
 
 u8 kcs_bmc_read_data(struct kcs_bmc *kcs_bmc);
 void kcs_bmc_write_data(struct kcs_bmc *kcs_bmc, u8 data);
diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bmc_aspeed.c
index 630cf095560e..0416ac78ce68 100644
--- a/drivers/char/ipmi/kcs_bmc_aspeed.c
+++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
@@ -61,6 +61,8 @@
 #define LPC_STR4             0x11C
 
 struct aspeed_kcs_bmc {
+	struct kcs_bmc kcs_bmc;
+
 	struct regmap *map;
 };
 
@@ -69,9 +71,14 @@ struct aspeed_kcs_of_ops {
 	int (*get_io_address)(struct platform_device *pdev);
 };
 
+static inline struct aspeed_kcs_bmc *to_aspeed_kcs_bmc(struct kcs_bmc *kcs_bmc)
+{
+	return container_of(kcs_bmc, struct aspeed_kcs_bmc, kcs_bmc);
+}
+
 static u8 aspeed_kcs_inb(struct kcs_bmc *kcs_bmc, u32 reg)
 {
-	struct aspeed_kcs_bmc *priv = kcs_bmc_priv(kcs_bmc);
+	struct aspeed_kcs_bmc *priv = to_aspeed_kcs_bmc(kcs_bmc);
 	u32 val = 0;
 	int rc;
 
@@ -83,7 +90,7 @@ static u8 aspeed_kcs_inb(struct kcs_bmc *kcs_bmc, u32 reg)
 
 static void aspeed_kcs_outb(struct kcs_bmc *kcs_bmc, u32 reg, u8 data)
 {
-	struct aspeed_kcs_bmc *priv = kcs_bmc_priv(kcs_bmc);
+	struct aspeed_kcs_bmc *priv = to_aspeed_kcs_bmc(kcs_bmc);
 	int rc;
 
 	rc = regmap_write(priv->map, reg, data);
@@ -92,7 +99,7 @@ static void aspeed_kcs_outb(struct kcs_bmc *kcs_bmc, u32 reg, u8 data)
 
 static void aspeed_kcs_updateb(struct kcs_bmc *kcs_bmc, u32 reg, u8 mask, u8 val)
 {
-	struct aspeed_kcs_bmc *priv = kcs_bmc_priv(kcs_bmc);
+	struct aspeed_kcs_bmc *priv = to_aspeed_kcs_bmc(kcs_bmc);
 	int rc;
 
 	rc = regmap_update_bits(priv->map, reg, mask, val);
@@ -114,7 +121,7 @@ static void aspeed_kcs_updateb(struct kcs_bmc *kcs_bmc, u32 reg, u8 mask, u8 val
  */
 static void aspeed_kcs_set_address(struct kcs_bmc *kcs_bmc, u16 addr)
 {
-	struct aspeed_kcs_bmc *priv = kcs_bmc_priv(kcs_bmc);
+	struct aspeed_kcs_bmc *priv = to_aspeed_kcs_bmc(kcs_bmc);
 
 	switch (kcs_bmc->channel) {
 	case 1:
@@ -148,7 +155,7 @@ static void aspeed_kcs_set_address(struct kcs_bmc *kcs_bmc, u16 addr)
 
 static void aspeed_kcs_enable_channel(struct kcs_bmc *kcs_bmc, bool enable)
 {
-	struct aspeed_kcs_bmc *priv = kcs_bmc_priv(kcs_bmc);
+	struct aspeed_kcs_bmc *priv = to_aspeed_kcs_bmc(kcs_bmc);
 
 	switch (kcs_bmc->channel) {
 	case 1:
@@ -323,16 +330,16 @@ static int aspeed_kcs_of_v2_get_io_address(struct platform_device *pdev)
 static int aspeed_kcs_probe(struct platform_device *pdev)
 {
 	const struct aspeed_kcs_of_ops *ops;
-	struct device *dev = &pdev->dev;
+	struct aspeed_kcs_bmc *priv;
 	struct kcs_bmc *kcs_bmc;
 	struct device_node *np;
 	int rc, channel, addr;
 
-	np = dev->of_node->parent;
+	np = pdev->dev.of_node->parent;
 	if (!of_device_is_compatible(np, "aspeed,ast2400-lpc-v2") &&
 	    !of_device_is_compatible(np, "aspeed,ast2500-lpc-v2") &&
 	    !of_device_is_compatible(np, "aspeed,ast2600-lpc-v2")) {
-		dev_err(dev, "unsupported LPC device binding\n");
+		dev_err(&pdev->dev, "unsupported LPC device binding\n");
 		return -ENODEV;
 	}
 	ops = of_device_get_match_data(&pdev->dev);
@@ -343,18 +350,27 @@ static int aspeed_kcs_probe(struct platform_device *pdev)
 	if (channel < 0)
 		return channel;
 
-	kcs_bmc = kcs_bmc_alloc(&pdev->dev, sizeof(struct aspeed_kcs_bmc), channel);
-	if (!kcs_bmc)
+	addr = ops->get_io_address(pdev);
+	if (addr < 0)
+		return addr;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
 		return -ENOMEM;
 
+	kcs_bmc = &priv->kcs_bmc;
+	kcs_bmc->dev = &pdev->dev;
+	kcs_bmc->channel = channel;
 	kcs_bmc->ioreg = ast_kcs_bmc_ioregs[channel - 1];
 	kcs_bmc->io_inputb = aspeed_kcs_inb;
 	kcs_bmc->io_outputb = aspeed_kcs_outb;
 	kcs_bmc->io_updateb = aspeed_kcs_updateb;
 
-	addr = ops->get_io_address(pdev);
-	if (addr < 0)
-		return addr;
+	priv->map = syscon_node_to_regmap(pdev->dev.parent->of_node);
+	if (IS_ERR(priv->map)) {
+		dev_err(&pdev->dev, "Couldn't get regmap\n");
+		return -ENODEV;
+	}
 
 	aspeed_kcs_set_address(kcs_bmc, addr);
 
@@ -362,29 +378,25 @@ static int aspeed_kcs_probe(struct platform_device *pdev)
 	if (rc)
 		return rc;
 
-	dev_set_drvdata(dev, kcs_bmc);
+	platform_set_drvdata(pdev, priv);
 
 	aspeed_kcs_enable_channel(kcs_bmc, true);
 
-	rc = misc_register(&kcs_bmc->miscdev);
-	if (rc) {
-		dev_err(dev, "Unable to register device\n");
+	rc = kcs_bmc_add_device(&priv->kcs_bmc);
+	if (rc < 0)
 		return rc;
-	}
 
-	dev_dbg(&pdev->dev,
-		"Probed KCS device %d (IDR=0x%x, ODR=0x%x, STR=0x%x)\n",
-		kcs_bmc->channel, kcs_bmc->ioreg.idr, kcs_bmc->ioreg.odr,
-		kcs_bmc->ioreg.str);
+	dev_info(&pdev->dev, "Initialised channel %d at 0x%x\n", kcs_bmc->channel, addr);
 
 	return 0;
 }
 
 static int aspeed_kcs_remove(struct platform_device *pdev)
 {
-	struct kcs_bmc *kcs_bmc = dev_get_drvdata(&pdev->dev);
+	struct aspeed_kcs_bmc *priv = platform_get_drvdata(pdev);
+	struct kcs_bmc *kcs_bmc = &priv->kcs_bmc;
 
-	misc_deregister(&kcs_bmc->miscdev);
+	kcs_bmc_remove_device(kcs_bmc);
 
 	return 0;
 }
diff --git a/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c b/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c
index bc011db0ec01..c8922f94bafd 100644
--- a/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c
+++ b/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c
@@ -381,7 +381,7 @@ static int kcs_bmc_ipmi_release(struct inode *inode, struct file *filp)
 	return 0;
 }
 
-static const struct file_operations kcs_bmc_fops = {
+static const struct file_operations kcs_bmc_ipmi_fops = {
 	.owner          = THIS_MODULE,
 	.open           = kcs_bmc_ipmi_open,
 	.read           = kcs_bmc_ipmi_read,
@@ -391,35 +391,56 @@ static const struct file_operations kcs_bmc_fops = {
 	.unlocked_ioctl = kcs_bmc_ipmi_ioctl,
 };
 
-struct kcs_bmc *kcs_bmc_ipmi_alloc(struct device *dev, int sizeof_priv, u32 channel)
+int kcs_bmc_ipmi_attach_cdev(struct kcs_bmc *kcs_bmc)
 {
-	struct kcs_bmc *kcs_bmc;
-
-	kcs_bmc = devm_kzalloc(dev, sizeof(*kcs_bmc) + sizeof_priv, GFP_KERNEL);
-	if (!kcs_bmc)
-		return NULL;
+	int rc;
 
 	spin_lock_init(&kcs_bmc->lock);
-	kcs_bmc->channel = channel;
-
 	mutex_init(&kcs_bmc->mutex);
 	init_waitqueue_head(&kcs_bmc->queue);
 
-	kcs_bmc->data_in = devm_kmalloc(dev, KCS_MSG_BUFSIZ, GFP_KERNEL);
-	kcs_bmc->data_out = devm_kmalloc(dev, KCS_MSG_BUFSIZ, GFP_KERNEL);
-	kcs_bmc->kbuffer = devm_kmalloc(dev, KCS_MSG_BUFSIZ, GFP_KERNEL);
+	kcs_bmc->data_in = devm_kmalloc(kcs_bmc->dev, KCS_MSG_BUFSIZ, GFP_KERNEL);
+	kcs_bmc->data_out = devm_kmalloc(kcs_bmc->dev, KCS_MSG_BUFSIZ, GFP_KERNEL);
+	kcs_bmc->kbuffer = devm_kmalloc(kcs_bmc->dev, KCS_MSG_BUFSIZ, GFP_KERNEL);
 
 	kcs_bmc->miscdev.minor = MISC_DYNAMIC_MINOR;
-	kcs_bmc->miscdev.name = devm_kasprintf(dev, GFP_KERNEL, "%s%u",
-					       DEVICE_NAME, channel);
+	kcs_bmc->miscdev.name = devm_kasprintf(kcs_bmc->dev, GFP_KERNEL, "%s%u",
+					       DEVICE_NAME, kcs_bmc->channel);
 	if (!kcs_bmc->data_in || !kcs_bmc->data_out || !kcs_bmc->kbuffer ||
 	    !kcs_bmc->miscdev.name)
-		return NULL;
-	kcs_bmc->miscdev.fops = &kcs_bmc_fops;
+		return -ENOMEM;
 
-	return kcs_bmc;
+	kcs_bmc->miscdev.fops = &kcs_bmc_ipmi_fops;
+
+	rc = misc_register(&kcs_bmc->miscdev);
+	if (rc) {
+		dev_err(kcs_bmc->dev, "Unable to register device: %d\n", rc);
+		return rc;
+	}
+
+	dev_info(kcs_bmc->dev, "Initialised IPMI client for channel %d", kcs_bmc->channel);
+
+	return 0;
+}
+EXPORT_SYMBOL(kcs_bmc_ipmi_attach_cdev);
+
+int kcs_bmc_ipmi_detach_cdev(struct kcs_bmc *kcs_bmc)
+{
+	misc_deregister(&kcs_bmc->miscdev);
+
+	spin_lock_irq(&kcs_bmc->lock);
+	kcs_bmc->running = 0;
+	kcs_bmc_ipmi_force_abort(kcs_bmc);
+	spin_unlock_irq(&kcs_bmc->lock);
+
+	devm_kfree(kcs_bmc->dev, kcs_bmc->kbuffer);
+	devm_kfree(kcs_bmc->dev, kcs_bmc->data_out);
+	devm_kfree(kcs_bmc->dev, kcs_bmc->data_in);
+	devm_kfree(kcs_bmc->dev, kcs_bmc);
+
+	return 0;
 }
-EXPORT_SYMBOL(kcs_bmc_ipmi_alloc);
+EXPORT_SYMBOL(kcs_bmc_ipmi_detach_cdev);
 
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Haiyue Wang <haiyue.wang@linux.intel.com>");
diff --git a/drivers/char/ipmi/kcs_bmc_npcm7xx.c b/drivers/char/ipmi/kcs_bmc_npcm7xx.c
index 1f44aadec9e8..5d017498dc69 100644
--- a/drivers/char/ipmi/kcs_bmc_npcm7xx.c
+++ b/drivers/char/ipmi/kcs_bmc_npcm7xx.c
@@ -65,6 +65,8 @@ struct npcm7xx_kcs_reg {
 };
 
 struct npcm7xx_kcs_bmc {
+	struct kcs_bmc kcs_bmc;
+
 	struct regmap *map;
 
 	const struct npcm7xx_kcs_reg *reg;
@@ -76,9 +78,14 @@ static const struct npcm7xx_kcs_reg npcm7xx_kcs_reg_tbl[KCS_CHANNEL_MAX] = {
 	{ .sts = KCS3ST, .dob = KCS3DO, .dib = KCS3DI, .ctl = KCS3CTL, .ie = KCS3IE },
 };
 
+static inline struct npcm7xx_kcs_bmc *to_npcm7xx_kcs_bmc(struct kcs_bmc *kcs_bmc)
+{
+	return container_of(kcs_bmc, struct npcm7xx_kcs_bmc, kcs_bmc);
+}
+
 static u8 npcm7xx_kcs_inb(struct kcs_bmc *kcs_bmc, u32 reg)
 {
-	struct npcm7xx_kcs_bmc *priv = kcs_bmc_priv(kcs_bmc);
+	struct npcm7xx_kcs_bmc *priv = to_npcm7xx_kcs_bmc(kcs_bmc);
 	u32 val = 0;
 	int rc;
 
@@ -90,7 +97,7 @@ static u8 npcm7xx_kcs_inb(struct kcs_bmc *kcs_bmc, u32 reg)
 
 static void npcm7xx_kcs_outb(struct kcs_bmc *kcs_bmc, u32 reg, u8 data)
 {
-	struct npcm7xx_kcs_bmc *priv = kcs_bmc_priv(kcs_bmc);
+	struct npcm7xx_kcs_bmc *priv = to_npcm7xx_kcs_bmc(kcs_bmc);
 	int rc;
 
 	rc = regmap_write(priv->map, reg, data);
@@ -99,7 +106,7 @@ static void npcm7xx_kcs_outb(struct kcs_bmc *kcs_bmc, u32 reg, u8 data)
 
 static void npcm7xx_kcs_updateb(struct kcs_bmc *kcs_bmc, u32 reg, u8 mask, u8 data)
 {
-	struct npcm7xx_kcs_bmc *priv = kcs_bmc_priv(kcs_bmc);
+	struct npcm7xx_kcs_bmc *priv = to_npcm7xx_kcs_bmc(kcs_bmc);
 	int rc;
 
 	rc = regmap_update_bits(priv->map, reg, mask, data);
@@ -108,7 +115,7 @@ static void npcm7xx_kcs_updateb(struct kcs_bmc *kcs_bmc, u32 reg, u8 mask, u8 da
 
 static void npcm7xx_kcs_enable_channel(struct kcs_bmc *kcs_bmc, bool enable)
 {
-	struct npcm7xx_kcs_bmc *priv = kcs_bmc_priv(kcs_bmc);
+	struct npcm7xx_kcs_bmc *priv = to_npcm7xx_kcs_bmc(kcs_bmc);
 
 	regmap_update_bits(priv->map, priv->reg->ctl, KCS_CTL_IBFIE,
 			   enable ? KCS_CTL_IBFIE : 0);
@@ -155,11 +162,10 @@ static int npcm7xx_kcs_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	kcs_bmc = kcs_bmc_alloc(dev, sizeof(*priv), chan);
-	if (!kcs_bmc)
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
 		return -ENOMEM;
 
-	priv = kcs_bmc_priv(kcs_bmc);
 	priv->map = syscon_node_to_regmap(dev->parent->of_node);
 	if (IS_ERR(priv->map)) {
 		dev_err(dev, "Couldn't get regmap\n");
@@ -167,6 +173,9 @@ static int npcm7xx_kcs_probe(struct platform_device *pdev)
 	}
 	priv->reg = &npcm7xx_kcs_reg_tbl[chan - 1];
 
+	kcs_bmc = &priv->kcs_bmc;
+	kcs_bmc->dev = &pdev->dev;
+	kcs_bmc->channel = chan;
 	kcs_bmc->ioreg.idr = priv->reg->dib;
 	kcs_bmc->ioreg.odr = priv->reg->dob;
 	kcs_bmc->ioreg.str = priv->reg->sts;
@@ -174,31 +183,27 @@ static int npcm7xx_kcs_probe(struct platform_device *pdev)
 	kcs_bmc->io_outputb = npcm7xx_kcs_outb;
 	kcs_bmc->io_updateb = npcm7xx_kcs_updateb;
 
-	dev_set_drvdata(dev, kcs_bmc);
+	platform_set_drvdata(pdev, priv);
 
 	npcm7xx_kcs_enable_channel(kcs_bmc, true);
 	rc = npcm7xx_kcs_config_irq(kcs_bmc, pdev);
 	if (rc)
 		return rc;
 
-	rc = misc_register(&kcs_bmc->miscdev);
-	if (rc) {
-		dev_err(dev, "Unable to register device\n");
-		return rc;
-	}
 
 	pr_info("channel=%u idr=0x%x odr=0x%x str=0x%x\n",
 		chan,
 		kcs_bmc->ioreg.idr, kcs_bmc->ioreg.odr, kcs_bmc->ioreg.str);
 
-	return 0;
+	return kcs_bmc_add_device(kcs_bmc);
 }
 
 static int npcm7xx_kcs_remove(struct platform_device *pdev)
 {
-	struct kcs_bmc *kcs_bmc = dev_get_drvdata(&pdev->dev);
+	struct npcm7xx_kcs_bmc *priv = platform_get_drvdata(pdev);
+	struct kcs_bmc *kcs_bmc = &priv->kcs_bmc;
 
-	misc_deregister(&kcs_bmc->miscdev);
+	kcs_bmc_remove_device(kcs_bmc);
 
 	return 0;
 }
-- 
2.27.0

