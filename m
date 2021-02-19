Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2DF331FABF
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Feb 2021 15:29:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231138AbhBSO2z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Feb 2021 09:28:55 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:60843 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231159AbhBSO2l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 19 Feb 2021 09:28:41 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 80A695803C9;
        Fri, 19 Feb 2021 09:27:55 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 19 Feb 2021 09:27:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=eL52M44QaOmJ7
        n12M9JEL6DbKLp7KlrpIC3D8X1iNrs=; b=X4ME8ayqGC12R6dtdvODWFoxpFULE
        DllcaPqKbK7xoPEssDM6+e0cTI31Oxi5MuTJ5prdLO0wE3lwQEqIA3miJjtbWe5n
        fowAwcES3TkL+uSWQvxS8J4QPRWOXtF3lzDuoSFJoECWvqalW4Z4fiuePrYpsXdB
        lIo5scrTh1vIUStXZT4OhmNHBArdl+y7vH9oYV3C6TknsU7r2kViL1QSJ3IStMDJ
        fMwanTZjIbfHMOIvCCb3mTqHvJemFZNHXD+X+Gs6w0YdcrrJ+ATC3pwxO+xEdHRk
        3h1OdBBwlYAf3kVs0orp6FYTssmXSfdRWTScA2uo1yvxwC5znLeVDEbTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=eL52M44QaOmJ7n12M9JEL6DbKLp7KlrpIC3D8X1iNrs=; b=gowFrtOT
        1B3A2cT3y41aG5b0mAkKwbMRq5R1o6LYcL7jMqmbx6cQCg7Kdv/Qb+pe+nQhcciD
        VM3pG1ivGS0sZpIvnK7zyTMggGPkiwO6VKTpMMBMdECX4wvqWaU3d/TVgJhV2wRB
        dZqJDHclchyD/tYJTMMefZ8iRcI3JktKetrCDEhRLgGT2dD10TVvNZF6P7BJF565
        JSRfmeopv6uN5RMLAzpUqlMsKJZpCcOoPm2cvnjaKoMo3X4aLbNodQ5u2WUalbgt
        i/lrUT4L7OdXd/w9GQnPa8H+Y11ZGtiGmn430hgmjY4Ktho4kAmLo1yzI+kHva3p
        bO+jTif9TGID8w==
X-ME-Sender: <xms:68ovYHggMngx3kU0_qSAGNkEvpAlh8VbusJdVIqpXpOJxBDZhUBp1g>
    <xme:68ovYEC_GX0CKk5R2cyULx2YXgiQmxqeGt1HqJaiZ4rZVLelnqvZ9uFmz76lwrPBr
    E7AahfxfJ3o2w1S0w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrjeeigdeigecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
    rdhiugdrrghuqeenucggtffrrghtthgvrhhnpeejgfdvveehteekveeggeellefgleette
    ejffelffdvudduveeiffegteelvefhteenucfkphepudegrddvrdeluddrfeejnecuvehl
    uhhsthgvrhfuihiivgepuddunecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfi
    esrghjrdhiugdrrghu
X-ME-Proxy: <xmx:68ovYHFGKizQv4Vo0kIHnnS7Uwips8nsiHahb77H0tFcHYIyYpMXlA>
    <xmx:68ovYETwWPwyGq2HghhbDcncpoVDxg0zb3i-IiAnuucH6S5GLut1dw>
    <xmx:68ovYEwprwx9ptr_c6utLjmhNZON3jf-RoquAehbk8wAxMrb6T7tbw>
    <xmx:68ovYJglG8YNfNo-eUNH4b64sUM9jJXlgoQh1FIo5M_Gg9RwwmtY_g>
Received: from localhost.localdomain (ppp14-2-91-37.adl-apt-pir-bras31.tpg.internode.on.net [14.2.91.37])
        by mail.messagingengine.com (Postfix) with ESMTPA id DBA8B240057;
        Fri, 19 Feb 2021 09:27:48 -0500 (EST)
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
Subject: [PATCH 19/19] ipmi: kcs_bmc_aspeed: Fix IBFIE typo from datasheet
Date:   Sat, 20 Feb 2021 00:55:23 +1030
Message-Id: <20210219142523.3464540-20-andrew@aj.id.au>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210219142523.3464540-1-andrew@aj.id.au>
References: <20210219142523.3464540-1-andrew@aj.id.au>
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
index 649d795a5a75..155f68b08eb9 100644
--- a/drivers/char/ipmi/kcs_bmc_aspeed.c
+++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
@@ -34,9 +34,9 @@
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
@@ -68,7 +68,7 @@
 #define LPC_STR2             0x040
 #define LPC_STR3             0x044
 #define LPC_HICRB            0x100
-#define     LPC_HICRB_IBFIF4         BIT(1)
+#define     LPC_HICRB_IBFIE4         BIT(1)
 #define     LPC_HICRB_LPC4E          BIT(0)
 #define LPC_HICRC            0x104
 #define     LPC_HICRC_ID4IRQX_MASK   GENMASK(7, 4)
@@ -339,20 +339,20 @@ static void aspeed_kcs_irq_mask_update(struct kcs_bmc_device *kcs_bmc, u8 mask,
 
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

