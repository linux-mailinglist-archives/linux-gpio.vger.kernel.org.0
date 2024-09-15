Return-Path: <linux-gpio+bounces-10126-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD50A97946B
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Sep 2024 04:42:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F253F1C213B2
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Sep 2024 02:42:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B2FFC152;
	Sun, 15 Sep 2024 02:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="HzLsDb7T"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B51710E0
	for <linux-gpio@vger.kernel.org>; Sun, 15 Sep 2024 02:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726368125; cv=none; b=RvIvNMUbyJs1L0fimom/EAM8V0NQJdMFg7EjVtmheZ56b0a1lfj819gc8WgUCpKxzOmSNNXFOKWqZM06O1Rv6G7CJkEUHxrntU1GfioBa9Zad96xEgUlIQq2Jx/Jn/GVsHUHc5e75M2hb/5Mx6yU+IitLoPJjItDcMO4BkuQnUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726368125; c=relaxed/simple;
	bh=IUCwRcXE5I82NIB19aXE/IX+5lvyBc2mJr7JR7PD2NE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D1qeDiJofd01/+DwcC4n0SNB1S10f8QpXB/FePo8zo669eiHsrHFVzjQGqL3rIhYHcSNONODMwAV6Bo91ntSou5BgdjUFxzCfxGI0JA6shBQAz7zcgjNZIllq75tMw/mbwPTX2iZ3rOWc97HVuduznA9KO7qeqWq9BeksTv1AT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=HzLsDb7T; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6d74ff7216eso15976257b3.1
        for <linux-gpio@vger.kernel.org>; Sat, 14 Sep 2024 19:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1726368122; x=1726972922; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tMQRtPuaHxiDneHLGsqEiUQVCNL6uGmkw4AEy7QlmYA=;
        b=HzLsDb7TVMAoMvxA7LViFp3qCyKqk3TCASIHbmGXbkGFhJ0T6lT8KpTQeMF5ZJxKiA
         NvJhF3n6Fk8sg+MYnJlvC+QF/wBkLtJt0fHRSlmanHN8Jkb3Sa8i2AfGnBOUXcYoaa1I
         BMpr+A5ZikacYlh9Xg/MHAWWfUrpRbWdbTfZyVgqi/fpkkyAbmWlO8zRjuNS5kJl9I89
         I/AIQNscBAfg+mmebyU474rbeMh8qjw+eGOLyOEiglYadifgi/0Kk1yGPeBrDSMCPMen
         XWq8AdakNmLoA5cbWT9urJmALY2ng6tD97o7QtoqXfgkq0cCbNRpngSCff6oMlf122Ni
         I20w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726368122; x=1726972922;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tMQRtPuaHxiDneHLGsqEiUQVCNL6uGmkw4AEy7QlmYA=;
        b=SkqcrmRDh4wLq4AYT3B+jsRZSqFuQb77LkBE5ZKZpT93Z/epVH6I7TXbubhbV63284
         MP+PBndNsIdowM12iiwhNw2ljMiGinB4GU0I60r7SX/ZUCRdU6Z7ji4l6+tmi1838Rux
         cCDO6Rlx4M/nPPLsQwcNOVEBScvXehb6EdNa9Ceh3E4B40gtmjPSwVXkAyPIDRz2kR0V
         RuAKPLotwba+LkYwlo5A9p/SujAq7GfrBVRkEn7s2YxcRDwgUBasT5ysQ3OLZHAYsxZh
         aCTJgQDk+Jk1RvrqV4AgasMAdUADnvHmEZYJLif53LyrVsX+E6KMLFPDDrdgFzm5qYtA
         2KTA==
X-Forwarded-Encrypted: i=1; AJvYcCUA8JvQuAI1ss9aSZCTGV7P7NDF92U2EwAjSqdpnXZ546tLIbqKgYyuMyqBcYU9Z/EUMEj/5wzPGmrh@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+KhaQkA1BS+UKiOXQ0JagC7Co1WQhtl9L0PJgSV25Cn8qluFD
	Si+mKxvC5727iXW+YvuQsvFXHO/WdvfrRwa/OyaSQWudDdU37wVARHW4kKtsV2I=
X-Google-Smtp-Source: AGHT+IHHNR7CGDPc0Pjeg9v8F+XBJ1eide8KNVapGjJQGi+bc28YRc4SOy1s7v6U0+ArPman2j0mTQ==
X-Received: by 2002:a05:690c:4904:b0:6db:c6ea:6eb9 with SMTP id 00721157ae682-6dbcc5946a8mr59791137b3.45.1726368121924;
        Sat, 14 Sep 2024 19:42:01 -0700 (PDT)
Received: from [127.0.1.1] ([216.139.163.245])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6dbe2e0d924sm4129097b3.41.2024.09.14.19.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2024 19:42:01 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Sat, 14 Sep 2024 19:40:49 -0700
Subject: [PATCH v2 1/8] dt-bindings: pinctrl: Add thead,th1520-pinctrl
 bindings
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240914-th1520-pinctrl-v2-1-3ba67dde882c@tenstorrent.com>
References: <20240914-th1520-pinctrl-v2-0-3ba67dde882c@tenstorrent.com>
In-Reply-To: <20240914-th1520-pinctrl-v2-0-3ba67dde882c@tenstorrent.com>
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.14.1

From: Emil Renner Berthing <emil.renner.berthing@canonical.com>

Add bindings for the pin controllers on the T-Head TH1520 RISC-V SoC.

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
index 878dcd23b331..a73953c0f080 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19700,6 +19700,7 @@ L:	linux-riscv@lists.infradead.org
 S:	Maintained
 T:	git https://github.com/pdp7/linux.git
 F:	Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
+F:	Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml
 F:	arch/riscv/boot/dts/thead/
 F:	drivers/clk/thead/clk-th1520-ap.c
 F:	include/dt-bindings/clock/thead,th1520-clk-ap.h

-- 
2.34.1


