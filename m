Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76ED531FA91
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Feb 2021 15:28:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230354AbhBSO1C (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Feb 2021 09:27:02 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:51125 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229636AbhBSO0w (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 19 Feb 2021 09:26:52 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 1654E580367;
        Fri, 19 Feb 2021 09:26:06 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 19 Feb 2021 09:26:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=8f7naV3t492m2
        6tJiqvpMdtN6bec5zlRMxz/eLIINok=; b=RTO8+duai9Z/7ITJpiq/rzQF2B5hL
        XkHKHOwbu4qF95ISU+FRiS5cEsC/sDJcsMVLzjgHCVKG3I4ywSaasp96PKJ5j5CW
        CsanyzcHQA/6YAk2RytYu0XKPCannn1wjgU2t3QpcDtkKxw1GU2OVmdntVFwIN8B
        pjtlUfYfHb+FuWEjwUIQqhn3auNxfH0g6WxJsu0fdps58sFCgDn/0ALJ/bskja+K
        aJXMt1AYpaRLCvJwJFFCmeV6GK4qyZqvr84PnYhNU7GIx026rrpXJ75ujHN+VM04
        n0eBsLVfESzi2VNET8+KQuCKZ6Wqeo/A7HwbOXBF20QVeO1pzqvyVjkYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=8f7naV3t492m26tJiqvpMdtN6bec5zlRMxz/eLIINok=; b=BBO74844
        UPCEhEG0ST207xR0WwS6wMF0xQQsbC3zW0TLFVtanMzQ28yS0nD4gHHAhcIbiGcZ
        Ry06MJD9FPMJL+6qyr3BZsdMZp1dtdnDeYUANY+7BYgPUk8HI7COHkPhz7j799bU
        4+MzgNwyuoBx+IscnoJo3fl9z41mH3nJ0fGcK/Vgo+DXcGPv4ShFsfvrTm/FOuSk
        3+tozBNYzKcz1p8wDCn35Q7KfMo5tdHKawBE2+mx7Y15gl7jyf8im1piPMMzJ3op
        cBWanLWK3QXQ07NqHwJ4gXo69xsDnqVLGDvNyXsAE/uJEEJfqGWEdcTPfOI7lU8d
        vlrxBRZdwk6A7g==
X-ME-Sender: <xms:e8ovYGr_PuI4SR3VfsyJU0da_rsZYDaraE2Y8TV0AFgW_sMdSZbS1w>
    <xme:e8ovYCcKJCk4uJhaelSd24cSunyLRjcioG9zcOQrdfTeMXQ6EHMmCX1Bn9l1sUgLM
    HBXebSBK-M4SbX0Lg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrjeeigdeifecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomheptehnughrvgif
    ucflvghffhgvrhihuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrfgrthhtvg
    hrnhepjefgvdevheetkeevgeegleelgfelteetjeffleffvdduudevieffgeetleevhfet
    necukfhppedugedrvddrledurdefjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:e8ovYFqSrMDeerYToCsMINUzXkvsNVK0yyZrC7g2aOH3VHnjWfFUJQ>
    <xmx:e8ovYDF6hVpK6fdezL13A_Vk0Y8mJprnpEY8fH4MqdaleZq4TuvfPA>
    <xmx:e8ovYFsgtCFP2UatsCf1lUVL9FAD982wivtUnmuK7a8C0NNUy8aWJQ>
    <xmx:fsovYGwGVuzH-t7ZP3lMJ24oV_lO2ekhCESebRxFL0v8TAxEdeZiwQ>
Received: from localhost.localdomain (ppp14-2-91-37.adl-apt-pir-bras31.tpg.internode.on.net [14.2.91.37])
        by mail.messagingengine.com (Postfix) with ESMTPA id 19385240064;
        Fri, 19 Feb 2021 09:25:56 -0500 (EST)
From:   Andrew Jeffery <andrew@aj.id.au>
To:     openipmi-developer@lists.sourceforge.net, openbmc@lists.ozlabs.org,
        minyard@acm.org
Cc:     "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>, robh+dt@kernel.org,
        joel@jms.id.au, lee.jones@linaro.org, avifishman70@gmail.com,
        tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
        yuenn@google.com, benjaminfair@google.com,
        linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-gpio@vger.kernel.org,
        Haiyue Wang <haiyue.wang@linux.intel.com>,
        Corey Minyard <cminyard@mvista.com>
Subject: [PATCH 03/19] ipmi: kcs: aspeed: Adapt to new LPC DTS layout
Date:   Sat, 20 Feb 2021 00:55:07 +1030
Message-Id: <20210219142523.3464540-4-andrew@aj.id.au>
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
Acked-by: Haiyue Wang <haiyue.wang@linux.intel.com>
Acked-by: Corey Minyard <cminyard@mvista.com>
---
 drivers/char/ipmi/kcs_bmc_aspeed.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bmc_aspeed.c
index a140203c079b..eefe362f65f0 100644
--- a/drivers/char/ipmi/kcs_bmc_aspeed.c
+++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
@@ -27,7 +27,6 @@
 
 #define KCS_CHANNEL_MAX     4
 
-/* mapped to lpc-bmc@0 IO space */
 #define LPC_HICR0            0x000
 #define     LPC_HICR0_LPC3E          BIT(7)
 #define     LPC_HICR0_LPC2E          BIT(6)
@@ -52,15 +51,13 @@
 #define LPC_STR1             0x03C
 #define LPC_STR2             0x040
 #define LPC_STR3             0x044
-
-/* mapped to lpc-host@80 IO space */
-#define LPC_HICRB            0x080
+#define LPC_HICRB            0x100
 #define     LPC_HICRB_IBFIF4         BIT(1)
 #define     LPC_HICRB_LPC4E          BIT(0)
-#define LPC_LADR4            0x090
-#define LPC_IDR4             0x094
-#define LPC_ODR4             0x098
-#define LPC_STR4             0x09C
+#define LPC_LADR4            0x110
+#define LPC_IDR4             0x114
+#define LPC_ODR4             0x118
+#define LPC_STR4             0x11C
 
 struct aspeed_kcs_bmc {
 	struct regmap *map;
@@ -348,12 +345,20 @@ static int aspeed_kcs_probe(struct platform_device *pdev)
 	struct device_node *np;
 	int rc;
 
-	np = pdev->dev.of_node;
+	np = dev->of_node->parent;
+	if (!of_device_is_compatible(np, "aspeed,ast2400-lpc-v2") &&
+	    !of_device_is_compatible(np, "aspeed,ast2500-lpc-v2") &&
+	    !of_device_is_compatible(np, "aspeed,ast2600-lpc-v2")) {
+		dev_err(dev, "unsupported LPC device binding\n");
+		return -ENODEV;
+	}
+
+	np = dev->of_node;
 	if (of_device_is_compatible(np, "aspeed,ast2400-kcs-bmc") ||
-			of_device_is_compatible(np, "aspeed,ast2500-kcs-bmc"))
+	    of_device_is_compatible(np, "aspeed,ast2500-kcs-bmc"))
 		kcs_bmc = aspeed_kcs_probe_of_v1(pdev);
 	else if (of_device_is_compatible(np, "aspeed,ast2400-kcs-bmc-v2") ||
-			of_device_is_compatible(np, "aspeed,ast2500-kcs-bmc-v2"))
+		 of_device_is_compatible(np, "aspeed,ast2500-kcs-bmc-v2"))
 		kcs_bmc = aspeed_kcs_probe_of_v2(pdev);
 	else
 		return -EINVAL;
-- 
2.27.0

