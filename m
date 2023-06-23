Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36EAB73C0F6
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jun 2023 22:46:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232471AbjFWUqb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Jun 2023 16:46:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232484AbjFWUqN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Jun 2023 16:46:13 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AFE930FC;
        Fri, 23 Jun 2023 13:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1687553093; x=1719089093;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x1O902oFsQeoK9oVLCWEt+1yrZVqoxGg87zjZmWY034=;
  b=kNfdiMHcoaAdTn6nH+86LE+oBrGnMseVtLOhFXU6Kji/VqEpY4D+ogIK
   U4QclNu9U7Q/UfyOjYD28OMp3ceyMtbq4J017Oa7r+XgObdhz6bmyNnQP
   GnRMvrAN9fQzHdr/W47OAoQ3tJVOX8Mv+2Bz+Ce+cR8VbG3jEPj3H5F27
   ZQAg7bGPyRRN8Rt44EBSDp2ftIMyRsi1XQADV8oOqZj8PFGxWeskGyS2d
   F24abUDrXnCLrvBE604PUJ2Lj84nqtYTyqaiyaF8EAyPnEC36rxnjqoHS
   UAWSRmZpaJgZgk3MtMRb+3stouwIfSQRR61zP2SJJnq89sI2MLqwIhROa
   Q==;
X-IronPort-AV: E=Sophos;i="6.01,153,1684825200"; 
   d="scan'208";a="217419442"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 23 Jun 2023 13:43:54 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 23 Jun 2023 13:43:37 -0700
Received: from che-lt-i67070.amer.actel.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Fri, 23 Jun 2023 13:43:08 -0700
From:   Varshini Rajendran <varshini.rajendran@microchip.com>
To:     <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <claudiu.beznea@microchip.com>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <vkoul@kernel.org>, <tglx@linutronix.de>, <maz@kernel.org>,
        <lee@kernel.org>, <ulf.hansson@linaro.org>,
        <tudor.ambarus@linaro.org>, <miquel.raynal@bootlin.com>,
        <richard@nod.at>, <vigneshr@ti.com>, <edumazet@google.com>,
        <kuba@kernel.org>, <pabeni@redhat.com>, <linus.walleij@linaro.org>,
        <p.zabel@pengutronix.de>, <olivia@selenic.com>,
        <a.zummo@towertech.it>, <radu_nicolae.pirea@upb.ro>,
        <richard.genoud@gmail.com>, <gregkh@linuxfoundation.org>,
        <lgirdwood@gmail.com>, <broonie@kernel.org>,
        <wim@linux-watchdog.org>, <linux@roeck-us.net>, <arnd@arndb.de>,
        <olof@lixom.net>, <soc@kernel.org>, <linux@armlinux.org.uk>,
        <sre@kernel.org>, <jerry.ray@microchip.com>,
        <horatiu.vultur@microchip.com>, <durai.manickamkr@microchip.com>,
        <varshini.rajendran@microchip.com>, <andrew@lunn.ch>,
        <alain.volmat@foss.st.com>, <neil.armstrong@linaro.org>,
        <mihai.sain@microchip.com>, <eugen.hristev@collabora.com>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-crypto@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
        <linux-mtd@lists.infradead.org>, <netdev@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <linux-serial@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <linux-usb@vger.kernel.org>,
        <linux-watchdog@vger.kernel.org>, <linux-pm@vger.kernel.org>
CC:     <Hari.PrasathGE@microchip.com>, <cristian.birsan@microchip.com>,
        <balamanikandan.gunasundar@microchip.com>,
        <manikandan.m@microchip.com>, <dharma.b@microchip.com>,
        <nayabbasha.sayed@microchip.com>, <balakrishnan.s@microchip.com>
Subject: [PATCH v2 25/45] dt-bindings: atmel-nand: add microchip,sam9x7-pmecc
Date:   Sat, 24 Jun 2023 02:00:36 +0530
Message-ID: <20230623203056.689705-26-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230623203056.689705-1-varshini.rajendran@microchip.com>
References: <20230623203056.689705-1-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add microchip,sam9x7-pmecc to DT bindings documentation.

Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
---
 Documentation/devicetree/bindings/mtd/atmel-nand.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mtd/atmel-nand.txt b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
index 50645828ac20..9c9dfab38fdf 100644
--- a/Documentation/devicetree/bindings/mtd/atmel-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
@@ -56,6 +56,7 @@ Required properties:
 	"atmel,sama5d4-pmecc"
 	"atmel,sama5d2-pmecc"
 	"microchip,sam9x60-pmecc"
+	"microchip,sam9x7-pmecc"
 - reg: should contain 2 register ranges. The first one is pointing to the PMECC
        block, and the second one to the PMECC_ERRLOC block.
 
-- 
2.25.1

