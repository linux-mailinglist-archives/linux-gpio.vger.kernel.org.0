Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A594295DE7
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Oct 2020 14:00:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503115AbgJVMAp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 22 Oct 2020 08:00:45 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:41476 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438249AbgJVMAm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 22 Oct 2020 08:00:42 -0400
Received: by mail-oi1-f194.google.com with SMTP id q136so1415705oic.8;
        Thu, 22 Oct 2020 05:00:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VFK0HEIBvD+yCP5hv84+/XhE8Vl4MJcw/cpmqx8xDkY=;
        b=U9GaZMbkkA4k7YRjDvO2/b3mmUx0ToQ9jhfS/mbEhs5LOwefXUZbcgKBwKbKFtplyO
         9t93y2ctod2gEiZsaO4aTZFi4YR3V+5mU+i52itYwrFcLwsCKtnI0PMJhpIHm9/0faWI
         DaVirSAoAMtA9QgdiaPLeTAK/9LVsP5piKpGrBuqZqK/4JDlgz09c6FzallqvbCpqajG
         sURkOxXbprW6RHBQR6FQEKO7T683ppaxdDjon7c4V0GVHE4wt9hzQC6t8OpQoZV9k7QS
         h/2Y22Xsic9GDswYOodP2XjCVP6Np90Ma7GnKVB2RQVF1b/hOzSYxqNmyw0nHl3xs530
         B9qQ==
X-Gm-Message-State: AOAM531dnLGT7B8++hpqgf4TNtOD4CePdt67nusrranHv5SZtatA6Fwa
        FCGXUn4np6f7fUJWwdPqYYD1hk1tQp1sx84aS9qyzuV6
X-Google-Smtp-Source: ABdhPJz80tZS2g4EeoPag6oJb46lfDqOISIdIPEzLmHzhvkMKhhyL5ryZi5xB4pKSaguFeBFadN13xUxDWHaxgAEdK8=
X-Received: by 2002:aca:c490:: with SMTP id u138mr1349208oif.54.1603368041446;
 Thu, 22 Oct 2020 05:00:41 -0700 (PDT)
MIME-Version: 1.0
References: <20201019124258.4574-1-biju.das.jz@bp.renesas.com> <20201019124258.4574-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20201019124258.4574-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 22 Oct 2020 14:00:29 +0200
Message-ID: <CAMuHMdUkDYiXDwhy_6SiOetGW43hdFOjzsDVYD2aXU3UsgT8Ag@mail.gmail.com>
Subject: Re: [PATCH 1/6] pinctrl: renesas: r8a77951: Optimize pinctrl image
 size for R8A774E1
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Biju,

On Mon, Oct 19, 2020 at 2:43 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> This driver supports both RZ/G2H and R-Car H3(R8A77951) SoC's.
> Optimize pinctrl image size for RZ/G2H, when R-Car H3(R8A77951) SoC is
> disabled in the defconfig.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pfc-r8a77951.c
> +++ b/drivers/pinctrl/renesas/pfc-r8a77951.c
> @@ -1827,6 +1827,7 @@ static const unsigned int canfd1_data_mux[] = {
>         CANFD1_TX_MARK,         CANFD1_RX_MARK,
>  };
>
> +#ifdef CONFIG_PINCTRL_PFC_R8A77951
>  /* - DRIF0 --------------------------------------------------------------- */
>  static const unsigned int drif0_ctrl_a_pins[] = {
>         /* CLK, SYNC */
> @@ -2041,6 +2042,7 @@ static const unsigned int drif3_data1_b_pins[] = {
>  static const unsigned int drif3_data1_b_mux[] = {
>         RIF3_D1_B_MARK,
>  };
> +#endif

For long #ifdef blocks, where you cannot see both the #ifdef and #endif
in your editor window, it is recommended to add comments to the #endif.
No worries, I'll fix that myself while applying.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl-for-v5.11, with comments added to
the #endifs where appropriate.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
