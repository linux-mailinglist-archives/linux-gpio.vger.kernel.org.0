Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79AA1347505
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Mar 2021 10:50:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232716AbhCXJto (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Mar 2021 05:49:44 -0400
Received: from mail-vs1-f46.google.com ([209.85.217.46]:33367 "EHLO
        mail-vs1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232684AbhCXJtT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Mar 2021 05:49:19 -0400
Received: by mail-vs1-f46.google.com with SMTP id a15so10979895vsi.0;
        Wed, 24 Mar 2021 02:49:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vraXgvc1aXLo0BXYwPsNqedZ4dbSzT52cUPxrslm1MU=;
        b=MDHttrfZW5ubuCKbIj5qq3gDSxSr2tKWk7eVsRecYEptnJQlUGitC0gRXUa9IiWem3
         7wAMbTLCj5HxrtgYOSQYiBxQvNSxgBLxQkIAxXZEBt1gEzieHF7fycIEMkPxQHtLo2MA
         gdGy+xGcOIVGsUOwukC8auOfQJlcxZ82aWKmxAra8BOhgartDFTTzq0NPOEk7pIHezXS
         7yNo4kVKFsWaKl7Qm9dWhhJ7zBDsnDs8Y0Iy7zdapEnCG9YW6/DUXfQW6e1FD7FN5Gvj
         BaIgl76OEHlNHaZTQv07i46CzWgCJHlFkSkHuv1fL2x/s8ccFcvbJs0ewS6kc/7DuCDu
         HDkg==
X-Gm-Message-State: AOAM533UnJYcbH5PV2FWMqWIYXXnCz+LJ7WpcY7Csj0cCQmlbxj17u0V
        qDpFwL/iWiDmpxp7Lf1UlXeURNv1eoj3iUu/+CHvNmdRKG4=
X-Google-Smtp-Source: ABdhPJwjlmczs6o4TiCoPKu2Bk3EL5Mvf4tmAt8E584vEb6atFpB0EKQD95jk3tD6JTYPbbdLHqmXpYcQtXkAUr5ZI4=
X-Received: by 2002:a67:8883:: with SMTP id k125mr1067040vsd.18.1616579359195;
 Wed, 24 Mar 2021 02:49:19 -0700 (PDT)
MIME-Version: 1.0
References: <20181011204042.GA17125@embeddedor.com>
In-Reply-To: <20181011204042.GA17125@embeddedor.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 24 Mar 2021 10:49:08 +0100
Message-ID: <CAMuHMdWU-Xo5rpBmjHqjUQAUmQS7_XKYWkeaYbcoAFjeci_22Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: rzn1: remove unnecessary unsigned integer comparison
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Gustavo,

On Thu, Oct 11, 2018 at 10:42 PM Gustavo A. R. Silva
<gustavo@embeddedor.com> wrote:
> There is no need to compare ipctl->mdio_func[mdio] with => 0, because
> such comparison is always true. Notice that *mdio_func* is of type
> u32 (32 bits, unsigned).
>
> Fix this by removing such comparison.
>
> Addresses-Coverity-ID: 1474166 ("Unsigned compared against 0")
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>

Thanks for your patch, which I somehow missed to review.
Sorry for that.

> --- a/drivers/pinctrl/pinctrl-rzn1.c
> +++ b/drivers/pinctrl/pinctrl-rzn1.c
> @@ -195,7 +195,7 @@ static void rzn1_hw_set_lock(struct rzn1_pinctrl *ipctl, u8 lock, u8 value)
>  static void rzn1_pinctrl_mdio_select(struct rzn1_pinctrl *ipctl, int mdio,
>                                      u32 func)
>  {
> -       if (ipctl->mdio_func[mdio] >= 0 && ipctl->mdio_func[mdio] != func)
> +       if (ipctl->mdio_func[mdio] != func)

Note that mdio_func is initialized to -1, hence the check.
But the check indeed didn't work this way, so mdio_func was changed
later to int in commit 8deaaa46d2de91e3 ("pinctrl: rzn1: Fix check for
used MDIO bus").

>                 dev_warn(ipctl->dev, "conflicting setting for mdio%d!\n", mdio);
>         ipctl->mdio_func[mdio] = func;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
