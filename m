Return-Path: <linux-gpio+bounces-30828-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFT3BQ0WcGlyUwAAu9opvQ
	(envelope-from <linux-gpio+bounces-30828-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 00:55:57 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 883484E303
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 00:55:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D18165AE041
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 23:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 933C62FC006;
	Tue, 20 Jan 2026 23:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZEv5JgT+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0E6312828;
	Tue, 20 Jan 2026 23:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768952405; cv=none; b=DPgABxku4LceOc9p9NLuwk9a0ziqkn/OZ4Lq6/Js/ZwJUhqzvRChTsLgGVQ98HfPnN/LHEvHwFg7NVdUK8LJaCQze5JGVyiLvX+ykq26+eCXkM4PbIyHoQloIl7/ALEnkyI5JuLuzvUxB/gJJDhir02qkcVAQ1k/Pf9hLTrdAY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768952405; c=relaxed/simple;
	bh=ZX/1U6JTMSBbLYFE1GXNMRTS5M8RKmLQJuCefZkrNEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YcQ4hyD168SytwaZdY3Z1l4Gwq1vLTEFv+ABnm6wXTzExW3sOkQTCd06FRwkjZNHrc671h9acgMBN+1HUQtM6v4+IBJRHv9TKnTWecPcUYFhTadb6xu79pkJZrculyQs1sncd7MPiYbYNQlN3eThwFdf80paFQXZHC/iEtEPMEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZEv5JgT+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D1EEC16AAE;
	Tue, 20 Jan 2026 23:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768952404;
	bh=ZX/1U6JTMSBbLYFE1GXNMRTS5M8RKmLQJuCefZkrNEo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZEv5JgT+WZm9bLwLjE/5tbTNYVx5BaRk9SzMZC2Zj96qLwgRNZRx1InD5HO5OvHI1
	 wf0bYgNctzaH6aCt6wuWUIpsza0zOHa+kEgRWuJ2TCvpb+8fB8v69vfJbZuVXEbpYJ
	 MJg8nQcqH6/5g/til0nUUUo9dBCUK7pjraTqhA3yNOCGRcQL1E9p/lWioTjP1/ogJ3
	 iU69Ekqv/dZ/joXIr4IHt3G/OZSjAtbBgHB+Sz5xxvnlXsNWNUF2O+BboKnwra8JsZ
	 cTFtvxxdkCHMYesn/nIGMSg/R58Ed50jN6EoexL1GLCUf/oXiFZMi2ubCeyOxJts7l
	 XOQz0FAzc3oCA==
Date: Tue, 20 Jan 2026 17:40:02 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: document the Eliza Top Level
 Mode Multiplexer
Message-ID: <kb3eolcpmz7yqme6menjdjmypap7cadkqdnrgc3wxiwjmslmf2@lbwum5kox5ls>
References: <20260120-eliza-pinctrl-v1-0-b31c3f85a5d5@oss.qualcomm.com>
 <20260120-eliza-pinctrl-v1-1-b31c3f85a5d5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120-eliza-pinctrl-v1-1-b31c3f85a5d5@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	TAGGED_FROM(0.00)[bounces-30828-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,qualcomm.com:email,f100000:email]
X-Rspamd-Queue-Id: 883484E303
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 11:56:40AM +0200, Abel Vesa wrote:
> Document the Top Level Mode Multiplexer on the Eliza Platform.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  .../bindings/pinctrl/qcom,eliza-tlmm.yaml          | 138 +++++++++++++++++++++
>  1 file changed, 138 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,eliza-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,eliza-tlmm.yaml
> new file mode 100644
> index 000000000000..3a07ee8d7218
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,eliza-tlmm.yaml
> @@ -0,0 +1,138 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/qcom,eliza-tlmm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies, Inc. Eliza TLMM block
> +
> +maintainers:
> +  - Abel Vesa <abel.vesa@oss.qualcomm.com>
> +
> +description:
> +  Top Level Mode Multiplexer pin controller in Qualcomm Eliza SoC.
> +
> +allOf:
> +  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,eliza-tlmm
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

There are 185 GPIOs (GPIO0 - GPIO184).

> +
> +patternProperties:
> +  "-state$":
> +    oneOf:
> +      - $ref: "#/$defs/qcom-eliza-tlmm-state"
> +      - patternProperties:
> +          "-pins$":
> +            $ref: "#/$defs/qcom-eliza-tlmm-state"
> +        additionalProperties: false
> +
> +$defs:
> +  qcom-eliza-tlmm-state:
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

This is missing the tail end of the value space.

> +            - enum: [ ufs_reset, sdc2_clk, sdc2_cmd, sdc2_data ]
> +        minItems: 1
> +        maxItems: 36
> +
> +      function:
> +        description:
> +          Specify the alternative function to be configured for the specified
> +          pins.
> +        enum: [ gpio, aoss_cti, atest_char, atest_usb, audio_ext_mclk0,
> +                audio_ref_clk, cam_mclk, cci_async_in, cci_i2c_scl,
> +                cci_i2c_sda, cci_timer, coex_uart1_rx, coex_uart1_tx,
> +                coex_uart2_rx, coex_uart2_tx, dbg_out_clk,
> +                ddr_bist_complete, ddr_bist_fail, ddr_bist_start,
> +                ddr_bist_stop, ddr_pxi0, ddr_pxi1, dp0_hot, egpio,
> +                gcc_gp1, gcc_gp2, gcc_gp3, gnss_adc0, gnss_adc1,
> +                hdmi_ddc_scl, hdmi_ddc_sda, hdmi_dtest0, hdmi_dtest1,
> +                hdmi_hot_plug, hdmi_pixel_clk, hdmi_rcv_det, hdmi_tx_cec,
> +                host2wlan_sol, i2s0_data0, i2s0_data1, i2s0_sck, i2s0_ws,
> +                ibi_i3c, jitter_bist, mdp_esync0_out, mdp_esync1_out,
> +                mdp_vsync, mdp_vsync0_out, mdp_vsync11_out,
> +                mdp_vsync1_out, mdp_vsync2_out, mdp_vsync3_out,
> +                mdp_vsync_e, nav_gpio0, nav_gpio1, nav_gpio2, nav_gpio3,
> +                pcie0_clk_req_n, pcie1_clk_req_n, phase_flag,
> +                pll_bist_sync, pll_clk_aux, prng_rosc0, prng_rosc1,
> +                prng_rosc2, prng_rosc3, qdss_cti, qdss_gpio_traceclk,
> +                qdss_gpio_tracectl, qdss_gpio_tracedata, qlink_big_enable,
> +                qlink_big_request, qlink_little_enable,
> +                qlink_little_request, qlink_wmss, qspi0, qspi_clk,
> +                qspi_cs, qup1_se0, qup1_se1, qup1_se2, qup1_se3, qup1_se4,
> +                qup1_se5, qup1_se6, qup1_se7, qup2_se0, qup2_se1,
> +                qup2_se2, qup2_se3, qup2_se4, qup2_se5, qup2_se6,
> +                qup2_se7, resout_gpio, sd_write_protect, sdc1, sdc2,
> +                sdc2_fb_clk, tb_trig_sdc1, tb_trig_sdc2, tmess_prng0,
> +                tmess_prng1, tmess_prng2, tmess_prng3, tsense_pwm1,
> +                tsense_pwm2, tsense_pwm3, tsense_pwm4, uim0_clk,
> +                uim0_data, uim0_present, uim0_reset, uim1_clk, uim1_data,
> +                uim1_present, uim1_reset, usb0_hs, usb_phy, vfr_0, vfr_1,
> +                vsense_trigger_mirnat, wcn_sw_ctrl ]
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
> +        compatible = "qcom,eliza-tlmm";
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
> +        gpio-ranges = <&tlmm 0 0 184>;

I think this should be 186.

Regards,
Bjorn

> +
> +        gpio-wo-state {
> +            pins = "gpio1";
> +            function = "gpio";
> +        };
> +
> +        qup-uart14-default-state {
> +            pins = "gpio18", "gpio19";
> +            function = "qup2_se5";
> +            drive-strength = <2>;
> +            bias-disable;
> +        };
> +    };
> +...
> 
> -- 
> 2.48.1
> 

