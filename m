Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0F1054F9FD
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jun 2022 17:18:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239096AbiFQPSB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jun 2022 11:18:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382803AbiFQPSA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jun 2022 11:18:00 -0400
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B6DB15729;
        Fri, 17 Jun 2022 08:18:00 -0700 (PDT)
Received: by mail-qk1-f170.google.com with SMTP id 15so3364930qki.6;
        Fri, 17 Jun 2022 08:18:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WRFHImNbD7ySzMWa0njVU49a/DPBVKiAfFlGJrNLz/0=;
        b=bNW9RbWdLnxC9Ac4ApCrRayYpU+eDgSoNoWqhn1Shz2fzEJD1ZrnDooqdI/peBDRvV
         xI8L1Zc1rRUwMOYL8fckt1xFs1l8LPcaD+ai/cBdOQZAdfUIV017Qt4Z0O0QILJAgTE5
         O+O3ysmj7meuwPolmZ6Bwu60P3Bzg/wFj4+QtJHAs4w3FE5FLAnJrnbdC/oeGb0ues8J
         59e7MEW+akYx/NZcBUVf634hUCWVgGdewQcUvPUiaXEChlqhMhMaMTiFiB1xYfjbKytZ
         pMAESfa84zd/7hc1BCqJ1/DsEG2JuSnAFDR2uZSgcIs0DL261MWrsgV6lzBqJh8AfuIP
         h/mA==
X-Gm-Message-State: AJIora9qytbaFH2FG4J72gjRsdWByqBcbWI6ncUS/vLon8PoCKKooS7p
        4B3i2O2xPjW53VQoG4PrJV3NM8kOBAovdA==
X-Google-Smtp-Source: AGRyM1s7hf240rn+cnxQXljjIED/VWsdomguO/RcZN5ipv6LXFKvgamFIz28NKMw/pZGSA7TVRgWdQ==
X-Received: by 2002:a05:620a:17a1:b0:6a6:ed81:ec with SMTP id ay33-20020a05620a17a100b006a6ed8100ecmr7170779qkb.523.1655479079000;
        Fri, 17 Jun 2022 08:17:59 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id h15-20020a05620a400f00b006a6d365e9b1sm4859768qko.57.2022.06.17.08.17.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 08:17:58 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-3176b6ed923so45264637b3.11;
        Fri, 17 Jun 2022 08:17:58 -0700 (PDT)
X-Received: by 2002:a81:3a81:0:b0:317:7dcf:81d4 with SMTP id
 h123-20020a813a81000000b003177dcf81d4mr5101717ywa.47.1655479078439; Fri, 17
 Jun 2022 08:17:58 -0700 (PDT)
MIME-Version: 1.0
References: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com> <87sfo7kcoz.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87sfo7kcoz.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 17 Jun 2022 17:17:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXd-A0u7c2aPyicS760GJ170XTru_PVyVWA1DMOLmg2ig@mail.gmail.com>
Message-ID: <CAMuHMdXd-A0u7c2aPyicS760GJ170XTru_PVyVWA1DMOLmg2ig@mail.gmail.com>
Subject: Re: [PATCH v3 08/21] pinctrl: renesas: r8a779g0: tidyup ioctrl_regs
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

On Tue, Jun 14, 2022 at 7:59 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> This patch comment out POC2 which is not used/documented,
> and remove TD0SEL3 which is no need to have.
>
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
> +++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
> @@ -3657,27 +3657,25 @@ static const struct pinmux_drive_reg pinmux_drive_regs[] = {
>  enum ioctrl_regs {
>         POC0,
>         POC1,
> -       POC2,
> +/*     POC2, is not used */

Please drop it completely, as POC2 is not documented to exist at all
(unlike TD0SEL3).

>         POC3,
>         POC4,
>         POC5,
>         POC6,
>         POC7,
>         POC8,
> -       TD0SEL3,
>  };
>
>  static const struct pinmux_ioctrl_reg pinmux_ioctrl_regs[] = {
>         [POC0]          = { 0xE60500A0, },
>         [POC1]          = { 0xE60508A0, },
> -       [POC2]          = { 0xE60580A0, },
> +/*     [POC2]          = { 0xE60580A0, }, is not used */
>         [POC3]          = { 0xE60588A0, },
>         [POC4]          = { 0xE60600A0, },
>         [POC5]          = { 0xE60608A0, },
>         [POC6]          = { 0xE60610A0, },
>         [POC7]          = { 0xE60618A0, },
>         [POC8]          = { 0xE60680A0, },
> -       [TD0SEL3]       = { 0xE60589C0, },
>         { /* sentinel */ },
>  };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
