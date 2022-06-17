Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 879F154FA10
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jun 2022 17:20:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382512AbiFQPSp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jun 2022 11:18:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382840AbiFQPSo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jun 2022 11:18:44 -0400
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3529313CF7;
        Fri, 17 Jun 2022 08:18:44 -0700 (PDT)
Received: by mail-qk1-f177.google.com with SMTP id d128so3363006qkg.8;
        Fri, 17 Jun 2022 08:18:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tAtemtMjtCS/K/S6nkpnyrycqHb3niUdTny4Ns8dWpU=;
        b=lmk9XyQE/3WDFjvyU05ognDRFrDyKuP/3A0rtJeeJglFlmbMvJFXe5Ikb2IC0lpXwF
         MHWrq+R1t1XO/qp161Fp15ZKMGfYqm8XIZhe/W6RIr79YC/r8zIae/mcea+mKLZs18yw
         tdiBnFDv4juABc0RIl6taryTpUMUs6Q62c2BMemckwQKrRe8eZXl7TFiWXv/l4WnDAWb
         087nqdib975LwcpcozAU5E8gziWUo6KabQukiQIpmLMcwagzLOJF/KG642Mdq0NMHska
         3gxY/Wsa8qQSsk40HdFRt+fERhH6V7a1HRDfeB4flmlcvdg/RVYLe2R9cMCN0hnhLTPq
         H74g==
X-Gm-Message-State: AJIora/0dTN3WSoo5kTbuVXLApnJxc4+aDrfAhn99Y0j5pJVEkyAtH6k
        2oQnKSA0l4u/ePDdx7YpTejDWxrLk3JEXA==
X-Google-Smtp-Source: AGRyM1tFUWqBBpVJHTIIVm+NFeCToijjy3l+Rc4gIftpYTfchmCWLkz8E0AoIWTclTjEm2RWYb9E1g==
X-Received: by 2002:a05:620a:12e6:b0:6a6:a5b9:1c57 with SMTP id f6-20020a05620a12e600b006a6a5b91c57mr7148847qkl.393.1655479123078;
        Fri, 17 Jun 2022 08:18:43 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id z16-20020a05620a08d000b006a5d2eb58b2sm4381260qkz.33.2022.06.17.08.18.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 08:18:42 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id 23so7779885ybe.8;
        Fri, 17 Jun 2022 08:18:42 -0700 (PDT)
X-Received: by 2002:a05:6902:a:b0:65c:b38e:6d9f with SMTP id
 l10-20020a056902000a00b0065cb38e6d9fmr11643810ybh.36.1655479122377; Fri, 17
 Jun 2022 08:18:42 -0700 (PDT)
MIME-Version: 1.0
References: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com> <87mtefkco7.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87mtefkco7.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 17 Jun 2022 17:18:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWMFH_998MEpmMjoatvuZ8ihTg8xbZQZTAuwqFQKLxmCw@mail.gmail.com>
Message-ID: <CAMuHMdWMFH_998MEpmMjoatvuZ8ihTg8xbZQZTAuwqFQKLxmCw@mail.gmail.com>
Subject: Re: [PATCH v3 12/21] pinctrl: renesas: r8a779g0: add missing HSCIF1_X
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
> This patch adds missing HSCIF1.
> Because Document has 2xHSCIF1 with no suffix (_A, _B),
> this patch name it as _X.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
> +++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
> @@ -1554,6 +1561,29 @@ static const unsigned int hscif1_ctrl_mux[] = {
>         HRTS1_N_MARK, HCTS1_N_MARK,
>  };
>
> +/* - HSCIF1_X---------------------------------------------------------------- */
> +static const unsigned int hscif1_x_data_pins[] = {

hscif1_data_x_pins etc.

> +       /* HRX1_X, HTX1_X */
> +       RCAR_GP_PIN(1, 7), RCAR_GP_PIN(1, 6),
> +};

> @@ -2805,6 +2844,7 @@ static const struct sh_pfc_function pinmux_functions[] = {
>
>         SH_PFC_FUNCTION(hscif0),
>         SH_PFC_FUNCTION(hscif1),
> +       SH_PFC_FUNCTION(hscif1_x),

Please drop this.

>         SH_PFC_FUNCTION(hscif2),
>         SH_PFC_FUNCTION(hscif3),
>         SH_PFC_FUNCTION(hscif3_a),

Again, as the pin group names are part of the DT ABI, this cannot be
applied as-is, and we have to wait for clarification of the suffixes.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
