Return-Path: <linux-gpio+bounces-6355-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C398C4D7B
	for <lists+linux-gpio@lfdr.de>; Tue, 14 May 2024 10:07:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C77CA280F7E
	for <lists+linux-gpio@lfdr.de>; Tue, 14 May 2024 08:07:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 297CF182B5;
	Tue, 14 May 2024 08:07:19 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916F417996;
	Tue, 14 May 2024 08:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715674038; cv=none; b=hU2FRyLRnxZKkiLov9y/zS6ulLg4MU21gwRrwGh9w2OBKoezjLS2eCI0Dalu3V8/fJe+2A/F/l+5iT89jXfCHrYllzzQYCfxaiUhH16QpTojXBCDol1XtrrJbwygX4iGVShz5kyPi3dTs+o8wWfRGp8uzeyGQkGw/FSZrNyCb+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715674038; c=relaxed/simple;
	bh=toj7avCrdtDP66sy+w2xPyKX8oobvvymnd+3vjyORlc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lLn8jUm/ThhrMH/0cvUl/XwG/bigkmUavSS00ZbkfFOVPN2We+O7C+aQa9zyE5SLkQhpMHjl0Ew2FRC0Bz1RMhOhVzI0IsblVINKNJUBz5liWYSc4kj00fDIgsiNXYxwUhoSSUZyRje3ur6AGVHo5zgaZGz4f6xXFDT+Vp3e09k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-61e04fcf813so59817737b3.3;
        Tue, 14 May 2024 01:07:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715674035; x=1716278835;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mAZGt+1Rc/qtuBUqNnzX2rBGCR5XoalBEqWaRtcOihM=;
        b=Iw4IaWQY1QwhFqN+npKwJG6R2WAEeKh/7wlU8M1zhh6zgPMYBbGCExna4NVD4azTm2
         fwcKDtUEXl0HqHUAhJeYa56jbl8Ilr5hqhzJYdBJjOjOz4lS1VjwVwcVWPKFryULM3kd
         8EkeI7m4Lk1AGR11inXpvAGG2ZLOByZ85HGaedoH5h7CT+fEz1AvRpuzDCUXcSFa8b4X
         y5Ak4b5GtpLe3RTb69FxGFVCg4KPNLKvBqJUe4VHHsIHAX3YJED/QRakA3lOgyKiJJ8L
         m9Ou9u2uyIoC4qZdxiQQM6Ljg+ANlTB8RcvxEm1tMSLL//+bx4CBSgEa0jQrKNJXO7Xd
         jwHw==
X-Forwarded-Encrypted: i=1; AJvYcCWj8vv9qRX44nJZ2fw4LRrvwF7M5pA0HhNQZZs4ZXqrKbTJxhqfZA4nC8gYayDLDDir9fGS+NP/4OXL1s1hGDSONAEGWDp3jTz9SxLyUpFtn81jHfE/T32IBQoJNe7yv83Gdq/E1s9PMXbL928bfmVHdxuqXpnjQed79nk5S02RUCLrIDnwAZAPRNfrGXL12cqnWB4xTmEJcV4SPVASQAihITB6Sqm7XYOsO8ehDWCSoA1lOslXnQio+kJksQP+X+tPIBOpXw5wdglkIA==
X-Gm-Message-State: AOJu0YxnaZVK0299AffwWYdOxj9UBafosFEXrkv9FjLhrpn4BqXDLNJZ
	eLfR1wQin7f+hCBJkxKEEquE+W685McUel/HjrKsxLUx3LVs82v9w1eXnELn
X-Google-Smtp-Source: AGHT+IGxjxDOYrEBfWACS3xb4tBhGmMofLxxMuAzFLCqhT/U50fNTCZGyD79+TBrcCbgSwQTnN+5tw==
X-Received: by 2002:a25:7909:0:b0:dd0:c866:ec3a with SMTP id 3f1490d57ef6-dee4f344357mr9991216276.22.1715674035592;
        Tue, 14 May 2024 01:07:15 -0700 (PDT)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com. [209.85.222.175])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6a15f194c3asm50576136d6.69.2024.05.14.01.07.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 May 2024 01:07:15 -0700 (PDT)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-792b8d31702so339701585a.3;
        Tue, 14 May 2024 01:07:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVf5DFfZPLOyhchVtkqQQEau6PvVJvWpWfK6MH7evdfLUxtEBMaJRn/MqBWZHm2IsKsPS5UpziVP+gAUJaHPZsAk9yLBg/5ORozWICwSjP96i136aq9D+mQhjaGpFuF4QgVFjGI7ZjzqF7FHzRuv3L3ICCvatIPMMHvJLxmM6fHMnT+HDRF1J0D70RyBrXRq/g+btRfPctdwxEeMpwijhD9oqPUUcAvcE5CKahhBTpOvOhE6IBaA5zWmK6e8Ex35u1CEl7jnnKLVxALfQ==
X-Received: by 2002:a05:690c:fd0:b0:611:7132:e6ba with SMTP id
 00721157ae682-622b0147778mr138786587b3.40.1715674014345; Tue, 14 May 2024
 01:06:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
 <20240504-pinctrl-cleanup-v2-7-26c5f2dc1181@nxp.com> <CAMuHMdUD=1rpns_mLF2rMM-x5EnOK7TExaJxoJVkbXjVz1H8uQ@mail.gmail.com>
 <CACRpkdaUecnwvHFdtGkuM80SObvXpXZkWGYoUMgnNHcvObYF0g@mail.gmail.com>
 <CAMuHMdWCD+k8=iX8+tcK76DU_m9quR8BV+K68K73SygJzCz5VA@mail.gmail.com> <CACRpkdYS8=cHT=7tGbzWZ73jbLhjqdpssbaHH-qREe=bcHYe2A@mail.gmail.com>
In-Reply-To: <CACRpkdYS8=cHT=7tGbzWZ73jbLhjqdpssbaHH-qREe=bcHYe2A@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 May 2024 10:06:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUucOu-c7tbeBBCMaoouFcUnJi0aRU--pc2Gk9QWNrANg@mail.gmail.com>
Message-ID: <CAMuHMdUucOu-c7tbeBBCMaoouFcUnJi0aRU--pc2Gk9QWNrANg@mail.gmail.com>
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

On Tue, May 14, 2024 at 9:33=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:
> On Tue, May 14, 2024 at 8:36=E2=80=AFAM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > > Does this go into the Renesas patch stack?
> > > I think the patch stands fine without the rest of the series.
> >
> > Sure, I can do that.
>
> Please apply it!

OK, will queue in renesas-pinctrl for v6.11.

> > From your positive response to v1, I thought that perhaps you just
> > wanted to take the full series yourself?
>
> Sorry, I always prefer submaintainers to pick their stuff, they
> know what they are doing and they can test the entire patch
> stack properly.

OK, will (try to ;-) remember...

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

