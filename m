Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 109B154FA0B
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jun 2022 17:20:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381938AbiFQPSz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jun 2022 11:18:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382554AbiFQPSy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jun 2022 11:18:54 -0400
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C15914A91E;
        Fri, 17 Jun 2022 08:18:53 -0700 (PDT)
Received: by mail-qv1-f43.google.com with SMTP id 43so6871740qvb.3;
        Fri, 17 Jun 2022 08:18:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S5uKoIYSJj+oLbLFTpXl5kGS1o0vLs8hW14XtNbxkso=;
        b=j5Miz33ELePCkHbEQIHngFhHhVbdbK19IsZvTwXLxSoLeWf/09NhAz609AanJq/Juc
         fZPq9iRHPe7EFd/l6oVKh/rZBVyt6A4LppFnStQHGSHqJLG9tejFET1DYtw9s0TKQ2d/
         P7KYSkemRKWAF1q91s1B2+Lhfqr3luBNrxlWuujunMvtIL/5KuA9GSnaQWk2aj6Ns89P
         XxHp7a+5asALJkQDdY/R88YhBOy3Vn6pWtG2qPM3/X1pZ+w18CPf4gevR3EyXG+IRUmR
         tFSAZJVPNQkTFdg44bR+C8IXJuZSa9U+qGeocDJ43SfkSSdarwxa74v6qmFB+922zhzE
         JwPw==
X-Gm-Message-State: AJIora99Xy2nH3+m8NH/QHkEzoZE5tnqQGKPkfGdscCVljsWbYJuSlTW
        Bk1jJSmPUQT6QjnsBxiZBxDxgJ3xDlJUyg==
X-Google-Smtp-Source: AGRyM1uSIw4sP+sA9yY/1dTyA+/P0chhJIH6eRd/BIUyto+f+ZvXthaVYFTitDsnLSSf5moiK6M5UQ==
X-Received: by 2002:a05:6214:5187:b0:46b:c045:1a2c with SMTP id kl7-20020a056214518700b0046bc0451a2cmr8688991qvb.33.1655479132564;
        Fri, 17 Jun 2022 08:18:52 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id v11-20020a05620a440b00b006a6a7b4e7besm4880892qkp.109.2022.06.17.08.18.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 08:18:52 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-3178acf2a92so11484897b3.6;
        Fri, 17 Jun 2022 08:18:52 -0700 (PDT)
X-Received: by 2002:a81:574c:0:b0:317:7c3a:45be with SMTP id
 l73-20020a81574c000000b003177c3a45bemr6210378ywb.316.1655479131863; Fri, 17
 Jun 2022 08:18:51 -0700 (PDT)
MIME-Version: 1.0
References: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com> <87k09jkcno.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87k09jkcno.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 17 Jun 2022 17:18:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXDeQ8K2sU8h8sPq5NRbKBqemwmnhotQS37fePvc6vE5w@mail.gmail.com>
Message-ID: <CAMuHMdXDeQ8K2sU8h8sPq5NRbKBqemwmnhotQS37fePvc6vE5w@mail.gmail.com>
Subject: Re: [PATCH v3 14/21] pinctrl: renesas: r8a779g0: add missing SCIF1_X
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
> This patch adds missing SCIF1_X.
> Because Document has 2xSCIF1 with no suffix (_A, _B),
> this patch name it as _X.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
> +++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
> @@ -295,13 +295,13 @@
>  #define IP0SR1_15_12   FM(MSIOF1_SCK)          FM(HSCK3_A)             FM(CTS3_N)      F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
>  #define IP0SR1_19_16   FM(MSIOF1_TXD)          FM(HRX3_A)              FM(SCK3)        F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
>  #define IP0SR1_23_20   FM(MSIOF1_RXD)          F_(0, 0)                F_(0, 0)        F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> -#define IP0SR1_27_24   FM(MSIOF0_SS2)          FM(HTX1_X)              F_(0, 0)        F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> -#define IP0SR1_31_28   FM(MSIOF0_SS1)          FM(HRX1_X)              F_(0, 0)        F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP0SR1_27_24   FM(MSIOF0_SS2)          FM(HTX1_X)              FM(TX1_X)       F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP0SR1_31_28   FM(MSIOF0_SS1)          FM(HRX1_X)              FM(RX1_X)       F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
>
>  /* IP1SR1 */           /* 0 */                 /* 1 */                 /* 2 */         /* 3            4        5        6        7        8        9        A        B        C        D        E        F */
> -#define IP1SR1_3_0     FM(MSIOF0_SYNC)         FM(HCTS1_X_N)           F_(0, 0)        F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> -#define IP1SR1_7_4     FM(MSIOF0_TXD)          FM(HRTS1_X_N)           F_(0, 0)        F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> -#define IP1SR1_11_8    FM(MSIOF0_SCK)          FM(HSCK1_X)             F_(0, 0)        F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP1SR1_3_0     FM(MSIOF0_SYNC)         FM(HCTS1_X_N)           FM(CTS1_X_N)    F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)

CTS1_N_X (everywhere)

> +#define IP1SR1_7_4     FM(MSIOF0_TXD)          FM(HRTS1_X_N)           FM(RTS1_X_N)    F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)

RTS1_N_X (everywhere)

> +#define IP1SR1_11_8    FM(MSIOF0_SCK)          FM(HSCK1_X)             FM(SCK1_X)      F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
>  #define IP1SR1_15_12   FM(MSIOF0_RXD)          F_(0, 0)                F_(0, 0)        F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
>  #define IP1SR1_19_16   FM(HTX0)                FM(TX0)                 F_(0, 0)        F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
>  #define IP1SR1_23_20   FM(HCTS0_N)             FM(CTS0_N)              FM(PWM8)        F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)

> @@ -2210,6 +2215,29 @@ static const unsigned int scif1_ctrl_mux[] = {
>         RTS1_N_MARK, CTS1_N_MARK,
>  };
>
> +/* - SCIF1_X ------------------------------------------------------------------ */
> +static const unsigned int scif1_x_data_pins[] = {

scif1_data_x_pins etc.

> +       /* RX1_X, TX1_X */
> +       RCAR_GP_PIN(1, 7), RCAR_GP_PIN(1, 6),
> +};

> @@ -2920,6 +2957,7 @@ static const struct sh_pfc_function pinmux_functions[] = {
>
>         SH_PFC_FUNCTION(scif0),
>         SH_PFC_FUNCTION(scif1),
> +       SH_PFC_FUNCTION(scif1_x),

Please drop this, as it is not needed.

>         SH_PFC_FUNCTION(scif3),
>         SH_PFC_FUNCTION(scif3_a),
>         SH_PFC_FUNCTION(scif4),

Again, as the pin group names are part of the DT ABI, this cannot be
applied as-is, and we have to wait for clarification of the suffixes.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
