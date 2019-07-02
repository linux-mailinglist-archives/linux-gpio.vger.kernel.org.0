Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C46F5CDF5
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jul 2019 12:54:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727068AbfGBKyU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Jul 2019 06:54:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:32770 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725891AbfGBKyU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 2 Jul 2019 06:54:20 -0400
Received: from vkoul-mobl.Dlink (unknown [49.207.58.199])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 07EF4216C8;
        Tue,  2 Jul 2019 10:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1562064859;
        bh=k+1G1uJ9YgoempJoUiXKcjgS7U+gmVpkmVBzyikzjdw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gApWQKJCy6ZOOi0dFtk1m5IUn85H7xzKJsSPM1ez04u61wgQKv8IewqTLCIQp6357
         2F+wuxirc/1M3iv9ILzk6QyGvlt3uTsEJ8HAEt1k0hPKISmqAcHYtm0OO+Un+ogmso
         DZ9LQj/VH17sPWAopaYHp24XeoITMpD7Fh9tvKVc=
From:   Vinod Koul <vkoul@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Prasad Sodagudi <psodagud@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Isaac J . Manjarres" <isaacm@codeaurora.org>,
        Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v2 2/3] dt-bindings: pinctrl: qcom: Add SM8150 pinctrl binding
Date:   Tue,  2 Jul 2019 16:20:44 +0530
Message-Id: <20190702105045.27646-3-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702105045.27646-1-vkoul@kernel.org>
References: <20190702105045.27646-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Prasad Sodagudi <psodagud@codeaurora.org>

Add the binding for the TLMM pinctrl block found in the SM8150 platform.

Signed-off-by: Prasad Sodagudi <psodagud@codeaurora.org>
Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
[vkoul: add missing nodes of gpio range and reserved
	rewrote function names and order them]
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 .../bindings/pinctrl/qcom,sm8150-pinctrl.txt  | 190 ++++++++++++++++++
 1 file changed, 190 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm8150-pinctrl.txt

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8150-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,sm8150-pinctrl.txt
new file mode 100644
index 000000000000..fa37733e5102
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8150-pinctrl.txt
@@ -0,0 +1,190 @@
+Qualcomm SM8150 TLMM block
+
+This binding describes the Top Level Mode Multiplexer block found in the
+QCS404 platform.
+
+- compatible:
+	Usage: required
+	Value type: <string>
+	Definition: must be "qcom,sm8150-pinctrl"
+
+- reg:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: the base address and size of the north, south, west
+		    and east TLMM tiles.
+
+- reg-names:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Defintiion: names for the cells of reg, must contain "north", "south"
+		    "west" and "east".
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
+		      gpio0-gpio149
+		        Supports mux, bias and drive-strength
+
+		      sdc1_clk, sdc1_cmd, sdc1_data sdc2_clk, sdc2_cmd,
+		      sdc2_data sdc1_rclk
+		        Supports bias and drive-strength
+
+		      ufs_reset
+		        Supports bias and drive-strength
+
+- function:
+	Usage: required
+	Value type: <string>
+	Definition: Specify the alternative function to be configured for the
+		    specified pins. Functions are only valid for gpio pins.
+		    Valid values are:
+
+		    adsp_ext, agera_pll, aoss_cti, ddr_pxi2, atest_char,
+		    atest_char0, atest_char1, atest_char2, atest_char3,
+		    audio_ref, atest_usb1, atest_usb2, atest_usb10,
+		    atest_usb11, atest_usb12, atest_usb13, atest_usb20,
+		    atest_usb21, atest_usb22, atest_usb2, atest_usb23,
+		    btfm_slimbus, cam_mclk, cci_async, cci_i2c, cci_timer0,
+		    cci_timer1, cci_timer2, cci_timer3, cci_timer4,
+		    cri_trng, cri_trng0, cri_trng1, dbg_out, ddr_bist,
+		    ddr_pxi0, ddr_pxi1, ddr_pxi3, edp_hot, edp_lcd,
+		    emac_phy, emac_pps, gcc_gp1, gcc_gp2, gcc_gp3, gpio,
+		    hs1_mi2s, hs2_mi2s, hs3_mi2s, jitter_bist,
+		    lpass_slimbus, mdp_vsync, mdp_vsync0, mdp_vsync1,
+		    mdp_vsync2, mdp_vsync3, mss_lte, m_voc, nav_pps,
+		    pa_indicator, pci_e0, phase_flag, pll_bypassnl,
+		    pll_bist, pci_e1, pll_reset, pri_mi2s, pri_mi2s_ws,
+		    prng_rosc, qdss, qdss_cti, qlink_request, qlink_enable,
+		    qspi0, qspi1, qspi2, qspi3, qspi_clk, qspi_cs, qua_mi2s,
+		    qup0, qup1, qup2, qup3, qup4, qup5, qup6, qup7, qup8,
+		    qup9, qup10, qup11, qup12, qup13, qup14, qup15, qup16,
+		    qup17, qup18, qup19, qup_l4, qup_l5, qup_l6, rgmii,
+		    sdc4, sd_write, sec_mi2s, spkr_i2s, sp_cmu, ter_mi2s,
+		    tgu_ch0, tgu_ch1, tgu_ch2, tgu_ch3, tsense_pwm1,
+		    tsense_pwm2, tsif1, tsif2, uim1, uim2, uim_batt,
+		    usb2phy_ac, usb_phy, vfr_1, vsense_trigger, wlan1_adc0,
+		    wlan1_adc1, wlan2_adc0, wlan2_adc1, wmss_reset
+
+- bias-disable:
+	Usage: optional
+	Value type: <none>
+	Definition: The specified pins should be configued as no pull.
+
+- bias-pull-down:
+	Usage: optional
+	Value type: <none>
+	Definition: The specified pins should be configued as pull down.
+
+- bias-pull-up:
+	Usage: optional
+	Value type: <none>
+	Definition: The specified pins should be configued as pull up.
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
+		compatible = "qcom,sm8150-pinctrl";
+		reg = <0x03100000 0x300000>,
+		      <0x03500000 0x300000>,
+		      <0x03900000 0x300000>,
+		      <0x03D00000 0x300000>;
+		reg-names = "west", "east", "north", "south";
+		interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-ranges = <&tlmm 0 0 175>;
+		gpio-reserved-ranges = <0 4>, <126 4>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
-- 
2.20.1

