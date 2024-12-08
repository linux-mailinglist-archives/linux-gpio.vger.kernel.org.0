Return-Path: <linux-gpio+bounces-13618-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0A79E8667
	for <lists+linux-gpio@lfdr.de>; Sun,  8 Dec 2024 17:30:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F1162819CC
	for <lists+linux-gpio@lfdr.de>; Sun,  8 Dec 2024 16:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E8B0165EF8;
	Sun,  8 Dec 2024 16:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="qYltXwO3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4C715C158
	for <linux-gpio@vger.kernel.org>; Sun,  8 Dec 2024 16:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733675401; cv=none; b=OS3QGLB0079usf0BzT+SR/+55IRWy7UO1FUs4ZbS4lNqjYNGEuBDv85jnW+uGRWj8Vk2l+1JKMqbrom550xppRO8nIU5wXiAWdmRQc4VzDCPvBPaR1SMV2ihrFQU1IRy7m1Tb2GI9v4ZUv0vfp+MioAoMbqifBSjiQ8SxGc29As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733675401; c=relaxed/simple;
	bh=Sq41DU1AxfOGIkoKNVF/ea/IoEoVQpEvHAVF8kBvKDU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=SvuU2ptQs39LmM5Iq0wlcIWVVBCdslfuKcnjIAzP9R+GnGs4z0qwnNLTpTcE4Z6zP2wupr5H6RSUe4x2trAOBQxqrxLJydRR6qWjeEINYQXdArP1b7iFfViuPtDkOvr6TGovrkUTJ4Yx442EL1QSPBa71vnsswgCDeAfQiise2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=qYltXwO3; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aa543c4db92so730439466b.0
        for <linux-gpio@vger.kernel.org>; Sun, 08 Dec 2024 08:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733675398; x=1734280198; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0BNq9HukNRZr8ujW8Nrg9M6GQfhB02SRFVzv7C/bZVs=;
        b=qYltXwO3N1sWWFvpXdrgzeu1T2+Mld284I4YqkXpqJAEbg30tYIYTby50aGbdPMozX
         3V5ihYpG50ERHO/jUb6dUA+AInqmo9HXFLfM0X2Fe1MNTfJ5t1lpcdb+T7xaoROmH/Mq
         J5vkAHCOdB94SLGk9zvZoxhK0Ldx7HWieQ7UF4JVOGrlHYYo5CH/v7UIB+QG4e1NcOQ5
         r1e6oq4hv5bGLLxRCSXTsTNufOeTW5/Tuugw2Uw0V1UJkF+ggAf76vpjO46F1u5qTIVL
         xQ4pZpRbxcHPOVwclPhdqKb1SsmBAS9RqYq9Icxz7OIXZkUwXvQqMT4RD3FT1lAEAelQ
         xT8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733675398; x=1734280198;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0BNq9HukNRZr8ujW8Nrg9M6GQfhB02SRFVzv7C/bZVs=;
        b=K2NA5zA86JASZB1WUmAyuw6N1gJ9N1XI8cNyoVfYIRcYkVl5PWGnx/rRXy8XLoFrc7
         b4MPcbD3yfu3crqMsNG7CfJ/YRMttQ95spM6BgvAaI7tX1A17NsdGfGrCdEWuMGVsvb6
         zPP+FmaVL5vKaE2pm7L24wCzxRivXn9fgtCdijzHCplsA10g8M1IzG6XBtu178h+wb1N
         n6M1EanO23c5BuMSJm/lrJG9JvXn+FFTukr4GTEmhgFilMHAuwEHoKzSs/1h519A4OUW
         sF2OktDGNPkRLg9ml2kTaC731Ez1kF3UmjPW/dGaFdgn3gYJUmlISp8qUdZJgBiFwfmU
         XshQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzxeLm/oHcSsJ/xsDa68Gm2WIVXchNWoNgvZs1fdS8iwbwPBQyxjwUuI088kxy7Um8Ud1J4eDExezu@vger.kernel.org
X-Gm-Message-State: AOJu0Yyld56Tt9IpPJV5yYifnZ5m89z/zH+ZwSfQl2OMiDy684j6vPIg
	EkhlY8UcyVnw/2yjiMx08oZffl4+cOLll5y+PREfV2x+aFcJS64UYBpzFFLXMHY=
X-Gm-Gg: ASbGncuNDdAuTHI2Mpf0N7v4UyKlKagQa2bGVKokWmpd4TIPrMzx6GOovka44tJLyxK
	Sxc3PANkZ5NBwQnzydqlnDvfeozohG64OaIE3qja8yT0TSyQ9LhdTFa9HI/rUWEC5TJkjEaJt3t
	6o+vsAl8a+bSzfRUSMv51i78t/J37K3FIhpd8C64zlnkaFgrRmjhxYgynJln3dN8n/jUJoGpgXv
	KMOSya3cMgL71iT8TRklifbtniBQuCzHoimzhUO/Ndr1GD4rSd2rP8w2Lg=
X-Google-Smtp-Source: AGHT+IGgMEMrSAPr02MLIHAcIHPoTg9MNMPJ2rKs998sfhdc8FiMJuyQZbDGm5o1c5USrCVKcB7FqQ==
X-Received: by 2002:a17:906:2189:b0:aa6:74a9:ce6e with SMTP id a640c23a62f3a-aa674a9d065mr269789166b.16.1733675398372;
        Sun, 08 Dec 2024 08:29:58 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa68a97498dsm5949966b.99.2024.12.08.08.29.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Dec 2024 08:29:57 -0800 (PST)
Message-ID: <9fbbf3d1-9543-42f8-a80c-1527811109ef@tuxon.dev>
Date: Sun, 8 Dec 2024 18:29:55 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/13] ARM: dts: microchip: add sama7d65 SoC DT
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: Ryan.Wanner@microchip.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, mturquette@baylibre.com, sboyd@kernel.org,
 arnd@arndb.de
Cc: dharma.b@microchip.com, mihai.sain@microchip.com,
 romain.sioen@microchip.com, varshini.rajendran@microchip.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org
References: <cover.1733505542.git.Ryan.Wanner@microchip.com>
 <f62e2600a8e88e4be9d87b346c41bb4781f8f667.1733505542.git.Ryan.Wanner@microchip.com>
 <9a6c1dfe-cf4d-41fc-a0f4-b6a111a40c94@tuxon.dev>
In-Reply-To: <9a6c1dfe-cf4d-41fc-a0f4-b6a111a40c94@tuxon.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 08.12.2024 18:28, Claudiu Beznea wrote:
> 
> 
> On 06.12.2024 21:59, Ryan.Wanner@microchip.com wrote:
>> From: Ryan Wanner <Ryan.Wanner@microchip.com>
>>
>> Add Device Tree for sama7d65 SoC.
>>
>> Co-developed-by: Dharma Balasubiramani <dharma.b@microchip.com>
>> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
>> Co-developed-by: Romain Sioen <romain.sioen@microchip.com>
>> Signed-off-by: Romain Sioen <romain.sioen@microchip.com>
>> Co-developed-by: Varshini Rajendran <varshini.rajendran@microchip.com>
>> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
>> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
>> ---
>>  arch/arm/boot/dts/microchip/sama7d65.dtsi | 145 ++++++++++++++++++++++
>>  1 file changed, 145 insertions(+)
>>  create mode 100644 arch/arm/boot/dts/microchip/sama7d65.dtsi
>>
>> diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
>> new file mode 100644
>> index 000000000000..0dcd80690210
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
>> @@ -0,0 +1,145 @@
>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> +/*
>> + *  sama7d65.dtsi - Device Tree Include file for SAMA7D65 SoC
>> + *
>> + *  Copyright (C) 2024 Microchip Technology, Inc. and its subsidiaries
>> + *
>> + *  Author: Ryan Wanner <Ryan.Wanner@microchip.com>
>> + *
>> + */
>> +
>> +#include <dt-bindings/clock/at91.h>
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>> +#include <dt-bindings/interrupt-controller/irq.h>
>> +#include <dt-bindings/mfd/at91-usart.h>
>> +
>> +/ {
>> +	model = "Microchip SAMA7D65 family SoC";
>> +	compatible = "microchip,sama7d65";
>> +	#address-cells = <1>;
>> +	#size-cells = <1>;
>> +	interrupt-parent = <&gic>;
>> +
>> +	cpus {
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		cpu0: cpu@0 {
>> +			compatible = "arm,cortex-a7";
>> +			reg = <0x0>;
>> +			device_type = "cpu";
>> +			clocks = <&pmc PMC_TYPE_CORE PMC_CPUPLL>;
>> +			clock-names = "cpu";
>> +		};
>> +	};
>> +
>> +	clocks {
>> +		main_xtal: clock-mainxtal {
>> +			compatible = "fixed-clock";
>> +			#clock-cells = <0>;
>> +		};
>> +
>> +		 slow_xtal: clock-slowxtal {
>> +			compatible = "fixed-clock";
>> +			#clock-cells = <0>;
>> +		};
>> +
>> +	};
>> +
>> +	soc {
>> +		compatible = "simple-bus";
>> +		ranges;
>> +		#address-cells = <1>;
>> +		#size-cells = <1>;
>> +
>> +		pioa: pinctrl@e0014000 {
>> +			compatible = "microchip,sama7d65-pinctrl";
>> +			reg = <0xe0014000 0x800>;
>> +			interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 10>;
>> +			interrupt-controller;
>> +			#interrupt-cells = <2>;
>> +			gpio-controller;
>> +			#gpio-cells = <2>;
>> +		};
>> +
>> +		pmc: clock-controller@e0018000 {
>> +			compatible = "microchip,sama7d65-pmc", "syscon";
>> +			reg = <0xe0018000 0x200>;
>> +			interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
>> +			#clock-cells = <2>;
>> +			clocks = <&clk32k 1>, <&clk32k 0>, <&main_xtal>;
>> +			clock-names = "td_slck", "md_slck", "main_xtal";
>> +		};
>> +
>> +		clk32k: clock-controller@e001d500 {
>> +			compatible = "microchip,sama7d65-sckc", "microchip,sam9x60-sckc";
>> +			reg = <0xe001d500 0x4>;
>> +			clocks = <&slow_xtal>;
>> +			#clock-cells = <1>;
>> +		};
>> +
>> +		sdmmc1: mmc@e1208000 {
>> +			compatible = "microchip,sama7d65-sdhci", "microchip,sam9x60-sdhci";
>> +			reg = <0xe1208000 0x400>;
>> +			interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 76>, <&pmc PMC_TYPE_GCK 76>;
>> +			clock-names = "hclock", "multclk";
>> +			assigned-clocks = <&pmc PMC_TYPE_GCK 76>;
>> +			assigned-clock-rates = <200000000>;
>> +			assigned-clock-parents = <&pmc PMC_TYPE_CORE PMC_MCK1>;
>> +			status = "disabled";
>> +		};
>> +
>> +		pit64b0: timer@e1800000 {
>> +			compatible = "microchip,sama7d65-pit64b", "microchip,sam9x60-pit64b";
>> +			reg = <0xe1800000 0x100>;
>> +			interrupts = <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 66>, <&pmc PMC_TYPE_GCK 66>;
>> +			clock-names = "pclk", "gclk";
>> +		};
>> +
>> +		pit64b1: timer@e1804000 {
>> +			compatible = "microchip,sama7d65-pit64b", "microchip,sam9x60-pit64b";
>> +			reg = <0xe1804000 0x100>;
>> +			interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 67>, <&pmc PMC_TYPE_GCK 67>;
>> +			clock-names = "pclk", "gclk";
>> +		};
>> +
>> +		flx6: flexcom@e2020000 {
>> +			compatible = "microchip,sama7d65-flexcom", "atmel,sama5d2-flexcom";
>> +			reg = <0xe2020000 0x200>;
>> +			ranges = <0x0 0xe2020000 0x800>;
>> +			#address-cells = <1>;
>> +			#size-cells = <1>;
>> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 40>;
>> +			status = "disabled";
>> +
>> +			uart6: serial@200 {
>> +				compatible = "microchip,sama7d65-usart", "atmel,at91sam9260-usart";
>> +				reg = <0x200 0x200>;
>> +				atmel,usart-mode = <AT91_USART_MODE_SERIAL>;
> 
> Vendor specific props would be at the end, before states, according to [1].
> I'll adjust it while applying.
> 
> [1]

This is the link, sorry:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/dts-coding-style.rst#n122

Other than that:
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

