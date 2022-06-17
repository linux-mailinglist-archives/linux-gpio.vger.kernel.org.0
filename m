Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60A2E54FA12
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jun 2022 17:20:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382752AbiFQPTX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jun 2022 11:19:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382224AbiFQPTW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jun 2022 11:19:22 -0400
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D310D37028;
        Fri, 17 Jun 2022 08:19:21 -0700 (PDT)
Received: by mail-qv1-f44.google.com with SMTP id t16so1871440qvh.1;
        Fri, 17 Jun 2022 08:19:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ui3SOZldAICVrytvhuEvB4kphXiQjWbE5sPkjUDLys8=;
        b=bliB2o1PUvWW8diUK3NI7LHTdlvIl/9fJqUXziNMaOifyecGGNzQN/gC7jxo/upW6G
         Rx6XVlKPOGW1kSLFW0PfO/iWejtQp2CF3OsmzuShl/mJvgZn+zn9i41nJfB2+dOHCRFE
         pKeo4jNTSNBzJ4ISaMX1J6fxknywEZ02C3HcREgfTFNEnCtzPlX5GxqOxP/QTBClw7Zx
         4nsaJWKSxk2ZRPzLMnTZEahjPXPv8FaC7bAbvPXsy3g4/KmhgXjSHYDOWuew/UEAXSuB
         JX4y9LaFXgezNxNtHWznC+vY2CGxGMVpXruw6qR1X9+nk3ClQoAy5VXqJJ8qCqiuFUcP
         ThPA==
X-Gm-Message-State: AJIora+jSskGwz6lqTyrIRDP/d5Q5vnZf3F3GN/pmXkVNgDhU30RMYgl
        aziHJgWuKiWZaYBR8eus5Djg6Yeis0iqig==
X-Google-Smtp-Source: AGRyM1uZXOMAIBqzwfL0GpTwOMjCGgldOViRp8Kr02xxnrWloc+3cfC9k4gNzGdTT1tO7fz0nL2oYA==
X-Received: by 2002:a05:6214:20e6:b0:46e:32e0:67e with SMTP id 6-20020a05621420e600b0046e32e0067emr8845261qvk.48.1655479160713;
        Fri, 17 Jun 2022 08:19:20 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id bq38-20020a05620a46a600b006a785ba0c25sm4250603qkb.77.2022.06.17.08.19.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 08:19:20 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-317741c86fdso43785477b3.2;
        Fri, 17 Jun 2022 08:19:20 -0700 (PDT)
X-Received: by 2002:a0d:f801:0:b0:30f:f716:2950 with SMTP id
 i1-20020a0df801000000b0030ff7162950mr12389856ywf.358.1655479160036; Fri, 17
 Jun 2022 08:19:20 -0700 (PDT)
MIME-Version: 1.0
References: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com> <87czfbkcmp.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87czfbkcmp.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 17 Jun 2022 17:19:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUP4nMt5y6fgOQwFXwt86pbDTTx9QisJj1gfsjF_bHrjQ@mail.gmail.com>
Message-ID: <CAMuHMdUP4nMt5y6fgOQwFXwt86pbDTTx9QisJj1gfsjF_bHrjQ@mail.gmail.com>
Subject: Re: [PATCH v3 19/21] pinctrl: renesas: r8a779g0: add missing ERROROUTC_A
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
> This patch add missing ERROROUTC_A settings.
> Current existing ERROROUTC should be _B, this patch tidyup it.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
> +++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
> @@ -263,7 +263,7 @@
>
>  /* SR0 */
>  /* IP0SR0 */           /* 0 */                 /* 1 */                 /* 2 */         /* 3            4        5        6        7        8        9        A        B        C        D        E        F */
> -#define IP0SR0_3_0     F_(0, 0)                FM(ERROROUTC)           FM(TCLK2_A)     F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP0SR0_3_0     F_(0, 0)                FM(ERROROUTC_B)         FM(TCLK2_A)     F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)

I think the rename belongs in "[PATCH v3 03/21] pinctrl: renesas:
Initial R8A779G0 (V4H) PFC support", as it is a bug in that patch.

>  #define IP0SR0_7_4     F_(0, 0)                FM(MSIOF3_SS1)          F_(0, 0)        F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
>  #define IP0SR0_11_8    F_(0, 0)                FM(MSIOF3_SS2)          F_(0, 0)        F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
>  #define IP0SR0_15_12   FM(IRQ3)                FM(MSIOF3_SCK)          F_(0, 0)        F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)

The rest LGTM, as it matches the documentation, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
