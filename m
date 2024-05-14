Return-Path: <linux-gpio+bounces-6350-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D20B28C4C61
	for <lists+linux-gpio@lfdr.de>; Tue, 14 May 2024 08:36:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3482FB20F36
	for <lists+linux-gpio@lfdr.de>; Tue, 14 May 2024 06:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23DC0D304;
	Tue, 14 May 2024 06:36:23 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE01193;
	Tue, 14 May 2024 06:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715668583; cv=none; b=GB6uiPKjXepXUlI5w3vco2/bBKbfuwJWI64YEpPqn/42Q+jTwtdlWb9cFdPfs9b1Z7HYf3MRbBCYCFnOH8nZHyXc69PBiBy5sCsCJYduD6WY73i2JTUS9HyAnCySPu1i6lwzx8jjlvWbXY/GLx5Lh+K/G+Pa5Uhtme1LFJDixSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715668583; c=relaxed/simple;
	bh=EQGFT7CyM4ztbvWBFaiT0GbdvWqIdCpHOwc42jxh6SE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TDekY6K4/+89WsrZiIE/lBwcZYCyjPYp/ZlKxFnCLCpBdqdlDhYieY+aWKYEju5i/hyPSoXaey2DDQ4wnZOhFidVmJzLsPKJDMhfRw+WSYSF76fSx4bP769Iy8oEkzmNml/REzARxLLwCLlgtR+Q2XRJhgFduBv5pfnP+dY7Pc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-792b8d98a56so495147785a.2;
        Mon, 13 May 2024 23:36:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715668578; x=1716273378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SyXm2XZJp7cQccvVHsZwFRorrc4lUY+2faX/WPeRScc=;
        b=q295c7u7oo/zrKxT+3//ux1dvuOV59PSQgjizW2A2KJd/FzK6qvVF0giEV7xntF3ZN
         FiujhApWarw7QEo80mu+7F1JIAxheB4SkBT9/sECFG6WNTYmkJHF+1c/t4XWcK7RPetU
         t/3a0ac/64dphS/ZPrKvDuH4iDKcLCS8dE1soZ2L+Yd4IJ9eVBxQCOFW7L2RdkmNNfvD
         QX13lnoE95dEfzdshdLclKo50YnFogYJw2txKZArSlACiDC6XaF/gajsMZo3aXY7dtN2
         qy8A3ouS2j9l+A1zBwrznWcT4BGfpuDWz3K8VNRNzJYdSprwdE3EVmHA2dxMqjxyU26R
         vOJA==
X-Forwarded-Encrypted: i=1; AJvYcCWGgcRBFsDOi7MweHZKYITb93cdjWZEMahfU9t/pv+H70TbLV6adjWaLrTfGnSBEpZIoYFeA8cLB61iJQzcnW/uYCLPaBpRRJRnqk9Mn7eVOgaXdCUoGRyOuX17aKl5u8QbNf/vHEVUCu5zl+Lb7QHSOllwX2NXgeTcp62axK61Nv0LW5CjVEzErSkG+GoYy82XY1TLndz5HfAr1mzbUbBcpJ+m/Td4qBlajz63TPQmex3uRFpYAy6j3E3BO9j6W3e4i8uAKHAN69dG4g==
X-Gm-Message-State: AOJu0Yz/f5Bu6Pia+LHOKOTrIZOLnxKABsWHAMC9uILnBoFKI6SXZiXw
	Ri+u7ms3B6Y4q7ZCawgfzTmTXceHa1+LyEBL+yPAVeHbIuNq0KbkFflr+7oB
X-Google-Smtp-Source: AGHT+IHb/gpZ6h4LX1YGHekIv67fi8M936g0HJZ4gbtfrHZIikaL3GtALqO6JA8TaZo3T/gO62w3lA==
X-Received: by 2002:a05:6214:4808:b0:6a0:d4dd:cb44 with SMTP id 6a1803df08f44-6a168279065mr148851546d6.62.1715668578125;
        Mon, 13 May 2024 23:36:18 -0700 (PDT)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com. [209.85.160.172])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6a15f17a3d6sm50819416d6.18.2024.05.13.23.36.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 May 2024 23:36:17 -0700 (PDT)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-43e0d564136so14416611cf.0;
        Mon, 13 May 2024 23:36:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXR5o8oqxHDe1AUaUAy5CEk3o15oXGQAU+LSbwoqhPmBBjKmLvBeN4+jNdAKe87n4eezNbfm0Ks7Jd9wIsiikNydPE9UxjuDiG0Fk95a2QA9hymVO4do9pMK0DQBm/nybDD4tPTTRTkU+vKdI8VjH7ZHhUhgnX9GcLgxxTjdSWy8AgsDtCC2iwnwoWrQdgR1qUGk8SYmh8i3hU73zS7ep15E+1QXWafSp9g8tAeI9VlCSgaeMu8omO0MnlTtgOhlhww6oy7H4Gswv4l3g==
X-Received: by 2002:a5b:f48:0:b0:de5:567b:88f with SMTP id 3f1490d57ef6-dee4f31a205mr14563293276.10.1715668557234;
 Mon, 13 May 2024 23:35:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
 <20240504-pinctrl-cleanup-v2-7-26c5f2dc1181@nxp.com> <CAMuHMdUD=1rpns_mLF2rMM-x5EnOK7TExaJxoJVkbXjVz1H8uQ@mail.gmail.com>
 <CACRpkdaUecnwvHFdtGkuM80SObvXpXZkWGYoUMgnNHcvObYF0g@mail.gmail.com>
In-Reply-To: <CACRpkdaUecnwvHFdtGkuM80SObvXpXZkWGYoUMgnNHcvObYF0g@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 May 2024 08:35:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWCD+k8=iX8+tcK76DU_m9quR8BV+K68K73SygJzCz5VA@mail.gmail.com>
Message-ID: <CAMuHMdWCD+k8=iX8+tcK76DU_m9quR8BV+K68K73SygJzCz5VA@mail.gmail.com>
Subject: Re: [PATCH v2 07/20] pinctrl: renesas: Use scope based of_node_put() cleanups
To: Linus Walleij <linus.walleij@linaro.org>
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

Hi Linus,

On Mon, May 13, 2024 at 10:51=E2=80=AFPM Linus Walleij <linus.walleij@linar=
o.org> wrote:
> On Mon, May 13, 2024 at 1:59=E2=80=AFPM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Sat, May 4, 2024 at 3:14=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp=
.com> wrote:
> > > From: Peng Fan <peng.fan@nxp.com>
> > >
> > > Use scope based of_node_put() cleanup to simplify code.
> > >
> > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> >
> > Thanks for your patch!
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Does this go into the Renesas patch stack?
>
> I think the patch stands fine without the rest of the series.

Sure, I can do that.
From your positive response to v1, I thought that perhaps you just
wanted to take the full series yourself?

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

