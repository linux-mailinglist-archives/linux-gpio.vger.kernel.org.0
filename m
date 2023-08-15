Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37E6577C92D
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Aug 2023 10:12:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234283AbjHOILu convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Tue, 15 Aug 2023 04:11:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235549AbjHOIL2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Aug 2023 04:11:28 -0400
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CFDE1733;
        Tue, 15 Aug 2023 01:11:26 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-d63c0a6568fso5066270276.0;
        Tue, 15 Aug 2023 01:11:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692087085; x=1692691885;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nRxQZBA08DmZvQtY3kJE3qIy+ItUcLNiLvXURs85KSE=;
        b=XI4tTMc9pwhQ3sL3T9+qfikHCUO72ojcl12q5UTwd3ze4zCaFIWuvFZ1qgRvim9U9O
         pYNKyAZSidGRdYNK8kjOznoE0ykuUnH347ax1hNnwT8pIj0Mm34eCqXozX2mVgSWsvQD
         oY0t6sN0IEeHnO1ptq0Xh8qtvU/fjSRZoyS81omvUBdpI33cOgop0OdGFG6ZD1Z0ybli
         7AfBpSNedk33aTJShalLJpmVXscnCLZbRD0DXHuFN+Eg7AFROc1CKm62IJcRRp1Ne3k1
         Y1spDQ1e2g1dAbZFn3duiFDlN/Bg0JDk90HhCUL0yzumQKWHkSscFBSAsuZ7KwsfprNW
         3tNg==
X-Gm-Message-State: AOJu0YxpxR3Cvh/TFTKmIkWSq8Vb/VTXqol78RXRKpA2piO4n+rvb265
        JYWKXeRLvHVTNVetr9fnZk7TOaDR3a8zGw==
X-Google-Smtp-Source: AGHT+IEhhhIeSmd/0NqZMkzFnlOvIRtpqbBCwU2K05E4/Cb85WvH/dlEkpqVZWRzIgxaLmOTE/vW/Q==
X-Received: by 2002:a25:ac1b:0:b0:d53:f8e6:8447 with SMTP id w27-20020a25ac1b000000b00d53f8e68447mr14251909ybi.15.1692087085273;
        Tue, 15 Aug 2023 01:11:25 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id 7-20020a250707000000b00d0c698ed6b6sm2857230ybh.41.2023.08.15.01.11.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Aug 2023 01:11:24 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-58c5642701fso5350547b3.0;
        Tue, 15 Aug 2023 01:11:24 -0700 (PDT)
X-Received: by 2002:a25:c7c5:0:b0:d12:46b1:4459 with SMTP id
 w188-20020a25c7c5000000b00d1246b14459mr13043617ybe.6.1692087084365; Tue, 15
 Aug 2023 01:11:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230815075602.10473-1-biju.das.jz@bp.renesas.com> <20230815075602.10473-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230815075602.10473-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 15 Aug 2023 10:11:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWvKnTjae=nb7KjgrzoxcQTWxhnCETp+tYgWc5SM1C5VA@mail.gmail.com>
Message-ID: <CAMuHMdWvKnTjae=nb7KjgrzoxcQTWxhnCETp+tYgWc5SM1C5VA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] pinctrl: renesas: rzg2l: Fix NULL pointer
 dereference in rzg2l_dt_subnode_to_map()
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        stable@kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Biju,

On Tue, Aug 15, 2023 at 9:56 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Fix the below random NULL pointer crash during boot by serializing
> pinctrl group and function creation/remove calls in
> rzg2l_dt_subnode_to_map() with mutex lock.
>
> Crash logs:
>  pc : __pi_strcmp+0x20/0x140
>  lr : pinmux_func_name_to_selector+0x68/0xa4
>  Call trace:
>  __pi_strcmp+0x20/0x140
>  pinmux_generic_add_function+0x34/0xcc
>  rzg2l_dt_subnode_to_map+0x314/0x44c
>  rzg2l_dt_node_to_map+0x164/0x194
>  pinctrl_dt_to_map+0x218/0x37c
>  create_pinctrl+0x70/0x3d8
>
> Fixes: c4c4637eb57f ("pinctrl: renesas: Add RZ/G2L pin and gpio controller driver")
> Cc: stable@kernel.org
> Tested-by: Chris Paterson <Chris.Paterson2@renesas.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Updated crash logs as per submitting patches doc.

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -11,6 +11,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/module.h>
> +#include <linux/mutex.h>
>  #include <linux/of.h>
>  #include <linux/of_irq.h>
>  #include <linux/platform_device.h>
> @@ -153,6 +154,7 @@ struct rzg2l_pinctrl {
>         unsigned int                    hwirq[RZG2L_TINT_MAX_INTERRUPT];
>
>         spinlock_t                      lock;
> +       struct mutex                    mutex; /* serialize adding groups and functions */

I guess it's not too late to add comments to the two other locks
(bitmap_lock and lock)?

>  };
>
>  static const unsigned int iolh_groupa_mA[] = { 2, 4, 8, 12 };
> @@ -362,10 +364,12 @@ static int rzg2l_dt_subnode_to_map(struct pinctrl_dev *pctldev,
>                 name = np->name;
>         }
>
> +       mutex_lock(&pctrl->mutex);

I think this is too late, as krealloc_array() above has already released
the old map.

>         /* Register a single pin group listing all the pins we read from DT */
>         gsel = pinctrl_generic_add_group(pctldev, name, pins, num_pinmux, NULL);
>         if (gsel < 0) {
>                 ret = gsel;
> +               mutex_unlock(&pctrl->mutex);

Please add a new label below, to avoid adding a call to mutex_unlock()
here.

>                 goto done;
>         }
>
> @@ -380,6 +384,8 @@ static int rzg2l_dt_subnode_to_map(struct pinctrl_dev *pctldev,
>                 goto remove_group;
>         }
>
> +       mutex_unlock(&pctrl->mutex);
> +
>         maps[idx].type = PIN_MAP_TYPE_MUX_GROUP;
>         maps[idx].data.mux.group = name;
>         maps[idx].data.mux.function = name;
> @@ -391,6 +397,7 @@ static int rzg2l_dt_subnode_to_map(struct pinctrl_dev *pctldev,
>
>  remove_group:
>         pinctrl_generic_remove_group(pctldev, gsel);

^^ new label here.

> +       mutex_unlock(&pctrl->mutex);
>  done:
>         *index = idx;
>         kfree(configs);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
