Return-Path: <linux-gpio+bounces-22371-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F31D9AEC153
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jun 2025 22:44:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 81E597B67CC
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jun 2025 20:43:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1933A2ECD06;
	Fri, 27 Jun 2025 20:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BS/w/NCq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE04022D9E6;
	Fri, 27 Jun 2025 20:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751057073; cv=none; b=jz5vqTxRAs4XSJ6/onPNyXFd6NOgoz8wkYkDJ/pshJwsZpDseQCJC0YgTM/hlos0oZw28HH5jaZqR/Db5BF87h7ZkAkhUT5BOXqhSofPErLebshd0xUIWW+grQMbUheUSoxcL1/qCZRinRBrIYz+kVEreMrhPz3XcbY6vdqCU9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751057073; c=relaxed/simple;
	bh=5ybwmpFE7Qlupb6N5xt8amFVW1JpJnPiApvCG8fYQqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t1klHhum042rdyemOdS0b11FNzJ/rbKyrjz8qAXxRsjFQoMbsGSbcwSgWNorbIzRCCFy5n16FruA1WrbLIxkJiHmEkQgDAYLIwwMV+FqgR6uroK8PPD9phyLU3Mu/RD7323ISa+sL974CK3wLlIxgYCc8q05YEiJNt9poyAGfSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BS/w/NCq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3247CC4CEE3;
	Fri, 27 Jun 2025 20:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751057073;
	bh=5ybwmpFE7Qlupb6N5xt8amFVW1JpJnPiApvCG8fYQqg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BS/w/NCqjH3hHE5sHfhxr0jVJSeRPB9XqdSFBvjLlmc9a2FiaPdaNFyEhkxYdwMnK
	 l1yCNocVHitRQveBmK6BQTW1wMjFet/sfy/EvuN6nt/0I8xPGzKaQdzUzJf7CJORVq
	 geyrk4nD1hg1OP8lGwq/TFZiYeb1GVXLurk2p6HWnnAfgm9J37E0U2xbBQ2BxAFOyl
	 V5/CcjvwVuh2ez5E9RPhrm93ekxmicI3fHAgSrxF7nv9Pm5c2o3u45euAEtGi2lUvP
	 bU5LI5hh8rrjq+cZKebh+OeKfHMIg5peSs8XYq8F96TVfYFDVNwe4pun4DHXp11cPz
	 lVdeasbNuAHNQ==
Date: Fri, 27 Jun 2025 15:44:32 -0500
From: Rob Herring <robh@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: document the SM7635 Top Level
 Mode Multiplexer
Message-ID: <20250627204432.GA45217-robh@kernel.org>
References: <20250625-sm7635-pinctrl-v1-0-ebfa9e886594@fairphone.com>
 <20250625-sm7635-pinctrl-v1-1-ebfa9e886594@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625-sm7635-pinctrl-v1-1-ebfa9e886594@fairphone.com>

On Wed, Jun 25, 2025 at 11:12:01AM +0200, Luca Weiss wrote:
> Document the Top Level Mode Multiplexer on the SM7635 Platform.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  .../bindings/pinctrl/qcom,sm7635-tlmm.yaml         | 133 +++++++++++++++++++++
>  1 file changed, 133 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm7635-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm7635-tlmm.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..3f49239efb6e866015b40e3477a8bd0edd21b1fc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm7635-tlmm.yaml
> @@ -0,0 +1,133 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/qcom,sm7635-tlmm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies, Inc. SM7635 TLMM block
> +
> +maintainers:
> +  - Luca Weiss <luca.weiss@fairphone.com>
> +
> +description:
> +  Top Level Mode Multiplexer pin controller in Qualcomm SM7635 SoC.
> +
> +allOf:
> +  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,sm7635-tlmm
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  gpio-reserved-ranges:
> +    minItems: 1
> +    maxItems: 84
> +
> +  gpio-line-names:
> +    maxItems: 167
> +
> +patternProperties:
> +  "-state$":
> +    oneOf:
> +      - $ref: "#/$defs/qcom-sm7635-tlmm-state"
> +      - patternProperties:
> +          "-pins$":
> +            $ref: "#/$defs/qcom-sm7635-tlmm-state"
> +        additionalProperties: false

Is there really value in continuing this complicated QCom pattern? Can 
we just have 1 level or 2 levels only?

> +
> +$defs:
> +  qcom-sm7635-tlmm-state:
> +    type: object
> +    description:
> +      Pinctrl node's client devices use subnodes for desired pin configuration.
> +      Client device subnodes use below standard properties.
> +    $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
> +    unevaluatedProperties: false
> +
> +    properties:
> +      pins:
> +        description:
> +          List of gpio pins affected by the properties specified in this
> +          subnode.
> +        items:
> +          oneOf:
> +            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-5][0-9]|16[0-7])$"
> +            - enum: [ ufs_reset, sdc2_clk, sdc2_cmd, sdc2_data ]
> +        minItems: 1
> +        maxItems: 36
> +
> +      function:
> +        description:
> +          Specify the alternative function to be configured for the specified
> +          pins.
> +        enum: [ gpio, aoss_cti, atest_char, atest_usb, audio_ext_mclk0,
> +                audio_ext_mclk1, audio_ref_clk, cam_mclk, cci_async_in0,
> +                cci_i2c_scl, cci_i2c_sda, cci_timer, coex_uart1_rx,
> +                coex_uart1_tx, dbg_out_clk, ddr_bist_complete, ddr_bist_fail,
> +                ddr_bist_start, ddr_bist_stop, ddr_pxi0, ddr_pxi1, dp0_hot,
> +                egpio, gcc_gp1, gcc_gp2, gcc_gp3, host2wlan_sol, i2s0_data0,
> +                i2s0_data1, i2s0_sck, i2s0_ws, ibi_i3c, jitter_bist, mdp_vsync,
> +                mdp_vsync0_out, mdp_vsync1_out, mdp_vsync2_out, mdp_vsync3_out,
> +                mdp_vsync_e, nav_gpio0, nav_gpio1, nav_gpio2, pcie0_clk_req_n,
> +                pcie1_clk_req_n, phase_flag, pll_bist_sync, pll_clk_aux,
> +                prng_rosc0, prng_rosc1, prng_rosc2, prng_rosc3, qdss_cti,
> +                qdss_gpio, qlink0_enable, qlink0_request, qlink0_wmss,
> +                qlink1_enable, qlink1_request, qlink1_wmss, qspi0, qup0_se0,
> +                qup0_se1, qup0_se2, qup0_se3, qup0_se4, qup0_se5, qup0_se6,
> +                qup1_se0, qup1_se1, qup1_se2, qup1_se3, qup1_se4, qup1_se5,
> +                qup1_se6, resout_gpio_n, sd_write_protect, sdc1_clk, sdc1_cmd,
> +                sdc1_data, sdc1_rclk, sdc2_clk, sdc2_cmd, sdc2_data,
> +                sdc2_fb_clk, tb_trig_sdc1, tb_trig_sdc2, tgu_ch0_trigout,
> +                tgu_ch1_trigout, tmess_prng0, tmess_prng1, tmess_prng2,
> +                tmess_prng3, tsense_pwm1, tsense_pwm2, uim0_clk, uim0_data,
> +                uim0_present, uim0_reset, uim1_clk_mira, uim1_clk_mirb,
> +                uim1_data_mira, uim1_data_mirb, uim1_present_mira,
> +                uim1_present_mirb, uim1_reset_mira, uim1_reset_mirb, usb0_hs,
> +                usb0_phy_ps, vfr_0, vfr_1, vsense_trigger_mirnat, wcn_sw,
> +                wcn_sw_ctrl ]
> +
> +    required:
> +      - pins
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    tlmm: pinctrl@f100000 {
> +        compatible = "qcom,sm7635-tlmm";
> +        reg = <0x0f100000 0x300000>;
> +
> +        interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
> +
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +
> +        interrupt-controller;
> +        #interrupt-cells = <2>;
> +
> +        gpio-ranges = <&tlmm 0 0 168>;
> +
> +        gpio-wo-state {
> +            pins = "gpio1";
> +            function = "gpio";
> +        };
> +
> +        qup-uart5-default-state {
> +            pins = "gpio25", "gpio26";
> +            function = "qup0_se5";
> +            drive-strength = <2>;
> +            bias-disable;
> +        };

Please make the example more complete showing the multiple levels of 
states and pins if you are going to keep that.

Rob

