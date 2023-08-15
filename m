Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2E8577C93E
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Aug 2023 10:18:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235561AbjHOISV convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Tue, 15 Aug 2023 04:18:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235630AbjHOISE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Aug 2023 04:18:04 -0400
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E921198B;
        Tue, 15 Aug 2023 01:18:01 -0700 (PDT)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6bd0425ad4fso4369524a34.2;
        Tue, 15 Aug 2023 01:18:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692087481; x=1692692281;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=00XaIOyq5bwH5EIuferibK11qGjNq0Cn81AZcWNtl74=;
        b=AlAJ0ZlXlaUP1w9fjHL8fU09JkOPaHgY/9vgQkU5sY09IESrUxBgljq4gdvwlASHhz
         KOt0tqmS2/qDBpyqVbFOkzjw5C2ZlM/iEh+rzXz/5xejtg/1Y2qmThU09KCGrTuuyM58
         aeXATFYWJWk7B9ICY6lxYEbdZ+mFP7QI0WKIupan5tY46zpseDmt3ftm14mcsWX+XjJm
         A/i2d0+geyhCILMwmMQVd1l6/hM6u6tCaxOPe1TfpAYi29VqX93ztwNBeijuFFBSl2vL
         ZurolAsOdU0BR4eN9g0yT3f7VpEW5LLws0WJDugzd/IaU7hsiJI806Rf5vcop6b5X+ck
         lOiQ==
X-Gm-Message-State: AOJu0Yx+YwL8zPpf5s8F76QojuVZ/a1ISkXOK0pn3kJ2yYC6sNBMyZmK
        S6q9nGavboprvv0ekGeZK++wLYle1lj52Q==
X-Google-Smtp-Source: AGHT+IGa3Ep91Z+qGDVcbbpZPD1Wkt/B6bl7gJfeXMMMuv/VBCaK6Dq8IES7k+ASI+Bg67yZ/bS2Fg==
X-Received: by 2002:a05:6830:1497:b0:6b7:319d:281e with SMTP id s23-20020a056830149700b006b7319d281emr10590027otq.19.1692087480896;
        Tue, 15 Aug 2023 01:18:00 -0700 (PDT)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com. [209.85.161.54])
        by smtp.gmail.com with ESMTPSA id v22-20020a9d5a16000000b006b9cb784553sm4986907oth.36.2023.08.15.01.17.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Aug 2023 01:18:00 -0700 (PDT)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-56d0d7300d9so3909605eaf.1;
        Tue, 15 Aug 2023 01:17:59 -0700 (PDT)
X-Received: by 2002:a05:6358:919e:b0:134:d282:92e9 with SMTP id
 j30-20020a056358919e00b00134d28292e9mr9225644rwa.29.1692087479378; Tue, 15
 Aug 2023 01:17:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230815075602.10473-1-biju.das.jz@bp.renesas.com> <20230815075602.10473-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230815075602.10473-4-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 15 Aug 2023 10:17:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX8qChEqHPk57fjDy=uxPbk0GF+VzEjdcFB7Xhu_3z-5A@mail.gmail.com>
Message-ID: <CAMuHMdX8qChEqHPk57fjDy=uxPbk0GF+VzEjdcFB7Xhu_3z-5A@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] pinctrl: renesas: rza2: Add lock around pinctrl_generic{{add,remove}_group,{add,remove}_function}
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Biju,

On Tue, Aug 15, 2023 at 9:56 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> The pinctrl group and function creation/remove calls expect
> caller to take care of locking. Add lock around these functions.
>
> Fixes: b59d0e782706 ("pinctrl: Add RZ/A2 pin and gpio controller")
> Cc: stable@kernel.org
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * No change.

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rza2.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rza2.c

> @@ -359,10 +361,13 @@ static int rza2_dt_node_to_map(struct pinctrl_dev *pctldev,
>                 psel_val[i] = MUX_FUNC(value);
>         }
>
> +       mutex_lock(&priv->mutex);
>         /* Register a single pin group listing all the pins we read from DT */
>         gsel = pinctrl_generic_add_group(pctldev, np->name, pins, npins, NULL);
> -       if (gsel < 0)
> +       if (gsel < 0) {
> +               mutex_unlock(&priv->mutex);
>                 return gsel;

Please do not mix "cleanup + return" and "goto cleanup" style in the same
function.  I.e. goto new label below.

> +       }
>
>         /*
>          * Register a single group function where the 'data' is an array PSEL

> @@ -398,6 +404,7 @@ static int rza2_dt_node_to_map(struct pinctrl_dev *pctldev,
>
>  remove_group:
>         pinctrl_generic_remove_group(pctldev, gsel);

^^ new label here.

> +       mutex_unlock(&priv->mutex);
>
>         dev_err(priv->dev, "Unable to parse DT node %s\n", np->name);
>

The rest LGTM (unless I'm missing something critical in the real root
cause of the issue?).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
