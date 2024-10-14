Return-Path: <linux-gpio+bounces-11276-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B50E999C2C5
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 10:15:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 44B1E1F23A4B
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 08:15:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED09514B946;
	Mon, 14 Oct 2024 08:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Z2zrdNi+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA57013D248;
	Mon, 14 Oct 2024 08:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728893743; cv=none; b=BqDLGDCMefDYdsEEDqTkEUa2aOo9K1gCKhcZjze+hME9YBF/8u2i+oLd72ZH+TR5v/gIN5laMILukmPjdInL13yg61EqErNx1AZEWRiV2eBsPqZuAkYSi37yMCaASL5hsfL6ZYhzTR5fNpwzNAt1BRQ1jYsFxoxZMCeBEmip2/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728893743; c=relaxed/simple;
	bh=hqm06D9eWGblvveI9zm2J4bl6WWp02aKGJ6XS2bRRbg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l7/IVL7G/B69uiPt0CHiE1tcgEFtcZkKDTwxCeoCfjYDQZBgUP1SKzlXyLnYiSjVyJrbJBykvT1uSLKVhmLb7cBll4Svgc7BoTygrUJJqu4l4KPp5voKODBpZyDkAjlqDMixA7hq65gCE3n0FI5zdQO6IHrSgN0ztBJSZzikPYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Z2zrdNi+; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728893739;
	bh=hqm06D9eWGblvveI9zm2J4bl6WWp02aKGJ6XS2bRRbg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Z2zrdNi+b5qul89n6xkjWIl7RRPJGVIqBlD/0HtlokH79y++2WMLYd9XQZEYaUAvl
	 RahwrQ3GNipIMFdN9l8xzw3Su1v9MxRlH3dyIqxLQKVuiot0tvpA9dLDYj4t0UrTPL
	 7G8A6lKT7sLQ2F4liT8MQqLEfwjf/rZZTd52lCGH57+GIrCLZZv85vSfTio3yYAF2J
	 N+tMDHfqG4h8/SkDaO33OROB8ySXK4IDyMiZ9M2j8FPYCfKbgUaXm7eXkXZfOVNdEe
	 /zNyupfByz8Xkv+4dxOVM/LssZFKVkyTzIO8VprtUkcQGP17VeWd0dLpS8aXNzz6CJ
	 dZMAUocV/uUZA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4613317E10D3;
	Mon, 14 Oct 2024 10:15:39 +0200 (CEST)
Message-ID: <2e6157fc-10e6-47a0-8270-4e51b873049c@collabora.com>
Date: Mon, 14 Oct 2024 10:15:38 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Aw: Re: [PATCH v4 4/4] arm64: dts: mediatek: mt7988: add pinctrl
 support
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Frank Wunderlich <linux@fw-web.de>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 daniel@makrotopia.org, john@phrozen.org, ansuelsmth@gmail.com,
 eladwf@gmail.com
References: <20241009165222.5670-1-linux@fw-web.de>
 <20241009165222.5670-5-linux@fw-web.de>
 <4ac4c8ab-4180-4fcc-9e48-6dede7448dee@collabora.com>
 <trinity-090e30b8-45a9-4a2b-98f1-e34904616b2d-1728651225070@3c-app-gmx-bs32>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <trinity-090e30b8-45a9-4a2b-98f1-e34904616b2d-1728651225070@3c-app-gmx-bs32>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 11/10/24 14:53, Frank Wunderlich ha scritto:
> Hi
> 
>> Gesendet: Donnerstag, 10. Oktober 2024 um 14:36 Uhr
>> Von: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
>> Betreff: Re: [PATCH v4 4/4] arm64: dts: mediatek: mt7988: add pinctrl support
>>
>> Il 09/10/24 18:52, Frank Wunderlich ha scritto:
>>> From: Frank Wunderlich <frank-w@public-files.de>
>>>
>>> Add mt7988a pinctrl node.
>>>
>>> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
>>> ---
>>> v2:
>>> - fix wrong alignment of reg values
>>> ---
>>>    arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 241 ++++++++++++++++++++++
>>>    1 file changed, 241 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
>>> index c9649b815276..7e15934efe0b 100644
>>> --- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
>>> +++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
>>> @@ -3,6 +3,7 @@
>>>    #include <dt-bindings/clock/mediatek,mt7988-clk.h>
>>>    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>    #include <dt-bindings/phy/phy.h>
>>> +#include <dt-bindings/pinctrl/mt65xx.h>
>>>
>>>    / {
>>>    	compatible = "mediatek,mt7988a";
>>> @@ -105,6 +106,246 @@ clock-controller@1001e000 {
>>>    			#clock-cells = <1>;
>>>    		};
>>>
>>> +		pio: pinctrl@1001f000 {
>>> +			compatible = "mediatek,mt7988-pinctrl";
>>> +			reg = <0 0x1001f000 0 0x1000>,
>>> +			      <0 0x11c10000 0 0x1000>,
>>> +			      <0 0x11d00000 0 0x1000>,
>>> +			      <0 0x11d20000 0 0x1000>,
>>> +			      <0 0x11e00000 0 0x1000>,
>>> +			      <0 0x11f00000 0 0x1000>,
>>> +			      <0 0x1000b000 0 0x1000>;
>>> +			reg-names = "gpio", "iocfg_tr",
>>> +				    "iocfg_br", "iocfg_rb",
>>> +				    "iocfg_lb", "iocfg_tl", "eint";
>>> +			gpio-controller;
>>> +			#gpio-cells = <2>;
>>> +			gpio-ranges = <&pio 0 0 84>;
>>> +			interrupt-controller;
>>> +			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
>>> +			interrupt-parent = <&gic>;
>>> +			#interrupt-cells = <2>;
>>> +
>>> +			mdio0_pins: mdio0-pins {
>>> +				mux {
>>> +					function = "eth";
>>> +					groups = "mdc_mdio0";
>>> +				};
>>> +
>>> +				conf {
>>> +					pins = "SMI_0_MDC", "SMI_0_MDIO";
>>> +					drive-strength = <MTK_DRIVE_8mA>;
>>
>> Please do *not* use the MTK_DRIVE_(x)mA definitions anymore.
>>
>> Here it is `drive-strength = <8>`.
> 
> OK
> 
>>> +				};
>>> +			};
>>> +
>>> +			i2c0_pins: i2c0-g0-pins {
>>> +				mux {
>>> +					function = "i2c";
>>> +					groups = "i2c0_1";
>>> +				};
>>> +			};
>>> +
>>> +			i2c1_pins: i2c1-g0-pins {
>>> +				mux {
>>> +					function = "i2c";
>>> +					groups = "i2c1_0";
>>> +				};
>>> +			};
>>
>> Whatever pin can be configured with one or multiple groups that can be different
>> must *not* be in the SoC dtsi, but rather in the *board* dts(i) file, as the wanted
>> configuration of those pins is *not* soc-specific but board-specific.
>>
>>   From a fast look, I can see that at least the I2C pins can be assigned to different
>> functions: for example, pins 15+16 can be either of i2c0_1, *or* u30_phy_i2c0, *or*
>> u32_phy_i2c0, *or* xfi_phy0_i2c1 ... or others, even.
>>
>> Finally - I think that *most* of the muxing that you're declaring here must instead
>> go to your board specific devicetree and not in mt7988a.dtsi.
> 
> As far as i see also mdio and uart0 sharing pins with other pin definitions.
> It looks for me that nearly all (except pcie) needs to go in board(s) dts then...
> imho this creates duplicates of same nodes, if 2 boards using the same pinconf.
> But if it is the way to go, i drop all subnodes except the pcie-pins.
> 

That's the way to go. Please drop all subnodes from this one except pcie-pins.

Cheers,
Angelo



