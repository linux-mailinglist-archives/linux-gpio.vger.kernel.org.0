Return-Path: <linux-gpio+bounces-8549-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D5667946382
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Aug 2024 21:01:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F277C1C20E45
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Aug 2024 19:01:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B6F54501F;
	Fri,  2 Aug 2024 19:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="cPkwcxYB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AE51ABEBD;
	Fri,  2 Aug 2024 19:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722625297; cv=none; b=Y3v63f/1VioiNzmNZu72AFg4iV97xDe/WY9KGO20OKDE0wYwoKhVgMWWGms85VciBYSm+PFzehU9krFHbMoFIL5Le+aRDOjJCyO3SScl0YE+jAAvzQrMuqjgQcUBRuwEKkVoNEG5ufJuIDcr0m/LpFyGILKHZnxLYctm9e9YI1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722625297; c=relaxed/simple;
	bh=m4ddB4rsTRuupZpGEaN8AxwxkPYwteLPxGdcYn3auDQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uesqjl2eGD9jXaUrrDRvtn1iV/Q170+/Nm3uXkwYA/8xaA2v/uupvevT1mKYbwc4guj4UzeU9TKRNaBTwZy3Xrjj1TscoJqzgcrXH7HiDRZ2Y+qf8066E8EmAZLzHdGuYYI3kMDri4f7M3naO+3FJqrc4ND4hUDF9UAtelLo2pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=cPkwcxYB; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1722625280; x=1723230080; i=wahrenst@gmx.net;
	bh=cmZtW4z3+5zAp0RyJa+5tKDRhJVBaffihrxfdv7gB7Y=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=cPkwcxYBT4/NekaOzo0SjRjYIsXbzgA9J2FmkuNkYO1JKS6lrH8YnD4U6zfX1SDJ
	 2qSoeluAREOwICVMouJHyyFvWsOm/yfXfrzclzEAXGcgdK7rgzsW0daoBFK0xZMBN
	 GWdP54clk0L60iXJ5GbbZPCPNyl7/BCKsK4AtZcWcACISLY92rNN0zrfVTLgKcv/0
	 xAYvuoKdt0pTHeGuYbX0Rp9ovpSu9h+VaANUsXojEimJUHKNM+MrMd/uTg1cmxCiZ
	 mn3D4DljGYdDlaRxhybViYS7uPw6UGhMynrP21y0fiqraS5Yu0785LyxuWY29zmVY
	 n7+VNFgjHK6J7FNM8A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MvK4f-1sII7N2GdV-015cSI; Fri, 02
 Aug 2024 21:01:20 +0200
Message-ID: <a563971a-45f4-4404-a622-21c940d96250@gmx.net>
Date: Fri, 2 Aug 2024 21:01:19 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] arm64: dts: broadcom: bcm2712: Add second SDHCI
 controller node
To: "Ivan T. Ivanov" <iivanov@suse.de>, linus.walleij@linaro.org,
 robh@kernel.org, krzk+dt@kernel.org
Cc: conor+dt@kernel.org, florian.fainelli@broadcom.com,
 andrea.porta@suse.com, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Arend van Spriel <aspriel@gmail.com>, kernel-list@raspberrypi.com
References: <20240731062814.215833-1-iivanov@suse.de>
 <20240731062814.215833-7-iivanov@suse.de>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20240731062814.215833-7-iivanov@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZBct3ZB2NKizT0zTbd9oUjtIuLa2U4vahi6ANzm2jr5TUedsPbZ
 3UUD/I+R/BZnjjJxJcM8W3yJ2hteWP4nxzaKFRf6WDrof5Rk4R2tIjes90uKKKk1TQkAkvn
 3qXsLUuUTBKaZtAkFbRRvkGDpS/UANdre2kfisSTP0Tz89vyRz1wjcLOfN7kg0vXYI0+ekc
 TpHWczXF9uBzM+d0XhyFA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:jKh8kT8EJs4=;Gcyw09q3FghaZtYwuAgBCvQD0wT
 kUPkGYipAUFaQNMhvEpyY4HykuFhGFaye+pefHaXo5pUaBu18qnDf/Gl/Puqf6/ibl/8SN4cw
 fh/wHIgSvEbZNrROMPi6CyC50rpHyqwvrnXyku6/MtfeqEhdTTlFFAEl/XaoYfFpSXmuvJDMv
 qBtwgHOBf8LlDUQXTW/i5x6u/mDave0mqFcMMpVZs8TGzcfbCaGV1CvJaCDwP/HmA6G/2wzAW
 bl9P4QRDn1+hgCDCGwSlyCw51hGMPa3waHRaM3s7M5du+E0/P/YvUWssowm8+J0tpMGO0YCOn
 WQV1oA2HHBHesRSnQ4izMJCfS8q+ANpsZdQ5yA7yto5OEOIKCzfvNO+ClI35u1tOj8Tt0W/lT
 ABqItJBHr9reku2CkhSmQFLrDPi9QPCQSBPKS1cfHOS0GKbCuBcB9wUA5n1oJGR0RS5w9pvE7
 77YR7XwzsYkwbYk746DveM/1RYAum14FXFcfuGJoaDB8f5Wm2Ol/vxZm7439ENeZVLdAnHy2p
 sZNaRYIDKO0aAKBmxEIO1A3YVRjCVnq9DdeaN1XEBV9UvRSyXeBOebK3OheQi6Qz3/0f2K1Z5
 VEa1xpbiUWpKfqyZWyPpE9MQx+Zkg2o59UOfWMp31LrK9MxgD90hj6pW6Jlhzv/Yl9U9VA3kr
 RCEXnCoA7cn9jmlFrfukOIyZ0D2hVlQgbOqF1pfsRcxRB9dkz7cgUD32b7Zmpnf4IsXE8846P
 s22dsPb0K7DpI+LaPJSATjWjErkzg+theJK4gJOpo5rJg6qBDpV1b2SrNRZCyzT3hCgvNTz5B
 p95sv2FtKfEpPvuJ3Yc7tN5g==

Hi,

[add Arend and Raspberry Pi devs]

Am 31.07.24 um 08:28 schrieb Ivan T. Ivanov:
> Add SDIO2 node. On RPi5 it is connected to WiFi chip.
> Add related pin, gpio and regulator definitions and
> add WiFi node. With this and firmware already provided by
> distributions, at least on openSUSE Tumbleweed, this is
> sufficient to make WiFi operational on RPi5 \o/.
>
> Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
> ---
>   .../boot/dts/broadcom/bcm2712-rpi-5-b.dts     | 55 +++++++++++++++++++
>   arch/arm64/boot/dts/broadcom/bcm2712.dtsi     | 13 +++++
>   2 files changed, 68 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm=
64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> index 06e926af16b7..b6bfe0abb774 100644
> --- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> +++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> @@ -46,6 +46,20 @@ sd_vcc_reg: sd-vcc-reg {
>   		gpios =3D <&gio_aon 4 GPIO_ACTIVE_HIGH>;
>   	};
>
> +	wl_on_reg: wl-on-reg {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "wl-on-regulator";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		pinctrl-0 =3D <&wl_on_pins>;
> +		pinctrl-names =3D "default";
> +
> +		gpio =3D <&gio 28 GPIO_ACTIVE_HIGH>;
> +
> +		startup-delay-us =3D <150000>;
> +		enable-active-high;
> +	};
I don't think this GPIO is a regulator from hardware perspective. I
guess it's the same reset pin we have on the older Raspberry Pis. Please
look at bcm283x-rpi-wifi-bt.dtsi for the wifi power sequence.
> +
>   	pwr-button {
>   		compatible =3D "gpio-keys";
>
> @@ -80,6 +94,25 @@ &sdio1 {
>   	cd-gpios =3D <&gio_aon 5 GPIO_ACTIVE_LOW>;
>   };
>
> +/* SDIO2 drives the WLAN interface */
> +&sdio2 {
> +	pinctrl-0 =3D <&sdio2_30_pins>;
> +	pinctrl-names =3D "default";
> +	bus-width =3D <4>;
> +	vmmc-supply =3D <&wl_on_reg>;
> +	sd-uhs-ddr50;
> +	non-removable;
> +	status =3D "okay";
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +
> +	wifi: wifi@1 {
> +		reg =3D <1>;
> +		compatible =3D "brcm,bcm4329-fmac";
> +		local-mac-address =3D [00 00 00 00 00 00];
I think we can drop this?
> +	};
> +};
> +
>   &pinctrl_aon {
>   	emmc_aon_cd_pins: emmc-aon-cd-pins {
>   		function =3D "sd_card_g";
> @@ -95,9 +128,31 @@ pwr_button_pins: pwr-button-pins {
>   		bias-pull-up;
>   	};
>
> +	wl_on_pins: wl-on-pins {
> +		function =3D "gpio";
> +		pins =3D "gpio28";
> +	};
> +
>   	emmc_sd_pulls: emmc-sd-pulls {
>   		pins =3D "emmc_cmd", "emmc_dat0", "emmc_dat1", "emmc_dat2", "emmc_da=
t3";
>   		bias-pull-up;
>   	};
>
> +	sdio2_30_pins: sdio2-30-pins {
> +		pin-clk {
> +			function =3D "sd2";
> +			pins =3D "gpio30";
> +			bias-disable;
> +		};
> +		pin-cmd {
> +			function =3D "sd2";
> +			pins =3D "gpio31";
> +			bias-pull-up;
> +		};
> +		pins-dat {
> +			function =3D "sd2";
> +			pins =3D "gpio32", "gpio33", "gpio34", "gpio35";
> +			bias-pull-up;
> +		};
> +	};
>   };
> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot=
/dts/broadcom/bcm2712.dtsi
> index 39d2419ffce2..3c0663dc6712 100644
> --- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> +++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> @@ -27,6 +27,19 @@ sdio1: mmc@1000fff000 {
>   			mmc-ddr-3_3v;
>   		};
>
> +		sdio2: mmc@1001100000 {
> +			compatible =3D "brcm,bcm2712-sdhci";
> +			reg =3D <0x10 0x01100000  0x260>,
> +			      <0x10 0x01100400  0x200>;
> +			reg-names =3D "host", "cfg";
> +			interrupts =3D <GIC_SPI 274 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&clk_emmc2>;
> +			sdhci-caps-mask =3D <0x0000C000 0x0>;
> +			sdhci-caps =3D <0x0 0x0>;
> +			mmc-ddr-3_3v;
> +			status =3D "disabled";
> +		};
> +
>   		gicv2: interrupt-controller@107fff9000 {
>   			interrupt-controller;
>   			#interrupt-cells =3D <3>;


