Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 431DB622441
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Nov 2022 07:56:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229817AbiKIG4h (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Nov 2022 01:56:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbiKIG4g (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Nov 2022 01:56:36 -0500
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A2AE1DA58;
        Tue,  8 Nov 2022 22:56:36 -0800 (PST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2A96uJrT034523;
        Wed, 9 Nov 2022 00:56:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1667976979;
        bh=cDGS+tQXKjWXPg6qNR/iYrL37iBJHv+ZSCGWXLGBWSw=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=tyvSXg1HTJoQ/a/AO0KurFcVUMf1Oi3peaUBvkiQt+6GJVP6LQr+0E+ndOEwYNZuH
         YWluXkXg4wX/Y/aX8mPLx0jXhFec80yOpBtfc+wLwkyAsf8+DCcuRXoej5dD+wymFO
         xvPo846oM2eUByXTdlttuyS5KqTP/cxYwuHbl27E=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2A96uIag118028
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 9 Nov 2022 00:56:19 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Wed, 9 Nov
 2022 00:56:18 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Wed, 9 Nov 2022 00:56:18 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2A96uF13089878;
        Wed, 9 Nov 2022 00:56:17 -0600
From:   Matt Ranostay <mranostay@ti.com>
To:     <brgl@bgdev.pl>, <lee@kernel.org>, <linus.walleij@linaro.org>,
        <kristo@kernel.org>, <alexandre.belloni@bootlin.com>,
        <a.zummo@towertech.it>, <krzysztof.kozlowski+dt@linaro.org>,
        <robh@kernel.org>, <vigneshr@ti.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, Keerthy <j-keerthy@ti.com>,
        Matt Ranostay <matt.ranostay@konsulko.com>
Subject: [PATCH v3 5/7] arm64: dts: ti: k3-j7200-common-proc-board: Add TPS6594x PMIC node
Date:   Tue, 8 Nov 2022 22:55:44 -0800
Message-ID: <20221109065546.24912-6-mranostay@ti.com>
X-Mailer: git-send-email 2.38.GIT
In-Reply-To: <20221109065546.24912-1-mranostay@ti.com>
References: <20221109065546.24912-1-mranostay@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Keerthy <j-keerthy@ti.com>

Add TPS6594x PMIC, GPIO, and RTC definitions for J7200 common processor
board device tree.

Signed-off-by: Keerthy <j-keerthy@ti.com>
Signed-off-by: Matt Ranostay <matt.ranostay@konsulko.com>
---
 .../boot/dts/ti/k3-j7200-common-proc-board.dts  | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts
index 6240856e4863..9514751739fe 100644
--- a/arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts
@@ -333,3 +333,20 @@ &pcie1_ep {
 	num-lanes = <2>;
 	status = "disabled";
 };
+
+&wkup_i2c0 {
+	status = "okay";
+	tps6594x: tps6594x@48 {
+		compatible = "ti,tps6594x";
+		reg = <0x48>;
+		ti,system-power-controller;
+
+		rtc {
+			compatible = "ti,tps6594x-rtc";
+		};
+
+		gpio {
+			compatible = "ti,tps6594x-gpio";
+		};
+	};
+};
-- 
2.38.GIT

