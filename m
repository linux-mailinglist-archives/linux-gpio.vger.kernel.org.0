Return-Path: <linux-gpio+bounces-7720-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AD4917E64
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 12:41:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C72A31C210F3
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 10:41:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D14417BB2C;
	Wed, 26 Jun 2024 10:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HVSMr0Uo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCA917C7B2
	for <linux-gpio@vger.kernel.org>; Wed, 26 Jun 2024 10:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719398454; cv=none; b=LKbvij0qH7J0aSvjRu92CIL0RyZbCYX3fF0ca+GOUL43MifHZmgp/+WIxV8ylwLXdR+XaTS0/g0fB+xEBSv2THsOrVFqY/Q01VJShsXYFFIhmUWvLHwEAPnbXNc57gZL+EUd6ETOeO1DyAkkoJa65OqbRhiqgtcMSiY5Mxy+8JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719398454; c=relaxed/simple;
	bh=gymnWB6LrLwrULHTehh82mpr4igpIxzIKKA4CDSINP4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HjJpP0TM/buc0UNL+UUcCPj6MNe4LR3hrCZnziT1u1BbxOZp3qVUkqZHdspOSoDTbaeJkibhlD5E5VI4hImWVdxx2OMiJ6uWnCJL5FBxQfJSHbmXM7TNR4W5dLW9NjIe9i3prt9xKh5uqbouzflFuxAxzqwEZjcbyxx9tZ3sSHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HVSMr0Uo; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e02c4983bfaso6508652276.2
        for <linux-gpio@vger.kernel.org>; Wed, 26 Jun 2024 03:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719398451; x=1720003251; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KHbQKOiYe+Ibua4xAi15PJl+V4d0EJrIgF7ce4mlbFQ=;
        b=HVSMr0UoGCYmYR0N0Fg463wNcKCH4inkwuQIzlPMr04EpEbVPUhsm4Ik5OLfzuH9RG
         c3VsCEfZenWNv0JtATNvn30f/v2g/CgbPMujFgd4FPyWFRU5cGWnO2VtFn4w0uCgPOru
         bufZgQmrkOe4uYoz90iLVOZXpmfR4ogvLel5NFztl0CjEtNFlTqhb9kWehQKzoSz33lF
         ARk6g50c8HGFWwcJdwEPyYE59eAr6SemyQ6i4i3WjlkUqc2kj8wT7xXB0AuNU3j52zjn
         kBVqTJ5Ra18G22meq/MyRq0HJ04fEjF6V+azMMtOwWp9IKJWTkwcU6norCZ8ZlXed9/F
         uoVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719398451; x=1720003251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KHbQKOiYe+Ibua4xAi15PJl+V4d0EJrIgF7ce4mlbFQ=;
        b=ieEzjzagQlb2IhUXomykAHC47f/b6IRcb9U+xiClT15fulfFLWtD66EWGG+3PnZCbQ
         MSIRmbEL6hnfNphi69WdW1xwdlxD6uSqN6idSo4GUAdqTsYTSolZHzvD9gCoUdYmdQZm
         u/2TuAaMoDRFXiexDqeyCXspJf2fmKSXwyIss97VYWtbHFXH5CV6S1MYNtryA/J/ujpQ
         2mdhJAibY1kA1wm4WPKTPacSjDEJDH7tEWEZdEq911qYVQBQIGgxorpkOpNCu2PhP44C
         p3VFEetLJZbO941EkLA4NUc0e/zFVWc9H1XbFWz2OaQMYZsqZcP/tf2/SYEbIGSer56g
         BB1g==
X-Forwarded-Encrypted: i=1; AJvYcCVYMA192F4I2QHK1z2wNt025LOeEDWnci+vR61yXu63S0mBVaewkNfSojLkS3JNll3p8s6WqAUa/kI1DJGziSTQ+4APKehDN+9Imw==
X-Gm-Message-State: AOJu0YxcCGv6ZJpzfP+4u1K/oE/UaKOqunhdW2PmuN1Or5QNBtkUHstX
	4Bh0VHOcSwnKwbJf8sfdEfN8Xo05h+7H4WLoQp76RhcNrcxu17yd0w47JImHjycqXy2QawGoyBg
	zEUGmAeWL454RFUVv8qkLhgx5IXBd3V0ibrzVog==
X-Google-Smtp-Source: AGHT+IGAQdQECALwFQiRgkrKA/rZBEJOAnkCpPbedoTQq7/jt7W9vOb6wQcj2qKoWUKoPCAEcM15HUQq3HQFJjgWzyA=
X-Received: by 2002:a25:c553:0:b0:dfa:6e39:95b0 with SMTP id
 3f1490d57ef6-e030107f616mr10069878276.49.1719398450656; Wed, 26 Jun 2024
 03:40:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
 <20240504-pinctrl-cleanup-v2-20-26c5f2dc1181@nxp.com> <171939733731.25849.13373950874840419376.b4-ty@linaro.org>
In-Reply-To: <171939733731.25849.13373950874840419376.b4-ty@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 26 Jun 2024 12:40:36 +0200
Message-ID: <CACRpkdastCME_0BWjcaNc0Fw8qsLAGgoQUMi7g8sEP+xT=T_tQ@mail.gmail.com>
Subject: Re: (subset) [PATCH v2 20/20] pinctrl: samsung: Use scope based
 of_node_put() cleanups
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
	Tony Lindgren <tony@atomide.com>, Stephen Warren <swarren@wwwdotorg.org>, 
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	imx@lists.linux.dev, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 12:22=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On Sat, 04 May 2024 21:20:18 +0800, Peng Fan (OSS) wrote:
> > Use scope based of_node_put() cleanup to simplify code.
> >
> >
>
> Applied, thanks!
>
> [20/20] pinctrl: samsung: Use scope based of_node_put() cleanups
>         https://git.kernel.org/pinctrl/samsung/c/707807f4c1128e39442519e8=
49e4ce0b7c29b110

OK I dropped it from my queue!

Yours,
Linus Walleij

