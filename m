Return-Path: <linux-gpio+bounces-9415-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 736479655C0
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 05:41:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E5712842A9
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 03:41:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E281A148828;
	Fri, 30 Aug 2024 03:41:03 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B5D13A242;
	Fri, 30 Aug 2024 03:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724989263; cv=none; b=iZgXP535c1ZsjoFIiaAZyGIX3PDyl/vFK5ZYp8TY1/p0k10IP2QhAxEsjSX+6thLyxA+aoDeWw22/fZ6J00acmNxpwdeDCtDs/JHljte3hlrp63BEGPE/J0IbOltywxdnAGoyTKOXws/tpB14rLP3yGleLvIaGjwiSXkGZcGvoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724989263; c=relaxed/simple;
	bh=1Zpd3CHS8ayLqwd6oCyHvAYVfELoRmnU6801Sd19ge8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bogz308Rq0/w2Pat2ftw2ZquNY+3QjsLwnIVboLb2otEWewfwDbdI8gf4jLeUbt3T9n3v5/d+4aE2ewhA+q5si8Hh9cWOWhrbsEsltzXgymwYYhWLe3nfUazW5j7FbBSIcr+7Z69scardk6GXrY/Dn82Cg/TMzKrhpQKpmT4Mvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 30 Aug
 2024 11:40:47 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 30 Aug 2024 11:40:47 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<BMC-SW@aspeedtech.com>
Subject: [PATCH v2 1/4] dt-bindings: gpio: aspeed,ast2400-gpio: Support ast2700
Date: Fri, 30 Aug 2024 11:40:44 +0800
Message-ID: <20240830034047.2251482-2-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240830034047.2251482-1-billy_tsai@aspeedtech.com>
References: <20240830034047.2251482-1-billy_tsai@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The AST2700 is the 7th generation SoC from Aspeed, featuring two GPIO
controllers: one with 12 GPIO pins and another with 216 GPIO pins.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 .../bindings/gpio/aspeed,ast2400-gpio.yaml    | 46 ++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml b/Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml
index cf11aa7ec8c7..4d439972c14b 100644
--- a/Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml
@@ -15,6 +15,7 @@ properties:
       - aspeed,ast2400-gpio
       - aspeed,ast2500-gpio
       - aspeed,ast2600-gpio
+      - aspeed,ast2700-gpio
 
   reg:
     maxItems: 1
@@ -42,7 +43,7 @@ properties:
     const: 2
 
   ngpios:
-    minimum: 36
+    minimum: 12
     maximum: 232
 
 required:
@@ -93,6 +94,20 @@ allOf:
           enum: [ 36, 208 ]
       required:
         - ngpios
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: aspeed,ast2700-gpio
+    then:
+      properties:
+        gpio-line-names:
+          minItems: 12
+          maxItems: 216
+        ngpios:
+          enum: [ 12, 216 ]
+      required:
+        - ngpios
 
 additionalProperties: false
 
@@ -146,3 +161,32 @@ examples:
         gpio-ranges = <&pinctrl 0 208 36>;
         ngpios = <36>;
     };
+  - |
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+        #include <dt-bindings/interrupt-controller/arm-gic.h>
+        gpio2: gpio@14c0b000 {
+            compatible = "aspeed,ast2700-gpio";
+            reg = <0x0 0x14c0b000 0x0 0x1000>;
+            interrupts-extended = <&soc1_intc2 18>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            #gpio-cells = <2>;
+            gpio-controller;
+            gpio-ranges = <&pinctrl1 0 0 216>;
+            ngpios = <216>;
+        };
+
+        gpio3: gpio@12c11000 {
+            compatible = "aspeed,ast2700-gpio";
+            reg = <0x0 0x12c11000 0x0 0x1000>;
+            interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            #gpio-cells = <2>;
+            gpio-controller;
+            gpio-ranges = <&pinctrl0 0 0 12>;
+            ngpios = <12>;
+        };
+    };
-- 
2.25.1


