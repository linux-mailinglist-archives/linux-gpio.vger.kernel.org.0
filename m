Return-Path: <linux-gpio+bounces-18623-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BE2A83B95
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 09:47:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AEFA03B01CE
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 07:41:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FA00205E0F;
	Thu, 10 Apr 2025 07:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="aot9COST"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7A81CEACB;
	Thu, 10 Apr 2025 07:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744270881; cv=none; b=gJngUTo6S9sf/6uvI0MS3lSVLNhqX0H2Kbu9bzyCkx5z3LeazwlW69EdJIcML5+leTzDujmrcssDH2xFKEtLZG220Nd7mXWt/eS4rYonLQr+tGjbCS6c9y9HgGOyvTZzuRm5f6nnJb2zwbwKJe/5P5XdeLek08DVlnt82JsG2rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744270881; c=relaxed/simple;
	bh=T0rl6mtqXz5LmV5LLiBAssGxQHXvEWWXL3EDzwmnWEk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=JzDsGH4fRkTucNY/ThFz7wHlI7n6/ruM4PvOdodt5FczjwVYAG+TyEZkU+ikbHDFk97hhwsED6/+J81Q123QEWIvAWwlPmfFVtGjXALl5rLdM2ythuuvla2ksHtR1zC93w+csGntkc0MMCOt0vuwzaskazzxTbGetLcwyUe2YDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=aot9COST; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744270877;
	bh=T0rl6mtqXz5LmV5LLiBAssGxQHXvEWWXL3EDzwmnWEk=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=aot9COSTnnKvgbGAq80PH5OkL2BX7fTgqBgoPPT/KOmtsS0JQ3I5AnxJ2kkahytDZ
	 RMauBQEs4WXQ/fG7+K7cGkem33n5Afdt7mMk2Z3tQBcxJdlFLLdbTUO5xgN1I85hyL
	 AIUiTLipV5O01P4BySbn1VtLc+LOJFa+/qrPh/OkaN3DE5U5Y6ySrwh5nM3/4QHcR7
	 al3BIoEy24HMwNHPcIYwwHGTTMZsVpVWxlPq8HYjOi+LycGoj+BuWGykl3AB3Haem0
	 jt6Om8U14QSdNDNd9ADCaxME29oX/M67NRdEOcbR6F4FvC1LUKphUd1T86EmUifUX3
	 /XxVPg5vq0Z6Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C03ED17E0904;
	Thu, 10 Apr 2025 09:41:16 +0200 (CEST)
Message-ID: <58b3bbe7-c036-45c6-b6e9-e2fc150a9256@collabora.com>
Date: Thu, 10 Apr 2025 09:41:16 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: pinctrl: mediatek: Correct indentation
 and style in DTS example
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Andy Teng <andy.teng@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250324125105.81774-1-krzysztof.kozlowski@linaro.org>
 <20250324125105.81774-2-krzysztof.kozlowski@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250324125105.81774-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 24/03/25 13:51, Krzysztof Kozlowski ha scritto:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
> 
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   .../pinctrl/mediatek,mt65xx-pinctrl.yaml      | 83 +++++++------------
>   .../pinctrl/mediatek,mt7622-pinctrl.yaml      | 48 +++++------
>   .../pinctrl/mediatek,mt8183-pinctrl.yaml      | 68 +++++++--------
>   .../pinctrl/mediatek,mt8192-pinctrl.yaml      | 76 ++++++++---------
>   4 files changed, 127 insertions(+), 148 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
> index 5f2808212f39..b9680b896f12 100644
> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
> @@ -137,64 +137,43 @@ examples:
>           #size-cells = <2>;
>   
>           pinctrl@1c20800 {
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

Agreeing with Rob - if you can please also remove the labels while at it,
that'd be great, but regardless of that...

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



