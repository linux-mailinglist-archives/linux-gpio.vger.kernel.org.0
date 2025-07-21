Return-Path: <linux-gpio+bounces-23603-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BEDB0CB38
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 21:56:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 314853A7024
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 19:56:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0E0322F16C;
	Mon, 21 Jul 2025 19:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fDFHJWdd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BAD23506A;
	Mon, 21 Jul 2025 19:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753127785; cv=none; b=BQ5DD8VLBq2GctlbsvGkV/HFZ+IWg47NxG1QuYSsZiW9yYV2yaGHy10y16G65EsJAuAq++VvIQspiwsin5Y6BjD3nLJKz7L21zwrQ2NxLQ6GpCmJxb5z8wNk9rxLeGa0xWVEcmCw45uqE34IQ9U1Y/dYuwKZdivPP4zsN1eED3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753127785; c=relaxed/simple;
	bh=86ZWFwENjjzEzuXZxiMpq5v1vY2VwtODGSuhLJSv+AA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WQnO4YU5UeboZL+y3TT2Laah/H5xmimatrh+/dPwmIUHjNML7JksKE/PRdmR1S8eaLWxkDAVp0IfpXL091sQ7KyYjrPOb37l/DQWPvT3Togtym9SH+Ke7UQARQCf98roYkqHSaGgfyvQoRi8NZggKqE++NrbEn4SjQ06BX88tkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fDFHJWdd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5D1CC4CEED;
	Mon, 21 Jul 2025 19:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753127785;
	bh=86ZWFwENjjzEzuXZxiMpq5v1vY2VwtODGSuhLJSv+AA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fDFHJWddZ7cOoD1rdl23jS380yXpGP3jgu8H0GTcX3CEzYMFzdeMgfP8EsGmtkjZS
	 ALNrOY+luRpCH5w25UMwJOyxl76D9M6syN/3Klp8/cCkC1Gqj0symLbwhDOvogokZg
	 WeHSGA9wqtUg0n+WAbZ6ZfNsmR2oMUF0j+0COrFXdaLtzcvYG1gMAta91GJPGoXCvV
	 PehZMQxjbkeBBPdOf2nNmeC0rQ5iYcKgRT1BzH5K5Kwga9n7VeTvxkLvko8FWEA2GL
	 cBnQq2dxg1Bi2dawSHOKjEDBRlkmnhR1rIHZZah/g0GlcgQxn48PqdnuKFgayE9wF8
	 1KdQLn6B61OlA==
Date: Mon, 21 Jul 2025 14:56:24 -0500
From: Rob Herring <robh@kernel.org>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: andersson@kernel.org, linus.walleij@linaro.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, quic_rjendra@quicinc.com,
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctrl: qcom: Add Glymur pinctrl
 bindings
Message-ID: <20250721195624.GA1160054-robh@kernel.org>
References: <20250721163221.310746-1-pankaj.patil@oss.qualcomm.com>
 <20250721163221.310746-2-pankaj.patil@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250721163221.310746-2-pankaj.patil@oss.qualcomm.com>

On Mon, Jul 21, 2025 at 10:02:20PM +0530, Pankaj Patil wrote:
> Add DeviceTree binding for Glymur SoC TLMM block
> 
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
> Changes in v3:
> Fixed indentation for example tlmm node
> 
> Changes in v2:
> Updated gpio-line-names maxItems to 250
> Fixed example node reg property
> 
> .../bindings/pinctrl/qcom,glymur-tlmm.yaml    | 128 ++++++++++++++++++
>  1 file changed, 128 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml
> new file mode 100644
> index 000000000000..25ec99bde59d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml
> @@ -0,0 +1,128 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/qcom,glymur-tlmm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies, Inc. Glymur TLMM block
> +
> +maintainers:
> +  - Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> +
> +description:
> +  Top Level Mode Multiplexer pin controller in Qualcomm Glymur SoC.
> +
> +allOf:
> +  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,glymur-tlmm
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  gpio-reserved-ranges:
> +    minItems: 1
> +    maxItems: 119
> +
> +  gpio-line-names:
> +    maxItems: 250
> +
> +patternProperties:
> +  "-state$":
> +    oneOf:
> +      - $ref: "#/$defs/qcom-glymur-tlmm-state"
> +      - patternProperties:
> +          "-pins$":
> +            $ref: "#/$defs/qcom-glymur-tlmm-state"
> +        additionalProperties: false
> +
> +$defs:
> +  qcom-glymur-tlmm-state:
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
> +            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9])$"
> +            - enum: [ ufs_reset, sdc2_clk, sdc2_cmd, sdc2_data ]
> +        minItems: 1
> +        maxItems: 36
> +
> +      function:
> +        description:
> +          Specify the alternative function to be configured for the specified
> +          pins.
> +        enum: [ gpio, RESOUT_GPIO_N, aoss_cti, asc_cci, atest_char, atest_usb, audio_ext_mclk0,
> +                audio_ext_mclk1, audio_ref_clk, cam_asc_mclk4, cam_mclk, cci_async_in, cci_i2c_scl,
> +                cci_i2c_sda, cci_timer, cmu_rng, cri_trng, dbg_out_clk, ddr_bist_complete,
> +                ddr_bist_fail, ddr_bist_start, ddr_bist_stop, ddr_pxi, edp0_hot, edp0_lcd,
> +                edp1_lcd, egpio, eusb0_ac_en, eusb1_ac_en, eusb2_ac_en, eusb3_ac_en, eusb5_ac_en,
> +                eusb6_ac_en, gcc_gp1, gcc_gp2, gcc_gp3, host2wlan_sol, i2c0_s_scl, i2c0_s_sda,
> +                i2s0_data, i2s0_sck, i2s0_ws, i2s1_data, i2s1_sck, i2s1_ws, ibi_i3c, jitter_bist,
> +                mdp_vsync_out, mdp_vsync_e, mdp_vsync_p, mdp_vsync_s, pcie3a_clk, pcie3a_rst_n,
> +                pcie3b_clk, pcie4_clk_req_n, pcie5_clk_req_n, pcie6_clk_req_n, phase_flag,
> +                pll_bist_sync, pll_clk_aux, pmc_oca_n, pmc_uva_n, prng_rosc, qdss_cti, qdss_gpio,
> +                qspi, qup0_se0, qup0_se1, qup0_se2, qup0_se3_l0, qup0_se3, qup0_se4, qup0_se5,
> +                qup0_se6, qup0_se7, qup1_se0, qup1_se1, qup1_se2, qup1_se3, qup1_se4, qup1_se5,
> +                qup1_se6, qup1_se7, qup2_se0, qup2_se1, qup2_se2, qup2_se3, qup2_se4, qup2_se5,
> +                qup2_se6, qup2_se7, qup3_se0, qup3_se1, sd_write_protect, sdc4_clk,
> +                sdc4_cmd, sdc4_data, smb_acok_n, sys_throttle, tb_trig_sdc2, tb_trig_sdc4,
> +                tmess_prng, tsense_pwm, tsense_therm, usb0_dp, usb0_phy_ps, usb0_sbrx, usb0_sbtx,
> +                usb0_tmu, usb1_dbg, usb1_dp, usb1_phy_ps, usb1_sbrx, usb1_sbtx, usb1_tmu, usb2_dp,
> +                usb2_phy_ps, usb2_sbrx, usb2_sbtx, usb2_tmu, vsense_trigger_mirnat, wcn_sw,
> +                wcn_sw_ctrl ]

Wrap lines at 80 char.

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
> +        compatible = "qcom,glymur-tlmm";
> +        reg = <0x0f100000 0xf00000>;
> +        interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +        interrupt-controller;
> +        #interrupt-cells = <2>;
> +        gpio-ranges = <&tlmm 0 0 249>;
> +        wakeup-parent = <&pdc>;
> +        gpio-reserved-ranges = <4 4>, <10 2>, <33 3>, <44 4>;
> +        qup_uart21_default: qup-uart21-default-state {
> +            tx-pins {
> +                pins = "gpio86";
> +                function = "qup2_se5";
> +                drive-strength = <2>;
> +                bias-disable;
> +            };
> +
> +            rx-pins {
> +                pins = "gpio87";
> +                function = "qup2_se5";
> +                drive-strength = <2>;
> +                bias-disable;
> +            };
> +        };
> +    };
> +...
> -- 
> 2.34.1
> 

