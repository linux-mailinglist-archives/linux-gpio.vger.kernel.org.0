Return-Path: <linux-gpio+bounces-11529-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 130149A21EF
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 14:14:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1BBA281E29
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 12:14:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03EF41DD0EA;
	Thu, 17 Oct 2024 12:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="fL4A1oEs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1C21D416B;
	Thu, 17 Oct 2024 12:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729167280; cv=none; b=QNAqx7HFICdZ4Q4n/NjG385znMut1VoNVKHB8nYFniNOpmtRkckC3FkYAr/TrSqYzl/Hby3oU4g5Wdskr8xTGF3KoHy4Uln8ufMGjtbY+MrsZ3Jadaql3MjP/YbI3BcMlGrvHJ1MQ0OQdAVN4vdjSc9+DoGId1ZB2wzHYTRoAtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729167280; c=relaxed/simple;
	bh=MQjWC9R68FIC4n96k+Qsw6MRHboxnulPNKMAka25G88=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vB3x3z9ZJjcZRdqqa2Zp25BJ+AOezzIoo3DG5EyOjcpq0i+qrNRCtEosA/9sh7Cp/Zs19Ml6VI+YMYpPFClMBqM+QGf4xtKmSIjskvoXxTlw2H25mcaSo29G8vdPsgLxYiFeUS+wG4L3tJZCN3fH4h9nbai+iGy4iiTZgSNuhCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=fL4A1oEs; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1729167250; x=1729772050; i=wahrenst@gmx.net;
	bh=gBB3aiL4SNubJk9xPUE27U3qzet/MkpBlhhNCDKANgA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=fL4A1oEsAjgrCR6A6CTaTB63plKqmnYAPLuB7MXkjKglX4e/wHMitePOUYbcNPPy
	 +VU6+XL6s2Sis7pSH6GY/oigxv9SyCJhAvIPIJZjFmPjDj58XjOJiYRweOGTM37sM
	 VqR5RqgGPHnYdTRRb/NhnCwrrgQ5McvMzzWbPSYqW0Az9gY0qPeDL+C94OSE8zVNQ
	 rbPhTOCh2oCzPxeZTHcwhKurDy0rptNz1Wamvw0xOwjSdLgaupvqWwCnpgrGvien7
	 zuDqj1pIUmzD//tR+RQ/vW8MzBjVZM1vwUUshgkB0KB7y1oEm73CutWULDvfs5Az/
	 NwJFZ4Vymx9OiK+MBQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.104] ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MTABZ-1tVoSL0u2J-00YboN; Thu, 17
 Oct 2024 14:14:10 +0200
Message-ID: <aa21db7a-5b05-4529-ba75-e2111e9e6362@gmx.net>
Date: Thu, 17 Oct 2024 14:14:09 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/12] ARM: dts: imx6ul: Align pin config nodes with
 bindings
To: Marek Vasut <marex@denx.de>, linux-arm-kernel@lists.infradead.org
Cc: Conor Dooley <conor+dt@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>,
 Fabio Estevam <festevam@gmail.com>, Jacky Bai <ping.bai@nxp.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, kernel@dh-electronics.com, linux-gpio@vger.kernel.org
References: <20241017000801.149276-1-marex@denx.de>
 <20241017000801.149276-12-marex@denx.de>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20241017000801.149276-12-marex@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:RDxKxPnSLngw8cBz3AOu1b1RiK7KyyptKl9OeDWpb+WZurIxpNV
 H4kj+3HWKnFW2QWjIlXUILuiY6zzIzP7TdVI4Yuw8NyeCo7QYeBBPXheHUcIi3bkB3WO8Fa
 B+F19j7EHyQQPl+xONF01dfEaY+7oRDTzHL1RRze1PVcpDGfTPIcBlEHjwYYJ6pCiOH2mXJ
 FlsG5WAcnUz4cB6DtvK7w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:UTjQc5B7Bpw=;G2tLoMv1rCgcbPtPfr1vTQYR9xi
 Zb9og38yedcImscRivBGRZH2E6cFO+OW5Ng0kpMcrnBk0Kf/Ft/DbN7pCaypL28L6n1p0sXQc
 iZHe3NhWAAOQqPLjtdFuVJ7yL1Ux0lWKnZPkginFUuOWHwB1NXnXV0zcUxcyIuUaBdAklt+lz
 sZ77/7oyh4mSOAAOE3IKRsprQwsAhAaJTRjNiWuqdesXnqfwzG7pDRKxSAF69hnMZGCKP1NEb
 ljD7GHqANdUfrk+09+O4AGFJGFf7a/oJ5zz+8NUhjqGeoeXtuChrhkGD0xShkh3JeVUCtLG13
 xcyyqtH2sCXqucGLuHqntVRxPWDH9S4LGzEPkwkfxWYFXalycBqufLZA0SdeijCSZzq0kvjj1
 WatYRkVx3uxxEKzfPr2TXg0QdPt/oiQXnZAnlr75T6HypHTwzr36DnfgOefEUett1+ALmOY/r
 hkyrke/2I4SaheIekPRoetUdra5aF6x4If666eyPCYSASxOp6aXHiBs3Wc3lWLi37U/les2Hp
 pkWqGU+hKRvGUXzyiK4y8bIW5ncxJelbqFkkyKNW0v6D4GSmy6Eab9KnhtpLw83K8Bw8peNbH
 WLDSyKr6MyyNz/US84mbM7mTwRwpW5CBKUGufujMBG0J8AspPHsIhOIFKZp0NWlZ7VOMJ0RCJ
 FaOyo7VQvGG4RGDP5oybw9IvEkMQo2tJIdMUCFUnHAmFOvtY6lzA9IlQBFofPDZgyTGxroQ5Q
 g4ze3I+Pe0gS3ifT6i8dKtCFeIKgneYCkNbyfW8jbigNrWVHef+Ovk5mkoVTBp++MsDrDwkcK
 a6NFWKAUe1XkAk6L9deQzHLg==

Hi Marek,

Am 17.10.24 um 02:06 schrieb Marek Vasut:
> Bindings expect pin configuration nodes in pinctrl to match certain
> naming and not be part of another fake node:
>
> pinctrl@30330000: '...' does not match any of the regexes: 'grp$', 'pinc=
trl-[0-9]+'
>
> Drop the wrapping node and adjust the names to have "grp" prefix.
> Diff looks big but this should have no functional impact, use e.g.
> git show -w to view the diff.
thanks for addressing the YAML conversion, but this specific commit
message doesn't seems to match the change?
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Dong Aisheng <aisheng.dong@nxp.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Jacky Bai <ping.bai@nxp.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-gpio@vger.kernel.org
> ---
> V2: New patch
> ---
>   arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi b/arch/arm/boot=
/dts/nxp/imx/imx6ul-isiot.dtsi
> index 118df2a457c95..4c09bb3126966 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi
> @@ -322,7 +322,7 @@ MX6UL_PAD_JTAG_TRST_B__SAI2_TX_DATA	0x120b0
>   		>;
>   	};
>
> -	pinctrl_stmpe: stmpegrp  {
> +	pinctrl_stmpe: stmpegrp {
>   		fsl,pins =3D <
>   			MX6UL_PAD_UART1_CTS_B__GPIO1_IO18 0x1b0b0
>   		>;


