Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A60754F9EE
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jun 2022 17:14:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383071AbiFQPOO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jun 2022 11:14:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382988AbiFQPOO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jun 2022 11:14:14 -0400
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31A952AC78;
        Fri, 17 Jun 2022 08:14:13 -0700 (PDT)
Received: by mail-qk1-f177.google.com with SMTP id a184so3354195qkg.5;
        Fri, 17 Jun 2022 08:14:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xAXgLDM4gkt1HVWUdxgtE4x0VmKT05XMvgdH5S1r/lk=;
        b=XONGvoLSI88bNE1QkHry/41X/fWEOk8NkfIucxA2c3I5vFTfC4O4RR2F7iBe/AZO4a
         iAtJy9uLg77FNQgj3N5L6Pv10nwofdWDCEqPlIdCb3PLP/Ijt7ogkZvPn71ekK2Insc4
         gmlOSFTBYTjclQHBZFVvFcjYKUzn/YDdBWJIN823xQoV5wvcp4eau0nFy/H1TjGv3Dlk
         3E7VPETLwdZ4vrSDKK6vDwE3gknUI3/0cgtLxATpDhTv8LRxOkHrhxfYQ9v9n9bL7Lpe
         DttecuapvleFpLMskVupI0K6CQbU7sN05eyDyQJsUPZCo7EcglD8F/BbNXBeNGOhkQ6u
         kXnw==
X-Gm-Message-State: AJIora9t2f9rqavBN4KvQwSnyW56wi0Cwx7x17Z8jEeeJJmj+xINFwfJ
        denM5BqbihXSXzO7r5VJd2nMg0SnH+jdIw==
X-Google-Smtp-Source: AGRyM1tzOw4+i1p3VurFsnO5ZwOxVKJ4tcf786LxEXic31swAbBEA7d9aXNYsTkXdcV89CKXGctx9w==
X-Received: by 2002:a37:a16:0:b0:6a6:8e35:a37d with SMTP id 22-20020a370a16000000b006a68e35a37dmr7049165qkk.401.1655478851710;
        Fri, 17 Jun 2022 08:14:11 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id y6-20020a05620a25c600b0069fcc501851sm4595219qko.78.2022.06.17.08.14.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 08:14:11 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id i15so2897339ybp.1;
        Fri, 17 Jun 2022 08:14:11 -0700 (PDT)
X-Received: by 2002:a25:bd41:0:b0:668:c259:f6c2 with SMTP id
 p1-20020a25bd41000000b00668c259f6c2mr2316243ybm.365.1655478851016; Fri, 17
 Jun 2022 08:14:11 -0700 (PDT)
MIME-Version: 1.0
References: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com> <87zgifkcqa.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87zgifkcqa.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 17 Jun 2022 17:13:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWU31FB90yn1MTSUyF4bfSEXnpaO2-tkXNXNQs8SPwWCg@mail.gmail.com>
Message-ID: <CAMuHMdWU31FB90yn1MTSUyF4bfSEXnpaO2-tkXNXNQs8SPwWCg@mail.gmail.com>
Subject: Re: [PATCH v3 03/21] pinctrl: renesas: Initial R8A779G0 (V4H) PFC support
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

On Tue, Jun 14, 2022 at 7:58 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: LUU HOAI <hoai.luu.ub@renesas.com>
>
> This patch adds initial pinctrl support for the R8A779G0 (V4H) SoC,
> including bias, drive strength and voltage control.
>
> [Morimoto merged Kihara-san's MODSEL8 fixup patch,
>  cleanuped white space, care reserved bit on each configs,
>  fixup comments, etc]
> Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c

> +static const u16 pinmux_data[] = {

> +       /* IP0SR8 */
> +       PINMUX_IPSR_MSEL(IP0SR8_3_0,    SCL0,                   SEL_SCL0_0),
> +       PINMUX_IPSR_MSEL(IP0SR8_7_4,    SDA0,                   SEL_SDA0_0),

These are definitely still wrong, and not fixed by any of your
subsequent patches: to enable I2C0 functionality, the corresponding
SEL_{SCL,SDA}0 bit should be set to 1, not 0.
Same for I2C[1-5] below.

> +       PINMUX_IPSR_MSEL(IP0SR8_11_8,   SCL1,                   SEL_SCL1_0),
> +       PINMUX_IPSR_MSEL(IP0SR8_15_12,  SDA1,                   SEL_SDA1_0),
> +       PINMUX_IPSR_MSEL(IP0SR8_19_16,  SCL2,                   SEL_SCL2_0),
> +       PINMUX_IPSR_MSEL(IP0SR8_23_20,  SDA2,                   SEL_SDA2_0),
> +       PINMUX_IPSR_MSEL(IP0SR8_27_24,  SCL3,                   SEL_SCL3_0),
> +       PINMUX_IPSR_MSEL(IP0SR8_31_28,  SDA3,                   SEL_SDA3_0),
> +
> +       /* IP1SR8 */
> +       PINMUX_IPSR_MSEL(IP1SR8_3_0,    SCL4,                   SEL_SCL4_0),
> +       PINMUX_IPSR_MSEL(IP1SR8_3_0,    HRX2,                   SEL_SCL4_0),
> +       PINMUX_IPSR_MSEL(IP1SR8_3_0,    SCK4,                   SEL_SCL4_0),
> +
> +       PINMUX_IPSR_MSEL(IP1SR8_7_4,    SDA4,                   SEL_SDA4_0),
> +       PINMUX_IPSR_MSEL(IP1SR8_7_4,    HTX2,                   SEL_SDA4_0),
> +       PINMUX_IPSR_MSEL(IP1SR8_7_4,    CTS4_N,                 SEL_SDA4_0),
> +
> +       PINMUX_IPSR_MSEL(IP1SR8_11_8,   SCL5,                   SEL_SCL5_0),
> +       PINMUX_IPSR_MSEL(IP1SR8_11_8,   HRTS2_N,                SEL_SCL5_0),
> +       PINMUX_IPSR_MSEL(IP1SR8_11_8,   RTS4_N,                 SEL_SCL5_0),
> +
> +       PINMUX_IPSR_MSEL(IP1SR8_15_12,  SDA5,                   SEL_SDA5_0),
> +       PINMUX_IPSR_MSEL(IP1SR8_15_12,  SCIF_CLK2,              SEL_SDA5_0),
> +
> +       PINMUX_IPSR_GPSR(IP1SR8_19_16,  HCTS2_N),
> +       PINMUX_IPSR_GPSR(IP1SR8_19_16,  TX4),
> +
> +       PINMUX_IPSR_GPSR(IP1SR8_23_20,  HSCK2),
> +       PINMUX_IPSR_GPSR(IP1SR8_23_20,  RX4),
> +};

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
