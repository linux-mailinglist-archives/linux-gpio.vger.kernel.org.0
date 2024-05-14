Return-Path: <linux-gpio+bounces-6352-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1FE8C4D1C
	for <lists+linux-gpio@lfdr.de>; Tue, 14 May 2024 09:33:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8D249B224AE
	for <lists+linux-gpio@lfdr.de>; Tue, 14 May 2024 07:33:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB37914A85;
	Tue, 14 May 2024 07:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EZ9NXeBp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484AC182B5
	for <linux-gpio@vger.kernel.org>; Tue, 14 May 2024 07:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715671997; cv=none; b=bgY4Uh7peMHB8QZ2360d5L0XfyB0HNusIfvpAG5pptAxN3Vdws8fXq+0KkqeCw2JPUEeXIguy+MSpGS1hcqkxCIZOMhHjVpZ6yhTGUOt4kHvvSQZzYvubQycvl1zA8SHHkX0yMmolS1CQMAW4lH6uYJINdcAeyAFn0ro5twmbKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715671997; c=relaxed/simple;
	bh=C4wW5aa4W2kv01Iu3rTlOfBD8ed5XWvkaDVuJNLIYTA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SW3XTBeaLGcBYrFB+8NChO/tGonpiH9tKJtkL5pZCHjXWJUVgRqgdiE3t6JGS4DU3Tp4+W9yi+LxdMjbZ8LdBh0oS9/TSZK4XbHrYLtjkwwZoycVRAayFTBWn1fKxpDVoSIr7udIJL7n5HskGtgUpUhCHWgn+22RRB8To2izySI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EZ9NXeBp; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-620314aa1d7so55616077b3.2
        for <linux-gpio@vger.kernel.org>; Tue, 14 May 2024 00:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715671995; x=1716276795; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C4wW5aa4W2kv01Iu3rTlOfBD8ed5XWvkaDVuJNLIYTA=;
        b=EZ9NXeBpXX/RyKsy7q+DqYaewifa6YWACXAbV4ePJBzHX4rT86pwMqnd9h6Fp1HYAD
         2oXHAIG3tw/GucaWG8TUgO9on8fd/2ZM8v0xtSRMT+jPFykjCfsNXfw6mpdv5oMrPrXC
         8NFDmwLAjvEEGhJNSbM/fIXqj0r62zJvHz7HUGlcfMNDI12TwHT5Wfvdp0jUMylXm52b
         RwDWzuvVWRCHTWHUIOhaTfMxPSTTu/tNbWEHFjTmyOW1OlKllhrTO7nE/h0m1AUWzLOB
         WsW9UsN7RhSwK8kjwl/idGkKywDgTm+mMpI2leZ9IBrfJbEFy4GN7uu8wr4AZ+ain4ap
         JTYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715671995; x=1716276795;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C4wW5aa4W2kv01Iu3rTlOfBD8ed5XWvkaDVuJNLIYTA=;
        b=F6DS65pMAConmLoxxk7VaYSA2ZwTcG/PgnM5JUhUuglQLShZJ+62RJeJZGgO5ZxvTP
         Z4Zf0r4WXxeeGzum88wRGyYZsy2HTESxmZv+V67rCev2ldjrGSVsFlV7POZKdQn+Nvuq
         zFMZ5q7TEXws8muRqPUB3GiPMgn1LUc7CMlGVRU8yAvN/pBjLyTvYSaYdJjTKy9e67ss
         3IMZxAQ+EFtTCIXIdrb06Ys7Ohkv5oIBNUp32OMRv864NH3uvS5H7gvhSfLfQ++uYpJW
         DUyhkoGQf7OL/n2YBKZc7Z3pOgNxp9MPzy5OpqaKAfJcf3q4LjMgIq6Tq4GTQn+MRrtX
         lMHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZcJ1aitXjSNZ89bTXWw8OoY7SccHRTKHgCQrcfgrx+dsIWat6lUF2JHxUYYJq8bM+EccbuDLJOGmvQKZBvP/45KKh1wD/NUg3RA==
X-Gm-Message-State: AOJu0YxS4wvk61SIpGg6V9c1FV2AQkO6q4rFD7p9JKNKogEDUdANxYLY
	+zMvl1LLSVO8ZwkYE1Ozyl1Y+0AUGZxwWcXiFv6s6LRtCwaMI7Ph/Jy8BuHrT3Xu2cf8ygW5MgU
	mBBkie/pi7jZf35dBTHboRoAW8A+RWleO+dJsvw==
X-Google-Smtp-Source: AGHT+IEj9rSUWA94F6VFaCC7a26gta7P6jlgI2cpDV7q9j/kgYnlADA3j4AJ721URmKt02c8jgw6oM4ErSC0l+EyUGQ=
X-Received: by 2002:a0d:cbd1:0:b0:61b:3356:d28c with SMTP id
 00721157ae682-622aff92355mr116464607b3.2.1715671995199; Tue, 14 May 2024
 00:33:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
 <20240504-pinctrl-cleanup-v2-7-26c5f2dc1181@nxp.com> <CAMuHMdUD=1rpns_mLF2rMM-x5EnOK7TExaJxoJVkbXjVz1H8uQ@mail.gmail.com>
 <CACRpkdaUecnwvHFdtGkuM80SObvXpXZkWGYoUMgnNHcvObYF0g@mail.gmail.com> <CAMuHMdWCD+k8=iX8+tcK76DU_m9quR8BV+K68K73SygJzCz5VA@mail.gmail.com>
In-Reply-To: <CAMuHMdWCD+k8=iX8+tcK76DU_m9quR8BV+K68K73SygJzCz5VA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 May 2024 09:33:03 +0200
Message-ID: <CACRpkdYS8=cHT=7tGbzWZ73jbLhjqdpssbaHH-qREe=bcHYe2A@mail.gmail.com>
Subject: Re: [PATCH v2 07/20] pinctrl: renesas: Use scope based of_node_put() cleanups
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
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

On Tue, May 14, 2024 at 8:36=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:

> > Does this go into the Renesas patch stack?
> >
> > I think the patch stands fine without the rest of the series.
>
> Sure, I can do that.

Please apply it!

> From your positive response to v1, I thought that perhaps you just
> wanted to take the full series yourself?

Sorry, I always prefer submaintainers to pick their stuff, they
know what they are doing and they can test the entire patch
stack properly.

Yours,
Linus Walleij

