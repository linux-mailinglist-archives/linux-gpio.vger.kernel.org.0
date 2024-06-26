Return-Path: <linux-gpio+bounces-7712-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF3E917D25
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 12:02:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD4081F24382
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 10:02:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44E57175550;
	Wed, 26 Jun 2024 10:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="du7x+dTM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA1716EBE5
	for <linux-gpio@vger.kernel.org>; Wed, 26 Jun 2024 10:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719396145; cv=none; b=S773omrrD2mhO/XkoXbgQddUL28Yn2JiBx2Xivvfsb5aaqSqMudWQfQgtLDVTs8Lb6x5g+mWhPrW5W0cij5e5oGwMT8z78OcWMoYxXMnKpVi8A0v9jWaqp2ZdsURqw6Ih+RlZuBAXBIuisffuZ5RkTKk2ez7AHKmkozaLjsx+5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719396145; c=relaxed/simple;
	bh=UIal9mSNuB7WVuajAQysXy9I34dokLqqKQSl/SD8Ip0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HiPFfidoJ5gI9YIgpLOAoPxTAIX0YC9XrN8K+gg/S0pXGGxsXFY8JyF5jlHtQS8Jj87PCy/14Q5QnI/cXKMktHnhLD36L0aOsi8wkSH+cTMhTU7DAqEq3a6VlzWGxXVSRJSokoJBlVVGIVCvQWJjCluQFJgXd3sB7gfu8I1CKoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=du7x+dTM; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52cd8897c73so5364016e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 26 Jun 2024 03:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719396141; x=1720000941; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UIal9mSNuB7WVuajAQysXy9I34dokLqqKQSl/SD8Ip0=;
        b=du7x+dTMouYAHhW8HOS87M+/C9zoDazOHKSh9wJFqYNeyoHIVPrMbzNIN79GPhRJx2
         o6j/Uf8VuM3LNN6rFDCkJm0gGew55fB9XGqTbgEhaVdA3x3fiwGG5Z5kQKJl5DOYem+H
         y+dXUs7iPh0GRTtZ+anSWlWocB2LtT8Z4VQ1Eg4cuOUyk7fn98Ppm9j5wYOWj1j6A5kW
         4ri0R0Ksz6vG8NWrW4K5/AGzhkRG8Stfb7UIbvxUSDNH1AtaO6l1g32JN0MVRd4TPdJy
         Q4TeZbyHGYM6yqBfUeQ6wXvm8++xP7LWtNA0CMJbmuafkbdDI/QXF21K9NSGy5VBSNTB
         mfjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719396141; x=1720000941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UIal9mSNuB7WVuajAQysXy9I34dokLqqKQSl/SD8Ip0=;
        b=E2r6TlxB6joodhPnaCc/BHFYbzNTOLfvWjhKIHBxdRZtdbT7Dl3F7gCak388Yh9ZSg
         4ErCZED7/+vNJrJYTXr91Ays6f2s41M85u9C3YakO+gxVzv6MQYPs311eguEVsvf0Pll
         eViPeifYwWYDvsiMo1cDiYkEdK6++UhEw4byuUYPKlIFRkuqJm/xp3oBTXORw9RPBMtl
         Qiw0EbxUcq/JTqdNDNlb7H/tyUBv9bQeHZRDqQ8Xxy2TiIKLJQoyjjc6WzJampBgoIKA
         ZwBTLWfLbqvqHmYItQ+rnEMVxvlksUn10Brp+uoplhPEeuV6gdZcKEnJbFC7eExNDllO
         1voQ==
X-Forwarded-Encrypted: i=1; AJvYcCUA0+kMJmwqbU6x/m+KffqpnannaYeD9rlMwlujGXbZi8stA5YcARJfQApZnQOob1SfVjm/gViAhwa26LpYKkz3KcBZbK2JCe5FlQ==
X-Gm-Message-State: AOJu0YwSx11eCHQewr9fs0JW3BnkIsjWUHuqRkKKHnoSM/vziCECzwAo
	CoPzgDCOGccVdJgroB4KXA4wWGgSFnL6Rxr3DBYOhsiqW1NFcbcuIXCJKEvJpQqEDvz3XBx6RbV
	P54NinFJXh3zkmoHr2t5ZZ9HNVXDdcHNL/le+ZA==
X-Google-Smtp-Source: AGHT+IEEH1F7Tv7LomODsunYV84Dtc4zLrPpgRRnnl78k+rzuBYmNhragIOzGe8Zi41e1oTPofFlhnZh4uvVT5y70J8=
X-Received: by 2002:a05:6512:2254:b0:52c:8fd7:2252 with SMTP id
 2adb3069b0e04-52ce18324cdmr7591081e87.11.1719396141307; Wed, 26 Jun 2024
 03:02:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com> <AM6PR04MB594163BAB898D8689A94056F88CE2@AM6PR04MB5941.eurprd04.prod.outlook.com>
In-Reply-To: <AM6PR04MB594163BAB898D8689A94056F88CE2@AM6PR04MB5941.eurprd04.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 26 Jun 2024 12:02:09 +0200
Message-ID: <CACRpkdb17buPQVupCRDthvAgMKpvKvRWEN5GbA7pyF9NxymGEg@mail.gmail.com>
Subject: Re: [PATCH v2 00/20] pinctrl: Use scope based of_node_put() cleanups
To: Peng Fan <peng.fan@nxp.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, 
	"soc@kernel.org" <soc@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Heiko Stuebner <heiko@sntech.de>, Damien Le Moal <dlemoal@kernel.org>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Aisheng Dong <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Chester Lin <chester62515@gmail.com>, 
	Matthias Brugger <mbrugger@suse.com>, 
	"Ghennadi Procopciuc (OSS)" <ghennadi.procopciuc@oss.nxp.com>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Tony Lindgren <tony@atomide.com>, Stephen Warren <swarren@wwwdotorg.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, 
	"linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, 
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2024 at 1:52=E2=80=AFPM Peng Fan <peng.fan@nxp.com> wrote:

> > Subject: [PATCH v2 00/20] pinctrl: Use scope based of_node_put()
> > cleanups
>
> st/stm32/renesas patches are picked. Would you handle the remaining
> ones?

Hm right, I applied all that apply cleanly:
971c8b4c08e7 (HEAD -> devel) pinctrl: samsung: Use scope based
of_node_put() cleanups
3a882554a3bb pinctrl: k210: Use scope based of_node_put() cleanups
7f500f2011c0 pinctrl: freescale: mxs: Fix refcount of child
d7f5120a944a pinctrl: pinconf-generic: Use scope based of_node_put() cleanu=
ps
240c5f238d59 pinctrl: bcm: bcm63xx: Use scope based of_node_put() cleanups
3a0278cfb448 pinctrl: mediatek: Use scope based of_node_put() cleanups
c957ae7e7e68 pinctrl: nomadik: Use scope based of_node_put() cleanups
3dcc01b36f18 pinctrl: s32cc: Use scope based of_node_put() cleanups
7c2aabb56f92 pinctrl: at91: Use scope based of_node_put() cleanups
56c42f6c7b2c pinctrl: rockchip: Use scope based of_node_put() cleanups
8c5dc2a5b3a7 pinctrl: spear: Use scope based of_node_put() cleanups
794e5dc533b0 pinctrl: sprd: Use scope based of_node_put() cleanups
8fa99c00351c pinctrl: starfive: Use scope based of_node_put() cleanups
11eefc0ac884 pinctrl: tegra: Use scope based of_node_put() cleanups

Can you look into rebasing the remaining ones?

I am a bit unsure about Samsung, Krzysztof usually pick these, but no big
deal I guess, if he objects I can just take it out again.

Yours,
Linus Walleij

