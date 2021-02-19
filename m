Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0830931FA95
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Feb 2021 15:28:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230401AbhBSO1H (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Feb 2021 09:27:07 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:36607 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230306AbhBSO06 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 19 Feb 2021 09:26:58 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.nyi.internal (Postfix) with ESMTP id DFD7A5802B3;
        Fri, 19 Feb 2021 09:26:10 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Fri, 19 Feb 2021 09:26:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=ZNJkDZPQZ4qRn
        0dZpJLR1k4wVs6r2KrWIHEsDySJPvg=; b=DoEoen05zG2OW4jmMQPm7XJzX77J6
        S4Afnemd+rSyIi8BHWoJfFzWR1a8fBk/0liurwyUZK6tEtVS3lpMEjjGFRwHgv0Y
        WBVDlNGmmpP13evFb6Hzv/ZVBmeWq83yRiIwt3rfUOUjIJSGa7PAsJ/GtDUKHfT6
        zNn+Xfx8SlZ+glr7vBVuA6H14uglsMOs5qjfz1uwYzKOz5xml4YJj+SpMNGFFhmz
        efcLLEI2bRr25BmulLf6ifYt/dHPzURuEN/kMlHy5jFGJUufXAIvEeMO42ljT13v
        hulBKH0cvWDWVUfS9OxKpzROSOZkarBZGvFSz5XI+ruDGeyGrMupkJt1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=ZNJkDZPQZ4qRn0dZpJLR1k4wVs6r2KrWIHEsDySJPvg=; b=cv6gwc+I
        PJYNfTbWFHNDC8wHujEONVxLP2J2jpvpKpCUjiYYJJWnawgtBd2EzdxXS6i4qUqF
        dw/fYsuopEyyvq9YJHp3MKZWjxsWNeU/JvaNHLm4AJ6nsbEOdgxmLZiH1sKvRmxp
        xG9LZDSv0KOQawHXNxInNxA+XpDv0t8wTBNNAJKFxEnrwJ0ze/28+QBjpAbgSrnN
        FHoKonT8VTWnPIi4G/vwnw2L5IsSdeTELoikwx6KSBK/jtyg7BDYX2xD6nCkHXaB
        t1U9cMdqQKKI28iBZjn3XmT6NNVzjY7mDJyYQn2xFlxXLWJetxLV83PCOtEWkEHk
        xshzwQw2bXIcZw==
X-ME-Sender: <xms:gsovYI4vK-eLGP39pVPqfpF8X_q2u47E0hukAx5MGM6wX64G9UI58Q>
    <xme:gsovYPLcA0S1G0eJECoUq0suxIScElGHWat_XMvQuBkViES1OQ6xCirbty3a6g8b3
    SpxJMTZfd8zDLMewQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrjeeigdeigecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomheptehnughrvgif
    ucflvghffhgvrhihuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrfgrthhtvg
    hrnhepjefgvdevheetkeevgeegleelgfelteetjeffleffvdduudevieffgeetleevhfet
    necukfhppedugedrvddrledurdefjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:gsovYJIe0tF9hhD1Ouan36CpSbJ9X9gKxgs0mQJNbXGAolr4Czkf8g>
    <xmx:gsovYFUmzxx0HN6c9vHLJWt2FGmEO0MXD6Y0RCmkryydZu_RZ_YOpQ>
    <xmx:gsovYDj52ZQpbcYl3lfu_uoTs3c1s8wUkjF6LkMWDOYZ4_SUL4borw>
    <xmx:gsovYA6diHl5i84xvvE-jEBPZ2ZLjCAlSX_pNrX5KFYGl45hP1fDQQ>
Received: from localhost.localdomain (ppp14-2-91-37.adl-apt-pir-bras31.tpg.internode.on.net [14.2.91.37])
        by mail.messagingengine.com (Postfix) with ESMTPA id 8D7AC24005A;
        Fri, 19 Feb 2021 09:26:04 -0500 (EST)
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
Subject: [PATCH 04/19] pinctrl: aspeed-g5: Adapt to new LPC device tree layout
Date:   Sat, 20 Feb 2021 00:55:08 +1030
Message-Id: <20210219142523.3464540-5-andrew@aj.id.au>
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

