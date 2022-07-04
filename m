Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFEB7565A3F
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Jul 2022 17:45:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234626AbiGDPo4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Jul 2022 11:44:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233294AbiGDPoo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jul 2022 11:44:44 -0400
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A849CD7;
        Mon,  4 Jul 2022 08:44:15 -0700 (PDT)
Received: by mail-qt1-f170.google.com with SMTP id ay10so10316162qtb.1;
        Mon, 04 Jul 2022 08:44:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bOiaLqcJ0A9HK7kuXSwAHVqeiqbQyR7g0zZzO527ma8=;
        b=Or0nE5nuKG2kc/jAU/hfwwVLvxmxE1W0j/HZumz/iLzrWYpH6B+e9lACvSVhS6D8Lh
         TuvJjNzQQUAAKs9jcXxr7nszQgzq1b65pPvErJgggx48zw23AXVyE9feUb22vltWJGUf
         a6UVIeWwtiwVkF2VUIJLadvoWZ6u5/S89jD581K1Tr0Ui3AXeglVaEllxTIX3h1yN4Gu
         I3vC35Et1MiUppURWUISaBm5VsOXi+KkRwFDd+KEDCg173kiJwymuEX9Zvrkah2LfXdP
         fRogOsGKszErAZqhrNdcZtY3dZq0DoDHhhDytDjMKWsLr4VmQI6g/zwMj7gs7gF960Hm
         h2Kg==
X-Gm-Message-State: AJIora+xTO871pKp6XpWKlWoUQNyLAZgTQVdhl0MRIr29vJ8WVNU345e
        C4SzsWggIkbrcjmkS6YtjBo30t9FQmjp+ocS
X-Google-Smtp-Source: AGRyM1sXg8MXAlrtfptGfdDtttrvNF5Uo9bgdUCYLoWhp6J5Nb5kRwrCt81hohi84270H14NWNtEaw==
X-Received: by 2002:ad4:5ccf:0:b0:470:4594:fcab with SMTP id iu15-20020ad45ccf000000b004704594fcabmr28192709qvb.33.1656949454395;
        Mon, 04 Jul 2022 08:44:14 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id i14-20020a05620a248e00b006a6b374d8bbsm29173210qkn.69.2022.07.04.08.44.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jul 2022 08:44:14 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-31c8bb90d09so31838377b3.8;
        Mon, 04 Jul 2022 08:44:14 -0700 (PDT)
X-Received: by 2002:a81:1090:0:b0:31c:9be5:6c95 with SMTP id
 138-20020a811090000000b0031c9be56c95mr5617355ywq.384.1656949453834; Mon, 04
 Jul 2022 08:44:13 -0700 (PDT)
MIME-Version: 1.0
References: <87h741ty20.wl-kuninori.morimoto.gx@renesas.com> <87v8shsja7.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87v8shsja7.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 4 Jul 2022 17:44:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWRfkcibGsFGER+eVYUqd3-qGLXwW96XCZi7kisi8CZdw@mail.gmail.com>
Message-ID: <CAMuHMdWRfkcibGsFGER+eVYUqd3-qGLXwW96XCZi7kisi8CZdw@mail.gmail.com>
Subject: Re: [PATCH v4 15/23] pinctrl: renesas: r8a779g0: add missing SCIF3
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

On Fri, Jul 1, 2022 at 3:39 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> V4H has SCIF3 and SCIF3_A, but current PFC setting is mixed.
> This patch cleanup SCIF3/SCIF3_A, based on Rev.0.51.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
> +++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c

> @@ -2476,9 +2504,12 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
>         SH_PFC_PIN_GROUP(scif1_data),
>         SH_PFC_PIN_GROUP(scif1_clk),
>         SH_PFC_PIN_GROUP(scif1_ctrl),
> -       SH_PFC_PIN_GROUP(scif3_data),
> -       SH_PFC_PIN_GROUP(scif3_clk),
> -       SH_PFC_PIN_GROUP(scif3_ctrl),
> +       SH_PFC_PIN_GROUP(scif3_data),           /* suffix might be updated */
> +       SH_PFC_PIN_GROUP(scif3_data_a),         /* suffix might be updated */
> +       SH_PFC_PIN_GROUP(scif3_clk),            /* suffix might be updated */
> +       SH_PFC_PIN_GROUP(scif3_clk_a),          /* suffix might be updated */
> +       SH_PFC_PIN_GROUP(scif3_ctrl),           /* suffix might be updated */
> +       SH_PFC_PIN_GROUP(scif3_ctrl_a),         /* suffix might be updated */
>         SH_PFC_PIN_GROUP(scif4_data),
>         SH_PFC_PIN_GROUP(scif4_clk),
>         SH_PFC_PIN_GROUP(scif4_ctrl),
> @@ -2761,9 +2792,13 @@ static const char * const scif1_groups[] = {
>  };
>
>  static const char * const scif3_groups[] = {
> +       /* suffix might be updated */
>         "scif3_data",
> +       "scif3_data_a",
>         "scif3_clk",
> +       "scif3_clk_a",
>         "scif3_ctrl",
> +       "scif3_ctrl_a",
>  };
>
>  static const char * const scif4_groups[] = {

I'll sort the above while applying (all *_a last).

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl-for-v5.20.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
