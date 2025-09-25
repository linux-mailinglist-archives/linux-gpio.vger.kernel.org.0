Return-Path: <linux-gpio+bounces-26579-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F77B9FE09
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Sep 2025 16:13:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7EFCE7BA2DC
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Sep 2025 14:11:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 315A728BAB1;
	Thu, 25 Sep 2025 14:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HesvkTu/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D485D286426;
	Thu, 25 Sep 2025 14:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758809283; cv=none; b=HTwil/D1WVrKOYlRjZVADIuSP7R50lMWDiJsflZg3prQMjyR3Kv4yI7lTZun8MTprs7ur+DOtOCiOcwqjy4njw6RBMXjU/lf0ILkuK27+18cQteqGjkagv6X5871D5efEIXiVZV5RiAfcXv3LDJqKEtOOrFQhU6ghjIF2SEFboE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758809283; c=relaxed/simple;
	bh=pA3exKnhyJpSDfkuDtiR46BoB/ss5DBePAIBMeyE7kw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FkkCn2mSa3/3iBQ71DUqSoC4Z65iSxsZiAN8pUrtEpwb85VJvpAZ8J4HT2LmtkeU7QVMkXhpJsbTBujs/QaYGw/I3Qom1PXOi7GhJ7DMs3ommu8Q3X+bSIGJFRW4lEbg8S9duuQJHnxUwM4Kyt0yGY93rWHsbVNDlzYATlW5QnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HesvkTu/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67F56C4CEF0;
	Thu, 25 Sep 2025 14:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758809283;
	bh=pA3exKnhyJpSDfkuDtiR46BoB/ss5DBePAIBMeyE7kw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HesvkTu/6nTmCVRScsmAjHXw5/A8hrncIVFlp5MnBGyqciY3gzfqa9s1bdZzz0V38
	 UqFnXsbs4GHR4/0nXjt4lqQhgb025vKxRORAemWNI5n2y/0FQ3ndKJ+vED8j9dAeiS
	 3PrH4I1Yq/uYzpDWk47+AQ8WS0NVxcEwTNIjFNg4oqfYtbI3aU3SL6YCoi/yvhcvY2
	 OutsZT761mKU+v6eFnVJMsajdWVDpXlA6vVnSsmEN2ZklS1rK7mVtaVTxENo/rZUPH
	 aqdnIsxVnWJ75a8YOA2fURB/E7G+ed0//YoVAo4aatgv9CcFUEREGRsagMQ/Ua5tMs
	 7vlGTGkhoeL9g==
Date: Thu, 25 Sep 2025 09:08:00 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com, 
	tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: describe Kaanapali TLMM
Message-ID: <5esefv5eydz6hgmrd7c6wgjotwuun63zhxhagb7omrvwtpf2lb@3iihu2dxkdyd>
References: <20250924-knp-tlmm-v1-0-acabb59ae48c@oss.qualcomm.com>
 <20250924-knp-tlmm-v1-1-acabb59ae48c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924-knp-tlmm-v1-1-acabb59ae48c@oss.qualcomm.com>

On Wed, Sep 24, 2025 at 04:16:03PM -0700, Jingyi Wang wrote:
> The Top Level Mode Multiplexer (TLMM) in the Kaanapali SoC provide GPIO and
> pinctrl functionality for UFS, SDC and 217 GPIO pins.
> 
> Add a DeviceTree binding to describe the Kaanapali TLMM block.
> 

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  .../bindings/pinctrl/qcom,kaanapali-tlmm.yaml      | 127 +++++++++++++++++++++
>  1 file changed, 127 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,kaanapali-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,kaanapali-tlmm.yaml
> new file mode 100644
> index 000000000000..53534a07a1f0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,kaanapali-tlmm.yaml
> @@ -0,0 +1,127 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/qcom,kaanapali-tlmm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies, Inc. Kaanapali TLMM block
> +
> +maintainers:
> +  - Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> +
> +description:
> +  Top Level Mode Multiplexer pin controller in Qualcomm Kaanapali SoC.
> +
> +allOf:
> +  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,kaanapali-tlmm
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  gpio-reserved-ranges:
> +    minItems: 1
> +    maxItems: 109
> +
> +  gpio-line-names:
> +    maxItems: 217
> +
> +patternProperties:
> +  "-state$":
> +    oneOf:
> +      - $ref: "#/$defs/qcom-kaanapali-tlmm-state"
> +      - patternProperties:
> +          "-pins$":
> +            $ref: "#/$defs/qcom-kaanapali-tlmm-state"
> +        additionalProperties: false
> +
> +$defs:
> +  qcom-kaanapali-tlmm-state:
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
> +            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-9][0-9]|20[0-9]|21[0-6])$"
> +            - enum: [ ufs_reset, sdc2_clk, sdc2_cmd, sdc2_data ]
> +        minItems: 1
> +        maxItems: 36
> +
> +      function:
> +        description:
> +          Specify the alternative function to be configured for the specified
> +          pins.
> +        enum: [ gpio, aoss_cti, atest_char, atest_usb, audio_ext_mclk0,
> +                audio_ext_mclk1, audio_ref_clk, cam_asc_mclk2, cam_asc_mclk4,
> +                cam_mclk, cci_async_in, cci_i2c_scl, cci_i2c_sda, cci_timer,
> +                cmu_rng, coex_uart1_rx, coex_uart1_tx, coex_uart2_rx,
> +                coex_uart2_tx, dbg_out_clk, ddr_bist_complete, ddr_bist_fail,
> +                ddr_bist_start, ddr_bist_stop, ddr_pxi0, ddr_pxi1, ddr_pxi2,
> +                ddr_pxi3, dp_hot, egpio, gcc_gp1, gcc_gp2, gcc_gp3, gnss_adc0,
> +                gnss_adc1, i2chub0_se0, i2chub0_se1, i2chub0_se2, i2chub0_se3,
> +                i2chub0_se4, i2s0_data0, i2s0_data1, i2s0_sck, i2s0_ws,
> +                i2s1_data0, i2s1_data1, i2s1_sck, i2s1_ws, ibi_i3c, jitter_bist,
> +                mdp_esync0_out, mdp_esync1_out, mdp_vsync, mdp_vsync0_out,
> +                mdp_vsync1_out, mdp_vsync2_out, mdp_vsync3_out, mdp_vsync5_out,
> +                mdp_vsync_e, nav_gpio0, nav_gpio1, nav_gpio2, nav_gpio3,
> +                pcie0_clk_req_n, phase_flag, pll_bist_sync, pll_clk_aux,
> +                prng_rosc0, prng_rosc1, prng_rosc2, prng_rosc3, qdss_cti,
> +                qdss_gpio_traceclk, qdss_gpio_tracectl, qdss_gpio_tracedata,
> +                qlink_big_enable, qlink_big_request, qlink_little_enable,
> +                qlink_little_request, qlink_wmss, qspi0, qspi1, qspi2, qspi3,
> +                qspi_clk, qspi_cs, qup1_se0, qup1_se1, qup1_se2, qup1_se3,
> +                qup1_se4, qup1_se5, qup1_se6, qup1_se7, qup2_se0, qup2_se1,
> +                qup2_se2, qup2_se3, qup2_se4, qup3_se0, qup3_se1, qup3_se2,
> +                qup3_se3, qup3_se4, qup3_se5, qup4_se0, qup4_se1, qup4_se2,
> +                qup4_se3, qup4_se4, sd_write_protect, sdc40, sdc41, sdc42, sdc43,
> +                sdc4_clk, sdc4_cmd, sys_throttle, tb_trig_sdc2, tb_trig_sdc4,
> +                tmess_prng0, tmess_prng1, tmess_prng2, tmess_prng3, tsense_pwm1,
> +                tsense_pwm2, tsense_pwm3, tsense_pwm4, tsense_pwm5, tsense_pwm6,
> +                tsense_pwm7, uim0_clk, uim0_data, uim0_present, uim0_reset, uim1_clk,
> +                uim1_data, uim1_present, uim1_reset, usb0_hs, usb_phy, vfr_0, vfr_1,
> +                vsense_trigger_mirnat, wcn_sw, wcn_sw_ctrl ]
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
> +
> +    tlmm: pinctrl@f100000 {
> +        compatible = "qcom,kaanapali-tlmm";
> +        reg = <0x0f100000 0x300000>;
> +        interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +        gpio-ranges = <&tlmm 0 0 218>;
> +        interrupt-controller;
> +        #interrupt-cells = <2>;
> +
> +        qup-uart7-state {
> +          pins = "gpio62", "gpio63";
> +          function = "qup1_se7";
> +        };
> +    };
> +...
> 
> -- 
> 2.25.1
> 

