Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA878341579
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Mar 2021 07:29:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234043AbhCSG3L (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Mar 2021 02:29:11 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:46915 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234032AbhCSG2t (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 19 Mar 2021 02:28:49 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id C1BFB580A7A;
        Fri, 19 Mar 2021 02:28:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 19 Mar 2021 02:28:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=jXk9X+CpMGc9m
        2udSUAL4q3h08wm/yg9nEbrKHZ03A8=; b=bmx//uygFN4zHRjJ5Zr03MlO2eTtk
        9EmHFtxEBjdMW4pY6QJXaWtAfulM/ErlpAO8XKshGvlz82zROxsPQthpH3TtwJbR
        gVefHJWTwN8cxhO2A2U446rqTwm+D/fCt5LuA4loQtJEbrzkxZLiom0oUOcJXiej
        G7Ojy4De9Em1jbZe+B19nONuxybUTix4hOyffBoyHmg8wE7EgYFqBJZ5n1gyA125
        shl7XFu6n/dmCcYZxFCF5/bn1MFRA3Sg5xNvQkbON9LPP6cZvNJDdlgCEorsDS4v
        iay6saGpoRIy610XYnccVRI00X129J77qK4AmXmkY3Nd9uGLVeb+fk2lw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=jXk9X+CpMGc9m2udSUAL4q3h08wm/yg9nEbrKHZ03A8=; b=j73iwh1P
        hSxlkrMqS4TDwnru5fwJOE5SGfBI+mqm5RVA7lu3Apu+4BHhqBEE61YoEUvjSA+z
        rc5ELZb61vP/wHHOiEq1UiCI3tOkOknHFlaqKs4MkrXUzhGJJGxKYvDzIOck9zrn
        K11mCrWsjzxSW3k8AtDYqWHxB9z1G0mBAmI22FM5M8OlGahR/GSLofBqNv3jD6fX
        b4bTaD1lEasydFlAurNwxy726hDXYRvNmXY/VyPLGuSXpED7o79uPYpYp4dY5Y1y
        SkKtiogwCamge/0ILgqlCI4KVJPad7HTwmZRG2m35EC4OU8tULTyZHOt6Rih6FLv
        2zKfwqDbmKr0tA==
X-ME-Sender: <xms:oERUYBltM7qHpJN4Fa_euZtEy03mxCpD8YQr4sSbgO7aeYcZJ9DxiA>
    <xme:oERUYM0F7ARSmqCf1SzZi4JbtRnlnfbzftLP_xQKkPkeOTsIfCJQV_nYGyeF-3OYD
    xkhi3SAgmfOH8CO8A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefjedgleehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeetnhgurhgv
    ficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrghtth
    gvrhhnpeejgfdvveehteekveeggeellefgleetteejffelffdvudduveeiffegteelvefh
    teenucfkphepuddukedrvddutddrudekuddrheehnecuvehluhhsthgvrhfuihiivgepfe
    enucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:oERUYHr-EDw-KoeHCJLO5EvBZrJyreBppsICOdGjGuixCGfu631TKA>
    <xmx:oERUYBliOYGGS7BcaBuUzrzlacxD2uBuK2YorjaTg5LvtoTE_2IhnA>
    <xmx:oERUYP3-4OzsRV5bO9qGELyM27Gb2L0JzZAkvvrcX3DhbL5BGUtxtw>
    <xmx:oERUYAHSuwihUsu7UhQ3JVItaWriDn0uNlprun5nfxnbD9AIGPBL0g>
Received: from localhost.localdomain (ppp118-210-181-55.adl-adc-lon-bras34.tpg.internode.on.net [118.210.181.55])
        by mail.messagingengine.com (Postfix) with ESMTPA id 31253240054;
        Fri, 19 Mar 2021 02:28:42 -0400 (EDT)
From:   Andrew Jeffery <andrew@aj.id.au>
To:     openipmi-developer@lists.sourceforge.net, openbmc@lists.ozlabs.org,
        minyard@acm.org
Cc:     joel@jms.id.au, ryan_chen@aspeedtech.com,
        "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>,
        devicetree@vger.kernel.org, tmaimon77@gmail.com,
        linux-aspeed@lists.ozlabs.org, linux-gpio@vger.kernel.org,
        avifishman70@gmail.com, venture@google.com,
        linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
        tali.perry1@gmail.com, robh+dt@kernel.org, lee.jones@linaro.org,
        linux-arm-kernel@lists.infradead.org, benjaminfair@google.com
Subject: [PATCH v2 05/21] soc: aspeed: Adapt to new LPC device tree layout
Date:   Fri, 19 Mar 2021 16:57:36 +1030
Message-Id: <20210319062752.145730-5-andrew@aj.id.au>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210319062752.145730-1-andrew@aj.id.au>
References: <20210319062752.145730-1-andrew@aj.id.au>
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
index 20acac6342ef..210455efb321 100644
--- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
+++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
@@ -29,26 +29,25 @@
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
 
@@ -260,6 +259,7 @@ static int aspeed_lpc_snoop_probe(struct platform_device *pdev)
 {
 	struct aspeed_lpc_snoop *lpc_snoop;
 	struct device *dev;
+	struct device_node *np;
 	u32 port;
 	int rc;
 
@@ -269,8 +269,15 @@ static int aspeed_lpc_snoop_probe(struct platform_device *pdev)
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

