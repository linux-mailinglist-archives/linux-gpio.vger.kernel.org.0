Return-Path: <linux-gpio+bounces-6675-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A108D05D3
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 17:19:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E4A50B25B98
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 15:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB0F1161B6A;
	Mon, 27 May 2024 14:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="vX3VhVkt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4395D17E91B;
	Mon, 27 May 2024 14:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716820026; cv=none; b=XoG28LPWR6+ZGGkpxD/Ct6ypPiMMwVyVHTPHc78R0nXiZ6lAswM88paNw1Mrux2LwExOutFOu3dm0zUsdwUe/QB+jR4rTFiT/UvT74yjEKv8zaVustNJWos69fIabdu4mZQztgGV9Q2aZifGM2fPu4whT69mwGGSL9mGdbtNogM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716820026; c=relaxed/simple;
	bh=TgeovkgpeOWUAlJ7eOdHzTn1cFUm/dVzU2NqObmFObU=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=rDWMMLz/FvwD0GuHTRuOPt0uWEScp+8G/YcwkLE70Ps1j61uDD5MRsF4pW6x05qE7ovPnsEbQmbG0AEC1Hs/poZ/p+wNXNOToHuAW/b2f+2Wjq2F+6ANZ6f/A2a1C86K8Rhc1z9dikVKawp7z68X9SCJNskzr+MSOBxw5E4lzbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=vX3VhVkt; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1716819939; x=1717424739; i=markus.elfring@web.de;
	bh=WBD5fZbJKASRGqCVJjwjF0/sBlA3tJ1is50PhfAuexQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=vX3VhVktvAsC3VEpXA8voazwMQsxjS3krCXirqMDaKAZ3hS5dLEBLJJcYH/CnQUD
	 LX884yPHk6T2CjcYkXrEWl3j7h+qjsuQr6krfiSjSbT9o7hELP6R1MOL3ePslfGIM
	 nUn+Cno9/WCN6Qt7tnw9wJkEH43RGHNxZEMJFx1wgs5oyZoUK9bL3MJfGys243Jnt
	 RWe1fGAwlia3NmWKjA9buWb62mNSN4PEffNKdBdV4ee2XJY9EETUDzwTlBNTo8KlT
	 kv2IvCfd4sTrUVWvA5STc6LBECDk34micjPSbDUs3ES7nw1m899uLKkS35frEPwr4
	 gv2XA0CeWBiz5oCAtw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mtgyj-1sV3WP3CJT-017EBc; Mon, 27
 May 2024 16:25:38 +0200
Message-ID: <96beb071-ec2c-475f-8fa2-d519a1b1dc28@web.de>
Date: Mon, 27 May 2024 16:25:18 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peng Fan <peng.fan@nxp.com>, soc@kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chester Lin <chester62515@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Damien Le Moal <dlemoal@kernel.org>, Dan Carpenter
 <dan.carpenter@linaro.org>, Dong Aisheng <aisheng.dong@nxp.com>,
 Dvorkin Dmitry <dvorkin@tibbo.com>, Emil Renner Berthing <kernel@esmil.dk>,
 Fabio Estevam <festevam@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 Hal Feng <hal.feng@starfivetech.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Jacky Bai <ping.bai@nxp.com>,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 Joel Stanley <joel@jms.id.au>, Jonathan Hunter <jonathanh@nvidia.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Orson Zhai
 <orsonzhai@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sean Wang <sean.wang@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
 Stephen Warren <swarren@wwwdotorg.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Viresh Kumar <vireshk@kernel.org>, Wells Lu <wellslutw@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org,
 imx@lists.linux.dev, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, kernel@pengutronix.de,
 Peng Fan <peng.fan@oss.nxp.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
References: <20240504-pinctrl-cleanup-v2-4-26c5f2dc1181@nxp.com>
Subject: Re: [PATCH v2 04/20] pinctrl: starfive: Use scope based of_node_put()
 cleanups
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240504-pinctrl-cleanup-v2-4-26c5f2dc1181@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+RyPoq5wWT0ZiaKtbHEM7oUjpYEVZsaQY6N7Y3GqAcCCbvu/2JH
 u2A1o9G2LZb7XdHLU3H69K/ZAgfhJvU9jxdpYiqAnNWG9BA1SqA6BdADoQmnmuaRrP6fAil
 8Vj3+benFoPx5AOFPUxJJt7XUQwXd4D4fxOV2u0S4nMX3GZIShaRs493PFfPvepvyAbRCtv
 sA0TyVvmVIL0Nk6+KE4zA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:31oKYLNiYt8=;Hxns51jU3fPbLxYZhS6Zxy9O8BL
 qcSJkc+8tI81FYEgYUDEjPFyxO5CsD0G4Yr1KM0HiJM1RAdO+budqXdzmwIJQJO5p6Qgg2nVe
 YKgM7j5yLFrWsSzyaik+NFTvY+PW6VUe11QHVHkDricbyYHE5P9qzbTg86+yeRiFSOOQZksg9
 Xdrs6r2eTX9AowMfEJqKIKNofU6TcDdmBmEh2hd5cMEugRlaO/xU/ubiYD/XRmfkiGEw2Tk9X
 NW8zaQg81GL2PPwft4f4poEafCoYwl+CIrmPHqURH/2YArZiC4UDm9VTu3lTVR8WSADgs2juL
 WzjmfuF3Nb/H8VSJqqzY977EL7BYu0JfjXhqczsj/AJHIU8x7U9FkHQwVLD+/aW9Q5b/a9OPw
 LI1zUhjAqpzjkl9ILHME5dfhA7gkD4YfqDP0iVyWu+VnmZh/pblaybHt4rD5ZI5OfaaxJKTej
 VGs+IMuQBrMttXj/4DWsuAy6tL2ASvq9ajbc+W4PfJFRO8eiyAiXlRr8A1ilG3Wwi2usEs8x0
 pyhK5u8Ye84ZDNXC0xiObkf3AMdCBhIc+0OAJbS7S/lr4Wa88XoId5G8Ib9v3q3Danb/+yyUK
 5YECHUaogBhuwKJTAPf6awFWX25sWIKFsuMiL9bOP098OSKsVamHNvrpo4VNiI2KTPlO3jYMF
 m4zC6H3fMiyTT6q5AwrZQbBuPo5FStw2mq46jULp/VkrI2I5mP81da+ZdY2nuNi0JHqnAsXYb
 nCNKXCaTB/N8hkFz1ZJ6BaXlj9tzCbHQ/4RlK/pJC38X/hUvhfMryOHSpF+68/zEebizBSnT2
 Xmop5HdbEWKcl91rEpyYcoeHY0XK5F3NVihbciHAlOag4=

> Use scope based of_node_put() cleanup to simplify code.

I see opportunities to improve affected function implementations another b=
it.


=E2=80=A6
> +++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
=E2=80=A6
> @@ -543,18 +540,18 @@ static int starfive_dt_node_to_map(struct pinctrl_=
dev *pctldev,
>  			pins =3D devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
>  			if (!pins) {
>  				ret =3D -ENOMEM;
> -				goto put_child;
> +				goto free_map;
>  			}
>
>  			pinmux =3D devm_kcalloc(dev, npins, sizeof(*pinmux), GFP_KERNEL);
>  			if (!pinmux) {
>  				ret =3D -ENOMEM;
> -				goto put_child;
> +				goto free_map;
>  			}
=E2=80=A6
> @@ -623,8 +620,6 @@ static int starfive_dt_node_to_map(struct pinctrl_de=
v *pctldev,
>  	mutex_unlock(&sfp->mutex);
>  	return 0;
>
> -put_child:
> -	of_node_put(child);
>  free_map:
>  	pinctrl_utils_free_map(pctldev, map, nmaps);
>  	mutex_unlock(&sfp->mutex);
=E2=80=A6
> +++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
=E2=80=A6
> @@ -175,18 +175,18 @@ static int jh7110_dt_node_to_map(struct pinctrl_de=
v *pctldev,
>  		pins =3D devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
>  		if (!pins) {
>  			ret =3D -ENOMEM;
> -			goto put_child;
> +			goto free_map;
>  		}
>
>  		pinmux =3D devm_kcalloc(dev, npins, sizeof(*pinmux), GFP_KERNEL);
>  		if (!pinmux) {
>  			ret =3D -ENOMEM;
> -			goto put_child;
> +			goto free_map;
>  		}
=E2=80=A6
> @@ -233,8 +233,6 @@ static int jh7110_dt_node_to_map(struct pinctrl_dev =
*pctldev,
>  	*num_maps =3D nmaps;
>  	return 0;
>
> -put_child:
> -	of_node_put(child);
>  free_map:
>  	pinctrl_utils_free_map(pctldev, map, nmaps);
>  	mutex_unlock(&sfp->mutex);


1. Exception handling is repeated a few times also according to memory all=
ocation failures.
   How do you think about to use a corresponding label like =E2=80=9Ce_nom=
em=E2=80=9D
   so that another bit of duplicate source code can be avoided?
   https://wiki.sei.cmu.edu/confluence/display/c/MEM12-C.+Consider+using+a=
+goto+chain+when+leaving+a+function+on+error+when+using+and+releasing+reso=
urces

2. Will development interests grow for the usage of a statement like =E2=
=80=9Cguard(mutex)(&sfp->mutex);=E2=80=9D?


Regards,
Markus

