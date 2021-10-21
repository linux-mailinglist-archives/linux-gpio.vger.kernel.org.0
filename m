Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D84B436974
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Oct 2021 19:43:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232382AbhJURpa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Oct 2021 13:45:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232376AbhJURpE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Oct 2021 13:45:04 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41094C0613B9;
        Thu, 21 Oct 2021 10:42:48 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id w19so525922edd.2;
        Thu, 21 Oct 2021 10:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=etaQItRNjj/enFUFDfmsaC1oEhl7tTCegAPe8SqnEa4=;
        b=eIVkPoB3xWsbjt8wgQz73InY7RH6tRQRCDu7Ulm3xncO1vsHfjLwzLozB0fFeiGBA9
         x3y24NKBXtFYw1dMJAnWDKkn2eqf81+XiiVMomxLIyM47wGjiExqCcYURsYpIdZruHG5
         qOQR+DTAjT4TGSdsDlvNzMVP03fbTvpYYLld6PwrRx0UhRyUDcfNDXDJJpshWZFxlTS6
         No/JOuQnJ4okkX3ZejdvOAWl8m15jK+iPXX+eILFUGuoyazDUXfp9cJsbej1hBr68ZWq
         vtyf3iTVC4ohJrvBxcQE7iW+XVJrcHIXAK8oJbMB6n8I3mJoVFnZol5eq3Jl/+w1yDFC
         GQcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=etaQItRNjj/enFUFDfmsaC1oEhl7tTCegAPe8SqnEa4=;
        b=K+9w1nu0q8i7X0JmUzUR7I9zoB+cRIc1QXDvQ9MYZbXDpJsZCW9qS1YhUfIfMZ1Mar
         jePQ4ga02PiDbUn5u8llnBl5S86cW3tVSsUSMxO37KNFwPzXHfx7OFimqWteeH/fDKjH
         lPnPupzfu0NMFdGjraGCECRtitDVi9y5uK3HQot1V7vzhdjEZwpW5EPz4qJg+CKz/Wfw
         VMIbTnFRayt1nZEUEESUQGDfCjuZvWp56XRzeSO/b8OBcBbITobrB4i2mZo2llvwvd4C
         953f1D4DHH63KQ5oshzclBNgoC280zW3WDoxflYNssel75sXPHzPoyHSOjzevDgvKV9c
         3UdQ==
X-Gm-Message-State: AOAM530LuH7MA1We9+MRIDdrv7q+PlmDJLCwAj8ipWgzPTLFmdL9YfbT
        90w0oS5qZgZc2ZcsyIvzP7A=
X-Google-Smtp-Source: ABdhPJwVll2mJspTJ9A4kA87pSHYnhNxbDLsRGZEBnQWv+H7059RHoYerbJmgK3bsHbA9nhbHCzhOg==
X-Received: by 2002:a05:6402:4304:: with SMTP id m4mr9575901edc.326.1634838166756;
        Thu, 21 Oct 2021 10:42:46 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
        by smtp.gmail.com with ESMTPSA id h7sm3144847edt.37.2021.10.21.10.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 10:42:46 -0700 (PDT)
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
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/16] dt-bindings: pinctrl: Add StarFive JH7100 bindings
Date:   Thu, 21 Oct 2021 19:42:18 +0200
Message-Id: <20211021174223.43310-12-kernel@esmil.dk>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211021174223.43310-1-kernel@esmil.dk>
References: <20211021174223.43310-1-kernel@esmil.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add bindings for the StarFive JH7100 GPIO/pin controller.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
---
 .../pinctrl/starfive,jh7100-pinctrl.yaml      | 274 ++++++++++++++++++
 1 file changed, 274 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jh7100-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jh7100-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jh7100-pinctrl.yaml
new file mode 100644
index 000000000000..342ecd91a3b0
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jh7100-pinctrl.yaml
@@ -0,0 +1,274 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/starfive,jh7100-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH7100 Pin Controller Device Tree Bindings
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
+      - const: "gpio"
+      - const: "padctl"
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
+    description: |
+      Number of cells in GPIO specifier. Since the generic GPIO
+      binding is used, the amount of cells must be specified as 2.
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
+      The SoC has a global setting selecting one of 7 different pinmux
+      configurations of the pads named GPIO[0:63] and FUNC_SHARE[0:141]. After
+      this global setting is chosen only the 64 "GPIO" pins can be further
+      muxed by configuring them to be controlled by certain peripherals rather
+      than software.
+      Note that in configuration 0 none of GPIOs are routed to pads, and only
+      in configuration 1 are the GPIOs routed to the pads named GPIO[0:63].
+      If this property is not set it defaults to the configuration already
+      chosen by the earlier boot stages.
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
+  '-[0-9]*$':
+    type: object
+    patternProperties:
+      '-pins*$':
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
+              macro. Either this or "pinmux" has to be specified.
+
+          pinmux:
+            description: |
+              The list of GPIO identifiers and their mux settings that
+              properties in the node apply to. This should be set using the
+              GPIOMUX macro. Either this or "pins" has to be specified.
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
+        gpio: pinctrl@11910000 {
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
+                rx-pin {
+                    pinmux = <GPIOMUX(13, GPO_LOW, GPO_DISABLE,
+                              GPI_UART3_PAD_SIN)>;
+                    bias-pull-up;
+                    input-enable;
+                    input-schmitt-enable;
+                };
+                tx-pin {
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

