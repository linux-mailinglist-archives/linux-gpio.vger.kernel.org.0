Return-Path: <linux-gpio+bounces-6335-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C388C4048
	for <lists+linux-gpio@lfdr.de>; Mon, 13 May 2024 13:59:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 987561F21BED
	for <lists+linux-gpio@lfdr.de>; Mon, 13 May 2024 11:59:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9947E14EC7B;
	Mon, 13 May 2024 11:59:39 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2390D14D2BF;
	Mon, 13 May 2024 11:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715601579; cv=none; b=QF9LSDIRcljg9zgdrgrcQoMUBIe+FQpCpSuDMCBoFcI6a49btCrUh/go974Y6JcVpBylLKsroODO0O1EJvbXcJkfXUoE0XeZtu0bUZUy5EV6ciZbprGvz+dq3hyIpOrjIUInqRnMiZEZWbZFdfgDBID+pDS7rlgLL8THrIpTp2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715601579; c=relaxed/simple;
	bh=ZI926+nrkyV0Flvn7rSMoQ1E2Kcx99Sv67xPVhZTYWo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SnZKXZciKG06yGjKRcf7+a9PoQhAEFFLButkqXUQWd8kwny4PqysUs6SKhxXCtWvzRso0ZdSmIE/FgF7bIzc56z8d8ArHnZK+3oKdsUXcHQ/CLVtZXMLbEgqDiaBlQKwkx/HLDMqagDLp8l1sDub9FH1xwcf8vBokme6+JGfcrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-7e1b547cf45so197770139f.3;
        Mon, 13 May 2024 04:59:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715601577; x=1716206377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z24B9qDTJHEobEGC/70CrM/eVAoUVzOxiy7onUzGbVU=;
        b=CkMfp5et2O5a9RmAtIm384MmHUA7ynKksg5DrOV+5nJoROH1NTTqKoWCcGBTdBHfXk
         /HM9887hBxRM2pr2F2XfmmX2c5MML97W5731LuQod87KInc3ouNs00IzxTFwYzoc/9X8
         jv3t+DhxCdAp9QfysHfad+kgaobaRWyC6RZepWUGNTRDo/cO2KVz6kphwD1W0xk13W3E
         RRW9Lq0/PvtVGOqPNbL9OxYCkCO6lUZaSyuAARrOi6ZDWZp+dCR9Xw4bFfkhC9NcAbwX
         YXV5QnI71gyI3DjEtV42lXc/LVkIhDhMrsYahUYTp0thCjJOj9Y1U9EbFaO0esQvX8zG
         28gQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFKlbgPjXMU9alorpr5+du5rhxxJOpyuIfhr8rsF+ahzDeIN5dwhQX+RWhA3/ExOUYJM0LWJ7frHH/eIBA3XEPm4P++wD4n42CDvMuKADeRSQKxWOs+rt2Y2zkMS5MM+tCX0ypWq21O4Dk3o5aV0dKgQ+Apu3bSjHau6YaF9MNLzwG4y4gTmsFBIOOTHYoMeo6uTlTbs9xv51cT2cbD3jN3MvYAN+NYvaLfnTGh90eI4VF9B4MbUOltbJ/zE8DoHKWPGemxGjWxGkoag==
X-Gm-Message-State: AOJu0YyxIU9HFMLX31rYpRNzs5MiUyOU/BtslvlOqdeSFQRUMWUmNYXW
	g5wPSAi3ak0Tcd5LE/iZxdIK1fN2MsFyX6/uti0gBFewczmeKeX/vAY6eyon
X-Google-Smtp-Source: AGHT+IGkuAhmaP5QSCTK/tzmsOgHETlJLegrQbKG1v+vxeUYEGFM8jJxMdC4UtDFtVNOGN+68vKMrg==
X-Received: by 2002:a6b:5807:0:b0:7de:c720:ab1f with SMTP id ca18e2360f4ac-7e1b5217939mr1007495839f.20.1715601576741;
        Mon, 13 May 2024 04:59:36 -0700 (PDT)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com. [209.85.166.43])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-489376dc51esm2512762173.122.2024.05.13.04.59.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 May 2024 04:59:36 -0700 (PDT)
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-7e1b547cf45so197769439f.3;
        Mon, 13 May 2024 04:59:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVbqsOU11Vlh7yZXmfLg1+xFlj72kA+n6Y5jBnNoH1sevW1s+Z6LFjzpiQba+g07lYP9cdZwVs7tqISatJyubMsDXbQmy/71Mq1zXeloPnwWhPsvUpSnQw/j8vJLrrLDUSJWaPXw1mZEZMBPxysLiJSeS6v+s1Cdyvkx8EzSGH7zcQ/10F8AM7NC6+6Na0OWIuAfgpGoD85T6tQs+inE5OD6dZdBSKHrubMbDt28YI6B5BE6gurgfpcL5BeBJA4Ky/ALjOrQle+cd8L1g==
X-Received: by 2002:a25:d048:0:b0:dcd:551f:1e2 with SMTP id
 3f1490d57ef6-dee4f3694bbmr8978126276.34.1715601555547; Mon, 13 May 2024
 04:59:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com> <20240504-pinctrl-cleanup-v2-7-26c5f2dc1181@nxp.com>
In-Reply-To: <20240504-pinctrl-cleanup-v2-7-26c5f2dc1181@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 May 2024 13:59:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUD=1rpns_mLF2rMM-x5EnOK7TExaJxoJVkbXjVz1H8uQ@mail.gmail.com>
Message-ID: <CAMuHMdUD=1rpns_mLF2rMM-x5EnOK7TExaJxoJVkbXjVz1H8uQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/20] pinctrl: renesas: Use scope based of_node_put() cleanups
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
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peng,

On Sat, May 4, 2024 at 3:14=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Use scope based of_node_put() cleanup to simplify code.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/pinctrl/renesas/pinctrl-rzn1.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzn1.c

You missed one trivial conversion, presumably because no error handling
and thus no of_node_put() is involved?

@@ -737,13 +737,12 @@ static int rzn1_pinctrl_parse_groups(struct
device_node *np,

 static int rzn1_pinctrl_count_function_groups(struct device_node *np)
 {
-       struct device_node *child;
        int count =3D 0;

        if (of_property_count_u32_elems(np, RZN1_PINS_PROP) > 0)
                count++;

-       for_each_child_of_node(np, child) {
+       for_each_child_of_node_scoped(np, child) {
                if (of_property_count_u32_elems(child, RZN1_PINS_PROP) > 0)
                        count++;
        }

If you prefer not to include this, I will send a small patch myself later.

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

