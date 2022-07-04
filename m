Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA691565A48
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Jul 2022 17:46:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233720AbiGDPp1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Jul 2022 11:45:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234508AbiGDPpP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jul 2022 11:45:15 -0400
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 534EB60CB;
        Mon,  4 Jul 2022 08:45:11 -0700 (PDT)
Received: by mail-qt1-f170.google.com with SMTP id bs20so10333060qtb.11;
        Mon, 04 Jul 2022 08:45:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8AaAcKmeFd73kaQIFl+AdTFvuoSJlJ1Y0ezTbzD9irI=;
        b=kM03f+6UXUr6Dy0c5HPU3NtlKJG5KH32OKMWwFrwj7BteWNzodTO3yXmD4PsmYN9GT
         OqfFjyA10jN0r4pOfvt/5aZjqo2Wfydoby+PVZFOuPb9MAliCfKYRKz/jHvefqIlxDJy
         MoUEEaBoGF2Gva7Qv4Je7Tlewm/VhVmUzoZAI520l4f8GdREy8npRJquct5ZQilJaT9P
         Y8iGcBBs27krkwvyB67UyrfyOV9djpN7c48ZmOrHCDaAWSc3lOT3NaqN4qOusE+XDaW7
         imHnkwCU7mXUFQWad0QFQcaIja9w02S8/+KkUt1D9FdJ7zzf/9v7iE3k0k6Cd4+3SoxZ
         2BWQ==
X-Gm-Message-State: AJIora+PVfb6K2S1CyzB7CbFDYg5W9f1+n+YV/T37grMpMNO7pHb2NTM
        YC8Ybd9QmsER2Mmf4IvSukWnNNJdR9l4+v1E
X-Google-Smtp-Source: AGRyM1uuWl2uaZFcS92pk9n78voZXUxAeDNAV2qgsLwJ5UytrACfWJT1ppsvzzaZ/zQ3f3mGdYVm/Q==
X-Received: by 2002:ad4:5b8e:0:b0:472:fcb5:46ea with SMTP id 14-20020ad45b8e000000b00472fcb546eamr2325958qvp.30.1656949510247;
        Mon, 04 Jul 2022 08:45:10 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id bk32-20020a05620a1a2000b006af1d3e8080sm20855771qkb.85.2022.07.04.08.45.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jul 2022 08:45:10 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id i7so17500797ybe.11;
        Mon, 04 Jul 2022 08:45:09 -0700 (PDT)
X-Received: by 2002:a5b:6c1:0:b0:669:a7c3:4c33 with SMTP id
 r1-20020a5b06c1000000b00669a7c34c33mr31892295ybq.543.1656949509679; Mon, 04
 Jul 2022 08:45:09 -0700 (PDT)
MIME-Version: 1.0
References: <87h741ty20.wl-kuninori.morimoto.gx@renesas.com> <87o7y9sj90.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87o7y9sj90.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 4 Jul 2022 17:44:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXgfKSsEbxwrYa4cFPv85f_pWCxsrNY2EZCs-hXzgu9pQ@mail.gmail.com>
Message-ID: <CAMuHMdXgfKSsEbxwrYa4cFPv85f_pWCxsrNY2EZCs-hXzgu9pQ@mail.gmail.com>
Subject: Re: [PATCH v4 20/23] pinctrl: renesas: r8a779g0: add missing PWM
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

On Fri, Jul 1, 2022 at 3:40 AM Kuninori Morimoto
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

>  /* - QSPI0 ------------------------------------------------------------------ */
> @@ -2556,16 +2576,18 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
>         SH_PFC_PIN_GROUP(pcie0_clkreq_n),
>         SH_PFC_PIN_GROUP(pcie1_clkreq_n),
>
> -       SH_PFC_PIN_GROUP(pwm0),
> -       SH_PFC_PIN_GROUP(pwm1),
> -       SH_PFC_PIN_GROUP(pwm2),
> -       SH_PFC_PIN_GROUP(pwm3),
> +       SH_PFC_PIN_GROUP(pwm0_a),
> +       SH_PFC_PIN_GROUP(pwm1_a),
> +       SH_PFC_PIN_GROUP(pwm1_b),
> +       SH_PFC_PIN_GROUP(pwm2_b),
> +       SH_PFC_PIN_GROUP(pwm3_a),
> +       SH_PFC_PIN_GROUP(pwm3_b),
>         SH_PFC_PIN_GROUP(pwm4),
>         SH_PFC_PIN_GROUP(pwm5),
>         SH_PFC_PIN_GROUP(pwm6),
>         SH_PFC_PIN_GROUP(pwm7),
> -       SH_PFC_PIN_GROUP(pwm8),
> -       SH_PFC_PIN_GROUP(pwm9),
> +       SH_PFC_PIN_GROUP(pwm8_a),
> +       SH_PFC_PIN_GROUP(pwm9_a),

The groups for PWMs that are available on a single pin, but do have
a suffix (pwm[089]_a and pwm2_b), may need to be renamed later.
I'll add a /* suffix might be updated */ comment while applying.

>
>         SH_PFC_PIN_GROUP(qspi0_ctrl),
>         BUS_DATA_PIN_GROUP(qspi0_data, 2),

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl-for-v5.20.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
