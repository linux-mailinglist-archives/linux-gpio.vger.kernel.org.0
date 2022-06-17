Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D519B54FA1A
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jun 2022 17:20:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382581AbiFQPTJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jun 2022 11:19:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382409AbiFQPTH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jun 2022 11:19:07 -0400
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFD1937028;
        Fri, 17 Jun 2022 08:19:06 -0700 (PDT)
Received: by mail-qv1-f44.google.com with SMTP id i17so207625qvo.13;
        Fri, 17 Jun 2022 08:19:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lsIWEWzTzOyc8CJ2FCjE9TLa/n37hCpK/hslTg5l3TE=;
        b=ZgXv6gglFCIk5Sz2e1jEIzJkj9oJH254xBOPQRe2ajktaVbAfyBxRgQ4fm4gyJqJxN
         Bqi+qaJLUN5C6xCN8e7szXtzovBh5s8s1flxGLnme1tPMJRatyMY0ohjNf39NqnI56vs
         BIChe3OZmJugOEW6+eVz0Avqmff9fkl9jNjUJKSi24N0Y37vSql5NB23+TquzMHvY/WV
         2PGhjpkKcqvqeQkVvXF/cIT/1426gSiKnje2YlNe7Vjc/R5Jy3F8yr9rQBM7XZnA/59u
         RJczXP21OZuGdQ6/HsaY3cOZyU3+YQ6UI5SrcMwqgTQHLa+Ved1TvW43yy7e+UYf7LPi
         kxGQ==
X-Gm-Message-State: AJIora+zBwlwZWVxFFgA3CNuTLUZsns3s6hZKAN4AJLQhDYdjx1AjZq8
        /4LkmMSxbcQ97BpdoRS6Ez8Wm7RYIYcowg==
X-Google-Smtp-Source: AGRyM1v2fST9ZiOYwXx70/N4aCWaB3PXC/lwUrefb75YS4IFn1TITBXgtj64vaJ4lQihQ9zrWcExWw==
X-Received: by 2002:a05:6214:1d25:b0:464:55a9:48df with SMTP id f5-20020a0562141d2500b0046455a948dfmr8722254qvd.113.1655479145787;
        Fri, 17 Jun 2022 08:19:05 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id j5-20020a05620a000500b006a74458410csm4849012qki.123.2022.06.17.08.19.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 08:19:05 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id l66so6335424ybl.10;
        Fri, 17 Jun 2022 08:19:05 -0700 (PDT)
X-Received: by 2002:a25:d146:0:b0:668:aa24:c321 with SMTP id
 i67-20020a25d146000000b00668aa24c321mr7165927ybg.89.1655479145180; Fri, 17
 Jun 2022 08:19:05 -0700 (PDT)
MIME-Version: 1.0
References: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com> <87fsk7kcn3.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87fsk7kcn3.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 17 Jun 2022 17:18:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX-Pj4LwN7JYbXmEsUJ5pL40UbOxxZOXSi-OyqR0nQJxA@mail.gmail.com>
Message-ID: <CAMuHMdX-Pj4LwN7JYbXmEsUJ5pL40UbOxxZOXSi-OyqR0nQJxA@mail.gmail.com>
Subject: Re: [PATCH v3 17/21] pinctrl: renesas: r8a779g0: add missing FlaxRay
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
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

Thanks for your patch!

On Tue, Jun 14, 2022 at 8:00 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> This patch adds missing FlaxRay pins.

FlexRay (also in the subject).

> Because Document has 2xFXR_TXENA/B pin with no suffix (_A, _B),
> this patch name it as _X.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

> --- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
> +++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
> @@ -338,8 +338,8 @@
>
>  /* IP1SR2 */           /* 0 */                 /* 1 */                 /* 2 */         /* 3            4        5        6        7        8        9        A        B        C        D        E        F */
>  #define IP1SR2_3_0     FM(TPU0TO0)             FM(CANFD6_RX)           F_(0, 0)        FM(TCLK1_A)     F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> -#define IP1SR2_7_4     FM(CAN_CLK)             F_(0, 0)                F_(0, 0)        F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> -#define IP1SR2_11_8    FM(CANFD0_TX)           F_(0, 0)                F_(0, 0)        F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP1SR2_7_4     FM(CAN_CLK)             FM(FXR_TXENA_X_N)       F_(0, 0)        F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)

FXR_TXENA_N_X (everywhere)

> +#define IP1SR2_11_8    FM(CANFD0_TX)           FM(FXR_TXENB_X_N)       F_(0, 0)        F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)

FXR_TXENB_N_X (everywhere)

>  #define IP1SR2_15_12   FM(CANFD0_RX)           FM(STPWT_EXTFXR)        F_(0, 0)        F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
>  #define IP1SR2_19_16   FM(CANFD2_TX)           FM(TPU0TO2)             F_(0, 0)        FM(TCLK3_A)     F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
>  #define IP1SR2_23_20   FM(CANFD2_RX)           FM(TPU0TO3)             FM(PWM1)        FM(TCLK4_A)     F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)

Again, as the suffixes become part of the DT ABI when defining pin
groups, we should get the conflicts resolved, and this cannot be
applied as-is.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
