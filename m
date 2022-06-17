Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F0A154FA0F
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jun 2022 17:20:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382760AbiFQPTA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jun 2022 11:19:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382373AbiFQPS6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jun 2022 11:18:58 -0400
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 680CD5595;
        Fri, 17 Jun 2022 08:18:57 -0700 (PDT)
Received: by mail-qk1-f182.google.com with SMTP id l192so3349562qke.13;
        Fri, 17 Jun 2022 08:18:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1iyyFEscyb4ggpP63h+9Ycw9HpR4002iwk1oGPIrxjc=;
        b=cQpt7ruLsR70UittHo1fATyYeWKVW6DNDL8UJXeY76hEQfpPN88C9fODYL8FJT5c8b
         URUGG6tuJ/3vphu2dbqxHmTvxDAsAK0Wj/o2rUJXMv8+ue6cQB/1GEbOFnhokh8PQ8WY
         S/VCvyi33owsdqOmX2kCWuhxHRkyv4WU+0fv80jSeaoyasqly2v11ZyqUrQfNY7VAonj
         G1Cn2zKy/xHFismmmkZpaQzMQ8rcl+xvUiQVlomR2AcZPPINjzUEl+dBYCjqGj/s6rU5
         J1LxW8fD9JJhm/O8tVavdXvDCdSc5z7b8Ixj1vEJziFeFbvz9m5A46BWOb2Px/S1onUr
         8a9Q==
X-Gm-Message-State: AJIora/inGB1iu9pkMSV2o1MGF+z4Qlph3V1oxyQXOz/O9KgS9jtMJyz
        RnQCeBDMQxUWeAGIFQ/o1A8FY6v4UDx8ng==
X-Google-Smtp-Source: AGRyM1tfbmmc+o7PqJQaUhe3LN72pCStWDo81v+EhwMWyv8E2Wqp7yRstbXU0a+E3yZECXYKLGH2OA==
X-Received: by 2002:a37:9ecb:0:b0:6a6:a6e4:fd47 with SMTP id h194-20020a379ecb000000b006a6a6e4fd47mr7624502qke.708.1655479136307;
        Fri, 17 Jun 2022 08:18:56 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id f10-20020a05620a280a00b006a77940be22sm4686775qkp.95.2022.06.17.08.18.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 08:18:56 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id t1so7787790ybd.2;
        Fri, 17 Jun 2022 08:18:56 -0700 (PDT)
X-Received: by 2002:a25:bd41:0:b0:668:c259:f6c2 with SMTP id
 p1-20020a25bd41000000b00668c259f6c2mr2339812ybm.365.1655479135681; Fri, 17
 Jun 2022 08:18:55 -0700 (PDT)
MIME-Version: 1.0
References: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com> <87ilp3kcnh.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87ilp3kcnh.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 17 Jun 2022 17:18:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWzctagdqY5_3-vDPOk0Cb97bZDBcmE6=3-EKHD0vRfCw@mail.gmail.com>
Message-ID: <CAMuHMdWzctagdqY5_3-vDPOk0Cb97bZDBcmE6=3-EKHD0vRfCw@mail.gmail.com>
Subject: Re: [PATCH v3 15/21] pinctrl: renesas: r8a779g0: add missing CANFD5_B
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
> This patch adds missing CANFD5_B
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
> +++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
> @@ -299,8 +299,8 @@
>  #define IP0SR1_31_28   FM(MSIOF0_SS1)          FM(HRX1_X)              FM(RX1_X)       F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
>
>  /* IP1SR1 */           /* 0 */                 /* 1 */                 /* 2 */         /* 3            4        5        6        7        8        9        A        B        C        D        E        F */
> -#define IP1SR1_3_0     FM(MSIOF0_SYNC)         FM(HCTS1_X_N)           FM(CTS1_X_N)    F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> -#define IP1SR1_7_4     FM(MSIOF0_TXD)          FM(HRTS1_X_N)           FM(RTS1_X_N)    F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP1SR1_3_0     FM(MSIOF0_SYNC)         FM(HCTS1_X_N)           FM(CTS1_X_N)    FM(CANFD5_B_TX) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)

CANFD5_TX_B (everywhere)

> +#define IP1SR1_7_4     FM(MSIOF0_TXD)          FM(HRTS1_X_N)           FM(RTS1_X_N)    FM(CANFD5_B_RX) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)

CANFD5_RX_B (everywhere)

>  #define IP1SR1_11_8    FM(MSIOF0_SCK)          FM(HSCK1_X)             FM(SCK1_X)      F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
>  #define IP1SR1_15_12   FM(MSIOF0_RXD)          F_(0, 0)                F_(0, 0)        F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
>  #define IP1SR1_19_16   FM(HTX0)                FM(TX0)                 F_(0, 0)        F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)

> @@ -1498,6 +1500,15 @@ static const unsigned int canfd5_data_mux[] = {
>         CANFD5_TX_MARK, CANFD5_RX_MARK,
>  };
>
> +/* - CANFD5_B ----------------------------------------------------------------- */
> +static const unsigned int canfd5_b_data_pins[] = {

canfd5_data_b_pins etc.

> +       /* CANFD5_B_TX, CANFD5_B_RX */
> +       RCAR_GP_PIN(1, 8), RCAR_GP_PIN(1, 9),
> +};

> @@ -2912,6 +2928,7 @@ static const struct sh_pfc_function pinmux_functions[] = {
>         SH_PFC_FUNCTION(canfd3),
>         SH_PFC_FUNCTION(canfd4),
>         SH_PFC_FUNCTION(canfd5),
> +       SH_PFC_FUNCTION(canfd5_b),

Please drop this, as it is not needed.

>         SH_PFC_FUNCTION(canfd6),
>         SH_PFC_FUNCTION(canfd7),
>         SH_PFC_FUNCTION(can_clk),

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
