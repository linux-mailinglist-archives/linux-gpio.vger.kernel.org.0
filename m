Return-Path: <linux-gpio+bounces-20333-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE57ABD59E
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 12:55:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE578177402
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 10:55:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13331272E64;
	Tue, 20 May 2025 10:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="f5OtOc+h"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4DD270EC3;
	Tue, 20 May 2025 10:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747738518; cv=none; b=YlPyy3IBJ+IbxeU8pajVq71j+Hi8NFqKoo0Emli3uEiFuENiAEYenX6dGq8ZC9Ym0S5+xnAoIb2+BsdW5snsLNoazHaO6iB6r8+6Cq+lu6kdx5hoXhinxyPYFQ/Gko13PgsuGRXvGqsgCMgrmbK/rQFTHdvRihT5HEzw8OHHMcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747738518; c=relaxed/simple;
	bh=Gc0wZ+bMJbD1feOCIgrzdzp2vokFyfBnADbbUlrcFdQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jjWqiOx6VfBLAczXj0hsSAHGXEkl1Z8BOimMPFsBg20a5vz66fzhpEf8GFJ5sb1nyqvAsojWyODB2SxoAxvImaEG5+FH2CNLXWqBzAjsqpzjYj2S1c8f+R2P93zJ0DUk9KDU8oIIuZWlxSidFscfHFssAGS8LHmrEWk1DcG8rho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=f5OtOc+h; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1747738492; x=1748343292; i=wahrenst@gmx.net;
	bh=TT2xkWfmRv0GSyyjB8NHPoKAs97BDlbBMy3S8w3PonU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=f5OtOc+hn1NjVYTN+ZPwGD2Qy/qnFTYq14Ld6LmqvIIQK5nDltkEg7zrL8AAhlQt
	 JKnRLbANzffZRjaSCQaSa0tyjdkba703usKpOuUecBHXBurPuPymcay1bpV0RtQzE
	 UVR53BcwfU/kx2sbKCPmOXy3k1dbBeENVJHvbd74vO6/mSj21Y56FWMg05Mm+6fe+
	 P2XYFV9wRAiVn6zX07tpXc6ehjqv5so99Y6MioH7YaGEAuIkjz7xg3zMiRYz1OQM/
	 tQGIV5fo9VhqyyodCcEDFiqQQej2vcTcx0MU13EjLLi21YJ5sd9XttFhhIil0vlYk
	 WuDD9Mv3mvn+oZNhkA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.105] ([91.41.216.208]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MRTRH-1ucPhm3Cwn-00O2G5; Tue, 20
 May 2025 12:54:51 +0200
Message-ID: <f0017caf-8fd7-4046-ab7c-71c6560b7a95@gmx.net>
Date: Tue, 20 May 2025 12:54:49 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] ARM: dts: add ngpios for vf610 compatible gpio
 controllers
To: Haibo Chen <haibo.chen@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, peng.fan@nxp.com, conor@kernel.org,
 Frank Li <Frank.Li@nxp.com>
References: <20250520-gpio-dts-v3-0-04771c6cf325@nxp.com>
 <20250520-gpio-dts-v3-2-04771c6cf325@nxp.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <20250520-gpio-dts-v3-2-04771c6cf325@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xrkl7NJAqZnlTaTEnX/cpkGwTW+zKvSKuh/hDiAPK7+MOCaf2yi
 1LSOS8uyvmobKOQO4SbcnnT2r6QgfpWyxp+PllMX8Oh98+98AMlHVGYF8t37PPv/twH0Yhb
 aYpgIdqZw0RWW50rnjO87u6w/9vC4NDNMH1cxFFq/HynPB+bN1dKvao5Q28BVKNO4KgKzvo
 ZFSgwTWU9lIullCEOTZNw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ssFXhHaeEuM=;Gx4eRypxVFkb9GRqF9fl4ZVUEQu
 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
 1XEpMxhRDAL0s2dT

Hi,

Am 20.05.25 um 05:46 schrieb Haibo Chen:
> After commit da5dd31efd24 ("gpio: vf610: Switch to gpio-mmio"),
> the vf610 GPIO driver no longer uses the static number 32 for
> gc->ngpio. This allows users to configure the number of GPIOs
> per port.
>
> And some gpio controllers did have less pads. So add 'ngpios' here,
> this can save some memory when request bitmap, and also show user
> more accurate information when use gpio tools.
sorry for asking this dumb question: why do we need the redundant ngpio=20
property in case there is already gpio-ranges defined? AFAIU the last=20
cell already contains the necessary information. Or do I missed something?

Best regards
>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> ---
>   arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi | 4 ++++
>   arch/arm/boot/dts/nxp/vf/vfxxx.dtsi    | 5 +++++
>   2 files changed, 9 insertions(+)
>
> diff --git a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi b/arch/arm/boot/dts/=
nxp/imx/imx7ulp.dtsi
> index 3c6ef7bfba60986b797bb01b843830d364c96d45..880b9a4f32b0846a773dbf9a=
d30715c84ac2fda6 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
> @@ -399,6 +399,7 @@ gpio_ptc: gpio@40ae0000 {
>   				 <&pcc3 IMX7ULP_CLK_PCTLC>;
>   			clock-names =3D "gpio", "port";
>   			gpio-ranges =3D <&iomuxc1 0 0 20>;
> +			ngpios =3D <20>;
>   		};
>  =20
>   		gpio_ptd: gpio@40af0000 {
> @@ -413,6 +414,7 @@ gpio_ptd: gpio@40af0000 {
>   				 <&pcc3 IMX7ULP_CLK_PCTLD>;
>   			clock-names =3D "gpio", "port";
>   			gpio-ranges =3D <&iomuxc1 0 32 12>;
> +			ngpios =3D <12>;
>   		};
>  =20
>   		gpio_pte: gpio@40b00000 {
> @@ -427,6 +429,7 @@ gpio_pte: gpio@40b00000 {
>   				 <&pcc3 IMX7ULP_CLK_PCTLE>;
>   			clock-names =3D "gpio", "port";
>   			gpio-ranges =3D <&iomuxc1 0 64 16>;
> +			ngpios =3D <16>;
>   		};
>  =20
>   		gpio_ptf: gpio@40b10000 {
> @@ -441,6 +444,7 @@ gpio_ptf: gpio@40b10000 {
>   				 <&pcc3 IMX7ULP_CLK_PCTLF>;
>   			clock-names =3D "gpio", "port";
>   			gpio-ranges =3D <&iomuxc1 0 96 20>;
> +			ngpios =3D <20>;
>   		};
>   	};
>  =20
> diff --git a/arch/arm/boot/dts/nxp/vf/vfxxx.dtsi b/arch/arm/boot/dts/nxp=
/vf/vfxxx.dtsi
> index 597f20be82f1ee044e14bfaf3bd05cff37a8ad39..a275821c35d41e97eb2139a0=
81ef5765d07672aa 100644
> --- a/arch/arm/boot/dts/nxp/vf/vfxxx.dtsi
> +++ b/arch/arm/boot/dts/nxp/vf/vfxxx.dtsi
> @@ -318,6 +318,7 @@ gpio0: gpio@40049000 {
>   				interrupt-controller;
>   				#interrupt-cells =3D <2>;
>   				gpio-ranges =3D <&iomuxc 0 0 32>;
> +				ngpios =3D <32>;
>   			};
>  =20
>   			gpio1: gpio@4004a000 {
> @@ -329,6 +330,7 @@ gpio1: gpio@4004a000 {
>   				interrupt-controller;
>   				#interrupt-cells =3D <2>;
>   				gpio-ranges =3D <&iomuxc 0 32 32>;
> +				ngpios =3D <32>;
>   			};
>  =20
>   			gpio2: gpio@4004b000 {
> @@ -340,6 +342,7 @@ gpio2: gpio@4004b000 {
>   				interrupt-controller;
>   				#interrupt-cells =3D <2>;
>   				gpio-ranges =3D <&iomuxc 0 64 32>;
> +				ngpios =3D <32>;
>   			};
>  =20
>   			gpio3: gpio@4004c000 {
> @@ -351,6 +354,7 @@ gpio3: gpio@4004c000 {
>   				interrupt-controller;
>   				#interrupt-cells =3D <2>;
>   				gpio-ranges =3D <&iomuxc 0 96 32>;
> +				ngpios =3D <32>;
>   			};
>  =20
>   			gpio4: gpio@4004d000 {
> @@ -362,6 +366,7 @@ gpio4: gpio@4004d000 {
>   				interrupt-controller;
>   				#interrupt-cells =3D <2>;
>   				gpio-ranges =3D <&iomuxc 0 128 7>;
> +				ngpios =3D <7>;
>   			};
>  =20
>   			anatop: anatop@40050000 {
>


