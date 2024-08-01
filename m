Return-Path: <linux-gpio+bounces-8508-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C732D944654
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2024 10:17:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 569A91F2324A
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2024 08:17:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 943BA1586C6;
	Thu,  1 Aug 2024 08:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RPpu2bc4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517C013D891;
	Thu,  1 Aug 2024 08:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722500261; cv=none; b=BBMGD1FzEXXO8qvSUUf8bERrreONBxZzaPx+NcZ8WZKhHMEvArBGPg0Qnrsrrt2Q43qTtwfJPCc+REpV8gf9JFNZ4/5pcme5TI27+QB+stppK19gPOU0psIXBR/HVfK5ny+3Eo2Ni0XGPSfQDZhCcwJLdCei44JT2N91N/CQ7/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722500261; c=relaxed/simple;
	bh=7WbkHKC4iHYynv7eYorSilfQN0sWqfQu0DuW0istJrs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sc3IvBWvNm4pEpsPEQZGLT8mMfohHtlIF1zUUTpI1wFsapBQvjL7WO800Hk3X82Axac+CnLOe9fq6oyWZiqgHU8EwVQVVsYeuWWXSKJeFBSmM08d4+t1t4/BC3+b1rrJ1O1DOcP/hBhcifu/zCOern/Hc4LjPy3qQ1osibFetHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RPpu2bc4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1019DC4AF09;
	Thu,  1 Aug 2024 08:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722500260;
	bh=7WbkHKC4iHYynv7eYorSilfQN0sWqfQu0DuW0istJrs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RPpu2bc4HbmbDcg7Onpa/NHBo9e9VwHx3vvq0iluAk9qinNe3RKVU2r7I79LGR5YS
	 S7jcZJ5lX2Xentj+57MOHsmIJWttu1+Mq+oE8V8H3AOhQi3pByQzwOaU1QWa+diN0R
	 QUkFnbk8bflnWJTGi2AZ2LrO0ajDf31rJlR/oCtD1H1o4GeTatV8szOl5YKcgiqywm
	 SqK9zSZBY5lXmApVrYKQDn5xc5aLknsn2XXgSL3SJaj8Av2sq7n849JD+tFni773kH
	 0YK8+AsWYdEKqjhK3YOSzA3vta31Wv7Bg4FgYiLGRZRlOf+augi/o6Lfv634EiSNgh
	 J+B0kFxTwDNnA==
Message-ID: <dcc13c9a-ea74-4fa4-9c74-57e576e01ae6@kernel.org>
Date: Thu, 1 Aug 2024 10:17:34 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] dt-bindings: pinctrl: Add support for Broadcom STB
 pin controller
To: "Ivan T. Ivanov" <iivanov@suse.de>, linus.walleij@linaro.org,
 robh@kernel.org, krzk+dt@kernel.org
Cc: conor+dt@kernel.org, florian.fainelli@broadcom.com, wahrenst@gmx.net,
 andrea.porta@suse.com, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20240731062814.215833-1-iivanov@suse.de>
 <20240731062814.215833-2-iivanov@suse.de>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240731062814.215833-2-iivanov@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/07/2024 08:28, Ivan T. Ivanov wrote:
> It looks like they are few revisions of this chip which varies
> by number of pins. Perhaps not all of them are available on the
> market. Perhaps some of them where early engineering samples,
> I don't know. I decided to keep all of them just in case.
> 
> Cc: Andrea della Porta <andrea.porta@suse.com>
> Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
> ---
>  .../pinctrl/brcm,brcmstb-pinctrl.yaml         | 73 +++++++++++++++++++
>  1 file changed, 73 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,brcmstb-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,brcmstb-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,brcmstb-pinctrl.yaml
> new file mode 100644
> index 000000000000..c5afdb49d784
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/brcm,brcmstb-pinctrl.yaml

bcm2712 is Rpi, so not really STB. The name is confusing. Please use
compatible as filename, so:
brcm,bcm2712-pinctrl.yaml

> @@ -0,0 +1,73 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/brcm,brcmstb-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom STB family pin controller
> +
> +maintainers:
> +  - Ivan T. Ivanov <iivanov@suse.de>
> +
> +description:
> +  Broadcom's STB family memory-mapped pin controller.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - brcm,bcm2712-pinctrl
> +      - brcm,bcm2712-aon-pinctrl
> +      - brcm,bcm2712c0-pinctrl
> +      - brcm,bcm2712c0-aon-pinctrl
> +      - brcm,bcm2712d0-pinctrl
> +      - brcm,bcm2712d0-aon-pinctrl
> +
> +  reg:
> +    maxItems: 1
> +
> +allOf:
> +  - $ref: pinctrl.yaml#

"allOf:" block goes after "required:".

> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties:
> +  anyOf:
> +    - type: object
> +      allOf:
> +        - $ref: pincfg-node.yaml#
> +        - $ref: pinmux-node.yaml#
> +
> +      properties:
> +        function:
> +          enum:
> +            [

Unnecessary new line

> +              gpio, alt1, alt2, alt3, alt4, alt5, alt6, alt7, alt8,
> +              aon_cpu_standbyb, aon_fp_4sec_resetb, aon_gpclk, aon_pwm,
> +              arm_jtag, aud_fs_clk0, avs_pmu_bsc, bsc_m0, bsc_m1, bsc_m2,
> +              bsc_m3, clk_observe, ctl_hdmi_5v, enet0, enet0_mii, enet0_rgmii,
> +              ext_sc_clk, fl0, fl1, gpclk0, gpclk1, gpclk2, hdmi_tx0_auto_i2c,
> +              hdmi_tx0_bsc, hdmi_tx1_auto_i2c, hdmi_tx1_bsc, i2s_in, i2s_out,
> +              ir_in, mtsif, mtsif_alt, mtsif_alt1, pdm, pkt, pm_led_out, sc0,
> +              sd0, sd2, sd_card_a, sd_card_b, sd_card_c, sd_card_d, sd_card_e,
> +              sd_card_f, sd_card_g, spdif_out, spi_m, spi_s, sr_edm_sense, te0,
> +              te1, tsio, uart0, uart1, uart2, usb_pwr, usb_vbus, uui, vc_i2c0,
> +              vc_i2c3, vc_i2c4, vc_i2c5, vc_i2csl, vc_pcm, vc_pwm0, vc_pwm1,
> +              vc_spi0, vc_spi3, vc_spi4, vc_spi5, vc_uart0, vc_uart2, vc_uart3,
> +              vc_uart4,
> +            ]
> +
> +        pins:
> +          items:
> +            pattern: "^((aon_)?s?gpio[0-6]?[0-9])|(emmc_(clk|cmd|dat[0-7]|ds))$"
> +
> +        bias-disable: true
> +        bias-pull-down: true
> +        bias-pull-up: true
> +      additionalProperties: false
> +
> +    - type: object
> +      additionalProperties:
> +        $ref: "#/additionalProperties/anyOf/0"

I suggest going with patternProperties, fixed suffix for node names and
$defs. See for example:
Documentation/devicetree/bindings/pinctrl/qcom,x1e80100-tlmm.yaml

Missing example. I don't see this being part of other complete device,
so example is a requirement.

Best regards,
Krzysztof


