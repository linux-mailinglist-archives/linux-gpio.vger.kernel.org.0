Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE02353C735
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jun 2022 11:00:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242930AbiFCJAi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Jun 2022 05:00:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242922AbiFCJAh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Jun 2022 05:00:37 -0400
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBC2C381B1;
        Fri,  3 Jun 2022 02:00:34 -0700 (PDT)
Received: by mail-qk1-f178.google.com with SMTP id r84so5440683qke.10;
        Fri, 03 Jun 2022 02:00:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=evQf7fXXpISPp2ggAxWDAZXBQqODqEmBPeOIMkPKIo4=;
        b=ZRBpeTA6IkYHq9+GoxxhU3KWk7ixn5AlIKoZ4YdDdTkSBmc8aw8X91H3/mZlze1hBi
         uS5UFQT2AyfwUuJEumXhRd69jCxuc4Fp0zdxePw/n0iF6d2y3Dho1iyB7sLlGLCt620l
         NQGNjH+CGySx3Rslr62mBNxikd4HmVjbH6dwy7Ov0/3WCz3/eVLypSF/mufRtrXJNXME
         PdfgydsbwCaBd8wM7MXBHlC8ZSwL0B2eSclJhJui3bZGox6x+UNVJoKg3V8eqGWCz4oo
         B3SkcZx+OdQtzwEpHbeYiReuFqhwAvTXlv+HXYIOHKIm0+DFJY4Lgn9PhG0x6Ua3/VqK
         qu5w==
X-Gm-Message-State: AOAM5316dOcex5YasO8vrw26zF9RCNsVeTOuymSsQWdEftRzUDFQcWUh
        jvfxltGmCYldiyYyYWPmgYMI4nuAUm0Bfg==
X-Google-Smtp-Source: ABdhPJyT+7ggPCDetOukTuguybfFa4EnGWbJKrIxSUsDrwoCETWo5s4MWhNImBDBwHWkO5x2GMuuLg==
X-Received: by 2002:a05:620a:1997:b0:69e:9541:d226 with SMTP id bm23-20020a05620a199700b0069e9541d226mr5759973qkb.782.1654246833405;
        Fri, 03 Jun 2022 02:00:33 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id v186-20020a3793c3000000b0069fc13ce1f3sm4655349qkd.36.2022.06.03.02.00.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jun 2022 02:00:33 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id g4so12595788ybf.12;
        Fri, 03 Jun 2022 02:00:33 -0700 (PDT)
X-Received: by 2002:a25:cc53:0:b0:65c:b19c:fac1 with SMTP id
 l80-20020a25cc53000000b0065cb19cfac1mr9447276ybf.89.1654246832705; Fri, 03
 Jun 2022 02:00:32 -0700 (PDT)
MIME-Version: 1.0
References: <87mteu49tm.wl-kuninori.morimoto.gx@renesas.com> <87leue49sv.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87leue49sv.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 3 Jun 2022 11:00:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVZ-vg6kddpteYBRrCS1LBygwsfttDCGfs=QmD68_ZHNg@mail.gmail.com>
Message-ID: <CAMuHMdVZ-vg6kddpteYBRrCS1LBygwsfttDCGfs=QmD68_ZHNg@mail.gmail.com>
Subject: Re: [PATCH 1/3] pinctrl: renesas: Add PORT_GP_CFG_13 macros
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

On Fri, Jun 3, 2022 at 7:04 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> Add PORT_GP_CFG_13() and PORT_GP_13() helper macros,
> to be used by the r8a779g0 subdriver.
>
> Based on a larger patch in the BSP by LUU HOAI.
>
> Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/sh_pfc.h
> +++ b/drivers/pinctrl/renesas/sh_pfc.h
> @@ -492,6 +492,11 @@ extern const struct sh_pfc_soc_info shx3_pinmux_info;
>         PORT_GP_CFG_1(bank, 11, fn, sfx, cfg)
>  #define PORT_GP_12(bank, fn, sfx)      PORT_GP_CFG_12(bank, fn, sfx, 0)
>
> +#define PORT_GP_CFG_13(bank, fn, sfx, cfg)                             \
> +       PORT_GP_CFG_12(bank, fn, sfx, cfg),                             \
> +       PORT_GP_CFG_1(bank, 12, fn, sfx, cfg)
> +#define PORT_GP_13(bank, fn, sfx)      PORT_GP_CFG_13(bank, fn, sfx, 0)

LGTM.

> +
>  #define PORT_GP_CFG_14(bank, fn, sfx, cfg)                             \
>         PORT_GP_CFG_12(bank, fn, sfx, cfg),                             \

Please update PORT_GP_CFG_14() to use the new PORT_GP_CFG_13() macro.

>         PORT_GP_CFG_1(bank, 12, fn, sfx, cfg),                          \

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
