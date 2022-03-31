Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0887B4ED9BA
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Mar 2022 14:38:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232865AbiCaMkd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 31 Mar 2022 08:40:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236192AbiCaMk0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Mar 2022 08:40:26 -0400
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82B262AF2;
        Thu, 31 Mar 2022 05:38:37 -0700 (PDT)
Received: by mail-qk1-f170.google.com with SMTP id q200so6309822qke.7;
        Thu, 31 Mar 2022 05:38:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DmG0B8cBIuccPPd+UMZKeaONRq8BG1TyT/OghW9KQqs=;
        b=SuznboPV59wU2iObuCdu7V3Mm6VWwBSzwxIiYtYcQ3kBw+2Ij3B1nbMgC/NKdkkS7j
         CKcJTs4SPAAmfsidPtu00O/TzIP5ddH5w0GnMie+qnqIzzwu20GTWvUJ2glpUi3CWWDq
         XCpQESVNIHezy7BvGvlIMmdhDhPzk73VrE4/IHUJNHQaB7fqbR+69s1gYedJiTXUKOtS
         OvzX1c1gn+0Ap+deiG3aVrjjAqNYDj7Jl4sBGoS7G9ilBgOKnRAJYeAnVouZLKMHDcQT
         QyRtS+Kn9MgHOLeaY6C5PNpeWR5qQ1HcI49gJF+/+Ds8knqi13dxpjxnDtVXuwEwU+Ab
         NjlQ==
X-Gm-Message-State: AOAM532nbsrlmqKLyHcH+ZD9Wq06UBGcvIysjTTl11gfJNXhUasFToo4
        QD5eGM1z1wJGu3uGeSOwSBehlvQJ1ON+bA==
X-Google-Smtp-Source: ABdhPJxM50EZ1/7CvIr5Rra9MxGb8XaDiCbHJod+WpvzGNG9h8GmCQr0GkNuPWz+hLfNvYRYoOhufw==
X-Received: by 2002:a37:9e43:0:b0:67b:312d:50e0 with SMTP id h64-20020a379e43000000b0067b312d50e0mr3116892qke.549.1648730316097;
        Thu, 31 Mar 2022 05:38:36 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id br13-20020a05620a460d00b00680d020b4cbsm7111005qkb.10.2022.03.31.05.38.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Mar 2022 05:38:35 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-2e68c95e0f9so253028987b3.0;
        Thu, 31 Mar 2022 05:38:35 -0700 (PDT)
X-Received: by 2002:a81:59c4:0:b0:2e5:c7c3:5d29 with SMTP id
 n187-20020a8159c4000000b002e5c7c35d29mr4667098ywb.512.1648730315185; Thu, 31
 Mar 2022 05:38:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220315152717.20045-1-biju.das.jz@bp.renesas.com> <20220315152717.20045-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220315152717.20045-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 31 Mar 2022 14:38:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVFb+4Gfnqdmi3ED1EC9Wj5ipZPGi7+9iY89erNNhiq-w@mail.gmail.com>
Message-ID: <CAMuHMdVFb+4Gfnqdmi3ED1EC9Wj5ipZPGi7+9iY89erNNhiq-w@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: renesas: rzg2l: Add RZ/G2UL support
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Hi Biju,

On Tue, Mar 15, 2022 at 4:27 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> RZ/G2UL SoC has fewer pins compared to RZ/G2L and the port pin
> definitions are different compared to RZ/G2L.
>
> This patch adds a new compatible to take care of this differences
> by adding r9a07g043_data with r9a07g043_gpio_configs and
> rzg2l_dedicated_pins.common.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c

> +               { "QSPI0_SPCLK", RZG2L_SINGLE_PIN_PACK(0xa, 0,
> +                (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
> +               { "QSPI0_IO0", RZG2L_SINGLE_PIN_PACK(0xa, 1,
> +                (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
> +               { "QSPI0_IO1", RZG2L_SINGLE_PIN_PACK(0xa, 2,
> +                (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
> +               { "QSPI0_IO2", RZG2L_SINGLE_PIN_PACK(0xa, 3,
> +                (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
> +               { "QSPI0_IO3", RZG2L_SINGLE_PIN_PACK(0xa, 4,
> +                (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
> +               { "QSPI0_SSL", RZG2L_SINGLE_PIN_PACK(0xa, 5,
> +                (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
> +               { "QSPI_RESET#", RZG2L_SINGLE_PIN_PACK(0xc, 0,
> +                (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
> +               { "QSPI_WP#", RZG2L_SINGLE_PIN_PACK(0xc, 1,
> +                (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
> +               { "QSPI_INT#", RZG2L_SINGLE_PIN_PACK(0xc, 2, (PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },

While the datasheet states QSPI_INT# has the VMC capability, it does
not state that pin has the Slew Rate capability.
Moreover, the QSPI_INT# functionality is not documented anywhere
else in the datasheet (except for a (stale?) reference in the Boot
Mode chapter), nor in the pinfunction spreadsheet.  Hence it looks
like that pin does not exist on RZ/G2UL, and thus should be moved to
rzg2l_pins below.

> +               { "WDTOVF_PERROUT#", RZG2L_SINGLE_PIN_PACK(0xd, 0, (PIN_CFG_IOLH_A | PIN_CFG_SR)) },
> +               { "RIIC0_SDA", RZG2L_SINGLE_PIN_PACK(0xe, 0, PIN_CFG_IEN) },
> +               { "RIIC0_SCL", RZG2L_SINGLE_PIN_PACK(0xe, 1, PIN_CFG_IEN) },
> +               { "RIIC1_SDA", RZG2L_SINGLE_PIN_PACK(0xe, 2, PIN_CFG_IEN) },
> +               { "RIIC1_SCL", RZG2L_SINGLE_PIN_PACK(0xe, 3, PIN_CFG_IEN) },
> +       },
> +       .rzg2l_pins = {
> +               { "QSPI1_SPCLK", RZG2L_SINGLE_PIN_PACK(0xb, 0,
> +                (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
> +               { "QSPI1_IO0", RZG2L_SINGLE_PIN_PACK(0xb, 1,
> +                (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
> +               { "QSPI1_IO1", RZG2L_SINGLE_PIN_PACK(0xb, 2,
> +                (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
> +               { "QSPI1_IO2", RZG2L_SINGLE_PIN_PACK(0xb, 3,
> +                (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
> +               { "QSPI1_IO3", RZG2L_SINGLE_PIN_PACK(0xb, 4,
> +                (PIN_CFG_IOLH_B | PIN_CFG_SR  | PIN_CFG_IO_VMC_QSPI)) },
> +               { "QSPI1_SSL", RZG2L_SINGLE_PIN_PACK(0xb, 5,
> +                (PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_IO_VMC_QSPI)) },
> +       }
>  };

The rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
