Return-Path: <linux-gpio+bounces-6657-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D34108D00CF
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 15:02:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A3421F2592D
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 13:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 284C416C869;
	Mon, 27 May 2024 12:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jXCrQXK4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3403516C84E
	for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 12:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716814626; cv=none; b=L8nMW+uYHNy1pIBvEq8G1LTj3Pl+DHAehZK7ruNPBxKvTNjjn+K3cE6o8XWL45QMfIq1tOX+/3PpS8hI0sRefljUf2hCIx1kT2w4ipSMEpn788ho48AcrYrw10fNZ+BrtWYsBmwN20L7uZfSdOw4rbBeoVzaOyEXvplPqWnDZKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716814626; c=relaxed/simple;
	bh=pJJyP+9frURhdd/ZV2qsiiwzKPVnn0nUZRG4Ztdu5Ds=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y7ZNvf+wi6ercnuYOmTveS4qhlWGF9YsBvGby1DrKxmQqb/YDMOPEy2m0zjP+loMwqCL8o48dRnTPBquc4jQ7ZoPWvfaKo9/zUtCAR38mPhgpAuxH3Lakt4r1+Los2DV+ENmUuKkuZj++s2thMoGklBDKxNbUWqPCqD63uYRcg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jXCrQXK4; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-df771959b5bso3352285276.1
        for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 05:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716814624; x=1717419424; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pJJyP+9frURhdd/ZV2qsiiwzKPVnn0nUZRG4Ztdu5Ds=;
        b=jXCrQXK4vKKG3HNR2A3yrhA0N89JXaALNJNJZFifU5IcPmNHSV9/2cOI458EcoPwSp
         MS8tiPvxGlUeIzWn77Wc+B97UCTfQyJpY3/Wq7Y+34n5758vEvKc5NsGlqkOD4UM3jY2
         j3++z8nTL32t1NMfJR77W9ZbGD6s8Ho9b8sXjoTkCTBfwJ/X7deVNRLnfC7v8N2lDZfK
         R5D27pTTRyLCkRYZGQvBaVoczAp5THTkjy6iFgn2g3IuWau9JlRxwsw7wsJ3kdoSqueg
         WkEa+oKqAPIYXL2aQkmLYoo9zelMDkvpzcwN3Rf4Wgs1p32CJpmnoUP+Ahrw8+LQJdR0
         nDcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716814624; x=1717419424;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pJJyP+9frURhdd/ZV2qsiiwzKPVnn0nUZRG4Ztdu5Ds=;
        b=OYNTNGCVLQN0kTVXixB9yFH3ftLdxZI4AssDYbMzc/QJW2+KHQ1iOstntVEBAFNHRD
         QC/S1mul0cuCtWHS6Cm78T+gWeJleLChC/kG0W+EHJDMaXZBkdLmBV81Yo40E5IzbTT8
         kZuOy4WIQQYuOQaFtVXDpYEoDAgU0xIVWtR0YcuxQw3sxJj4ZbwABOfXMP3JlwT87zvw
         6ef/QoF7AFjalXvlJjtS6p3dmnYjb91R2DTJ6GLQY9g9PE1ShtrDB+qsLis7mA35FRpS
         SDZVcmpc/vWXZ+XGgNgACtPwgLwfAO77+meWJNrmNF17dA8taifKaHsreDFraF4v57MR
         nj5w==
X-Forwarded-Encrypted: i=1; AJvYcCVivLBHOjXqPiIdi7SE9YqSEb5fnqPMX3Z3iQVb5ZC+iBsfF8OwFNVgA/RlUj0r6QZHdTxZXmksLv/gpdJJbjuTfuAnoIMJ7JjYGA==
X-Gm-Message-State: AOJu0Yyh2x7pvFnYZUFZ3ybGQ504rc2sVR1hn5Bcxob01hoeS1PO1ki6
	SyOFBH+cdwVQi+e/JmZ8heiLdemAiBncEgIxGk5k1I+mQGA1x4BVBq8fdtt3ypKe1BXiS2HPq3w
	NdB2xGTLeqAnjZHX4pFzmHB+AiShdNv+awbu/cg==
X-Google-Smtp-Source: AGHT+IHtuitKU1in514NtpJEfJGREAKzOXikcv6xhBvHaqSAyXXF4vYDUv/B437jXNYfH7CNGKFQFe5YOvThvoGTSqk=
X-Received: by 2002:a25:7486:0:b0:dc2:3f75:1f79 with SMTP id
 3f1490d57ef6-df772184c54mr8792593276.23.1716814624064; Mon, 27 May 2024
 05:57:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com> <20240504-pinctrl-cleanup-v2-3-26c5f2dc1181@nxp.com>
In-Reply-To: <20240504-pinctrl-cleanup-v2-3-26c5f2dc1181@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 May 2024 14:56:53 +0200
Message-ID: <CACRpkdZ+YPAXTNU-kaA8ywBLW0RpGJBpXJqPD7aJ+B1V=axPrg@mail.gmail.com>
Subject: Re: [PATCH v2 03/20] pinctrl: stm32: Use scope based of_node_put() cleanups
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Heiko Stuebner <heiko@sntech.de>, 
	Damien Le Moal <dlemoal@kernel.org>, Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Chester Lin <chester62515@gmail.com>, 
	Matthias Brugger <mbrugger@suse.com>, Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Tony Lindgren <tony@atomide.com>, Stephen Warren <swarren@wwwdotorg.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	imx@lists.linux.dev, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 4, 2024 at 3:13=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> Use scope based of_node_put() cleanup to simplify code.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Patch applied.

Yours,
Linus Walleij

