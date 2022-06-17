Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 438E354FA18
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jun 2022 17:20:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382033AbiFQPTf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jun 2022 11:19:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381663AbiFQPTe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jun 2022 11:19:34 -0400
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E52414BBA9;
        Fri, 17 Jun 2022 08:19:31 -0700 (PDT)
Received: by mail-qv1-f41.google.com with SMTP id 88so3345856qva.9;
        Fri, 17 Jun 2022 08:19:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yt12e8dUYDnMPaIrx6AUJRjLMArXdOLKy5zPQ44jpyo=;
        b=posu43J7Q9Bylz/hWwa316xW+EY94shl0vMb3qxdPKyOu5YP2I3TpYd44ZkSUhAGaT
         ZhGLT36awCDTlzc/rwKnE1iyoDY/k/WdZT3M7yoVxvDICz21XuEH50j+YgbUzkhG6edD
         3J9QUhZ0VJyrsa8uPBBM29BOsYvZOE9W+zTOPVYG9EHcxucCGxkhNp7STN7d1/lgnme/
         zdA3nCtELh2gBo3dl2Zdojac/XimuYOkinMiJxBJggotBicgOR5SGvujSQBR+Sc3f9vm
         y2mnDy3QcFaBaDqCD5SHmEsvdQU+ZWlQXmOEQuXZSxxOwldS16l/NKumewez13RfrjY4
         qMOQ==
X-Gm-Message-State: AJIora9Dakty0ZZ7Ga0zKJ+8rSBMaxNJrxbJW9WfOuGHTXiS+qLmkpIN
        hzs29R2q6Ga/VCqv8J42UnLbWvp8z5YImA==
X-Google-Smtp-Source: AGRyM1tImXQi7J+mJQ/4KZwhJ3rk/0BhOzpFWevU7USFhipXkNOVnCEAL6TxwnLJFiuKKGGx4QoSSA==
X-Received: by 2002:ac8:5a93:0:b0:304:ec80:7943 with SMTP id c19-20020ac85a93000000b00304ec807943mr8973292qtc.330.1655479170940;
        Fri, 17 Jun 2022 08:19:30 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id l7-20020a378907000000b006a6ae636ce0sm4518910qkd.131.2022.06.17.08.19.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 08:19:30 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-3178ea840easo7498757b3.13;
        Fri, 17 Jun 2022 08:19:30 -0700 (PDT)
X-Received: by 2002:a81:1dd2:0:b0:30f:a4fc:315e with SMTP id
 d201-20020a811dd2000000b0030fa4fc315emr12533402ywd.383.1655479170315; Fri, 17
 Jun 2022 08:19:30 -0700 (PDT)
MIME-Version: 1.0
References: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com> <87bkuvkcmi.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87bkuvkcmi.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 17 Jun 2022 17:19:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVcUZdY6hfv1rAXE82+xaOgDhpSVEOMOpMj6Yr2MKO9hg@mail.gmail.com>
Message-ID: <CAMuHMdVcUZdY6hfv1rAXE82+xaOgDhpSVEOMOpMj6Yr2MKO9hg@mail.gmail.com>
Subject: Re: [PATCH v3 20/21] pinctrl: renesas: r8a779g0: add missing MODSELx
 for TSN0
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

On Tue, Jun 14, 2022 at 8:00 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> TSN0 needs MODSEL4 settings.
> This patch adds missing MODSELx setting for these.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
> +++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
> @@ -720,27 +720,30 @@ static const u16 pinmux_data[] = {
>         PINMUX_SINGLE(AVS0),
>         PINMUX_SINGLE(PCIE1_CLKREQ_N),
>         PINMUX_SINGLE(PCIE0_CLKREQ_N),
> +
> +       /* TSN0 without MDSEL4 */

MODSEL4

>         PINMUX_SINGLE(TSN0_TXCREFCLK),
> -       PINMUX_SINGLE(TSN0_TD2),
> -       PINMUX_SINGLE(TSN0_TD3),
>         PINMUX_SINGLE(TSN0_RD2),
>         PINMUX_SINGLE(TSN0_RD3),
> -       PINMUX_SINGLE(TSN0_TD0),
> -       PINMUX_SINGLE(TSN0_TD1),
>         PINMUX_SINGLE(TSN0_RD1),
> -       PINMUX_SINGLE(TSN0_TXC),
>         PINMUX_SINGLE(TSN0_RXC),
>         PINMUX_SINGLE(TSN0_RD0),
> -       PINMUX_SINGLE(TSN0_TX_CTL),
> -       PINMUX_SINGLE(TSN0_AVTP_PPS0),
>         PINMUX_SINGLE(TSN0_RX_CTL),
>         PINMUX_SINGLE(TSN0_AVTP_CAPTURE),
> -       PINMUX_SINGLE(TSN0_AVTP_MATCH),
>         PINMUX_SINGLE(TSN0_LINK),
>         PINMUX_SINGLE(TSN0_PHY_INT),
> -       PINMUX_SINGLE(TSN0_AVTP_PPS1),
> -       PINMUX_SINGLE(TSN0_MDC),
>         PINMUX_SINGLE(TSN0_MDIO),
> +       /* TSN0 with MDSEL4 */

MODSEL4

> +       PINMUX_IPSR_NOGM(0, TSN0_TD2,           SEL_TSN0_TD2_1),
> +       PINMUX_IPSR_NOGM(0, TSN0_TD3,           SEL_TSN0_TD3_1),
> +       PINMUX_IPSR_NOGM(0, TSN0_TD0,           SEL_TSN0_TD0_1),
> +       PINMUX_IPSR_NOGM(0, TSN0_TD1,           SEL_TSN0_TD1_1),
> +       PINMUX_IPSR_NOGM(0, TSN0_TXC,           SEL_TSN0_TXC_1),
> +       PINMUX_IPSR_NOGM(0, TSN0_TX_CTL,        SEL_TSN0_TX_CTL_1),
> +       PINMUX_IPSR_NOGM(0, TSN0_AVTP_PPS0,     SEL_TSN0_AVTP_PPS0_1),
> +       PINMUX_IPSR_NOGM(0, TSN0_AVTP_MATCH,    SEL_TSN0_AVTP_MATCH_1),
> +       PINMUX_IPSR_NOGM(0, TSN0_AVTP_PPS1,     SEL_TSN0_AVTP_PPS1_1),
> +       PINMUX_IPSR_NOGM(0, TSN0_MDC,           SEL_TSN0_MDC_1),
>
>         PINMUX_SINGLE(AVB2_RX_CTL),
>         PINMUX_SINGLE(AVB2_TX_CTL),

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
