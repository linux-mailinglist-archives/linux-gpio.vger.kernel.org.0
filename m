Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A97E332CF35
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 10:03:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232323AbhCDJCx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 04:02:53 -0500
Received: from mail-vs1-f50.google.com ([209.85.217.50]:36096 "EHLO
        mail-vs1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237089AbhCDJCi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 04:02:38 -0500
Received: by mail-vs1-f50.google.com with SMTP id a12so7526320vsd.3;
        Thu, 04 Mar 2021 01:02:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GF6ztfiSNzs2kNgCpQbALc2l2RC8cPrPW1MDspQG+Pw=;
        b=n8M/7L5Yz3Xp93LwBHAPFGxasLsyivkUi1IkL5F6pu9Z5hP3JcmE1qL2BaenIw3dRN
         o+ZP7g4F/v0m5H1U+7BQU59LSJcKyuzDbGIVUduccECXxNqgQ8cNDECi7wguE7JCCeuy
         nbCD/0Ed8kb2PjDXqTq3yQADFeDpcNuEnCFl2cP1VbsbpebitsgKk6oEXtZavrIqJil9
         yw1+EJdgQvzXiIoIiqtxu9BN/TwZSq3QDJa01WL5+XJmt3fW5DvlDCfVEEmnRR6QlAQ6
         XL3UuhbdvrvbB1zi+u7ZMICRjuPBXpp5ZZZ6czUvurA9Hk66KsLbHx4azV5Su4gmN2pL
         vwtg==
X-Gm-Message-State: AOAM530AmmWPtfFm2LEbNXmYjkPIW44Vvk4iz10gjStrKfCylRO0s263
        5ZjWEQaNfWtUiW4piyiu3M0a0ezZwXngUulpnoDKkgjH
X-Google-Smtp-Source: ABdhPJxOuPPgctc/TTBejCpNuyNf4Q7cAEPGx8BFtjXiA7h//HwfoKdzl9GCxCdd4fUioJCUUQn9X9QFDNIJ48GdgKg=
X-Received: by 2002:a67:fb86:: with SMTP id n6mr1856293vsr.3.1614848518144;
 Thu, 04 Mar 2021 01:01:58 -0800 (PST)
MIME-Version: 1.0
References: <20210301165932.62352-1-andriy.shevchenko@linux.intel.com> <20210301165932.62352-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210301165932.62352-2-andriy.shevchenko@linux.intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 4 Mar 2021 10:01:46 +0100
Message-ID: <CAMuHMdXdjN+8DzNOMbs4Xde39sVYjU-7zqPiYLw1iy=cm_-Aeg@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] gpio: aggregator: Replace custom get_arg() with a
 generic next_arg()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy,

On Mon, Mar 1, 2021 at 5:59 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> cmdline library provides next_arg() helper to traverse over parameters
> and their values given in command line. Replace custom approach in the driver
> by it.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks for your patch!

> --- a/drivers/gpio/gpio-aggregator.c
> +++ b/drivers/gpio/gpio-aggregator.c
> @@ -93,13 +68,9 @@ static int aggr_parse(struct gpio_aggregator *aggr)
>         if (!bitmap)
>                 return -ENOMEM;
>
> -       for (name = get_arg(&args), offsets = get_arg(&args); name;
> -            offsets = get_arg(&args)) {
> -               if (IS_ERR(name)) {
> -                       pr_err("Cannot get GPIO specifier: %pe\n", name);
> -                       error = PTR_ERR(name);
> -                       goto free_bitmap;
> -               }
> +       args = next_arg(args, &name, &p);
> +       while (*args) {
> +               args = next_arg(args, &offsets, &p);

As name and offsets should not contain equal signs (can they?),
I guess using next_arg() is fine.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
