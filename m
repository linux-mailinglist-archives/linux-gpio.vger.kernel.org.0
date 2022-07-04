Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93E31565A42
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Jul 2022 17:45:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234036AbiGDPo5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Jul 2022 11:44:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234664AbiGDPop (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jul 2022 11:44:45 -0400
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E9BAD7B;
        Mon,  4 Jul 2022 08:44:22 -0700 (PDT)
Received: by mail-qt1-f171.google.com with SMTP id g14so10326382qto.9;
        Mon, 04 Jul 2022 08:44:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P3bouOEP3j8Vz0dw3tTEnNy3lcznRHz9LdsvRrbC+Rc=;
        b=H6bzG6IeJyoTolDzA8xnvLGEiZ/InLMNGgcTseham41fQQRCtmT8NsWfTxe1v4Czx2
         pUnQq4s6rvFN7hRLpPNRXJNdBqKk3v9PdJ/DcNFHcWQ5c+nRwR8dSEulQHBYgGSIl2Pe
         Iytt8+EK6N6TYyRpEHxXMEsSYT5ffTACPT2w1RoQ8dykaIqwFVyxtRbKoT5jqWm5lXeM
         hP1awpkaX63XR2kYn/qo/4VUmzlrHGlzzXnFJNBX0qPwljOXhDKPPaJe4OryFOR4XU1Z
         SHcCmmq46NEsHS2ITSfAZbdQcOcyUmQ6htB51gPY+aj6QDPjw6M07KpC0tFfr2YK56cm
         T3hw==
X-Gm-Message-State: AJIora9ksWXh1BPJggBw+1LvoQSNyE0puS2blFIsWkoppcpxypcHn40w
        3nvupN6VajKsTA+1ia4ziPJLanGI+Qli/4QX
X-Google-Smtp-Source: AGRyM1u4rw14scmC5G1G56jEgS3K8/PTNsprfmElr6DEtGD0L0YsuAddvjzwTRb1Ex+6gzmTZFw81A==
X-Received: by 2002:a05:622a:18a9:b0:31d:3c07:9dc6 with SMTP id v41-20020a05622a18a900b0031d3c079dc6mr13071167qtc.638.1656949460923;
        Mon, 04 Jul 2022 08:44:20 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id s10-20020a05620a0bca00b006af0ce13499sm24171334qki.115.2022.07.04.08.44.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jul 2022 08:44:20 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-31c8340a6f7so44724147b3.4;
        Mon, 04 Jul 2022 08:44:20 -0700 (PDT)
X-Received: by 2002:a81:4fc9:0:b0:318:b0ca:4b13 with SMTP id
 d192-20020a814fc9000000b00318b0ca4b13mr34765263ywb.502.1656949460176; Mon, 04
 Jul 2022 08:44:20 -0700 (PDT)
MIME-Version: 1.0
References: <87h741ty20.wl-kuninori.morimoto.gx@renesas.com> <87tu81sja1.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87tu81sja1.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 4 Jul 2022 17:44:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUGFjUetFMusLtCb3B50LvU4fxjyMNvkVQTYR1mufQWJQ@mail.gmail.com>
Message-ID: <CAMuHMdUGFjUetFMusLtCb3B50LvU4fxjyMNvkVQTYR1mufQWJQ@mail.gmail.com>
Subject: Re: [PATCH v4 16/23] pinctrl: renesas: r8a779g0: add missing SCIF1_X
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
> This patch adds missing SCIF1_X.
> Because Document (Rev.0.51) has 2xSCIF1 with no suffix (_A, _B),
> this patch name it as _X.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
> +++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c

> @@ -2501,9 +2529,12 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
>         SH_PFC_PIN_GROUP(scif0_data),
>         SH_PFC_PIN_GROUP(scif0_clk),
>         SH_PFC_PIN_GROUP(scif0_ctrl),
> -       SH_PFC_PIN_GROUP(scif1_data),
> -       SH_PFC_PIN_GROUP(scif1_clk),
> -       SH_PFC_PIN_GROUP(scif1_ctrl),
> +       SH_PFC_PIN_GROUP(scif1_data),           /* suffix might be updated */
> +       SH_PFC_PIN_GROUP(scif1_data_x),         /* suffix might be updated */
> +       SH_PFC_PIN_GROUP(scif1_clk),            /* suffix might be updated */
> +       SH_PFC_PIN_GROUP(scif1_clk_x),          /* suffix might be updated */
> +       SH_PFC_PIN_GROUP(scif1_ctrl),           /* suffix might be updated */
> +       SH_PFC_PIN_GROUP(scif1_ctrl_x),         /* suffix might be updated */
>         SH_PFC_PIN_GROUP(scif3_data),           /* suffix might be updated */
>         SH_PFC_PIN_GROUP(scif3_data_a),         /* suffix might be updated */
>         SH_PFC_PIN_GROUP(scif3_clk),            /* suffix might be updated */
> @@ -2786,9 +2817,13 @@ static const char * const scif0_groups[] = {
>  };
>
>  static const char * const scif1_groups[] = {
> +       /* suffix might be updated */
>         "scif1_data",
> +       "scif1_data_x",
>         "scif1_clk",
> +       "scif1_clk_x",
>         "scif1_ctrl",
> +       "scif1_ctrl_x",
>  };
>
>  static const char * const scif3_groups[] = {

I'll sort the above while applying (all *_x last).

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl-for-v5.20.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
