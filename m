Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC39B54FA0A
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jun 2022 17:20:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382409AbiFQPTP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jun 2022 11:19:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381817AbiFQPTP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jun 2022 11:19:15 -0400
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E09DA2DC2;
        Fri, 17 Jun 2022 08:19:13 -0700 (PDT)
Received: by mail-qv1-f49.google.com with SMTP id o43so6879891qvo.4;
        Fri, 17 Jun 2022 08:19:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ugvBXCw+/glHMrr0ck139366hFO/qQHWemWd0gavc7g=;
        b=GIaPvi7Qgl48M7Z+zzJSSKW0rEVIyu4ys0hdyUT5D/yffaXqwHbk48uP2PVxwSsAPK
         D1f3zRQ5uL2njQAkJ+t15c4yQ9uDQ9K1x7ldCmb9K/B3HRW8pKQyJkkxZt30UnuzfYYa
         R9k3uyAbq92i+5YSaXZ3oJe5XCUYM9YygPVxOVDKOyzQcanVWN6vjo6zPj8xBZOl7h9L
         dqJf9B717ERKHIbb2N4B6++wu5kdao9ttcdEi2XB8J+lNltvxkRCmFE7oxbqETcPHaJY
         k/1yAe62LZe4FAuTuO57peW01L6N9/gsQoWVZcam0XAaR3nBbkcggKmKfIyIuT/DSecS
         RUlw==
X-Gm-Message-State: AJIora/rzVBvByz+jJEnceaK72WG4EZVmYky/J1yOfGlJCNRxa7rO3R0
        wLxbySkMW1cMTyADsdYRqGOs6YlJOs6iVw==
X-Google-Smtp-Source: AGRyM1vJhsC15qh+puhalH7gQfb+eExlGsqIzHBwM9NEPzCDIvj0mVRbUOYdJjFa8abCBqx8sjpRPQ==
X-Received: by 2002:ac8:7d8b:0:b0:304:ff1e:23a0 with SMTP id c11-20020ac87d8b000000b00304ff1e23a0mr9102419qtd.186.1655479152777;
        Fri, 17 Jun 2022 08:19:12 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id br6-20020a05620a460600b006a6d3fa430csm4527974qkb.58.2022.06.17.08.19.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 08:19:12 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id t1so7789098ybd.2;
        Fri, 17 Jun 2022 08:19:12 -0700 (PDT)
X-Received: by 2002:a05:6902:120e:b0:634:6f29:6b84 with SMTP id
 s14-20020a056902120e00b006346f296b84mr11483592ybu.604.1655479152264; Fri, 17
 Jun 2022 08:19:12 -0700 (PDT)
MIME-Version: 1.0
References: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com> <87edzrkcmw.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87edzrkcmw.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 17 Jun 2022 17:19:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWPVyM0_KJFZs3t9_KT0FgDNK9NQ3=rTX5n3Jk6yG2P7w@mail.gmail.com>
Message-ID: <CAMuHMdWPVyM0_KJFZs3t9_KT0FgDNK9NQ3=rTX5n3Jk6yG2P7w@mail.gmail.com>
Subject: Re: [PATCH v3 18/21] pinctrl: renesas: r8a779g0: add missing PWM
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
> V4H has PWM/PWM_A/PWM_B, but current PFC setting is mixed.
> This patch add missing PWM settings, and tidyup these.
>
> According to Document, GP3_14 Function4 is PWM2_A,
> but we can't select it at P1SR3[27:24].
> This patch just ignore it for now.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
> +++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
> @@ -304,9 +304,9 @@
>  #define IP1SR1_11_8    FM(MSIOF0_SCK)          FM(HSCK1_X)             FM(SCK1_X)      F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
>  #define IP1SR1_15_12   FM(MSIOF0_RXD)          F_(0, 0)                F_(0, 0)        F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
>  #define IP1SR1_19_16   FM(HTX0)                FM(TX0)                 F_(0, 0)        F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> -#define IP1SR1_23_20   FM(HCTS0_N)             FM(CTS0_N)              FM(PWM8)        F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> -#define IP1SR1_27_24   FM(HRTS0_N)             FM(RTS0_N)              FM(PWM9)        F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> -#define IP1SR1_31_28   FM(HSCK0)               FM(SCK0)                FM(PWM0)        F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP1SR1_23_20   FM(HCTS0_N)             FM(CTS0_N)              FM(PWM8_A)      F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP1SR1_27_24   FM(HRTS0_N)             FM(RTS0_N)              FM(PWM9_A)      F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP1SR1_31_28   FM(HSCK0)               FM(SCK0)                FM(PWM0_A)      F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)

I think all renames belong in "[PATCH v3 03/21] pinctrl: renesas:
Initial R8A779G0 (V4H) PFC support", as it is a bug in that patch.

> @@ -2847,20 +2869,28 @@ static const char * const pcie_groups[] = {
>         "pcie1_clkreq_n",
>  };
>
> -static const char * const pwm0_groups[] = {
> -       "pwm0",
> +static const char * const pwm0_a_groups[] = {
> +       "pwm0_a",
> +};
> +
> +static const char * const pwm1_a_groups[] = {
> +       "pwm1_a",
> +};
> +
> +static const char * const pwm1_b_groups[] = {
> +       "pwm1_b",
>  };

Please have a single pwm1_groups[], containing both "pwm1_a" and
"pwm1_b".  Same for the other groups.

> @@ -3005,16 +3035,18 @@ static const struct sh_pfc_function pinmux_functions[] = {
>
>         SH_PFC_FUNCTION(pcie),
>
> -       SH_PFC_FUNCTION(pwm0),
> -       SH_PFC_FUNCTION(pwm1),
> -       SH_PFC_FUNCTION(pwm2),
> -       SH_PFC_FUNCTION(pwm3),
> +       SH_PFC_FUNCTION(pwm0_a),
> +       SH_PFC_FUNCTION(pwm1_a),
> +       SH_PFC_FUNCTION(pwm1_b),
> +       SH_PFC_FUNCTION(pwm2_b),
> +       SH_PFC_FUNCTION(pwm3_a),
> +       SH_PFC_FUNCTION(pwm3_b),
>         SH_PFC_FUNCTION(pwm4),
>         SH_PFC_FUNCTION(pwm5),
>         SH_PFC_FUNCTION(pwm6),
>         SH_PFC_FUNCTION(pwm7),
> -       SH_PFC_FUNCTION(pwm8),
> -       SH_PFC_FUNCTION(pwm9),
> +       SH_PFC_FUNCTION(pwm8_a),
> +       SH_PFC_FUNCTION(pwm9_a),

Please drop these changes, as they are not needed.

>
>         SH_PFC_FUNCTION(qspi0),
>         SH_PFC_FUNCTION(qspi1),

However, given the inconsistent naming of pins for PWMs that are
available on a single pin (PWM[08]_A vs. PWM[4-7]), I expect several
of these to be renamed in future revisions of the documentation.
As pin group names are part of the DT ABI, that should happen sooner
rather than later...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
