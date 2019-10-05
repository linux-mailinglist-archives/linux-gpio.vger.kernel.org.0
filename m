Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F9D9CC982
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Oct 2019 12:59:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725985AbfJEK7r (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Oct 2019 06:59:47 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:42603 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727709AbfJEK7r (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Oct 2019 06:59:47 -0400
Received: by mail-wr1-f65.google.com with SMTP id n14so9942109wrw.9;
        Sat, 05 Oct 2019 03:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/qNfj8GbLN+9PGGvc6otSbPpwss0oFPmoNbSZpQa+N0=;
        b=iU/sh7PGzUaH6isKn+MT11M66BBSfv1MHrs+qTVJQlm3wo13gpEDtPYSkdvFH7HJIP
         qul9Y8QYDoqAaPKggTklnMpfGtcN0tD1zZzdYnp0M0MWWysoAfSYk7EC3Kn2fI56EeU/
         +XJz/Pd+Z75mkYaQrVQJgdJSbQXdAFkax9tcr/gHkDzC51uSwEdG4TztnjCSnyUQtzUx
         dCeejc4iOftqhRQQ6am9AIkkv7T9sTIzqTIthPmaVW+sH4DT0EfBMlhOiYPgTZQueDzw
         YNDEMfhFgHdbIYs5Yop3PaGdMw93HhaFUbGXKEQy+ojSm3UiKQz7liwlG0CkxQpb8/kj
         nsrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/qNfj8GbLN+9PGGvc6otSbPpwss0oFPmoNbSZpQa+N0=;
        b=SDF4Uegh57vjEQkY9eVPRueGIuKcbOFwruKATAkkXjSVBzzxRlfiOo+Wv0QwN/0Ngs
         6Eu34RKtks+8xfRDuX55pmUDhQMFsVK69KJabaosD3JJxF93pekTU2ENXVX8vTxI/EAt
         CioLA5qWp8b5GYnnGtDR09fI5HZE4uJWNaFPbOIcN1ZM01mDn8j2oV0cu4UVT6P2QymP
         6U1FtPDYCZG26jr6jY8lhz/uZRvLTBzxfj0XgGXh3wDziOJsvkB/v755v7ARvHd+rB2T
         iw/VNW9G/nTiMIrRWXWzY7WNQVniFHsokPs7ySjEaILKJUB28mW3waDnEv53DLlJ1Gdp
         81Wg==
X-Gm-Message-State: APjAAAX2I6N14DKaYPNWimi25rZnJGpXevekjBWhpMPLZj7k0+vjeRLP
        4WQSC+PeYf2P0U7d1l6zSXwcjcmlDqu49A==
X-Google-Smtp-Source: APXvYqx5TqwRAIRHvmDFvyypdNJCOmNnhU/CuHI3K/dR8lsEmD1XGB0wB9NcvZum44pb4qquY9WEZA==
X-Received: by 2002:adf:f58c:: with SMTP id f12mr12415355wro.38.1570273183079;
        Sat, 05 Oct 2019 03:59:43 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id u7sm9227678wrp.19.2019.10.05.03.59.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 05 Oct 2019 03:59:42 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org,
        linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        marijns95@gmail.com, kholk11@gmail.com
Subject: [PATCH 2/2] dt-bindings: pinctrl: Add MSM8976 driver bindings and documentation
Date:   Sat,  5 Oct 2019 12:59:36 +0200
Message-Id: <20191005105936.31216-3-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191005105936.31216-1-kholk11@gmail.com>
References: <20191005105936.31216-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

Add the documentation for this new driver for pin configuration
with the pinctrl framework on MSM8976/56 and its APQ variants.
---
 .../bindings/pinctrl/qcom,msm8976-pinctrl.txt | 183 ++++++++++++++++++
 1 file changed, 183 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,msm8976-pinctrl.txt

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8976-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,msm8976-pinctrl.txt
new file mode 100644
index 000000000000..70d04d12f136
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8976-pinctrl.txt
@@ -0,0 +1,183 @@
+Qualcomm MSM8976 TLMM block
+
+This binding describes the Top Level Mode Multiplexer block found in the
+MSM8956 and MSM8976 platforms.
+
+- compatible:
+	Usage: required
+	Value type: <string>
+	Definition: must be "qcom,msm8976-pinctrl"
+
+- reg:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: the base address and size of the TLMM register space.
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
+	Definition:  see ../gpio/gpio.txt
+
+- gpio-reserved-ranges:
+	Usage: optional
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
+		      gpio0-gpio145
+		        Supports mux, bias and drive-strength
+
+		      sdc1_clk, sdc1_cmd, sdc1_data,
+		      sdc2_clk, sdc2_cmd, sdc2_data,
+		      sdc3_clk, sdc3_cmd, sdc3_data
+		        Supports bias and drive-strength
+
+- function:
+	Usage: required
+	Value type: <string>
+	Definition: Specify the alternative function to be configured for the
+		    specified pins. Functions are only valid for gpio pins.
+		    Valid values are:
+
+		    gpio, blsp_uart1, blsp_spi1, smb_int, blsp_i2c1, blsp_spi2,
+		    blsp_uart2, blsp_i2c2, gcc_gp1_clk_b, blsp_spi3,
+		    qdss_tracedata_b, blsp_i2c3, gcc_gp2_clk_b, gcc_gp3_clk_b,
+		    blsp_spi4, cap_int, blsp_i2c4, blsp_spi5, blsp_uart5,
+		    qdss_traceclk_a, m_voc, blsp_i2c5, qdss_tracectl_a,
+		    qdss_tracedata_a, blsp_spi6, blsp_uart6, qdss_tracectl_b,
+		    blsp_i2c6, qdss_traceclk_b, mdp_vsync, pri_mi2s_mclk_a,
+		    sec_mi2s_mclk_a, cam_mclk, cci0_i2c, cci1_i2c, blsp1_spi,
+		    blsp3_spi, gcc_gp1_clk_a, gcc_gp2_clk_a, gcc_gp3_clk_a,
+		    uim_batt, sd_write, uim1_data, uim1_clk, uim1_reset,
+		    uim1_present, uim2_data, uim2_clk, uim2_reset,
+		    uim2_present, ts_xvdd, mipi_dsi0, us_euro, ts_resout,
+		    ts_sample, sec_mi2s_mclk_b, pri_mi2s, codec_reset,
+		    cdc_pdm0, us_emitter, pri_mi2s_mclk_b, pri_mi2s_mclk_c,
+		    lpass_slimbus, lpass_slimbus0, lpass_slimbus1, codec_int1,
+		    codec_int2, wcss_bt, sdc3, wcss_wlan2, wcss_wlan1,
+		    wcss_wlan0, wcss_wlan, wcss_fm, key_volp, key_snapshot,
+		    key_focus, key_home, pwr_down, dmic0_clk, hdmi_int,
+		    dmic0_data, wsa_vi, wsa_en, blsp_spi8, wsa_irq, blsp_i2c8,
+		    pa_indicator, modem_tsync, ssbi_wtr1, gsm1_tx, gsm0_tx,
+		    sdcard_det, sec_mi2s, ss_switch,
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
+	tlmm: pinctrl@1000000 {
+		compatible = "qcom,msm8976-pinctrl";
+		reg = <0x1000000 0x300000>;
+		interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-ranges = <&tlmm 0 0 145>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		blsp1_uart2_active: blsp1_uart2_active {
+			mux {
+				pins = "gpio4", "gpio5", "gpio6", "gpio7";
+				function = "blsp_uart2";
+			};
+
+			config {
+				pins = "gpio4", "gpio5", "gpio6", "gpio7";
+				drive-strength = <2>;
+				bias-disable;
+			};
+		};
+	};
-- 
2.21.0

