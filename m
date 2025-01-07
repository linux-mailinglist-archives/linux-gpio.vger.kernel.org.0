Return-Path: <linux-gpio+bounces-14565-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F907A04019
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2025 13:59:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 24AB81886770
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2025 12:58:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 587EB1F03D5;
	Tue,  7 Jan 2025 12:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QKgE7ysV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B2A1EF088
	for <linux-gpio@vger.kernel.org>; Tue,  7 Jan 2025 12:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736254724; cv=none; b=MVxyT8DciqGEPdWQo1eLJSgYZSVBqRKVuAVP8f0QydD1qpE+AuKtrmUZiywh6asgxdnJG4JZyda7yqOEpLgMnocihrdjL4adJGdtXBz2g1n+OzmGe8TUn5xY0C5Ya94NkTNhoWV1jVTDXhjz3p+vmZzu6NwVvWwB/R2WTcIN+Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736254724; c=relaxed/simple;
	bh=hJD082z8/Sd5CbVzylRO5Ek62IexrkUJn9+8rMAFzW4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KAtBxdEz09N6wA7le6lvbhOXQ4mlMfVBXHa/l7JuYjw9cXdMaHqvHirWu/MQsJWjLWxl9WY2/9TrZiZYR3JB54OkLz4F/18qzOo0wZdb9Tt5n5lWv0RhGCY4EFBTfxyja0bH2JCFCySNntiqlml9rOB7qDackxGTV4PIroaaObo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QKgE7ysV; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3862de51d38so781697f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jan 2025 04:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736254719; x=1736859519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G3SlO4HnSa1d2nIOviPDkVVh3M8sGqwGmKll7Eiqgd0=;
        b=QKgE7ysVb9SYAbh2BFEGEFdfJtTmMjK/lNdCWF/0wIVD2Y8xO8wri8mFsl8UCpBxum
         bN79Ge8qY5Jwghcwj/N7FbOtvyKAiaz63UDFG2IyxVb5suQAVYthWKDm/duOiRFzGmHD
         W3+LGQYQfDKgmXFdY5il039qsqvLltDAhihwVwkcRqwBU1ZQy7Y/U1P0vCZSQDNEgJ6e
         qI65fq5VaE6IbMaHOSTPBMwIcm8LDIScOzbl4/NM+GZoxZ89P6i7s+OEOj/nKc/tnWtD
         xw+TbRfjQP2sqRzsVNI4wXT185CxAeIa4sgte4lcH07bwZraPpiWbLSKPoERfTxisx7r
         hHwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736254719; x=1736859519;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G3SlO4HnSa1d2nIOviPDkVVh3M8sGqwGmKll7Eiqgd0=;
        b=p29SF2zdqbI5Dgurq6i79MG6PVTfW9W+Q72T/2SK52sKj2F1K/wfZz7P6xWzIsCadl
         55Zvok0nC1bzZcAc02m4z+OMoPBmYwHD0bEUw720Vn2WlIc7tvGvsc8GHGdMGPwLCtcR
         Bu7OUXvO7BxjGdLBgS4/yaUV0AVxEYX4+u+G54eEGdG5XOwhkKjVdG2H11eJslRHFiuO
         /9iHgBho0SNf/AOwU5ACgoPyEwx8e87nOLx8t5AtuH7DH3HDTLVwzuyHVYQ9875LO8FZ
         X9UwLvEbDTu0MCckWi7GpyE8EQ+RNnzbiZoyloV+5Xv4ZrLGphL+/3maX2yc8opHq2MD
         I80g==
X-Forwarded-Encrypted: i=1; AJvYcCV8dehaynziPMcb0AjxXaz5yzdzXnCdMRYyujdcw+Ecnhukr5sOdgycOQOzk1PTAYIgxBlfPM9I/BHU@vger.kernel.org
X-Gm-Message-State: AOJu0YyrxzAmEjzPhjh2edKtZxq/mlBLQuTWU+m6LV/DobbIUaaBr/vG
	5SrqJ5YHR5klBYxLtefQV9TwryAUIZifLdNm1zmHms4Ikp7weDzp6gZVmx/f4ZQ=
X-Gm-Gg: ASbGncsO0KxTihDUik1MuNB8YtGjjpfm4uWobk8IMf4HVAscI6OtUatOkde3I60waSV
	7tC0SGd1zOHTr9XldLWZQB2/InI9KB8AboWsixplkek7KKasJD0QS/XNk227dhVLW58MyYhcuBW
	Rh96nfffoxJBq30/cydVKODoS9Sh4A1p8KuT+17vIv2VfrDdKJqELt1hEHcoIBaAE2/Cib78C4u
	w/QQb74rahfQntQ+66vywhgwB5VUUPOPPv1KAvurYXxyfq+OKDuq3L3DXF423DPm6qYxQs=
X-Google-Smtp-Source: AGHT+IFBgFMLu8HlVu9HOURYvLjoD0imDZ6+YJAzt2WRpsX31FXXQcdZsYTJ8VsoNLNcJAAIeJY15g==
X-Received: by 2002:a5d:588a:0:b0:385:f79d:21a2 with SMTP id ffacd0b85a97d-38a222070a3mr17537706f8f.11.1736254718636;
        Tue, 07 Jan 2025 04:58:38 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e2f9sm51598511f8f.81.2025.01.07.04.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 04:58:38 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Michal Simek <michal.simek@amd.com>,
	Manikandan Muralidharan <manikandan.m@microchip.com>,
	TY Chang <tychang@realtek.com>,
	Krishna Potthuri <sai.krishna.potthuri@amd.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: pinctrl: Correct indentation and style in DTS example
Date: Tue,  7 Jan 2025 13:58:34 +0100
Message-ID: <20250107125836.225447-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DTS example in the bindings should be indented with 2- or 4-spaces and
aligned with opening '- |', so correct any differences like 3-spaces or
mixtures 2- and 4-spaces in one binding.

No functional changes here, but saves some comments during reviews of
new patches built on existing code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../pinctrl/atmel,at91rm9200-pinctrl.yaml     | 64 +++++++++----------
 .../pinctrl/realtek,rtd1315e-pinctrl.yaml     | 50 +++++++--------
 .../pinctrl/realtek,rtd1319d-pinctrl.yaml     | 50 +++++++--------
 .../pinctrl/realtek,rtd1619b-pinctrl.yaml     | 50 +++++++--------
 .../bindings/pinctrl/xlnx,pinctrl-zynq.yaml   | 53 +++++++--------
 5 files changed, 130 insertions(+), 137 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/atmel,at91rm9200-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/atmel,at91rm9200-pinctrl.yaml
index 1bb386b42039..a7ede29c1444 100644
--- a/Documentation/devicetree/bindings/pinctrl/atmel,at91rm9200-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/atmel,at91rm9200-pinctrl.yaml
@@ -145,40 +145,40 @@ additionalProperties:
 
 examples:
   - |
-     #include <dt-bindings/clock/at91.h>
-     #include <dt-bindings/interrupt-controller/irq.h>
-     #include <dt-bindings/pinctrl/at91.h>
+    #include <dt-bindings/clock/at91.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/pinctrl/at91.h>
 
-     pinctrl@fffff400 {
-       #address-cells = <1>;
-       #size-cells = <1>;
-       compatible = "atmel,at91rm9200-pinctrl", "simple-mfd";
-       ranges = <0xfffff400 0xfffff400 0x600>;
+    pinctrl@fffff400 {
+        #address-cells = <1>;
+        #size-cells = <1>;
+        compatible = "atmel,at91rm9200-pinctrl", "simple-mfd";
+        ranges = <0xfffff400 0xfffff400 0x600>;
 
-       atmel,mux-mask = <
-         /*    A         B     */
-         0xffffffff 0xffc00c3b  /* pioA */
-         0xffffffff 0x7fff3ccf  /* pioB */
-         0xffffffff 0x007fffff  /* pioC */
-         >;
+        atmel,mux-mask = <
+          /*    A         B     */
+          0xffffffff 0xffc00c3b  /* pioA */
+          0xffffffff 0x7fff3ccf  /* pioB */
+          0xffffffff 0x007fffff  /* pioC */
+          >;
 
-       dbgu {
-         pinctrl_dbgu: dbgu-0 {
-           atmel,pins =
-             <AT91_PIOB 14 AT91_PERIPH_A AT91_PINCTRL_PULL_UP
-              AT91_PIOB 15 AT91_PERIPH_A AT91_PINCTRL_NONE>;
-         };
-       };
+        dbgu {
+            dbgu-0 {
+                atmel,pins =
+                  <AT91_PIOB 14 AT91_PERIPH_A AT91_PINCTRL_PULL_UP
+                   AT91_PIOB 15 AT91_PERIPH_A AT91_PINCTRL_NONE>;
+            };
+        };
 
-       pioA: gpio@fffff400 {
-         compatible = "atmel,at91rm9200-gpio";
-         reg = <0xfffff400 0x200>;
-         interrupts = <2 IRQ_TYPE_LEVEL_HIGH 1>;
-         #gpio-cells = <2>;
-         gpio-controller;
-         interrupt-controller;
-         #interrupt-cells = <2>;
-         clocks = <&pmc PMC_TYPE_PERIPHERAL 2>;
-       };
-     };
+        gpio@fffff400 {
+            compatible = "atmel,at91rm9200-gpio";
+            reg = <0xfffff400 0x200>;
+            interrupts = <2 IRQ_TYPE_LEVEL_HIGH 1>;
+            #gpio-cells = <2>;
+            gpio-controller;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            clocks = <&pmc PMC_TYPE_PERIPHERAL 2>;
+        };
+    };
 ...
diff --git a/Documentation/devicetree/bindings/pinctrl/realtek,rtd1315e-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/realtek,rtd1315e-pinctrl.yaml
index fc6c65fea73b..90bd49d87d2e 100644
--- a/Documentation/devicetree/bindings/pinctrl/realtek,rtd1315e-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/realtek,rtd1315e-pinctrl.yaml
@@ -159,30 +159,30 @@ additionalProperties: false
 
 examples:
   - |
-     pinctrl@4e000 {
-         compatible = "realtek,rtd1315e-pinctrl";
-         reg = <0x4e000 0x130>;
+    pinctrl@4e000 {
+        compatible = "realtek,rtd1315e-pinctrl";
+        reg = <0x4e000 0x130>;
 
-         emmc-hs200-pins {
-             pins = "emmc_clk",
-                    "emmc_cmd",
-                    "emmc_data_0",
-                    "emmc_data_1",
-                    "emmc_data_2",
-                    "emmc_data_3",
-                    "emmc_data_4",
-                    "emmc_data_5",
-                    "emmc_data_6",
-                    "emmc_data_7";
-             function = "emmc";
-             realtek,drive-strength-p = <0x2>;
-             realtek,drive-strength-n = <0x2>;
-         };
+        emmc-hs200-pins {
+            pins = "emmc_clk",
+                   "emmc_cmd",
+                   "emmc_data_0",
+                   "emmc_data_1",
+                   "emmc_data_2",
+                   "emmc_data_3",
+                   "emmc_data_4",
+                   "emmc_data_5",
+                   "emmc_data_6",
+                   "emmc_data_7";
+            function = "emmc";
+            realtek,drive-strength-p = <0x2>;
+            realtek,drive-strength-n = <0x2>;
+        };
 
-         i2c-0-pins {
-             pins = "gpio_12",
-                    "gpio_13";
-             function = "i2c0";
-             drive-strength = <4>;
-         };
-     };
+        i2c-0-pins {
+            pins = "gpio_12",
+                   "gpio_13";
+            function = "i2c0";
+            drive-strength = <4>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/pinctrl/realtek,rtd1319d-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/realtek,rtd1319d-pinctrl.yaml
index f07361d60acd..b6211c8544ca 100644
--- a/Documentation/devicetree/bindings/pinctrl/realtek,rtd1319d-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/realtek,rtd1319d-pinctrl.yaml
@@ -158,30 +158,30 @@ additionalProperties: false
 
 examples:
   - |
-     pinctrl@4e000 {
-         compatible = "realtek,rtd1319d-pinctrl";
-         reg = <0x4e000 0x130>;
+    pinctrl@4e000 {
+        compatible = "realtek,rtd1319d-pinctrl";
+        reg = <0x4e000 0x130>;
 
-         emmc-hs200-pins {
-             pins = "emmc_clk",
-                    "emmc_cmd",
-                    "emmc_data_0",
-                    "emmc_data_1",
-                    "emmc_data_2",
-                    "emmc_data_3",
-                    "emmc_data_4",
-                    "emmc_data_5",
-                    "emmc_data_6",
-                    "emmc_data_7";
-             function = "emmc";
-             realtek,drive-strength-p = <0x2>;
-             realtek,drive-strength-n = <0x2>;
-         };
+        emmc-hs200-pins {
+            pins = "emmc_clk",
+                   "emmc_cmd",
+                   "emmc_data_0",
+                   "emmc_data_1",
+                   "emmc_data_2",
+                   "emmc_data_3",
+                   "emmc_data_4",
+                   "emmc_data_5",
+                   "emmc_data_6",
+                   "emmc_data_7";
+            function = "emmc";
+            realtek,drive-strength-p = <0x2>;
+            realtek,drive-strength-n = <0x2>;
+        };
 
-         i2c-0-pins {
-             pins = "gpio_12",
-                    "gpio_13";
-             function = "i2c0";
-             drive-strength = <4>;
-         };
-     };
+        i2c-0-pins {
+            pins = "gpio_12",
+                   "gpio_13";
+            function = "i2c0";
+            drive-strength = <4>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/pinctrl/realtek,rtd1619b-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/realtek,rtd1619b-pinctrl.yaml
index 671e4ec84624..e88bc649cc73 100644
--- a/Documentation/devicetree/bindings/pinctrl/realtek,rtd1619b-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/realtek,rtd1619b-pinctrl.yaml
@@ -157,30 +157,30 @@ additionalProperties: false
 
 examples:
   - |
-     pinctrl@4e000 {
-         compatible = "realtek,rtd1619b-pinctrl";
-         reg = <0x4e000 0x130>;
+    pinctrl@4e000 {
+        compatible = "realtek,rtd1619b-pinctrl";
+        reg = <0x4e000 0x130>;
 
-         emmc-hs200-pins {
-             pins = "emmc_clk",
-                    "emmc_cmd",
-                    "emmc_data_0",
-                    "emmc_data_1",
-                    "emmc_data_2",
-                    "emmc_data_3",
-                    "emmc_data_4",
-                    "emmc_data_5",
-                    "emmc_data_6",
-                    "emmc_data_7";
-             function = "emmc";
-             realtek,drive-strength-p = <0x2>;
-             realtek,drive-strength-n = <0x2>;
-         };
+        emmc-hs200-pins {
+            pins = "emmc_clk",
+                   "emmc_cmd",
+                   "emmc_data_0",
+                   "emmc_data_1",
+                   "emmc_data_2",
+                   "emmc_data_3",
+                   "emmc_data_4",
+                   "emmc_data_5",
+                   "emmc_data_6",
+                   "emmc_data_7";
+            function = "emmc";
+            realtek,drive-strength-p = <0x2>;
+            realtek,drive-strength-n = <0x2>;
+        };
 
-         i2c-0-pins {
-             pins = "gpio_12",
-                    "gpio_13";
-             function = "i2c0";
-             drive-strength = <4>;
-         };
-     };
+        i2c-0-pins {
+            pins = "gpio_12",
+                   "gpio_13";
+            function = "i2c0";
+            drive-strength = <4>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/pinctrl/xlnx,pinctrl-zynq.yaml b/Documentation/devicetree/bindings/pinctrl/xlnx,pinctrl-zynq.yaml
index de6c10ba36c4..70548cb37ada 100644
--- a/Documentation/devicetree/bindings/pinctrl/xlnx,pinctrl-zynq.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/xlnx,pinctrl-zynq.yaml
@@ -180,38 +180,31 @@ additionalProperties: false
 examples:
   - |
     #include <dt-bindings/pinctrl/pinctrl-zynq.h>
-    pinctrl0: pinctrl@700 {
-       compatible = "xlnx,pinctrl-zynq";
-       reg = <0x700 0x200>;
-       syscon = <&slcr>;
+    pinctrl@700 {
+        compatible = "xlnx,pinctrl-zynq";
+        reg = <0x700 0x200>;
+        syscon = <&slcr>;
 
-       pinctrl_uart1_default: uart1-default {
-           mux {
-               groups = "uart1_10_grp";
-               function = "uart1";
-           };
+        uart1-default {
+            mux {
+                groups = "uart1_10_grp";
+                function = "uart1";
+            };
 
-           conf {
-               groups = "uart1_10_grp";
-               slew-rate = <0>;
-               power-source = <IO_STANDARD_LVCMOS18>;
-           };
+            conf {
+                groups = "uart1_10_grp";
+                slew-rate = <0>;
+                power-source = <IO_STANDARD_LVCMOS18>;
+            };
 
-           conf-rx {
-               pins = "MIO49";
-               bias-high-impedance;
-           };
+            conf-rx {
+                pins = "MIO49";
+                bias-high-impedance;
+            };
 
-           conf-tx {
-               pins = "MIO48";
-               bias-disable;
-           };
-       };
+            conf-tx {
+                pins = "MIO48";
+                bias-disable;
+            };
+        };
     };
-
-    uart1 {
-         pinctrl-names = "default";
-         pinctrl-0 = <&pinctrl_uart1_default>;
-    };
-
-...
-- 
2.43.0


