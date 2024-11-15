Return-Path: <linux-gpio+bounces-13050-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 544D19CF288
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Nov 2024 18:14:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 120A828E389
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Nov 2024 17:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C18561D618C;
	Fri, 15 Nov 2024 17:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iwE4BVqv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71AF2163;
	Fri, 15 Nov 2024 17:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731690854; cv=none; b=Y7uTNNhyDya3XtrwR8MWQsgWp4KkffRj1WePk6EUoV9BLnBc4h6WRgeGkisgJ/aGjDXUxLeMK2yIamra42ki1dl3IGg2vcRd/wCn90wVNFOM9gMTF/j9whN0ZxJSjynth7aN826mP5P8EV82oJfmUUvNLS0vGzb2ZVB2AFq2HKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731690854; c=relaxed/simple;
	bh=UKf2D05K/gyn5pqOi5hcQw1T7lYxnxkCGJHDkIuIm10=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M60mnVKM+3vKAJ7N1FqGVcIXj+0PWjzF46BQ5h7FENdSWD3De8psKpt6691B1JdQ/KFI6572gwYMKeegpkCyMCi5/xv61Zt4MaBa6YVWe6HEqqxa6SEOKqIbX+BL80mS4vhwvK5kHliLweAwPVWyTH+8cAL4waz9npEwkPJ1Qxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iwE4BVqv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 000F6C4CED8;
	Fri, 15 Nov 2024 17:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731690854;
	bh=UKf2D05K/gyn5pqOi5hcQw1T7lYxnxkCGJHDkIuIm10=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iwE4BVqvZda0J1277F1H4YcH9sfxhJaJslulxchAbGjqEmV76eegLoEsjV42rj3pR
	 LCtxWK0QJDoxwjhJjV9vZ7bq/YnYVbu2uLiO2zrF7AfPhXtNfIqQUb3p7g++rKbjsj
	 I3TtFIoSCbmurvQ2Yeu4+IBguDut/bNADoqC+MDFf+BxO6L7wJT4iyZ1L8flG6rJgF
	 0mNCM6r+MEuqJVN1m9WHpa8WvKUSEW7SzOrK6fNVfv6FjiYMeNPV11qRSJJvVW+wQQ
	 zsatj9NCvdHDb49ttt9ZM+T1CP6QYV4AzX3HQfDFPj5whxMCcr+eLx9cy7XlgZlREc
	 hrZVnGBfRO6jw==
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6ea7c26e195so10729957b3.0;
        Fri, 15 Nov 2024 09:14:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUgKJGhpE/64OiAdYibay4AK8vo4e8ccwUs8Zg2DCrFFvlztTAx2K3TDpd6FvpL2d71j3xw2AGkOzDQybSi@vger.kernel.org, AJvYcCXFSZwt1okcpVJTC6FBJze+F3zUaecGh/ZI7RvPwfg0kN1s3aqaXRNGrozI6dC45NIQ0ORc7rSnCjRR@vger.kernel.org, AJvYcCXojsyIWtK4FVIISeSsQWmTZ5nGRVEqzIur6KoSfjY3tHK0AxeXrwgpkQYMA7YaoCBpwwENRsN5zA1BYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWpPy7YoEk6dwzaQA7TiXJY05XQRfPHgKW4ZYp11ipwo5kzZ3f
	bLkDYwFNn5j15utqTM6smxTDh4SlJmWsc1LPhjqgnpvzQIIRT0cOp3uDTK6C8xIq/CMVmK8G5Yz
	u+efnsNBP7XfMalhu5M6mQ+0guw==
X-Google-Smtp-Source: AGHT+IGiE+cnU9ZWYlzlV7eNcWe8xaMDYeLmmNOeSFn104dNU8yMitWKPRWl5TyCIWwi1hpMUQwq+ALlqCkKVFk4tJI=
X-Received: by 2002:a05:690c:d19:b0:6e2:4c7b:e379 with SMTP id
 00721157ae682-6ee55a83a50mr41263137b3.19.1731690853131; Fri, 15 Nov 2024
 09:14:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241113-a4_pinctrl-v6-0-35ba2401ee35@amlogic.com>
 <20241113-a4_pinctrl-v6-4-35ba2401ee35@amlogic.com> <20241113180405.GA653353-robh@kernel.org>
 <1764b1b4-336d-4ca5-ab21-8213691a9622@linaro.org>
In-Reply-To: <1764b1b4-336d-4ca5-ab21-8213691a9622@linaro.org>
From: Rob Herring <robh@kernel.org>
Date: Fri, 15 Nov 2024 11:14:02 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+2v7=egxakPKZ90j9wro+prn5FOjuCGwwsYB8M1GP+mQ@mail.gmail.com>
Message-ID: <CAL_Jsq+2v7=egxakPKZ90j9wro+prn5FOjuCGwwsYB8M1GP+mQ@mail.gmail.com>
Subject: Re: [PATCH v6 4/5] pinctrl: meson: Add driver support for Amlogic A4 SoCs
To: neil.armstrong@linaro.org
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 14, 2024 at 3:21=E2=80=AFAM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> On 13/11/2024 19:04, Rob Herring wrote:
> > On Wed, Nov 13, 2024 at 03:29:42PM +0800, Xianwei Zhao wrote:
> >> Add a new pinctrl driver for Amlogic A4 SoCs which share
> >> the same register layout as the previous Amlogic S4.
> >>
> >> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> >> ---
> >>   drivers/pinctrl/meson/Kconfig              |    6 +
> >>   drivers/pinctrl/meson/Makefile             |    1 +
> >>   drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 1324 ++++++++++++++++++=
++++++++++
> >>   3 files changed, 1331 insertions(+)
> >>
> >> diff --git a/drivers/pinctrl/meson/Kconfig b/drivers/pinctrl/meson/Kco=
nfig
> >> index cc397896762c..3e90bb5ec442 100644
> >> --- a/drivers/pinctrl/meson/Kconfig
> >> +++ b/drivers/pinctrl/meson/Kconfig
> >> @@ -67,6 +67,12 @@ config PINCTRL_MESON_S4
> >>      select PINCTRL_MESON_AXG_PMX
> >>      default y
> >>
> >> +config PINCTRL_AMLOGIC_A4
> >> +    tristate "Amlogic A4 SoC pinctrl driver"
> >> +    depends on ARM64
> >> +    select PINCTRL_MESON_AXG_PMX
> >> +    default y
> >> +
> >>   config PINCTRL_AMLOGIC_C3
> >>      tristate "Amlogic C3 SoC pinctrl driver"
> >>      depends on ARM64
> >> diff --git a/drivers/pinctrl/meson/Makefile b/drivers/pinctrl/meson/Ma=
kefile
> >> index 9e538b9ffb9b..c92a65a83344 100644
> >> --- a/drivers/pinctrl/meson/Makefile
> >> +++ b/drivers/pinctrl/meson/Makefile
> >> @@ -10,5 +10,6 @@ obj-$(CONFIG_PINCTRL_MESON_AXG) +=3D pinctrl-meson-a=
xg.o
> >>   obj-$(CONFIG_PINCTRL_MESON_G12A) +=3D pinctrl-meson-g12a.o
> >>   obj-$(CONFIG_PINCTRL_MESON_A1) +=3D pinctrl-meson-a1.o
> >>   obj-$(CONFIG_PINCTRL_MESON_S4) +=3D pinctrl-meson-s4.o
> >> +obj-$(CONFIG_PINCTRL_AMLOGIC_A4) +=3D pinctrl-amlogic-a4.o
> >>   obj-$(CONFIG_PINCTRL_AMLOGIC_C3) +=3D pinctrl-amlogic-c3.o
> >>   obj-$(CONFIG_PINCTRL_AMLOGIC_T7) +=3D pinctrl-amlogic-t7.o
> >> diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinc=
trl/meson/pinctrl-amlogic-a4.c
> >> new file mode 100644
> >> index 000000000000..edc5f2ba2c8a
> >> --- /dev/null
> >> +++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
> >> @@ -0,0 +1,1324 @@
> >> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> >> +/*
> >> + * Pin controller and GPIO driver for Amlogic A4 SoC.
> >> + *
> >> + * Copyright (c) 2024 Amlogic, Inc. All rights reserved.
> >> + * Author: Xianwei Zhao <xianwei.zhao@amlogic.com>
> >> + *         Huqiang Qin <huqiang.qin@amlogic.com>
> >> + */
> >> +
> >> +#include "pinctrl-meson.h"
> >> +#include "pinctrl-meson-axg-pmx.h"
> >> +#include <dt-bindings/gpio/amlogic-gpio.h>
> >> +
> >> +/* Standard port */
> >> +
> >> +#define GPIOE_0                             0
> >> +#define GPIOE_1                             1
> >> +
> >> +#define GPIOD_0                             2
> >> +#define GPIOD_1                             3
> >> +#define GPIOD_2                             4
> >> +#define GPIOD_3                             5
> >> +#define GPIOD_4                             6
> >> +#define GPIOD_5                             7
> >> +#define GPIOD_6                             8
> >> +#define GPIOD_7                             9
> >> +#define GPIOD_8                             10
> >> +#define GPIOD_9                             11
> >> +#define GPIOD_10                    12
> >> +#define GPIOD_11                    13
> >> +#define GPIOD_12                    14
> >> +#define GPIOD_13                    15
> >> +#define GPIOD_14                    16
> >> +#define GPIOD_15                    17
> >
> > The conversion from bank+index to a single index space seems less than
> > ideal, and looks like a work-around to fit into the existing driver fro=
m
> > a brief look at it.
>
> Not really, it simply adds a custom xlate per SoC, nothing particulary ha=
cky.
>
> I was relunctant at first, but since Xianwei added the plumbing for a per=
-SoC
> xlate, then it was easy to add 3-cells support.
>
> >
> > If there's not really banks of GPIOs here, then DT shouldn't have them
> > either. The question is does anything need to know the bank number
> > and/or index? If it's only for human readability (and matching to
> > datasheet), then just something like this can be done:
> >
> > #define GPIOD(n) (2 + (n))
>
> There's no linear mapping possible, each set of gpios is grouped into log=
ical
> "banks" per group of functions, and this grouping is also in the gpio con=
troller
> register space.

v1 had just that. So it is possible. No one reviewed the driver then,
so I don't know if that was less than ideal on the driver side. But it
looks like that linear map was just moved from DT into the driver. Why
are there a bunch of defines creating a linear mapping? The xlate()
function just converts bank+index into a linear number. At some point
you need arrays of settings I suppose, but why do you need a #define
for every index? Why not an array per bank? I suppose you could use
the above define within the driver to at least not have a bunch of
defines.

Rob

