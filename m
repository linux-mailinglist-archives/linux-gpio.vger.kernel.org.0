Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F256D54FA14
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jun 2022 17:20:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382325AbiFQPTG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jun 2022 11:19:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382991AbiFQPTE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jun 2022 11:19:04 -0400
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B56CC4BBB9;
        Fri, 17 Jun 2022 08:19:02 -0700 (PDT)
Received: by mail-qk1-f169.google.com with SMTP id 68so3355755qkk.9;
        Fri, 17 Jun 2022 08:19:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+mDLDdPoNxGVZs4g3Mxdiga+Wg2GLuaipJcM19xog/E=;
        b=a4VsYYfVrjGNZFKHQBa94Gn+W/XDyEvhKVS3KjToSq77QAbvv/M2k187BlSNhnBgfQ
         7RvUnf9qYjjPMKDo9VoYH3UV3R5bkCp4eRid/e6TDRW5BTxN+JOhzk3ZkQpZ0FkNuUL0
         EK/B4gMpqIbSHWf3Vytjw5mEprQBdzpqcCsLIOFEsNuAGnWW25PlXXbz0JtJBstjy6mZ
         nPfjqwpwACxn2FoYGWqidk0GWqc+xEhz+M7ZftIc2lo8APTK596eeIfFAOwvj0iO2V2m
         hcTynrD5rCkPP0XQAq/5tgZchOPS/fruP/RL8oLNMRpJuZaCxLDnxgdiC8rqB7AWAa+j
         8C+w==
X-Gm-Message-State: AJIora9jM8MlSdvFh/TCs8v2/PNXsumHst8ell2GxOWN8Uu2sTFoFsRP
        bv24mT0gE2HGg5e1l+sJVz4yxn7Toxrj9Q==
X-Google-Smtp-Source: AGRyM1vgIB23xrFF8GYnhOyi8y/eaX6SK+A6SlPOPEvHfLon8fufqc/u64+K3csXudhARqA6htWzig==
X-Received: by 2002:a05:620a:2445:b0:6ab:961f:a925 with SMTP id h5-20020a05620a244500b006ab961fa925mr1430702qkn.485.1655479141301;
        Fri, 17 Jun 2022 08:19:01 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id r3-20020ae9d603000000b0069c72b41b59sm4678337qkk.2.2022.06.17.08.19.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 08:19:01 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id w6so7788910ybl.4;
        Fri, 17 Jun 2022 08:19:00 -0700 (PDT)
X-Received: by 2002:a25:2b48:0:b0:668:3b7d:326c with SMTP id
 r69-20020a252b48000000b006683b7d326cmr10579067ybr.380.1655479140679; Fri, 17
 Jun 2022 08:19:00 -0700 (PDT)
MIME-Version: 1.0
References: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com> <87h74nkcna.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87h74nkcna.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 17 Jun 2022 17:18:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXhARUeKXXGGk7dBXx7PcuFo4cgUp2TMJH0hj_D5Cf2_w@mail.gmail.com>
Message-ID: <CAMuHMdXhARUeKXXGGk7dBXx7PcuFo4cgUp2TMJH0hj_D5Cf2_w@mail.gmail.com>
Subject: Re: [PATCH v3 16/21] pinctrl: renesas: r8a779g0: add missing TPU0TOx_A
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

On Tue, Jun 14, 2022 at 8:00 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> This patch adds missing TPU0TOx_A
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
> +++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
> @@ -2906,6 +2944,13 @@ static const char * const tpu_groups[] = {
>         "tpu_to3",
>  };
>
> +static const char * const tpu_a_groups[] = {
> +       "tpu_to0_a",
> +       "tpu_to1_a",
> +       "tpu_to2_a",
> +       "tpu_to3_a",

Please add these to the existing tpu_groups[] instead.

> +};
> +
>  static const char * const tsn0_groups[] = {
>         "tsn0_link",
>         "tsn0_phy_int",
> @@ -2981,6 +3026,7 @@ static const struct sh_pfc_function pinmux_functions[] = {
>         SH_PFC_FUNCTION(scif_clk),
>
>         SH_PFC_FUNCTION(tpu),
> +       SH_PFC_FUNCTION(tpu_a),

Please drop this, as it is not needed.

>
>         SH_PFC_FUNCTION(tsn0),

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
