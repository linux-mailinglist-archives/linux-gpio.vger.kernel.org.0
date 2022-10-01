Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B83E95F18DE
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Oct 2022 05:07:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232694AbiJADHv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Sep 2022 23:07:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232631AbiJADHF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Sep 2022 23:07:05 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE11B1AD7BB;
        Fri, 30 Sep 2022 20:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1664593568; x=1696129568;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jw9+Bl9UzFHbaTwkzJOuW32JSV1lhQAz0nBruIqfIOc=;
  b=M14EPs0RHEb/lNb4gyrwf+JkRXxyf5jnr55kYsMkHNulv8zjggxm2ZoQ
   hfFCW0egoaMCn41WpuzZinemsEn3en/AOHmFL5HpgWNc4Q1PGSc57hndP
   eqxdgLJg3w41dQ7yz70AyKayo5Lzxibfl+8PuA6uT8M/EOAULvrZkhe2i
   g=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 30 Sep 2022 20:06:02 -0700
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2022 20:06:02 -0700
Received: from hu-molvera-sd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Fri, 30 Sep 2022 20:06:02 -0700
From:   Melody Olvera <quic_molvera@quicinc.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Melody Olvera <quic_molvera@quicinc.com>
Subject: [PATCH 2/2] pinctrl: qcom: Add QDU1000/QRU1000 pinctrl driver
Date:   Fri, 30 Sep 2022 20:05:46 -0700
Message-ID: <20221001030546.28220-3-quic_molvera@quicinc.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221001030546.28220-1-quic_molvera@quicinc.com>
References: <20221001030546.28220-1-quic_molvera@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add pin control driver for the TLMM block found in the QDU1000
and QRU1000 SoC.

Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
---
 .../pinctrl/qcom,qdru1000-pinctrl.yaml        |  177 +-
 drivers/pinctrl/qcom/Kconfig                  |   10 +
 drivers/pinctrl/qcom/Makefile                 |    1 +
 drivers/pinctrl/qcom/pinctrl-qdru1000.c       |   59 +
 drivers/pinctrl/qcom/pinctrl-qdru1000.h       | 1896 +++++++++++++++++
 5 files changed, 2050 insertions(+), 93 deletions(-)
 create mode 100644 drivers/pinctrl/qcom/pinctrl-qdru1000.c
 create mode 100644 drivers/pinctrl/qcom/pinctrl-qdru1000.h

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,qdru1000-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,qdru1000-pinctrl.yaml
index e8d938303231..42176247862c 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,qdru1000-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,qdru1000-pinctrl.yaml
@@ -10,7 +10,11 @@ maintainers:
   - Melody Olvera <quic_molvera@quicinc.com>
 
 description: |
-  This binding describes the Top Level Mode Multiplexer block.
+  This binding describes the Top Level Mode Multiplexer block (TLMM) found
+  in the QDU1000 and QRU1000 platforms.
+
+allOf:
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
 
 properties:
   compatible:
@@ -19,105 +23,92 @@ properties:
       - const: qcom,qru1000-tlmm
 
   reg:
-    items:
-      - description: Base address of TLMM register space
-      - description: Size of TLMM register space
-
-  interrupts:
-    minItems: 0
     maxItems: 1
-    items:
-      - const: TLMM summary IRQ
-
+  interrupts: true
   interrupt-controller: true
-
-  '#interrupt-cells':
-    const: 2
-
+  '#interrupt-cells': true
   gpio-controller: true
+  '#gpio-cells': true
+  wakeup-parent: true
 
-  '#gpio-cells':
-    const: 2
-
-  wakeup-parent:
-    maxItems: 1
-    description:
-      Please refer to ../gpio/gpio.txt and ../interrupt-controller/interrupts.txt for
-      a general description of GPIO and interrupt bindings.
-
-      Please refer to pinctrl-bindings.txt in this directory for details of the
-      common pinctrl bindings used by client devices, including the meaning of the
-      phrase "pin configuration node".
-
-      The pin configuration nodes act as a container for an arbitrary number of
-      subnodes. Each of these subnodes represents some desired configuration for a
-      pin, a group, or a list of pins or groups. This configuration can include the
-      mux function to select on those pin(s)/group(s), and various pin configuration
-      parameters, such as pull-up, drive strength, etc.
+required:
+  - compatible
+  - reg
 
+additionalProperties: false
 
 # PIN CONFIGURATION NODES
-patternPropetries:
-  '^.*$':
-    if:
-      type: object
-    then:
-      properties:
-        pins:
-          description:
-            List of gpio pins affected by the properties specified in
-            this subnode.
-          items:
-            oneOf:
-              - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-9][0-9]|20[0-9])"
-              - enum: [ sdc2_clk, sdc2_cmd, sdc2_data, ufs_reset ]
-            minItems: 1
-            maxItems: 36
-        function:
-          description:
-            Specify the alternative function to be configured for the
-            specified pins. Functions are only valid for gpio pins.
-          enum: [gpio, aon_cam, atest_char, atest_char0, atest_char1, atest_char2, atest_char3,
-            atest_usb0, atest_usb00, atest_usb01, atest_usb02, atest_usb03, audio_ref, cam_mclk,
-            cci_async, cci_i2c, cci_timer0, cci_timer1, cci_timer2, cci_timer3, cci_timer4,
-            cmu_rng0, cmu_rng1, cmu_rng2, cmu_rng3, coex_uart1, coex_uart2, cri_trng, cri_trng0,
-            cri_trng1, dbg_out, ddr_bist, ddr_pxi0, ddr_pxi1, ddr_pxi2, ddr_pxi3, dp_hot, gcc_gp1,
-            gcc_gp2, gcc_gp3, ibi_i3c, jitter_bist, mdp_vsync, mdp_vsync0, mdp_vsync1, mdp_vsync2,
-            mdp_vsync3, mi2s0_data0, mi2s0_data1, mi2s0_sck, mi2s0_ws, mi2s2_data0, mi2s2_data1,
-            mi2s2_sck, mi2s2_ws, mss_grfc0, mss_grfc1, mss_grfc10, mss_grfc11, mss_grfc12,
-            mss_grfc2, mss_grfc3, mss_grfc4, mss_grfc5, mss_grfc6, mss_grfc7, mss_grfc8, mss_grfc9,
-            nav_0, nav_1, nav_2, pcie0_clkreqn, pcie1_clkreqn, phase_flag0, phase_flag1,
-            phase_flag10, phase_flag11, phase_flag12, phase_flag13, phase_flag14, phase_flag15,
-            phase_flag16, phase_flag17, phase_flag18, phase_flag19, phase_flag2, phase_flag20,
-            phase_flag21, phase_flag22, phase_flag23, phase_flag24, phase_flag25, phase_flag26,
-            phase_flag27, phase_flag28, phase_flag29, phase_flag3, phase_flag30, phase_flag31,
-            phase_flag4, phase_flag5, phase_flag6, phase_flag7, phase_flag8, phase_flag9, pll_bist,
-            pll_clk, pri_mi2s, prng_rosc0, prng_rosc1, prng_rosc2, prng_rosc3, qdss_cti, qdss_gpio,
-            qdss_gpio0, qdss_gpio1, qdss_gpio10, qdss_gpio11, qdss_gpio12, qdss_gpio13, qdss_gpio14,
-            qdss_gpio15, qdss_gpio2, qdss_gpio3, qdss_gpio4, qdss_gpio5, qdss_gpio6, qdss_gpio7,
-            qdss_gpio8, qdss_gpio9, qlink0_enable, qlink0_request, qlink0_wmss, qlink1_enable,
-            qlink1_request, qlink1_wmss, qlink2_enable, qlink2_request, qlink2_wmss, qspi0, qspi1,
-            qspi2, qspi3, qspi_clk, qspi_cs, qup0, qup1, qup10, qup11, qup12, qup13, qup14, qup15,
-            qup16, qup17, qup18, qup19, qup2, qup20, qup21, qup3, qup4, qup5, qup6, qup7, qup8,
-            qup9, qup_l4, qup_l5, qup_l6, sd_write, sdc40, sdc41, sdc42, sdc43, sdc4_clk, sdc4_cmd,
-            sec_mi2s, tb_trig, tgu_ch0, tgu_ch1, tgu_ch2, tgu_ch3, tmess_prng0, tmess_prng1,
-            tmess_prng2, tmess_prng3, tsense_pwm1, tsense_pwm2, uim0_clk, uim0_data, uim0_present,
-            uim0_reset, uim1_clk, uim1_data, uim1_present, uim1_reset, usb2phy_ac, usb_phy, vfr_0,
-            vfr_1, vsense_trigger]
-        drive-strength:
-          enum: [2, 4, 6, 8, 10, 12, 14, 16]
-          default: 2
-          description:
-            Selects the drive strength for the specified pins, in mA.
-        bias-pull-down: true
-        bias-pull-up: true
-        bias-disable: true
-        output-high: true
-        output-low: true
-      required:
-        - pins
-        - function
-      additionalProperties: false
+patternProperties:
+  '-state$':
+    oneOf:
+      - $ref: "#/$defs/qcom-qdru1000-tlmm-state"
+      - patternProperties:
+          ".*":
+            $ref: "#/$defs/qcom-qdru1000-tlmm-state"
+
+$defs:
+  qcom-qdru1000-tlmm-state:
+    type: object
+    description:
+      Pinctrl nodes' client devices use subnodes for desired pin configuration.
+      Client device subnodes use below standard properties.
+    $ref: "qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state"
+    properties:
+      pins:
+        description:
+          List of gpio pins affected by the properties specified in
+          this subnode.
+        items:
+          oneOf:
+            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-9][0-9]|20[0-9])"
+            - enum: [ sdc2_clk, sdc2_cmd, sdc2_data, ufs_reset ]
+        minItems: 1
+        maxItems: 36
+      function:
+        description:
+          Specify the alternative function to be configured for the
+          specified pins. Functions are only valid for gpio pins.
+        enum: [gpio, aon_cam, atest_char, atest_char0, atest_char1, atest_char2, atest_char3,
+          atest_usb0, atest_usb00, atest_usb01, atest_usb02, atest_usb03, audio_ref, cam_mclk,
+          cci_async, cci_i2c, cci_timer0, cci_timer1, cci_timer2, cci_timer3, cci_timer4,
+          cmu_rng0, cmu_rng1, cmu_rng2, cmu_rng3, coex_uart1, coex_uart2, cri_trng, cri_trng0,
+          cri_trng1, dbg_out, ddr_bist, ddr_pxi0, ddr_pxi1, ddr_pxi2, ddr_pxi3, dp_hot, gcc_gp1,
+          gcc_gp2, gcc_gp3, ibi_i3c, jitter_bist, mdp_vsync, mdp_vsync0, mdp_vsync1, mdp_vsync2,
+          mdp_vsync3, mi2s0_data0, mi2s0_data1, mi2s0_sck, mi2s0_ws, mi2s2_data0, mi2s2_data1,
+          mi2s2_sck, mi2s2_ws, mss_grfc0, mss_grfc1, mss_grfc10, mss_grfc11, mss_grfc12,
+          mss_grfc2, mss_grfc3, mss_grfc4, mss_grfc5, mss_grfc6, mss_grfc7, mss_grfc8, mss_grfc9,
+          nav_0, nav_1, nav_2, pcie0_clkreqn, pcie1_clkreqn, phase_flag0, phase_flag1,
+          phase_flag10, phase_flag11, phase_flag12, phase_flag13, phase_flag14, phase_flag15,
+          phase_flag16, phase_flag17, phase_flag18, phase_flag19, phase_flag2, phase_flag20,
+          phase_flag21, phase_flag22, phase_flag23, phase_flag24, phase_flag25, phase_flag26,
+          phase_flag27, phase_flag28, phase_flag29, phase_flag3, phase_flag30, phase_flag31,
+          phase_flag4, phase_flag5, phase_flag6, phase_flag7, phase_flag8, phase_flag9, pll_bist,
+          pll_clk, pri_mi2s, prng_rosc0, prng_rosc1, prng_rosc2, prng_rosc3, qdss_cti, qdss_gpio,
+          qdss_gpio0, qdss_gpio1, qdss_gpio10, qdss_gpio11, qdss_gpio12, qdss_gpio13, qdss_gpio14,
+          qdss_gpio15, qdss_gpio2, qdss_gpio3, qdss_gpio4, qdss_gpio5, qdss_gpio6, qdss_gpio7,
+          qdss_gpio8, qdss_gpio9, qlink0_enable, qlink0_request, qlink0_wmss, qlink1_enable,
+          qlink1_request, qlink1_wmss, qlink2_enable, qlink2_request, qlink2_wmss, qspi0, qspi1,
+          qspi2, qspi3, qspi_clk, qspi_cs, qup0, qup1, qup10, qup11, qup12, qup13, qup14, qup15,
+          qup16, qup17, qup18, qup19, qup2, qup20, qup21, qup3, qup4, qup5, qup6, qup7, qup8,
+          qup9, qup_l4, qup_l5, qup_l6, sd_write, sdc40, sdc41, sdc42, sdc43, sdc4_clk, sdc4_cmd,
+          sec_mi2s, tb_trig, tgu_ch0, tgu_ch1, tgu_ch2, tgu_ch3, tmess_prng0, tmess_prng1,
+          tmess_prng2, tmess_prng3, tsense_pwm1, tsense_pwm2, uim0_clk, uim0_data, uim0_present,
+          uim0_reset, uim1_clk, uim1_data, uim1_present, uim1_reset, usb2phy_ac, usb_phy, vfr_0,
+          vfr_1, vsense_trigger]
+
+      bias-disable: true
+      bias-pull-down: true
+      bias-pull-up: true
+      drive-strength: true
+      input-enable: true
+      output-high: true
+      output-low: true
+
+    required:
+      - pins
+      - function
+
+    additionalProperties: false
 
 examples:
   - |
diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
index f415c13caae0..c8a7d6e44a81 100644
--- a/drivers/pinctrl/qcom/Kconfig
+++ b/drivers/pinctrl/qcom/Kconfig
@@ -390,6 +390,16 @@ config PINCTRL_SM8450
 	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
 	  Technologies Inc SM8450 platform.
 
+config PINCTRL_QDRU1000
+	tristate "Qualcomm Tehcnologies Inc QDU1000/QRU1000 pin controller driver"
+	depends on GPIOLIB && OF
+	depends on PINCTRL_MSM
+	help
+	  This is the pinctrl, pinmux, pinconf, and gpiolib driver for the
+	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
+	  Technologies Inc QDU1000 and QRU1000 platforms.
+
+
 config PINCTRL_LPASS_LPI
 	tristate "Qualcomm Technologies Inc LPASS LPI pin controller driver"
 	select PINMUX
diff --git a/drivers/pinctrl/qcom/Makefile b/drivers/pinctrl/qcom/Makefile
index fbd64853a24d..431a845b4e2d 100644
--- a/drivers/pinctrl/qcom/Makefile
+++ b/drivers/pinctrl/qcom/Makefile
@@ -45,4 +45,5 @@ obj-$(CONFIG_PINCTRL_SM8250) += pinctrl-sm8250.o
 obj-$(CONFIG_PINCTRL_SM8250_LPASS_LPI) += pinctrl-sm8250-lpass-lpi.o
 obj-$(CONFIG_PINCTRL_SM8350) += pinctrl-sm8350.o
 obj-$(CONFIG_PINCTRL_SM8450) += pinctrl-sm8450.o
+obj-$(CONFIG_PINCTRL_QDRU1000) += pinctrl-qdru1000.o
 obj-$(CONFIG_PINCTRL_LPASS_LPI) += pinctrl-lpass-lpi.o
diff --git a/drivers/pinctrl/qcom/pinctrl-qdru1000.c b/drivers/pinctrl/qcom/pinctrl-qdru1000.c
new file mode 100644
index 000000000000..8b931ff80bb4
--- /dev/null
+++ b/drivers/pinctrl/qcom/pinctrl-qdru1000.c
@@ -0,0 +1,59 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2021, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pinctrl/pinctrl.h>
+
+#include "pinctrl-msm.h"
+#include "pinctrl-qdru1000.h"
+
+static const struct msm_pinctrl_soc_data qdru1000_tlmm = {
+	.pins = qdru1000_pins,
+	.npins = ARRAY_SIZE(qdru1000_pins),
+	.functions = qdru1000_functions,
+	.nfunctions = ARRAY_SIZE(qdru1000_functions),
+	.groups = qdru1000_groups,
+	.ngroups = ARRAY_SIZE(qdru1000_groups),
+	.ngpios = 151,
+};
+
+static int qdru1000_tlmm_probe(struct platform_device *pdev)
+{
+	return msm_pinctrl_probe(pdev, &qdru1000_tlmm);
+}
+
+static const struct of_device_id qdru1000_tlmm_of_match[] = {
+	{ .compatible = "qcom,qdu1000-tlmm", },
+	{ .compatible = "qcom,qru1000-tlmm", },
+	{ },
+};
+
+static struct platform_driver qdru1000_tlmm_driver = {
+	.driver = {
+		.name = "qdru1000-tlmm",
+		.of_match_table = qdru1000_tlmm_of_match,
+	},
+	.probe = qdru1000_tlmm_probe,
+	.remove = msm_pinctrl_remove,
+};
+
+static int __init qdru1000_tlmm_init(void)
+{
+	return platform_driver_register(&qdru1000_tlmm_driver);
+}
+arch_initcall(qdru1000_tlmm_init);
+
+static void __exit qdru1000_tlmm_exit(void)
+{
+	platform_driver_unregister(&qdru1000_tlmm_driver);
+}
+module_exit(qdru1000_tlmm_exit);
+
+MODULE_DESCRIPTION("QTI QDRU1000 TLMM driver");
+MODULE_LICENSE("GPL v2");
+MODULE_DEVICE_TABLE(of, qdru1000_tlmm_of_match);
diff --git a/drivers/pinctrl/qcom/pinctrl-qdru1000.h b/drivers/pinctrl/qcom/pinctrl-qdru1000.h
new file mode 100644
index 000000000000..3c1f703ae53b
--- /dev/null
+++ b/drivers/pinctrl/qcom/pinctrl-qdru1000.h
@@ -0,0 +1,1896 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2021, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#define FUNCTION(fname)			                \
+	[msm_mux_##fname] = {		                \
+		.name = #fname,				\
+		.groups = fname##_groups,               \
+		.ngroups = ARRAY_SIZE(fname##_groups),	\
+	}
+
+#define REG_BASE 0x100000
+#define REG_SIZE 0x1000
+#define PINGROUP(id, f1, f2, f3, f4, f5, f6, f7, f8, f9)	\
+	{					        \
+		.name = "gpio" #id,			\
+		.pins = gpio##id##_pins,		\
+		.npins = (unsigned int)ARRAY_SIZE(gpio##id##_pins),	\
+		.funcs = (int[]){			\
+			msm_mux_gpio, /* gpio mode */	\
+			msm_mux_##f1,			\
+			msm_mux_##f2,			\
+			msm_mux_##f3,			\
+			msm_mux_##f4,			\
+			msm_mux_##f5,			\
+			msm_mux_##f6,			\
+			msm_mux_##f7,			\
+			msm_mux_##f8,			\
+			msm_mux_##f9			\
+		},				        \
+		.nfuncs = 10,				\
+		.ctl_reg = REG_BASE + REG_SIZE * id,			\
+		.io_reg = REG_BASE + 0x4 + REG_SIZE * id,		\
+		.intr_cfg_reg = REG_BASE + 0x8 + REG_SIZE * id,		\
+		.intr_status_reg = REG_BASE + 0xc + REG_SIZE * id,	\
+		.intr_target_reg = REG_BASE + 0x8 + REG_SIZE * id,	\
+		.mux_bit = 2,			\
+		.pull_bit = 0,			\
+		.drv_bit = 6,			\
+		.oe_bit = 9,			\
+		.in_bit = 0,			\
+		.out_bit = 1,			\
+		.intr_enable_bit = 0,		\
+		.intr_status_bit = 0,		\
+		.intr_target_bit = 5,		\
+		.intr_target_kpss_val = 3,	\
+		.intr_raw_status_bit = 4,	\
+		.intr_polarity_bit = 1,		\
+		.intr_detection_bit = 2,	\
+		.intr_detection_width = 2,	\
+	}
+
+#define SDC_QDSD_PINGROUP(pg_name, ctl, pull, drv)	\
+	{					        \
+		.name = #pg_name,			\
+		.pins = pg_name##_pins,			\
+		.npins = (unsigned int)ARRAY_SIZE(pg_name##_pins),	\
+		.ctl_reg = REG_BASE + ctl,				\
+		.io_reg = 0,				\
+		.intr_cfg_reg = 0,			\
+		.intr_status_reg = 0,			\
+		.intr_target_reg = 0,			\
+		.mux_bit = -1,				\
+		.pull_bit = pull,			\
+		.drv_bit = drv,				\
+		.oe_bit = -1,				\
+		.in_bit = -1,				\
+		.out_bit = -1,				\
+		.intr_enable_bit = -1,			\
+		.intr_status_bit = -1,			\
+		.intr_target_bit = -1,			\
+		.intr_raw_status_bit = -1,		\
+		.intr_polarity_bit = -1,		\
+		.intr_detection_bit = -1,		\
+		.intr_detection_width = -1,		\
+	}
+
+#define UFS_RESET(pg_name, offset)				\
+	{					        \
+		.name = #pg_name,			\
+		.pins = pg_name##_pins,			\
+		.npins = (unsigned int)ARRAY_SIZE(pg_name##_pins),	\
+		.ctl_reg = offset,			\
+		.io_reg = offset + 0x4,			\
+		.intr_cfg_reg = 0,			\
+		.intr_status_reg = 0,			\
+		.intr_target_reg = 0,			\
+		.mux_bit = -1,				\
+		.pull_bit = 3,				\
+		.drv_bit = 0,				\
+		.oe_bit = -1,				\
+		.in_bit = -1,				\
+		.out_bit = 0,				\
+		.intr_enable_bit = -1,			\
+		.intr_status_bit = -1,			\
+		.intr_target_bit = -1,			\
+		.intr_raw_status_bit = -1,		\
+		.intr_polarity_bit = -1,		\
+		.intr_detection_bit = -1,		\
+		.intr_detection_width = -1,		\
+	}
+
+#define QUP_I3C(qup_mode, qup_offset)			\
+	{						\
+		.mode = qup_mode,			\
+		.offset = qup_offset,			\
+	}
+
+static const struct pinctrl_pin_desc qdru1000_pins[] = {
+	PINCTRL_PIN(0, "GPIO_0"),
+	PINCTRL_PIN(1, "GPIO_1"),
+	PINCTRL_PIN(2, "GPIO_2"),
+	PINCTRL_PIN(3, "GPIO_3"),
+	PINCTRL_PIN(4, "GPIO_4"),
+	PINCTRL_PIN(5, "GPIO_5"),
+	PINCTRL_PIN(6, "GPIO_6"),
+	PINCTRL_PIN(7, "GPIO_7"),
+	PINCTRL_PIN(8, "GPIO_8"),
+	PINCTRL_PIN(9, "GPIO_9"),
+	PINCTRL_PIN(10, "GPIO_10"),
+	PINCTRL_PIN(11, "GPIO_11"),
+	PINCTRL_PIN(12, "GPIO_12"),
+	PINCTRL_PIN(13, "GPIO_13"),
+	PINCTRL_PIN(14, "GPIO_14"),
+	PINCTRL_PIN(15, "GPIO_15"),
+	PINCTRL_PIN(16, "GPIO_16"),
+	PINCTRL_PIN(17, "GPIO_17"),
+	PINCTRL_PIN(18, "GPIO_18"),
+	PINCTRL_PIN(19, "GPIO_19"),
+	PINCTRL_PIN(20, "GPIO_20"),
+	PINCTRL_PIN(21, "GPIO_21"),
+	PINCTRL_PIN(22, "GPIO_22"),
+	PINCTRL_PIN(23, "GPIO_23"),
+	PINCTRL_PIN(24, "GPIO_24"),
+	PINCTRL_PIN(25, "GPIO_25"),
+	PINCTRL_PIN(26, "GPIO_26"),
+	PINCTRL_PIN(27, "GPIO_27"),
+	PINCTRL_PIN(28, "GPIO_28"),
+	PINCTRL_PIN(29, "GPIO_29"),
+	PINCTRL_PIN(30, "GPIO_30"),
+	PINCTRL_PIN(31, "GPIO_31"),
+	PINCTRL_PIN(32, "GPIO_32"),
+	PINCTRL_PIN(33, "GPIO_33"),
+	PINCTRL_PIN(34, "GPIO_34"),
+	PINCTRL_PIN(35, "GPIO_35"),
+	PINCTRL_PIN(36, "GPIO_36"),
+	PINCTRL_PIN(37, "GPIO_37"),
+	PINCTRL_PIN(38, "GPIO_38"),
+	PINCTRL_PIN(39, "GPIO_39"),
+	PINCTRL_PIN(40, "GPIO_40"),
+	PINCTRL_PIN(41, "GPIO_41"),
+	PINCTRL_PIN(42, "GPIO_42"),
+	PINCTRL_PIN(43, "GPIO_43"),
+	PINCTRL_PIN(44, "GPIO_44"),
+	PINCTRL_PIN(45, "GPIO_45"),
+	PINCTRL_PIN(46, "GPIO_46"),
+	PINCTRL_PIN(47, "GPIO_47"),
+	PINCTRL_PIN(48, "GPIO_48"),
+	PINCTRL_PIN(49, "GPIO_49"),
+	PINCTRL_PIN(50, "GPIO_50"),
+	PINCTRL_PIN(51, "GPIO_51"),
+	PINCTRL_PIN(52, "GPIO_52"),
+	PINCTRL_PIN(53, "GPIO_53"),
+	PINCTRL_PIN(54, "GPIO_54"),
+	PINCTRL_PIN(55, "GPIO_55"),
+	PINCTRL_PIN(56, "GPIO_56"),
+	PINCTRL_PIN(57, "GPIO_57"),
+	PINCTRL_PIN(58, "GPIO_58"),
+	PINCTRL_PIN(59, "GPIO_59"),
+	PINCTRL_PIN(60, "GPIO_60"),
+	PINCTRL_PIN(61, "GPIO_61"),
+	PINCTRL_PIN(62, "GPIO_62"),
+	PINCTRL_PIN(63, "GPIO_63"),
+	PINCTRL_PIN(64, "GPIO_64"),
+	PINCTRL_PIN(65, "GPIO_65"),
+	PINCTRL_PIN(66, "GPIO_66"),
+	PINCTRL_PIN(67, "GPIO_67"),
+	PINCTRL_PIN(68, "GPIO_68"),
+	PINCTRL_PIN(69, "GPIO_69"),
+	PINCTRL_PIN(70, "GPIO_70"),
+	PINCTRL_PIN(71, "GPIO_71"),
+	PINCTRL_PIN(72, "GPIO_72"),
+	PINCTRL_PIN(73, "GPIO_73"),
+	PINCTRL_PIN(74, "GPIO_74"),
+	PINCTRL_PIN(75, "GPIO_75"),
+	PINCTRL_PIN(76, "GPIO_76"),
+	PINCTRL_PIN(77, "GPIO_77"),
+	PINCTRL_PIN(78, "GPIO_78"),
+	PINCTRL_PIN(79, "GPIO_79"),
+	PINCTRL_PIN(80, "GPIO_80"),
+	PINCTRL_PIN(81, "GPIO_81"),
+	PINCTRL_PIN(82, "GPIO_82"),
+	PINCTRL_PIN(83, "GPIO_83"),
+	PINCTRL_PIN(84, "GPIO_84"),
+	PINCTRL_PIN(85, "GPIO_85"),
+	PINCTRL_PIN(86, "GPIO_86"),
+	PINCTRL_PIN(87, "GPIO_87"),
+	PINCTRL_PIN(88, "GPIO_88"),
+	PINCTRL_PIN(89, "GPIO_89"),
+	PINCTRL_PIN(90, "GPIO_90"),
+	PINCTRL_PIN(91, "GPIO_91"),
+	PINCTRL_PIN(92, "GPIO_92"),
+	PINCTRL_PIN(93, "GPIO_93"),
+	PINCTRL_PIN(94, "GPIO_94"),
+	PINCTRL_PIN(95, "GPIO_95"),
+	PINCTRL_PIN(96, "GPIO_96"),
+	PINCTRL_PIN(97, "GPIO_97"),
+	PINCTRL_PIN(98, "GPIO_98"),
+	PINCTRL_PIN(99, "GPIO_99"),
+	PINCTRL_PIN(100, "GPIO_100"),
+	PINCTRL_PIN(101, "GPIO_101"),
+	PINCTRL_PIN(102, "GPIO_102"),
+	PINCTRL_PIN(103, "GPIO_103"),
+	PINCTRL_PIN(104, "GPIO_104"),
+	PINCTRL_PIN(105, "GPIO_105"),
+	PINCTRL_PIN(106, "GPIO_106"),
+	PINCTRL_PIN(107, "GPIO_107"),
+	PINCTRL_PIN(108, "GPIO_108"),
+	PINCTRL_PIN(109, "GPIO_109"),
+	PINCTRL_PIN(110, "GPIO_110"),
+	PINCTRL_PIN(111, "GPIO_111"),
+	PINCTRL_PIN(112, "GPIO_112"),
+	PINCTRL_PIN(113, "GPIO_113"),
+	PINCTRL_PIN(114, "GPIO_114"),
+	PINCTRL_PIN(115, "GPIO_115"),
+	PINCTRL_PIN(116, "GPIO_116"),
+	PINCTRL_PIN(117, "GPIO_117"),
+	PINCTRL_PIN(118, "GPIO_118"),
+	PINCTRL_PIN(119, "GPIO_119"),
+	PINCTRL_PIN(120, "GPIO_120"),
+	PINCTRL_PIN(121, "GPIO_121"),
+	PINCTRL_PIN(122, "GPIO_122"),
+	PINCTRL_PIN(123, "GPIO_123"),
+	PINCTRL_PIN(124, "GPIO_124"),
+	PINCTRL_PIN(125, "GPIO_125"),
+	PINCTRL_PIN(126, "GPIO_126"),
+	PINCTRL_PIN(127, "GPIO_127"),
+	PINCTRL_PIN(128, "GPIO_128"),
+	PINCTRL_PIN(129, "GPIO_129"),
+	PINCTRL_PIN(130, "GPIO_130"),
+	PINCTRL_PIN(131, "GPIO_131"),
+	PINCTRL_PIN(132, "GPIO_132"),
+	PINCTRL_PIN(133, "GPIO_133"),
+	PINCTRL_PIN(134, "GPIO_134"),
+	PINCTRL_PIN(135, "GPIO_135"),
+	PINCTRL_PIN(136, "GPIO_136"),
+	PINCTRL_PIN(137, "GPIO_137"),
+	PINCTRL_PIN(138, "GPIO_138"),
+	PINCTRL_PIN(139, "GPIO_139"),
+	PINCTRL_PIN(140, "GPIO_140"),
+	PINCTRL_PIN(141, "GPIO_141"),
+	PINCTRL_PIN(142, "GPIO_142"),
+	PINCTRL_PIN(143, "GPIO_143"),
+	PINCTRL_PIN(144, "GPIO_144"),
+	PINCTRL_PIN(145, "GPIO_145"),
+	PINCTRL_PIN(146, "GPIO_146"),
+	PINCTRL_PIN(147, "GPIO_147"),
+	PINCTRL_PIN(148, "GPIO_148"),
+	PINCTRL_PIN(149, "GPIO_149"),
+	PINCTRL_PIN(150, "GPIO_150"),
+	PINCTRL_PIN(151, "SDC1_RCLK"),
+	PINCTRL_PIN(152, "SDC1_CLK"),
+	PINCTRL_PIN(153, "SDC1_CMD"),
+	PINCTRL_PIN(154, "SDC1_DATA"),
+};
+
+#define DECLARE_MSM_GPIO_PINS(pin) \
+	static const unsigned int gpio##pin##_pins[] = { pin }
+DECLARE_MSM_GPIO_PINS(0);
+DECLARE_MSM_GPIO_PINS(1);
+DECLARE_MSM_GPIO_PINS(2);
+DECLARE_MSM_GPIO_PINS(3);
+DECLARE_MSM_GPIO_PINS(4);
+DECLARE_MSM_GPIO_PINS(5);
+DECLARE_MSM_GPIO_PINS(6);
+DECLARE_MSM_GPIO_PINS(7);
+DECLARE_MSM_GPIO_PINS(8);
+DECLARE_MSM_GPIO_PINS(9);
+DECLARE_MSM_GPIO_PINS(10);
+DECLARE_MSM_GPIO_PINS(11);
+DECLARE_MSM_GPIO_PINS(12);
+DECLARE_MSM_GPIO_PINS(13);
+DECLARE_MSM_GPIO_PINS(14);
+DECLARE_MSM_GPIO_PINS(15);
+DECLARE_MSM_GPIO_PINS(16);
+DECLARE_MSM_GPIO_PINS(17);
+DECLARE_MSM_GPIO_PINS(18);
+DECLARE_MSM_GPIO_PINS(19);
+DECLARE_MSM_GPIO_PINS(20);
+DECLARE_MSM_GPIO_PINS(21);
+DECLARE_MSM_GPIO_PINS(22);
+DECLARE_MSM_GPIO_PINS(23);
+DECLARE_MSM_GPIO_PINS(24);
+DECLARE_MSM_GPIO_PINS(25);
+DECLARE_MSM_GPIO_PINS(26);
+DECLARE_MSM_GPIO_PINS(27);
+DECLARE_MSM_GPIO_PINS(28);
+DECLARE_MSM_GPIO_PINS(29);
+DECLARE_MSM_GPIO_PINS(30);
+DECLARE_MSM_GPIO_PINS(31);
+DECLARE_MSM_GPIO_PINS(32);
+DECLARE_MSM_GPIO_PINS(33);
+DECLARE_MSM_GPIO_PINS(34);
+DECLARE_MSM_GPIO_PINS(35);
+DECLARE_MSM_GPIO_PINS(36);
+DECLARE_MSM_GPIO_PINS(37);
+DECLARE_MSM_GPIO_PINS(38);
+DECLARE_MSM_GPIO_PINS(39);
+DECLARE_MSM_GPIO_PINS(40);
+DECLARE_MSM_GPIO_PINS(41);
+DECLARE_MSM_GPIO_PINS(42);
+DECLARE_MSM_GPIO_PINS(43);
+DECLARE_MSM_GPIO_PINS(44);
+DECLARE_MSM_GPIO_PINS(45);
+DECLARE_MSM_GPIO_PINS(46);
+DECLARE_MSM_GPIO_PINS(47);
+DECLARE_MSM_GPIO_PINS(48);
+DECLARE_MSM_GPIO_PINS(49);
+DECLARE_MSM_GPIO_PINS(50);
+DECLARE_MSM_GPIO_PINS(51);
+DECLARE_MSM_GPIO_PINS(52);
+DECLARE_MSM_GPIO_PINS(53);
+DECLARE_MSM_GPIO_PINS(54);
+DECLARE_MSM_GPIO_PINS(55);
+DECLARE_MSM_GPIO_PINS(56);
+DECLARE_MSM_GPIO_PINS(57);
+DECLARE_MSM_GPIO_PINS(58);
+DECLARE_MSM_GPIO_PINS(59);
+DECLARE_MSM_GPIO_PINS(60);
+DECLARE_MSM_GPIO_PINS(61);
+DECLARE_MSM_GPIO_PINS(62);
+DECLARE_MSM_GPIO_PINS(63);
+DECLARE_MSM_GPIO_PINS(64);
+DECLARE_MSM_GPIO_PINS(65);
+DECLARE_MSM_GPIO_PINS(66);
+DECLARE_MSM_GPIO_PINS(67);
+DECLARE_MSM_GPIO_PINS(68);
+DECLARE_MSM_GPIO_PINS(69);
+DECLARE_MSM_GPIO_PINS(70);
+DECLARE_MSM_GPIO_PINS(71);
+DECLARE_MSM_GPIO_PINS(72);
+DECLARE_MSM_GPIO_PINS(73);
+DECLARE_MSM_GPIO_PINS(74);
+DECLARE_MSM_GPIO_PINS(75);
+DECLARE_MSM_GPIO_PINS(76);
+DECLARE_MSM_GPIO_PINS(77);
+DECLARE_MSM_GPIO_PINS(78);
+DECLARE_MSM_GPIO_PINS(79);
+DECLARE_MSM_GPIO_PINS(80);
+DECLARE_MSM_GPIO_PINS(81);
+DECLARE_MSM_GPIO_PINS(82);
+DECLARE_MSM_GPIO_PINS(83);
+DECLARE_MSM_GPIO_PINS(84);
+DECLARE_MSM_GPIO_PINS(85);
+DECLARE_MSM_GPIO_PINS(86);
+DECLARE_MSM_GPIO_PINS(87);
+DECLARE_MSM_GPIO_PINS(88);
+DECLARE_MSM_GPIO_PINS(89);
+DECLARE_MSM_GPIO_PINS(90);
+DECLARE_MSM_GPIO_PINS(91);
+DECLARE_MSM_GPIO_PINS(92);
+DECLARE_MSM_GPIO_PINS(93);
+DECLARE_MSM_GPIO_PINS(94);
+DECLARE_MSM_GPIO_PINS(95);
+DECLARE_MSM_GPIO_PINS(96);
+DECLARE_MSM_GPIO_PINS(97);
+DECLARE_MSM_GPIO_PINS(98);
+DECLARE_MSM_GPIO_PINS(99);
+DECLARE_MSM_GPIO_PINS(100);
+DECLARE_MSM_GPIO_PINS(101);
+DECLARE_MSM_GPIO_PINS(102);
+DECLARE_MSM_GPIO_PINS(103);
+DECLARE_MSM_GPIO_PINS(104);
+DECLARE_MSM_GPIO_PINS(105);
+DECLARE_MSM_GPIO_PINS(106);
+DECLARE_MSM_GPIO_PINS(107);
+DECLARE_MSM_GPIO_PINS(108);
+DECLARE_MSM_GPIO_PINS(109);
+DECLARE_MSM_GPIO_PINS(110);
+DECLARE_MSM_GPIO_PINS(111);
+DECLARE_MSM_GPIO_PINS(112);
+DECLARE_MSM_GPIO_PINS(113);
+DECLARE_MSM_GPIO_PINS(114);
+DECLARE_MSM_GPIO_PINS(115);
+DECLARE_MSM_GPIO_PINS(116);
+DECLARE_MSM_GPIO_PINS(117);
+DECLARE_MSM_GPIO_PINS(118);
+DECLARE_MSM_GPIO_PINS(119);
+DECLARE_MSM_GPIO_PINS(120);
+DECLARE_MSM_GPIO_PINS(121);
+DECLARE_MSM_GPIO_PINS(122);
+DECLARE_MSM_GPIO_PINS(123);
+DECLARE_MSM_GPIO_PINS(124);
+DECLARE_MSM_GPIO_PINS(125);
+DECLARE_MSM_GPIO_PINS(126);
+DECLARE_MSM_GPIO_PINS(127);
+DECLARE_MSM_GPIO_PINS(128);
+DECLARE_MSM_GPIO_PINS(129);
+DECLARE_MSM_GPIO_PINS(130);
+DECLARE_MSM_GPIO_PINS(131);
+DECLARE_MSM_GPIO_PINS(132);
+DECLARE_MSM_GPIO_PINS(133);
+DECLARE_MSM_GPIO_PINS(134);
+DECLARE_MSM_GPIO_PINS(135);
+DECLARE_MSM_GPIO_PINS(136);
+DECLARE_MSM_GPIO_PINS(137);
+DECLARE_MSM_GPIO_PINS(138);
+DECLARE_MSM_GPIO_PINS(139);
+DECLARE_MSM_GPIO_PINS(140);
+DECLARE_MSM_GPIO_PINS(141);
+DECLARE_MSM_GPIO_PINS(142);
+DECLARE_MSM_GPIO_PINS(143);
+DECLARE_MSM_GPIO_PINS(144);
+DECLARE_MSM_GPIO_PINS(145);
+DECLARE_MSM_GPIO_PINS(146);
+DECLARE_MSM_GPIO_PINS(147);
+DECLARE_MSM_GPIO_PINS(148);
+DECLARE_MSM_GPIO_PINS(149);
+DECLARE_MSM_GPIO_PINS(150);
+
+static const unsigned int sdc1_rclk_pins[] = { 151 };
+static const unsigned int sdc1_clk_pins[] = { 152 };
+static const unsigned int sdc1_cmd_pins[] = { 153 };
+static const unsigned int sdc1_data_pins[] = { 154 };
+
+enum qdru1000_functions {
+	msm_mux_gpio,
+	msm_mux_CMO_PRI,
+	msm_mux_SI5518_INT,
+	msm_mux_atest_char_start,
+	msm_mux_atest_char_status0,
+	msm_mux_atest_char_status1,
+	msm_mux_atest_char_status2,
+	msm_mux_atest_char_status3,
+	msm_mux_atest_usb0_atereset,
+	msm_mux_atest_usb0_testdataout00,
+	msm_mux_atest_usb0_testdataout01,
+	msm_mux_atest_usb0_testdataout02,
+	msm_mux_atest_usb0_testdataout03,
+	msm_mux_char_exec_pending,
+	msm_mux_char_exec_release,
+	msm_mux_cmu_rng_entropy0,
+	msm_mux_cmu_rng_entropy1,
+	msm_mux_cmu_rng_entropy2,
+	msm_mux_cmu_rng_entropy3,
+	msm_mux_dbg_out_clk,
+	msm_mux_ddr_bist_complete,
+	msm_mux_ddr_bist_fail,
+	msm_mux_ddr_bist_start,
+	msm_mux_ddr_bist_stop,
+	msm_mux_ddr_pxi0_test,
+	msm_mux_ddr_pxi1_test,
+	msm_mux_ddr_pxi2_test,
+	msm_mux_ddr_pxi3_test,
+	msm_mux_ddr_pxi4_test,
+	msm_mux_ddr_pxi5_test,
+	msm_mux_ddr_pxi6_test,
+	msm_mux_ddr_pxi7_test,
+	msm_mux_eth012_int_n,
+	msm_mux_eth345_int_n,
+	msm_mux_eth6_int_n,
+	msm_mux_gcc_gp1_clk,
+	msm_mux_gcc_gp2_clk,
+	msm_mux_gcc_gp3_clk,
+	msm_mux_gps_pps_in,
+	msm_mux_hardsync_pps_in,
+	msm_mux_intr_c_raw0,
+	msm_mux_intr_c_raw1,
+	msm_mux_intr_c_raw2,
+	msm_mux_jitter_bist_ref,
+	msm_mux_pcie0,
+	msm_mux_pcie0_clkreqn,
+	msm_mux_pcie0_wake,
+	msm_mux_phase_flag_status0,
+	msm_mux_phase_flag_status1,
+	msm_mux_phase_flag_status10,
+	msm_mux_phase_flag_status11,
+	msm_mux_phase_flag_status12,
+	msm_mux_phase_flag_status13,
+	msm_mux_phase_flag_status14,
+	msm_mux_phase_flag_status15,
+	msm_mux_phase_flag_status16,
+	msm_mux_phase_flag_status17,
+	msm_mux_phase_flag_status18,
+	msm_mux_phase_flag_status19,
+	msm_mux_phase_flag_status2,
+	msm_mux_phase_flag_status20,
+	msm_mux_phase_flag_status21,
+	msm_mux_phase_flag_status22,
+	msm_mux_phase_flag_status23,
+	msm_mux_phase_flag_status24,
+	msm_mux_phase_flag_status25,
+	msm_mux_phase_flag_status26,
+	msm_mux_phase_flag_status27,
+	msm_mux_phase_flag_status28,
+	msm_mux_phase_flag_status29,
+	msm_mux_phase_flag_status3,
+	msm_mux_phase_flag_status30,
+	msm_mux_phase_flag_status31,
+	msm_mux_phase_flag_status4,
+	msm_mux_phase_flag_status5,
+	msm_mux_phase_flag_status6,
+	msm_mux_phase_flag_status7,
+	msm_mux_phase_flag_status8,
+	msm_mux_phase_flag_status9,
+	msm_mux_pll_bist_sync,
+	msm_mux_pll_clk_aux,
+	msm_mux_prng_rosc_test0,
+	msm_mux_prng_rosc_test1,
+	msm_mux_prng_rosc_test2,
+	msm_mux_prng_rosc_test3,
+	msm_mux_qdss_cti_trig0,
+	msm_mux_qdss_cti_trig1,
+	msm_mux_qdss_cti_trig2,
+	msm_mux_qdss_cti_trig3,
+	msm_mux_qdss_cti_trig4,
+	msm_mux_qdss_gpio_traceclk,
+	msm_mux_qdss_gpio_tracectl,
+	msm_mux_qdss_gpio_tracedata0,
+	msm_mux_qdss_gpio_tracedata1,
+	msm_mux_qdss_gpio_tracedata10,
+	msm_mux_qdss_gpio_tracedata11,
+	msm_mux_qdss_gpio_tracedata12,
+	msm_mux_qdss_gpio_tracedata13,
+	msm_mux_qdss_gpio_tracedata14,
+	msm_mux_qdss_gpio_tracedata15,
+	msm_mux_qdss_gpio_tracedata2,
+	msm_mux_qdss_gpio_tracedata3,
+	msm_mux_qdss_gpio_tracedata4,
+	msm_mux_qdss_gpio_tracedata5,
+	msm_mux_qdss_gpio_tracedata6,
+	msm_mux_qdss_gpio_tracedata7,
+	msm_mux_qdss_gpio_tracedata8,
+	msm_mux_qdss_gpio_tracedata9,
+	msm_mux_qlink0_enable,
+	msm_mux_qlink0_request,
+	msm_mux_qlink0_wmss_reset,
+	msm_mux_qlink1_enable,
+	msm_mux_qlink1_request,
+	msm_mux_qlink1_wmss_reset,
+	msm_mux_qlink2_enable,
+	msm_mux_qlink2_request,
+	msm_mux_qlink2_wmss_reset,
+	msm_mux_qlink3_enable,
+	msm_mux_qlink3_request,
+	msm_mux_qlink3_wmss_reset,
+	msm_mux_qlink4_enable,
+	msm_mux_qlink4_request,
+	msm_mux_qlink4_wmss_reset,
+	msm_mux_qlink5_enable,
+	msm_mux_qlink5_request,
+	msm_mux_qlink5_wmss_reset,
+	msm_mux_qlink6_enable,
+	msm_mux_qlink6_request,
+	msm_mux_qlink6_wmss_reset,
+	msm_mux_qlink7_enable,
+	msm_mux_qlink7_request,
+	msm_mux_qlink7_wmss_reset,
+	msm_mux_qspi_clk,
+	msm_mux_qspi_cs_n,
+	msm_mux_qspi_data_0,
+	msm_mux_qspi_data_1,
+	msm_mux_qspi_data_2,
+	msm_mux_qspi_data_3,
+	msm_mux_qup0_se0_l0,
+	msm_mux_qup0_se0_l1,
+	msm_mux_qup0_se0_l2,
+	msm_mux_qup0_se0_l3,
+	msm_mux_qup0_se1_l0,
+	msm_mux_qup0_se1_l1,
+	msm_mux_qup0_se1_l2,
+	msm_mux_qup0_se1_l3,
+	msm_mux_qup0_se2_l0,
+	msm_mux_qup0_se2_l1,
+	msm_mux_qup0_se2_l2,
+	msm_mux_qup0_se2_l3,
+	msm_mux_qup0_se3_l0,
+	msm_mux_qup0_se3_l1,
+	msm_mux_qup0_se3_l2,
+	msm_mux_qup0_se3_l3,
+	msm_mux_qup0_se4_l0,
+	msm_mux_qup0_se4_l1,
+	msm_mux_qup0_se4_l2,
+	msm_mux_qup0_se4_l3,
+	msm_mux_qup0_se5_l0,
+	msm_mux_qup0_se5_l1,
+	msm_mux_qup0_se5_l2,
+	msm_mux_qup0_se5_l3,
+	msm_mux_qup0_se6_l0,
+	msm_mux_qup0_se6_l1,
+	msm_mux_qup0_se6_l2,
+	msm_mux_qup0_se6_l3,
+	msm_mux_qup0_se7_l0,
+	msm_mux_qup0_se7_l1,
+	msm_mux_qup0_se7_l2,
+	msm_mux_qup0_se7_l3,
+	msm_mux_qup1_se0_l0,
+	msm_mux_qup1_se0_l1,
+	msm_mux_qup1_se0_l2,
+	msm_mux_qup1_se0_l3,
+	msm_mux_qup1_se1_l0,
+	msm_mux_qup1_se1_l1,
+	msm_mux_qup1_se1_l2,
+	msm_mux_qup1_se1_l3,
+	msm_mux_qup1_se2_l0,
+	msm_mux_qup1_se2_l1,
+	msm_mux_qup1_se2_l2,
+	msm_mux_qup1_se2_l3,
+	msm_mux_qup1_se3_l0,
+	msm_mux_qup1_se3_l1,
+	msm_mux_qup1_se3_l2,
+	msm_mux_qup1_se3_l3,
+	msm_mux_qup1_se4_l0,
+	msm_mux_qup1_se4_l1,
+	msm_mux_qup1_se4_l2,
+	msm_mux_qup1_se4_l3,
+	msm_mux_qup1_se5_l0,
+	msm_mux_qup1_se5_l1,
+	msm_mux_qup1_se5_l2,
+	msm_mux_qup1_se5_l3,
+	msm_mux_qup1_se6_l0,
+	msm_mux_qup1_se6_l1,
+	msm_mux_qup1_se6_l2,
+	msm_mux_qup1_se6_l3,
+	msm_mux_qup1_se6_l4,
+	msm_mux_qup1_se6_l5,
+	msm_mux_qup1_se6_l6,
+	msm_mux_qup1_se7_l0,
+	msm_mux_qup1_se7_l1,
+	msm_mux_qup1_se7_l2,
+	msm_mux_qup1_se7_l3,
+	msm_mux_qup1_se7_l4,
+	msm_mux_qup1_se7_l5,
+	msm_mux_qup1_se7_l6,
+	msm_mux_qup2_se0_l0,
+	msm_mux_qup2_se0_l1,
+	msm_mux_qup2_se0_l2,
+	msm_mux_qup2_se0_l3,
+	msm_mux_qup2_se1_l0,
+	msm_mux_qup2_se1_l1,
+	msm_mux_qup2_se1_l2,
+	msm_mux_qup2_se1_l3,
+	msm_mux_qup2_se2_l0,
+	msm_mux_qup2_se2_l1,
+	msm_mux_qup2_se2_l2,
+	msm_mux_qup2_se2_l3,
+	msm_mux_smb_alert,
+	msm_mux_smb_alert_n,
+	msm_mux_smb_clk,
+	msm_mux_smb_dat,
+	msm_mux_tb_trig_sdc1,
+	msm_mux_tgu_ch0_trigout,
+	msm_mux_tgu_ch1_trigout,
+	msm_mux_tgu_ch2_trigout,
+	msm_mux_tgu_ch3_trigout,
+	msm_mux_tgu_ch4_trigout,
+	msm_mux_tgu_ch5_trigout,
+	msm_mux_tgu_ch6_trigout,
+	msm_mux_tgu_ch7_trigout,
+	msm_mux_tmess_prng_rosc0,
+	msm_mux_tmess_prng_rosc1,
+	msm_mux_tmess_prng_rosc2,
+	msm_mux_tmess_prng_rosc3,
+	msm_mux_tod_pps_in,
+	msm_mux_tsense_pwm1_out,
+	msm_mux_tsense_pwm2_out,
+	msm_mux_usb2phy_ac_en,
+	msm_mux_usb_con_det,
+	msm_mux_usb_dfp_en,
+	msm_mux_usb_phy_ps,
+	msm_mux_vfr_0,
+	msm_mux_vfr_1,
+	msm_mux_vsense_trigger_mirnat,
+	msm_mux__,
+};
+
+static const char * const gpio_groups[] = {
+	"gpio0", "gpio1", "gpio2", "gpio3", "gpio4", "gpio5", "gpio6", "gpio7",
+	"gpio8", "gpio9", "gpio10", "gpio11", "gpio12", "gpio13", "gpio14",
+	"gpio15", "gpio16", "gpio17", "gpio18", "gpio19", "gpio20", "gpio21",
+	"gpio22", "gpio23", "gpio24", "gpio25", "gpio26", "gpio27", "gpio28",
+	"gpio29", "gpio30", "gpio31", "gpio32", "gpio33", "gpio34", "gpio35",
+	"gpio36", "gpio37", "gpio38", "gpio39", "gpio40", "gpio41", "gpio42",
+	"gpio43", "gpio44", "gpio45", "gpio46", "gpio47", "gpio48", "gpio49",
+	"gpio50", "gpio51", "gpio52", "gpio53", "gpio54", "gpio55", "gpio56",
+	"gpio57", "gpio58", "gpio59", "gpio60", "gpio61", "gpio62", "gpio63",
+	"gpio64", "gpio65", "gpio66", "gpio67", "gpio68", "gpio69", "gpio70",
+	"gpio71", "gpio72", "gpio73", "gpio74", "gpio75", "gpio76", "gpio77",
+	"gpio78", "gpio79", "gpio80", "gpio81", "gpio82", "gpio83", "gpio84",
+	"gpio85", "gpio86", "gpio87", "gpio88", "gpio89", "gpio90", "gpio91",
+	"gpio92", "gpio93", "gpio94", "gpio95", "gpio96", "gpio97", "gpio98",
+	"gpio99", "gpio100", "gpio101", "gpio102", "gpio103", "gpio104",
+	"gpio105", "gpio106", "gpio107", "gpio108", "gpio109", "gpio110",
+	"gpio111", "gpio112", "gpio113", "gpio114", "gpio115", "gpio116",
+	"gpio117", "gpio118", "gpio119", "gpio120", "gpio121", "gpio122",
+	"gpio123", "gpio124", "gpio125", "gpio126", "gpio127", "gpio128",
+	"gpio129", "gpio130", "gpio131", "gpio132", "gpio133", "gpio134",
+	"gpio135", "gpio136", "gpio137", "gpio138", "gpio139", "gpio140",
+	"gpio141", "gpio142", "gpio143", "gpio144", "gpio145", "gpio146",
+	"gpio147", "gpio148", "gpio149", "gpio150",
+};
+static const char * const CMO_PRI_groups[] = {
+	"gpio103",
+};
+static const char * const SI5518_INT_groups[] = {
+	"gpio44",
+};
+static const char * const atest_char_start_groups[] = {
+	"gpio95",
+};
+static const char * const atest_char_status0_groups[] = {
+	"gpio92",
+};
+static const char * const atest_char_status1_groups[] = {
+	"gpio91",
+};
+static const char * const atest_char_status2_groups[] = {
+	"gpio90",
+};
+static const char * const atest_char_status3_groups[] = {
+	"gpio89",
+};
+static const char * const atest_usb0_atereset_groups[] = {
+	"gpio114",
+};
+static const char * const atest_usb0_testdataout00_groups[] = {
+	"gpio115",
+};
+static const char * const atest_usb0_testdataout01_groups[] = {
+	"gpio116",
+};
+static const char * const atest_usb0_testdataout02_groups[] = {
+	"gpio117",
+};
+static const char * const atest_usb0_testdataout03_groups[] = {
+	"gpio118",
+};
+static const char * const char_exec_pending_groups[] = {
+	"gpio99",
+};
+static const char * const char_exec_release_groups[] = {
+	"gpio100",
+};
+static const char * const cmu_rng_entropy0_groups[] = {
+	"gpio92",
+};
+static const char * const cmu_rng_entropy1_groups[] = {
+	"gpio91",
+};
+static const char * const cmu_rng_entropy2_groups[] = {
+	"gpio90",
+};
+static const char * const cmu_rng_entropy3_groups[] = {
+	"gpio89",
+};
+static const char * const dbg_out_clk_groups[] = {
+	"gpio136",
+};
+static const char * const ddr_bist_complete_groups[] = {
+	"gpio2",
+};
+static const char * const ddr_bist_fail_groups[] = {
+	"gpio0",
+};
+static const char * const ddr_bist_start_groups[] = {
+	"gpio1",
+};
+static const char * const ddr_bist_stop_groups[] = {
+	"gpio3",
+};
+static const char * const ddr_pxi0_test_groups[] = {
+	"gpio114", "gpio115",
+};
+static const char * const ddr_pxi1_test_groups[] = {
+	"gpio116", "gpio117",
+};
+static const char * const ddr_pxi2_test_groups[] = {
+	"gpio118", "gpio119",
+};
+static const char * const ddr_pxi3_test_groups[] = {
+	"gpio120", "gpio121",
+};
+static const char * const ddr_pxi4_test_groups[] = {
+	"gpio122", "gpio123",
+};
+static const char * const ddr_pxi5_test_groups[] = {
+	"gpio124", "gpio125",
+};
+static const char * const ddr_pxi6_test_groups[] = {
+	"gpio126", "gpio127",
+};
+static const char * const ddr_pxi7_test_groups[] = {
+	"gpio128", "gpio129",
+};
+static const char * const eth012_int_n_groups[] = {
+	"gpio86",
+};
+static const char * const eth345_int_n_groups[] = {
+	"gpio87",
+};
+static const char * const eth6_int_n_groups[] = {
+	"gpio88",
+};
+static const char * const gcc_gp1_clk_groups[] = {
+	"gpio86", "gpio134",
+};
+static const char * const gcc_gp2_clk_groups[] = {
+	"gpio87", "gpio135",
+};
+static const char * const gcc_gp3_clk_groups[] = {
+	"gpio88", "gpio136",
+};
+static const char * const gps_pps_in_groups[] = {
+	"gpio49",
+};
+static const char * const hardsync_pps_in_groups[] = {
+	"gpio47",
+};
+static const char * const intr_c_raw0_groups[] = {
+	"gpio26", "gpio141",
+};
+static const char * const intr_c_raw1_groups[] = {
+	"gpio27", "gpio142",
+};
+static const char * const intr_c_raw2_groups[] = {
+	"gpio28", "gpio143",
+};
+static const char * const jitter_bist_ref_groups[] = {
+	"gpio130",
+};
+static const char * const pcie0_groups[] = {
+	"gpio98",
+};
+static const char * const pcie0_clkreqn_groups[] = {
+	"gpio99",
+};
+static const char * const pcie0_wake_groups[] = {
+	"gpio100",
+};
+static const char * const phase_flag_status0_groups[] = {
+	"gpio6",
+};
+static const char * const phase_flag_status1_groups[] = {
+	"gpio7",
+};
+static const char * const phase_flag_status10_groups[] = {
+	"gpio22",
+};
+static const char * const phase_flag_status11_groups[] = {
+	"gpio23",
+};
+static const char * const phase_flag_status12_groups[] = {
+	"gpio24",
+};
+static const char * const phase_flag_status13_groups[] = {
+	"gpio25",
+};
+static const char * const phase_flag_status14_groups[] = {
+	"gpio26",
+};
+static const char * const phase_flag_status15_groups[] = {
+	"gpio27",
+};
+static const char * const phase_flag_status16_groups[] = {
+	"gpio28",
+};
+static const char * const phase_flag_status17_groups[] = {
+	"gpio29",
+};
+static const char * const phase_flag_status18_groups[] = {
+	"gpio30",
+};
+static const char * const phase_flag_status19_groups[] = {
+	"gpio31",
+};
+static const char * const phase_flag_status2_groups[] = {
+	"gpio8",
+};
+static const char * const phase_flag_status20_groups[] = {
+	"gpio32",
+};
+static const char * const phase_flag_status21_groups[] = {
+	"gpio33",
+};
+static const char * const phase_flag_status22_groups[] = {
+	"gpio42",
+};
+static const char * const phase_flag_status23_groups[] = {
+	"gpio43",
+};
+static const char * const phase_flag_status24_groups[] = {
+	"gpio89",
+};
+static const char * const phase_flag_status25_groups[] = {
+	"gpio90",
+};
+static const char * const phase_flag_status26_groups[] = {
+	"gpio91",
+};
+static const char * const phase_flag_status27_groups[] = {
+	"gpio92",
+};
+static const char * const phase_flag_status28_groups[] = {
+	"gpio95",
+};
+static const char * const phase_flag_status29_groups[] = {
+	"gpio96",
+};
+static const char * const phase_flag_status3_groups[] = {
+	"gpio9",
+};
+static const char * const phase_flag_status30_groups[] = {
+	"gpio97",
+};
+static const char * const phase_flag_status31_groups[] = {
+	"gpio102",
+};
+static const char * const phase_flag_status4_groups[] = {
+	"gpio16",
+};
+static const char * const phase_flag_status5_groups[] = {
+	"gpio17",
+};
+static const char * const phase_flag_status6_groups[] = {
+	"gpio18",
+};
+static const char * const phase_flag_status7_groups[] = {
+	"gpio19",
+};
+static const char * const phase_flag_status8_groups[] = {
+	"gpio20",
+};
+static const char * const phase_flag_status9_groups[] = {
+	"gpio21",
+};
+static const char * const pll_bist_sync_groups[] = {
+	"gpio20",
+};
+static const char * const pll_clk_aux_groups[] = {
+	"gpio98",
+};
+static const char * const prng_rosc_test0_groups[] = {
+	"gpio18",
+};
+static const char * const prng_rosc_test1_groups[] = {
+	"gpio19",
+};
+static const char * const prng_rosc_test2_groups[] = {
+	"gpio20",
+};
+static const char * const prng_rosc_test3_groups[] = {
+	"gpio21",
+};
+static const char * const qdss_cti_trig0_groups[] = {
+	"gpio40", "gpio48", "gpio86", "gpio93",
+};
+static const char * const qdss_cti_trig1_groups[] = {
+	"gpio37", "gpio49", "gpio87", "gpio94",
+};
+static const char * const qdss_cti_trig2_groups[] = {
+	"gpio130", "gpio131", "gpio132", "gpio135",
+};
+static const char * const qdss_cti_trig3_groups[] = {
+	"gpio36", "gpio41", "gpio133", "gpio134",
+};
+static const char * const qdss_cti_trig4_groups[] = {
+	"gpio38", "gpio39", "gpio144", "gpio145",
+};
+static const char * const qdss_gpio_traceclk_groups[] = {
+	"gpio34", "gpio88",
+};
+static const char * const qdss_gpio_tracectl_groups[] = {
+	"gpio35", "gpio103",
+};
+static const char * const qdss_gpio_tracedata0_groups[] = {
+	"gpio6", "gpio18",
+};
+static const char * const qdss_gpio_tracedata1_groups[] = {
+	"gpio7", "gpio19",
+};
+static const char * const qdss_gpio_tracedata10_groups[] = {
+	"gpio28", "gpio91",
+};
+static const char * const qdss_gpio_tracedata11_groups[] = {
+	"gpio29", "gpio92",
+};
+static const char * const qdss_gpio_tracedata12_groups[] = {
+	"gpio30", "gpio95",
+};
+static const char * const qdss_gpio_tracedata13_groups[] = {
+	"gpio31", "gpio96",
+};
+static const char * const qdss_gpio_tracedata14_groups[] = {
+	"gpio32", "gpio97",
+};
+static const char * const qdss_gpio_tracedata15_groups[] = {
+	"gpio33", "gpio102",
+};
+static const char * const qdss_gpio_tracedata2_groups[] = {
+	"gpio8", "gpio20",
+};
+static const char * const qdss_gpio_tracedata3_groups[] = {
+	"gpio9", "gpio21",
+};
+static const char * const qdss_gpio_tracedata4_groups[] = {
+	"gpio16", "gpio22",
+};
+static const char * const qdss_gpio_tracedata5_groups[] = {
+	"gpio17", "gpio23",
+};
+static const char * const qdss_gpio_tracedata6_groups[] = {
+	"gpio24", "gpio42",
+};
+static const char * const qdss_gpio_tracedata7_groups[] = {
+	"gpio25", "gpio43",
+};
+static const char * const qdss_gpio_tracedata8_groups[] = {
+	"gpio26", "gpio89",
+};
+static const char * const qdss_gpio_tracedata9_groups[] = {
+	"gpio27", "gpio90",
+};
+static const char * const qlink0_enable_groups[] = {
+	"gpio67",
+};
+static const char * const qlink0_request_groups[] = {
+	"gpio66",
+};
+static const char * const qlink0_wmss_reset_groups[] = {
+	"gpio82",
+};
+static const char * const qlink1_enable_groups[] = {
+	"gpio69",
+};
+static const char * const qlink1_request_groups[] = {
+	"gpio68",
+};
+static const char * const qlink1_wmss_reset_groups[] = {
+	"gpio83",
+};
+static const char * const qlink2_enable_groups[] = {
+	"gpio71",
+};
+static const char * const qlink2_request_groups[] = {
+	"gpio70",
+};
+static const char * const qlink2_wmss_reset_groups[] = {
+	"gpio138",
+};
+static const char * const qlink3_enable_groups[] = {
+	"gpio73",
+};
+static const char * const qlink3_request_groups[] = {
+	"gpio72",
+};
+static const char * const qlink3_wmss_reset_groups[] = {
+	"gpio139",
+};
+static const char * const qlink4_enable_groups[] = {
+	"gpio75",
+};
+static const char * const qlink4_request_groups[] = {
+	"gpio74",
+};
+static const char * const qlink4_wmss_reset_groups[] = {
+	"gpio84",
+};
+static const char * const qlink5_enable_groups[] = {
+	"gpio77",
+};
+static const char * const qlink5_request_groups[] = {
+	"gpio76",
+};
+static const char * const qlink5_wmss_reset_groups[] = {
+	"gpio85",
+};
+static const char * const qlink6_enable_groups[] = {
+	"gpio79",
+};
+static const char * const qlink6_request_groups[] = {
+	"gpio78",
+};
+static const char * const qlink6_wmss_reset_groups[] = {
+	"gpio56",
+};
+static const char * const qlink7_enable_groups[] = {
+	"gpio81",
+};
+static const char * const qlink7_request_groups[] = {
+	"gpio80",
+};
+static const char * const qlink7_wmss_reset_groups[] = {
+	"gpio57",
+};
+static const char * const qspi_clk_groups[] = {
+	"gpio126",
+};
+static const char * const qspi_cs_n_groups[] = {
+	"gpio125",
+};
+static const char * const qspi_data_0_groups[] = {
+	"gpio114",
+};
+static const char * const qspi_data_1_groups[] = {
+	"gpio115",
+};
+static const char * const qspi_data_2_groups[] = {
+	"gpio116",
+};
+static const char * const qspi_data_3_groups[] = {
+	"gpio117",
+};
+static const char * const qup0_se0_l0_groups[] = {
+	"gpio6",
+};
+static const char * const qup0_se0_l1_groups[] = {
+	"gpio7",
+};
+static const char * const qup0_se0_l2_groups[] = {
+	"gpio8",
+};
+static const char * const qup0_se0_l3_groups[] = {
+	"gpio9",
+};
+static const char * const qup0_se1_l0_groups[] = {
+	"gpio10",
+};
+static const char * const qup0_se1_l1_groups[] = {
+	"gpio11",
+};
+static const char * const qup0_se1_l2_groups[] = {
+	"gpio12",
+};
+static const char * const qup0_se1_l3_groups[] = {
+	"gpio13",
+};
+static const char * const qup0_se2_l0_groups[] = {
+	"gpio12",
+};
+static const char * const qup0_se2_l1_groups[] = {
+	"gpio13",
+};
+static const char * const qup0_se2_l2_groups[] = {
+	"gpio10",
+};
+static const char * const qup0_se2_l3_groups[] = {
+	"gpio11",
+};
+static const char * const qup0_se3_l0_groups[] = {
+	"gpio14",
+};
+static const char * const qup0_se3_l1_groups[] = {
+	"gpio15",
+};
+static const char * const qup0_se3_l2_groups[] = {
+	"gpio16",
+};
+static const char * const qup0_se3_l3_groups[] = {
+	"gpio17",
+};
+static const char * const qup0_se4_l0_groups[] = {
+	"gpio16",
+};
+static const char * const qup0_se4_l1_groups[] = {
+	"gpio17",
+};
+static const char * const qup0_se4_l2_groups[] = {
+	"gpio14",
+};
+static const char * const qup0_se4_l3_groups[] = {
+	"gpio15",
+};
+static const char * const qup0_se5_l0_groups[] = {
+	"gpio130",
+};
+static const char * const qup0_se5_l1_groups[] = {
+	"gpio131",
+};
+static const char * const qup0_se5_l2_groups[] = {
+	"gpio132",
+};
+static const char * const qup0_se5_l3_groups[] = {
+	"gpio133",
+};
+static const char * const qup0_se6_l0_groups[] = {
+	"gpio132",
+};
+static const char * const qup0_se6_l1_groups[] = {
+	"gpio133",
+};
+static const char * const qup0_se6_l2_groups[] = {
+	"gpio130",
+};
+static const char * const qup0_se6_l3_groups[] = {
+	"gpio131",
+};
+static const char * const qup0_se7_l0_groups[] = {
+	"gpio134",
+};
+static const char * const qup0_se7_l1_groups[] = {
+	"gpio135",
+};
+static const char * const qup0_se7_l2_groups[] = {
+	"gpio134",
+};
+static const char * const qup0_se7_l3_groups[] = {
+	"gpio135",
+};
+static const char * const qup1_se0_l0_groups[] = {
+	"gpio18",
+};
+static const char * const qup1_se0_l1_groups[] = {
+	"gpio19",
+};
+static const char * const qup1_se0_l2_groups[] = {
+	"gpio20",
+};
+static const char * const qup1_se0_l3_groups[] = {
+	"gpio21",
+};
+static const char * const qup1_se1_l0_groups[] = {
+	"gpio22",
+};
+static const char * const qup1_se1_l1_groups[] = {
+	"gpio23",
+};
+static const char * const qup1_se1_l2_groups[] = {
+	"gpio24",
+};
+static const char * const qup1_se1_l3_groups[] = {
+	"gpio25",
+};
+static const char * const qup1_se2_l0_groups[] = {
+	"gpio24",
+};
+static const char * const qup1_se2_l1_groups[] = {
+	"gpio25",
+};
+static const char * const qup1_se2_l2_groups[] = {
+	"gpio22",
+};
+static const char * const qup1_se2_l3_groups[] = {
+	"gpio23",
+};
+static const char * const qup1_se3_l0_groups[] = {
+	"gpio26",
+};
+static const char * const qup1_se3_l1_groups[] = {
+	"gpio27",
+};
+static const char * const qup1_se3_l2_groups[] = {
+	"gpio28",
+};
+static const char * const qup1_se3_l3_groups[] = {
+	"gpio29",
+};
+static const char * const qup1_se4_l0_groups[] = {
+	"gpio28",
+};
+static const char * const qup1_se4_l1_groups[] = {
+	"gpio29",
+};
+static const char * const qup1_se4_l2_groups[] = {
+	"gpio26",
+};
+static const char * const qup1_se4_l3_groups[] = {
+	"gpio27",
+};
+static const char * const qup1_se5_l0_groups[] = {
+	"gpio30",
+};
+static const char * const qup1_se5_l1_groups[] = {
+	"gpio31",
+};
+static const char * const qup1_se5_l2_groups[] = {
+	"gpio32",
+};
+static const char * const qup1_se5_l3_groups[] = {
+	"gpio33",
+};
+static const char * const qup1_se6_l0_groups[] = {
+	"gpio34",
+};
+static const char * const qup1_se6_l1_groups[] = {
+	"gpio35",
+};
+static const char * const qup1_se6_l2_groups[] = {
+	"gpio36",
+};
+static const char * const qup1_se6_l3_groups[] = {
+	"gpio37",
+};
+static const char * const qup1_se6_l4_groups[] = {
+	"gpio38",
+};
+static const char * const qup1_se6_l5_groups[] = {
+	"gpio39",
+};
+static const char * const qup1_se6_l6_groups[] = {
+	"gpio29",
+};
+static const char * const qup1_se7_l0_groups[] = {
+	"gpio40",
+};
+static const char * const qup1_se7_l1_groups[] = {
+	"gpio41",
+};
+static const char * const qup1_se7_l2_groups[] = {
+	"gpio30",
+};
+static const char * const qup1_se7_l3_groups[] = {
+	"gpio31",
+};
+static const char * const qup1_se7_l4_groups[] = {
+	"gpio12",
+};
+static const char * const qup1_se7_l5_groups[] = {
+	"gpio13",
+};
+static const char * const qup1_se7_l6_groups[] = {
+	"gpio14",
+};
+static const char * const qup2_se0_l0_groups[] = {
+	"gpio0",
+};
+static const char * const qup2_se0_l1_groups[] = {
+	"gpio1",
+};
+static const char * const qup2_se0_l2_groups[] = {
+	"gpio2",
+};
+static const char * const qup2_se0_l3_groups[] = {
+	"gpio3",
+};
+static const char * const qup2_se1_l0_groups[] = {
+	"gpio2",
+};
+static const char * const qup2_se1_l1_groups[] = {
+	"gpio3",
+};
+static const char * const qup2_se1_l2_groups[] = {
+	"gpio0",
+};
+static const char * const qup2_se1_l3_groups[] = {
+	"gpio1",
+};
+static const char * const qup2_se2_l0_groups[] = {
+	"gpio4",
+};
+static const char * const qup2_se2_l1_groups[] = {
+	"gpio5",
+};
+static const char * const qup2_se2_l2_groups[] = {
+	"gpio128",
+};
+static const char * const qup2_se2_l3_groups[] = {
+	"gpio129",
+};
+static const char * const smb_alert_groups[] = {
+	"gpio101",
+};
+static const char * const smb_alert_n_groups[] = {
+	"gpio88",
+};
+static const char * const smb_clk_groups[] = {
+	"gpio133",
+};
+static const char * const smb_dat_groups[] = {
+	"gpio132",
+};
+static const char * const tb_trig_sdc1_groups[] = {
+	"gpio114",
+};
+static const char * const tgu_ch0_trigout_groups[] = {
+	"gpio6",
+};
+static const char * const tgu_ch1_trigout_groups[] = {
+	"gpio7",
+};
+static const char * const tgu_ch2_trigout_groups[] = {
+	"gpio8",
+};
+static const char * const tgu_ch3_trigout_groups[] = {
+	"gpio9",
+};
+static const char * const tgu_ch4_trigout_groups[] = {
+	"gpio44",
+};
+static const char * const tgu_ch5_trigout_groups[] = {
+	"gpio45",
+};
+static const char * const tgu_ch6_trigout_groups[] = {
+	"gpio46",
+};
+static const char * const tgu_ch7_trigout_groups[] = {
+	"gpio47",
+};
+static const char * const tmess_prng_rosc0_groups[] = {
+	"gpio33",
+};
+static const char * const tmess_prng_rosc1_groups[] = {
+	"gpio32",
+};
+static const char * const tmess_prng_rosc2_groups[] = {
+	"gpio31",
+};
+static const char * const tmess_prng_rosc3_groups[] = {
+	"gpio30",
+};
+static const char * const tod_pps_in_groups[] = {
+	"gpio48",
+};
+static const char * const tsense_pwm1_out_groups[] = {
+	"gpio2",
+};
+static const char * const tsense_pwm2_out_groups[] = {
+	"gpio3",
+};
+static const char * const usb2phy_ac_en_groups[] = {
+	"gpio90",
+};
+static const char * const usb_con_det_groups[] = {
+	"gpio42",
+};
+static const char * const usb_dfp_en_groups[] = {
+	"gpio43",
+};
+static const char * const usb_phy_ps_groups[] = {
+	"gpio91",
+};
+static const char * const vfr_0_groups[] = {
+	"gpio93",
+};
+static const char * const vfr_1_groups[] = {
+	"gpio94",
+};
+static const char * const vsense_trigger_mirnat_groups[] = {
+	"gpio135",
+};
+
+static const struct msm_function qdru1000_functions[] = {
+	FUNCTION(gpio),
+	FUNCTION(CMO_PRI),
+	FUNCTION(SI5518_INT),
+	FUNCTION(atest_char_start),
+	FUNCTION(atest_char_status0),
+	FUNCTION(atest_char_status1),
+	FUNCTION(atest_char_status2),
+	FUNCTION(atest_char_status3),
+	FUNCTION(atest_usb0_atereset),
+	FUNCTION(atest_usb0_testdataout00),
+	FUNCTION(atest_usb0_testdataout01),
+	FUNCTION(atest_usb0_testdataout02),
+	FUNCTION(atest_usb0_testdataout03),
+	FUNCTION(char_exec_pending),
+	FUNCTION(char_exec_release),
+	FUNCTION(cmu_rng_entropy0),
+	FUNCTION(cmu_rng_entropy1),
+	FUNCTION(cmu_rng_entropy2),
+	FUNCTION(cmu_rng_entropy3),
+	FUNCTION(dbg_out_clk),
+	FUNCTION(ddr_bist_complete),
+	FUNCTION(ddr_bist_fail),
+	FUNCTION(ddr_bist_start),
+	FUNCTION(ddr_bist_stop),
+	FUNCTION(ddr_pxi0_test),
+	FUNCTION(ddr_pxi1_test),
+	FUNCTION(ddr_pxi2_test),
+	FUNCTION(ddr_pxi3_test),
+	FUNCTION(ddr_pxi4_test),
+	FUNCTION(ddr_pxi5_test),
+	FUNCTION(ddr_pxi6_test),
+	FUNCTION(ddr_pxi7_test),
+	FUNCTION(eth012_int_n),
+	FUNCTION(eth345_int_n),
+	FUNCTION(eth6_int_n),
+	FUNCTION(gcc_gp1_clk),
+	FUNCTION(gcc_gp2_clk),
+	FUNCTION(gcc_gp3_clk),
+	FUNCTION(gps_pps_in),
+	FUNCTION(hardsync_pps_in),
+	FUNCTION(intr_c_raw0),
+	FUNCTION(intr_c_raw1),
+	FUNCTION(intr_c_raw2),
+	FUNCTION(jitter_bist_ref),
+	FUNCTION(pcie0),
+	FUNCTION(pcie0_clkreqn),
+	FUNCTION(pcie0_wake),
+	FUNCTION(phase_flag_status0),
+	FUNCTION(phase_flag_status1),
+	FUNCTION(phase_flag_status10),
+	FUNCTION(phase_flag_status11),
+	FUNCTION(phase_flag_status12),
+	FUNCTION(phase_flag_status13),
+	FUNCTION(phase_flag_status14),
+	FUNCTION(phase_flag_status15),
+	FUNCTION(phase_flag_status16),
+	FUNCTION(phase_flag_status17),
+	FUNCTION(phase_flag_status18),
+	FUNCTION(phase_flag_status19),
+	FUNCTION(phase_flag_status2),
+	FUNCTION(phase_flag_status20),
+	FUNCTION(phase_flag_status21),
+	FUNCTION(phase_flag_status22),
+	FUNCTION(phase_flag_status23),
+	FUNCTION(phase_flag_status24),
+	FUNCTION(phase_flag_status25),
+	FUNCTION(phase_flag_status26),
+	FUNCTION(phase_flag_status27),
+	FUNCTION(phase_flag_status28),
+	FUNCTION(phase_flag_status29),
+	FUNCTION(phase_flag_status3),
+	FUNCTION(phase_flag_status30),
+	FUNCTION(phase_flag_status31),
+	FUNCTION(phase_flag_status4),
+	FUNCTION(phase_flag_status5),
+	FUNCTION(phase_flag_status6),
+	FUNCTION(phase_flag_status7),
+	FUNCTION(phase_flag_status8),
+	FUNCTION(phase_flag_status9),
+	FUNCTION(pll_bist_sync),
+	FUNCTION(pll_clk_aux),
+	FUNCTION(prng_rosc_test0),
+	FUNCTION(prng_rosc_test1),
+	FUNCTION(prng_rosc_test2),
+	FUNCTION(prng_rosc_test3),
+	FUNCTION(qdss_cti_trig0),
+	FUNCTION(qdss_cti_trig1),
+	FUNCTION(qdss_cti_trig2),
+	FUNCTION(qdss_cti_trig3),
+	FUNCTION(qdss_cti_trig4),
+	FUNCTION(qdss_gpio_traceclk),
+	FUNCTION(qdss_gpio_tracectl),
+	FUNCTION(qdss_gpio_tracedata0),
+	FUNCTION(qdss_gpio_tracedata1),
+	FUNCTION(qdss_gpio_tracedata10),
+	FUNCTION(qdss_gpio_tracedata11),
+	FUNCTION(qdss_gpio_tracedata12),
+	FUNCTION(qdss_gpio_tracedata13),
+	FUNCTION(qdss_gpio_tracedata14),
+	FUNCTION(qdss_gpio_tracedata15),
+	FUNCTION(qdss_gpio_tracedata2),
+	FUNCTION(qdss_gpio_tracedata3),
+	FUNCTION(qdss_gpio_tracedata4),
+	FUNCTION(qdss_gpio_tracedata5),
+	FUNCTION(qdss_gpio_tracedata6),
+	FUNCTION(qdss_gpio_tracedata7),
+	FUNCTION(qdss_gpio_tracedata8),
+	FUNCTION(qdss_gpio_tracedata9),
+	FUNCTION(qlink0_enable),
+	FUNCTION(qlink0_request),
+	FUNCTION(qlink0_wmss_reset),
+	FUNCTION(qlink1_enable),
+	FUNCTION(qlink1_request),
+	FUNCTION(qlink1_wmss_reset),
+	FUNCTION(qlink2_enable),
+	FUNCTION(qlink2_request),
+	FUNCTION(qlink2_wmss_reset),
+	FUNCTION(qlink3_enable),
+	FUNCTION(qlink3_request),
+	FUNCTION(qlink3_wmss_reset),
+	FUNCTION(qlink4_enable),
+	FUNCTION(qlink4_request),
+	FUNCTION(qlink4_wmss_reset),
+	FUNCTION(qlink5_enable),
+	FUNCTION(qlink5_request),
+	FUNCTION(qlink5_wmss_reset),
+	FUNCTION(qlink6_enable),
+	FUNCTION(qlink6_request),
+	FUNCTION(qlink6_wmss_reset),
+	FUNCTION(qlink7_enable),
+	FUNCTION(qlink7_request),
+	FUNCTION(qlink7_wmss_reset),
+	FUNCTION(qspi_clk),
+	FUNCTION(qspi_cs_n),
+	FUNCTION(qspi_data_0),
+	FUNCTION(qspi_data_1),
+	FUNCTION(qspi_data_2),
+	FUNCTION(qspi_data_3),
+	FUNCTION(qup0_se0_l0),
+	FUNCTION(qup0_se0_l1),
+	FUNCTION(qup0_se0_l2),
+	FUNCTION(qup0_se0_l3),
+	FUNCTION(qup0_se1_l0),
+	FUNCTION(qup0_se1_l1),
+	FUNCTION(qup0_se1_l2),
+	FUNCTION(qup0_se1_l3),
+	FUNCTION(qup0_se2_l0),
+	FUNCTION(qup0_se2_l1),
+	FUNCTION(qup0_se2_l2),
+	FUNCTION(qup0_se2_l3),
+	FUNCTION(qup0_se3_l0),
+	FUNCTION(qup0_se3_l1),
+	FUNCTION(qup0_se3_l2),
+	FUNCTION(qup0_se3_l3),
+	FUNCTION(qup0_se4_l0),
+	FUNCTION(qup0_se4_l1),
+	FUNCTION(qup0_se4_l2),
+	FUNCTION(qup0_se4_l3),
+	FUNCTION(qup0_se5_l0),
+	FUNCTION(qup0_se5_l1),
+	FUNCTION(qup0_se5_l2),
+	FUNCTION(qup0_se5_l3),
+	FUNCTION(qup0_se6_l0),
+	FUNCTION(qup0_se6_l1),
+	FUNCTION(qup0_se6_l2),
+	FUNCTION(qup0_se6_l3),
+	FUNCTION(qup0_se7_l0),
+	FUNCTION(qup0_se7_l1),
+	FUNCTION(qup0_se7_l2),
+	FUNCTION(qup0_se7_l3),
+	FUNCTION(qup1_se0_l0),
+	FUNCTION(qup1_se0_l1),
+	FUNCTION(qup1_se0_l2),
+	FUNCTION(qup1_se0_l3),
+	FUNCTION(qup1_se1_l0),
+	FUNCTION(qup1_se1_l1),
+	FUNCTION(qup1_se1_l2),
+	FUNCTION(qup1_se1_l3),
+	FUNCTION(qup1_se2_l0),
+	FUNCTION(qup1_se2_l1),
+	FUNCTION(qup1_se2_l2),
+	FUNCTION(qup1_se2_l3),
+	FUNCTION(qup1_se3_l0),
+	FUNCTION(qup1_se3_l1),
+	FUNCTION(qup1_se3_l2),
+	FUNCTION(qup1_se3_l3),
+	FUNCTION(qup1_se4_l0),
+	FUNCTION(qup1_se4_l1),
+	FUNCTION(qup1_se4_l2),
+	FUNCTION(qup1_se4_l3),
+	FUNCTION(qup1_se5_l0),
+	FUNCTION(qup1_se5_l1),
+	FUNCTION(qup1_se5_l2),
+	FUNCTION(qup1_se5_l3),
+	FUNCTION(qup1_se6_l0),
+	FUNCTION(qup1_se6_l1),
+	FUNCTION(qup1_se6_l2),
+	FUNCTION(qup1_se6_l3),
+	FUNCTION(qup1_se6_l4),
+	FUNCTION(qup1_se6_l5),
+	FUNCTION(qup1_se6_l6),
+	FUNCTION(qup1_se7_l0),
+	FUNCTION(qup1_se7_l1),
+	FUNCTION(qup1_se7_l2),
+	FUNCTION(qup1_se7_l3),
+	FUNCTION(qup1_se7_l4),
+	FUNCTION(qup1_se7_l5),
+	FUNCTION(qup1_se7_l6),
+	FUNCTION(qup2_se0_l0),
+	FUNCTION(qup2_se0_l1),
+	FUNCTION(qup2_se0_l2),
+	FUNCTION(qup2_se0_l3),
+	FUNCTION(qup2_se1_l0),
+	FUNCTION(qup2_se1_l1),
+	FUNCTION(qup2_se1_l2),
+	FUNCTION(qup2_se1_l3),
+	FUNCTION(qup2_se2_l0),
+	FUNCTION(qup2_se2_l1),
+	FUNCTION(qup2_se2_l2),
+	FUNCTION(qup2_se2_l3),
+	FUNCTION(smb_alert),
+	FUNCTION(smb_alert_n),
+	FUNCTION(smb_clk),
+	FUNCTION(smb_dat),
+	FUNCTION(tb_trig_sdc1),
+	FUNCTION(tgu_ch0_trigout),
+	FUNCTION(tgu_ch1_trigout),
+	FUNCTION(tgu_ch2_trigout),
+	FUNCTION(tgu_ch3_trigout),
+	FUNCTION(tgu_ch4_trigout),
+	FUNCTION(tgu_ch5_trigout),
+	FUNCTION(tgu_ch6_trigout),
+	FUNCTION(tgu_ch7_trigout),
+	FUNCTION(tmess_prng_rosc0),
+	FUNCTION(tmess_prng_rosc1),
+	FUNCTION(tmess_prng_rosc2),
+	FUNCTION(tmess_prng_rosc3),
+	FUNCTION(tod_pps_in),
+	FUNCTION(tsense_pwm1_out),
+	FUNCTION(tsense_pwm2_out),
+	FUNCTION(usb2phy_ac_en),
+	FUNCTION(usb_con_det),
+	FUNCTION(usb_dfp_en),
+	FUNCTION(usb_phy_ps),
+	FUNCTION(vfr_0),
+	FUNCTION(vfr_1),
+	FUNCTION(vsense_trigger_mirnat),
+};
+
+/* Every pin is maintained as a single group, and missing or non-existing pin
+ * would be maintained as dummy group to synchronize pin group index with
+ * pin descriptor registered with pinctrl core.
+ * Clients would not be able to request these dummy pin groups.
+ */
+static const struct msm_pingroup qdru1000_groups[] = {
+	[0] = PINGROUP(0, qup2_se0_l0, qup2_se1_l2, ddr_bist_fail, _, _, _, _, _, _),
+	[1] = PINGROUP(1, qup2_se0_l1, qup2_se1_l3, ddr_bist_start, _, _, _, _, _, _),
+	[2] = PINGROUP(2, qup2_se1_l0, qup2_se0_l2, ddr_bist_complete, _,
+		       tsense_pwm1_out, _, _, _, _),
+	[3] = PINGROUP(3, qup2_se1_l1, qup2_se0_l3, ddr_bist_stop, _,
+		       tsense_pwm2_out, _, _, _, _),
+	[4] = PINGROUP(4, qup2_se2_l0, _, _, _, _, _, _, _, _),
+	[5] = PINGROUP(5, qup2_se2_l1, _, _, _, _, _, _, _, _),
+	[6] = PINGROUP(6, qup0_se0_l0, tgu_ch0_trigout, phase_flag_status0, _,
+		       qdss_gpio_tracedata0, _, _, _, _),
+	[7] = PINGROUP(7, qup0_se0_l1, tgu_ch1_trigout, phase_flag_status1, _,
+		       qdss_gpio_tracedata1, _, _, _, _),
+	[8] = PINGROUP(8, qup0_se0_l2, tgu_ch2_trigout, phase_flag_status2, _,
+		       qdss_gpio_tracedata2, _, _, _, _),
+	[9] = PINGROUP(9, qup0_se0_l3, tgu_ch3_trigout, phase_flag_status3, _,
+		       qdss_gpio_tracedata3, _, _, _, _),
+	[10] = PINGROUP(10, qup0_se1_l0, qup0_se2_l2, _, _, _, _, _, _, _),
+	[11] = PINGROUP(11, qup0_se1_l1, qup0_se2_l3, _, _, _, _, _, _, _),
+	[12] = PINGROUP(12, qup0_se2_l0, qup0_se1_l2, qup1_se7_l4, _, _, _, _, _, _),
+	[13] = PINGROUP(13, qup0_se2_l1, qup0_se1_l3, qup1_se7_l5, _, _, _, _, _, _),
+	[14] = PINGROUP(14, qup0_se3_l0, qup0_se4_l2, qup1_se7_l6, _, _, _, _, _, _),
+	[15] = PINGROUP(15, qup0_se3_l1, qup0_se4_l3, _, _, _, _, _, _, _),
+	[16] = PINGROUP(16, qup0_se4_l0, qup0_se3_l2, phase_flag_status4, _,
+			qdss_gpio_tracedata4, _, _, _, _),
+	[17] = PINGROUP(17, qup0_se4_l1, qup0_se3_l3, phase_flag_status5, _,
+			qdss_gpio_tracedata5, _, _, _, _),
+	[18] = PINGROUP(18, qup1_se0_l0, prng_rosc_test0, phase_flag_status6,
+			_, qdss_gpio_tracedata0, _, _, _, _),
+	[19] = PINGROUP(19, qup1_se0_l1, prng_rosc_test1, phase_flag_status7,
+			_, qdss_gpio_tracedata1, _, _, _, _),
+	[20] = PINGROUP(20, qup1_se0_l2, prng_rosc_test2, pll_bist_sync,
+			phase_flag_status8, _, qdss_gpio_tracedata2, _, _, _),
+	[21] = PINGROUP(21, qup1_se0_l3, prng_rosc_test3, phase_flag_status9,
+			_, qdss_gpio_tracedata3, _, _, _, _),
+	[22] = PINGROUP(22, qup1_se1_l0, qup1_se2_l2, phase_flag_status10, _,
+			qdss_gpio_tracedata4, _, _, _, _),
+	[23] = PINGROUP(23, qup1_se1_l1, qup1_se2_l3, phase_flag_status11, _,
+			qdss_gpio_tracedata5, _, _, _, _),
+	[24] = PINGROUP(24, qup1_se2_l0, qup1_se1_l2, phase_flag_status12, _,
+			qdss_gpio_tracedata6, _, _, _, _),
+	[25] = PINGROUP(25, qup1_se2_l1, qup1_se1_l3, phase_flag_status13, _,
+			qdss_gpio_tracedata7, _, _, _, _),
+	[26] = PINGROUP(26, qup1_se3_l0, qup1_se4_l2, intr_c_raw0,
+			phase_flag_status14, _, qdss_gpio_tracedata8, _, _, _),
+	[27] = PINGROUP(27, qup1_se3_l1, qup1_se4_l3, intr_c_raw1,
+			phase_flag_status15, _, qdss_gpio_tracedata9, _, _, _),
+	[28] = PINGROUP(28, qup1_se4_l0, qup1_se3_l2, intr_c_raw2,
+			phase_flag_status16, _, qdss_gpio_tracedata10, _, _, _),
+	[29] = PINGROUP(29, qup1_se4_l1, qup1_se3_l3, qup1_se6_l6,
+			phase_flag_status17, _, qdss_gpio_tracedata11, _, _, _),
+	[30] = PINGROUP(30, qup1_se7_l2, qup1_se5_l0, tmess_prng_rosc3,
+			phase_flag_status18, _, qdss_gpio_tracedata12, _, _, _),
+	[31] = PINGROUP(31, qup1_se7_l3, qup1_se5_l1, tmess_prng_rosc2,
+			phase_flag_status19, _, qdss_gpio_tracedata13, _, _, _),
+	[32] = PINGROUP(32, qup1_se5_l2, tmess_prng_rosc1, phase_flag_status20,
+			_, qdss_gpio_tracedata14, _, _, _, _),
+	[33] = PINGROUP(33, qup1_se5_l3, tmess_prng_rosc0, phase_flag_status21,
+			_, qdss_gpio_tracedata15, _, _, _, _),
+	[34] = PINGROUP(34, qup1_se6_l0, qdss_gpio_traceclk, _, _, _, _, _, _, _),
+	[35] = PINGROUP(35, qup1_se6_l1, qdss_gpio_tracectl, _, _, _, _, _, _, _),
+	[36] = PINGROUP(36, qup1_se6_l2, qdss_cti_trig3, _, _, _, _, _, _, _),
+	[37] = PINGROUP(37, qup1_se6_l3, qdss_cti_trig1, _, _, _, _, _, _, _),
+	[38] = PINGROUP(38, qup1_se6_l4, qdss_cti_trig4, _, _, _, _, _, _, _),
+	[39] = PINGROUP(39, qup1_se6_l5, qdss_cti_trig4, _, _, _, _, _, _, _),
+	[40] = PINGROUP(40, qup1_se7_l0, qdss_cti_trig0, _, _, _, _, _, _, _),
+	[41] = PINGROUP(41, qup1_se7_l1, qdss_cti_trig3, _, _, _, _, _, _, _),
+	[42] = PINGROUP(42, usb_con_det, phase_flag_status22, _,
+			qdss_gpio_tracedata6, _, _, _, _, _),
+	[43] = PINGROUP(43, usb_dfp_en, phase_flag_status23, _,
+			qdss_gpio_tracedata7, _, _, _, _, _),
+	[44] = PINGROUP(44, SI5518_INT, tgu_ch4_trigout, _, _, _, _, _, _, _),
+	[45] = PINGROUP(45, tgu_ch5_trigout, _, _, _, _, _, _, _, _),
+	[46] = PINGROUP(46, tgu_ch6_trigout, _, _, _, _, _, _, _, _),
+	[47] = PINGROUP(47, hardsync_pps_in, tgu_ch7_trigout, _, _, _, _, _, _, _),
+	[48] = PINGROUP(48, tod_pps_in, qdss_cti_trig0, _, _, _, _, _, _, _),
+	[49] = PINGROUP(49, gps_pps_in, qdss_cti_trig1, _, _, _, _, _, _, _),
+	[50] = PINGROUP(50, _, _, _, _, _, _, _, _, _),
+	[51] = PINGROUP(51, _, _, _, _, _, _, _, _, _),
+	[52] = PINGROUP(52, _, _, _, _, _, _, _, _, _),
+	[53] = PINGROUP(53, _, _, _, _, _, _, _, _, _),
+	[54] = PINGROUP(54, _, _, _, _, _, _, _, _, _),
+	[55] = PINGROUP(55, _, _, _, _, _, _, _, _, _),
+	[56] = PINGROUP(56, _, qlink6_wmss_reset, _, _, _, _, _, _, _),
+	[57] = PINGROUP(57, _, qlink7_wmss_reset, _, _, _, _, _, _, _),
+	[58] = PINGROUP(58, _, _, _, _, _, _, _, _, _),
+	[59] = PINGROUP(59, _, _, _, _, _, _, _, _, _),
+	[60] = PINGROUP(60, _, _, _, _, _, _, _, _, _),
+	[61] = PINGROUP(61, _, _, _, _, _, _, _, _, _),
+	[62] = PINGROUP(62, _, _, _, _, _, _, _, _, _),
+	[63] = PINGROUP(63, _, _, _, _, _, _, _, _, _),
+	[64] = PINGROUP(64, _, _, _, _, _, _, _, _, _),
+	[65] = PINGROUP(65, _, _, _, _, _, _, _, _, _),
+	[66] = PINGROUP(66, qlink0_request, _, _, _, _, _, _, _, _),
+	[67] = PINGROUP(67, qlink0_enable, _, _, _, _, _, _, _, _),
+	[68] = PINGROUP(68, qlink1_request, _, _, _, _, _, _, _, _),
+	[69] = PINGROUP(69, qlink1_enable, _, _, _, _, _, _, _, _),
+	[70] = PINGROUP(70, qlink2_request, _, _, _, _, _, _, _, _),
+	[71] = PINGROUP(71, qlink2_enable, _, _, _, _, _, _, _, _),
+	[72] = PINGROUP(72, qlink3_request, _, _, _, _, _, _, _, _),
+	[73] = PINGROUP(73, qlink3_enable, _, _, _, _, _, _, _, _),
+	[74] = PINGROUP(74, qlink4_request, _, _, _, _, _, _, _, _),
+	[75] = PINGROUP(75, qlink4_enable, _, _, _, _, _, _, _, _),
+	[76] = PINGROUP(76, qlink5_request, _, _, _, _, _, _, _, _),
+	[77] = PINGROUP(77, qlink5_enable, _, _, _, _, _, _, _, _),
+	[78] = PINGROUP(78, qlink6_request, _, _, _, _, _, _, _, _),
+	[79] = PINGROUP(79, qlink6_enable, _, _, _, _, _, _, _, _),
+	[80] = PINGROUP(80, qlink7_request, _, _, _, _, _, _, _, _),
+	[81] = PINGROUP(81, qlink7_enable, _, _, _, _, _, _, _, _),
+	[82] = PINGROUP(82, qlink0_wmss_reset, _, _, _, _, _, _, _, _),
+	[83] = PINGROUP(83, qlink1_wmss_reset, _, _, _, _, _, _, _, _),
+	[84] = PINGROUP(84, qlink4_wmss_reset, _, _, _, _, _, _, _, _),
+	[85] = PINGROUP(85, qlink5_wmss_reset, _, _, _, _, _, _, _, _),
+	[86] = PINGROUP(86, eth012_int_n, gcc_gp1_clk, _, qdss_cti_trig0, _, _, _, _, _),
+	[87] = PINGROUP(87, eth345_int_n, gcc_gp2_clk, _, qdss_cti_trig1, _, _, _, _, _),
+	[88] = PINGROUP(88, eth6_int_n, smb_alert_n, gcc_gp3_clk, _,
+			qdss_gpio_traceclk, _, _, _, _),
+	[89] = PINGROUP(89, phase_flag_status24, cmu_rng_entropy3, _,
+			qdss_gpio_tracedata8, atest_char_status3, _, _, _, _),
+	[90] = PINGROUP(90, usb2phy_ac_en, phase_flag_status25,
+			cmu_rng_entropy2, _, qdss_gpio_tracedata9,
+			atest_char_status2, _, _, _),
+	[91] = PINGROUP(91, usb_phy_ps, phase_flag_status26, cmu_rng_entropy1,
+			_, qdss_gpio_tracedata10, atest_char_status1, _, _, _),
+	[92] = PINGROUP(92, phase_flag_status27, cmu_rng_entropy0, _,
+			qdss_gpio_tracedata11, atest_char_status0, _, _, _, _),
+	[93] = PINGROUP(93, vfr_0, qdss_cti_trig0, _, _, _, _, _, _, _),
+	[94] = PINGROUP(94, vfr_1, qdss_cti_trig1, _, _, _, _, _, _, _),
+	[95] = PINGROUP(95, phase_flag_status28, _, qdss_gpio_tracedata12,
+			atest_char_start, _, _, _, _, _),
+	[96] = PINGROUP(96, phase_flag_status29, _, qdss_gpio_tracedata13, _, _, _, _, _, _),
+	[97] = PINGROUP(97, phase_flag_status30, _, qdss_gpio_tracedata14, _, _, _, _, _, _),
+	[98] = PINGROUP(98, pll_clk_aux, _, _, _, _, _, _, _, _),
+	[99] = PINGROUP(99, pcie0_clkreqn, char_exec_pending, _, _, _, _, _, _, _),
+	[100] = PINGROUP(100, char_exec_release, _, _, _, _, _, _, _, _),
+	[101] = PINGROUP(101, smb_alert, _, _, _, _, _, _, _, _),
+	[102] = PINGROUP(102, phase_flag_status31, _, qdss_gpio_tracedata15, _, _, _, _, _, _),
+	[103] = PINGROUP(103, CMO_PRI, qdss_gpio_tracectl, _, _, _, _, _, _, _),
+	[104] = PINGROUP(104, _, _, _, _, _, _, _, _, _),
+	[105] = PINGROUP(105, _, _, _, _, _, _, _, _, _),
+	[106] = PINGROUP(106, _, _, _, _, _, _, _, _, _),
+	[107] = PINGROUP(107, _, _, _, _, _, _, _, _, _),
+	[108] = PINGROUP(108, _, _, _, _, _, _, _, _, _),
+	[109] = PINGROUP(109, _, _, _, _, _, _, _, _, _),
+	[110] = PINGROUP(110, _, _, _, _, _, _, _, _, _),
+	[111] = PINGROUP(111, _, _, _, _, _, _, _, _, _),
+	[112] = PINGROUP(112, _, _, _, _, _, _, _, _, _),
+	[113] = PINGROUP(113, _, _, _, _, _, _, _, _, _),
+	[114] = PINGROUP(114, qspi_data_0, tb_trig_sdc1, _,
+			 atest_usb0_atereset, ddr_pxi0_test, _, _, _, _),
+	[115] = PINGROUP(115, qspi_data_1, _, atest_usb0_testdataout00,
+			 ddr_pxi0_test, _, _, _, _, _),
+	[116] = PINGROUP(116, qspi_data_2, _, atest_usb0_testdataout01,
+			 ddr_pxi1_test, _, _, _, _, _),
+	[117] = PINGROUP(117, qspi_data_3, _, atest_usb0_testdataout02,
+			 ddr_pxi1_test, _, _, _, _, _),
+	[118] = PINGROUP(118, _, atest_usb0_testdataout03, ddr_pxi2_test, _, _, _, _, _, _),
+	[119] = PINGROUP(119, _, _, ddr_pxi2_test, _, _, _, _, _, _),
+	[120] = PINGROUP(120, _, _, ddr_pxi3_test, _, _, _, _, _, _),
+	[121] = PINGROUP(121, _, ddr_pxi3_test, _, _, _, _, _, _, _),
+	[122] = PINGROUP(122, _, ddr_pxi4_test, _, _, _, _, _, _, _),
+	[123] = PINGROUP(123, _, ddr_pxi4_test, _, _, _, _, _, _, _),
+	[124] = PINGROUP(124, _, ddr_pxi5_test, _, _, _, _, _, _, _),
+	[125] = PINGROUP(125, qspi_cs_n, _, ddr_pxi5_test, _, _, _, _, _, _),
+	[126] = PINGROUP(126, qspi_clk, _, ddr_pxi6_test, _, _, _, _, _, _),
+	[127] = PINGROUP(127, _, ddr_pxi6_test, _, _, _, _, _, _, _),
+	[128] = PINGROUP(128, qup2_se2_l2, _, ddr_pxi7_test, _, _, _, _, _, _),
+	[129] = PINGROUP(129, qup2_se2_l3, ddr_pxi7_test, _, _, _, _, _, _, _),
+	[130] = PINGROUP(130, qup0_se5_l0, qup0_se6_l2, jitter_bist_ref,
+			 qdss_cti_trig2, _, _, _, _, _),
+	[131] = PINGROUP(131, qup0_se5_l1, qup0_se6_l3, qdss_cti_trig2, _, _, _, _, _, _),
+	[132] = PINGROUP(132, qup0_se6_l0, qup0_se5_l2, smb_dat,
+			 qdss_cti_trig2, _, _, _, _, _),
+	[133] = PINGROUP(133, qup0_se6_l1, qup0_se5_l3, smb_clk,
+			 qdss_cti_trig3, _, _, _, _, _),
+	[134] = PINGROUP(134, qup0_se7_l0, qup0_se7_l2, gcc_gp1_clk, _,
+			 qdss_cti_trig3, _, _, _, _),
+	[135] = PINGROUP(135, qup0_se7_l1, qup0_se7_l3, gcc_gp2_clk, _,
+			 qdss_cti_trig2, vsense_trigger_mirnat, _, _, _),
+	[136] = PINGROUP(136, gcc_gp3_clk, dbg_out_clk, _, _, _, _, _, _, _),
+	[137] = PINGROUP(137, _, _, _, _, _, _, _, _, _),
+	[138] = PINGROUP(138, qlink2_wmss_reset, _, _, _, _, _, _, _, _),
+	[139] = PINGROUP(139, qlink3_wmss_reset, _, _, _, _, _, _, _, _),
+	[140] = PINGROUP(140, _, _, _, _, _, _, _, _, _),
+	[141] = PINGROUP(141, intr_c_raw0, _, _, _, _, _, _, _, _),
+	[142] = PINGROUP(142, intr_c_raw1, _, _, _, _, _, _, _, _),
+	[143] = PINGROUP(143, intr_c_raw2, _, _, _, _, _, _, _, _),
+	[144] = PINGROUP(144, qdss_cti_trig4, _, _, _, _, _, _, _, _),
+	[145] = PINGROUP(145, qdss_cti_trig4, _, _, _, _, _, _, _, _),
+	[146] = PINGROUP(146, _, _, _, _, _, _, _, _, _),
+	[147] = PINGROUP(147, _, _, _, _, _, _, _, _, _),
+	[148] = PINGROUP(148, _, _, _, _, _, _, _, _, _),
+	[149] = PINGROUP(149, _, _, _, _, _, _, _, _, _),
+	[150] = PINGROUP(150, _, _, _, _, _, _, _, _, _),
+	[151] = SDC_QDSD_PINGROUP(sdc1_rclk, 0x9e000, 0, 0),
+	[152] = SDC_QDSD_PINGROUP(sdc1_clk, 0x9d000, 13, 6),
+	[153] = SDC_QDSD_PINGROUP(sdc1_cmd, 0x9d000, 11, 3),
+	[154] = SDC_QDSD_PINGROUP(sdc1_data, 0x9d000, 9, 0),
+};
-- 
2.37.3

