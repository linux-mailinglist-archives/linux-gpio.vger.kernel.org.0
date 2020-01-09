Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38226135A3B
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jan 2020 14:35:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731117AbgAINfY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Jan 2020 08:35:24 -0500
Received: from mail-qk1-f194.google.com ([209.85.222.194]:32975 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728974AbgAINfY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Jan 2020 08:35:24 -0500
Received: by mail-qk1-f194.google.com with SMTP id d71so5980868qkc.0;
        Thu, 09 Jan 2020 05:35:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vK5UxuBrViNaXxuMZEsGhiSGSEMvZsYzv98RipTZfGg=;
        b=s1UNeLX8809o92ijYT5HikWwRFLcu3yDQDRjnyKAI3ebjg2fw+tfkA63SKrKZ4oBFL
         NIAGPKWgDpMm/V/drl8ia7BooYxzmGsh0P61Ngn5+cI33GRhHTq7p3YNe1O7rqu06t8I
         BrTAjNLP/CXJoN79JWAh9ZFmZl9UzyAMP1oqYg4Zinish8Dj+TawkkuwJqxsF9tshQKy
         qJTwa8sTmtqNz5RiNLSl/sP+yIfrjDtvlqCS+cPwZxBtnUXL1Kj73Hm01HAsUpGB6LRj
         G6tnHxD7Qn6GOVF2BezCUyTbQrH0u5QggPci7aK+P3AWfkY7S2UKNkasHuMiXyHI/6B+
         CwcA==
X-Gm-Message-State: APjAAAVS5wq1mKhWdJbXO+NZrAucozVXb5UecaIWxEAiAwEq8xnGIt1n
        dHA/FkrW/xvc5RsM7mc28c+qhG6e1MqbfRvD8KQ=
X-Google-Smtp-Source: APXvYqyRXgYk8j5kdfM4/WS8TEs831mjz2YcxqkRufdK/tyDKS85bDKPS8c3TecGMtuEwZvySvABfGqCivPuJ6qeC0Q=
X-Received: by 2002:a05:620a:134f:: with SMTP id c15mr9195003qkl.115.1578576923178;
 Thu, 09 Jan 2020 05:35:23 -0800 (PST)
MIME-Version: 1.0
References: <20191127084253.16356-1-geert+renesas@glider.be>
 <20191127084253.16356-6-geert+renesas@glider.be> <20191203105103.GA20470@x230>
In-Reply-To: <20191203105103.GA20470@x230>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 9 Jan 2020 14:35:10 +0100
Message-ID: <CAMuHMdVLaGt5GTXzUbUHrBHn5q--t3JfxO6P_j0GnnhixV+UfA@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] gpio: Add GPIO Aggregator/Repeater driver
To:     Eugeniu Rosca <roscaeugeniu@gmail.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Alexander Graf <graf@amazon.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Eugeniu,

On Tue, Dec 3, 2019 at 11:51 AM Eugeniu Rosca <roscaeugeniu@gmail.com> wrote:
> On Wed, Nov 27, 2019 at 09:42:51AM +0100, Geert Uytterhoeven wrote:
> > +static int gpio_aggregator_probe(struct platform_device *pdev)
> > +{
> > +     struct device *dev = &pdev->dev;
> > +     struct gpio_desc **descs;
> > +     struct gpiochip_fwd *fwd;
> > +     int i, n;
>
> FWIW/FTR, doing some blind creation and deletion of gpio aggregator
> chips [1] on R-Car H3ULCB overnight, kmemleak reported once [2]. Not
> sure this is something 100% reproducible.
>
> [1] while true; do \
>    echo e6055400.gpio 12,13 > /sys/bus/platform/drivers/gpio-aggregator/new_device; \
>    echo gpio-aggregator.0 > /sys/bus/platform/drivers/gpio-aggregator/delete_device; \
>    done
>
> [2] unreferenced object 0xffff0006d2c2e000 (size 128):
>   comm "kworker/3:1", pid 55, jiffies 4294676978 (age 38546.676s)
>   hex dump (first 32 bytes):
>     00 d9 d2 d3 06 00 ff ff 0c 00 e0 0f ff ff ff ff  ................
>     01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>   backtrace:
>     [<00000000a8e18c13>] slab_post_alloc_hook+0x8c/0x94
>     [<000000006f419a4f>] __kmalloc+0x170/0x218
>     [<0000000060d185ea>] kobj_map+0x78/0x1c0
>     [<00000000c96645f3>] cdev_add+0x68/0x94
>     [<00000000a7a5a8ac>] cdev_device_add+0x74/0x90
>     [<00000000497871d3>] gpiochip_setup_dev+0x84/0x1f0
>     [<00000000b993f95f>] gpiochip_add_data_with_key+0xbcc/0x11f0
>     [<00000000fd728c0e>] devm_gpiochip_add_data+0x60/0xa8
>     [<00000000442e34c1>] gpio_aggregator_probe+0x210/0x3c8
>     [<00000000076e13fb>] platform_drv_probe+0x70/0xe4
>     [<00000000de84b58b>] really_probe+0x2d8/0x434
>     [<00000000c95c9784>] driver_probe_device+0x15c/0x16c
>     [<00000000afb7dd4f>] __device_attach_driver+0xdc/0x120
>     [<00000000efa40cae>] bus_for_each_drv+0x12c/0x154
>     [<00000000c149acef>] __device_attach+0x148/0x1e0
>     [<00000000a74fd158>] device_initial_probe+0x24/0x30

This is the allocation of the GPIO character device, which is allocated
in response to the creation of the GPIO chip, from .probe().
As that is done using devm_gpiochip_add_data(), the chardev should be
deallocated automatically by devm_gpio_chip_release() when
platform_device_unregister() is called.

Weird...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
