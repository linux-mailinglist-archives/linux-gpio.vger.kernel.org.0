Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E02E77C935
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Aug 2023 10:14:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235149AbjHOIOA convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Tue, 15 Aug 2023 04:14:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235568AbjHOINa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Aug 2023 04:13:30 -0400
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E35E310C6;
        Tue, 15 Aug 2023 01:13:28 -0700 (PDT)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5633b7e5f90so3730596eaf.1;
        Tue, 15 Aug 2023 01:13:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692087208; x=1692692008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E8SmwZkKYGqKAYaRKiH5b91fWTHdKlX/9pKsGUPmdYs=;
        b=X/biAold+SZYahhjudD6Y894aUrEUqqUCBGN5e2zCiL7O7dqa7tGLjEiuYiqaCFP/d
         BzCpC7DHFe4rlhh4QJmK4Mrb9zkGsC1syZcj3m1Mrv1x8sL4yrUp4YiTFAgEZ4iEZUcY
         aDVu5UOLk00iBgAP578JDkEPvYJ90F7cxJXXBQzLzcRiZU7RiDqk3fpJoSy97kRFqm7U
         03Zd2IRCRtZ+H+LV0Ldazr/zg37TiMnId6xYsK5nY5ihnKH/crtRdKWsvW4jKn7foK+c
         ZOO1AN2oPqNT0GiTd9A4VXBeBRB+YkyEpbfx0z64TjR9Z3U1uOdLnTcJFu6nZUnGoEcG
         OdEQ==
X-Gm-Message-State: AOJu0Ywn6mc5o+GBp2+yofPnACvtCXtleAblh4w/bQy3HMtB/iReeMxu
        eOU8u7wQedZKO2VnnCy6/ERmckD6OK6Vkg==
X-Google-Smtp-Source: AGHT+IH3xcmVtVczDuykO8p9SX1HjT3F78SdYR7J7v5fHCcatECZ2C4vuOCjPAKXWOKUVJuym4u9YA==
X-Received: by 2002:a05:6358:3418:b0:13a:3062:8d72 with SMTP id h24-20020a056358341800b0013a30628d72mr11053630rwd.9.1692087207920;
        Tue, 15 Aug 2023 01:13:27 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id s133-20020a25778b000000b00d0bad22d652sm2857618ybc.36.2023.08.15.01.13.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Aug 2023 01:13:27 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-d690c9fbda3so1584302276.0;
        Tue, 15 Aug 2023 01:13:27 -0700 (PDT)
X-Received: by 2002:a25:b190:0:b0:cc6:26f7:f0ea with SMTP id
 h16-20020a25b190000000b00cc626f7f0eamr9894906ybj.27.1692087207172; Tue, 15
 Aug 2023 01:13:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230815075602.10473-1-biju.das.jz@bp.renesas.com> <20230815075602.10473-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230815075602.10473-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 15 Aug 2023 10:13:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVnTmDP3kZAwXTQA7Zzak=tSMTjWAk1VKpV=mJzSThS2g@mail.gmail.com>
Message-ID: <CAMuHMdVnTmDP3kZAwXTQA7Zzak=tSMTjWAk1VKpV=mJzSThS2g@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] pinctrl: renesas: rzv2m: Fix NULL pointer
 dereference in rzv2m_dt_subnode_to_map()
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Biju,

On Tue, Aug 15, 2023 at 9:56 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Fix the below random NULL pointer crash during boot by serializing
> groups and functions creation in rzv2m_dt_subnode_to_map() with
> mutex lock.
>
> Crash logs:
>  pc : __pi_strcmp+0x20/0x140
>  lr : pinmux_func_name_to_selector+0x68/0xa4
>  Call trace:
>  __pi_strcmp+0x20/0x140
>  pinmux_generic_add_function+0x34/0xcc
>  rzv2m_dt_subnode_to_map+0x2e4/0x418
>  rzv2m_dt_node_to_map+0x15c/0x18c
>  pinctrl_dt_to_map+0x218/0x37c
>  create_pinctrl+0x70/0x3d8
>
> Fixes: 92a9b8252576 ("pinctrl: renesas: Add RZ/V2M pin and gpio controller driver")
> Cc: stable@kernel.org
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Updated crash logs as per submitting patches doc.

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rzv2m.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzv2m.c
> @@ -14,6 +14,7 @@
>  #include <linux/gpio/driver.h>
>  #include <linux/io.h>
>  #include <linux/module.h>
> +#include <linux/mutex.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/spinlock.h>
> @@ -124,6 +125,7 @@ struct rzv2m_pinctrl {
>         struct pinctrl_gpio_range       gpio_range;
>
>         spinlock_t                      lock;
> +       struct mutex                    mutex; /* serialize adding groups and functions */

I guess it's not too late to add a comment to the other lock?

>  };
>
>  static const unsigned int drv_1_8V_group2_uA[] = { 1800, 3800, 7800, 11000 };
> @@ -322,10 +324,12 @@ static int rzv2m_dt_subnode_to_map(struct pinctrl_dev *pctldev,
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
> @@ -340,6 +344,8 @@ static int rzv2m_dt_subnode_to_map(struct pinctrl_dev *pctldev,
>                 goto remove_group;
>         }
>
> +       mutex_unlock(&pctrl->mutex);
> +
>         maps[idx].type = PIN_MAP_TYPE_MUX_GROUP;
>         maps[idx].data.mux.group = name;
>         maps[idx].data.mux.function = name;
> @@ -351,6 +357,7 @@ static int rzv2m_dt_subnode_to_map(struct pinctrl_dev *pctldev,
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
