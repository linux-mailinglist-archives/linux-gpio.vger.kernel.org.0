Return-Path: <linux-gpio+bounces-17924-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 630B8A6E442
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 21:24:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BCDB73B4052
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 20:23:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98E581C84BC;
	Mon, 24 Mar 2025 20:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ejdlva0s"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE3019CC08;
	Mon, 24 Mar 2025 20:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742847782; cv=none; b=CrCm8GuJHtg9Xwp8F6UvXhOGm66fPB/CwawIF8wBWujO0O+ICiiv1buY8PpitWw+bX4PdRz6l5EPE/dqXpzGVTSFnQwnyKWEp9HyeFw/CsFP30iePu/i/pJD0/1Z8rF8ujNgEDVxODeodBW18sxdSQKfc8ytsJcZDGj1Z2F4z8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742847782; c=relaxed/simple;
	bh=ncQqNWoVKSEqFbwPcK2In9RG6rSS6r5IytFyAcwNeig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P45COeCr+zBfIHsNmm242rvvOWyAGNttYa6/yG9lZjT1lVkqfnYUPjc78pPf1RWQcyomYPsZreZP9YK5RqygcXd6z+2xVS6p1nBgfIk6rj8XJGXGoriBny6C6O5Vv0qkdiP7lMmhFUttT9ZhnfmT8CaaE/J1SWvXEZZtPn/hyOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ejdlva0s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83861C4CEDD;
	Mon, 24 Mar 2025 20:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742847781;
	bh=ncQqNWoVKSEqFbwPcK2In9RG6rSS6r5IytFyAcwNeig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ejdlva0sboLce56+dojF4alyQ3vY8mOJn8F6yLgWJGTF/CcudDO3RVMp5mP75rcD6
	 G+1clGY+geRG3CDgrjFOYaVkzKpT6q2xh0KqWSoxKUTlA4Z60ejkSttvQY2qO/XCHL
	 3aUG4WA/EhAHgNf1nogUFmWyg3lM3I8Zh8RH8zeZvk9LL9XyjdEySvVApXpSCuLx/0
	 LhwcrKg1+0TGmeqr33zDUDpZ6CQR1iV0P+ehOebOOT9s4tiIvuTr2BBdwXQAMzbV2w
	 1tTXf/bbdgfmjKRdn2o82+/D4wI3opV0ARajLgWq0jZORADZkDDcG9Qm6puTtvM1p3
	 bRimxV8JuiCsw==
Date: Mon, 24 Mar 2025 15:23:00 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Teng <andy.teng@mediatek.com>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] dt-bindings: pinctrl: mediatek: Correct indentation
 and style in DTS example
Message-ID: <20250324202300.GA804681-robh@kernel.org>
References: <20250324125105.81774-1-krzysztof.kozlowski@linaro.org>
 <20250324125105.81774-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250324125105.81774-2-krzysztof.kozlowski@linaro.org>

On Mon, Mar 24, 2025 at 01:51:05PM +0100, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
> 
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../pinctrl/mediatek,mt65xx-pinctrl.yaml      | 83 +++++++------------
>  .../pinctrl/mediatek,mt7622-pinctrl.yaml      | 48 +++++------
>  .../pinctrl/mediatek,mt8183-pinctrl.yaml      | 68 +++++++--------
>  .../pinctrl/mediatek,mt8192-pinctrl.yaml      | 76 ++++++++---------
>  4 files changed, 127 insertions(+), 148 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
> index 5f2808212f39..b9680b896f12 100644
> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
> @@ -137,64 +137,43 @@ examples:
>          #size-cells = <2>;
>  
>          pinctrl@1c20800 {
> -          compatible = "mediatek,mt8135-pinctrl";
> -          reg = <0 0x1000B000 0 0x1000>;
> -          mediatek,pctl-regmap = <&syscfg_pctl_a>, <&syscfg_pctl_b>;
> -          gpio-controller;
> -          #gpio-cells = <2>;
> -          interrupt-controller;
> -          #interrupt-cells = <2>;
> -          interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
> -              <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
> -              <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
> +            compatible = "mediatek,mt8135-pinctrl";
> +            reg = <0 0x1000B000 0 0x1000>;
> +            mediatek,pctl-regmap = <&syscfg_pctl_a>, <&syscfg_pctl_b>;
> +            gpio-controller;
> +            #gpio-cells = <2>;
> +            interrupt-controller;
> +            #interrupt-cells = <2>;
> +            interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
>  
> -          i2c0_pins_a: i2c0-pins {
> -            pins1 {
> -              pinmux = <MT8135_PIN_100_SDA0__FUNC_SDA0>,
> -                <MT8135_PIN_101_SCL0__FUNC_SCL0>;
> -              bias-disable;
> -            };
> -          };
> -
> -          i2c1_pins_a: i2c1-pins {
> -            pins {
> -              pinmux = <MT8135_PIN_195_SDA1__FUNC_SDA1>,
> -                <MT8135_PIN_196_SCL1__FUNC_SCL1>;
> -              bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
> -            };
> -          };
> -
> -          i2c2_pins_a: i2c2-pins {
> -            pins1 {
> -              pinmux = <MT8135_PIN_193_SDA2__FUNC_SDA2>;
> -              bias-pull-down;
> +            i2c0_pins_a: i2c0-pins {

Perhaps drop the unused labels while you are here. Either way,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


