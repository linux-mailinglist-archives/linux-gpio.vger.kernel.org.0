Return-Path: <linux-gpio+bounces-8548-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F5094635C
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Aug 2024 20:49:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0415F2836FF
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Aug 2024 18:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECB3213634B;
	Fri,  2 Aug 2024 18:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="aiZGdrs+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E22A1ABED5;
	Fri,  2 Aug 2024 18:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722624582; cv=none; b=HH/L+nRT87fS8he1KlQCxWCGqobQ5wyJ1bV/I31SeOLr5qBLgAS4hGSpZvDERZnzYH2FslmWOSYdKUySvyQ786uc+Wckcbzdc4juJdNiGydHlAeRuHocv/u6NvVbO9ezpJMTaxQnHo91OTrnPLYLKbrUFHKVUflCXugjuJ+K6I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722624582; c=relaxed/simple;
	bh=YlLbec5tzFC+CXZeWPzilYZky4c35KY8+OuU1U4wedA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Us+Dj2IHgd8jC8rbfPwht4FupcT2BKujF1QGUgtpwU8wP4Ii4F1uYWuNZkgR1XIx1nu9NKCGX49sPzGLaDOdem6mAqXcst2ej+bzVxGY6R7R1980LEYBlp95YVSrh/5xBm8PyaSw4O/aEOdDvZNU6Z/GqrZkzBEIRh/wPq3ySPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=aiZGdrs+; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1722624567; x=1723229367; i=wahrenst@gmx.net;
	bh=yKFEbsvONCzrWplTLtZNVYUF0HvZfNBvLPfj2eWeBxE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=aiZGdrs+G/SHqsTK2kCqzEtHu4ZAbJERMYK1iYwdYQ5femgEO/Fue3gBgWdCJU2/
	 ptQw8Z7lOyU66ftNsF5WcLOdYUS88f3p3+ygVPupCwwcgaiiJm0mcWdMRz+oan1iy
	 k8zgvX7UU6R2vz6LiNiEjGe1zMzBkVteu7cwt7llvH5qRYftsNgCx0BoWgPWdTSIh
	 pgtybmX3zBGtDkilf6BMBXuINHxTzVzCxjyBMLcb1hkHjY6Qv0q8hj5GYVNkTdqgH
	 EEudLC2WC0tySIY8BUdLF8wSt29IksL2wHcPGegaQRdmwr6ubVqihf0QSJxdGxL1C
	 j5Dqx4WKOC3KeK0rXg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MWzjt-1skiz93mFl-00LH7X; Fri, 02
 Aug 2024 20:49:26 +0200
Message-ID: <931526c6-5605-4478-b292-d8a38b981ad2@gmx.net>
Date: Fri, 2 Aug 2024 20:49:26 +0200
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
Cc: conor+dt@kernel.org, florian.fainelli@broadcom.com,
 andrea.porta@suse.com, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel-list@raspberrypi.com
References: <20240731062814.215833-1-iivanov@suse.de>
 <20240731062814.215833-6-iivanov@suse.de>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20240731062814.215833-6-iivanov@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4tgInytnWi2oVIwNQZFzSnRnhFXZXttU8h+SFwzhYcQaB1SUTON
 0hRRu3je9oPvxlIbwFn999Q95MihaEw4ugbfmAVSNxcLU2CbLv5UAfu+AnJH8/a0f4H4Xd7
 h9eY77LN8l7hLGL47wpEzm1LR6L4y4nOLPwqWcVGQWaX9Ieadzq8U/2J5oWeZKrU8hseJ8+
 2ADwzbvlOq94GIw2Iq65Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Y79y+fvv7wI=;g/0AgLp0zau7l9xWe4DPMqN88dg
 TF6E7zSC0oWaFP3MjjnvM5+eSSApG7ivRNpHnxAl2r/Mmi8IuotNPUIsdcr+4h5Z6c9WvPSej
 YT6dsnzbWlI22/vEPQ6hZjlkvQmh440RUd86M5WgCWR3UWvkxHW6KhxE1zmc8lNnEHn9ebYKd
 LeHJZSB/s5gIVY/zwt497kXpf5tlLTs9lIqdE54FEJXvvQgb1RHNJLpMbPeE38uuXElKDu4nd
 J/PnxxI6ZlrumbsCK4w9P2MZFJKD5353ShCxDF68ZyATWagXTB6jQ/RKO+MwdGujUcbxr8DAk
 rMcT4RMFbFoXFUMdVfX+s+668s1kefOxt75d2BpJTLyyH5cuTOA9R8/rlrrGGQqeWdysQADEK
 zo2O1TMyvikhkrCI/Te357h3nP2BquLg15RlgmJZTrOdpdwiC7G9kdcxjRBiew56wYxYNdzgh
 4DTPmczpyEhawFP/93+6jZE2dB2OijoruvALMVXN2qZ58/SfGcoCkkx5wgeybEsSGWJYsNTR1
 GXYXrDDl1OIiT3NB6gB1WByIj9MP9EGqPQ8Bm87NaBM2+ASHdkt95VLKFosswT9wOnhfMAWyy
 yv6Wt2G7EPIUqwR4N+Kvq7N8SinW6p0gyU6PDg68uR3URcxmu68Wrrx+69AOZe00bghKDUDIN
 0v8hYkQQuNYrlxV3y02HFEZZCtvoZ8jehA8VFTvn4gLxkQw+cjDEGwm0Cw8gTpJd7y2VpEQfn
 qQJXBzfSCHxAlQ2l51eMho6/K1jHR0zA7Z7cFGrLGuEcbXtd82L2QQxtQX9X2933RA1MMuzTG
 7ebT0sw/U00w7Da8M+ZVOytQ==

Hi,

Am 31.07.24 um 08:28 schrieb Ivan T. Ivanov:
> Add GPIO and related interrupt controller nodes and wire one
> of the lines to power button.
>
> Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
> ---
>   .../boot/dts/broadcom/bcm2712-rpi-5-b.dts     | 21 +++++++++++++++++++
>   arch/arm64/boot/dts/broadcom/bcm2712.dtsi     | 21 +++++++++++++++++++
>   2 files changed, 42 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm=
64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
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
>   		gpios =3D <&gio_aon 4 GPIO_ACTIVE_HIGH>;
>   	};
> +
> +	pwr-button {
gpio-keys
> +		compatible =3D "gpio-keys";
> +
Please drop the empty line
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pwr_button_pins>;
> +		status =3D "okay";
> +
> +		pwr_key: pwr {
power_button: power-button

or do we need keep the reference name for compatibility?
> +			label =3D "pwr_button";
> +			linux,code =3D <KEY_POWER>;
> +			gpios =3D <&gio 20 GPIO_ACTIVE_LOW>;
> +			debounce-interval =3D <50>;
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
> +		function =3D "gpio";
> +		pins =3D "gpio20";
> +		bias-pull-up;
> +	};
>
>   	emmc_sd_pulls: emmc-sd-pulls {
>   		pins =3D "emmc_cmd", "emmc_dat0", "emmc_dat1", "emmc_dat2", "emmc_da=
t3";
> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot=
/dts/broadcom/bcm2712.dtsi
> index 1099171cd435..39d2419ffce2 100644
> --- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> +++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> @@ -271,6 +271,27 @@ pinctrl: pinctrl@7d504100 {
>   			reg =3D <0x7d504100 0x30>;
>   		};
>
> +		main_irq: intc@7d508400 {
> +			compatible =3D "brcm,bcm7271-l2-intc";
> +			reg =3D <0x7d508400 0x10>;
> +			interrupts =3D <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-controller;
> +			#interrupt-cells =3D <1>;
> +		};
> +
> +		gio: gpio@7d508500 {
> +			compatible =3D "brcm,brcmstb-gpio";
> +			reg =3D <0x7d508500 0x40>;
> +			interrupt-parent =3D <&main_irq>;
> +			interrupts =3D <0>;
> +			gpio-controller;
> +			#gpio-cells =3D <2>;
> +			interrupt-controller;
> +			#interrupt-cells =3D <2>;
> +			brcm,gpio-bank-widths =3D <32 22>;
> +			brcm,gpio-direct;
> +		};
> +
>   		pinctrl_aon: pinctrl@7d510700 {
>   			compatible =3D "brcm,bcm2712-aon-pinctrl";
>   			reg =3D <0x7d510700 0x20>;


