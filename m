Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CABC3565A3C
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Jul 2022 17:45:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233796AbiGDPox (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Jul 2022 11:44:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234194AbiGDPom (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jul 2022 11:44:42 -0400
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DB2711C3A;
        Mon,  4 Jul 2022 08:44:07 -0700 (PDT)
Received: by mail-qk1-f170.google.com with SMTP id z7so7006200qko.8;
        Mon, 04 Jul 2022 08:44:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XaZcEiGZU6yoW00uNxVd8pdu0Yz4LF06EmZhqbZeyjU=;
        b=R08l1lK3H/9t0R/sy4wAKYezq+YZ8JfdE1WiLAwiPwyZtztmb+pBx5xXA0Pgj9io0+
         0gYpnzN9t0ccqon/oYtrEPlgkB7OAeB68fgcDEKcnPzkfgrpUZnzqraxWY5vF+kP8O5a
         nFucZtal8wlpeZgybGBPLA3BcPoP52vbrPovL/pBKr1dp/2GEDLH3OBFVGVHq9JDwWhe
         0SiN/x5bLhkO5Z0oW4dfwFONYZgtnb/a7wlOwiYUYUJqmoDql2fZdwtUClPoj1i+lb1G
         AEhPU+uLmY7Hvx3y13qCbcojp9MCPCGe9tBgwciJalQ4rkf9ssPnTG1/AOuP3y8VIVhC
         /ahg==
X-Gm-Message-State: AJIora/78hUfBFAyJOO79BBzozhSml3K84m8CdRH575GRY3KddFTt4Fu
        IZR6jG2BWbNST/Nr/ZYFTI2OOcdJJXjoNm+I
X-Google-Smtp-Source: AGRyM1t8txepYcgkK5Snu7uRT/22x9pl56X/9TKAhS4bTQnZXh6aIrOkDIRuhoj/YY53gVPOEIyt2Q==
X-Received: by 2002:a05:620a:cce:b0:6af:59b:17bb with SMTP id b14-20020a05620a0cce00b006af059b17bbmr20257582qkj.423.1656949446150;
        Mon, 04 Jul 2022 08:44:06 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id y9-20020a05620a25c900b006a370031c3esm25944587qko.106.2022.07.04.08.44.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jul 2022 08:44:05 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-31c89653790so34625857b3.13;
        Mon, 04 Jul 2022 08:44:05 -0700 (PDT)
X-Received: by 2002:a0d:c787:0:b0:31b:a963:e1de with SMTP id
 j129-20020a0dc787000000b0031ba963e1demr33845058ywd.283.1656949445694; Mon, 04
 Jul 2022 08:44:05 -0700 (PDT)
MIME-Version: 1.0
References: <87h741ty20.wl-kuninori.morimoto.gx@renesas.com> <87wncxsjah.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87wncxsjah.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 4 Jul 2022 17:43:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWGHRDnFW-Ej5u8gwJieQJE15=CS+xyHaAc8n2hcQVUug@mail.gmail.com>
Message-ID: <CAMuHMdWGHRDnFW-Ej5u8gwJieQJE15=CS+xyHaAc8n2hcQVUug@mail.gmail.com>
Subject: Re: [PATCH v4 14/23] pinctrl: renesas: r8a779g0: add missing HSCIF1_X
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Morimoto-san,

On Fri, Jul 1, 2022 at 3:39 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> This patch adds missing HSCIF1.
> Because Document (Rev.0.51) has 2xHSCIF1 with no suffix (_A, _B),
> this patch name it as _X.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
> +++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
> @@ -2346,9 +2376,12 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
>         SH_PFC_PIN_GROUP(hscif0_data),
>         SH_PFC_PIN_GROUP(hscif0_clk),
>         SH_PFC_PIN_GROUP(hscif0_ctrl),
> -       SH_PFC_PIN_GROUP(hscif1_data),
> -       SH_PFC_PIN_GROUP(hscif1_clk),
> -       SH_PFC_PIN_GROUP(hscif1_ctrl),
> +       SH_PFC_PIN_GROUP(hscif1_data),          /* suffix might be updated */
> +       SH_PFC_PIN_GROUP(hscif1_data_x),        /* suffix might be updated */
> +       SH_PFC_PIN_GROUP(hscif1_clk),           /* suffix might be updated */
> +       SH_PFC_PIN_GROUP(hscif1_clk_x),         /* suffix might be updated */
> +       SH_PFC_PIN_GROUP(hscif1_ctrl),          /* suffix might be updated */
> +       SH_PFC_PIN_GROUP(hscif1_ctrl_x),        /* suffix might be updated */
>         SH_PFC_PIN_GROUP(hscif2_data),
>         SH_PFC_PIN_GROUP(hscif2_clk),
>         SH_PFC_PIN_GROUP(hscif2_ctrl),
> @@ -2545,9 +2578,13 @@ static const char * const hscif0_groups[] = {
>  };
>
>  static const char * const hscif1_groups[] = {
> +       /* suffix might be updated */
>         "hscif1_data",
> +       "hscif1_data_x",
>         "hscif1_clk",
> +       "hscif1_clk_x",
>         "hscif1_ctrl",
> +       "hscif1_ctrl_x",
>  };

I'll sort the above (all *_x last) while applying.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl-for-v5.20.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
