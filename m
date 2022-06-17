Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CEEC654FA20
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jun 2022 17:20:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382688AbiFQPSl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jun 2022 11:18:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383119AbiFQPS1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jun 2022 11:18:27 -0400
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED83514027;
        Fri, 17 Jun 2022 08:18:24 -0700 (PDT)
Received: by mail-qv1-f46.google.com with SMTP id i17so204517qvo.13;
        Fri, 17 Jun 2022 08:18:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6ONgEDYuoKsVNHYNaThodUOv7VYnsBwlqmTU5Q3b3/I=;
        b=YdM3qwSIh8jE38AgNH7ID0rpXmLuZb6r2pXcBI8Dd4m0NNIK7qQlFiWiJoPwqy7DvO
         wI6yXGkq7UOhBD+INc1Dr/Hc2u49G2b3zs8zKGf6wC8LVC1Clvp97YecPWd2FNs8eapQ
         meCgSul6CkeqyZ5t8e7sLEFZTR4n1aHHXjbLYlk5/aQvC7NDKQ3K/X6lwTxCJf9L97bS
         PD74Klv1UXIxGxm0e47oxjFTADiTGlawxZKDYKwhXbM0c1ODx1J3CyaE2GYA2wBjjuAq
         my/jiLFPi/k0iCIqKa6hg+nNlBP1SR1FeS20GUNdnK2Kv62YAdT5Xt6jC9wZP41lA0RN
         ArJQ==
X-Gm-Message-State: AJIora8kN+doetpYYGDFJK7DqH7ucRJCECclzT06TRyFVtMbTEZDsFdD
        jOo8fEjRDZ83SQ5caedGShfQZKPJbLFnNg==
X-Google-Smtp-Source: AGRyM1sP48W2L+vUXLMxHNjTwkUG+XwS4t5UeO7O+G+80L7jjXGr3ojzFmh9eS1mUp/M4NEdbodcqA==
X-Received: by 2002:ac8:5903:0:b0:305:2900:4099 with SMTP id 3-20020ac85903000000b0030529004099mr8892695qty.93.1655479103931;
        Fri, 17 Jun 2022 08:18:23 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id w15-20020a05620a424f00b006a76a939dbasm4974557qko.112.2022.06.17.08.18.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 08:18:23 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-31772f8495fso44559157b3.4;
        Fri, 17 Jun 2022 08:18:23 -0700 (PDT)
X-Received: by 2002:a81:f41:0:b0:313:4d6c:49db with SMTP id
 62-20020a810f41000000b003134d6c49dbmr12043763ywp.384.1655479103191; Fri, 17
 Jun 2022 08:18:23 -0700 (PDT)
MIME-Version: 1.0
References: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com> <87pmjbkcol.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87pmjbkcol.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 17 Jun 2022 17:18:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWWt_McEeEnU=McDyEuRZxWicQMSP+3HG+B4n_DReKK6w@mail.gmail.com>
Message-ID: <CAMuHMdWWt_McEeEnU=McDyEuRZxWicQMSP+3HG+B4n_DReKK6w@mail.gmail.com>
Subject: Re: [PATCH v3 10/21] pinctrl: renesas: r8a779g0: add missing IRQx_A/IRQx_B
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
> This patch adds missing IRQx_A/IRQx_B
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
> +++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
> @@ -278,7 +278,7 @@
>  #define IP1SR0_11_8    FM(MSIOF5_TXD)          F_(0, 0)                F_(0, 0)        F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
>  #define IP1SR0_15_12   FM(MSIOF5_SCK)          F_(0, 0)                F_(0, 0)        F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
>  #define IP1SR0_19_16   FM(MSIOF5_RXD)          F_(0, 0)                F_(0, 0)        F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> -#define IP1SR0_23_20   FM(MSIOF2_SS2)          FM(TCLK1)               F_(0, 0)        F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP1SR0_23_20   FM(MSIOF2_SS2)          FM(TCLK1)               FM(IRQ2_A)      F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
>  #define IP1SR0_27_24   FM(MSIOF2_SS1)          FM(HTX1)                FM(TX1)         F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
>  #define IP1SR0_31_28   FM(MSIOF2_SYNC)         FM(HRX1)                FM(RX1)         F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
>
> @@ -313,10 +313,10 @@
>  #define IP2SR1_7_4     FM(SCIF_CLK)            FM(IRQ4)                F_(0, 0)        F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)

"IRQ4" here should be "IRQ4_A", also in the corresponding
PINMUX_IPSR_GPSR() definition.  Probably this should be fixed in
"[PATCH v3 03/21] pinctrl: renesas: Initial R8A779G0 (V4H) PFC
support"?

The rest LGTM, as it matches the documentation, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

However, given the inconsistent naming of pins for IRQs with two
possible pin alternatives:
  - IRQ2 and IRQ2_A,
  - IRQ3 and IRQ3_B,
  - IRQ4_A and IRQ4_B,
I expect several of these to be renamed in future revisions of the
documentation.  As these names become part of the DT ABI when defining
pin groups, that happens sooner rather than later...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
