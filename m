Return-Path: <linux-gpio+bounces-10257-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DCA97C764
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2024 11:46:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 433C11C24CBB
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2024 09:46:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB8B219DF53;
	Thu, 19 Sep 2024 09:43:57 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007CE19DF42;
	Thu, 19 Sep 2024 09:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726739037; cv=none; b=fnoTTSFu0lzW7uzE6aNkhv8PYIAkSEJF0i2CvbxO9k5P3O8NyRKQtGFA+d0kPMtacjZvttXTWYA+7OYC0ZyRAf++H2zfndRdI3pWhY73oGRw/pgWgoIerYv2hn1N8+JCNPOXI+tW2SphqXgIGRlRr8x9kzUU/X4W1vft7SejjaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726739037; c=relaxed/simple;
	bh=mxLA9YX+6XUjNVapaK0QymC5zJyAZAHtVHetJtX/9UI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aYT0wNiCdIHXLaktIIMIU8PGt7c9HDextD0Znvm7TVYh2ZmnocaTzONjAhHexH//iyHS18pSe8gz/I2iLJaeeD6ks6Qt/qMDHNk698zTcEcvqGuuJsebxhjxRiFmb8T3IDqOCzWCo4m2NlD++BhN2oFmMv3uYI8LOrEjIN2Rdy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 19 Sep
 2024 17:43:39 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 19 Sep 2024 17:43:39 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<BMC-SW@aspeedtech.com>, <Peter.Yin@quantatw.com>, <Jay_Zhang@wiwynn.com>
CC: Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/6] dt-bindings: gpio: aspeed,ast2400-gpio: Support ast2700
Date: Thu, 19 Sep 2024 17:43:34 +0800
Message-ID: <20240919094339.2407641-2-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240919094339.2407641-1-billy_tsai@aspeedtech.com>
References: <20240919094339.2407641-1-billy_tsai@aspeedtech.com>
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

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 .../bindings/gpio/aspeed,ast2400-gpio.yaml    | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml b/Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml
index cf11aa7ec8c7..b9afd07a9d24 100644
--- a/Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml
@@ -15,6 +15,7 @@ properties:
       - aspeed,ast2400-gpio
       - aspeed,ast2500-gpio
       - aspeed,ast2600-gpio
+      - aspeed,ast2700-gpio
 
   reg:
     maxItems: 1
@@ -25,7 +26,7 @@ properties:
 
   gpio-controller: true
   gpio-line-names:
-    minItems: 36
+    minItems: 12
     maxItems: 232
 
   gpio-ranges: true
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
 
-- 
2.25.1


