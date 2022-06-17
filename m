Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D99CC54FA17
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jun 2022 17:20:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382449AbiFQPSt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jun 2022 11:18:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382409AbiFQPSt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jun 2022 11:18:49 -0400
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 900AB45057;
        Fri, 17 Jun 2022 08:18:48 -0700 (PDT)
Received: by mail-qv1-f47.google.com with SMTP id p31so6856812qvp.5;
        Fri, 17 Jun 2022 08:18:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W9smBPqqrqwlaTilwUbt5I6MA0sfuB2cEe81bgfu49w=;
        b=LAe99psZjdbhij+uxi3Q+jTPzIrzSI5QX+jkEe+zbrk5fFEzTXJ8Or7/UXzi8hWutX
         NDfRbcj5FvKOUbQOU2A2x2P18EmwdzQ/r719jOVHFvgBDkoFIFyI02dt7plJzcxt4tLU
         /gtWC+bALGOeGAqdPvmx/05gb9zNMllv2o5dB8WRYlpXOp/G/CNx69W90z/wL/3GD4xB
         faGoE9yt4hEOJVI5FQ1ppQ3EBMg/eniI3rctUpMoCFNEB1H/QMEK7QEAobounJyAubVT
         ewj+k5jrSIKrTN+z6smYIKzTNs3VgVRmEKAYoiNxhHbcy6K21dGw+qtLYtLpiUEVik5r
         zitg==
X-Gm-Message-State: AJIora8A2Zet0bRxLYydILAga+jv6KiImfYMVcR/oJDomrRFgr9xo4xG
        F9vTMBq/xk8lStv/kMb7BJ0INDO6uI2Tpg==
X-Google-Smtp-Source: AGRyM1tDGCj0B0szOog+B41geg90JmIPiH3xM54LRmX3IrVfxGikr71Dyxk4eug3049EIOgVcteI1g==
X-Received: by 2002:ac8:5e4e:0:b0:306:773f:b747 with SMTP id i14-20020ac85e4e000000b00306773fb747mr8846374qtx.499.1655479127297;
        Fri, 17 Jun 2022 08:18:47 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id h22-20020ac85856000000b00304e95ec0fbsm4642479qth.89.2022.06.17.08.18.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 08:18:46 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-3137316bb69so45300717b3.10;
        Fri, 17 Jun 2022 08:18:46 -0700 (PDT)
X-Received: by 2002:a81:6157:0:b0:30c:7e4d:b28e with SMTP id
 v84-20020a816157000000b0030c7e4db28emr11917930ywb.502.1655479126541; Fri, 17
 Jun 2022 08:18:46 -0700 (PDT)
MIME-Version: 1.0
References: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com> <87letzkcnz.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87letzkcnz.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 17 Jun 2022 17:18:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV0x2CFkAMA1zU7Dvs3_OXVzDLu9Rc9DVHjGtnxpAU0LQ@mail.gmail.com>
Message-ID: <CAMuHMdV0x2CFkAMA1zU7Dvs3_OXVzDLu9Rc9DVHjGtnxpAU0LQ@mail.gmail.com>
Subject: Re: [PATCH v3 13/21] pinctrl: renesas: r8a779g0: add missing SCIF3
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
> V4H has SCIF3 and SCIF3_A, but current PFC setting is mixed.
> Exising SCIF3 settings on IP3SR1 should be SCIF3_A,
> and existing settings on scif3_xxx[] are for SCIF3.
>
> This patch add missing SCIF3 settings on IP0SR1,
> rename IP3SR1 settings to SCIF3_A,
> add missing scif3_a_xxx[].
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
> +++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
> @@ -319,11 +319,11 @@
>  #define IP2SR1_31_28   F_(0, 0)                FM(TCLK2)               FM(MSIOF4_SS1)  FM(IRQ3_B)      F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
>
>  /* IP3SR1 */           /* 0 */                 /* 1 */                 /* 2 */         /* 3            4        5        6        7        8        9        A        B        C        D        E        F */
> -#define IP3SR1_3_0     FM(HRX3)                FM(SCK3)                FM(MSIOF4_SS2)  F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> -#define IP3SR1_7_4     FM(HSCK3)               FM(CTS3_N)              FM(MSIOF4_SCK)  F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> -#define IP3SR1_11_8    FM(HRTS3_N)             FM(RTS3_N)              FM(MSIOF4_TXD)  F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> -#define IP3SR1_15_12   FM(HCTS3_N)             FM(RX3)                 FM(MSIOF4_RXD)  F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> -#define IP3SR1_19_16   FM(HTX3)                FM(TX3)                 FM(MSIOF4_SYNC) F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP3SR1_3_0     FM(HRX3)                FM(SCK3_A)              FM(MSIOF4_SS2)  F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)

> +#define IP3SR1_7_4     FM(HSCK3)               FM(CTS3_A_N)            FM(MSIOF4_SCK)  F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)

CTS3_N_A (everywhere)

> +#define IP3SR1_11_8    FM(HRTS3_N)             FM(RTS3_A_N)            FM(MSIOF4_TXD)  F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)

RTS3_N_A (everywhere)

> +#define IP3SR1_15_12   FM(HCTS3_N)             FM(RX3_A)               FM(MSIOF4_RXD)  F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP3SR1_19_16   FM(HTX3)                FM(TX3_A)               FM(MSIOF4_SYNC) F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)

I think this part belongs in "[PATCH v3 03/21] pinctrl: renesas:
Initial R8A779G0 (V4H) PFC support", as it is a bug in that patch.

>
>  /* SR2 */
>  /* IP0SR2 */           /* 0 */                 /* 1 */                 /* 2 */         /* 3            4        5        6        7        8        9        A        B        C        D        E        F */

> @@ -901,23 +906,23 @@ static const u16 pinmux_data[] = {
>
>         /* IP3SR1 */
>         PINMUX_IPSR_GPSR(IP3SR1_3_0,    HRX3),
> -       PINMUX_IPSR_GPSR(IP3SR1_3_0,    SCK3),
> +       PINMUX_IPSR_GPSR(IP3SR1_3_0,    SCK3_A),
>         PINMUX_IPSR_GPSR(IP3SR1_3_0,    MSIOF4_SS2),
>
>         PINMUX_IPSR_GPSR(IP3SR1_7_4,    HSCK3),
> -       PINMUX_IPSR_GPSR(IP3SR1_7_4,    CTS3_N),
> +       PINMUX_IPSR_GPSR(IP3SR1_7_4,    CTS3_A_N),
>         PINMUX_IPSR_GPSR(IP3SR1_7_4,    MSIOF4_SCK),
>
>         PINMUX_IPSR_GPSR(IP3SR1_11_8,   HRTS3_N),
> -       PINMUX_IPSR_GPSR(IP3SR1_11_8,   RTS3_N),
> +       PINMUX_IPSR_GPSR(IP3SR1_11_8,   RTS3_A_N),
>         PINMUX_IPSR_GPSR(IP3SR1_11_8,   MSIOF4_TXD),
>
>         PINMUX_IPSR_GPSR(IP3SR1_15_12,  HCTS3_N),
> -       PINMUX_IPSR_GPSR(IP3SR1_15_12,  RX3),
> +       PINMUX_IPSR_GPSR(IP3SR1_15_12,  RX3_A),
>         PINMUX_IPSR_GPSR(IP3SR1_15_12,  MSIOF4_RXD),
>
>         PINMUX_IPSR_GPSR(IP3SR1_19_16,  HTX3),

> -       PINMUX_IPSR_GPSR(IP3SR1_19_16,  TX3),
> +       PINMUX_IPSR_GPSR(IP3SR1_19_16,  TX3_A),
>         PINMUX_IPSR_GPSR(IP3SR1_19_16,  MSIOF4_SYNC),

I think this part belongs in "[PATCH v3 03/21] pinctrl: renesas:
Initial R8A779G0 (V4H) PFC support", as it is a bug in that patch.

>
>         /* IP0SR2 */
> @@ -2228,6 +2233,29 @@ static const unsigned int scif3_ctrl_mux[] = {
>         RTS3_N_MARK, CTS3_N_MARK,
>  };
>
> +/* - SCIF3_A ------------------------------------------------------------------ */
> +static const unsigned int scif3_a_data_pins[] = {

scif3_data_a_pins etc.

> +       /* RX3_A, TX3_A */
> +       RCAR_GP_PIN(1, 27), RCAR_GP_PIN(1, 28),
> +};

> @@ -2884,6 +2921,7 @@ static const struct sh_pfc_function pinmux_functions[] = {
>         SH_PFC_FUNCTION(scif0),
>         SH_PFC_FUNCTION(scif1),
>         SH_PFC_FUNCTION(scif3),
> +       SH_PFC_FUNCTION(scif3_a),

Please drop this, as it is not needed.

>         SH_PFC_FUNCTION(scif4),
>         SH_PFC_FUNCTION(scif_clk),

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
