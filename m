Return-Path: <linux-gpio+bounces-8551-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 242A0946399
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Aug 2024 21:12:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3AF631C20F68
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Aug 2024 19:12:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A54E31547CE;
	Fri,  2 Aug 2024 19:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="CeA1ZwOD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D5D1537A9;
	Fri,  2 Aug 2024 19:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722625952; cv=none; b=I/zpP5NvM4jW/A9Aju3L2OsEae5HcDOhIeJ/CZ7ZQRC6xfAwSPzPtt+MQSZreH4sH45B08/jZ7pIuq0yHONRhuEUdgZ52G6zfq4ZnXAIl997FrZMyFbSVOBbU+ix4Ilpa6qlo+sH3+Ovuy9Npa3D30if1wEiaouQiMsr6F1Z3do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722625952; c=relaxed/simple;
	bh=CToxwfXGPcpBvNii8aCFG2PEcIla5KTTvObYiEx6k3g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P17cSt6ctj/iIKhUxWTFXhribRDTRnazzRoMCKauo6uxlDZExA0JozwiCraMNICJ3DWN6WY+MDqCULf+wjGDpfWgPyU5QVP4sfNW0z4p0jOGHnyMDAOCwBgZHia+08Wryt3TTdWKYQF9IauQSY9/vGs2+h6mzCX70Tmfz/ZsHp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=CeA1ZwOD; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1722625937; x=1723230737; i=wahrenst@gmx.net;
	bh=cACq8POzeVPKWm+ZPB1eCcte4JvCIz4mpfswGtyHAB4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=CeA1ZwODxJNGZnQtBdZBxoHgWNQYc0lOJYiuvZImioyLq85viz9xLQuNGCoaiIOe
	 iQ4UIjZDogtMvewhPrR1nXk8pIufoYNxQ+zECJJNXE6kRiM/uUzTfIaMzYnM5qb+S
	 eB7le7h0pcFjLcTBMyXTf4mM12EMeTj/WENAWFOJ3w0xOlTGF7xV0qBTS23suyM59
	 tA3gPuNYyfb0toqLobQ4d0DKBoLa1CBvJX0LPTLwWA0ScqZFF1ftP4f5gnOAmhBnA
	 F3BjRnxgVQ1yYdvlrbB7zlHHbc8svJ4F6SglxzLtT6ILl58BgDoMQFfVlLnJMbAqJ
	 UYNovQdg9EMnBIC11w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MuDXp-1sEyq42ow9-013WQj; Fri, 02
 Aug 2024 21:12:17 +0200
Message-ID: <c707077c-4613-4747-9670-7e3f63737e25@gmx.net>
Date: Fri, 2 Aug 2024 21:12:16 +0200
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
Cc: conor+dt@kernel.org, florian.fainelli@broadcom.com,
 andrea.porta@suse.com, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20240731062814.215833-1-iivanov@suse.de>
 <20240731062814.215833-8-iivanov@suse.de>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20240731062814.215833-8-iivanov@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+hiv9AtbKkqMy0otADTLfBSTTDAB3Mt98UmyMWvwVRHRbf59yiU
 D9Ei4rVtVGjHSIY1/uRGKN+7Y04vR2k+hqHsE2wojfTb0lhr8ZrVfPpHFy4ONSWoEioZ5rF
 IXOulcV5riu4XoEe3D7RI4PVCtQtzjbxsQcSwvoMnSMlvbvyaLGkFhWkm9MDwQ97cLedHPg
 qPnQ2eoan+LZ7wX+R7GCA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:9NpHuX4pshU=;zwiZxcuFms/cBA4pKZ2HIct4Ubw
 051UzdjuhoG/a8MUvmz4Mr2SpF89O7yVQ/XZysj2Byx5u/WgvVwhgick8zyZWNWnGsjKC2b7S
 5/9c7ooWdRZslc8awpOO3RAExagNMWHCJnCfkBi/yAmd7jfBPsqgPQgBl0ymM81Eh/hXmhBA8
 21l/GBQ+cMAKA8SUakVZYWhjSUYR75G9xj+yZElydtAezWWZezIWMduMloEkrdzsYZPsvbzws
 pJ+zqI2UG5MYtiEXZUimTnnU/+a7Y9XhDmkeqVPkqVQ9DUdqas2HY/SvEYJIBm7maESKhmWoO
 uJJ5+TzROdGJk8MVoGHA9NsvfLr9Fpkf7IBc+yQ/Z+PGGGKRYRjEf9wIjpD2D5W/AY8OmYUZo
 dUJG6P8IeCPbmkZCgz/qgUJUS7oQf8K3FJQOLbZQVbZJr1onCgUWLma4WY20pMUGJHbjUjGVQ
 f6iLeg5a8QAY8MnuPoW5zJVMdyyDjYblWyFnTcIqAMDC1537eef/SfA/4j9w00U7vV6vl+thk
 5CX8AzOlsSUtJpZmkIy/VH34erOvoUnksEkZAB0aZIlSNIehwg6Ut2pz3M7cKSO/7NKgVJ1a9
 tfpCb0EQqkHiCp/I2ZgU8x7EJOiXzDOI61OH0GRJOQyoddpL8y1UkwW1GkwOA9hGEAOFVFZRK
 j8ILRt/2zTm+llfcZFzqRG5UO6Kri92ksD6ln955t43q9WwrUq/U8WZALgSd5k2hDAeBRo/zt
 S4hV4ZfTiLFBi5Jc/kmd0163Anh5U7QY3sHpcuRPRm7s2BkmUM7tiDZyBL+k1IJjKYhhxJa5/
 Ugx6ouIbUA+Fgod+0kJ+1FSg==

Hi Ivan,

Am 31.07.24 um 08:28 schrieb Ivan T. Ivanov:
> On RPi5 device Bluetooth chips is connected to UARTA
> port. Add Bluetooth chips and related pin definitions.
> With this and firmware already provided by distributions,
> at least on openSUSE Tumbleweed, this is sufficient to make
> Bluetooth operational on RPi5 \o/.
>
> Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
> ---
>   .../boot/dts/broadcom/bcm2712-rpi-5-b.dts     | 45 +++++++++++++++++++
>   arch/arm64/boot/dts/broadcom/bcm2712.dtsi     | 11 +++++
>   2 files changed, 56 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm=
64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> index b6bfe0abb774..a557cbd8ba17 100644
> --- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> +++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> @@ -133,11 +133,39 @@ wl_on_pins: wl-on-pins {
>   		pins =3D "gpio28";
>   	};
>
> +	bt_shutdown_pins: bt-shutdown-pins {
> +		function =3D "gpio";
> +		pins =3D "gpio29";
> +	};
> +
>   	emmc_sd_pulls: emmc-sd-pulls {
>   		pins =3D "emmc_cmd", "emmc_dat0", "emmc_dat1", "emmc_dat2", "emmc_da=
t3";
>   		bias-pull-up;
>   	};
>
> +	uarta_24_pins: uarta-24-pins {
> +		pin-rts {
> +			function =3D "uart0";
> +			pins =3D "gpio24";
> +			bias-disable;
> +		};
> +		pin-cts {
> +			function =3D "uart0";
> +			pins =3D "gpio25";
> +			bias-pull-up;
> +		};
> +		pin-txd {
> +			function =3D "uart0";
> +			pins =3D "gpio26";
> +			bias-disable;
> +		};
> +		pin-rxd {
> +			function =3D "uart0";
> +			pins =3D "gpio27";
> +			bias-pull-up;
> +		};
> +	};
> +
>   	sdio2_30_pins: sdio2-30-pins {
>   		pin-clk {
>   			function =3D "sd2";
> @@ -156,3 +184,20 @@ pins-dat {
>   		};
>   	};
>   };
> +
> +/* uarta communicates with the BT module */
> +&uarta {
> +	uart-has-rtscts;
> +	auto-flow-control;
> +	status =3D "okay";
> +	clock-frequency =3D <96000000>;
> +	pinctrl-0 =3D <&uarta_24_pins &bt_shutdown_pins>;
> +	pinctrl-names =3D "default";
Please add status here
> +
> +	bluetooth: bluetooth {
> +		compatible =3D "brcm,bcm43438-bt";
> +		max-speed =3D <3000000>;
> +		shutdown-gpios =3D <&gio 29 GPIO_ACTIVE_HIGH>;
> +		local-bd-address =3D [ 00 00 00 00 00 00 ];
Can we drop this?

Thanks
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot=
/dts/broadcom/bcm2712.dtsi
> index 3c0663dc6712..e972f94d6828 100644
> --- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> +++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> @@ -305,6 +305,17 @@ gio: gpio@7d508500 {
>   			brcm,gpio-direct;
>   		};
>
> +		uarta: serial@7d50c000 {
> +			compatible =3D "brcm,bcm7271-uart";
> +			reg =3D <0x7d50c000 0x20>;
> +			reg-names =3D "uart";
> +			reg-shift =3D <2>;
> +			reg-io-width =3D <4>;
> +			interrupts =3D <GIC_SPI 276 IRQ_TYPE_LEVEL_HIGH>;
> +			skip-init;
> +			status =3D "disabled";
> +		};
> +
>   		pinctrl_aon: pinctrl@7d510700 {
>   			compatible =3D "brcm,bcm2712-aon-pinctrl";
>   			reg =3D <0x7d510700 0x20>;


