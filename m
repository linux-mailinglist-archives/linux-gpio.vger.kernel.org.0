Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06EB5103B95
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Nov 2019 14:34:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730748AbfKTNe0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Nov 2019 08:34:26 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:56636 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729591AbfKTNeZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Nov 2019 08:34:25 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAKDYGF9121463;
        Wed, 20 Nov 2019 07:34:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1574256856;
        bh=f9wDMO99+Q0vqCOfNvkwoOcdSmeBsz1Nda7F4U/P5Uo=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=ks3SnZ5ABrvO7BtJrR1hx0K9Ur8ayPN/i82bpVIVNITvbt2XBiSxH9Cu4Nus0sIjC
         e8FGmguGQ8DrE9goxFnw641f8SM86XxyXcAIRuyqvYf2nB01kh4n52zo2LmtaRIwAq
         NnnaUmGon2GfbWc6xgBQ+r8SjwcGlaT+lmo+jYWI=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAKDYGr1114922
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 20 Nov 2019 07:34:16 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 20
 Nov 2019 07:34:15 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 20 Nov 2019 07:34:15 -0600
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAKDY9Ej096098;
        Wed, 20 Nov 2019 07:34:13 -0600
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <robh+dt@kernel.org>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <m.szyprowski@samsung.com>, <broonie@kernel.org>,
        <mripard@kernel.org>, <p.zabel@pengutronix.de>,
        <devicetree@vger.kernel.org>
Subject: [RFC 1/2] dt-bindings: gpio: Document shared GPIO line usage
Date:   Wed, 20 Nov 2019 15:34:08 +0200
Message-ID: <20191120133409.9217-2-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191120133409.9217-1-peter.ujfalusi@ti.com>
References: <20191120133409.9217-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Boards might use the same GPIO line to control several external devices.
Add section to document on how a shared GPIO pin can be described.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 .../devicetree/bindings/gpio/gpio.txt         | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
index a8895d339bfe..644e6513607c 100644
--- a/Documentation/devicetree/bindings/gpio/gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio.txt
@@ -228,6 +228,72 @@ Example of two SOC GPIO banks defined as gpio-controller nodes:
 		#gpio-cells = <2>;
 	};
 
+On boards one GPIO line might be connected to multiple devices as reset, enable
+or other control pins. In order to make it safer for this usage of a GPIO line
+one can describe the shared GPIO pin.
+
+Each shared GPIO pin definition is represented as a child node of the GPIO
+controller.
+
+Required properties:
+- gpio-shared:	A property specifying that this child node represents a shared
+		GPIO pin.
+- gpios:	Store the GPIO information (id, flags, ...) for each GPIO to
+		affect. Shall contain an integer multiple of the number of cells
+		specified in its parent node (GPIO controller node).
+Only one of the following properties scanned in the order shown below.
+This means that when multiple properties are present they will be searched
+in the order presented below and the first match is taken as the intended
+configuration.
+- output-low:	A property specifying to set the GPIO direction as output with
+		the value low initially.
+- output-high:	A property specifying to set the GPIO direction as output with
+		the value high initially.
+The shared GPIO line management strategy can be selected with either of the
+following properties:
+- refcounted-low: The line must be kept low as long as there is at least one
+		request asking it to be low.
+- refcounted-high: The line must be kept high as long as there is at least one
+		request asking it to be high.
+If neither of the refcounting strategy was selected then the shared GPIO is
+handled as pass through. In this mode all user requests will be forwarded to the
+shared GPIO pin without refcounting.
+
+Optional properties:
+- line-name:  The GPIO label name. If not present the node name is used.
+
+Example of shared GPIO use:
+
+	qe_pio_a: gpio-controller@1400 {
+		compatible = "fsl,qe-pario-bank-a", "fsl,qe-pario-bank";
+		reg = <0x1400 0x18>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		line_a {
+			gpio-shared;
+			gpios = <5 0>;
+			output-low;
+			refcounted-high;
+			line-name = "enable-for-devices";
+		};
+	};
+
+	device@0 {
+		compatible = "some,device";
+		enable-gpios = <&qe_pio_a 5 0>;
+	};
+
+	device@1 {
+		compatible = "some,device";
+		enable-gpios = <&qe_pio_a 5 0>;
+	};
+
+	component@0 {
+		compatible = "some,component";
+		select-gpios = <&qe_pio_a 5 0>;
+	};
+
 2.1) gpio- and pin-controller interaction
 -----------------------------------------
 
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

