Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B7CA31FAB1
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Feb 2021 15:29:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231136AbhBSO2Z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Feb 2021 09:28:25 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:60053 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230511AbhBSO2H (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 19 Feb 2021 09:28:07 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 7C85D5803BC;
        Fri, 19 Feb 2021 09:27:20 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 19 Feb 2021 09:27:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=m3dd7+D6wrA7l
        A9odvoTzurf1fziuhUod1wrNxjTf+U=; b=i0UZq88k/VyXkUWZsK6ClbBbTXhRD
        3NBploi3IQMpqu8CXswE0K5+LbA1rJiDpy8nemRZvBPiyxMDvmHItmvItQRtuD9P
        em78TkMy1DkoqOanHoQpnFb0Cw6y2QTmQzGaIBTkuWdQ4RzSFmrk2fQHeHWKR1iW
        qyWOVlbqr0lopenFGLzxLnE56nUCgd1UpqeiDjhkiruLWz6SnaHQfa6z1t8XdU83
        jMxCbPDkMIUOBG5lkuZdywTwcg/EMyoC+/lAxpxf4pMHCbY3h8BCDsRp+fOtSIsI
        slwz0v9ZA/SvCB/LcxuPVK+IO9KSwxyA3guRT1LyIwBH2X6KmpJmfDZJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=m3dd7+D6wrA7lA9odvoTzurf1fziuhUod1wrNxjTf+U=; b=LyQayqLG
        NV0/4ivDxQYpcmcoQdVSUDzKwVXmIvyY50uGeoZUOVQHjds83khRh2RLoQ6DOwke
        NDizMehDs2tDuweT8wr+FNk619tCK0apL1kPodENo0QQ248gcynuCL/CAXIBj0K0
        MBTHptWjEwzW2+7Vxuo9apLjubCY4EQZhHgiE37P3vnUNUYYlCrKFJygOk1Uou3+
        piI8EUl1ulC/1VO1W6Zpx6jjZbHs86OFAjaiBkzGMrzc1tPw0+kB3XLWnNUQtPBJ
        2b833bCwwmd61s0SBsitYPwo6tS6Iu7H2B8PWnkn0vStK8ao1LK2Wh4uuQLfwb8Y
        metEj96WMz/56A==
X-ME-Sender: <xms:yMovYLJ8VKkXjdxEZFSEopa2bdrb22iFiHs9_4AR7T5j1Vl059zQ0w>
    <xme:yMovYPIfD5n1z9za85bDQyps4y9KISMvE3-jhyZSPOBVEaHcexd25RweOBvOPIzia
    EayWT2C3KJblBz-7w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrjeeigdeigecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
    rdhiugdrrghuqeenucggtffrrghtthgvrhhnpeejgfdvveehteekveeggeellefgleette
    ejffelffdvudduveeiffegteelvefhteenucfkphepudegrddvrdeluddrfeejnecuvehl
    uhhsthgvrhfuihiivgepkeenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifse
    grjhdrihgurdgruh
X-ME-Proxy: <xmx:yMovYDtenAg8mOn67BCjbWjxnK9iCrO3pGYjEk8l2sQOset2J0O_PQ>
    <xmx:yMovYEaNhHSqSvl6Yu_Zs6i0KNYWdRlW7rGluemHv1zMf2-cTdPFPQ>
    <xmx:yMovYCbPKOCE_NcquhzbCDnoDeOzcp-QFz0dabDUb2dEwFKF2M9-zw>
    <xmx:yMovYCKDwKoI_dkKJKFEyF3gSzX3pnlc9aNW25SN8XnvGmgEiRZ8-g>
Received: from localhost.localdomain (ppp14-2-91-37.adl-apt-pir-bras31.tpg.internode.on.net [14.2.91.37])
        by mail.messagingengine.com (Postfix) with ESMTPA id 1AEF8240057;
        Fri, 19 Feb 2021 09:27:13 -0500 (EST)
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
Subject: [PATCH 14/19] ipmi: kcs_bmc: Allow clients to control KCS IRQ state
Date:   Sat, 20 Feb 2021 00:55:18 +1030
Message-Id: <20210219142523.3464540-15-andrew@aj.id.au>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210219142523.3464540-1-andrew@aj.id.au>
References: <20210219142523.3464540-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a mechanism for controlling whether the client associated with a
KCS device will receive Input Buffer Full (IBF) and Output Buffer Empty
(OBE) events. This enables an abstract implementation of poll() for KCS
devices.

A wart in the implementation is that the ASPEED KCS devices don't
support an OBE interrupt for the BMC. Instead we pretend it has one by
polling the status register waiting for the Output Buffer Full (OBF) bit
to clear, and generating an event when OBE is observed.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/char/ipmi/kcs_bmc.c         |   6 ++
 drivers/char/ipmi/kcs_bmc.h         |   3 +
 drivers/char/ipmi/kcs_bmc_aspeed.c  | 150 ++++++++++++++++++----------
 drivers/char/ipmi/kcs_bmc_client.h  |   2 +
 drivers/char/ipmi/kcs_bmc_device.h  |   1 +
 drivers/char/ipmi/kcs_bmc_npcm7xx.c |  25 ++++-
 6 files changed, 130 insertions(+), 57 deletions(-)

diff --git a/drivers/char/ipmi/kcs_bmc.c b/drivers/char/ipmi/kcs_bmc.c
index 694db6ee2a92..05bbb72418b2 100644
--- a/drivers/char/ipmi/kcs_bmc.c
+++ b/drivers/char/ipmi/kcs_bmc.c
@@ -184,6 +184,12 @@ int kcs_bmc_unregister_cdev(struct kcs_bmc_cdev *cdev)
 }
 EXPORT_SYMBOL(kcs_bmc_unregister_cdev);
 
+void kcs_bmc_update_event_mask(struct kcs_bmc_device *kcs_bmc, u8 mask, u8 events)
+{
+	kcs_bmc->ops->irq_mask_update(kcs_bmc, mask, events);
+}
+EXPORT_SYMBOL(kcs_bmc_update_event_mask);
+
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Haiyue Wang <haiyue.wang@linux.intel.com>");
 MODULE_AUTHOR("Andrew Jeffery <andrew@aj.id.au>");
diff --git a/drivers/char/ipmi/kcs_bmc.h b/drivers/char/ipmi/kcs_bmc.h
index 5deb9a0b8e60..11fff935218c 100644
--- a/drivers/char/ipmi/kcs_bmc.h
+++ b/drivers/char/ipmi/kcs_bmc.h
@@ -11,6 +11,9 @@
 #define KCS_BMC_EVENT_NONE	0
 #define KCS_BMC_EVENT_HANDLED	1
 
+#define KCS_BMC_EVENT_TYPE_OBE	BIT(0)
+#define KCS_BMC_EVENT_TYPE_IBF	BIT(1)
+
 #define KCS_BMC_STR_OBF		BIT(0)
 #define KCS_BMC_STR_IBF		BIT(1)
 #define KCS_BMC_STR_CMD_DAT	BIT(3)
diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bmc_aspeed.c
index 6f26e7366c0b..17afe9449e72 100644
--- a/drivers/char/ipmi/kcs_bmc_aspeed.c
+++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
@@ -60,10 +60,18 @@
 #define LPC_ODR4             0x118
 #define LPC_STR4             0x11C
 
+#define OBE_POLL_PERIOD	     (2 * HZ)
+
 struct aspeed_kcs_bmc {
 	struct kcs_bmc_device kcs_bmc;
 
 	struct regmap *map;
+
+	struct {
+		spinlock_t lock;
+		bool remove;
+		struct timer_list timer;
+	} obe;
 };
 
 struct aspeed_kcs_of_ops {
@@ -159,68 +167,89 @@ static void aspeed_kcs_enable_channel(struct kcs_bmc_device *kcs_bmc, bool enabl
 
 	switch (kcs_bmc->channel) {
 	case 1:
-		if (enable) {
-			regmap_update_bits(priv->map, LPC_HICR2,
-					LPC_HICR2_IBFIF1, LPC_HICR2_IBFIF1);
-			regmap_update_bits(priv->map, LPC_HICR0,
-					LPC_HICR0_LPC1E, LPC_HICR0_LPC1E);
-		} else {
-			regmap_update_bits(priv->map, LPC_HICR0,
-					LPC_HICR0_LPC1E, 0);
-			regmap_update_bits(priv->map, LPC_HICR2,
-					LPC_HICR2_IBFIF1, 0);
-		}
-		break;
-
+		regmap_update_bits(priv->map, LPC_HICR0, LPC_HICR0_LPC1E, enable * LPC_HICR0_LPC1E);
+		return;
 	case 2:
-		if (enable) {
-			regmap_update_bits(priv->map, LPC_HICR2,
-					LPC_HICR2_IBFIF2, LPC_HICR2_IBFIF2);
-			regmap_update_bits(priv->map, LPC_HICR0,
-					LPC_HICR0_LPC2E, LPC_HICR0_LPC2E);
-		} else {
-			regmap_update_bits(priv->map, LPC_HICR0,
-					LPC_HICR0_LPC2E, 0);
-			regmap_update_bits(priv->map, LPC_HICR2,
-					LPC_HICR2_IBFIF2, 0);
-		}
-		break;
-
+		regmap_update_bits(priv->map, LPC_HICR0, LPC_HICR0_LPC2E, enable * LPC_HICR0_LPC2E);
+		return;
 	case 3:
-		if (enable) {
-			regmap_update_bits(priv->map, LPC_HICR2,
-					LPC_HICR2_IBFIF3, LPC_HICR2_IBFIF3);
-			regmap_update_bits(priv->map, LPC_HICR0,
-					LPC_HICR0_LPC3E, LPC_HICR0_LPC3E);
-			regmap_update_bits(priv->map, LPC_HICR4,
-					LPC_HICR4_KCSENBL, LPC_HICR4_KCSENBL);
-		} else {
-			regmap_update_bits(priv->map, LPC_HICR0,
-					LPC_HICR0_LPC3E, 0);
-			regmap_update_bits(priv->map, LPC_HICR4,
-					LPC_HICR4_KCSENBL, 0);
-			regmap_update_bits(priv->map, LPC_HICR2,
-					LPC_HICR2_IBFIF3, 0);
-		}
-		break;
-
+		regmap_update_bits(priv->map, LPC_HICR0, LPC_HICR0_LPC3E, enable * LPC_HICR0_LPC3E);
+		regmap_update_bits(priv->map, LPC_HICR4,
+				   LPC_HICR4_KCSENBL, enable * LPC_HICR4_KCSENBL);
+		return;
 	case 4:
-		if (enable)
-			regmap_update_bits(priv->map, LPC_HICRB,
-					LPC_HICRB_IBFIF4 | LPC_HICRB_LPC4E,
-					LPC_HICRB_IBFIF4 | LPC_HICRB_LPC4E);
+		regmap_update_bits(priv->map, LPC_HICRB, LPC_HICRB_LPC4E, enable * LPC_HICRB_LPC4E);
+		return;
+	default:
+		pr_warn("%s: Unsupported channel: %d", __func__, kcs_bmc->channel);
+		return;
+	}
+}
+
+static void aspeed_kcs_check_obe(struct timer_list *timer)
+{
+	struct aspeed_kcs_bmc *priv = container_of(timer, struct aspeed_kcs_bmc, obe.timer);
+	unsigned long flags;
+	u8 str;
+
+	spin_lock_irqsave(&priv->obe.lock, flags);
+	if (priv->obe.remove) {
+		spin_unlock_irqrestore(&priv->obe.lock, flags);
+		return;
+	}
+
+	str = aspeed_kcs_inb(&priv->kcs_bmc, priv->kcs_bmc.ioreg.str);
+	if (str & KCS_BMC_STR_OBF) {
+		mod_timer(timer, jiffies + OBE_POLL_PERIOD);
+		spin_unlock_irqrestore(&priv->obe.lock, flags);
+		return;
+	}
+	spin_unlock_irqrestore(&priv->obe.lock, flags);
+
+	kcs_bmc_handle_event(&priv->kcs_bmc);
+}
+
+static void aspeed_kcs_irq_mask_update(struct kcs_bmc_device *kcs_bmc, u8 mask, u8 state)
+{
+	struct aspeed_kcs_bmc *priv = to_aspeed_kcs_bmc(kcs_bmc);
+
+	/* We don't have an OBE IRQ, emulate it */
+	if (KCS_BMC_EVENT_TYPE_OBE & mask) {
+		if (KCS_BMC_EVENT_TYPE_OBE & state)
+			mod_timer(&priv->obe.timer, jiffies + OBE_POLL_PERIOD);
 		else
-			regmap_update_bits(priv->map, LPC_HICRB,
-					LPC_HICRB_IBFIF4 | LPC_HICRB_LPC4E,
-					0);
-		break;
+			del_timer(&priv->obe.timer);
+	}
 
-	default:
-		break;
+	if (KCS_BMC_EVENT_TYPE_IBF & mask) {
+		const bool enable = !!(KCS_BMC_EVENT_TYPE_IBF & state);
+
+		switch (kcs_bmc->channel) {
+		case 1:
+			regmap_update_bits(priv->map, LPC_HICR2, LPC_HICR2_IBFIF1,
+					   enable * LPC_HICR2_IBFIF1);
+			return;
+		case 2:
+			regmap_update_bits(priv->map, LPC_HICR2, LPC_HICR2_IBFIF2,
+					   enable * LPC_HICR2_IBFIF2);
+			return;
+		case 3:
+			regmap_update_bits(priv->map, LPC_HICR2, LPC_HICR2_IBFIF3,
+					   enable * LPC_HICR2_IBFIF3);
+			return;
+		case 4:
+			regmap_update_bits(priv->map, LPC_HICRB, LPC_HICRB_IBFIF4,
+					   enable * LPC_HICRB_IBFIF4);
+			return;
+		default:
+			pr_warn("%s: Unsupported channel: %d", __func__, kcs_bmc->channel);
+			return;
+		}
 	}
 }
 
 static const struct kcs_bmc_device_ops aspeed_kcs_ops = {
+	.irq_mask_update = aspeed_kcs_irq_mask_update,
 	.io_inputb = aspeed_kcs_inb,
 	.io_outputb = aspeed_kcs_outb,
 	.io_updateb = aspeed_kcs_updateb,
@@ -378,6 +407,10 @@ static int aspeed_kcs_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	spin_lock_init(&priv->obe.lock);
+	priv->obe.remove = false;
+	timer_setup(&priv->obe.timer, aspeed_kcs_check_obe, 0);
+
 	aspeed_kcs_set_address(kcs_bmc, addr);
 
 	rc = aspeed_kcs_config_irq(kcs_bmc, pdev);
@@ -386,6 +419,8 @@ static int aspeed_kcs_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, priv);
 
+	aspeed_kcs_irq_mask_update(kcs_bmc, (KCS_BMC_EVENT_TYPE_IBF | KCS_BMC_EVENT_TYPE_OBE),
+				   KCS_BMC_EVENT_TYPE_IBF);
 	aspeed_kcs_enable_channel(kcs_bmc, true);
 
 	rc = kcs_bmc_add_device(&priv->kcs_bmc);
@@ -404,6 +439,15 @@ static int aspeed_kcs_remove(struct platform_device *pdev)
 
 	kcs_bmc_remove_device(kcs_bmc);
 
+	aspeed_kcs_enable_channel(kcs_bmc, false);
+	aspeed_kcs_irq_mask_update(kcs_bmc, (KCS_BMC_EVENT_TYPE_IBF | KCS_BMC_EVENT_TYPE_OBE), 0);
+
+	/* Make sure it's proper dead */
+	spin_lock_irq(&priv->obe.lock);
+	priv->obe.remove = true;
+	spin_unlock_irq(&priv->obe.lock);
+	del_timer_sync(&priv->obe.timer);
+
 	return 0;
 }
 
diff --git a/drivers/char/ipmi/kcs_bmc_client.h b/drivers/char/ipmi/kcs_bmc_client.h
index d0a7404ff584..456796da33de 100644
--- a/drivers/char/ipmi/kcs_bmc_client.h
+++ b/drivers/char/ipmi/kcs_bmc_client.h
@@ -37,6 +37,8 @@ int kcs_bmc_unregister_cdev(struct kcs_bmc_cdev *cdev);
 int kcs_bmc_enable_device(struct kcs_bmc_device *kcs_bmc, struct kcs_bmc_client *client);
 void kcs_bmc_disable_device(struct kcs_bmc_device *kcs_bmc, struct kcs_bmc_client *client);
 
+void kcs_bmc_update_event_mask(struct kcs_bmc_device *kcs_bmc, u8 mask, u8 events);
+
 u8 kcs_bmc_read_data(struct kcs_bmc_device *kcs_bmc);
 void kcs_bmc_write_data(struct kcs_bmc_device *kcs_bmc, u8 data);
 u8 kcs_bmc_read_status(struct kcs_bmc_device *kcs_bmc);
diff --git a/drivers/char/ipmi/kcs_bmc_device.h b/drivers/char/ipmi/kcs_bmc_device.h
index 57b7174b2bac..f1ca8912496a 100644
--- a/drivers/char/ipmi/kcs_bmc_device.h
+++ b/drivers/char/ipmi/kcs_bmc_device.h
@@ -7,6 +7,7 @@
 #include "kcs_bmc.h"
 
 struct kcs_bmc_device_ops {
+	void (*irq_mask_update)(struct kcs_bmc_device *kcs_bmc, u8 mask, u8 enable);
 	u8 (*io_inputb)(struct kcs_bmc_device *kcs_bmc, u32 reg);
 	void (*io_outputb)(struct kcs_bmc_device *kcs_bmc, u32 reg, u8 b);
 	void (*io_updateb)(struct kcs_bmc_device *kcs_bmc, u32 reg, u8 mask, u8 b);
diff --git a/drivers/char/ipmi/kcs_bmc_npcm7xx.c b/drivers/char/ipmi/kcs_bmc_npcm7xx.c
index dce93ec895fc..c2032728a03d 100644
--- a/drivers/char/ipmi/kcs_bmc_npcm7xx.c
+++ b/drivers/char/ipmi/kcs_bmc_npcm7xx.c
@@ -38,6 +38,7 @@
 #define KCS2CTL		0x2A
 #define KCS3CTL		0x3C
 #define    KCS_CTL_IBFIE	BIT(0)
+#define    KCS_CTL_OBEIE	BIT(0)
 
 #define KCS1IE		0x1C
 #define KCS2IE		0x2E
@@ -117,13 +118,23 @@ static void npcm7xx_kcs_enable_channel(struct kcs_bmc_device *kcs_bmc, bool enab
 {
 	struct npcm7xx_kcs_bmc *priv = to_npcm7xx_kcs_bmc(kcs_bmc);
 
-	regmap_update_bits(priv->map, priv->reg->ctl, KCS_CTL_IBFIE,
-			   enable ? KCS_CTL_IBFIE : 0);
-
 	regmap_update_bits(priv->map, priv->reg->ie, KCS_IE_IRQE | KCS_IE_HIRQE,
 			   enable ? KCS_IE_IRQE | KCS_IE_HIRQE : 0);
 }
 
+static void npcm7xx_kcs_irq_mask_update(struct kcs_bmc_device *kcs_bmc, u8 mask, u8 state)
+{
+	struct npcm7xx_kcs_bmc *priv = to_npcm7xx_kcs_bmc(kcs_bmc);
+
+	if (KCS_BMC_EVENT_TYPE_OBE & mask)
+		regmap_update_bits(priv->map, priv->reg->ctl, KCS_CTL_OBEIE,
+				   !!(KCS_BMC_EVENT_TYPE_OBE & state) * KCS_CTL_OBEIE);
+
+	if (KCS_BMC_EVENT_TYPE_IBF & mask)
+		regmap_update_bits(priv->map, priv->reg->ctl, KCS_CTL_IBFIE,
+				   !!(KCS_BMC_EVENT_TYPE_IBF & state) * KCS_CTL_IBFIE);
+}
+
 static irqreturn_t npcm7xx_kcs_irq(int irq, void *arg)
 {
 	struct kcs_bmc_device *kcs_bmc = arg;
@@ -151,6 +162,7 @@ static int npcm7xx_kcs_config_irq(struct kcs_bmc_device *kcs_bmc,
 }
 
 static const struct kcs_bmc_device_ops npcm7xx_kcs_ops = {
+	.irq_mask_update = npcm7xx_kcs_irq_mask_update,
 	.io_inputb = npcm7xx_kcs_inb,
 	.io_outputb = npcm7xx_kcs_outb,
 	.io_updateb = npcm7xx_kcs_updateb,
@@ -191,11 +203,13 @@ static int npcm7xx_kcs_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, priv);
 
-	npcm7xx_kcs_enable_channel(kcs_bmc, true);
 	rc = npcm7xx_kcs_config_irq(kcs_bmc, pdev);
 	if (rc)
 		return rc;
 
+	npcm7xx_kcs_irq_mask_update(kcs_bmc, (KCS_BMC_EVENT_TYPE_IBF | KCS_BMC_EVENT_TYPE_OBE),
+				    KCS_BMC_EVENT_TYPE_IBF);
+	npcm7xx_kcs_enable_channel(kcs_bmc, true);
 
 	pr_info("channel=%u idr=0x%x odr=0x%x str=0x%x\n",
 		chan,
@@ -211,6 +225,9 @@ static int npcm7xx_kcs_remove(struct platform_device *pdev)
 
 	kcs_bmc_remove_device(kcs_bmc);
 
+	npcm7xx_kcs_enable_channel(kcs_bmc, false);
+	npcm7xx_kcs_irq_mask_update(kcs_bmc, (KCS_BMC_EVENT_TYPE_IBF | KCS_BMC_EVENT_TYPE_OBE), 0);
+
 	return 0;
 }
 
-- 
2.27.0

