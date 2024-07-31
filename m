Return-Path: <linux-gpio+bounces-8494-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E7A9438AF
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2024 00:13:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFC9128399E
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2024 22:13:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 501C916D329;
	Wed, 31 Jul 2024 22:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="chTeSq70"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A186C383B1
	for <linux-gpio@vger.kernel.org>; Wed, 31 Jul 2024 22:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722464015; cv=none; b=oV9FdayMHh4cC9gllzYB4LiSeUEwAk63Sb51zSV7cO0uCQ6ip2m3i+vzjwwtPKQ2h1+99m4rr/6LAwKS+0vZRtQy9YvwALQXIAL+Xzuu5t82U38bdvZW9usCdLVvVGBglwFZG/xJHgzUGREo5oqOCXpjbaTBBKmukcUVUfJn9QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722464015; c=relaxed/simple;
	bh=+g+/qo/yZ3di/F98/Pu7pi8h7pU0H3WNXM1UT/J1D8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c3eDYcuxUqJnG3ZULbz73aJ3kQ5e77U5LiFr08vIt3x1GFZxDuAH4YlpakbMlLgEV/i/+fhlBJKDt84cKU33BCyzdW2FKUDIouRWGJiJuSLJBha5v4xa5fGP/np5ldZXCHCxPUFI4qRlNG0i0q955pqGyEEU6hkdHWgNvKLraF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=chTeSq70; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1fd9e70b592so43798285ad.3
        for <linux-gpio@vger.kernel.org>; Wed, 31 Jul 2024 15:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1722464013; x=1723068813; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+c0fDvUvhH5vgcHFgB3b06sQjHFezguFr2SifaJLtIw=;
        b=chTeSq70KSb3qs/hvlV4iuRoYYln6sVVsCS3o7WzyZ1AwQ+Q/JSO7HU5Zfg3dG7Zck
         0wYWbxRxsJjtqfy6OnQM8yErMzQ3rIyRtve32YPz9WbCzi9QTOuYoounf/pUXJtc+ihe
         q+FsAPnT68y9melBSdIhQBHdqG2z08r/oUovw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722464013; x=1723068813;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+c0fDvUvhH5vgcHFgB3b06sQjHFezguFr2SifaJLtIw=;
        b=wmxJW8mwsnghZhaX1dwLuc52KU1+hh9OPdBtL3hTuW37PF+KqtNWODCXhNy4wz+hIq
         uIceA2j18T0FI0VrDSeYQszf8QTA7uXtubQA0cAtnReOwGKbijUPCIFBihHvUCCUBSbA
         wpDLFff3Pe/9JczTQukhEVU+iBlw5DO0yx7+9VqA+Ae83B4RZeI8wdE2BKBPJD64rrSl
         wfz2dPVwBRUkm2x/1VODnQEE7C3rzx2XFbkXHyHagA+RsNbfaNzkh5+czOPTUfcUhrwq
         JrnGxz4GS2z+5BAz49ij8oRqQqkqmrqp25mok4tTIecqmXc+VEHk9aftgrZUBNuNKGlo
         DqKg==
X-Forwarded-Encrypted: i=1; AJvYcCUDvsEnL1eVRZYtMbek/wK7YyHzhWJt+hkhzqb/Nmpx/P1r1YvpDfpxCeYPjzbnCmaZaHZGqB4Nx+2z9OnNfEBmf4rfszadDcSX+g==
X-Gm-Message-State: AOJu0YysnArqAjQL9NTQfY8SrtGRB5KwJj0uimMvT8udAfUoFqAfRbhS
	h7d3nJYfdyWaXc1FASi4mQPOgNmrt5KnMIAD+qaepdBJzWLyGAao5i7772V89Q==
X-Google-Smtp-Source: AGHT+IHFkfpmJGE12gAgfO/gREkDzN++Yid5xQAxcu50am9AFI+EnvCCj0eyJ+Xf1RzxZ9PcSvB4vA==
X-Received: by 2002:a17:903:2308:b0:1ff:493:8de1 with SMTP id d9443c01a7336-1ff4ce70206mr8305445ad.1.1722464012786;
        Wed, 31 Jul 2024 15:13:32 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7ff680bsm124931055ad.298.2024.07.31.15.13.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jul 2024 15:13:32 -0700 (PDT)
Message-ID: <f1b19a03-9509-4d1c-9e54-9c07a372cad3@broadcom.com>
Date: Wed, 31 Jul 2024 15:13:28 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] arm64: dts: broadcom: bcm2712: Add UARTA controller
 node.
To: "Ivan T. Ivanov" <iivanov@suse.de>, linus.walleij@linaro.org,
 robh@kernel.org, krzk+dt@kernel.org
Cc: conor+dt@kernel.org, florian.fainelli@broadcom.com, wahrenst@gmx.net,
 andrea.porta@suse.com, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20240731062814.215833-1-iivanov@suse.de>
 <20240731062814.215833-8-iivanov@suse.de>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20240731062814.215833-8-iivanov@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/30/24 23:28, Ivan T. Ivanov wrote:
> On RPi5 device Bluetooth chips is connected to UARTA
> port. Add Bluetooth chips and related pin definitions.
> With this and firmware already provided by distributions,
> at least on openSUSE Tumbleweed, this is sufficient to make
> Bluetooth operational on RPi5 \o/.
> 
> Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
> ---

[snip]

>   	sdio2_30_pins: sdio2-30-pins {
>   		pin-clk {
>   			function = "sd2";
> @@ -156,3 +184,20 @@ pins-dat {
>   		};
>   	};
>   };
> +
> +/* uarta communicates with the BT module */
> +&uarta {
> +	uart-has-rtscts;
> +	auto-flow-control;
> +	status = "okay";
> +	clock-frequency = <96000000>;

Would not the "clock-frequency" belong to the .dtsi node instead?

> +	pinctrl-0 = <&uarta_24_pins &bt_shutdown_pins>;
> +	pinctrl-names = "default";
> +
> +	bluetooth: bluetooth {
> +		compatible = "brcm,bcm43438-bt";
> +		max-speed = <3000000>;
> +		shutdown-gpios = <&gio 29 GPIO_ACTIVE_HIGH>;
> +		local-bd-address = [ 00 00 00 00 00 00 ];
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> index 3c0663dc6712..e972f94d6828 100644
> --- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> +++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> @@ -305,6 +305,17 @@ gio: gpio@7d508500 {
>   			brcm,gpio-direct;
>   		};
>   
> +		uarta: serial@7d50c000 {
> +			compatible = "brcm,bcm7271-uart";
> +			reg = <0x7d50c000 0x20>;
> +			reg-names = "uart";
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			interrupts = <GIC_SPI 276 IRQ_TYPE_LEVEL_HIGH>;
> +			skip-init;

Also an undocumented property upstream, what does it do? Is this to set 
UPF_SKIP_TEST?
-- 
Florian


