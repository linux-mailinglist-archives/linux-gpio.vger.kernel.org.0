Return-Path: <linux-gpio+bounces-973-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 228638036ED
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 15:35:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A646C1F21269
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 14:35:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C26F72377A;
	Mon,  4 Dec 2023 14:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xlwGKnLU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1D7ED40
	for <linux-gpio@vger.kernel.org>; Mon,  4 Dec 2023 06:35:47 -0800 (PST)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-db7d198e791so1628061276.3
        for <linux-gpio@vger.kernel.org>; Mon, 04 Dec 2023 06:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701700547; x=1702305347; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xp0IjsfcwvSP4xwYPboGJw1FyStABvBFv/P2infLWSw=;
        b=xlwGKnLUhlTO8JDe7S+9heelQijfnKnpHBMF33ed/RornzLZ5KReX5iDfiW/J/VORC
         qB4uyclZMxXAg3vyZpjD75I7qO8Xwzl8GcTIjkHVeZZz1ZaMZVoJk+HgZof7KL0+SfWJ
         m4SLEsDowCcrOKRQHtoAvuZTP5KHAmD2CYNapRHCq7kDzD7U9IYTlrGqbB5tIPPffCv9
         71tzj4pHKFga5son8ICGtp1LEnOhcZpNpol/Od25UsrD/sJHuim0I0DCGY+N02w5suj3
         yF2jpGJlwWwMao2iSsvC8hWey/R1GpWFV6Yy+nhEHwblHVQN7+dxLLaSdhSAg6ywtMz0
         vsfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701700547; x=1702305347;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xp0IjsfcwvSP4xwYPboGJw1FyStABvBFv/P2infLWSw=;
        b=C29cYkHGrYZ3Pk77ixbQXyCoGjINELFAcZ26LjsnYNRD9HJiWlhb3Nog46IHpot37A
         ewmnGvW4hjNeEfa0iUYhp1vyBrKm8VjDqAfZgrN3Ns4IGSHm9EhADZRMJPmCLoEpPRbV
         EgXyug8G5VOLPQPgULO3uGA/WVZ3ykEtrZJnpTt0/QEs63su75RjP97X4BtTVTho2f3f
         PzyonyOP49kRt50CJxAQ5iHllahoKbIqxwDqYthXuYIWVx3cT/ZHv6fgD3GTXKwllOU4
         TIs0ovisEORqAWXEX2tgj2SeoW9oOckJkyQD3BuWvfQLzFhMjXv+uT6bIO/HI7fwQLUo
         lvZA==
X-Gm-Message-State: AOJu0Yw0IJ3F2HqUnz9CpfCXMXpc+B4oG07b/WqHqHPd16EQ4zy6rkZT
	CuljDmvXHzdVjQ0Qe5XWsHEo5ETF6Sqo0xmWD6x6Ew==
X-Google-Smtp-Source: AGHT+IGlzR6jMdp+UQm1IidwrnLTDQIh/k3Qz3N9UjI37v6TipIB4xIDPl1uX1mVMB9Ef/A4gLOOuoKxBOrzTG+rKVg=
X-Received: by 2002:a25:ad4a:0:b0:db7:dacf:4d49 with SMTP id
 l10-20020a25ad4a000000b00db7dacf4d49mr1286460ybe.69.1701700546895; Mon, 04
 Dec 2023 06:35:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231129161459.1002323-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdZAriTP3iOgmwvoAH-3-aO_ugoEkBHE7mHH5YLxhMXSXg@mail.gmail.com> <b2175abe-b989-4b77-891e-67e8240ba0be@linaro.org>
In-Reply-To: <b2175abe-b989-4b77-891e-67e8240ba0be@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 4 Dec 2023 15:35:35 +0100
Message-ID: <CACRpkdaTKAwCN_dbcAn_qKLi2R15=BzJjpg85XtL=Ap6ORSgUQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/23] pinctrl: Convert struct group_desc to use struct pingroup
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Jianlong Huang <jianlong.huang@starfivetech.com>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-mips@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	NXP Linux Team <linux-imx@nxp.com>, Sean Wang <sean.wang@kernel.org>, 
	Paul Cercueil <paul@crapouillou.net>, Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, 
	Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, 
	Hal Feng <hal.feng@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 4, 2023 at 8:49=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On 01/12/2023 15:05, Linus Walleij wrote:
> > On Wed, Nov 29, 2023 at 5:15=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> >
> >> The struct group_desc has a lot of duplication with struct pingroup.
> >> Deduplicate that by embeddind the latter in the former and convert
> >> users.
> >>
> >> Linus, assuming everything is fine, I can push this to my tree.
> >> Or you can apply it (assumming all CIs and people are happy with
> >> the series).
> >
> > I applied the series to devel so we get some rotation in linux-next,
> > augmenting the relevant commit messages as discussed!
> >
>
> ... and this next fails to build on standard defconfig:
> https://krzk.eu/#/builders/76/builds/420/steps/9/logs/stdio
>
> I did not bisect yet, so I am just guessing that error looks like
> something introduced here.

Ooops how unfortunate.

I actually thought the autobuilders grabbing patches from the mail lists
would have warned.

I dropped the majority of the patches (not the preparatory patches)
from my tree again, rinse and repeat.

Yours,
Linus Walleij

