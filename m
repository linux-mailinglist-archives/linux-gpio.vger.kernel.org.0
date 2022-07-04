Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42B05565A35
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Jul 2022 17:45:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234593AbiGDPow (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Jul 2022 11:44:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234606AbiGDPok (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jul 2022 11:44:40 -0400
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36B3411C1D;
        Mon,  4 Jul 2022 08:44:02 -0700 (PDT)
Received: by mail-qk1-f178.google.com with SMTP id k20so7039216qkj.1;
        Mon, 04 Jul 2022 08:44:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yTm/8iIyu4z0qb6lTUfkXACTU8RFf7EkAmDCI4nDpeE=;
        b=tEmS5YIrydgW/EKU7uNuc1+rEeSb/NqjgAU6r9QmWfnh3aLqGJKCexKe/Q3VMRVo35
         xaJuAO6PrQWoSspyfEdPTuHD7Xrya3yqQUWEJhkxKAsZfmUn4cSQ2WBJMXAGNozyg3IV
         V4Sn8ueKJtl6AsZRSJ2cVjIaARFxZMxOjGspyputEdwuewQdtO5fpFpvCXU/17WJtR1d
         GFBsAF04+lmouEBjfrW2zUNbZ5q1oTBQyeYVDxa8TILhWVXhbprWiN6Oot07nG50OyP+
         NlT/LZaBGNq5DZvPakcsftH2u2WibeBlwARMws2E/metZ0GNoFy9C/s071IAF9nKGjqb
         bUUA==
X-Gm-Message-State: AJIora9wfdpDwELN5A8YBAgYu8G7AETWo8dX98HgxtqojPwfuoF8MDDi
        X8XZTC77PGX/A0XSWBr+KfAgmHWvBRmLpj6v
X-Google-Smtp-Source: AGRyM1uD1hSE1oBvkHoCIvHfcvF3LaiuZDG44Jp8Fv4vg5j27zeBcP/0HOEcOmdu5lmxRTmHxQ1R1g==
X-Received: by 2002:a37:2f86:0:b0:6af:4c8c:ee8b with SMTP id v128-20020a372f86000000b006af4c8cee8bmr20351168qkh.633.1656949441148;
        Mon, 04 Jul 2022 08:44:01 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id bi32-20020a05620a31a000b006af3f3b385csm19921548qkb.98.2022.07.04.08.44.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jul 2022 08:44:00 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-31c8a1e9e33so33333327b3.5;
        Mon, 04 Jul 2022 08:44:00 -0700 (PDT)
X-Received: by 2002:a81:1c4b:0:b0:31c:5f22:6bd3 with SMTP id
 c72-20020a811c4b000000b0031c5f226bd3mr19858294ywc.47.1656949440437; Mon, 04
 Jul 2022 08:44:00 -0700 (PDT)
MIME-Version: 1.0
References: <87h741ty20.wl-kuninori.morimoto.gx@renesas.com> <87y1xdsjar.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87y1xdsjar.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 4 Jul 2022 17:43:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX_yNARv6E-fT12A9_YO=ukAeqa8j=gmz8YqRi7UsMs-A@mail.gmail.com>
Message-ID: <CAMuHMdX_yNARv6E-fT12A9_YO=ukAeqa8j=gmz8YqRi7UsMs-A@mail.gmail.com>
Subject: Re: [PATCH v4 13/23] pinctrl: renesas: r8a779g0: add missing HSCIF3_A
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
> This patch adds missing HSCIF3_A
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
> +++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c

> @@ -2319,9 +2352,12 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
>         SH_PFC_PIN_GROUP(hscif2_data),
>         SH_PFC_PIN_GROUP(hscif2_clk),
>         SH_PFC_PIN_GROUP(hscif2_ctrl),
> -       SH_PFC_PIN_GROUP(hscif3_data),
> -       SH_PFC_PIN_GROUP(hscif3_clk),
> -       SH_PFC_PIN_GROUP(hscif3_ctrl),
> +       SH_PFC_PIN_GROUP(hscif3_data),          /* suffix might be updated */
> +       SH_PFC_PIN_GROUP(hscif3_data_a),        /* suffix might be updated */
> +       SH_PFC_PIN_GROUP(hscif3_clk),           /* suffix might be updated */
> +       SH_PFC_PIN_GROUP(hscif3_clk_a),         /* suffix might be updated */
> +       SH_PFC_PIN_GROUP(hscif3_ctrl),          /* suffix might be updated */
> +       SH_PFC_PIN_GROUP(hscif3_ctrl_a),        /* suffix might be updated */

I'll sort the above while applying (all *_a last).

>
>         SH_PFC_PIN_GROUP(i2c0),
>         SH_PFC_PIN_GROUP(i2c1),
> @@ -2521,9 +2557,13 @@ static const char * const hscif2_groups[] = {
>  };
>
>  static const char * const hscif3_groups[] = {
> +       /* suffix might be updated */
>         "hscif3_data",
> +       "hscif3_data_a",
>         "hscif3_clk",
> +       "hscif3_clk_a",
>         "hscif3_ctrl",
> +       "hscif3_ctrl_a",

Likewise.

>  };
>
>  static const char * const i2c0_groups[] = {

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl-for-v5.20.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
