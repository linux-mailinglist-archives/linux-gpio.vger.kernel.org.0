Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E934C7D905
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2019 12:07:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727854AbfHAKH5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Aug 2019 06:07:57 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:38172 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725379AbfHAKH4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Aug 2019 06:07:56 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 96E7960863; Thu,  1 Aug 2019 10:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564654074;
        bh=MvQ/vlISmmItEMCNH7oCJDboTjPvkfI4c3GCQ+1LVws=;
        h=From:To:Cc:Subject:Date:From;
        b=fkzldWCiEJU15/NG4CHv26CbhhhWB9Yf2lEFIC41ba+w2zwnfh6klhXSuc4ZdIG1n
         2LQl+zohiJHE0MWSS6NBLYNbm/o1tV59pG5CVziPZ8grNAJ5baZGOpoYPZGUm4YV9o
         8vogXu1ISHNI7g584eT5+Jde9TQ7FjwYR9XvYIxI=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8F0316030B;
        Thu,  1 Aug 2019 10:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564654073;
        bh=MvQ/vlISmmItEMCNH7oCJDboTjPvkfI4c3GCQ+1LVws=;
        h=From:To:Cc:Subject:Date:From;
        b=UPfahHfQSPY35Sj5q41rlyT2vNGCoYfPpiELZX/sUhN1gLDP9OVgAi9ykhzFlXbeK
         Y3C9CDE2Uhpm+wpQr+T9a3aocoWC/tiBte/Gh+CO3PYh7oTyG3p7xtpxkQk1w+vDaR
         RX2dLDigm2sV6cGryQio58dkOhHmfNnPUcuuvaw8=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8F0316030B
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     linus.walleij@linaro.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, agross@kernel.org,
        robh+dt@kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jitendra Sharma <shajit@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add SC7180 pinctrl binding
Date:   Thu,  1 Aug 2019 15:37:16 +0530
Message-Id: <20190801100717.23333-1-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Jitendra Sharma <shajit@codeaurora.org>

Add the binding for the TLMM pinctrl block found in the SC7180 platform

Signed-off-by: Jitendra Sharma <shajit@codeaurora.org>
Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
[rnayak: Fix some copy-paste issues, sort and fix functions]
Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 .../bindings/pinctrl/qcom,sc7180-pinctrl.txt  | 186 ++++++++++++++++++
 1 file changed, 186 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sc7180-pinctrl.txt

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc7180-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,sc7180-pinctrl.txt
new file mode 100644
index 000000000000..948cd56cfab7
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc7180-pinctrl.txt
@@ -0,0 +1,186 @@
+Qualcomm Technologies, Inc. SC7180 TLMM block
+
+This binding describes the Top Level Mode Multiplexer block found in the
+SC7180 platform.
+
+- compatible:
+	Usage: required
+	Value type: <string>
+	Definition: must be "qcom,sc7180-pinctrl"
+
+- reg:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: the base address and size of the north, south and west
+		    TLMM tiles
+
+- reg-names:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Defintiion: names for the cells of reg, must contain "north", "south"
+		    and "west".
+
+- interrupts:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: should specify the TLMM summary IRQ.
+
+- interrupt-controller:
+	Usage: required
+	Value type: <none>
+	Definition: identifies this node as an interrupt controller
+
+- #interrupt-cells:
+	Usage: required
+	Value type: <u32>
+	Definition: must be 2. Specifying the pin number and flags, as defined
+		    in <dt-bindings/interrupt-controller/irq.h>
+
+- gpio-controller:
+	Usage: required
+	Value type: <none>
+	Definition: identifies this node as a gpio controller
+
+- #gpio-cells:
+	Usage: required
+	Value type: <u32>
+	Definition: must be 2. Specifying the pin number and flags, as defined
+		    in <dt-bindings/gpio/gpio.h>
+
+- gpio-ranges:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition:  see ../gpio/gpio.txt
+
+- gpio-reserved-ranges:
+	Usage: optional
+	Value type: <prop-encoded-array>
+	Definition: see ../gpio/gpio.txt
+
+Please refer to ../gpio/gpio.txt and ../interrupt-controller/interrupts.txt for
+a general description of GPIO and interrupt bindings.
+
+Please refer to pinctrl-bindings.txt in this directory for details of the
+common pinctrl bindings used by client devices, including the meaning of the
+phrase "pin configuration node".
+
+The pin configuration nodes act as a container for an arbitrary number of
+subnodes. Each of these subnodes represents some desired configuration for a
+pin, a group, or a list of pins or groups. This configuration can include the
+mux function to select on those pin(s)/group(s), and various pin configuration
+parameters, such as pull-up, drive strength, etc.
+
+
+PIN CONFIGURATION NODES:
+
+The name of each subnode is not important; all subnodes should be enumerated
+and processed purely based on their content.
+
+Each subnode only affects those parameters that are explicitly listed. In
+other words, a subnode that lists a mux function but no pin configuration
+parameters implies no information about any pin configuration parameters.
+Similarly, a pin subnode that describes a pullup parameter implies no
+information about e.g. the mux function.
+
+
+The following generic properties as defined in pinctrl-bindings.txt are valid
+to specify in a pin configuration subnode:
+
+- pins:
+	Usage: required
+	Value type: <string-array>
+	Definition: List of gpio pins affected by the properties specified in
+		    this subnode.
+
+		    Valid pins are:
+		      gpio0-gpio118
+		        Supports mux, bias and drive-strength
+
+		      sdc1_clk, sdc1_cmd, sdc1_data sdc2_clk, sdc2_cmd,
+		      sdc2_data sdc1_rclk
+		        Supports bias and drive-strength
+
+		      ufs_reset
+			Supports bias and drive-strength
+
+- function:
+	Usage: required
+	Value type: <string>
+	Definition: Specify the alternative function to be configured for the
+		    specified pins. Functions are only valid for gpio pins.
+		    Valid values are:
+
+		    adsp_ext, agera_pll, aoss_cti, atest_char, atest_char0,
+		    atest_char1, atest_char2, atest_char3, atest_tsens,
+		    atest_tsens2, atest_usb1, atest_usb10, atest_usb11,
+		    atest_usb12, atest_usb13, atest_usb2, atest_usb20,
+		    atest_usb21, atest_usb22, atest_usb23, audio_ref,
+		    btfm_slimbus, cam_mclk, cci_async, cci_i2c, cci_timer0,
+		    cci_timer1, cci_timer2, cci_timer3, cci_timer4,
+		    cri_trng, dbg_out, ddr_bist, ddr_pxi0, ddr_pxi1,
+		    ddr_pxi2, ddr_pxi3, dp_hot, edp_lcd, gcc_gp1, gcc_gp2,
+		    gcc_gp3, gpio, gp_pdm0, gp_pdm1, gp_pdm2, gps_tx,
+		    jitter_bist, ldo_en, ldo_update, lpass_ext, mdp_vsync,
+		    mdp_vsync0, mdp_vsync1, mdp_vsync2, mdp_vsync3, mi2s_0,
+		    mi2s_1, mi2s_2, mss_lte, m_voc, pa_indicator, phase_flag,
+		    PLL_BIST, pll_bypassnl, pll_reset, prng_rosc, qdss,
+		    qdss_cti, qlink_enable, qlink_request, qspi_clk, qspi_cs,
+		    qspi_data, qup00, qup01, qup02, qup03, qup04, qup05,
+		    qup10, qup11, qup12, qup13, qup14, qup15, sdc1_tb,
+		    sdc2_tb, sd_write, sp_cmu, tgu_ch0, tgu_ch1, tgu_ch2,
+		    tgu_ch3, tsense_pwm1, tsense_pwm2, uim1, uim2, uim_batt,
+		    usb_phy, vfr_1, _V_GPIO, _V_PPS_IN, _V_PPS_OUT,
+		    vsense_trigger, wlan1_adc0, wlan1_adc1, wlan2_adc0,
+		    wlan2_adc1,
+
+- bias-disable:
+	Usage: optional
+	Value type: <none>
+	Definition: The specified pins should be configured as no pull.
+
+- bias-pull-down:
+	Usage: optional
+	Value type: <none>
+	Definition: The specified pins should be configured as pull down.
+
+- bias-pull-up:
+	Usage: optional
+	Value type: <none>
+	Definition: The specified pins should be configured as pull up.
+
+- output-high:
+	Usage: optional
+	Value type: <none>
+	Definition: The specified pins are configured in output mode, driven
+		    high.
+		    Not valid for sdc pins.
+
+- output-low:
+	Usage: optional
+	Value type: <none>
+	Definition: The specified pins are configured in output mode, driven
+		    low.
+		    Not valid for sdc pins.
+
+- drive-strength:
+	Usage: optional
+	Value type: <u32>
+	Definition: Selects the drive strength for the specified pins, in mA.
+		    Valid values are: 2, 4, 6, 8, 10, 12, 14 and 16
+
+Example:
+
+	tlmm: pinctrl@3000000 {
+		compatible = "qcom,sc7180-pinctrl";
+		reg = <0x3500000 0x300000>,
+		      <0x3900000 0x300000>,
+		      <0x3D00000 0x300000>;
+		reg-names = "west", "north", "south";
+		interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-ranges = <&tlmm 0 0 119>;
+		gpio-reserved-ranges = <0 4>, <106 4>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

