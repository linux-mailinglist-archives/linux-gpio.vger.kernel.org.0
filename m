Return-Path: <linux-gpio+bounces-20619-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB05AC5CEA
	for <lists+linux-gpio@lfdr.de>; Wed, 28 May 2025 00:22:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0A173AE3CF
	for <lists+linux-gpio@lfdr.de>; Tue, 27 May 2025 22:21:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D053D219A97;
	Tue, 27 May 2025 22:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y2KMeVGF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A530216E1B;
	Tue, 27 May 2025 22:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748384480; cv=none; b=ZvIFxT4HPJkA3kUpV1jZ6NEzKwEIBY0aM8lHSgj9jJ9MPlGptoev/ErOEj+QeOi+vcAwyyWfOAWLXvi1HzMGUV40hAMGA3JB5f6dwwB9662pyM3RkoH4R0tpxG+yWZDXG/7dxOmVs45w6lOXkIhZi6Rpaits0UAxAAka3bugP8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748384480; c=relaxed/simple;
	bh=4ZXLlhkZyjtoD8E9Vcf/KvzUAUQVaCQORCdYjAt3/7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LNfdS2k5SZptqkAkmo+sYxUJ9S9gXBjxg3JsD6rrJW3A2fMdTa7BQsO/C5kMXMkCZW4MWxQ0YjmemFRpjlIbOBDcC/S3CBpf+Kxf54w7niG7Q2TMEWBl4WfzeD7BVcZri9cBIAFrQlqHj/T/F+wZYBN84W6VRjXSKDNoUmdchFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y2KMeVGF; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a37d24e607so1659963f8f.1;
        Tue, 27 May 2025 15:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748384476; x=1748989276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mdmzyr4RLGil5tA/deRxcfecM4FmkUNEyzf9KUSi9uI=;
        b=Y2KMeVGF0lUz2VQjOzdXKZVlQPkrd3ZihHEMgdY2EdMER0B3CHLJFCUDyjeR55Dq7K
         VttQVrWd2W45bTFDG9pWNKQc9bFXOTmhmedEh3HbgbwyEMgx6zPy7Lb0+qS5KvyQiseR
         MqQYZrEqwsXeeqfjSPhC600DUuL3q53SoUksR8JqUWIVUdlTBEeZ6kya09PKEcN8oj/j
         /K3JXp9TnWOBqCKJO4qRkAhYvVGcB+SKvg/7ruIotoiFAlQgG3TYi/E/hHZgE5f336e3
         OlLaX7XbqrnWYt2TnTRYoI8oPQkzgwSAQgykN+TlhU7uralZoNupTHtOPT3dcylkOlyF
         UQug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748384476; x=1748989276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mdmzyr4RLGil5tA/deRxcfecM4FmkUNEyzf9KUSi9uI=;
        b=VprqJ3ipMhKY/2FPuxhwTpggnziTvjJ/BPVHTEi/HBEPfSizEJuRVJIJHPiaV9bue1
         IV0qgbVD23Fij/59/GA0p+miiJBRqSZyBwDQ4X8mqbXj7f0jkvc4Vfy3f0mxd7MjOLai
         B8jOwjCDWWBQCHCM/A1UTK9ObSVhrw2eKDHZpUvVs8MR5mzVoL1X8Orgc3nQVde/1Jhv
         bq+SfToXVeDtsDQ9X/sMwb9jiFyeHGGMvQqB9GYjk9LDt2P8FY8UsNYWwk7q53QMyKo1
         oO5TQcB1U5ZykuZu2jelju3xZ+Pn4I7E0StLnWHpH8+pEIKMi0K4s4A1M+fDufnzszG1
         AGXQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3/xryUUizKXfLLMqKTxFxneR3w5r6gid+eb5p15cEqcjf/FyWg6c3Bae9LGjv4rsiaLKhCvZqAIVYCg==@vger.kernel.org, AJvYcCX3QW6FOWMwc/4zUJqjHawZoimeiQvDP3CYA8HseBnCWmKoa9AjUkXkrHhdPzyro4MTcHQqURDxSSBP0LbF@vger.kernel.org, AJvYcCXC+cfvxAQhnol3TWjdR0oHcR2U788Eb8twSxDP353HrwVzh8HE/llrP1rZ+7ZNIMXCiJ1iX5SM0djC@vger.kernel.org
X-Gm-Message-State: AOJu0YyoHq85wxugebU2gOBEMPHS8ZIV8p9IDwJC+qQvxlpJztOdQI7s
	1sMYFwb1FNdAgC7aKLSoU/Tn/agi4mmEEz3EOyIxlfEVslySQ96Xo644
X-Gm-Gg: ASbGncsZP/b9oAr/ElRoJHj7SUictMmN+rdN22PfcL8xOXHquaWGRX6TWJsVKLnxXSF
	307k2WW8bToC9ztro+zY61s9yf93ID/G15trUKRh6I7eCzNeMLSkMrQLMDToLoj/e97KCUYFwDb
	eE0uTbL5yZOEpOOQcsdqZUiPNkHoil8kuoJgaBKuzR7CcjUn+WhXyvb+yILnuisK+G7ZvW/PHNa
	C3BntJAHHrufDW8dEb9mqnctw7KB1tMOb9WYviTzeXA9F2NMK1W3/C4bV3P/ZrdfTlZLTM9Y21i
	TUUmU2iNu36V0L0ZPyX35LKoJPJWllfSdTEBoyuhCh1mw6JPeHuAafeNop3SbZFyWJhQ6JGBiOa
	IMT6DSq+nxJWEO6sn/B8m
X-Google-Smtp-Source: AGHT+IHPFsfBZ7jep4HTPgB4xS2TrPI+GxC/0lSGwTIJL7shKIL3DXkoTKTKoqJselW/W7mVGW6RgA==
X-Received: by 2002:a05:6000:2406:b0:3a4:e1e1:7779 with SMTP id ffacd0b85a97d-3a4e1e17966mr3329816f8f.32.1748384475767;
        Tue, 27 May 2025 15:21:15 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a4e8bc377asm233366f8f.72.2025.05.27.15.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 15:21:14 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 5/6] dt-bindings: pinctrl: airoha: Document AN7583 Pin Controller
Date: Wed, 28 May 2025 00:20:37 +0200
Message-ID: <20250527222040.32000-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250527222040.32000-1-ansuelsmth@gmail.com>
References: <20250527222040.32000-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Airoha AN7583 Pin Controller based on Airoha EN7581 with some
minor difference on some function group.

Make the PHY LEDs, pcie_reset and PCM SPI function dependent of the
compatible and define the different group for AN7583.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../pinctrl/airoha,en7581-pinctrl.yaml        | 297 ++++++++++++------
 1 file changed, 207 insertions(+), 90 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
index 21fd4f1ba78b..38511ad2f9e6 100644
--- a/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
@@ -4,17 +4,19 @@
 $id: http://devicetree.org/schemas/pinctrl/airoha,en7581-pinctrl.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Airoha EN7581 Pin Controller
+title: Airoha EN7581/AN7583 Pin Controller
 
 maintainers:
   - Lorenzo Bianconi <lorenzo@kernel.org>
 
 description:
-  The Airoha's EN7581 Pin controller is used to control SoC pins.
+  The Airoha's EN7581/AN7583 Pin controller is used to control SoC pins.
 
 properties:
   compatible:
-    const: airoha,en7581-pinctrl
+    enum:
+      - airoha,en7581-pinctrl
+      - airoha,an7583-pinctrl
 
   interrupts:
     maxItems: 1
@@ -32,9 +34,6 @@ properties:
   '#interrupt-cells':
     const: 2
 
-allOf:
-  - $ref: pinctrl.yaml#
-
 required:
   - compatible
   - interrupts
@@ -151,18 +150,6 @@ patternProperties:
                   items:
                     enum: [spi_quad, spi_cs1]
                   maxItems: 2
-          - if:
-              properties:
-                function:
-                  const: pcm_spi
-            then:
-              properties:
-                groups:
-                  items:
-                    enum: [pcm_spi, pcm_spi_int, pcm_spi_rst, pcm_spi_cs1,
-                           pcm_spi_cs2_p156, pcm_spi_cs2_p128, pcm_spi_cs3,
-                           pcm_spi_cs4]
-                  maxItems: 7
           - if:
               properties:
                 function:
@@ -187,14 +174,6 @@ patternProperties:
               properties:
                 groups:
                   enum: [pnand]
-          - if:
-              properties:
-                function:
-                  const: pcie_reset
-            then:
-              properties:
-                groups:
-                  enum: [pcie_reset0, pcie_reset1, pcie_reset2]
           - if:
               properties:
                 function:
@@ -209,70 +188,6 @@ patternProperties:
                          gpio26, gpio27, gpio28, gpio29, gpio30, gpio31,
                          gpio36, gpio37, gpio38, gpio39, gpio40, gpio41,
                          gpio42, gpio43, gpio44, gpio45, gpio46, gpio47]
-          - if:
-              properties:
-                function:
-                  const: phy1_led0
-            then:
-              properties:
-                groups:
-                  enum: [gpio33, gpio34, gpio35, gpio42]
-          - if:
-              properties:
-                function:
-                  const: phy2_led0
-            then:
-              properties:
-                groups:
-                  enum: [gpio33, gpio34, gpio35, gpio42]
-          - if:
-              properties:
-                function:
-                  const: phy3_led0
-            then:
-              properties:
-                groups:
-                  enum: [gpio33, gpio34, gpio35, gpio42]
-          - if:
-              properties:
-                function:
-                  const: phy4_led0
-            then:
-              properties:
-                groups:
-                  enum: [gpio33, gpio34, gpio35, gpio42]
-          - if:
-              properties:
-                function:
-                  const: phy1_led1
-            then:
-              properties:
-                groups:
-                  enum: [gpio43, gpio44, gpio45, gpio46]
-          - if:
-              properties:
-                function:
-                  const: phy2_led1
-            then:
-              properties:
-                groups:
-                  enum: [gpio43, gpio44, gpio45, gpio46]
-          - if:
-              properties:
-                function:
-                  const: phy3_led1
-            then:
-              properties:
-                groups:
-                  enum: [gpio43, gpio44, gpio45, gpio46]
-          - if:
-              properties:
-                function:
-                  const: phy4_led1
-            then:
-              properties:
-                groups:
-                  enum: [gpio43, gpio44, gpio45, gpio46]
 
         additionalProperties: false
 
@@ -331,6 +246,208 @@ patternProperties:
 
 additionalProperties: false
 
+allOf:
+  - $ref: pinctrl.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: airoha,en7581-pinctrl
+    then:
+      patternProperties:
+        '-pins$':
+          type: object
+
+          patternProperties:
+            '^mux(-|$)':
+              type: object
+
+              allOf:
+                - if:
+                    properties:
+                      function:
+                        const: pcm_spi
+                  then:
+                    properties:
+                      groups:
+                        items:
+                          enum: [pcm_spi, pcm_spi_int, pcm_spi_rst, pcm_spi_cs1,
+                                 pcm_spi_cs2_p156, pcm_spi_cs2_p128, pcm_spi_cs3,
+                                 pcm_spi_cs4]
+                        maxItems: 7
+                - if:
+                    properties:
+                      function:
+                        const: pcie_reset
+                  then:
+                    properties:
+                      groups:
+                        enum: [pcie_reset0, pcie_reset1, pcie_reset2]
+                - if:
+                    properties:
+                      function:
+                        const: phy1_led0
+                  then:
+                    properties:
+                      groups:
+                        enum: [gpio33, gpio34, gpio35, gpio42]
+                - if:
+                    properties:
+                      function:
+                        const: phy2_led0
+                  then:
+                    properties:
+                      groups:
+                        enum: [gpio33, gpio34, gpio35, gpio42]
+                - if:
+                    properties:
+                      function:
+                        const: phy3_led0
+                  then:
+                    properties:
+                      groups:
+                        enum: [gpio33, gpio34, gpio35, gpio42]
+                - if:
+                    properties:
+                      function:
+                        const: phy4_led0
+                  then:
+                    properties:
+                      groups:
+                        enum: [gpio33, gpio34, gpio35, gpio42]
+                - if:
+                    properties:
+                      function:
+                        const: phy1_led1
+                  then:
+                    properties:
+                      groups:
+                        enum: [gpio43, gpio44, gpio45, gpio46]
+                - if:
+                    properties:
+                      function:
+                        const: phy2_led1
+                  then:
+                    properties:
+                      groups:
+                        enum: [gpio43, gpio44, gpio45, gpio46]
+                - if:
+                    properties:
+                      function:
+                        const: phy3_led1
+                  then:
+                    properties:
+                      groups:
+                        enum: [gpio43, gpio44, gpio45, gpio46]
+                - if:
+                    properties:
+                      function:
+                        const: phy4_led1
+                  then:
+                    properties:
+                      groups:
+                        enum: [gpio43, gpio44, gpio45, gpio46]
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: airoha,an7583-pinctrl
+    then:
+      patternProperties:
+        '-pins$':
+          type: object
+
+          patternProperties:
+            '^mux(-|$)':
+              type: object
+
+              allOf:
+                - if:
+                    properties:
+                      function:
+                        const: pcm_spi
+                  then:
+                    properties:
+                      groups:
+                        items:
+                          enum: [pcm_spi, pcm_spi_int, pcm_spi_rst, pcm_spi_cs1,
+                                 pcm_spi_cs2, pcm_spi_cs3, pcm_spi_cs4]
+                        maxItems: 7
+                - if:
+                    properties:
+                      function:
+                        const: pcie_reset
+                  then:
+                    properties:
+                      groups:
+                        enum: [pcie_reset0, pcie_reset1]
+                - if:
+                    properties:
+                      function:
+                        const: phy1_led0
+                  then:
+                    properties:
+                      groups:
+                        enum: [gpio1, gpio2, gpio3, gpio4]
+                - if:
+                    properties:
+                      function:
+                        const: phy2_led0
+                  then:
+                    properties:
+                      groups:
+                        enum: [gpio1, gpio2, gpio3, gpio4]
+                - if:
+                    properties:
+                      function:
+                        const: phy3_led0
+                  then:
+                    properties:
+                      groups:
+                        enum: [gpio1, gpio2, gpio3, gpio4]
+                - if:
+                    properties:
+                      function:
+                        const: phy4_led0
+                  then:
+                    properties:
+                      groups:
+                        enum: [gpio1, gpio2, gpio3, gpio4]
+                - if:
+                    properties:
+                      function:
+                        const: phy1_led1
+                  then:
+                    properties:
+                      groups:
+                        enum: [gpio8, gpio9, gpio10, gpio11]
+                - if:
+                    properties:
+                      function:
+                        const: phy2_led1
+                  then:
+                    properties:
+                      groups:
+                        enum: [gpio8, gpio9, gpio10, gpio11]
+                - if:
+                    properties:
+                      function:
+                        const: phy3_led1
+                  then:
+                    properties:
+                      groups:
+                        enum: [gpio8, gpio9, gpio10, gpio11]
+                - if:
+                    properties:
+                      function:
+                        const: phy4_led1
+                  then:
+                    properties:
+                      groups:
+                        enum: [gpio8, gpio9, gpio10, gpio11]
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
-- 
2.48.1


