Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09BED42104A
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Oct 2021 15:41:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238697AbhJDNmL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Oct 2021 09:42:11 -0400
Received: from mail-vs1-f42.google.com ([209.85.217.42]:40459 "EHLO
        mail-vs1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238456AbhJDNka (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Oct 2021 09:40:30 -0400
Received: by mail-vs1-f42.google.com with SMTP id l19so19546224vst.7;
        Mon, 04 Oct 2021 06:38:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dv9RspM3ctxvAuhOcHTg3KizZsDDkdv4PFnf5HpmAKA=;
        b=QCyv1O3TbhXncu/7Q4GUriwbetQXcJ4OzFXDnArEhkepP+clgaGb62ZbALLiuY9KrW
         Vv0MvmKzCX8BWviEHwmjmiOAqLPniuRFTiXwtIs0Mzmp7lDm42g2c7/ty4/VIN1ypTFH
         sVZI51bQkcyzGAUkEosxFu8+cSNdulHDmRVwxahCAIU/9pTcfO3QYg9Qa41uF6PU9zc9
         1gpRjuL32JnwN4oMV55HLWu2ZE1hTyWFvPmxsIi/ctCh1PPxI/LKJNg0zv8hmCM3hbF3
         O3ghBwUPdmsOP0pVFS0poBesslXLkMzN5stpxWFc/gHYkPiP6zPJ6f4wUigdkK5LAqxa
         763A==
X-Gm-Message-State: AOAM5302zuLNNVEl6caE1qwGtJq7INqODaoCdzhiYgQwQ2gc8qva9BEI
        YRfK5QlCHs0J6/GGRs6mzQjEbDMRgBemTBl5AG0=
X-Google-Smtp-Source: ABdhPJz7J6VHaPk7SXHPfqZxAtC9psBA5qyOqO5LHvP7tsN5wL5nIwsLtOMTdJNfhvSiDSGZ/ysK/hrI6t5rgGqC2QQ=
X-Received: by 2002:a67:cb0a:: with SMTP id b10mr12782999vsl.9.1633354721081;
 Mon, 04 Oct 2021 06:38:41 -0700 (PDT)
MIME-Version: 1.0
References: <a9af5139b6b8eb687495ffae69d32acd305ac2f3.1633351482.git.geert+renesas@glider.be>
 <CAHp75Vf-sRz2WMTa2SUfPr0LRnWYb=29WjcjB9rmV9Ty9WJ8zA@mail.gmail.com>
In-Reply-To: <CAHp75Vf-sRz2WMTa2SUfPr0LRnWYb=29WjcjB9rmV9Ty9WJ8zA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 4 Oct 2021 15:38:29 +0200
Message-ID: <CAMuHMdXCJjUXA=-5YxPVhhQdBL5eNR2HJCOtB1gB2ipadFUXKQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: aggregator: Wrap access to gpiochip_fwd.tmp[]
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy,

On Mon, Oct 4, 2021 at 3:23 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Mon, Oct 4, 2021 at 3:47 PM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> > The tmp[] member of the gpiochip_fwd structure is used to store both the
> > temporary values bitmap and the desc pointers for operations on multiple
> > GPIOs.  As both are arrays with sizes unknown at compile-time, accessing
> > them requires offset calculations, which are currently duplicated in
> > gpio_fwd_get_multiple() and gpio_fwd_set_multiple().
> >
> > Introduce (a) accessors for both arrays and (b) a macro to calculate the
> > needed storage size.  This confines the layout of the tmp[] member into
> > a single spot, to ease maintenance.
>
> ...
>
> > +#define fwd_tmp_descs(fwd)     (void *)&(fwd)->tmp[BITS_TO_LONGS((fwd)->chip.ngpio)]
> > +
> > +#define fwd_tmp_size(ngpios)   (BITS_TO_LONGS((ngpios)) + (ngpios))
>
> ...
>
> > -       fwd = devm_kzalloc(dev, struct_size(fwd, tmp,
> > -                          BITS_TO_LONGS(ngpios) + ngpios), GFP_KERNEL);
> > +       fwd = devm_kzalloc(dev, struct_size(fwd, tmp, fwd_tmp_size(ngpios)),
> > +                          GFP_KERNEL);
>
> Shouldn't we rather use devm_bitmap_zalloc() / bitmap_free()?

That's not sufficient: the bitmap is only one part. There are one
fixed-size and two variable-size objects to allocate.
Yes, they can be allocated separately, at the expense of more
allocations, and more data (pointers) to allocate to keep track of
all those objects.

>
> >         if (!fwd)
> >                 return ERR_PTR(-ENOMEM);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
