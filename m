Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C6DA54FA19
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jun 2022 17:20:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381663AbiFQPTw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jun 2022 11:19:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380506AbiFQPTw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jun 2022 11:19:52 -0400
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03F5E4AE19;
        Fri, 17 Jun 2022 08:19:51 -0700 (PDT)
Received: by mail-qk1-f178.google.com with SMTP id 68so3357344qkk.9;
        Fri, 17 Jun 2022 08:19:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SobOcX0PnlbZf6xjezJo10VZXg86VDP3Jdw7K0Ur4HE=;
        b=DnClLbxg4IvGFA3tIrPPsP4FAIg5u14sAjCw9+Exf5OZ7bk7c/a9C6ZlaghzSteWKD
         XxkfO9lM0mdF/OFcCauohVp3uVG6SJGPkMnIOi1AYMsptWvxCEARCDwOdRpItGjRo8xM
         Z+i7nesQLVjClNNhapWyQPUITmtsBwPgVJ8u2BDY7ffj7oig8WtaWv1KdBKYCVp0fXKf
         iCRLRXe6Hs/R59YyOvrJ8ZXxdZtIWk4D8rJ1MgOWd/iA/5naO0ZtBJHAiCg36zUMWcgw
         tRZlcaBjUS/JO+TYYTxrL3c+hS95tya20MOHyjZijo6AQ3HtAWZ4QIcfKmMFdKYNpZMU
         QBrg==
X-Gm-Message-State: AJIora94eGGdK7O/p31oiofNVBVohuI2BHt8rspobSedofFQsvQOW92m
        67CzK6H943SHT2Th8PXSa/l9MK9mmx7wKA==
X-Google-Smtp-Source: AGRyM1srreOHacVDArc5IBfvfRe5MOevpkouzme21z6WVNAAJFCzC0olCQ22V7J3gdWzElcQ6a7wAQ==
X-Received: by 2002:a05:620a:1535:b0:6a6:8fdb:29e4 with SMTP id n21-20020a05620a153500b006a68fdb29e4mr7370050qkk.126.1655479189756;
        Fri, 17 Jun 2022 08:19:49 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id c22-20020a05622a025600b00304e2e4bf1esm4580562qtx.88.2022.06.17.08.19.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 08:19:49 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-31780ad7535so19248867b3.8;
        Fri, 17 Jun 2022 08:19:49 -0700 (PDT)
X-Received: by 2002:a81:3a81:0:b0:317:7dcf:81d4 with SMTP id
 h123-20020a813a81000000b003177dcf81d4mr5111571ywa.47.1655479189281; Fri, 17
 Jun 2022 08:19:49 -0700 (PDT)
MIME-Version: 1.0
References: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com> <87a6afkcmb.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87a6afkcmb.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 17 Jun 2022 17:19:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWJC6RWp6z1-H5ZE3S6SHXZrZgboYm-e=9rUxr5VSMrtg@mail.gmail.com>
Message-ID: <CAMuHMdWJC6RWp6z1-H5ZE3S6SHXZrZgboYm-e=9rUxr5VSMrtg@mail.gmail.com>
Subject: Re: [PATCH v3 21/21] pinctrl: renesas: r8a779g0: add missing MODSELx
 for AVBx
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UPPERCASE_50_75 autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Morimoto-san,

Thanks for your patch!

On Tue, Jun 14, 2022 at 8:01 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> AVB1 needs MODSEL1, AVB2 needs MODSEL5 settings.

AVB1 needs MODSEL6

> This patch adds missing MODSELx setting for these.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

> --- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
> +++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
> @@ -745,27 +745,29 @@ static const u16 pinmux_data[] = {
>         PINMUX_IPSR_NOGM(0, TSN0_AVTP_PPS1,     SEL_TSN0_AVTP_PPS1_1),
>         PINMUX_IPSR_NOGM(0, TSN0_MDC,           SEL_TSN0_MDC_1),
>
> +       /* TSN0 without MDSEL5 */

MODSEL5

>         PINMUX_SINGLE(AVB2_RX_CTL),
> -       PINMUX_SINGLE(AVB2_TX_CTL),
>         PINMUX_SINGLE(AVB2_RXC),
>         PINMUX_SINGLE(AVB2_RD0),
> -       PINMUX_SINGLE(AVB2_TXC),
> -       PINMUX_SINGLE(AVB2_TD0),
>         PINMUX_SINGLE(AVB2_RD1),
>         PINMUX_SINGLE(AVB2_RD2),
> -       PINMUX_SINGLE(AVB2_TD1),
> -       PINMUX_SINGLE(AVB2_TD2),
>         PINMUX_SINGLE(AVB2_MDIO),
>         PINMUX_SINGLE(AVB2_RD3),
> -       PINMUX_SINGLE(AVB2_TD3),
>         PINMUX_SINGLE(AVB2_TXCREFCLK),
> -       PINMUX_SINGLE(AVB2_MDC),
> -       PINMUX_SINGLE(AVB2_MAGIC),
>         PINMUX_SINGLE(AVB2_PHY_INT),
>         PINMUX_SINGLE(AVB2_LINK),
> -       PINMUX_SINGLE(AVB2_AVTP_MATCH),
>         PINMUX_SINGLE(AVB2_AVTP_CAPTURE),
> -       PINMUX_SINGLE(AVB2_AVTP_PPS),
> +       /* TSN0 with MDSEL5 */

MODSEL5

> +       PINMUX_IPSR_NOGM(0, AVB2_TX_CTL,        SEL_AVB2_TX_CTL_1),
> +       PINMUX_IPSR_NOGM(0, AVB2_TXC,           SEL_AVB2_TXC_1),
> +       PINMUX_IPSR_NOGM(0, AVB2_TD0,           SEL_AVB2_TD0_1),
> +       PINMUX_IPSR_NOGM(0, AVB2_TD1,           SEL_AVB2_TD1_1),
> +       PINMUX_IPSR_NOGM(0, AVB2_TD2,           SEL_AVB2_TD2_1),
> +       PINMUX_IPSR_NOGM(0, AVB2_TD3,           SEL_AVB2_TD3_1),
> +       PINMUX_IPSR_NOGM(0, AVB2_MDC,           SEL_AVB2_MDC_1),
> +       PINMUX_IPSR_NOGM(0, AVB2_MAGIC,         SEL_AVB2_MAGIC_1),
> +       PINMUX_IPSR_NOGM(0, AVB2_AVTP_MATCH,    SEL_AVB2_AVTP_MATCH_1),
> +       PINMUX_IPSR_NOGM(0, AVB2_AVTP_PPS,      SEL_AVB2_AVTP_PPS_1),
>
>         /* IP0SR0 */
>         PINMUX_IPSR_GPSR(IP0SR0_3_0,    ERROROUTC_B),
> @@ -1060,23 +1062,23 @@ static const u16 pinmux_data[] = {
>         /* IP0SR6 */
>         PINMUX_IPSR_GPSR(IP0SR6_3_0,    AVB1_MDIO),
>
> -       PINMUX_IPSR_GPSR(IP0SR6_7_4,    AVB1_MAGIC),
> +       PINMUX_IPSR_MSEL(IP0SR6_7_4,    AVB1_MAGIC,             SEL_AVB1_MAGIC_1),
>
> -       PINMUX_IPSR_GPSR(IP0SR6_11_8,   AVB1_MDC),
> +       PINMUX_IPSR_MSEL(IP0SR6_11_8,   AVB1_MDC,               SEL_AVB1_MDC_1),
>
>         PINMUX_IPSR_GPSR(IP0SR6_15_12,  AVB1_PHY_INT),
>
>         PINMUX_IPSR_GPSR(IP0SR6_19_16,  AVB1_LINK),
>         PINMUX_IPSR_GPSR(IP0SR6_19_16,  AVB1_MII_TX_ER),
>
> -       PINMUX_IPSR_GPSR(IP0SR6_23_20,  AVB1_AVTP_MATCH),
> -       PINMUX_IPSR_GPSR(IP0SR6_23_20,  AVB1_MII_RX_ER),
> +       PINMUX_IPSR_MSEL(IP0SR6_23_20,  AVB1_AVTP_MATCH,        SEL_AVB1_AVTP_MATCH_1),
> +       PINMUX_IPSR_MSEL(IP0SR6_23_20,  AVB1_MII_RX_ER,         SEL_AVB1_AVTP_MATCH_0),
>
> -       PINMUX_IPSR_GPSR(IP0SR6_27_24,  AVB1_TXC),
> -       PINMUX_IPSR_GPSR(IP0SR6_27_24,  AVB1_MII_TXC),
> +       PINMUX_IPSR_MSEL(IP0SR6_27_24,  AVB1_TXC,               SEL_AVB1_TXC_1),
> +       PINMUX_IPSR_MSEL(IP0SR6_27_24,  AVB1_MII_TXC,           SEL_AVB1_TXC_0),

This doesn't look right to me: if TXC needs output enable, I would
expect MII_TXC to need output enable, too.
The same is true for (at least) TD[0-3].

>
> -       PINMUX_IPSR_GPSR(IP0SR6_31_28,  AVB1_TX_CTL),
> -       PINMUX_IPSR_GPSR(IP0SR6_31_28,  AVB1_MII_TX_EN),
> +       PINMUX_IPSR_MSEL(IP0SR6_31_28,  AVB1_TX_CTL,            SEL_AVB1_TX_CTL_1),
> +       PINMUX_IPSR_MSEL(IP0SR6_31_28,  AVB1_MII_TX_EN,         SEL_AVB1_TX_CTL_0),
>
>         /* IP1SR6 */
>         PINMUX_IPSR_GPSR(IP1SR6_3_0,    AVB1_RXC),
> @@ -1085,17 +1087,17 @@ static const u16 pinmux_data[] = {
>         PINMUX_IPSR_GPSR(IP1SR6_7_4,    AVB1_RX_CTL),
>         PINMUX_IPSR_GPSR(IP1SR6_7_4,    AVB1_MII_RX_DV),
>
> -       PINMUX_IPSR_GPSR(IP1SR6_11_8,   AVB1_AVTP_PPS),
> -       PINMUX_IPSR_GPSR(IP1SR6_11_8,   AVB1_MII_COL),
> +       PINMUX_IPSR_MSEL(IP1SR6_11_8,   AVB1_AVTP_PPS,          SEL_AVB1_AVTP_PPS_1),
> +       PINMUX_IPSR_MSEL(IP1SR6_11_8,   AVB1_MII_COL,           SEL_AVB1_AVTP_PPS_0),
>
>         PINMUX_IPSR_GPSR(IP1SR6_15_12,  AVB1_AVTP_CAPTURE),
>         PINMUX_IPSR_GPSR(IP1SR6_15_12,  AVB1_MII_CRS),
>
> -       PINMUX_IPSR_GPSR(IP1SR6_19_16,  AVB1_TD1),
> -       PINMUX_IPSR_GPSR(IP1SR6_19_16,  AVB1_MII_TD1),
> +       PINMUX_IPSR_MSEL(IP1SR6_19_16,  AVB1_TD1,               SEL_AVB1_TD1_1),
> +       PINMUX_IPSR_MSEL(IP1SR6_19_16,  AVB1_MII_TD1,           SEL_AVB1_TD1_0),
>
> -       PINMUX_IPSR_GPSR(IP1SR6_23_20,  AVB1_TD0),
> -       PINMUX_IPSR_GPSR(IP1SR6_23_20,  AVB1_MII_TD0),
> +       PINMUX_IPSR_MSEL(IP1SR6_23_20,  AVB1_TD0,               SEL_AVB1_TD0_1),
> +       PINMUX_IPSR_MSEL(IP1SR6_23_20,  AVB1_MII_TD0,           SEL_AVB1_TD0_0),
>
>         PINMUX_IPSR_GPSR(IP1SR6_27_24,  AVB1_RD1),
>         PINMUX_IPSR_GPSR(IP1SR6_27_24,  AVB1_MII_RD1),
> @@ -1104,14 +1106,14 @@ static const u16 pinmux_data[] = {
>         PINMUX_IPSR_GPSR(IP1SR6_31_28,  AVB1_MII_RD0),
>
>         /* IP2SR6 */
> -       PINMUX_IPSR_GPSR(IP2SR6_3_0,    AVB1_TD2),
> -       PINMUX_IPSR_GPSR(IP2SR6_3_0,    AVB1_MII_TD2),
> +       PINMUX_IPSR_MSEL(IP2SR6_3_0,    AVB1_TD2,               SEL_AVB1_TD2_1),
> +       PINMUX_IPSR_MSEL(IP2SR6_3_0,    AVB1_MII_TD2,           SEL_AVB1_TD2_0),
>
>         PINMUX_IPSR_GPSR(IP2SR6_7_4,    AVB1_RD2),
>         PINMUX_IPSR_GPSR(IP2SR6_7_4,    AVB1_MII_RD2),
>
> -       PINMUX_IPSR_GPSR(IP2SR6_11_8,   AVB1_TD3),
> -       PINMUX_IPSR_GPSR(IP2SR6_11_8,   AVB1_MII_TD3),
> +       PINMUX_IPSR_MSEL(IP2SR6_11_8,   AVB1_TD3,               SEL_AVB1_TD3_1),
> +       PINMUX_IPSR_MSEL(IP2SR6_11_8,   AVB1_MII_TD3,           SEL_AVB1_TD3_0),
>
>         PINMUX_IPSR_GPSR(IP2SR6_15_12,  AVB1_RD3),
>         PINMUX_IPSR_GPSR(IP2SR6_15_12,  AVB1_MII_RD3),

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
