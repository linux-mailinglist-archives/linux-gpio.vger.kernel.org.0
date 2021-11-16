Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5E77453520
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Nov 2021 16:06:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238144AbhKPPIg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Nov 2021 10:08:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236194AbhKPPHR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Nov 2021 10:07:17 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A6A0C061226;
        Tue, 16 Nov 2021 07:02:15 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id r11so25347485edd.9;
        Tue, 16 Nov 2021 07:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GS0NC5qfhI1GA5dEA0GnRmIq9rDYumLgycMlqKtyi0g=;
        b=qBAaVA5vKIyf8xZhHWOFsazp6CurzEmOklwIIoebtF0Adpro2x7K6W9QMflekpufrV
         tSEUJAWqEInb+8SjgQID1y57v7SVcKpi0QiYh+vuHqquHt/SMAz5zTvasdipNLGeq5Lj
         r9CI2uGRAewt/rwn15ck0kkudBsumXIaMEnJHjTBsZ4TFm9CkY/JYRsNndbuBVkqoSYU
         BZP8WOfFj47vUhO+3mQSfqzWEqfX+PeHE8z6Y0K0PUq28VALXmpx8oN316XmT8HlvFF9
         /yBL0GzSuXKtn+4elnPjKsHUgvShH8kBKglyJEWfol7Tfitt4C74R+/3CYcITOqqB2JM
         FMJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=GS0NC5qfhI1GA5dEA0GnRmIq9rDYumLgycMlqKtyi0g=;
        b=3E60DTddRs071Js1KNG9A3Ythr15TvgfT2KsIHouiz7bok9tA2DFU4ZMDdFpIIToo9
         QaGGciTc3+boarYcHKk4YlW4cp2lnuLWdje98bpSxbgCzrcEizOeb0eRAYkCtaXyChbY
         MbpM0LjE2gKGavNABzBx8l7pB1j4MN646o9sN8HeRseyyJT+3bwQSVr07QMYvHUX31l/
         iZWT8sR4mLUwt68V6vn1JdoAz93UCnYMLZpZUGhpB3tsHG93uLewaUQwpE675FGzz97k
         2usHR7gAziOfiaQb6dMV9McxTc4aDk7ASFxJzP1Ep+iVH5PNWuSz8QsjMnbps784I/KX
         1tBg==
X-Gm-Message-State: AOAM530pfHWPQpTn2nURjqfXHgHggCFVYDRNb3CtojGAlu/qOYS227e7
        akpeHYGmO6JnrHtv5pxe6nQ=
X-Google-Smtp-Source: ABdhPJx5UEZJ3VGh5umNRV73vjeRS9phAagHqL4kK93yLs6wGMtag6F0Y7yhdesaNpKYeuPJy1++ng==
X-Received: by 2002:a05:6402:1a27:: with SMTP id be7mr10525778edb.187.1637074931513;
        Tue, 16 Nov 2021 07:02:11 -0800 (PST)
Received: from stitch.. ([2a02:aa7:4600:b4ae:a375:e7a0:9eaf:8d7b])
        by smtp.gmail.com with ESMTPSA id u16sm9414311edr.43.2021.11.16.07.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 07:02:11 -0800 (PST)
Sender: Emil Renner Berthing <emil.renner.berthing@gmail.com>
From:   Emil Renner Berthing <kernel@esmil.dk>
To:     linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-serial@vger.kernel.org
Cc:     Emil Renner Berthing <kernel@esmil.dk>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        Drew Fustini <drew@beagleboard.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Zhu <michael.zhu@starfivetech.com>,
        Fu Wei <tekkamanninja@gmail.com>,
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Matteo Croce <mcroce@microsoft.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 11/16] dt-bindings: pinctrl: Add StarFive JH7100 bindings
Date:   Tue, 16 Nov 2021 16:01:14 +0100
Message-Id: <20211116150119.2171-12-kernel@esmil.dk>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211116150119.2171-1-kernel@esmil.dk>
References: <20211116150119.2171-1-kernel@esmil.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add bindings for the GPIO/pin controller on the JH7100 RISC-V SoC by
StarFive Ltd. This is a test chip for their upcoming JH7110 SoC.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../pinctrl/starfive,jh7100-pinctrl.yaml      | 307 ++++++++++++++++++
 1 file changed, 307 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jh7100-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jh7100-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jh7100-pinctrl.yaml
new file mode 100644
index 000000000000..92963604422f
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jh7100-pinctrl.yaml
@@ -0,0 +1,307 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/starfive,jh7100-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH7100 Pin Controller Device Tree Bindings
+
+description: |
+  Bindings for the JH7100 RISC-V SoC from StarFive Ltd.
+
+  Out of the SoC's many pins only the ones named PAD_GPIO[0] to PAD_GPIO[63]
+  and PAD_FUNC_SHARE[0] to PAD_FUNC_SHARE[141] can be multiplexed and have
+  configurable bias, drive strength, schmitt trigger etc. The SoC has an
+  interesting 2-layered approach to pin muxing best illustrated by the diagram
+  below.
+
+                          Signal group 0, 1, ... or 6
+                                 ___|___
+                                |       |
+    LCD output -----------------|       |
+    CMOS Camera interface ------|       |--- PAD_GPIO[0]
+    Ethernet PHY interface -----|  MUX  |--- PAD_GPIO[1]
+      ...                       |       |      ...
+                                |       |--- PAD_GPIO[63]
+     -------- GPIO0 ------------|       |
+    |  -------|-- GPIO1 --------|       |--- PAD_FUNC_SHARE[0]
+    | |       |   |             |       |--- PAD_FUNC_SHARE[1]
+    | |       |   |  ...        |       |       ...
+    | |       |   |             |       |--- PAD_FUNC_SHARE[141]
+    | |  -----|---|-- GPIO63 ---|       |
+    | | |     |   |   |          -------
+    UART0     UART1 --
+
+
+  The big MUX in the diagram only has 7 different ways of mapping peripherals
+  on the left to pins on the right. StarFive calls the 7 configurations "signal
+  groups".
+  However some peripherals have their I/O go through the 64 "GPIOs". The
+  diagram only shows UART0 and UART1, but this also includes a number of other
+  UARTs, I2Cs, SPIs, PWMs etc. All these peripherals are connected to all 64
+  GPIOs such that any GPIO can be set up to be controlled by any of the
+  peripherals.
+  Note that signal group 0 doesn't map any of the GPIOs to pins, and only
+  signal group 1 maps the GPIOs to the pins named PAD_GPIO[0] to PAD_GPIO[63].
+
+maintainers:
+  - Emil Renner Berthing <kernel@esmil.dk>
+  - Drew Fustini <drew@beagleboard.org>
+
+properties:
+  compatible:
+    const: starfive,jh7100-pinctrl
+
+  reg:
+    minItems: 2
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: gpio
+      - const: padctl
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+
+  interrupts:
+    maxItems: 1
+    description: The GPIO parent interrupt.
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+  starfive,signal-group:
+    description: |
+      Select one of the 7 signal groups. If this property is not set it
+      defaults to the configuration already chosen by the earlier boot stages.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2, 3, 4, 5, 6]
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - gpio-controller
+  - "#gpio-cells"
+  - interrupts
+  - interrupt-controller
+  - "#interrupt-cells"
+
+patternProperties:
+  '-[0-9]+$':
+    type: object
+    patternProperties:
+      '-pins$':
+        type: object
+        description: |
+          A pinctrl node should contain at least one subnode representing the
+          pinctrl groups available on the machine. Each subnode will list the
+          pins it needs, and how they should be configured, with regard to
+          muxer configuration, bias, input enable/disable, input schmitt
+          trigger enable/disable, slew-rate and drive strength.
+        $ref: "/schemas/pinctrl/pincfg-node.yaml"
+
+        properties:
+          pins:
+            description: |
+              The list of pin identifiers that properties in the node apply to.
+              This should be set using either the PAD_GPIO or PAD_FUNC_SHARE
+              macros.
+              Either this or "pinmux" has to be specified, but not both.
+            $ref: "/schemas/pinctrl/pinmux-node.yaml#/properties/pins"
+
+          pinmux:
+            description: |
+              The list of GPIOs and their mux settings that properties in the
+              node apply to. This should be set using the GPIOMUX macro.
+              Either this or "pins" has to be specified, but not both.
+            $ref: "/schemas/pinctrl/pinmux-node.yaml#/properties/pinmux"
+
+          bias-disable: true
+
+          bias-pull-up:
+            type: boolean
+
+          bias-pull-down:
+            type: boolean
+
+          drive-strength:
+            enum: [ 14, 21, 28, 35, 42, 49, 56, 63 ]
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
+            maximum: 7
+
+          starfive,strong-pull-up:
+            description: enable strong pull-up.
+            type: boolean
+
+        additionalProperties: false
+
+    additionalProperties: false
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/starfive-jh7100.h>
+    #include <dt-bindings/reset/starfive-jh7100.h>
+    #include <dt-bindings/pinctrl/pinctrl-starfive.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        pinctrl@11910000 {
+            compatible = "starfive,jh7100-pinctrl";
+            reg = <0x0 0x11910000 0x0 0x10000>,
+                  <0x0 0x11858000 0x0 0x1000>;
+            reg-names = "gpio", "padctl";
+            clocks = <&clkgen JH7100_CLK_GPIO_APB>;
+            resets = <&clkgen JH7100_RSTN_GPIO_APB>;
+            interrupts = <32>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            starfive,signal-group = <6>;
+
+            gmac_pins_default: gmac-0 {
+                gtxclk-pins {
+                    pins = <PAD_FUNC_SHARE(115)>;
+                    bias-pull-up;
+                    drive-strength = <35>;
+                    input-enable;
+                    input-schmitt-enable;
+                    slew-rate = <0>;
+                };
+                miitxclk-pins {
+                    pins = <PAD_FUNC_SHARE(116)>;
+                    bias-pull-up;
+                    drive-strength = <14>;
+                    input-enable;
+                    input-schmitt-disable;
+                    slew-rate = <0>;
+                };
+                tx-pins {
+                    pins = <PAD_FUNC_SHARE(117)>,
+                           <PAD_FUNC_SHARE(119)>,
+                           <PAD_FUNC_SHARE(120)>,
+                           <PAD_FUNC_SHARE(121)>,
+                           <PAD_FUNC_SHARE(122)>,
+                           <PAD_FUNC_SHARE(123)>,
+                           <PAD_FUNC_SHARE(124)>,
+                           <PAD_FUNC_SHARE(125)>,
+                           <PAD_FUNC_SHARE(126)>;
+                    bias-disable;
+                    drive-strength = <35>;
+                    input-disable;
+                    input-schmitt-disable;
+                    slew-rate = <0>;
+                };
+                rxclk-pins {
+                    pins = <PAD_FUNC_SHARE(127)>;
+                    bias-pull-up;
+                    drive-strength = <14>;
+                    input-enable;
+                    input-schmitt-disable;
+                    slew-rate = <6>;
+                };
+                rxer-pins {
+                    pins = <PAD_FUNC_SHARE(129)>;
+                    bias-pull-up;
+                    drive-strength = <14>;
+                    input-enable;
+                    input-schmitt-disable;
+                    slew-rate = <0>;
+                };
+                rx-pins {
+                    pins = <PAD_FUNC_SHARE(128)>,
+                           <PAD_FUNC_SHARE(130)>,
+                           <PAD_FUNC_SHARE(131)>,
+                           <PAD_FUNC_SHARE(132)>,
+                           <PAD_FUNC_SHARE(133)>,
+                           <PAD_FUNC_SHARE(134)>,
+                           <PAD_FUNC_SHARE(135)>,
+                           <PAD_FUNC_SHARE(136)>,
+                           <PAD_FUNC_SHARE(137)>,
+                           <PAD_FUNC_SHARE(138)>,
+                           <PAD_FUNC_SHARE(139)>,
+                           <PAD_FUNC_SHARE(140)>,
+                           <PAD_FUNC_SHARE(141)>;
+                    bias-pull-up;
+                    drive-strength = <14>;
+                    input-enable;
+                    input-schmitt-enable;
+                    slew-rate = <0>;
+                };
+            };
+
+            i2c0_pins_default: i2c0-0 {
+                i2c-pins {
+                    pinmux = <GPIOMUX(62, GPO_LOW,
+                              GPO_I2C0_PAD_SCK_OEN,
+                              GPI_I2C0_PAD_SCK_IN)>,
+                             <GPIOMUX(61, GPO_LOW,
+                              GPO_I2C0_PAD_SDA_OEN,
+                              GPI_I2C0_PAD_SDA_IN)>;
+                    bias-disable; /* external pull-up */
+                    input-enable;
+                    input-schmitt-enable;
+                };
+            };
+
+            uart3_pins_default: uart3-0 {
+                rx-pins {
+                    pinmux = <GPIOMUX(13, GPO_LOW, GPO_DISABLE,
+                              GPI_UART3_PAD_SIN)>;
+                    bias-pull-up;
+                    input-enable;
+                    input-schmitt-enable;
+                };
+                tx-pins {
+                    pinmux = <GPIOMUX(14, GPO_UART3_PAD_SOUT,
+                              GPO_ENABLE, GPI_NONE)>;
+                    bias-disable;
+                    input-disable;
+                    input-schmitt-disable;
+                };
+            };
+        };
+
+        gmac {
+            pinctrl-0 = <&gmac_pins_default>;
+            pinctrl-names = "default";
+        };
+
+        i2c0 {
+            pinctrl-0 = <&i2c0_pins_default>;
+            pinctrl-names = "default";
+        };
+
+        uart3 {
+            pinctrl-0 = <&uart3_pins_default>;
+            pinctrl-names = "default";
+        };
+    };
+
+...
-- 
2.33.1

