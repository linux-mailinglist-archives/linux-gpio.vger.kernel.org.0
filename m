Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7216E565A47
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Jul 2022 17:46:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233680AbiGDPpf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Jul 2022 11:45:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234157AbiGDPpb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jul 2022 11:45:31 -0400
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 949ACB3D;
        Mon,  4 Jul 2022 08:45:30 -0700 (PDT)
Received: by mail-qt1-f169.google.com with SMTP id c13so10317969qtq.10;
        Mon, 04 Jul 2022 08:45:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5LO/4HZXu94y4sL8QMUqIb64SoNyDEn2QYbinIRTZqA=;
        b=FocRYcBX0bToTlDdRxnruC8iy7IdjXJxUuw8s97aAbmqMisjAQ4G3hv1k3yloQ9hNO
         /7IBJX0e215ez5Xbg/OCKilAUGISOllc+yrkaOzV6BIm9rIQjqD5eBA4eZNiBtGb1kQL
         I6Wom2hiQHo9wlL27PlFg3Kf+l7dZco6L2uRWDf18r4cRLt6MfFtYRa2W82w4gsJl76k
         bG8de2i4NR32AoaX0BmYM3J052CaZzPMwgvfWCYuLttV129EdhRj5DP0a4K+GW8BqC3a
         s6d9G86FUeG9Ju/b7Xvf1DDBbXupeAhefb9W5xdqxsVHsN429ymzIQGPepNFXuLBKNBR
         fj6g==
X-Gm-Message-State: AJIora9igCDz+cjbAKjmUhSqI8YuCsDKhRn05Es3MJwT5vF8JTIqUO9u
        eYcfm03mskqs4k683ysGxgYG7HE3xKKNKbJ3
X-Google-Smtp-Source: AGRyM1upBdN+6uuoCu37JfShYarqqfnWd3PbjT9tx+dTxR/W0lkeF5h0bOFcjiQknpUC0HxhU6cV2w==
X-Received: by 2002:ac8:5b0d:0:b0:31d:3b6f:969b with SMTP id m13-20020ac85b0d000000b0031d3b6f969bmr13269635qtw.84.1656949529518;
        Mon, 04 Jul 2022 08:45:29 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id o16-20020a05620a2a1000b006a68fdc2d18sm21462266qkp.130.2022.07.04.08.45.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jul 2022 08:45:29 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id e69so10947592ybh.2;
        Mon, 04 Jul 2022 08:45:29 -0700 (PDT)
X-Received: by 2002:a05:6902:1246:b0:66d:5b0b:19b0 with SMTP id
 t6-20020a056902124600b0066d5b0b19b0mr30754947ybu.365.1656949529019; Mon, 04
 Jul 2022 08:45:29 -0700 (PDT)
MIME-Version: 1.0
References: <87h741ty20.wl-kuninori.morimoto.gx@renesas.com> <87k08xsj81.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87k08xsj81.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 4 Jul 2022 17:45:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUY-9ksg-rHrqhZ_AfMQLFj_V074iiXD_7xW5z+Zwup9Q@mail.gmail.com>
Message-ID: <CAMuHMdUY-9ksg-rHrqhZ_AfMQLFj_V074iiXD_7xW5z+Zwup9Q@mail.gmail.com>
Subject: Re: [PATCH v4 23/23] pinctrl: renesas: r8a779g0: add missing MODSELx
 for AVBx
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Morimoto-san,

On Fri, Jul 1, 2022 at 3:41 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> AVB1 needs MODSEL6, AVB2 needs MODSEL5 settings.
> This patch adds missing MODSELx setting for these.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
> +++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c

> @@ -1031,23 +1033,23 @@ static const u16 pinmux_data[] = {
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

Just like before, this doesn't look right to me: if TXC needs output
enable, I would expect MII_TXC to need output enable, too.
The same is true for (at least) TD[0-3].

Anyway, without hardware access it's very hard to verify what "output
enable" really means, so let's just keep it like this, and fix it up
later if needed.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl-for-v5.20.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
