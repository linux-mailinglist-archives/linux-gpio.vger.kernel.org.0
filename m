Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 666BD54F9FC
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jun 2022 17:18:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383070AbiFQPRM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jun 2022 11:17:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233854AbiFQPRL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jun 2022 11:17:11 -0400
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C17E236697;
        Fri, 17 Jun 2022 08:17:10 -0700 (PDT)
Received: by mail-qv1-f53.google.com with SMTP id y14so1559884qvs.10;
        Fri, 17 Jun 2022 08:17:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=biUHyCcDZf8i0q40kZjh4Hv6uNd3Bse94gwKQsP5oKE=;
        b=YCn5LWJ8p8pBOvq1p0v0vSNHnKpxeoaD2p7kU/u/G8yVOvOH0bZQo/GYt/8wquJ6N6
         eKOyDwW031acEQeQKzY6Wb6ycTgzPB+nzIB0wXCYL0CIODNY2PP2kAS2meA75EC8OUko
         JkrwI+DwUB0UsowOewjcBquqYIrExr7P+weXyQBSBMAYlksb9nv7T7JK7A60+WLrq4Bq
         WDGXGY3fSHz2bmxkgjDKI3P+bEBA4lBTa1L3HncP0xWrR03s2itUYNvsc6R9bc7/t/xE
         rThOlvd0XNXd4C476QYyfLust868gnI72BjQvkG+C1QjzA1Wd2hDuXRI/AKxoj1JCguZ
         rW3A==
X-Gm-Message-State: AJIora9isQUZKBfJIJQibnvuFKOcUjjx7uJxTwryrj9ZxUcjYvJg4OGe
        fKtJ3VAJ9kt+5+eL6c6zkj8BYbuCCveqSA==
X-Google-Smtp-Source: AGRyM1soSKdZS/9tOO8n2UM86H0SJoiWKJmluo15YRNVLbkS7IqqjQ9mDbGZU+NLmUe3Wt+HOw3f4g==
X-Received: by 2002:a05:6214:5282:b0:443:e161:ef4a with SMTP id kj2-20020a056214528200b00443e161ef4amr8664578qvb.23.1655479029616;
        Fri, 17 Jun 2022 08:17:09 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id m19-20020a05620a24d300b006a67eb4610fsm4882150qkn.116.2022.06.17.08.17.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 08:17:09 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id u99so7754108ybi.11;
        Fri, 17 Jun 2022 08:17:09 -0700 (PDT)
X-Received: by 2002:a05:6902:905:b0:64a:2089:f487 with SMTP id
 bu5-20020a056902090500b0064a2089f487mr11433032ybb.202.1655479028790; Fri, 17
 Jun 2022 08:17:08 -0700 (PDT)
MIME-Version: 1.0
References: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com> <87wndjkcpm.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87wndjkcpm.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 17 Jun 2022 17:16:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVO+Xwk6ozdWd-_y9kYMYQ7A1izZBz_KWDgr1+ge6zaag@mail.gmail.com>
Message-ID: <CAMuHMdVO+Xwk6ozdWd-_y9kYMYQ7A1izZBz_KWDgr1+ge6zaag@mail.gmail.com>
Subject: Re: [PATCH v3 05/21] pinctrl: renesas: r8a779g0: remove not used NOGP definitions
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
> Current V4H PFC code has many NOGP definitions. But these are not used,
> and it is different from original usage. This patch removes these.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
> +++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
> @@ -43,22 +43,6 @@
>         PORT_GP_CFG_21(7,       fn, sfx, CFG_FLAGS),                                    \
>         PORT_GP_CFG_14(8,       fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE_18_33)
>
> -#define CPU_ALL_NOGP(fn)                                                                       \
> -       PIN_NOGP_CFG(PRESETOUT_N,       "PRESETOUT#",   fn, SH_PFC_PIN_CFG_PULL_UP_DOWN),       \
> -       PIN_NOGP_CFG(PRESETOUT0_N,      "PRESETOUT0#",  fn, SH_PFC_PIN_CFG_PULL_DOWN),          \
> -       PIN_NOGP_CFG(PRESETOUT1_N,      "PRESETOUT1#",  fn, SH_PFC_PIN_CFG_PULL_DOWN),          \
> -       PIN_NOGP_CFG(EXTALR,            "EXTALR",       fn, SH_PFC_PIN_CFG_PULL_UP_DOWN),       \
> -       PIN_NOGP_CFG(DCUTRST0_N,        "DCUTRST0#",    fn, SH_PFC_PIN_CFG_PULL_DOWN),          \
> -       PIN_NOGP_CFG(DCUTCK0,           "DCUTCK0",      fn, SH_PFC_PIN_CFG_PULL_UP),            \
> -       PIN_NOGP_CFG(DCUTMS0,           "DCUTMS0",      fn, SH_PFC_PIN_CFG_PULL_UP),            \
> -       PIN_NOGP_CFG(DCUTDI0,           "DCUTDI0",      fn, SH_PFC_PIN_CFG_PULL_UP),            \
> -       PIN_NOGP_CFG(DCUTRST1_N,        "DCUTRST1#",    fn, SH_PFC_PIN_CFG_PULL_DOWN),          \
> -       PIN_NOGP_CFG(DCUTCK1,           "DCUTCK1",      fn, SH_PFC_PIN_CFG_PULL_UP),            \
> -       PIN_NOGP_CFG(DCUTMS1,           "DCUTMS1",      fn, SH_PFC_PIN_CFG_PULL_UP),            \
> -       PIN_NOGP_CFG(DCUTDI1,           "DCUTDI1",      fn, SH_PFC_PIN_CFG_PULL_UP),            \
> -       PIN_NOGP_CFG(EVTI_N,            "EVTI#",        fn, SH_PFC_PIN_CFG_PULL_UP),            \
> -       PIN_NOGP_CFG(MSYN_N,            "MSYN#",        fn, SH_PFC_PIN_CFG_PULL_UP)

As several of the NOGP definitions are wrong, I prefer to never
include them.

> -
>  /* GPSR0 */
>  #define GPSR0_18       F_(MSIOF2_RXD,          IP2SR0_11_8)
>  #define GPSR0_17       F_(MSIOF2_SCK,          IP2SR0_7_4)
> @@ -1204,7 +1188,6 @@ static const u16 pinmux_data[] = {
>   */
>  enum {
>         GP_ASSIGN_LAST(),
> -       NOGP_ALL(),
>  };
>
>  static const struct sh_pfc_pin pinmux_pins[] = {

As the definitions are not used anyway, and don't have any impact on
other enums (they're last in the list), I think it is safe to fold
this into "[PATCH v3 03/21] pinctrl: renesas: Initial R8A779G0 (V4H)
PFC support".

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
