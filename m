Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B13613415A9
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Mar 2021 07:30:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234120AbhCSGaP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Mar 2021 02:30:15 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:58635 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234139AbhCSG3t (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 19 Mar 2021 02:29:49 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 15853580A7D;
        Fri, 19 Mar 2021 02:29:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 19 Mar 2021 02:29:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=kc6gjs9yqWDoK
        Csi1TqrIxa0TgkKoxNCj8JuwJy41yE=; b=N/2IQwUm/CCNKscarNRWoK5srrw7l
        3KWQ3Tyg74Tn+7ffkq+Dt9PBtBVJdot9m4eAUXh0hQEr2wKUIpERKmaTtX08FCLx
        iVOv/+XpsQTpyTgpM9WtkoPoSBRxzIc1u35sw7VAGnjqfoum2ZwC+uh0nnYhcRgb
        OujilZrV7fTzlSM/YeoV7x5EE67Ma143X5BnwZbeYE8tC5AKekq6EKGBNmuFrhSR
        H6OptXqTXjB78cuh5syKoe17Jk4T/HVJvKitPTEOE3l2tZdIyNjG/phh351iSA3M
        Uf4SI6/3pqYnMdf7faPOrPp11RkU0trjk1G/18bYGKimkLGyszIhES9wg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=kc6gjs9yqWDoKCsi1TqrIxa0TgkKoxNCj8JuwJy41yE=; b=haqExUDw
        OATLF5XCK885i35LdG3y/jDwNt29M1tpvQjUYS1QyLTNlVmQiOjdDB4B5jHRubA2
        GlbG5Qghw+zLKFYXrplaOdShgJ0x31R1V0FMz0cZ6hSOVhojNvhrRHdHGbzyni8a
        HBbu9Z8sjEioyunkNJdOLU6K3wPBxuCb+cdtowDF+WNCureMEZ6ZVF5+KXU+PtBq
        adDAXIAfpsn/HKosine81JqokZfYdqnf11x1oyEf746IrBROJagWN5ORB2KLhNmz
        SvzPziUKgNN7d5gefCNRdEKc1azOVGdQg532FHiVN3phORGMbGmuLb1dYDTSqTX+
        up/sjUi4MH79fQ==
X-ME-Sender: <xms:3ERUYBznuPg_k70XTaBke0FBKgptbwgyael3_7eS5QFnttS9cRHRKA>
    <xme:3ERUYBSrI6Q7ZImivqwPILYD2yyr3Dx9B6P1b-hYPZ_sm1gTJs4Z_HXIyZdBWxJ5S
    SG6RGDvCQ1Z5g4P2A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefjedgleeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
    jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepjefgvdevheetkeevgeegleelgfelte
    etjeffleffvdduudevieffgeetleevhfetnecukfhppeduudekrddvuddtrddukedurdeh
    heenucevlhhushhtvghrufhiiigvpeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnh
    gurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:3ERUYLUntPTVRl2nPBOqVSwE5ASTqCwDXxg4Y936RvgJy0bw8jgpCw>
    <xmx:3ERUYDjyIOKV9gdL9UB2I5nM9vEfBNapDQ6MiPF7QoRIonjqPplz6w>
    <xmx:3ERUYDA2ifncq36ZW4X7DurZvP1fQY4d6SFQDKcInGjTlm8iCxEIjg>
    <xmx:3URUYFxkyxFKqaMsyxYpfp9NIkphTMS2P_5M569LfttYIr3NV-_PmQ>
Received: from localhost.localdomain (ppp118-210-181-55.adl-adc-lon-bras34.tpg.internode.on.net [118.210.181.55])
        by mail.messagingengine.com (Postfix) with ESMTPA id 67BF0240057;
        Fri, 19 Mar 2021 02:29:43 -0400 (EDT)
From:   Andrew Jeffery <andrew@aj.id.au>
To:     openipmi-developer@lists.sourceforge.net, openbmc@lists.ozlabs.org,
        minyard@acm.org
Cc:     joel@jms.id.au, ryan_chen@aspeedtech.com,
        devicetree@vger.kernel.org, tmaimon77@gmail.com,
        linux-aspeed@lists.ozlabs.org, linux-gpio@vger.kernel.org,
        avifishman70@gmail.com, venture@google.com,
        linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
        tali.perry1@gmail.com, robh+dt@kernel.org, lee.jones@linaro.org,
        chiawei_wang@aspeedtech.com, linux-arm-kernel@lists.infradead.org,
        benjaminfair@google.com
Subject: [PATCH v2 15/21] ipmi: kcs_bmc: Don't enforce single-open policy in the kernel
Date:   Fri, 19 Mar 2021 16:57:46 +1030
Message-Id: <20210319062752.145730-15-andrew@aj.id.au>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210319062752.145730-1-andrew@aj.id.au>
References: <20210319062752.145730-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Soon it will be possible for one KCS device to have multiple associated
chardevs exposed to userspace (for IPMI and raw-style access). However,
don't prevent userspace from:

1. Opening more than one chardev at a time, or
2. Opening the same chardev more than once.

System behaviour is undefined for both classes of multiple access, so
userspace must manage itself accordingly.

The implementation delivers IBF and OBF events to the first chardev
client to associate with the KCS device. An open on a related chardev
cannot associate its client with the KCS device and so will not
receive notification of events. However, any fd on any chardev may race
their accesses to the data and status registers.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/char/ipmi/kcs_bmc.c         | 34 ++++++++++-------------------
 drivers/char/ipmi/kcs_bmc_aspeed.c  |  3 +--
 drivers/char/ipmi/kcs_bmc_npcm7xx.c |  3 +--
 3 files changed, 14 insertions(+), 26 deletions(-)

diff --git a/drivers/char/ipmi/kcs_bmc.c b/drivers/char/ipmi/kcs_bmc.c
index 05bbb72418b2..2fafa9541934 100644
--- a/drivers/char/ipmi/kcs_bmc.c
+++ b/drivers/char/ipmi/kcs_bmc.c
@@ -55,24 +55,12 @@ EXPORT_SYMBOL(kcs_bmc_update_status);
 int kcs_bmc_handle_event(struct kcs_bmc_device *kcs_bmc)
 {
 	struct kcs_bmc_client *client;
-	int rc;
+	int rc = KCS_BMC_EVENT_NONE;
 
 	spin_lock(&kcs_bmc->lock);
 	client = kcs_bmc->client;
-	if (client) {
+	if (!WARN_ON_ONCE(!client))
 		rc = client->ops->event(client);
-	} else {
-		u8 status;
-
-		status = kcs_bmc_read_status(kcs_bmc);
-		if (status & KCS_BMC_STR_IBF) {
-			/* Ack the event by reading the data */
-			kcs_bmc_read_data(kcs_bmc);
-			rc = KCS_BMC_EVENT_HANDLED;
-		} else {
-			rc = KCS_BMC_EVENT_NONE;
-		}
-	}
 	spin_unlock(&kcs_bmc->lock);
 
 	return rc;
@@ -81,26 +69,28 @@ EXPORT_SYMBOL(kcs_bmc_handle_event);
 
 int kcs_bmc_enable_device(struct kcs_bmc_device *kcs_bmc, struct kcs_bmc_client *client)
 {
-	int rc;
-
 	spin_lock_irq(&kcs_bmc->lock);
-	if (kcs_bmc->client) {
-		rc = -EBUSY;
-	} else {
+	if (!kcs_bmc->client) {
+		u8 mask = KCS_BMC_EVENT_TYPE_IBF;
+
 		kcs_bmc->client = client;
-		rc = 0;
+		kcs_bmc_update_event_mask(kcs_bmc, mask, mask);
 	}
 	spin_unlock_irq(&kcs_bmc->lock);
 
-	return rc;
+	return 0;
 }
 EXPORT_SYMBOL(kcs_bmc_enable_device);
 
 void kcs_bmc_disable_device(struct kcs_bmc_device *kcs_bmc, struct kcs_bmc_client *client)
 {
 	spin_lock_irq(&kcs_bmc->lock);
-	if (client == kcs_bmc->client)
+	if (client == kcs_bmc->client) {
+		u8 mask = KCS_BMC_EVENT_TYPE_IBF | KCS_BMC_EVENT_TYPE_OBE;
+
+		kcs_bmc_update_event_mask(kcs_bmc, mask, 0);
 		kcs_bmc->client = NULL;
+	}
 	spin_unlock_irq(&kcs_bmc->lock);
 }
 EXPORT_SYMBOL(kcs_bmc_disable_device);
diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bmc_aspeed.c
index 5f26471c038c..271845eb2e26 100644
--- a/drivers/char/ipmi/kcs_bmc_aspeed.c
+++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
@@ -419,8 +419,7 @@ static int aspeed_kcs_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, priv);
 
-	aspeed_kcs_irq_mask_update(kcs_bmc, (KCS_BMC_EVENT_TYPE_IBF | KCS_BMC_EVENT_TYPE_OBE),
-				   KCS_BMC_EVENT_TYPE_IBF);
+	aspeed_kcs_irq_mask_update(kcs_bmc, (KCS_BMC_EVENT_TYPE_IBF | KCS_BMC_EVENT_TYPE_OBE), 0);
 	aspeed_kcs_enable_channel(kcs_bmc, true);
 
 	rc = kcs_bmc_add_device(&priv->kcs_bmc);
diff --git a/drivers/char/ipmi/kcs_bmc_npcm7xx.c b/drivers/char/ipmi/kcs_bmc_npcm7xx.c
index c2032728a03d..fdf35cad2eba 100644
--- a/drivers/char/ipmi/kcs_bmc_npcm7xx.c
+++ b/drivers/char/ipmi/kcs_bmc_npcm7xx.c
@@ -207,8 +207,7 @@ static int npcm7xx_kcs_probe(struct platform_device *pdev)
 	if (rc)
 		return rc;
 
-	npcm7xx_kcs_irq_mask_update(kcs_bmc, (KCS_BMC_EVENT_TYPE_IBF | KCS_BMC_EVENT_TYPE_OBE),
-				    KCS_BMC_EVENT_TYPE_IBF);
+	npcm7xx_kcs_irq_mask_update(kcs_bmc, (KCS_BMC_EVENT_TYPE_IBF | KCS_BMC_EVENT_TYPE_OBE), 0);
 	npcm7xx_kcs_enable_channel(kcs_bmc, true);
 
 	pr_info("channel=%u idr=0x%x odr=0x%x str=0x%x\n",
-- 
2.27.0

