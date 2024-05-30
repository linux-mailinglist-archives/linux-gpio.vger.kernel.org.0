Return-Path: <linux-gpio+bounces-6947-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCE68D4B27
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 13:57:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ADF2A1C223B4
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 11:57:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F95517FACA;
	Thu, 30 May 2024 11:57:31 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71CF17D364;
	Thu, 30 May 2024 11:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717070250; cv=none; b=Yehkx8tQezj/5Rt49byjvMaSV8LiGSfosZaOEeIQry9CUSm7GDHvLG3RCrP9lG8b7dUGzSepAq27hZ5uYoiIzqSWQPQS/usOxp75i/vC+NxQPgCd/BWjKMgWFsz/cYitW53fRURuqgGyqiWYoeRxjs0PmJ3KnupbN0SwIJePpaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717070250; c=relaxed/simple;
	bh=ox6f2Bib795DIR4D9OYeOchPTQ0ajdXcI1Ql4e0zKA8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ha3295g3aQZqCw929znedUyYS3H2HvEWGJVjx62Qym/MxJwBf10ohpNB3g3chU2lQt2cXrJ1gkUnChqQM7iqFqI7Ds6SlV0hyU5R0+VVrq2T+eOfCXygH1z70708n+g/F/ZSzwXoigmw5xqkx9zO9YCX8r1RTsOxm3kEJWwSFSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dfa5b9274feso861935276.2;
        Thu, 30 May 2024 04:57:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717070247; x=1717675047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UjHdVTNPfpZSE5mw/0S4dwLQIRvAN8JureryKLiLrHw=;
        b=iMUN4Qe/rDHT03ecx2Xmccze4e2c/8jZS8jFbvzbrvoDRAPe7S2t0c64qX+VGnTB+W
         falddhJ81cmMFfZj6wVWAGX2s8o8zy+JpuX9hRq6DsIQ4UnYqvHnGTj+2d3vF2po9+CT
         xLS/zVLNawExEiI3295iDb8YzfN61qTGHle0h95meUIsqzsJKD8c4OorlD7fXMfSL3+9
         NlRRBr5UU6ittCEN3u+bAUfk97HYYhhQnsacNw4LLmTFOQdPcDRtTqP/gBazHfAU9cyL
         liAgyEJCLGenHuAZKegMHpnsQz9bxpc5K9gDJTbsGUVNmZCZ0FFfsg4QVOZOrOC04mFv
         sWwA==
X-Forwarded-Encrypted: i=1; AJvYcCXtbyrB/luAXkeQmssT9gsYKsdlDa37lTOz5Jm3KnBvGN/qs9LCgCNawGwW1sm/Dj4qeTvMl5Ltw+fbswZt0KTJSpqQYQcUnlgXTdTJ24zA4tRInp1jKM2ST9FlZx5VdA4n8T46CDAZXPFG85+Kp0Ivy++oqRp64UfA2/8jbjN259FIXPm5LLhaWY0pZjO5Tv9Bg4lI3giVxHIOJtZ8wOSQAElXxI9SvnGKfbZEKsNBeURfil/Z1zPaKswvTeuyiyx6jvqEa9U97xMKtg==
X-Gm-Message-State: AOJu0Ywy0LE9Hyz74HWgiRjAfSoYGJ0Oig4xqgJVUhzN517NJV9ixVOw
	/c0r7J588VrhdiHlRuIttGIrmTvybo6K+oe6mGf5uuaUo4QvT+WsbrrXJj1G
X-Google-Smtp-Source: AGHT+IHbMZqQOUAX0wpSZOpCsDEy5+/wimXfVioRFqT5E5NDFtRjHUfODqZjvcGeUY7FprwKgPyYmw==
X-Received: by 2002:a25:fb05:0:b0:dfa:5a2f:9e56 with SMTP id 3f1490d57ef6-dfa5a5c1b26mr2125913276.6.1717070246747;
        Thu, 30 May 2024 04:57:26 -0700 (PDT)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com. [209.85.222.172])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-794abd32207sm548900685a.112.2024.05.30.04.57.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 04:57:26 -0700 (PDT)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7930504b2e2so40784185a.3;
        Thu, 30 May 2024 04:57:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVKbTCd8R8RrhMKXYN32KfpzxK053W8HG11pdTwWUGBnKSoYIbLqLqJrSxQ4k19agMx4n7oKWoHgqY+35mW4gLKl6O1Y+54i6W68MPIfPcugNu1bZ5d2z00Wp+MnXJAtbwxqvCUnZCxuKQ/HaI1dqZQ9VmLDXa5L5H+GlnxiPx9gnU+/wvmLIP6jJoOKisncj1SB/Wsw1zBEAHUaVaQxDY+adJ+iJvDPJWsiKZbpXRwZ7DPLMv+ZAEL6m77xz7zRK5TkNaFFoChs1C3GA==
X-Received: by 2002:a25:6842:0:b0:dfa:48f3:2253 with SMTP id
 3f1490d57ef6-dfa5a619bd3mr2110161276.32.1717070226150; Thu, 30 May 2024
 04:57:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
In-Reply-To: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 May 2024 13:56:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVprgpjDP6PDn7appofJv8Tv30nRA4+7n4sR8n6n4qy+g@mail.gmail.com>
Message-ID: <CAMuHMdVprgpjDP6PDn7appofJv8Tv30nRA4+7n4sR8n6n4qy+g@mail.gmail.com>
Subject: Re: [PATCH v2 00/20] pinctrl: Use scope based of_node_put() cleanups
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, 
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
	Peng Fan <peng.fan@nxp.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peng,

On Sat, May 4, 2024 at 3:12=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:
> Use scope based of_node_put() to simplify code. It reduces the chance
> of forgetting of_node_put(), and also simplifies error handling path.
> I not able to test the changes on all the hardwares, so driver owners,
> please help review when you have time.
>
> This patchset was inspired from Dan's comments on pinctrl-scmi-imx.c,
> thanks.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Andy's question about code generation on a related patch made me
wonder, too.

On arm32, a conversion to for_each_child_of_node_scoped() seems to
cost ca. 48 bytes of additional code, regardless of whether there were
explicit cleanups before or not.

I checked "pinctrl: renesas: Use scope based of_node_put() cleanups",
and all but the conversions in *_dt_node_to_map() cost 48 bytes each.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

