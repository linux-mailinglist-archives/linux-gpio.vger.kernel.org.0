Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6413C370FA
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2019 11:56:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728151AbfFFJz6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Jun 2019 05:55:58 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:46464 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728048AbfFFJz5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Jun 2019 05:55:57 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x569tprk078807;
        Thu, 6 Jun 2019 04:55:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1559814951;
        bh=ALlSRG9PtHqP0CSYBVSNGSRcHisohKsxS4M0ZG0uyH0=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=s+Eoj8GM9AuVu5uP5wPL21fGCOZlxlr2BbFYQkeFf/ePKkdnp4TRIBY2dH0QlT6sX
         Aes9Zrpc7ZIeos4kcBYMxAEAZsX94y5WS13DKcg0Vd/zbraADyAKZ3mCpJ0LIduQoE
         FrhFg/Z9amdhg+yLD07pht6Qe4vCXn08RlcXn4EY=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x569tpK4055573
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 6 Jun 2019 04:55:51 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 6 Jun
 2019 04:55:51 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 6 Jun 2019 04:55:51 -0500
Received: from a0393675ula.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x569thsr016817;
        Thu, 6 Jun 2019 04:55:47 -0500
From:   Keerthy <j-keerthy@ti.com>
To:     <t-kristo@ti.com>, <nm@ti.com>, <robh+dt@kernel.org>
CC:     <lokeshvutla@ti.com>, <bgolaszewski@baylibre.com>,
        <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <j-keerthy@ti.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC RESEND PATCH v2 1/4] dt-bindings: gpio: davinci: Add k3 am654 compatible
Date:   Thu, 6 Jun 2019 15:26:17 +0530
Message-ID: <20190606095620.6211-2-j-keerthy@ti.com>
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

The patch adds k3 am654 compatible, specific properties and
an example.

Signed-off-by: Keerthy <j-keerthy@ti.com>
---
 .../devicetree/bindings/gpio/gpio-davinci.txt  | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-davinci.txt b/Documentation/devicetree/bindings/gpio/gpio-davinci.txt
index 553b92a7e87b..bc6b4b62df83 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-davinci.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-davinci.txt
@@ -5,6 +5,7 @@ Required Properties:
 			"ti,keystone-gpio": for Keystone 2 66AK2H/K, 66AK2L,
 						66AK2E SoCs
 			"ti,k2g-gpio", "ti,keystone-gpio": for 66AK2G
+			"ti,am654-gpio", "ti,keystone-gpio": for TI K3 AM654
 
 - reg: Physical base address of the controller and the size of memory mapped
        registers.
@@ -145,3 +146,20 @@ gpio0: gpio@260bf00 {
 	ti,ngpio = <32>;
 	ti,davinci-gpio-unbanked = <32>;
 };
+
+Example for K3 AM654:
+
+wkup_gpio0: wkup_gpio0@42110000 {
+	compatible = "ti,am654-gpio", "ti,keystone-gpio";
+	reg = <0x42110000 0x100>;
+	gpio-controller;
+	#gpio-cells = <2>;
+	interrupt-parent = <&intr_wkup_gpio>;
+	interrupts = <59 128>, <59 129>, <59 130>, <59 131>;
+	interrupt-controller;
+	#interrupt-cells = <2>;
+	ti,ngpio = <56>;
+	ti,davinci-gpio-unbanked = <0>;
+	clocks = <&k3_clks 59 0>;
+	clock-names = "gpio";
+};
-- 
2.17.1

