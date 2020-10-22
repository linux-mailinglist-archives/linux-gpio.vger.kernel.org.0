Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00ADB295E01
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Oct 2020 14:07:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2897858AbgJVMH1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 22 Oct 2020 08:07:27 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:43464 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2897856AbgJVMHY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 22 Oct 2020 08:07:24 -0400
Received: by mail-ot1-f65.google.com with SMTP id k68so1231047otk.10;
        Thu, 22 Oct 2020 05:07:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FRXGRG/JQdhceXP83vUjKEl4Rz43a+2Wgkhokg5rDNs=;
        b=melJJC+Sfc9M4YGlPBWmdI1ov6sE3EWrrags/XOLIccFe07rKqi33jkNIZTtq8DQ9R
         rrL7PsrYqNC11ljDsjQeamEsTiVtLjqM532AxOw1i1+A4EKXasimif8dzZr60dJtwPUf
         nu9b4mHFfvEpDlYNrE4YQ+Wup3XPkZwKyyjwycQR6kh4tn9Yb/140eZtdWJUf12TdY2t
         sowTdsXGoD6jw4zhGKBIBDrJsJxp972AwcvqPeUbBBV05C0b1DRVk+HDSjaGy4xdwTHa
         WlcyGy4ZMmktZRhzdWQ1OzIlUYmvVpKYCnwvWDAbOrsycxzOVxh6SJg6LsiehcGYmUK4
         xbpQ==
X-Gm-Message-State: AOAM531CMDMEr2seRXyUHFlLaKTMoBqBfpcb0LWwv4SJMzkLzUrRaRXk
        3H2bznr0N3yt3ysDgA3OqfjyzpuptdRudRG/Fuc=
X-Google-Smtp-Source: ABdhPJy6CUKOAc8DhgqMhxeTVDSCP+xU3ssxWcsWcjvHES3mVFny/aLGew3GqojgffrEgBjaIxe0EsdztNHRbSeArnA=
X-Received: by 2002:a9d:3b76:: with SMTP id z109mr1702779otb.250.1603368443803;
 Thu, 22 Oct 2020 05:07:23 -0700 (PDT)
MIME-Version: 1.0
References: <20201019124258.4574-1-biju.das.jz@bp.renesas.com> <20201019124258.4574-7-biju.das.jz@bp.renesas.com>
In-Reply-To: <20201019124258.4574-7-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 22 Oct 2020 14:07:12 +0200
Message-ID: <CAMuHMdU-zAq6AYhqhKZbLyjaQv6L-qSty6GtkJWOuvZiK9qhHw@mail.gmail.com>
Subject: Re: [PATCH 6/6] pinctrl: renesas: r8a7791: Optimize pinctrl image
 size for R8A774[3|4]
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

On Mon, Oct 19, 2020 at 2:43 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> This driver supports both RZ/G1[M|N] and R-Car M2-W/M2-N(R8A779[1|3])
> SoC's. Optimize pinctrl image size for RZ/G1[M|N], when R-Car M2-W/M2-N
> (R8A779[1|3]) SoC's are disabled in the shmobile_defconfig.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl-for-v5.11, with comments added to
the #endifs where appropriate.

> --- a/drivers/pinctrl/renesas/pfc-r8a7791.c
> +++ b/drivers/pinctrl/renesas/pfc-r8a7791.c
> @@ -1700,6 +1700,7 @@ static const struct sh_pfc_pin pinmux_pins[] = {
>         PINMUX_GPIO_GP_ALL(),
>  };
>
> +#if defined(CONFIG_PINCTRL_PFC_R8A7791) || defined(CONFIG_PINCTRL_PFC_R8A7793)
>  /* - ADI -------------------------------------------------------------------- */
>  static const unsigned int adi_common_pins[] = {
>         /* ADIDATA, ADICS/SAMP, ADICLK */
> @@ -1765,7 +1766,7 @@ static const unsigned int adi_chsel2_b_mux[] = {
>         /* ADICHS B 2 */
>         ADICHS2_B_MARK,
>  };
> -
> +#endif
>  /* - Audio Clock ------------------------------------------------------------ */
>  static const unsigned int audio_clk_a_pins[] = {
>         /* CLK */
> @@ -2553,6 +2554,7 @@ static const unsigned int intc_irq3_pins[] = {
>  static const unsigned int intc_irq3_mux[] = {
>         IRQ3_MARK,
>  };
> +#if defined(CONFIG_PINCTRL_PFC_R8A7791) || defined(CONFIG_PINCTRL_PFC_R8A7793)

BTW, if we get more of these automotive-only pin groups, we may consider
moving them together, to reduce the number of #ifdefs.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
