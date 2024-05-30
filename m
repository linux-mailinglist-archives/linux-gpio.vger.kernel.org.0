Return-Path: <linux-gpio+bounces-6933-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F0C8D48CC
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 11:42:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C6A9282A3F
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 09:42:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EA2614E2F5;
	Thu, 30 May 2024 09:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="udMzgw2m"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A056F30E;
	Thu, 30 May 2024 09:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717062125; cv=none; b=IS0qPFOJgmMhvbwK19qi/8G0DFnMJS/pwYTaPixp516KkDyzIaeIb0o/BkNmLbIT6JlgXVLUYF4SfU8OVs8ATJIh4PJ8Roh695sL0CgMfqJ09OKvZVQoh1qeJ7aeUzgOyVRM/0s7MaK1SzI7+Oh8oMt2Ous86r6/33bSpyD5Dp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717062125; c=relaxed/simple;
	bh=XWOyTPNcAS3edgj78RlRWWnGHomKwyWonS/ztRducKI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L2Wb4NTbKLJt1dlsJAZKNCHO/OtnAX1Omb9r3CHn6KAMk7nOE2N+OG3gCDQys0mIxInPhfWzmuURIQZwpcQJYySVnki2bUOABpKKKMIk7PuDXzBRQplYeHO8mJqFBVMzD65ZJL5d/NYUJ9SNfYSBAKa6dnpxp26gEccHz5mHARg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=udMzgw2m; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1717062046; x=1717666846; i=markus.elfring@web.de;
	bh=oezbfXsbeaJmwShGUCb+ixc9diIxCFrcJK9McEzg11Q=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=udMzgw2mYVlwtItRnGV35f3oiE0Oyr3q2Wai5rVR1uBx+YWZq6DJmUB0HJFO7gEg
	 zHtbjKeZbMdYQsvdMYg12nG+ChB1GmTP1PGCuWx+tCMS5rZiC1+duXb/jiHwkzB4j
	 syiNZ4mlPm2DiiQ8XjEzFyur696yPd4GXRrreI0h/3tcHoAlAFA1sIbSh3Kt6TiAA
	 D9LJeu9MW5T1g3BLn1VuEErohRJsWwSGlebj9XoGNB0KuJ815IRkZ8rWBx1cMjYYU
	 hdIoDl2VHExhUzdr+Mva/03BzeBESiNQo93VyYKqajOHhSFQ0saGgjsPwp5aj9MhI
	 3c9cFdagTRHOvih9Ig==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MP384-1rpSiH3liG-00XcMK; Thu, 30
 May 2024 11:40:46 +0200
Message-ID: <5a2f7786-bb02-441a-a60e-a7a548a30a79@web.de>
Date: Thu, 30 May 2024 11:40:21 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2 04/20] pinctrl: starfive: Use scope based of_node_put()
 cleanups
To: Peng Fan <peng.fan@nxp.com>, "soc@kernel.org" <soc@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chester Lin <chester62515@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Damien Le Moal <dlemoal@kernel.org>, Dan Carpenter
 <dan.carpenter@linaro.org>, Aisheng Dong <aisheng.dong@nxp.com>,
 Dvorkin Dmitry <dvorkin@tibbo.com>, Emil Renner Berthing <kernel@esmil.dk>,
 Fabio Estevam <festevam@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "Ghennadi Procopciuc (OSS)" <ghennadi.procopciuc@oss.nxp.com>,
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
References: <20240504-pinctrl-cleanup-v2-4-26c5f2dc1181@nxp.com>
 <96beb071-ec2c-475f-8fa2-d519a1b1dc28@web.de>
 <DU0PR04MB9417AEB942C1EDC053B3894288F32@DU0PR04MB9417.eurprd04.prod.outlook.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <DU0PR04MB9417AEB942C1EDC053B3894288F32@DU0PR04MB9417.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4W0m5Oq+1MGYjHuLsVFcBf6DSSPzN7CJwWHOWi5gVfVYTRdIR+K
 2zyPW5XWeC0waA0XG1o0fva/8mCKTm9879lM0GAJSjUGl41hhETK5f8M2ZBMWQ4g0UJlzpD
 3fzoJQdfd/ogRUeMGCE2UBUF0SSc9vaIDmdgbQa7eO8DVSGbXX57YkoiUskSCwTn3hiAUkG
 zfKWQK47+ptxj3MqnNU5w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Z0q9Az0GyLU=;t4hmcU2AVRjgCjjXk+b3MHwUa7l
 a/pZvuSsug2vebJJV5Mmmf6xKS18ONuBD+gbm/WB8pgHBLJFkYoysMC0IIhx4I0WWI8wizEKj
 wnwngc3K9jAYAXxT3wClh5EI2lIr7usMKJyuXoUcETJI4md3CnMPaiRQG/yVqlAaqCNcnTEWr
 WWVhMuNEPkeDux1iinsdm+TlQNMfJThu1Ed2/Gr+1xeNpKuIWMppANb5SaTJfrRnR4fWhKAje
 H5Ji01z/5jyqznj5BQqSdQN/HIFX+AuFTNeOOmiNL+Fu6rvGsnjOO3Y/SCvMNzBTzPiH9CDir
 A4M1tTHQ9uQvQBsNIgU0qBKLdJQWQkCNz9rGjEjT7hcfvZGYnOb51PQcD02B6X5AFG9H4e81d
 QQyoEcHJ2iww/oZeEqD01ICHR6Xm75yJLFp+FB2L2ollolZJGerIrqkObBT4DKiDqZh9JL7Ge
 bYgdIs3lszUpzViMOTebYrvSUME/DNU00PRb5jIRktRJ68GikIQOSb9GTM4McCY/8YhgSiKHO
 E0ke83cM8aWyw/aFa3MYwYIMoiR6CkR/JHxXPFGPv0ESsQE+1KqicTxlNRxNNeaC44F87DOhi
 QwekBqSRkfFTYVqJ/rYDwDv7k6JeNQKnGlzFplb3elYjtqMJQJuXX4QBFa8hnO27xq8GaJIkm
 oPQAWSWmyUngO8twTu/hiTut+8wfA2nc5zW1Ivh1KxhFHw1LlL2aUdBN27PkhUzfAZ2+2os0h
 eVnu8MCv4H6B/GiPXrkEj/dv4XcqEBaS34YpYNMsylW8LbTBv3fh0B8rT6BKm1GWYO0GYReRx
 tgV6FpjSt5H6LMZ9sBiv3t8DXZ4h0OzcUDX1owYdJOg1k=

>> 1. Exception handling is repeated a few times also according to memory
>> allocation failures.
>>    How do you think about to use a corresponding label like "e_nomem"
>>    so that another bit of duplicate source code can be avoided?
>
> I have no plan to rework this series for non-accepted patches. If you ha=
ve
> interest and time, feel free to take it.
>>
>> https://wiki.se/
>> i.cmu.edu%2Fconfluence%2Fdisplay%2Fc%2FMEM12-
>> C.%2BConsider%2Busing%2Ba%2Bgoto%2Bchain%2Bwhen%2Bleaving%2Ba%
>> 2Bfunction%2Bon%2Berror%2Bwhen%2Busing%2Band%2Breleasing%2Bresou
>> rces&data=3D05%7C02%7Cpeng.fan%40nxp.com%7C293bafdf40524fa4655b08
>> dc7e58f6b2%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C63852
>> 4167804502915%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiL
>> CJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata
>> =3DKb5cz6sVxW1TNfQ8MM2F6YLIIztyjvW4wULEJLYKRM8%3D&reserved=3D0

I became curious how the change acceptance will evolve further
also according to such a code transformation possibility.


>> 2. Will development interests grow for the usage of a statement like
>> "guard(mutex)(&sfp->mutex);"?
>
> I have no plan on this.

Other contributors might get attracted by corresponding design adjustments=
.
https://elixir.bootlin.com/linux/v6.10-rc1/source/include/linux/cleanup.h#=
L124

See also:
Looking at guard usage (with SmPL)
https://lore.kernel.org/cocci/2dc6a1c7-79bf-42e3-95cc-599a1e154f57@web.de/
https://sympa.inria.fr/sympa/arc/cocci/2024-05/msg00090.html

Regards,
Markus

