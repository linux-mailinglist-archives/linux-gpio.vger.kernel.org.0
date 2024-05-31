Return-Path: <linux-gpio+bounces-6992-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8868D5B37
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2024 09:07:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1BCCC1C23BA9
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2024 07:07:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 535BF8120A;
	Fri, 31 May 2024 07:07:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D27A18756E;
	Fri, 31 May 2024 07:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717139227; cv=none; b=mb4KrZfbwK5o8YGGdVx4+e4R3j6FarTcNFRZ1gPMAViKHNLhoUotfnJuMDSVAXknoXk6pbnxq/m2x0+uJxALIhqCcWbD+ZlvHSfYgr6pL7xutzqzf6Agyt+nyFdAmccb62wYktN8KKSO3OhHOiso6uGlu2gHSU4pi7WGWsRmd2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717139227; c=relaxed/simple;
	bh=GwpopD7I++CEt2GXRSjw+x35z0xYtVzunPiCuEMRxwU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p76JIb5FUdEObREHs3fETjRgjdA0z9CFLRNkUjCPb8iDlpBUIWyHY3Vadvj0gBaXLYMFmwpiIMr0k5dTMVvP9csTdI0fVK6hawWs3h0jECnv2JjXuFeKljKWNGID1MCBH51Ot7ugKPSXJD2HQ4oS1bY05tCnxTKr8Wm/e9s0Zs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-7e25bf84b58so68104939f.0;
        Fri, 31 May 2024 00:07:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717139224; x=1717744024;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ayp9OTJcx8xBTEOWGr76ffez+fesdX+4XqGBVIDxEaQ=;
        b=PTgJ2WUYwotIbe7ewO0uKtKm39embI28Yli7rwZIku6v2tPFHbAzI8gkML9UHd5yCP
         eYGYw9Pj4tDiGJw0DNPBN0boAPZIQkwSupHtu2mdbUpqxr4mjFFudrS228R/97A05NZx
         iGL6HJfZNf6L2rxWZ/mRmcQgoAHUtxoRibYSPToqEd+yP7eAgUI9RWwNMK1Z4WVnFLwH
         Y8i5VLXnOHvIUlZxAukjqn2p0mc4y3V6uP4wCb2VCkXZo1iuV3/Wr093DTx9Z3ZBxQmp
         jUsAMLBiazolBOzr+IsPWrKShwIuKUyzRLGnZZIBcikPZ8yHsYTjh2ks+vmaoLrodiHx
         Ta+g==
X-Forwarded-Encrypted: i=1; AJvYcCVtf4rxAtHNtJW8haKIfJ9rRvoUc+/LOU16ZHr79YDNicvvlRuU+zfk6k8z13MXPdETx23UgwQWfRssLTan80OKJo3SHfug45V4CdzgiFU6epW/iAjjoYzZtfcyOT9QzEDJPpMBp2CzRk6lvZCzmBb3a4eKm1QY/ZPTaKtugscf9UtIbprFvZ5qOUe/BjtQSfwSEzB+dmwKVxmrka5TSQOD+IOVnljFzn2/q5DUCP9+j6cZtQQA5jaP/QVL3QstGDJxsTyhsKlmYb2wLg==
X-Gm-Message-State: AOJu0YysvB5Xr32d2jpNV00CYkUtUbCT2pMwrV9pZLv/qNZYjmN23ZCu
	uhqfO4/oa1UPONyjlYQ5DylTnMbVJ3w2pfsAZ+HUTNyLvLDGxkXVz/EiSOor
X-Google-Smtp-Source: AGHT+IGij+kYqVFs41UcqZH//8OOscUL4EID/HB5qa0s/CMrcPSab4QvqdFAaAQ/JQ/o9dKBUPpRKQ==
X-Received: by 2002:a05:6602:2b89:b0:7ea:ffac:b7b7 with SMTP id ca18e2360f4ac-7eafff24acdmr151093439f.17.1717139223772;
        Fri, 31 May 2024 00:07:03 -0700 (PDT)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com. [209.85.166.46])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4b48764e4c3sm339234173.20.2024.05.31.00.07.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 May 2024 00:07:03 -0700 (PDT)
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-7e9515b0ea9so72651239f.1;
        Fri, 31 May 2024 00:07:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCViA+WKIEd/uOdLhHp5T4VvObySH0GYNjbL43LPxBJYBcYuzOwiQ7Uxlq+I6A3KUZe68H76zfsnzbRFbKC0y8zZMSLsFLHwg2PpR7zfEPyE/DQ1h1+AiB8GrVrIayHu3Ckop2nHsKVUTGEoqkaOOtQAK6cgW0DXYK3Jt05g/aNhLPV6WCZ95895gf4Vlibp/XxNEH2kGQrwQLBOVCoh0z2q0RqAHbKmWjNE94OTVGVpRL0CkFBfv0EC8VaNSiMZ4kZDTGpdBI27tOIwkg==
X-Received: by 2002:a25:5f46:0:b0:df4:f149:1fc7 with SMTP id
 3f1490d57ef6-dfa73dc4a2dmr974775276.58.1717139203004; Fri, 31 May 2024
 00:06:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
 <CAMuHMdVprgpjDP6PDn7appofJv8Tv30nRA4+7n4sR8n6n4qy+g@mail.gmail.com> <DU0PR04MB9417FF2632A278BF6605AE1F88FC2@DU0PR04MB9417.eurprd04.prod.outlook.com>
In-Reply-To: <DU0PR04MB9417FF2632A278BF6605AE1F88FC2@DU0PR04MB9417.eurprd04.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 31 May 2024 09:06:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW01HtY7d+L=44czH_dqV6bresLeF=SRqyn9p=jk3MTAw@mail.gmail.com>
Message-ID: <CAMuHMdW01HtY7d+L=44czH_dqV6bresLeF=SRqyn9p=jk3MTAw@mail.gmail.com>
Subject: Re: [PATCH v2 00/20] pinctrl: Use scope based of_node_put() cleanups
To: Peng Fan <peng.fan@nxp.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
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

Hi Peng,

On Fri, May 31, 2024 at 5:07=E2=80=AFAM Peng Fan <peng.fan@nxp.com> wrote:
> > Subject: Re: [PATCH v2 00/20] pinctrl: Use scope based of_node_put()
> > cleanups
> > On Sat, May 4, 2024 at 3:12=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp=
.com>
> > wrote:
> > > Use scope based of_node_put() to simplify code. It reduces the chance
> > > of forgetting of_node_put(), and also simplifies error handling path.
> > > I not able to test the changes on all the hardwares, so driver owners=
,
> > > please help review when you have time.
> > >
> > > This patchset was inspired from Dan's comments on pinctrl-scmi-imx.c,
> > > thanks.
> > >
> > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> >
> > Andy's question about code generation on a related patch made me wonder=
,
> > too.
> >
> > On arm32, a conversion to for_each_child_of_node_scoped() seems to cost=
 ca.
> > 48 bytes of additional code, regardless of whether there were explicit
> > cleanups before or not.
> >
> > I checked "pinctrl: renesas: Use scope based of_node_put() cleanups", a=
nd all
> > but the conversions in *_dt_node_to_map() cost 48 bytes each.
>
> I am not sure this is an issue or else. What would you suggest me to do?
> If you think extra 48bytes consumption is not good here, feel free to dro=
p the
> patch.

I suggest doing nothing about this.  I just wanted people to be aware
of the impact.  I guess it's just part of the slow but steady increase
of kernel size (ca. 20-30 KiB/release)... ;-)

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

