Return-Path: <linux-gpio+bounces-11145-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4B3998627
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Oct 2024 14:36:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E39F11F21FC2
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Oct 2024 12:36:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FF4F1C5791;
	Thu, 10 Oct 2024 12:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="VAO+y59H"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF56129AF;
	Thu, 10 Oct 2024 12:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728563769; cv=none; b=EQjcUR7thFKPTVgsOzZYC7Hi4R5KnfpV3KSKbMaeDmnwgaiP6GHykbwoMnmzA8vr1+JJojquKhZM2Jr4/35u8g+l+/7IsvoLrkAf1Kh0RDpNxl3UuG795+aTFyxnr6sLZ/p5XWGPwTjc3Fc9VKw/ZR5KpQgGSC77StzQCcW2DHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728563769; c=relaxed/simple;
	bh=Rryj9oLGExO1bUhiYrapGyYrh33dxncpOASEi3N3YnA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R3C/orrm6lm2f8o+moC7uDUJXrdLCGoD2h5GBo1dsA7gSG81wBvlCnWGjq/5Qp2a9HiubgnSsy4e4KWrppTT27nc+LkhFYNOBzDAQVAe0gmNU1fANuq7Ci+yZ0rYo0HBwqZITsm3ULCisPiOoKjhI16dTx3SXxuH2UK2OmteWys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=VAO+y59H; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728563764;
	bh=Rryj9oLGExO1bUhiYrapGyYrh33dxncpOASEi3N3YnA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VAO+y59HV7qdy1CWL2CYTOxzn8chuMzPQC7JQOw/BjFOdZ+pIp0jEiWvhCZi6lcsS
	 lGXjXZeWPJWc2baUbshzufwHwWxl3L2Ar/t/p2zpVnBf05eK7LPrtvsMoIgM5Q+jIV
	 F/hkVoGjjLIdPxEffX3+GhYIGe6y2kH+HGsrR1wx9uZ4AxklscLtmzj/oeszwwlR54
	 Jv2l5DWgiO8YgjwjD2Qfd24JVqW03PYJ6d45ITw8PVLVVswQ44pSZFqYbZEdx4GFzS
	 D6EeQ64nKAZ3CDSzX5+sIvW0mxrFYox+vJxVyuxmYvnuenJU/DAuDk6xOb7mEKHNq3
	 /e8y/elb7mgMw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4172617E35E0;
	Thu, 10 Oct 2024 14:36:04 +0200 (CEST)
Message-ID: <4ac4c8ab-4180-4fcc-9e48-6dede7448dee@collabora.com>
Date: Thu, 10 Oct 2024 14:36:03 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] arm64: dts: mediatek: mt7988: add pinctrl support
To: Frank Wunderlich <linux@fw-web.de>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>
Cc: Frank Wunderlich <frank-w@public-files.de>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 daniel@makrotopia.org, john@phrozen.org, ansuelsmth@gmail.com,
 eladwf@gmail.com
References: <20241009165222.5670-1-linux@fw-web.de>
 <20241009165222.5670-5-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241009165222.5670-5-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 09/10/24 18:52, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add mt7988a pinctrl node.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> v2:
> - fix wrong alignment of reg values
> ---
>   arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 241 ++++++++++++++++++++++
>   1 file changed, 241 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
> index c9649b815276..7e15934efe0b 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
> @@ -3,6 +3,7 @@
>   #include <dt-bindings/clock/mediatek,mt7988-clk.h>
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>   #include <dt-bindings/phy/phy.h>
> +#include <dt-bindings/pinctrl/mt65xx.h>
>   
>   / {
>   	compatible = "mediatek,mt7988a";
> @@ -105,6 +106,246 @@ clock-controller@1001e000 {
>   			#clock-cells = <1>;
>   		};
>   
> +		pio: pinctrl@1001f000 {
> +			compatible = "mediatek,mt7988-pinctrl";
> +			reg = <0 0x1001f000 0 0x1000>,
> +			      <0 0x11c10000 0 0x1000>,
> +			      <0 0x11d00000 0 0x1000>,
> +			      <0 0x11d20000 0 0x1000>,
> +			      <0 0x11e00000 0 0x1000>,
> +			      <0 0x11f00000 0 0x1000>,
> +			      <0 0x1000b000 0 0x1000>;
> +			reg-names = "gpio", "iocfg_tr",
> +				    "iocfg_br", "iocfg_rb",
> +				    "iocfg_lb", "iocfg_tl", "eint";
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&pio 0 0 84>;
> +			interrupt-controller;
> +			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-parent = <&gic>;
> +			#interrupt-cells = <2>;
> +
> +			mdio0_pins: mdio0-pins {
> +				mux {
> +					function = "eth";
> +					groups = "mdc_mdio0";
> +				};
> +
> +				conf {
> +					pins = "SMI_0_MDC", "SMI_0_MDIO";
> +					drive-strength = <MTK_DRIVE_8mA>;

Please do *not* use the MTK_DRIVE_(x)mA definitions anymore.

Here it is `drive-strength = <8>`.

> +				};
> +			};
> +
> +			i2c0_pins: i2c0-g0-pins {
> +				mux {
> +					function = "i2c";
> +					groups = "i2c0_1";
> +				};
> +			};
> +
> +			i2c1_pins: i2c1-g0-pins {
> +				mux {
> +					function = "i2c";
> +					groups = "i2c1_0";
> +				};
> +			};

Whatever pin can be configured with one or multiple groups that can be different
must *not* be in the SoC dtsi, but rather in the *board* dts(i) file, as the wanted
configuration of those pins is *not* soc-specific but board-specific.

 From a fast look, I can see that at least the I2C pins can be assigned to different
functions: for example, pins 15+16 can be either of i2c0_1, *or* u30_phy_i2c0, *or*
u32_phy_i2c0, *or* xfi_phy0_i2c1 ... or others, even.

Finally - I think that *most* of the muxing that you're declaring here must instead
go to your board specific devicetree and not in mt7988a.dtsi.

Cheers,
Angelo




