Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 881C8263998
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Sep 2020 03:58:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730214AbgIJB6Z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Sep 2020 21:58:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729663AbgIJBwS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Sep 2020 21:52:18 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1DD3C061342;
        Wed,  9 Sep 2020 18:52:17 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id i22so6337017eja.5;
        Wed, 09 Sep 2020 18:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ANFj5tNe+lX75IxFcz7eloVwZ6bcS0GGRGo9xs5qe80=;
        b=eY/LjwZiqAFgu2Bw+bKjgsL4dHaWSO+afec/4IFa+vrNiuMztpznLUltZ/Wl9vUCja
         1acXY3/TubX6dHKDPPvCbx8YITTKM9cJ8pwLe8grJkSE70P7HJiHb2lFt5NBgjipFLen
         sOF+sNTAqF3DuLyHiT1ZKbMlgEOwcHgvWqh68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ANFj5tNe+lX75IxFcz7eloVwZ6bcS0GGRGo9xs5qe80=;
        b=pm/nao6krndQEEipAtlZE6EYAiJcqC8aylI1s0n5H/L2V2Khu6HlEm7U6vPB6WF/nr
         LxXI2LbKN2ZPxS06GfzO58rEu+k6Sm9BGVgjjrB6EhyIt3InRcRFsBqwX/Hu5NfrSrHY
         5zWtLwmOIJvp7pzsXb3fXagDnexUlsgrItPeqi57S9wcFN3N6LzwZoLbYPAWKXp5l6ri
         CTn2EYTd5ZkfWeUuVHfMLR7eAc76vGbPnhD2mlMGwIPrlbpCg4ekp8rH/MF5TvFPfhuA
         rtbCohw7O/d+s7Dv0N1YG/Yrn19Cz5BZ7cnxX0VKKs55D4X+yikNd1AH8B8cuRW6THd6
         KU0A==
X-Gm-Message-State: AOAM530RU4Vscmyfnjrmm0mVY0aSqx6DJ0g4xG5KMJs6fH+7YzTI4VsG
        UK6puiA2QZOdns6yYQzG7olHJpTX84D33c+AhOamnZGg
X-Google-Smtp-Source: ABdhPJymYXgKXZhXuS4fxzTpM1mvEDSS4tHQKzZ/RE+4BnTasu7Ht25VWClSxo4tpoAl7IAuWPBMYKW8xN97aQwJFMk=
X-Received: by 2002:a17:906:7cc6:: with SMTP id h6mr6478279ejp.266.1599702736442;
 Wed, 09 Sep 2020 18:52:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200909114312.2863675-1-andrew@aj.id.au> <20200909114312.2863675-2-andrew@aj.id.au>
In-Reply-To: <20200909114312.2863675-2-andrew@aj.id.au>
From:   Joel Stanley <joel@jms.id.au>
Date:   Thu, 10 Sep 2020 01:52:04 +0000
Message-ID: <CACPK8XeOf1H2Cdo434DsAjDNGrohip_MZTSMMOh1nhspz2y7dA@mail.gmail.com>
Subject: Re: [PATCH 1/3] pinctrl: aspeed: Format pinconf debug consistent with pinmux
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        johnny_huang@aspeedtech.com,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 9 Sep 2020 at 11:43, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> When displaying which pinconf register and field is being touched, format the
> field mask so that it's consistent with the way the pinmux portion
> formats the mask.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  drivers/pinctrl/aspeed/pinctrl-aspeed.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> index 53f3f8aec695..d8972911d505 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> @@ -539,9 +539,9 @@ int aspeed_pin_config_set(struct pinctrl_dev *pctldev, unsigned int offset,
>                 if (rc < 0)
>                         return rc;
>
> -               pr_debug("%s: Set SCU%02X[%lu]=%d for param %d(=%d) on pin %d\n",
> -                               __func__, pconf->reg, __ffs(pconf->mask),
> -                               pmap->val, param, arg, offset);
> +               pr_debug("%s: Set SCU%02X[0x%08X]=%d for param %d(=%d) on pin %d\n",


The pr_debug in pinmux-aspeed.c prints val as 0x%X. Did you want to do
that here?

> +                               __func__, pconf->reg, pconf->mask,
> +                               val, param, arg, offset);
>         }
>
>         return 0;
> --
> 2.25.1
>
