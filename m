Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1462E622449
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Nov 2022 07:56:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbiKIG4s (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Nov 2022 01:56:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229509AbiKIG4r (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Nov 2022 01:56:47 -0500
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83B8C1DDE4;
        Tue,  8 Nov 2022 22:56:46 -0800 (PST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2A96uSnO106659;
        Wed, 9 Nov 2022 00:56:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1667976988;
        bh=pyT0Nnu0s3nEaTacWsWURM1V97hqEA+3TatyRE9aUlg=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=H5a6SL2l+hDqkZsuVxM/8Xw3kgOMwvMXP8kDSbJ49ybQi+hlMK9gHmncZ1eylH8Yq
         8UDIg98AWRcDlWyWJSn9tQ98C+h6ZvtKagPRYtErDVLILRknoCfIbD+A7qzOiNUT8P
         B62oaFhgx5Vxo6X2NHFxLZQH5UMpwBWi+AJ7wLsI=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2A96uS8d091798
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 9 Nov 2022 00:56:28 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Wed, 9 Nov
 2022 00:56:28 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Wed, 9 Nov 2022 00:56:28 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2A96uPxF116707;
        Wed, 9 Nov 2022 00:56:27 -0600
From:   Matt Ranostay <mranostay@ti.com>
To:     <brgl@bgdev.pl>, <lee@kernel.org>, <linus.walleij@linaro.org>,
        <kristo@kernel.org>, <alexandre.belloni@bootlin.com>,
        <a.zummo@towertech.it>, <krzysztof.kozlowski+dt@linaro.org>,
        <robh@kernel.org>, <vigneshr@ti.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, Matt Ranostay <mranostay@ti.com>
Subject: [PATCH v3 7/7] arm64: dts: ti: k3-j721s2-common-proc-board: Add TPS6594x PMIC node
Date:   Tue, 8 Nov 2022 22:55:46 -0800
Message-ID: <20221109065546.24912-8-mranostay@ti.com>
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

Add TPS6594x PMIC, GPIO, and RTC definitions for j721s2 common processor
board device tree.

Signed-off-by: Matt Ranostay <mranostay@ti.com>
---
 .../boot/dts/ti/k3-j721s2-common-proc-board.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
index a7aa6cf08acd..918c0c8d02cf 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
@@ -309,3 +309,20 @@ &mcu_mcan1 {
 	pinctrl-0 = <&mcu_mcan1_pins_default>;
 	phys = <&transceiver2>;
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

