Return-Path: <linux-gpio+bounces-8493-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA439438AE
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2024 00:12:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4E92283542
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2024 22:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C18C16D4E9;
	Wed, 31 Jul 2024 22:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GAZmbGF5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4297383B1;
	Wed, 31 Jul 2024 22:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722463887; cv=none; b=IKKHlbb8yi+m96DtCob3Mle3Dcy1t2z7t4g/3MrhDCEVvCRsxNB02yz8RWYJ/nAKUSO4iIjSd5+c2BVAUVZJNNWJLleXi14dLh6uEcyvAzjnwrpPl9jIt6z/uo7CMBqY8RKv9nOcmpGSzIMTfwdhbyuMpTs7+4CwIXhk1PBis8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722463887; c=relaxed/simple;
	bh=40WPKpKujcBJdE50Iq/cJPCUcDbZ9TdNwbnFQ4JuJfE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LQUB1ib34L088k5QJ+ggJ/PImochr9RP4I2htBZu2Y7o3OPxZnufJhTlyWsvzKklrVKAtfSA8rDl1K3b4pzzdVUWmASjc0tBdfilac9o72AqBv06UV5/r6as1KDwITADlksIIegfSFaGzmEdRO9eNRzKnUiQygwaYIcae2+pob8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GAZmbGF5; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6b7b28442f9so70709886d6.3;
        Wed, 31 Jul 2024 15:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722463884; x=1723068684; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mjq0uGvQN66zPwFq4xAVJqxHjAgjcl9vjk3Xwdos2JI=;
        b=GAZmbGF5mmNUAdZQdARucHWrtZPArmBb7LDjMOYqNqHGklNAlFKlG3Gyw2MB/Bq4q8
         1dGcXX8D6euTiIcIwm2wCU40+fp5ElIaSOFP/OPyR+X16FZ8LOY2x1+9Tmt+0QR7gdqo
         xxor0pdyplFZ1ZS5DpceznKqkYpgHe+Qv8vc85xkoKvQZ6YzIorUgXSKF01lcmWW/tYV
         fmk2CiT/ppDiZMMk4DZEFos/15XBRIYUQbxC9bly0TA7OiF01WrNVeqdz9nnHyOtFDYy
         xwbMrW/h5ymZBK7fHFdizDKrkU2r4apvNJWYzrUGQrpvzafsrD94qAwn1jGncaSYjngw
         8Giw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722463884; x=1723068684;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mjq0uGvQN66zPwFq4xAVJqxHjAgjcl9vjk3Xwdos2JI=;
        b=KL21bDeH3BRprWWXCSJJg0sUSd129uLfXEbyHCrzUOngcWgO2ItFTyYw9kKj322cSV
         iwSB93I1YrFwnWtzRWDAPwcyRK25EOTpzNnJai/lImBWagRkc1LvaLCj0aKldVyBNzKL
         nAsaSAoXOuMl9VJfBAaOCkuLhvX8Gdq1w9EqYBcRJQdJbbnvt+gYapgqST3cDp2RhrgK
         09SRLWP6cjrSugJ+Wmvh4Aaofw6c15QYMecsZSo2SYrmYI2z36QJ6/h+tvWUv7cb+uak
         wIrBOAUfbPw/L4hEIHDaasSyMfmUnwH1hfimkoggipMXMi5J6a5OR4plsjzjHYJN/8z9
         LKXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGli+iqQx/Bop5HK7kpm6k+osBvXOsywV/prdiC69fXPhyo2W/ooec9GeY7zw9vRLgCZLYvmkeC5VeIeyIgCQTashFsXRb3iJgwFsXB4kwUGEd1RHPnn37erdxLZWuYxc0wJo/oQ8=
X-Gm-Message-State: AOJu0YxPweiFQyCXryEuJyAohLhJ0dD2VmJQT+0Qz1lQy55XSKjdLeDx
	8dp2L3G/kR4/Z4NG5LMm/ckD0yDUHCUqoUeXBg8obwa9uKS59Xsg
X-Google-Smtp-Source: AGHT+IEq4useatLIy7yrsLLnlLbqusQC7mzUooi7ll7ykBhHD8pleYpSETX6KTgn18+TeQTdHq9q0A==
X-Received: by 2002:a05:6214:5986:b0:6b5:e451:81d0 with SMTP id 6a1803df08f44-6bb8d6818d0mr8382886d6.3.1722463883626;
        Wed, 31 Jul 2024 15:11:23 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id 6a1803df08f44-6bb3fad8c0bsm78448786d6.120.2024.07.31.15.11.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jul 2024 15:11:23 -0700 (PDT)
Message-ID: <a4fe3edd-07f9-4bfd-8a6e-c96175ddcc8d@gmail.com>
Date: Wed, 31 Jul 2024 15:11:19 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] arm64: dts: broadcom: bcm2712: Add one more GPIO node
To: "Ivan T. Ivanov" <iivanov@suse.de>, linus.walleij@linaro.org,
 robh@kernel.org, krzk+dt@kernel.org
Cc: conor+dt@kernel.org, florian.fainelli@broadcom.com, wahrenst@gmx.net,
 andrea.porta@suse.com, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20240731062814.215833-1-iivanov@suse.de>
 <20240731062814.215833-6-iivanov@suse.de>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20240731062814.215833-6-iivanov@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/30/24 23:28, Ivan T. Ivanov wrote:
> Add GPIO and related interrupt controller nodes and wire one
> of the lines to power button.
> 
> Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
> ---
>   .../boot/dts/broadcom/bcm2712-rpi-5-b.dts     | 21 +++++++++++++++++++
>   arch/arm64/boot/dts/broadcom/bcm2712.dtsi     | 21 +++++++++++++++++++
>   2 files changed, 42 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> index 8a0d20afebfe..06e926af16b7 100644
> --- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> +++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> @@ -2,6 +2,7 @@
>   /dts-v1/;
>   
>   #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
>   #include "bcm2712.dtsi"
>   
>   / {
> @@ -44,6 +45,21 @@ sd_vcc_reg: sd-vcc-reg {
>   		enable-active-high;
>   		gpios = <&gio_aon 4 GPIO_ACTIVE_HIGH>;
>   	};
> +
> +	pwr-button {
> +		compatible = "gpio-keys";
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pwr_button_pins>;
> +		status = "okay";
> +
> +		pwr_key: pwr {
> +			label = "pwr_button";
> +			linux,code = <KEY_POWER>;
> +			gpios = <&gio 20 GPIO_ACTIVE_LOW>;
> +			debounce-interval = <50>;
> +		};
> +	};
>   };
>   
>   /* The system UART */
> @@ -73,6 +89,11 @@ emmc_aon_cd_pins: emmc-aon-cd-pins {
>   };
>   
>   &pinctrl {
> +	pwr_button_pins: pwr-button-pins {
> +		function = "gpio";
> +		pins = "gpio20";
> +		bias-pull-up;
> +	};
>   
>   	emmc_sd_pulls: emmc-sd-pulls {
>   		pins = "emmc_cmd", "emmc_dat0", "emmc_dat1", "emmc_dat2", "emmc_dat3";
> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> index 1099171cd435..39d2419ffce2 100644
> --- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> +++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> @@ -271,6 +271,27 @@ pinctrl: pinctrl@7d504100 {
>   			reg = <0x7d504100 0x30>;
>   		};
>   
> +		main_irq: intc@7d508400 {
> +			compatible = "brcm,bcm7271-l2-intc";
> +			reg = <0x7d508400 0x10>;
> +			interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
> +		};
> +
> +		gio: gpio@7d508500 {
> +			compatible = "brcm,brcmstb-gpio";
> +			reg = <0x7d508500 0x40>;
> +			interrupt-parent = <&main_irq>;
> +			interrupts = <0>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			brcm,gpio-bank-widths = <32 22>;
> +			brcm,gpio-direct;

Undocumented and unsupported property upstream, what does it do? Other 
than that, LGTM.
-- 
Florian


