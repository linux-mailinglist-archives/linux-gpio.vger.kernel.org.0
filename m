Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46F77341577
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Mar 2021 07:29:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234040AbhCSG3K (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Mar 2021 02:29:10 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:55211 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233937AbhCSG2n (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 19 Mar 2021 02:28:43 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id C1F40580A7F;
        Fri, 19 Mar 2021 02:28:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 19 Mar 2021 02:28:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=sic3qYlOCrq3L
        +pvEQYeldSvAa2Qy+Xy8lgLaF/EF40=; b=hODnRte/FtT1Aaf25m+nUpIsfLOmq
        E2bOshf1RD+Trr8qtHai6iDdVPuW7zrzuzHHlg9nNbAZlBdYiPVbshOFMSLIp+8q
        NmfqJ42/HFi+eMBC62U5XOWqFV1MUKX5TzEytDNP5gMduhXnjuwtq7HpxFbtTG4l
        SPcsCJorPa0cPgAYrSdWph0rz+yclBaCZ5eAwbv/838XKITSUFhE21W9CyXqyknm
        +MFkL76NTghRogIVKEjAzUlrHlWInB1RROymNdgXg1u9cnPf6tfNmGjkS+N1IDdI
        iF+S4CEAVxw2D433EvA0ZECL4H4v84MRVquQyImJ4jMZkSJzWqm+rmwkg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=sic3qYlOCrq3L+pvEQYeldSvAa2Qy+Xy8lgLaF/EF40=; b=jWpyY1GC
        mffDjfEx9SJn4iKY3jQDrqEq9y9dGlgfQrzBQM+sohwMnweR+7e47e3B8Rx90+JS
        Erwm5BSONeYAAk12IxKsgRFVFSwgX3NJVgWBhs7alXB2TF832R81DPTvaWFVe4VW
        SJ2DETmEDM7pU31vur+PW3t2KnsBiNY0uShBu/boWy2cYUtosT94V8H02peakQQC
        nEAPcVekVqp+If4guezmhbkD3+pUbwAZSIWqQeud67Gh78+ZiPDAAsPuFhjSaEUd
        rYxz+ipAvCwl40RKsbX11TPVsGSJobqyKeI85xXztOr4/7SFxq80JVfc49+UHjFK
        p5iSy3NBG1c8Mw==
X-ME-Sender: <xms:mkRUYCIq35iFQKpVxZTfyNRsePp9Sgi7V-JtyrjK1TIMIOdD2RURYg>
    <xme:mkRUYKKYLTIbgWr1G8s1fewV9h0vPH-iXv99_voTiQdgpbG1ojrubJHQ1p7e0ajO7
    9znTXBhR8QB7xpZag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefjedgleehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeetnhgurhgv
    ficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrghtth
    gvrhhnpeejgfdvveehteekveeggeellefgleetteejffelffdvudduveeiffegteelvefh
    teenucfkphepuddukedrvddutddrudekuddrheehnecuvehluhhsthgvrhfuihiivgepvd
    enucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:mkRUYCvhQ33mQqgNLMcOv2yGmKaG9zfUg6gI3nXWsiWATaYr3lTnjQ>
    <xmx:mkRUYHbtunRPZGfXQm-ONk6dCbWObR-F9ybB5M5KzBO6KB35afaDng>
    <xmx:mkRUYJbj-h3e92wCRxmu1OxU_FXTzFZfuuSzOwA4Cr96gAVUV-8Dvw>
    <xmx:mkRUYBKQuUTsmBKmbMnO3rPrlTaBJ_7BaWLygMttcou72b71zJ5ktw>
Received: from localhost.localdomain (ppp118-210-181-55.adl-adc-lon-bras34.tpg.internode.on.net [118.210.181.55])
        by mail.messagingengine.com (Postfix) with ESMTPA id 35E67240054;
        Fri, 19 Mar 2021 02:28:36 -0400 (EDT)
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
Subject: [PATCH v2 04/21] pinctrl: aspeed-g5: Adapt to new LPC device tree layout
Date:   Fri, 19 Mar 2021 16:57:35 +1030
Message-Id: <20210319062752.145730-4-andrew@aj.id.au>
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
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
index 0cab4c2576e2..996ebcba4d38 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
@@ -60,7 +60,7 @@
 #define COND2		{ ASPEED_IP_SCU, SCU94, GENMASK(1, 0), 0, 0 }
 
 /* LHCR0 is offset from the end of the H8S/2168-compatible registers */
-#define LHCR0		0x20
+#define LHCR0		0xa0
 #define GFX064		0x64
 
 #define B14 0
@@ -2648,14 +2648,19 @@ static struct regmap *aspeed_g5_acquire_regmap(struct aspeed_pinmux_data *ctx,
 	}
 
 	if (ip == ASPEED_IP_LPC) {
-		struct device_node *node;
+		struct device_node *np;
 		struct regmap *map;
 
-		node = of_parse_phandle(ctx->dev->of_node,
+		np = of_parse_phandle(ctx->dev->of_node,
 					"aspeed,external-nodes", 1);
-		if (node) {
-			map = syscon_node_to_regmap(node->parent);
-			of_node_put(node);
+		if (np) {
+			if (!of_device_is_compatible(np->parent, "aspeed,ast2400-lpc-v2") &&
+			    !of_device_is_compatible(np->parent, "aspeed,ast2500-lpc-v2") &&
+			    !of_device_is_compatible(np->parent, "aspeed,ast2600-lpc-v2"))
+				return ERR_PTR(-ENODEV);
+
+			map = syscon_node_to_regmap(np->parent);
+			of_node_put(np);
 			if (IS_ERR(map))
 				return map;
 		} else
-- 
2.27.0

