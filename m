Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEED128F71A
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Oct 2020 18:47:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389725AbgJOQrn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Oct 2020 12:47:43 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:37551 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388946AbgJOQrn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Oct 2020 12:47:43 -0400
Received: by mail-ot1-f66.google.com with SMTP id m22so3530380ots.4;
        Thu, 15 Oct 2020 09:47:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4ocQz6eVq08qNExBb99R5h1Sr8QnT1VdSmdoW54LJE8=;
        b=cU8FCxhyoA6iAmZkQ9Vf0s6S8S/rrDoOf3lPaVVK5yRDWJ6pPbqXsD3YzlM/CTh/gd
         NKCf0GmKZTp5SAPVgdPVHBwmvjdts0FQXQS1kM30n6yeP7+AvrcDuwRXX/ALhLDh+Vyy
         uAX2qrSM2FQial7zeB7OWswM43MbVz1S8BllGG7sucj9axe1xbLTRnMl9/QX890i93Va
         8Eug+nQAlx7avROXWhIrcdPK1gyLRZkvclT2vNWh2DKFk0jixuesYzcwgyzsd8oDtYXK
         sQ37MLyMTW2YiWRC9ONLppk4GbKf6Onzxobr981VVdudvLVDUskxDVGxlu91TcAK5drR
         H3yQ==
X-Gm-Message-State: AOAM532qs1679dDG0NFIgHyXu5kAMYKaGL/7wk67OmTHyme3y40HQRUD
        PjkYSwrMSAStR1DwATqN4VxRowhUq87ZsCg/e4RcXG9dsXk=
X-Google-Smtp-Source: ABdhPJy0Hqma3W/6XEto8KK9tfDMQO33Bz0sWrWmE/++xXtyKhSSL6AQHHD8kz3tQLW2FVXjzTg2omz7aoFrHb8DUIg=
X-Received: by 2002:a05:6830:210a:: with SMTP id i10mr3261251otc.145.1602780461754;
 Thu, 15 Oct 2020 09:47:41 -0700 (PDT)
MIME-Version: 1.0
References: <20201014110238.9600-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20201014110238.9600-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 15 Oct 2020 18:47:30 +0200
Message-ID: <CAMuHMdWzaPnzs5WBqQz2b2R121TGahx-OzF3v9YjvSm+03SmiA@mail.gmail.com>
Subject: Re: [PATCH RFC] pinctrl: sh-pfc: pfc-r8a77965: Optimize pinctrl image
 size for RZ/G2N
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Marek Vasut <marek.vasut@gmail.com>,
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

On Wed, Oct 14, 2020 at 1:02 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Optimize pinctrl image size, when only RZ/G2N is enabled in the defconfig.
> (ie, disabling CONFIG_ARCH_R8A77965 from the defconfig)
>
> with this patch and disabling CONFIG_ARCH_R8A77965:
> $ size drivers/pinctrl/sh-pfc/pfc-r8a77965.o
>    text    data     bss     dec     hex filename
>   49384       0       0   49384    c0e8 drivers/pinctrl/sh-pfc/pfc-r8a77965.o
>
> without patch:
> $ size drivers/pinctrl/sh-pfc/pfc-r8a77965.o
>    text    data     bss     dec     hex filename
>   51848       0       0   51848    ca88 drivers/pinctrl/sh-pfc/pfc-r8a77965.o
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> ---
> This patch will save ~ 6KB=(3x 2KB/SoC) of memory on RZ/G2[HMN] u-boot[1] with
> multi dtb support. As per discussion [1], u-boot imports PFC and Clock tables from Linux.
>
> [1] https://patchwork.ozlabs.org/project/uboot/patch/20201013085205.6075-4-biju.das.jz@bp.renesas.com/
>
> 1) By compiling out Automative parts
> $ size drivers/pinctrl/renesas/pfc-r8a77965.o
>    text    data     bss     dec     hex filename
>   46141       0       0   46141    b43d drivers/pinctrl/renesas/pfc-r8a77965.o
>
> 2) without patch
> $ size drivers/pinctrl/renesas/pfc-r8a77965.o
>    text    data     bss     dec     hex filename
>   48191       0       0   48191    bc3f drivers/pinctrl/renesas/pfc-r8a77965.o
>
> Please share your comments.

This looks worthwhile to me, also for other SoCs.

> --- a/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
> @@ -18,6 +18,14 @@
>  #include "core.h"
>  #include "sh_pfc.h"
>
> +#ifdef CONFIG_PINCTRL_PFC_R8A77965
> +#define PFC_R8A77965_GROUP     (30)
> +#define PFC_R8A77965_FUNCTION  (4)
> +#else
> +#define PFC_R8A77965_GROUP     (0)
> +#define PFC_R8A77965_FUNCTION  (0)
> +#endif

While introducing the definitions above reduces the overall number of
#ifdefs slightly, it increases separation between the numbers (30 and 4)
and the data they represent...

> +
>  #define CFG_FLAGS (SH_PFC_PIN_CFG_DRIVE_STRENGTH | SH_PFC_PIN_CFG_PULL_UP_DOWN)
>
>  #define CPU_ALL_GP(fn, sfx)                                            \
> @@ -1847,6 +1855,7 @@ static const unsigned int canfd1_data_mux[] = {
>         CANFD1_TX_MARK,         CANFD1_RX_MARK,
>  };
>
> +#ifdef CONFIG_PINCTRL_PFC_R8A77965
>  /* - DRIF0 --------------------------------------------------------------- */
>  static const unsigned int drif0_ctrl_a_pins[] = {
>         /* CLK, SYNC */
> @@ -2120,6 +2129,7 @@ static const unsigned int drif3_data1_b_pins[] = {
>  static const unsigned int drif3_data1_b_mux[] = {
>         RIF3_D1_B_MARK,
>  };
> +#endif
>
>  /* - DU --------------------------------------------------------------------- */
>  static const unsigned int du_rgb666_pins[] = {
> @@ -4380,7 +4390,7 @@ static const unsigned int vin5_clk_mux[] = {
>
>  static const struct {
>         struct sh_pfc_pin_group common[318];
> -       struct sh_pfc_pin_group automotive[30];
> +       struct sh_pfc_pin_group automotive[PFC_R8A77965_GROUP];

Hence I'm more inclined to just do:

    +#ifdef CONFIG_PINCTRL_PFC_R8A77965
            struct sh_pfc_pin_group automotive[30];
    +#endif

here, and move the #ifdef/#endif accordingly.

>  } pinmux_groups = {
>         .common = {
>                 SH_PFC_PIN_GROUP(audio_clk_a_a),
> @@ -4703,6 +4713,7 @@ static const struct {
>                 SH_PFC_PIN_GROUP(vin5_clk),
>         },
>         .automotive = {
> +#ifdef CONFIG_PINCTRL_PFC_R8A77965
>                 SH_PFC_PIN_GROUP(drif0_ctrl_a),
>                 SH_PFC_PIN_GROUP(drif0_data0_a),
>                 SH_PFC_PIN_GROUP(drif0_data1_a),
> @@ -4733,6 +4744,7 @@ static const struct {
>                 SH_PFC_PIN_GROUP(drif3_ctrl_b),
>                 SH_PFC_PIN_GROUP(drif3_data0_b),
>                 SH_PFC_PIN_GROUP(drif3_data1_b),
> +#endif
>         }
>  };

Same for the functions.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
