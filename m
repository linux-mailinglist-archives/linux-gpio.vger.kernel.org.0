Return-Path: <linux-gpio+bounces-10590-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B764198AD45
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 21:51:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA4311C21C4B
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 19:51:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 857D019DFA4;
	Mon, 30 Sep 2024 19:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="UzSjAcvM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A188219D8A8
	for <linux-gpio@vger.kernel.org>; Mon, 30 Sep 2024 19:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727725872; cv=none; b=FJZ8S13zd4d1uOiCsM6P47n1za6Zjoi8dk4w2pD4m9H94KZU3ap1rJRWX7wkdKf9dQg1BZT7Bp4R0+Rk4kP18iErn+uhRZ7WBRcObBOhY79QyCj0JoaN8dXvOmIx9DPgDezignbPTG/AUkQx4/1FJhdOf+GeN4PBibYX9D5fyK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727725872; c=relaxed/simple;
	bh=AYsgukbXqI2H2yRv+yRYvC4dB2cH63Mc53s8j4k73Do=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qiOg6o40zYvw/7QntwhlXETT3QAeQMgAf5dooXjRORCn8nYy+PbKB5oRUItXC+6U9HtL8LBLkEWXAyvaG/S1yuWFrTT5vbOJaJGewC3sscOUv1wrJAGsk4QGMvY1j3Oha43S24iavwrXwWek7ZV8VuGdm8nnXhIgEm+UayoESIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=UzSjAcvM; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-71979bf5e7aso3481661b3a.1
        for <linux-gpio@vger.kernel.org>; Mon, 30 Sep 2024 12:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1727725869; x=1728330669; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e/6hM/SLg9H5YNHVFJfYKuEoxKPox303WSs6Xqy7+H8=;
        b=UzSjAcvM+Lm8nUd7GJmMyQv9gGnRr0oIgXK0dAU+zVkjQafmii7opkbyQseSuUsP39
         QSEwyPtV3nTyseuiL/5/tBd95nsDQ1dBp+j3wvgvwA2phTXxQq35wnPzSZtnidR28d7T
         570pk83t1HHypL/8a5JGZxJi0m73b5IXrRfqHeGasXaLav8mtqToCqqCQJG799g4TexP
         kSCM596SPlXhWLS/U3yB/BxR/f+xp/pFWXUSqnwWZrICU1a75JosTiNVcJWLsyh2L9iD
         ODqwKkjzXM2LcORbKoSsGr2LCL1isoLE7qMZOUTv3AVYJBvNPHNLQqI4C2ceexgFmz1A
         w6kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727725869; x=1728330669;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e/6hM/SLg9H5YNHVFJfYKuEoxKPox303WSs6Xqy7+H8=;
        b=DH5LclfOy4aDCtfNQql3YU7xIh5RN8XHNB8l//Z5bNSLGJ5zSBT6LuST25mo9mqASv
         lg26Zys1ydKOBijqDqk5sofWssp7xYzwEfa15PwFtG7f/YULMO/ecNZWm3o4clW1oEsb
         WEGqtwvWyC5p+O3LTutv/htjDAJV7Cgm4UZdWrjDZRiaLHlP7v9EHctQ19MAQnFku5Ze
         9gFwwMZcpyzj8BJUkfCWZk46/5oPkaFQRbR/F5TpNgNwae70TBDyZYLKdWTR71LG/UF+
         GO7bb9wGTiPh8zTKxpaEQYMGormZPNIeKUyiwu2710PC2Px3m8D+WXn5/a7ZjL0/SikR
         QkNw==
X-Forwarded-Encrypted: i=1; AJvYcCUx9i0udHDGf4StMbgkwgGu8Wqzc6YYVUaTnv9dOpWDdBjdOiasA0D/bGxUK6ovUzu/uArkIiQRTiG/@vger.kernel.org
X-Gm-Message-State: AOJu0YxH7MvUy1GbBEwWlNBf8QF+VUUPjqgjLW2CExumBaUsDRGsaNJk
	KrL2FUxwBmdE90CJQlYiJ1KVfvu/HOP3fcoMlqGZjngGz/oGzyyG2OBgd68YGbY=
X-Google-Smtp-Source: AGHT+IGZD7DzL8afx5Z7kSfSkPKuOCCOcV72lunJpztdT/+HSSzmn2ZPR4/QRqN8EaI/natCvse7mg==
X-Received: by 2002:a05:6a00:1813:b0:718:dd53:70db with SMTP id d2e1a72fcca58-71b25f448a0mr20158214b3a.11.1727725868868;
        Mon, 30 Sep 2024 12:51:08 -0700 (PDT)
Received: from [127.0.1.1] (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b26529d4bsm6630213b3a.158.2024.09.30.12.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 12:51:08 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Mon, 30 Sep 2024 12:50:51 -0700
Subject: [PATCH v3 1/8] dt-bindings: pinctrl: Add thead,th1520-pinctrl
 bindings
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-th1520-pinctrl-v3-1-32cea2bdbecb@tenstorrent.com>
References: <20240930-th1520-pinctrl-v3-0-32cea2bdbecb@tenstorrent.com>
In-Reply-To: <20240930-th1520-pinctrl-v3-0-32cea2bdbecb@tenstorrent.com>
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.14.1

From: Emil Renner Berthing <emil.renner.berthing@canonical.com>

Add bindings for the pin controllers on the T-Head TH1520 RISC-V SoC.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Tested-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
[dfustini: add thead,pad-group to select the pin controller instance]
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 .../bindings/pinctrl/thead,th1520-pinctrl.yaml     | 176 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 2 files changed, 177 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml
new file mode 100644
index 000000000000..21f86740a63d
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml
@@ -0,0 +1,176 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/thead,th1520-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: T-Head TH1520 SoC pin controller
+
+maintainers:
+  - Emil Renner Berthing <emil.renner.berthing@canonical.com>
+
+description: |
+  Pinmux and pinconf controller in the T-Head TH1520 RISC-V SoC.
+
+  The TH1520 has 3 groups of pads each controlled from different memory ranges.
+  Confusingly the memory ranges are named
+    PADCTRL_AOSYS  -> PAD Group 1
+    PADCTRL1_APSYS -> PAD Group 2
+    PADCTRL0_APSYS -> PAD Group 3
+
+  Each pad can be muxed individually to up to 6 different functions. For most
+  pads only a few of those 6 configurations are valid though, and a few pads in
+  group 1 does not support muxing at all.
+
+  Pinconf is fairly regular except for a few pads in group 1 that either can't
+  be configured or has some special functions. The rest have configurable drive
+  strength, input enable, schmitt trigger, slew rate, pull-up and pull-down in
+  addition to a special strong pull up.
+
+  Certain pads in group 1 can be muxed to AUDIO_PA0 - AUDIO_PA30 functions and
+  are then meant to be used by the audio co-processor. Each such pad can then
+  be further muxed to either audio GPIO or one of 4 functions such as UART, I2C
+  and I2S. If the audio pad is muxed to one of the 4 functions then pinconf is
+  also configured in different registers. All of this is done from a different
+  AUDIO_IOCTRL memory range and is left to the audio co-processor for now.
+
+properties:
+  compatible:
+    enum:
+      - thead,th1520-pinctrl
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  thead,pad-group:
+    description: |
+      Select the pad group that is associated with the pin controller instance.
+
+        Base Address   Name           Group
+        0xFF_FFF4_A000 PADCTRL_AOSYS  1
+        0xFF_E7F3_C000 PADCTRL1_APSYS 2
+        0xFF_EC00_7000 PADCTRL0_APSYS 3
+
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [1, 2, 3]
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+patternProperties:
+  '-[0-9]+$':
+    type: object
+    additionalProperties: false
+
+    patternProperties:
+      '-pins$':
+        type: object
+        allOf:
+          - $ref: /schemas/pinctrl/pincfg-node.yaml#
+          - $ref: /schemas/pinctrl/pinmux-node.yaml#
+
+        additionalProperties: false
+
+        description:
+          A pinctrl node should contain at least one subnode describing one
+          or more pads and their associated pinmux and pinconf settings.
+
+        properties:
+          pins:
+            description: List of pads that properties in the node apply to.
+
+          function:
+            enum: [ gpio, pwm, uart, ir, i2c, spi, qspi, sdio, audio, i2s,
+                    gmac0, gmac1, dpu0, dpu1, isp, hdmi, bootsel, debug,
+                    clock, jtag, iso7816, efuse, reset ]
+            description: The mux function to select for the given pins.
+
+          bias-disable: true
+
+          bias-pull-up:
+            oneOf:
+              - type: boolean
+                description: Enable the regular 48kOhm pull-up
+              - enum: [ 2100, 48000 ]
+                description: Enable the strong 2.1kOhm pull-up or regular 48kOhm pull-up
+
+          bias-pull-down:
+            oneOf:
+              - type: boolean
+              - const: 44000
+            description: Enable the regular 44kOhm pull-down
+
+          drive-strength:
+            enum: [ 1, 2, 3, 5, 7, 8, 10, 12, 13, 15, 16, 18, 20, 21, 23, 25 ]
+            description: Drive strength in mA
+
+          input-enable: true
+
+          input-disable: true
+
+          input-schmitt-enable: true
+
+          input-schmitt-disable: true
+
+          slew-rate:
+            maximum: 1
+
+        required:
+          - pins
+
+additionalProperties: false
+
+examples:
+  - |
+    padctrl0_apsys: pinctrl@ec007000 {
+        compatible = "thead,th1520-pinctrl";
+        reg = <0xec007000 0x1000>;
+        clocks = <&apb_clk>;
+        thead,pad-group = <3>;
+
+        uart0_pins: uart0-0 {
+            tx-pins {
+                pins = "UART0_TXD";
+                function = "uart";
+                bias-disable;
+                drive-strength = <3>;
+                input-disable;
+                input-schmitt-disable;
+                slew-rate = <0>;
+            };
+
+            rx-pins {
+                pins = "UART0_RXD";
+                function = "uart";
+                bias-disable;
+                drive-strength = <1>;
+                input-enable;
+                input-schmitt-enable;
+                slew-rate = <0>;
+            };
+        };
+    };
+
+    padctrl1_apsys: pinctrl@e7f3c000 {
+        compatible = "thead,th1520-pinctrl";
+        reg = <0xe7f3c000 0x1000>;
+        clocks = <&apb_clk>;
+        thead,pad-group = <2>;
+
+        i2c5_pins: i2c5-0 {
+            i2c-pins {
+                pins = "QSPI1_CSN0",    /* I2C5_SCL */
+                       "QSPI1_D0_MOSI"; /* I2C5_SDA */
+                function = "i2c";
+                bias-pull-up = <2100>;
+                drive-strength = <7>;
+                input-enable;
+                input-schmitt-enable;
+                slew-rate = <0>;
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index c27f3190737f..dd74c9aa2009 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19942,6 +19942,7 @@ L:	linux-riscv@lists.infradead.org
 S:	Maintained
 T:	git https://github.com/pdp7/linux.git
 F:	Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
+F:	Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml
 F:	arch/riscv/boot/dts/thead/
 F:	drivers/clk/thead/clk-th1520-ap.c
 F:	include/dt-bindings/clock/thead,th1520-clk-ap.h

-- 
2.34.1


