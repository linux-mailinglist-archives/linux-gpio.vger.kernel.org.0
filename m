Return-Path: <linux-gpio+bounces-6928-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 505F58D4851
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 11:22:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC0A71F23D67
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 09:22:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87A211534E1;
	Thu, 30 May 2024 09:21:55 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B6C14B967;
	Thu, 30 May 2024 09:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717060915; cv=none; b=Y0tj7O+i5L+L6f3crUrVfDAr2eacBOzU8TS9Kg8y6HrqEFyGelhmiqzYh2jBPHW0vaj+2/kJGruqITJgL2MhJaPcBfUZ//51wyAF/sr1YMuUTtcuvOi8MuETKbQ1443zN83c4dvI6miJhshwg2iKrcrQPd8vi5QaE9ycUFnOLIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717060915; c=relaxed/simple;
	bh=6FVSMp5UzL317G0j5W9LunE9q3jEg6QzEPMtdCTKcKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f3dlzHHWA0MKUvkiOZGquWLB8705fJN69OtYKO3RHmLzbqp3N23yosnYVrh2lpyplERdJ19/iBwFYbsTAchKaVxu37FPWSII+7MsYcF0ECyOqiLD+5cAEgKqXmKzv1R7B/FVBLOsBY7sbYUbrnCWIZEivYMRYfDCUYER5uH03KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-794ab0eb68cso76595885a.0;
        Thu, 30 May 2024 02:21:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717060911; x=1717665711;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FWN78EB24MX6Q0HZqErBr8t9tcr4nbKt3etlWVHkE68=;
        b=KP/n8SXmLoudi6c7yimkqVKUIgeyV3IktwUchm+433df3AH85xnBLG7zMlxtlFutNL
         2urTIAR7vEFsGB9nMqouMvZdN6hwgMiVWPya8NNrUCmazpwt9gWsmc12Dv2gmMwcNehP
         Y4XrJ8t9NZGz8KhOHZvgaNVrM36U4tybruoYGPQq9Cek0gOQuy+R5mlsZooUOK57B950
         TSE3BgXc9Ei1AJeauunr6UkswDqK0jLRxqIMwP7QERtkWGhri6Kp8CjEXqC27KdWdN9F
         FhgPsbcHC0MSs60p6BFj4O3Shrd6F0zBhRQe7ieTlwKgUUDdhXxj11yV+Z2cvOMddgDj
         XmxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYVO0tsHpG6+aB6i2peHETpTL69Iha2J+Zr/oMSeJnHHx/Q5E160/PfULGdxb+yWMa/ijDgNCLqSYRGuxucdnsqkTgfsL28MQOpElKuIgnKe0ucPW1PP6OMCDH6GTKC0NaiD+tWH7ptYpNviwb7apRA/pHVGHOuDvAnHU33vCbrkDQsRfJtcmi2j3u/8tkoTNQcCukT+FmFyddvZ/seWCpmA/cuR6sg9KJF9ZvmY7Hd6qeJYwlpu73vd7VUtsg7B+mHN4kFDojM76SWw==
X-Gm-Message-State: AOJu0YxJ0vnLsK0zrecA6297Efu8TNDMoQQQ+2n17bZ4q/P5s15Lqxle
	0vdJVMKykTXPV5lMckEtLS71QPoq76Y08nU0xQo8PkgrhU+msp5hEpzrsLEE
X-Google-Smtp-Source: AGHT+IFnOeVdl75ED81mRu+QfJiqXLb14x/cckQKLw4UCGtpWB3AWmqQNs7Osz4Top3dnRcPBr82+w==
X-Received: by 2002:a05:6214:c49:b0:6ad:7573:acb9 with SMTP id 6a1803df08f44-6ae0e0e573dmr21350226d6.0.1717060911088;
        Thu, 30 May 2024 02:21:51 -0700 (PDT)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com. [209.85.222.172])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ad6ebd52d5sm49108846d6.54.2024.05.30.02.21.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 02:21:50 -0700 (PDT)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-792bdf626beso58529285a.1;
        Thu, 30 May 2024 02:21:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX+Jom2LoG3rmXq9o3tjgZqFaV7K3vHk2TXRM1NG36mS6B7+B/AukWsKEZe9RBTpHy9J7vkSgllDkEIqaFmpPNZUm5knvpxl01S3RmbMFFkFbtu6xo60toploMIOfC3ojgx2BznRpO9PTH4l3xhhZIlYxUWugcqr31tEs9cVlEeYpPBhin3I3QfIyBmctndTSmtHuN5J+S3loS8K1MtC2x7VBqzKZYFdIbOyrMFtkrTylHQeD0Sq0tHDbPZJW5iANZgXyoweELMItVBAg==
X-Received: by 2002:a25:8c84:0:b0:dd1:6cad:8fd3 with SMTP id
 3f1490d57ef6-dfa5dcdc800mr946343276.27.1717060889311; Thu, 30 May 2024
 02:21:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
 <20240504-pinctrl-cleanup-v2-7-26c5f2dc1181@nxp.com> <CAMuHMdUD=1rpns_mLF2rMM-x5EnOK7TExaJxoJVkbXjVz1H8uQ@mail.gmail.com>
 <ZlhAm-giX6jNaUKr@surfacebook.localdomain>
In-Reply-To: <ZlhAm-giX6jNaUKr@surfacebook.localdomain>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 May 2024 11:21:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXqXVT3Y7N8pTb_68E23RkLGi=ySOSDkAWX4MOpP09Q4g@mail.gmail.com>
Message-ID: <CAMuHMdXqXVT3Y7N8pTb_68E23RkLGi=ySOSDkAWX4MOpP09Q4g@mail.gmail.com>
Subject: Re: [PATCH v2 07/20] pinctrl: renesas: Use scope based of_node_put() cleanups
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
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

Hi Andy,

On Thu, May 30, 2024 at 11:03=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> Mon, May 13, 2024 at 01:59:03PM +0200, Geert Uytterhoeven kirjoitti:
> > On Sat, May 4, 2024 at 3:14=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp=
.com> wrote:
> > You missed one trivial conversion, presumably because no error handling
> > and thus no of_node_put() is involved?
>
> Nothing is missed. The below is a redundant change.
>
> ...
>
> > -       for_each_child_of_node(np, child) {
> > +       for_each_child_of_node_scoped(np, child) {
> >                 if (of_property_count_u32_elems(child, RZN1_PINS_PROP) =
> 0)
> >                         count++;
> >         }
> >
> > If you prefer not to include this
>
> I prefer this not to be included as it will give a misleading signals to =
the
> use of the original API(s).

Thank you for reminding me to send this out as a separate patch :-)

https://lore.kernel.org/r/c0a28f466c42d5d59c7fadfa1fd05fd512d43b6f.17170607=
08.git.geert+renesas@glider.be

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

