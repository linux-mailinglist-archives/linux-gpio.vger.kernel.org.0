Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D907D341574
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Mar 2021 07:29:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233963AbhCSG3K (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Mar 2021 02:29:10 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:41521 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233957AbhCSG2h (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 19 Mar 2021 02:28:37 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 0E7FB580A7C;
        Fri, 19 Mar 2021 02:28:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 19 Mar 2021 02:28:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=3rglRCF2+66zH
        KVRZ4boDJXOEtO8m9hvabADBH87BCQ=; b=OCmJLCs4g7q1/uXGIYjxhtHRAMwpJ
        MDuR7EJpwmYZPttmVjsipap02dNAwYtDVS3ji9A5IETgNYLJ397OcoRUiEcKix1s
        cJJbILPpuEpcQWmLPslWgV6/uQK5N4Tt8vr/XgeZ/RNKkUadcEmzEAVVCmY31KMu
        I0lJ2qfhcjrktRAhUK/v9Pm4DAZErB637f7Mwn8XaEe/Cf326Aw3uoGx+kN8jqfv
        OAtbpXJrQMUvp4a5xNQLRf3yiw0bibq1uicW5iVBM117P0lUhf1T+6xWVyyqEbO9
        bWvVxZndmZCXXTegYtfPXY4hxnO5PeTnofT8Vx7ouxg+LYJ1JELWyHL3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=3rglRCF2+66zHKVRZ4boDJXOEtO8m9hvabADBH87BCQ=; b=LqTz8BGA
        hDUGtrL4/ajCM3j9kl665R82qFQnrLOiRQVVRBk1KhD5uleW8s9+Zzf3Rsb15H5e
        AaIel1xvJDtYN3nc0RtdVgdPHpyBTx8ZTdV3E3YFMBISDyJr936YfPUo6/JAYxb5
        PxVb+mWvzZL1RTOyaccqnFaKxuqa1j2qQpCgbXshYnnTgXZ44H15iQHz7Xhlhc3e
        Vs8SAJlZDOeR6L4/3oFUc9rZs5xFgtf2zBHFSCf7KJBoz47zh7YNyp7a5HwRMvSR
        pjpT+0VVxUZKgOMN1ocEFVVwGanYamLbk/miJWshO48Og25FIIrd9P98xradh+F4
        RQU5QgDF4TgOqw==
X-ME-Sender: <xms:lERUYDm76GeCzQJtceZSGCCA53pQmjRl2qU4-nk-fXCP9ncPUp4nCg>
    <xme:lERUYG0Jz6SZtaDFU28jsaeAfZm72DO0s5w_WU9OeDYcIVprZaoaYYLQGsscJzBJv
    C32XnR3QQVwiiTvcQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefjedgleehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeetnhgurhgv
    ficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrghtth
    gvrhhnpeejgfdvveehteekveeggeellefgleetteejffelffdvudduveeiffegteelvefh
    teenucfkphepuddukedrvddutddrudekuddrheehnecuvehluhhsthgvrhfuihiivgepud
    enucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:lERUYJpJe1ypQskdHwMh30yZLLphuMQ-Bf54SXhxhqGzlOGwHkyyBw>
    <xmx:lERUYLkees89apBR6wFMEEh0PoXsPGrJ0Z5Vc42-9HS-8HW1uQlL2Q>
    <xmx:lERUYB0PaQv5FvEM2cGNgtLOdbI5lR9TV4TD6NoJsZhsCW0MU0Q3Dg>
    <xmx:lURUYN526DlGWIh701Iy9bA8J2gy83SKRQF4P_8_29gLfAEboAOcuA>
Received: from localhost.localdomain (ppp118-210-181-55.adl-adc-lon-bras34.tpg.internode.on.net [118.210.181.55])
        by mail.messagingengine.com (Postfix) with ESMTPA id EC605240054;
        Fri, 19 Mar 2021 02:28:30 -0400 (EDT)
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
        linux-arm-kernel@lists.infradead.org, benjaminfair@google.com,
        Haiyue Wang <haiyue.wang@linux.intel.com>
Subject: [PATCH v2 03/21] ipmi: kcs: aspeed: Adapt to new LPC DTS layout
Date:   Fri, 19 Mar 2021 16:57:34 +1030
Message-Id: <20210319062752.145730-3-andrew@aj.id.au>
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
Acked-by: Haiyue Wang <haiyue.wang@linux.intel.com>
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

