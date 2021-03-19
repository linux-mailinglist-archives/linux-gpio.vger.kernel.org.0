Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DCA33415BD
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Mar 2021 07:31:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234091AbhCSGap (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Mar 2021 02:30:45 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:40527 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234157AbhCSGaT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 19 Mar 2021 02:30:19 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 0103C580A7C;
        Fri, 19 Mar 2021 02:30:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 19 Mar 2021 02:30:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=oezH8d9IZwsC6
        Zot9Yj8OXXCheexp/7uKg5VoRs1yuA=; b=sJveB98kLtGHnIDcqCzg5OGrboV4I
        QOaVUYvRlnY3prqLVUiLO+2dbZ4Vd2i+euB2HLVzlyEO6BqQbIJmDRghzmInTXnv
        BikE9VczGoJ8KRNRnlK7Qvowm3uoVL3KDPYFEAHd6+JFWRruFFQGW7WBdceYUvA+
        xwx5CGwGxEU8X3nHMealxGLtyI/LnTuVOiJxDyIVQRE1xE88FVcKc9ln+THsH2ll
        hpFDS1ATTPVIaNtrWczwJtQPmG6JlyZq8f+Pje4GJUzyHUGPskZcdU9ZXq4GHxgm
        Xbnb3jPDqcp6S+PHK6AZohYMnGsqnbQR9j9XEIW66rqKPhEHHBuEv1gMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=oezH8d9IZwsC6Zot9Yj8OXXCheexp/7uKg5VoRs1yuA=; b=TP7Ee5/k
        6akEI5Ra2r2ZM8aJc/WQelxqtmzblxHkl8eKKrumx/Qyd3S14Xu5ssLWhtYnLcI3
        ZFEi/Xm6Qarn/mxmApSk5kznwItcYlM1JLptaho5o/S42XXQZ6fi66BG0SpDm/Fs
        8ZR6Tm8eeZ8Q3pFE6gyMz+XwdTuMgvmAUzFQwD470AcUwoPXDP1Ua8x9Hfkw0fdv
        qUjhRuwrBg6LzvfWc9i/fV3+msgeJMQyxwRsnU9M5zzZuk2w9glYMxa0v7IPwXGm
        bF7GFNfSFhJrOl0xToDqju3XoArKAzmhOzFQfi8eehZ14nICZQbFtdLuhXT3EDrz
        FcyhsOvTRpLtbg==
X-ME-Sender: <xms:-kRUYD6TkD3wpKYOK4UjFbytt7Oz9-zwK_fnaLKFnPBqEsC_egf2EA>
    <xme:-kRUYI6B9uNVGKm0ORSM2YQYSfmCYBPeqxmrM_Yw2UAeAfjEWl46P8N_sochlsmil
    DUcETj0V31jpfhcRw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefjedgleeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
    jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepjefgvdevheetkeevgeegleelgfelte
    etjeffleffvdduudevieffgeetleevhfetnecukfhppeduudekrddvuddtrddukedurdeh
    heenucevlhhushhtvghrufhiiigvpeeknecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnh
    gurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:-kRUYKcVoxKihyjx_sHTnTXG1BrEUUa89ZkTWMwLth_hk3inKOzpKg>
    <xmx:-kRUYEKuu4HxUXux_akhkw467FfXI-s_YzZgOEwFyV67kIAGBVPoGg>
    <xmx:-kRUYHJClPgqZcNW9x4VprJh5CcIPHu7NSgWe0PcBG5kmhgPcuyqjA>
    <xmx:-kRUYA5P9idgkrOVTPhuHvlSewT_3O9NwW_7KzuOUethPTOoilWnUw>
Received: from localhost.localdomain (ppp118-210-181-55.adl-adc-lon-bras34.tpg.internode.on.net [118.210.181.55])
        by mail.messagingengine.com (Postfix) with ESMTPA id 64A3C24005E;
        Fri, 19 Mar 2021 02:30:13 -0400 (EDT)
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
Subject: [PATCH v2 20/21] ipmi: kcs_bmc_aspeed: Fix IBFIE typo from datasheet
Date:   Fri, 19 Mar 2021 16:57:51 +1030
Message-Id: <20210319062752.145730-20-andrew@aj.id.au>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210319062752.145730-1-andrew@aj.id.au>
References: <20210319062752.145730-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Input Buffer Full Interrupt Enable (IBFIE) is typoed as IBFIF for some
registers in the datasheet. Fix the driver to use the sensible acronym.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/char/ipmi/kcs_bmc_aspeed.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bmc_aspeed.c
index 3782aef4eb73..7334b1f51dcc 100644
--- a/drivers/char/ipmi/kcs_bmc_aspeed.c
+++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
@@ -50,9 +50,9 @@
 #define     LPC_HICR0_LPC2E          BIT(6)
 #define     LPC_HICR0_LPC1E          BIT(5)
 #define LPC_HICR2            0x008
-#define     LPC_HICR2_IBFIF3         BIT(3)
-#define     LPC_HICR2_IBFIF2         BIT(2)
-#define     LPC_HICR2_IBFIF1         BIT(1)
+#define     LPC_HICR2_IBFIE3         BIT(3)
+#define     LPC_HICR2_IBFIE2         BIT(2)
+#define     LPC_HICR2_IBFIE1         BIT(1)
 #define LPC_HICR4            0x010
 #define     LPC_HICR4_LADR12AS       BIT(7)
 #define     LPC_HICR4_KCSENBL        BIT(2)
@@ -83,7 +83,7 @@
 #define LPC_STR2             0x040
 #define LPC_STR3             0x044
 #define LPC_HICRB            0x100
-#define     LPC_HICRB_IBFIF4         BIT(1)
+#define     LPC_HICRB_IBFIE4         BIT(1)
 #define     LPC_HICRB_LPC4E          BIT(0)
 #define LPC_HICRC            0x104
 #define     LPC_HICRC_ID4IRQX_MASK   GENMASK(7, 4)
@@ -383,20 +383,20 @@ static void aspeed_kcs_irq_mask_update(struct kcs_bmc_device *kcs_bmc, u8 mask,
 
 		switch (kcs_bmc->channel) {
 		case 1:
-			regmap_update_bits(priv->map, LPC_HICR2, LPC_HICR2_IBFIF1,
-					   enable * LPC_HICR2_IBFIF1);
+			regmap_update_bits(priv->map, LPC_HICR2, LPC_HICR2_IBFIE1,
+					   enable * LPC_HICR2_IBFIE1);
 			return;
 		case 2:
-			regmap_update_bits(priv->map, LPC_HICR2, LPC_HICR2_IBFIF2,
-					   enable * LPC_HICR2_IBFIF2);
+			regmap_update_bits(priv->map, LPC_HICR2, LPC_HICR2_IBFIE2,
+					   enable * LPC_HICR2_IBFIE2);
 			return;
 		case 3:
-			regmap_update_bits(priv->map, LPC_HICR2, LPC_HICR2_IBFIF3,
-					   enable * LPC_HICR2_IBFIF3);
+			regmap_update_bits(priv->map, LPC_HICR2, LPC_HICR2_IBFIE3,
+					   enable * LPC_HICR2_IBFIE3);
 			return;
 		case 4:
-			regmap_update_bits(priv->map, LPC_HICRB, LPC_HICRB_IBFIF4,
-					   enable * LPC_HICRB_IBFIF4);
+			regmap_update_bits(priv->map, LPC_HICRB, LPC_HICRB_IBFIE4,
+					   enable * LPC_HICRB_IBFIE4);
 			return;
 		default:
 			pr_warn("%s: Unsupported channel: %d", __func__, kcs_bmc->channel);
-- 
2.27.0

