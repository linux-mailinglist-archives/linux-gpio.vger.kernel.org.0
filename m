Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 615FF37108
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2019 11:56:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728173AbfFFJ4M (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Jun 2019 05:56:12 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:46520 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728072AbfFFJ4L (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Jun 2019 05:56:11 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x569u3Vm078863;
        Thu, 6 Jun 2019 04:56:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1559814963;
        bh=e23WnTYvUjw9k/zJtezvgJoxPPb3ZOXliq0JWnFHfqk=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=kdhMAv/SIp7Oz5pW85x+hEflM9hQV60bFXhGgLRwlWb9Cck0v6eujqxbF6mwIdtrn
         5/l6frjbKgqM1wJyEMs+bnGLIVTQUTf+ftfoxdrwEye8eBlVUrljr0yMBD+v8alu1m
         CrdX+c8aJvsjnP1QAOZ5RbMdlNoSL/EbS1tvY5QM=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x569u35f054665
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 6 Jun 2019 04:56:03 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 6 Jun
 2019 04:56:03 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 6 Jun 2019 04:56:03 -0500
Received: from a0393675ula.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x569thsu016817;
        Thu, 6 Jun 2019 04:55:59 -0500
From:   Keerthy <j-keerthy@ti.com>
To:     <t-kristo@ti.com>, <nm@ti.com>, <robh+dt@kernel.org>
CC:     <lokeshvutla@ti.com>, <bgolaszewski@baylibre.com>,
        <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <j-keerthy@ti.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC RESEND PATCH v2 4/4] arm64: dts: ti: am654-base-board: Add gpio_keys node
Date:   Thu, 6 Jun 2019 15:26:20 +0530
Message-ID: <20190606095620.6211-5-j-keerthy@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190606095620.6211-1-j-keerthy@ti.com>
References: <20190606095620.6211-1-j-keerthy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There are 2 push buttons: SW5 and SW6 that are basically connected to
WKUP_GPIO0_24 and WKUP_GPIO0_27 respectively. Add the respective
nodes and the pinctrl data to set the mode to GPIO and Input.

Signed-off-by: Keerthy <j-keerthy@ti.com>
---
 .../arm64/boot/dts/ti/k3-am654-base-board.dts | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
index cf1aa276a1ea..ea50b6e36eff 100644
--- a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include "k3-am654.dtsi"
+#include <dt-bindings/input/input.h>
 
 / {
 	compatible =  "ti,am654-evm", "ti,am654";
@@ -33,6 +34,25 @@
 			no-map;
 		};
 	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		autorepeat;
+		pinctrl-names = "default";
+		pinctrl-0 = <&push_button_pins_default>;
+
+		sw5 {
+			label = "GPIO Key USER1";
+			linux,code = <BTN_0>;
+			gpios = <&wkup_gpio0 24 GPIO_ACTIVE_LOW>;
+		};
+
+		sw6 {
+			label = "GPIO Key USER2";
+			linux,code = <BTN_1>;
+			gpios = <&wkup_gpio0 27 GPIO_ACTIVE_LOW>;
+		};
+	};
 };
 
 &wkup_pmx0 {
@@ -42,6 +62,13 @@
 			AM65X_WKUP_IOPAD(0x00e4, PIN_INPUT, 0) /* (AD6) WKUP_I2C0_SDA */
 		>;
 	};
+
+	push_button_pins_default: push_button__pins_default {
+		pinctrl-single,pins = <
+			AM65X_WKUP_IOPAD(0x0030, PIN_INPUT, 7) /* (R5) WKUP_GPIO0_24 */
+			AM65X_WKUP_IOPAD(0x003c, PIN_INPUT, 7) /* (P2) WKUP_GPIO0_27 */
+		>;
+	};
 };
 
 &main_pmx0 {
-- 
2.17.1

