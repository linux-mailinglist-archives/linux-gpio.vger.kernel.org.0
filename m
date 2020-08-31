Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 207B8257B11
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Aug 2020 16:08:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbgHaOIu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 Aug 2020 10:08:50 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:45719 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726359AbgHaOIu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Aug 2020 10:08:50 -0400
Received: by mail-ot1-f65.google.com with SMTP id g96so2826728otb.12;
        Mon, 31 Aug 2020 07:08:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1b33Slxg2dQNNbMdOgphme3zHXhN0EltmeYEvvFRy6g=;
        b=UeMClv742gwq8R24rvH/y+U9Td1LQQw7th8C8eNKIPRllqV3/cxrcvnGLvPkD2CnpM
         KSVdN1nCWMtuenvyHhIKA2JgRkjFD+VNI78W+wyTGN800AScxL3ccQC2indDIcQ0GNTm
         Wh5pHZIkFSZKKjGGzxkygXJzNz85HyR7YdfCwG93bS06Xj1xGM+yz00eV2b2Xt70xxWn
         gGr61hYMBNCP6jknhAw0CtPwI7PGFg/Dh/85rAOYeyO0ttbHjpWT7MI6wkScdfq3T51Y
         4xwBM4uoz/RjSf2IH9ESjfsGfSqqyByODfXkRKMdk8buJV2ItDhroXRpy92TVWeRtBPe
         nCkQ==
X-Gm-Message-State: AOAM533K3yOTvvg91zTIdfCxJJlXO08utKOjirVQLYV90FfDVq4/4GoK
        7lMT2X13aYDR3UJxK5nm0m2qHGS7r2pU57z67kA=
X-Google-Smtp-Source: ABdhPJwqnIM8HpDy1Qv0xFkHMfpyW3x6x5GdciLKqgGdKVZ4i9696j0HBXixR3yXG5lBqUyPE+67cgOM9so3z9o/UPo=
X-Received: by 2002:a9d:1b62:: with SMTP id l89mr1055436otl.145.1598882929143;
 Mon, 31 Aug 2020 07:08:49 -0700 (PDT)
MIME-Version: 1.0
References: <87mu2ky4rz.wl-kuninori.morimoto.gx@renesas.com> <87imd8y4r2.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87imd8y4r2.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 31 Aug 2020 16:08:38 +0200
Message-ID: <CAMuHMdWXnnd80E42BVj85sbLDbZU3eJ9F77Ed-njwEoGn+h1GQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] pinctrl: sh-pfc: align driver description title
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Morimoto-san,

On Mon, Aug 24, 2020 at 7:49 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> Now, Renesas Pin Control drivers are under menu,
> but current description are not aligned.
> This patch align these.
>
>         - Emma Mobile EV2 pin control support
>         - R-Mobile APE6 pin control support
>         - R-Mobile A1 pin control support
>         - RZ/N1 pin control support
>         - RZ/G1H pin control support
>         - RZ/G1M pin control support
>
>         + pin control support for Emma Mobile EV2
>         + pin control support for R-Mobile APE6
>         + pin control support for R-Mobile A1
>         + pin control support for RZ/N1
>         + pin control support for RZ/G1H
>         + pin control support for RZ/G1M
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/pinctrl/sh-pfc/Kconfig
> +++ b/drivers/pinctrl/sh-pfc/Kconfig
> @@ -56,7 +56,7 @@ config PINCTRL_SH_PFC
>           This enables pin control drivers for Renesas SuperH and ARM platforms
>
>  config PINCTRL_RZA1
> -       bool "RZ/A1 gpio and pinctrl driver"
> +       bool "gpio and pinctrl driver for RZ/A1"

Do you mind if I change this to "pinctrl support for RZ/A1" (and fix up
the sorting in 4/4), or do you insist on keeping the separation between
"gpio and pinctrl" and "pure" pinctrl drivers?

In reality, all SH, SH-Mobile, and R-Mobile pinctrl drivers are GPIO
controller drivers, too, but this is currently no reflected by their
description.

>         depends on OF
>         depends on ARCH_R7S72100 || COMPILE_TEST
>         select GPIOLIB
> @@ -67,7 +67,7 @@ config PINCTRL_RZA1
>           This selects pinctrl driver for Renesas RZ/A1 platforms.
>
>  config PINCTRL_RZA2
> -       bool "RZ/A2 gpio and pinctrl driver"
> +       bool "gpio and pinctrl driver for RZ/A2"

Likewise.

>         depends on OF
>         depends on ARCH_R7S9210 || COMPILE_TEST
>         select GPIOLIB

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
