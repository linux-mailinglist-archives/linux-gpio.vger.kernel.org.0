Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C906F47A1D
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2019 08:37:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725776AbfFQGhm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jun 2019 02:37:42 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:37442 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725813AbfFQGhm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jun 2019 02:37:42 -0400
Received: by mail-pf1-f193.google.com with SMTP id 19so5104207pfa.4
        for <linux-gpio@vger.kernel.org>; Sun, 16 Jun 2019 23:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=IMh0ZsavVcYbONQ6Nnnstj3MvppfOQXEJSXhO7eTMaY=;
        b=K+dWSrJHLH5B39gRFtmSqMfGnU8rFYvGQuyaeWaaL/wUrcl6B0O8LMyJNWGUoEAiWD
         zI4rdVrb8PrwFSXU72KNU9X3msptzqX+90+GWuKaqL5ODZ96od2MAfmSDZfZPeaW936o
         gy3wBi8snLbB6cOW1r6UYMEEpsUjqoE7JIWXChaN3Dx4CvfMgIZjZbKapo4UJLKOSkLY
         Z+V9Kzp8913iYzlOoX13a1c4nCuQDKXPDrv+iBqg1uGGxYCiMTGLcDYdalIMHRBjHnZY
         MKPRcDnq9WGJUIc6/bgSwxa3retefQ8StutISooLUrzzgD0tEC7deL05e7LM27t1VP/w
         CBtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=IMh0ZsavVcYbONQ6Nnnstj3MvppfOQXEJSXhO7eTMaY=;
        b=UIrMP0r2DbyFOK+XEK+j0vmA1uFDIvbo4glrQ2ScEuShncvg6z5DNZnoq8YLtWCscq
         V0xZsWGvEKIU53nBh2U0fhZn8Z+bshJSW4Mpa8qZaRiCRqr04RfmO5NA3Mw0i2hic8dn
         2NQkFmYRvfIZQG5D2lnfE7eH43LCll/2foEGjC1XTCvDBkA4r8YfbSxgpUNgH6mI3tDw
         Gpmagnua9lkXAxyz8hMQsUSza6ja2hOpqtY8MNk5bWN8wV9GhrRTdXU1Ctly0IEVJS8w
         lGl4nTiPbCIPgv0E96tiAh3oEaXs2mcEQEhTxFAfAddE+dz0WAUZXkqBzR5O4NdWxmU4
         0n/A==
X-Gm-Message-State: APjAAAXZslgt6ID4Bf4PYNQvCxtEwSCdjV5V/a477dQj2q6OZO/f7SZa
        Ezb8Ax7u6eG06nGN5Cy7ngm5
X-Google-Smtp-Source: APXvYqyKCc9URtz5kjN3U97Axl98QaGIJBqbXrV9qHUYa6xurWH32Wy6vbFTWWqzakGqq1B2zLaiSw==
X-Received: by 2002:a63:1723:: with SMTP id x35mr47352782pgl.233.1560753461181;
        Sun, 16 Jun 2019 23:37:41 -0700 (PDT)
Received: from mani ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id l44sm12344889pje.29.2019.06.16.23.37.37
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 Jun 2019 23:37:40 -0700 (PDT)
Date:   Mon, 17 Jun 2019 12:07:32 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Prasad Sodagudi <psodagud@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Isaac J . Manjarres" <isaacm@codeaurora.org>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add SM8150 pinctrl
 binding
Message-ID: <20190617063732.GA18010@mani>
References: <20190614053032.24208-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190614053032.24208-1-vkoul@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hey Vinod,

On Fri, Jun 14, 2019 at 11:00:31AM +0530, Vinod Koul wrote:
> From: Prasad Sodagudi <psodagud@codeaurora.org>
> 
> Add the binding for the TLMM pinctrl block found in the SM8150 platform.
> 
> Signed-off-by: Prasad Sodagudi <psodagud@codeaurora.org>
> Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  .../bindings/pinctrl/qcom,sm8150-pinctrl      | 200 ++++++++++++++++++

Looks like you missed the .txt extension for binding :-)

Regards,
Mani

>  1 file changed, 200 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm8150-pinctrl
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8150-pinctrl b/Documentation/devicetree/bindings/pinctrl/qcom,sm8150-pinctrl
> new file mode 100644
> index 000000000000..4f21d18b0be2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8150-pinctrl
> @@ -0,0 +1,200 @@
> +Qualcomm SM8150 TLMM block
> +
> +This binding describes the Top Level Mode Multiplexer block found in the
> +QCS404 platform.
> +
> +- compatible:
> +	Usage: required
> +	Value type: <string>
> +	Definition: must be "qcom,sm8150-pinctrl"
> +
> +- reg:
> +	Usage: required
> +	Value type: <prop-encoded-array>
> +	Definition: the base address and size of the north, south , west
> +		    and east TLMM tiles.
> +
> +- reg-names:
> +	Usage: required
> +	Value type: <prop-encoded-array>
> +	Defintiion: names for the cells of reg, must contain "north", "south"
> +		    "west" and "east".
> +
> +- interrupts:
> +	Usage: required
> +	Value type: <prop-encoded-array>
> +	Definition: should specify the TLMM summary IRQ.
> +
> +- interrupt-controller:
> +	Usage: required
> +	Value type: <none>
> +	Definition: identifies this node as an interrupt controller
> +
> +- #interrupt-cells:
> +	Usage: required
> +	Value type: <u32>
> +	Definition: must be 2. Specifying the pin number and flags, as defined
> +		    in <dt-bindings/interrupt-controller/irq.h>
> +
> +- gpio-controller:
> +	Usage: required
> +	Value type: <none>
> +	Definition: identifies this node as a gpio controller
> +
> +- #gpio-cells:
> +	Usage: required
> +	Value type: <u32>
> +	Definition: must be 2. Specifying the pin number and flags, as defined
> +		    in <dt-bindings/gpio/gpio.h>
> +
> +Please refer to ../gpio/gpio.txt and ../interrupt-controller/interrupts.txt for
> +a general description of GPIO and interrupt bindings.
> +
> +Please refer to pinctrl-bindings.txt in this directory for details of the
> +common pinctrl bindings used by client devices, including the meaning of the
> +phrase "pin configuration node".
> +
> +The pin configuration nodes act as a container for an arbitrary number of
> +subnodes. Each of these subnodes represents some desired configuration for a
> +pin, a group, or a list of pins or groups. This configuration can include the
> +mux function to select on those pin(s)/group(s), and various pin configuration
> +parameters, such as pull-up, drive strength, etc.
> +
> +
> +PIN CONFIGURATION NODES:
> +
> +The name of each subnode is not important; all subnodes should be enumerated
> +and processed purely based on their content.
> +
> +Each subnode only affects those parameters that are explicitly listed. In
> +other words, a subnode that lists a mux function but no pin configuration
> +parameters implies no information about any pin configuration parameters.
> +Similarly, a pin subnode that describes a pullup parameter implies no
> +information about e.g. the mux function.
> +
> +
> +The following generic properties as defined in pinctrl-bindings.txt are valid
> +to specify in a pin configuration subnode:
> +
> +- pins:
> +	Usage: required
> +	Value type: <string-array>
> +	Definition: List of gpio pins affected by the properties specified in
> +		    this subnode.
> +
> +		    Valid pins are:
> +		      gpio0-gpio149
> +		        Supports mux, bias and drive-strength
> +
> +		      sdc1_clk, sdc1_cmd, sdc1_data sdc2_clk, sdc2_cmd,
> +		      sdc2_data sdc1_rclk
> +		        Supports bias and drive-strength
> +
> +		      ufs_reset
> +		        Supports bias and drive-strength
> +
> +- function:
> +	Usage: required
> +	Value type: <string>
> +	Definition: Specify the alternative function to be configured for the
> +		    specified pins. Functions are only valid for gpio pins.
> +		    Valid values are:
> +
> +		    blsp_uart1, blsp_spi1, blsp_i2c1, blsp_uim1, atest_tsens,
> +		    bimc_dte1, dac_calib0, blsp_spi8, blsp_uart8, blsp_uim8,
> +		    qdss_cti_trig_out_b, bimc_dte0, dac_calib1, qdss_cti_trig_in_b,
> +		    dac_calib2, atest_tsens2, atest_usb1, blsp_spi10, blsp_uart10,
> +		    blsp_uim10, atest_bbrx1, atest_usb13, atest_bbrx0, atest_usb12,
> +		    mdp_vsync, edp_lcd, blsp_i2c10, atest_gpsadc1, atest_usb11,
> +		    atest_gpsadc0, edp_hot, atest_usb10, m_voc, dac_gpio, atest_char,
> +		    cam_mclk, pll_bypassnl, qdss_stm7, blsp_i2c8, qdss_tracedata_b,
> +		    pll_reset, qdss_stm6, qdss_stm5, qdss_stm4, atest_usb2, cci_i2c,
> +		    qdss_stm3, dac_calib3, atest_usb23, atest_char3, dac_calib4,
> +		    qdss_stm2, atest_usb22, atest_char2, qdss_stm1, dac_calib5,
> +		    atest_usb21, atest_char1, dbg_out, qdss_stm0, dac_calib6,
> +		    atest_usb20, atest_char0, dac_calib10, qdss_stm10,
> +		    qdss_cti_trig_in_a, cci_timer4, blsp_spi6, blsp_uart6, blsp_uim6,
> +		    blsp2_spi, qdss_stm9, qdss_cti_trig_out_a, dac_calib11,
> +		    qdss_stm8, cci_timer0, qdss_stm13, dac_calib7, cci_timer1,
> +		    qdss_stm12, dac_calib8, cci_timer2, blsp1_spi, qdss_stm11,
> +		    dac_calib9, cci_timer3, cci_async, dac_calib12, blsp_i2c6,
> +		    qdss_tracectl_a, dac_calib13, qdss_traceclk_a, dac_calib14,
> +		    dac_calib15, hdmi_rcv, dac_calib16, hdmi_cec, pwr_modem,
> +		    dac_calib17, hdmi_ddc, pwr_nav, dac_calib18, pwr_crypto,
> +		    dac_calib19, hdmi_hot, dac_calib20, dac_calib21, pci_e0,
> +		    dac_calib22, dac_calib23, dac_calib24, tsif1_sync, dac_calib25,
> +		    sd_write, tsif1_error, blsp_spi2, blsp_uart2, blsp_uim2,
> +		    qdss_cti, blsp_i2c2, blsp_spi3, blsp_uart3, blsp_uim3, blsp_i2c3,
> +		    uim3, blsp_spi9, blsp_uart9, blsp_uim9, blsp10_spi, blsp_i2c9,
> +		    blsp_spi7, blsp_uart7, blsp_uim7, qdss_tracedata_a, blsp_i2c7,
> +		    qua_mi2s, gcc_gp1_clk_a, ssc_irq, uim4, blsp_spi11, blsp_uart11,
> +		    blsp_uim11, gcc_gp2_clk_a, gcc_gp3_clk_a, blsp_i2c11, cri_trng0,
> +		    cri_trng1, cri_trng, qdss_stm18, pri_mi2s, qdss_stm17, blsp_spi4,
> +		    blsp_uart4, blsp_uim4, qdss_stm16, qdss_stm15, blsp_i2c4,
> +		    qdss_stm14, dac_calib26, spkr_i2s, audio_ref, lpass_slimbus,
> +		    isense_dbg, tsense_pwm1, tsense_pwm2, btfm_slimbus, ter_mi2s,
> +		    qdss_stm22, qdss_stm21, qdss_stm20, qdss_stm19, gcc_gp1_clk_b,
> +		    sec_mi2s, blsp_spi5, blsp_uart5, blsp_uim5, gcc_gp2_clk_b,
> +		    gcc_gp3_clk_b, blsp_i2c5, blsp_spi12, blsp_uart12, blsp_uim12,
> +		    qdss_stm25, qdss_stm31, blsp_i2c12, qdss_stm30, qdss_stm29,
> +		    tsif1_clk, qdss_stm28, tsif1_en, tsif1_data, sdc4_cmd, qdss_stm27,
> +		    qdss_traceclk_b, tsif2_error, sdc43, vfr_1, qdss_stm26, tsif2_clk,
> +		    sdc4_clk, qdss_stm24, tsif2_en, sdc42, qdss_stm23, qdss_tracectl_b,
> +		    sd_card, tsif2_data, sdc41, tsif2_sync, sdc40, mdp_vsync_p_b,
> +		    ldo_en, mdp_vsync_s_b, ldo_update, blsp11_uart_tx_b, blsp11_uart_rx_b,
> +		    blsp11_i2c_sda_b, prng_rosc, blsp11_i2c_scl_b, uim2, uim1, uim_batt,
> +		    pci_e2, pa_indicator, adsp_ext, ddr_bist, qdss_tracedata_11,
> +		    qdss_tracedata_12, modem_tsync, nav_dr, nav_pps, pci_e1, gsm_tx,
> +		    qspi_cs, ssbi2, ssbi1, mss_lte, qspi_clk, qspi0, qspi1, qspi2, qspi3,
> +		    gpio
> +
> +- bias-disable:
> +	Usage: optional
> +	Value type: <none>
> +	Definition: The specified pins should be configued as no pull.
> +
> +- bias-pull-down:
> +	Usage: optional
> +	Value type: <none>
> +	Definition: The specified pins should be configued as pull down.
> +
> +- bias-pull-up:
> +	Usage: optional
> +	Value type: <none>
> +	Definition: The specified pins should be configued as pull up.
> +
> +- output-high:
> +	Usage: optional
> +	Value type: <none>
> +	Definition: The specified pins are configured in output mode, driven
> +		    high.
> +		    Not valid for sdc pins.
> +
> +- output-low:
> +	Usage: optional
> +	Value type: <none>
> +	Definition: The specified pins are configured in output mode, driven
> +		    low.
> +		    Not valid for sdc pins.
> +
> +- drive-strength:
> +	Usage: optional
> +	Value type: <u32>
> +	Definition: Selects the drive strength for the specified pins, in mA.
> +		    Valid values are: 2, 4, 6, 8, 10, 12, 14 and 16
> +
> +Example:
> +
> +	tlmm: pinctrl@3000000 {
> +		compatible = "qcom,sm8150-pinctrl";
> +		reg = <0x03100000 0x300000>,
> +		      <0x03500000 0x300000>,
> +		      <0x03900000 0x300000>,
> +		      <0x03D00000 0x300000>;
> +		reg-names = "west", "east", "north", "south";
> +		interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> -- 
> 2.20.1
> 
