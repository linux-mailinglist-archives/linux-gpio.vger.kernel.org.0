Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 254FD31FAA1
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Feb 2021 15:28:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230490AbhBSO1u (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Feb 2021 09:27:50 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:60447 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230471AbhBSO1k (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 19 Feb 2021 09:27:40 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id BF0DF58036E;
        Fri, 19 Feb 2021 09:26:17 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 19 Feb 2021 09:26:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=jNbBcvWLt+Jil
        WCwRd5v7udB5/AUekeRtyC2gytq2FQ=; b=KlsYLZ8ehpfqswl6zhzIoRvnIgcd+
        k+10oSI816Qc8gCxdZh1kI4nIKnuMhvqiEEm6nYKEnT14g6bxIto99YYgZ/LFbg5
        IuvSDPGgXPJPHCpoX4h4c1nbvEBZyKjdlpGspdM74JuPjbjqk74xatQOd5dw0cs8
        hVkI/T+9fK7BZc1G5sdUIoAgyWc1sef9+0lI24K+GOTAq6G1XbrTWdQv3pMKScaa
        2vF1hsJUs4f1hcoU3sTArFVCN9Ca4p2+WeBxBSAYbrlNBk/rccjRVHGgcMCJqX7J
        It1+i5p556ghKTlSfgFq48zqZniQ64Xt1l6qb3aQ82uVNniVO5Oq/jNAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=jNbBcvWLt+JilWCwRd5v7udB5/AUekeRtyC2gytq2FQ=; b=AUyrovFL
        E7wE3KfsZ2+NxCCXkL8v2TwTd3GdQT58jkRS7OaXSGYuopDrc5LCrB0JbwVFSY9z
        DYvfb8tbR6IWPsf/KkLTs+DO9w/wmmdSDgDpDDQ+QaOBSf6hQp+EotEZdiSGDLU9
        LNfOg0wcPHjsRjbCjDFKm9YVAQs9ZesrvAmzXubkzEpDbFnjYZSGGbJElQJCDRYi
        JcTIpMByhgkzkPqXXlPFR6XWw5tjT7ARIPXR9aCzxOrQrG3alqX8D4PokdgQ2niU
        npcEmWBNwLvBzZu7LE+26B/TIzQjLNgepLYCbB1WzxwG6txqnDWYQcG+EDk9eaJ3
        OBkkDPf8IpMKtw==
X-ME-Sender: <xms:icovYD9I1TG4Ti2Eo6Y9ZH1xjGsvR1nPXz73JLmW2AJxqdgmN1rAoQ>
    <xme:icovYFv8X-uokxIW9tweuNKp-aiCySZgzPLO8qcfjVTzqydjTCb-QAeF3TJmN6ka7
    iS5GSCeVIf9-M3TeA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrjeeigdeifecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomheptehnughrvgif
    ucflvghffhgvrhihuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrfgrthhtvg
    hrnhepjefgvdevheetkeevgeegleelgfelteetjeffleffvdduudevieffgeetleevhfet
    necukfhppedugedrvddrledurdefjeenucevlhhushhtvghrufhiiigvpedunecurfgrrh
    grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:icovYOoqxTaDd78x_HViVss_lXQz4iKqrFVSAiwGTHrllwrIkiBNsQ>
    <xmx:icovYKnKExqKumvRjfmIzF37_30hDwunUAVA6jijbUgkZ4EDonaEOw>
    <xmx:icovYKydEy5i3Oewt9juYhP5nzQBzUhcplVBtRwoy4pERWlPBWl6Hw>
    <xmx:icovYBrnWSJfsULUCr1wm43SujNH0v7rJuH71FxmShiR7Xq-TCnztg>
Received: from localhost.localdomain (ppp14-2-91-37.adl-apt-pir-bras31.tpg.internode.on.net [14.2.91.37])
        by mail.messagingengine.com (Postfix) with ESMTPA id 5180F24005A;
        Fri, 19 Feb 2021 09:26:11 -0500 (EST)
From:   Andrew Jeffery <andrew@aj.id.au>
To:     openipmi-developer@lists.sourceforge.net, openbmc@lists.ozlabs.org,
        minyard@acm.org
Cc:     "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>, robh+dt@kernel.org,
        joel@jms.id.au, lee.jones@linaro.org, avifishman70@gmail.com,
        tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
        yuenn@google.com, benjaminfair@google.com,
        linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-gpio@vger.kernel.org
Subject: [PATCH 05/19] soc: aspeed: Adapt to new LPC device tree layout
Date:   Sat, 20 Feb 2021 00:55:09 +1030
Message-Id: <20210219142523.3464540-6-andrew@aj.id.au>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210219142523.3464540-1-andrew@aj.id.au>
References: <20210219142523.3464540-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>

Add check against LPC device v2 compatible string to
ensure that the fixed device tree layout is adopted.
The LPC register offsets are also fixed accordingly.

Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
Tested-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/soc/aspeed/aspeed-lpc-ctrl.c  | 20 ++++++++++++++------
 drivers/soc/aspeed/aspeed-lpc-snoop.c | 23 +++++++++++++++--------
 2 files changed, 29 insertions(+), 14 deletions(-)

diff --git a/drivers/soc/aspeed/aspeed-lpc-ctrl.c b/drivers/soc/aspeed/aspeed-lpc-ctrl.c
index 439bcd6b8c4a..c557ffd0992c 100644
--- a/drivers/soc/aspeed/aspeed-lpc-ctrl.c
+++ b/drivers/soc/aspeed/aspeed-lpc-ctrl.c
@@ -18,15 +18,15 @@
 
 #define DEVICE_NAME	"aspeed-lpc-ctrl"
 
-#define HICR5 0x0
+#define HICR5 0x80
 #define HICR5_ENL2H	BIT(8)
 #define HICR5_ENFWH	BIT(10)
 
-#define HICR6 0x4
+#define HICR6 0x84
 #define SW_FWH2AHB	BIT(17)
 
-#define HICR7 0x8
-#define HICR8 0xc
+#define HICR7 0x88
+#define HICR8 0x8c
 
 struct aspeed_lpc_ctrl {
 	struct miscdevice	miscdev;
@@ -215,6 +215,7 @@ static int aspeed_lpc_ctrl_probe(struct platform_device *pdev)
 	struct device_node *node;
 	struct resource resm;
 	struct device *dev;
+	struct device_node *np;
 	int rc;
 
 	dev = &pdev->dev;
@@ -270,8 +271,15 @@ static int aspeed_lpc_ctrl_probe(struct platform_device *pdev)
 		}
 	}
 
-	lpc_ctrl->regmap = syscon_node_to_regmap(
-			pdev->dev.parent->of_node);
+	np = pdev->dev.parent->of_node;
+	if (!of_device_is_compatible(np, "aspeed,ast2400-lpc-v2") &&
+	    !of_device_is_compatible(np, "aspeed,ast2500-lpc-v2") &&
+	    !of_device_is_compatible(np, "aspeed,ast2600-lpc-v2")) {
+		dev_err(dev, "unsupported LPC device binding\n");
+		return -ENODEV;
+	}
+
+	lpc_ctrl->regmap = syscon_node_to_regmap(np);
 	if (IS_ERR(lpc_ctrl->regmap)) {
 		dev_err(dev, "Couldn't get regmap\n");
 		return -ENODEV;
diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
index 682ba0eb4eba..ab0f0a54fea6 100644
--- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
+++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
@@ -28,26 +28,25 @@
 #define NUM_SNOOP_CHANNELS 2
 #define SNOOP_FIFO_SIZE 2048
 
-#define HICR5	0x0
+#define HICR5	0x80
 #define HICR5_EN_SNP0W		BIT(0)
 #define HICR5_ENINT_SNP0W	BIT(1)
 #define HICR5_EN_SNP1W		BIT(2)
 #define HICR5_ENINT_SNP1W	BIT(3)
-
-#define HICR6	0x4
+#define HICR6	0x84
 #define HICR6_STR_SNP0W		BIT(0)
 #define HICR6_STR_SNP1W		BIT(1)
-#define SNPWADR	0x10
+#define SNPWADR	0x90
 #define SNPWADR_CH0_MASK	GENMASK(15, 0)
 #define SNPWADR_CH0_SHIFT	0
 #define SNPWADR_CH1_MASK	GENMASK(31, 16)
 #define SNPWADR_CH1_SHIFT	16
-#define SNPWDR	0x14
+#define SNPWDR	0x94
 #define SNPWDR_CH0_MASK		GENMASK(7, 0)
 #define SNPWDR_CH0_SHIFT	0
 #define SNPWDR_CH1_MASK		GENMASK(15, 8)
 #define SNPWDR_CH1_SHIFT	8
-#define HICRB	0x80
+#define HICRB	0x100
 #define HICRB_ENSNP0D		BIT(14)
 #define HICRB_ENSNP1D		BIT(15)
 
@@ -258,6 +257,7 @@ static int aspeed_lpc_snoop_probe(struct platform_device *pdev)
 {
 	struct aspeed_lpc_snoop *lpc_snoop;
 	struct device *dev;
+	struct device_node *np;
 	u32 port;
 	int rc;
 
@@ -267,8 +267,15 @@ static int aspeed_lpc_snoop_probe(struct platform_device *pdev)
 	if (!lpc_snoop)
 		return -ENOMEM;
 
-	lpc_snoop->regmap = syscon_node_to_regmap(
-			pdev->dev.parent->of_node);
+	np = pdev->dev.parent->of_node;
+	if (!of_device_is_compatible(np, "aspeed,ast2400-lpc-v2") &&
+	    !of_device_is_compatible(np, "aspeed,ast2500-lpc-v2") &&
+	    !of_device_is_compatible(np, "aspeed,ast2600-lpc-v2")) {
+		dev_err(dev, "unsupported LPC device binding\n");
+		return -ENODEV;
+	}
+
+	lpc_snoop->regmap = syscon_node_to_regmap(np);
 	if (IS_ERR(lpc_snoop->regmap)) {
 		dev_err(dev, "Couldn't get regmap\n");
 		return -ENODEV;
-- 
2.27.0

