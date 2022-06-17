Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7395354FA09
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jun 2022 17:20:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382588AbiFQPSm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jun 2022 11:18:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383143AbiFQPSg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jun 2022 11:18:36 -0400
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0B3949B71;
        Fri, 17 Jun 2022 08:18:34 -0700 (PDT)
Received: by mail-qk1-f180.google.com with SMTP id a184so3363598qkg.5;
        Fri, 17 Jun 2022 08:18:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tmZ52OhXbQ0A1Y2QT/L4wMYpr27Rb2/KGUdXcuOCy0A=;
        b=ozq/9jEJzw/yLlRAr0tTUVInVrnIkyat1U2ynm2QUJJFDOhvGZtLGr8b138Tub12+P
         3cAZPxn95VxfojYg9f5uSxBDt5lUdV8ccOq0KSf9RE86h1P7sEEZIq1yERx3IAI0Vs4D
         SYWtzWEnvRz5YPzXBMO3QfntDuagm4YRyK70w+HpMCQf1et/s0UnZwL1MWhPLQOtgwBh
         Sb4BLW6BUlKzV5rvHa0DhRiuAvXHUPg8abJLL3+T6FZwm4Y55dD8AnGA/1htB5/c+5DD
         +vD5+D45DnrQtI2sgEVhKJw2F0eEAtK8a6dVUtHIP2w5PlR9Mo+FDmhjHeIG7Tg7cWPL
         87ow==
X-Gm-Message-State: AJIora9r4b7tAXiNjlftkkbFB0PYtQzVIw4AKm3yUbRgmv3lRq5DU3NQ
        EWJfIvJshMrDdbExksTYno93lxI3nWlz9A==
X-Google-Smtp-Source: AGRyM1tBpHQxAcBYFOu1EPnEHpwxzPdaTkDvLlBGz2xRw6JqBsWj88R8sxOQlQWI5fD3ZDCesLZHTQ==
X-Received: by 2002:a05:620a:4403:b0:6a6:d0ee:8b22 with SMTP id v3-20020a05620a440300b006a6d0ee8b22mr7452845qkp.144.1655479113348;
        Fri, 17 Jun 2022 08:18:33 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id f9-20020a05620a408900b006a740bb8578sm4864220qko.83.2022.06.17.08.18.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 08:18:33 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id 23so7779074ybe.8;
        Fri, 17 Jun 2022 08:18:32 -0700 (PDT)
X-Received: by 2002:a25:818c:0:b0:664:a584:fafd with SMTP id
 p12-20020a25818c000000b00664a584fafdmr11162396ybk.543.1655479112671; Fri, 17
 Jun 2022 08:18:32 -0700 (PDT)
MIME-Version: 1.0
References: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com> <87o7yvkcoe.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87o7yvkcoe.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 17 Jun 2022 17:18:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVn-Y6JdJ0w3eCDbhqh0fi=GdEOcka+aD6WiwR_FF9cZw@mail.gmail.com>
Message-ID: <CAMuHMdVn-Y6JdJ0w3eCDbhqh0fi=GdEOcka+aD6WiwR_FF9cZw@mail.gmail.com>
Subject: Re: [PATCH v3 11/21] pinctrl: renesas: r8a779g0: add missing HSCIF3_A
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
> This patch adds missing HSCIF3_A
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
> +++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
> @@ -289,11 +289,11 @@
>
>  /* SR1 */
>  /* IP0SR1 */           /* 0 */                 /* 1 */                 /* 2 */         /* 3            4        5        6        7        8        9        A        B        C        D        E        F */
> -#define IP0SR1_3_0     FM(MSIOF1_SS2)          F_(0, 0)                F_(0, 0)        F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> -#define IP0SR1_7_4     FM(MSIOF1_SS1)          F_(0, 0)                F_(0, 0)        F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> -#define IP0SR1_11_8    FM(MSIOF1_SYNC)         F_(0, 0)                F_(0, 0)        F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> -#define IP0SR1_15_12   FM(MSIOF1_SCK)          F_(0, 0)                F_(0, 0)        F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> -#define IP0SR1_19_16   FM(MSIOF1_TXD)          F_(0, 0)                F_(0, 0)        F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP0SR1_3_0     FM(MSIOF1_SS2)          FM(HTX3_A)              F_(0, 0)        F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP0SR1_7_4     FM(MSIOF1_SS1)          FM(HCTS3_A_N)           F_(0, 0)        F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)

HCTS3_N_A

> +#define IP0SR1_11_8    FM(MSIOF1_SYNC)         FM(HRTS3_A_N)           F_(0, 0)        F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)

HRTS3_N_A

> +#define IP0SR1_15_12   FM(MSIOF1_SCK)          FM(HSCK3_A)             F_(0, 0)        F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP0SR1_19_16   FM(MSIOF1_TXD)          FM(HRX3_A)              F_(0, 0)        F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
>  #define IP0SR1_23_20   FM(MSIOF1_RXD)          F_(0, 0)                F_(0, 0)        F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
>  #define IP0SR1_27_24   FM(MSIOF0_SS2)          F_(0, 0)                F_(0, 0)        F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
>  #define IP0SR1_31_28   FM(MSIOF0_SS1)          F_(0, 0)                F_(0, 0)        F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> @@ -824,10 +824,20 @@ static const u16 pinmux_data[] = {
>
>         /* IP0SR1 */
>         PINMUX_IPSR_GPSR(IP0SR1_3_0,    MSIOF1_SS2),
> +       PINMUX_IPSR_GPSR(IP0SR1_3_0,    HTX3_A),
> +
>         PINMUX_IPSR_GPSR(IP0SR1_7_4,    MSIOF1_SS1),
> +       PINMUX_IPSR_GPSR(IP0SR1_7_4,    HCTS3_A_N),

HCTS3_N_A

> +
>         PINMUX_IPSR_GPSR(IP0SR1_11_8,   MSIOF1_SYNC),
> +       PINMUX_IPSR_GPSR(IP0SR1_11_8,   HRTS3_A_N),

HRTS3_N_A

> +
>         PINMUX_IPSR_GPSR(IP0SR1_15_12,  MSIOF1_SCK),
> +       PINMUX_IPSR_GPSR(IP0SR1_15_12,  HSCK3_A),
> +
>         PINMUX_IPSR_GPSR(IP0SR1_19_16,  MSIOF1_TXD),
> +       PINMUX_IPSR_GPSR(IP0SR1_19_16,  HRX3_A),
> +
>         PINMUX_IPSR_GPSR(IP0SR1_23_20,  MSIOF1_RXD),
>         PINMUX_IPSR_GPSR(IP0SR1_27_24,  MSIOF0_SS2),
>         PINMUX_IPSR_GPSR(IP0SR1_31_28,  MSIOF0_SS1),
> @@ -1590,6 +1600,29 @@ static const unsigned int hscif3_ctrl_mux[] = {
>         HRTS3_N_MARK, HCTS3_N_MARK,
>  };
>
> +/* - HSCIF3_A ----------------------------------------------------------------- */
> +static const unsigned int hscif3_a_data_pins[] = {

The "_a" suffix should be at the end of the name,
i.e. "hscif3_data_a_pins"

(Looks like we do have a few exception: ssi[78]*_[bc]_(data|ctrl)
 in pfc-r8a7790.c).

> +       /* HRX3, HTX3 */
> +       RCAR_GP_PIN(1, 4), RCAR_GP_PIN(1, 0),
> +};
> +static const unsigned int hscif3_a_data_mux[] = {

hscif3_data_a_mux

> +       HRX3_A_MARK, HTX3_A_MARK,
> +};
> +static const unsigned int hscif3_a_clk_pins[] = {

hscif3_clk_a_pins

> +       /* HSCK3 */
> +       RCAR_GP_PIN(1, 3),
> +};
> +static const unsigned int hscif3_a_clk_mux[] = {

hscif3_clk_a_mux

> +       HSCK3_A_MARK,
> +};
> +static const unsigned int hscif3_a_ctrl_pins[] = {

hscif3_ctrl_a_pins

> +       /* HRTS3#, HCTS3# */
> +       RCAR_GP_PIN(1, 2), RCAR_GP_PIN(1, 1),
> +};
> +static const unsigned int hscif3_a_ctrl_mux[] = {

hscif3_ctrl_a_mux

> +       HRTS3_A_N_MARK, HCTS3_A_N_MARK,

HRTS3_N_A_MARK, HCTS3_N_A_MARK

> +};
> +
>  /* - I2C0 ------------------------------------------------------------------- */
>  static const unsigned int i2c0_pins[] = {
>         /* SDA0, SCL0 */
> @@ -2351,6 +2384,9 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
>         SH_PFC_PIN_GROUP(hscif3_data),
>         SH_PFC_PIN_GROUP(hscif3_clk),
>         SH_PFC_PIN_GROUP(hscif3_ctrl),
> +       SH_PFC_PIN_GROUP(hscif3_a_data),

hscif3_data_a

> +       SH_PFC_PIN_GROUP(hscif3_a_clk),

hscif3_clk_a

> +       SH_PFC_PIN_GROUP(hscif3_a_ctrl),

hscif3_ctrl_a

>
>         SH_PFC_PIN_GROUP(i2c0),
>         SH_PFC_PIN_GROUP(i2c1),
> @@ -2555,6 +2591,12 @@ static const char * const hscif3_groups[] = {
>         "hscif3_ctrl",
>  };
>
> +static const char * const hscif3_a_groups[] = {
> +       "hscif3_a_data",

hscif3_data_a

> +       "hscif3_a_clk",

hscif3_clk_a

> +       "hscif3_a_ctrl",

hscif3_ctrl_a

> +};
> +
>  static const char * const i2c0_groups[] = {
>         "i2c0",
>  };
> @@ -2765,6 +2807,7 @@ static const struct sh_pfc_function pinmux_functions[] = {
>         SH_PFC_FUNCTION(hscif1),
>         SH_PFC_FUNCTION(hscif2),
>         SH_PFC_FUNCTION(hscif3),
> +       SH_PFC_FUNCTION(hscif3_a),

Please drop this. Functions don't need alternatives.

>
>         SH_PFC_FUNCTION(i2c0),
>         SH_PFC_FUNCTION(i2c1),

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
