Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB42510BF9C
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2019 22:45:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728685AbfK0VoD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Nov 2019 16:44:03 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:35451 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728174AbfK0Uh7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Nov 2019 15:37:59 -0500
Received: by mail-ot1-f65.google.com with SMTP id 23so18544059otf.2;
        Wed, 27 Nov 2019 12:37:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=14vyCpwlco5dNMekZ671HzsQ/qD/jZMl32Sz5ULoC/U=;
        b=EXzhuoyV1OLRcuwocYrAZ7FKZEIUjtjNrYygi24X9SokyLEPz0XRMvGUmsXzJHPEsm
         HEjGyocRwmBgOCv3NqKYx1IVM9tRQsIdHEPjm05IQVIfhAkknunCKokl0v8sHdzSl2cJ
         qkQhhvTLVPe5s3bAlhaeh/sL21g84jTENGy/B4ISDhpZHxsnODQ2vMbdu3b8L0iseCsh
         4zTwpXFXwAoUA+iEQHJJpAaCPZROsJuvBlOo65Nkn/9NhUoKvK7dmge+9j+OL+oL1vzI
         Jn8v5fVJX7HNWSFy+XmU4Q07pNCriIeqUft32P+RN3GpoVmRCMLFFQI2InxLvvTiYFZl
         DHTQ==
X-Gm-Message-State: APjAAAUU9SGfpxDvmtC2lMC/+uldHntpWEgb3fvdJW3lrFGeUqHPEwW/
        uP1to04+2EeUB1p0oLSN9rxkPgRIlohy+5nhEcU=
X-Google-Smtp-Source: APXvYqyekyFnyyTzxDAaVF4lh76x3pVg0AJcETDtG/R5UDB8kyib7ugeAakdgVvr7ZJMAAkTJwIUv0P5kqimosEUmPw=
X-Received: by 2002:a9d:2073:: with SMTP id n106mr5117337ota.145.1574887078997;
 Wed, 27 Nov 2019 12:37:58 -0800 (PST)
MIME-Version: 1.0
References: <cover.1574871463.git.nishadkamdar@gmail.com> <5a7ed2e4b58ba7ff2f0638a2435a3a1e1c62c9f6.1574871463.git.nishadkamdar@gmail.com>
In-Reply-To: <5a7ed2e4b58ba7ff2f0638a2435a3a1e1c62c9f6.1574871463.git.nishadkamdar@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 27 Nov 2019 21:37:47 +0100
Message-ID: <CAMuHMdUqfRioTBV27AKx9zv9YuSqEod6x+A4aguf=h20TDXr6w@mail.gmail.com>
Subject: Re: [PATCH 4/5] pinctrl: sh-pfc: Use the correct style for SPDX
 License Identifier
To:     Nishad Kamdar <nishadkamdar@gmail.com>
Cc:     =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joe Perches <joe@perches.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-mediatek@lists.infradead.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Nishad,

On Wed, Nov 27, 2019 at 5:46 PM Nishad Kamdar <nishadkamdar@gmail.com> wrote:
> This patch corrects the SPDX License Identifier style in
> header files related to Reneses Soc pinctrl driver.
> It assigns explicit block comment for the SPDX License Identifier.

Is it incorrect to not have an explicit block comment?
Other recommendations have been to integrate the SPDX comment line
into an existing comment header, if it exists....

> Changes made by using a script provided by Joe Perches here:
> https://lkml.org/lkml/2019/2/7/46.
>
> Suggested-by: Joe Perches <joe@perches.com>
> Signed-off-by: Nishad Kamdar <nishadkamdar@gmail.com>
> ---
>  drivers/pinctrl/sh-pfc/core.h   | 4 ++--
>  drivers/pinctrl/sh-pfc/sh_pfc.h | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/pinctrl/sh-pfc/core.h b/drivers/pinctrl/sh-pfc/core.h
> index b5b1d163e98a..5ad0ab8f9e14 100644
> --- a/drivers/pinctrl/sh-pfc/core.h
> +++ b/drivers/pinctrl/sh-pfc/core.h
> @@ -1,5 +1,5 @@
> -/* SPDX-License-Identifier: GPL-2.0
> - *
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
>   * SuperH Pin Function Controller support.
>   *
>   * Copyright (C) 2012  Renesas Solutions Corp.
> diff --git a/drivers/pinctrl/sh-pfc/sh_pfc.h b/drivers/pinctrl/sh-pfc/sh_pfc.h
> index 640d2a4cb838..fff9cbb7a0f8 100644
> --- a/drivers/pinctrl/sh-pfc/sh_pfc.h
> +++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
> @@ -1,5 +1,5 @@
> -/* SPDX-License-Identifier: GPL-2.0
> - *
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
>   * SuperH Pin Function Controller Support
>   *
>   * Copyright (c) 2008 Magnus Damm

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
