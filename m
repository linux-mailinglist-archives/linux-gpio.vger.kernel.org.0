Return-Path: <linux-gpio+bounces-8552-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A139463A2
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Aug 2024 21:16:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17AD21F227AB
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Aug 2024 19:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 167A8376F1;
	Fri,  2 Aug 2024 19:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="RwUhhNcV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC50B1ABEA9;
	Fri,  2 Aug 2024 19:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722626183; cv=none; b=iMDZsOaCaoPonsZsgu4m5KZzgLjSmWCDXjaDh4FJpmy5453SSOgt/4anwQ/30R6Z2MUstiiSmP6pD84LmT42v9b8s6GqSn7qFGsHJTaud2MKT93FkBRNjnA0k+Su3WUWi6VjFQnM49YTEwCmd/omOC6by5CAjipwuRV5JSVQLjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722626183; c=relaxed/simple;
	bh=MF60YOxBxzn6ztCkADvA2rd/tH1ZtSd9teZXV7gUl8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cTHXE742/nVp/VvpoXIJ75d9hKYyLF9jH3wBIbdmbvxOMwEgRxDcTzUSt8Wq1ckU9FliTmfTcN7PMHxjmtPC0ul0juWGBL4txlDqf7pmpkgQjnm193FugiCiCiepFKlGjvvT7Cd/cknFf845FChm/Rby2yf4PZkjLmvkkaFa77M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=RwUhhNcV; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1722626170; x=1723230970; i=wahrenst@gmx.net;
	bh=nuMZQLG+k7tqWNRdKUj/uVwRkDzgvYcOELnZoHgbJTo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=RwUhhNcVlU69Mo+z5cNCqQ7dfYj2IrWTc/zKM3ganhV0WoqM1vxaz1nPwG6g+qRb
	 gkBFvDTTqUhtb0gw3tQDiu+XqCCGlj/A5St9BgMNPvDoaDNkKY2ZEk3NgvxH6f2JC
	 ZJgyTlniF/bfRhtnLXc5RttDM28Ypxls7keBYjnl/MsvTW/3JsNqVG7wQ/gPL478X
	 USqWUexa04XOiILQFoPsjf1DOsaV/PuMMTxmH62XG/ISx7a4ZgZbSfURvLRaimMBA
	 qY7DpK3FJmZgG6eoTCw1pZo7hxhbDsq/vS0EQPM52Am8vDzl8RObMxCJm9fJeAs+s
	 +iDx2Zt/koWd12ty6A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MYNJq-1snjND3re6-00JLEE; Fri, 02
 Aug 2024 21:16:10 +0200
Message-ID: <7e4031c8-5192-40c1-bd11-9101e98a8612@gmx.net>
Date: Fri, 2 Aug 2024 21:16:08 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] arm64: dts: broadcom: bcm2712: Add pin controller
 nodes
To: "Ivan T. Ivanov" <iivanov@suse.de>, linus.walleij@linaro.org,
 robh@kernel.org, krzk+dt@kernel.org
Cc: conor+dt@kernel.org, florian.fainelli@broadcom.com,
 andrea.porta@suse.com, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20240731062814.215833-1-iivanov@suse.de>
 <20240731062814.215833-5-iivanov@suse.de>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20240731062814.215833-5-iivanov@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ywLruciPJhyfNk/9frrJo/ZeOMJR5Zip1gagCKq4GvAt2Yf1Rjh
 KXVT9evHNSRXYqPbam9IrPPzoaSbIiqVa5UQvF3gNkpHTV6noZRi13OtywGdJcOcOgH7vCq
 5GEDgChdXstDP4EJjzlj9c80E2WvHDDVLx5fWtaj3HOlwAU70KBwtajOz3qtcU0IruxksqV
 lDeYFK7XAdWTnL+padUWQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:MqI8FP61bAM=;Kg/kzJ92XgR+hYD7I6YUVv9Fm85
 pRTJ3vqoqYV+Cijys9YmsqniaWxJ3Z0zhil6PSQmbk8vMjsQ1aWuI7PPbdgJLjkNVfpXTQ1+I
 LfK6WPNhq7G2NXWm38Qrd5Eyg55nhN0VbqyGIvlG2KAgFluHL8Qt1VkNci8VKBHT7lrugN0Ny
 jg2GLi5P+K8KjkF3gNmkbaB9ZQNH2CbJb9zO7gwQsIl+ZkepQqLweOslgsUyp8ygAZwix5P73
 WGkJK9ry2FBEXshsAflAmBwLMZT5xm8qfWArY6pB7NjvUGgp3IA0A4tslymM+lpVjkLmTUk6V
 XJnkLJJ45kbsdSCDyVmZlmhBlTgtButIgJG7m0NzxsLA5MjUbdESnUfb8PafSPRQYhUiJ6ExB
 HQ6LKX4LskIdHHAAcaGM6oDNE0vocHPl8uTHDqbFGIH5TDd9Ywp/wXtHgfhzwSSWhOX6TvQnc
 e9MCHq16X4fmnJPSJgs2xGl58SzyQxBQUZ9Me75kKJhOSfCGmGv8NGg+UK+CrllCzA100fXau
 vlQztVXRtPJq+ku8DzG7F5R8GMOp+Fo4yPt7L0v+7ky1ETLbShSZRffQ9453hQNSaz+Obx+UA
 kJZvYM+MTcL1Ouioxdgyje5871Ur5LHHMdUTjQDVrA9gy0rO8u5zSwc41TRO+bA3J0DqHzUwT
 E2NAVVjPF67lhkyngszCeAGRSwWx4xRCW/CGo11Jst2RgZuwqbYxMBXCltwo298KoNnOVquVv
 mb8VQp+bNeWLUmYblpjGa8JMYHFOGAO8MJ+JW2xW6P+BW+JkAOCjVrALTAeJnxmlRrkYLUoVc
 kmFzaNxoulVWFWvYlnalwJBg==

Am 31.07.24 um 08:28 schrieb Ivan T. Ivanov:
> Add pin-control devicetree nodes and used them to
> explicitly define uSD card interface pin configuration.
>
> Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
> ---
>   .../boot/dts/broadcom/bcm2712-rpi-5-b.dts     | 20 +++++++++++++++++++
>   arch/arm64/boot/dts/broadcom/bcm2712.dtsi     | 10 ++++++++++
>   2 files changed, 30 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm=
64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> index b5921437e09f..8a0d20afebfe 100644
> --- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> +++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> @@ -53,10 +53,30 @@ &uart0 {
>
>   /* SDIO1 is used to drive the SD card */
>   &sdio1 {
> +	pinctrl-0 =3D <&emmc_sd_pulls>, <&emmc_aon_cd_pins>;
> +	pinctrl-names =3D "default";
>   	vqmmc-supply =3D <&sd_io_1v8_reg>;
>   	vmmc-supply =3D <&sd_vcc_reg>;
>   	bus-width =3D <4>;
>   	sd-uhs-sdr50;
>   	sd-uhs-ddr50;
>   	sd-uhs-sdr104;
> +	cd-gpios =3D <&gio_aon 5 GPIO_ACTIVE_LOW>;
> +};
> +
> +&pinctrl_aon {
> +	emmc_aon_cd_pins: emmc-aon-cd-pins {
> +		function =3D "sd_card_g";
> +		pins =3D "aon_gpio5";
> +		bias-pull-up;
> +	};
> +};
> +
> +&pinctrl {
> +
> +	emmc_sd_pulls: emmc-sd-pulls {
> +		pins =3D "emmc_cmd", "emmc_dat0", "emmc_dat1", "emmc_dat2", "emmc_dat=
3";
> +		bias-pull-up;
> +	};
> +
>   };
Please keep the references in alphabetical order (pinctrl comes before
sdio). Except of this:

Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot=
/dts/broadcom/bcm2712.dtsi
> index 398df13148bd..1099171cd435 100644
> --- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> +++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> @@ -266,6 +266,16 @@ uart0: serial@7d001000 {
>   			status =3D "disabled";
>   		};
>
> +		pinctrl: pinctrl@7d504100 {
> +			compatible =3D "brcm,bcm2712-pinctrl";
> +			reg =3D <0x7d504100 0x30>;
> +		};
> +
> +		pinctrl_aon: pinctrl@7d510700 {
> +			compatible =3D "brcm,bcm2712-aon-pinctrl";
> +			reg =3D <0x7d510700 0x20>;
> +		};
> +
>   		interrupt-controller@7d517000 {
>   			compatible =3D "brcm,bcm7271-l2-intc";
>   			reg =3D <0x7d517000 0x10>;


