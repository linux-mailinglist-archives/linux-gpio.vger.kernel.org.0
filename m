Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6EFE218DA9
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 18:58:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729795AbgGHQ6V (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 12:58:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725989AbgGHQ6U (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 12:58:20 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99CFBC08C5C1;
        Wed,  8 Jul 2020 09:58:20 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id t15so1442112pjq.5;
        Wed, 08 Jul 2020 09:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jEA8+y65zqWSlOUkDJdGcvJw3JxBgOHy/g+Qh3xarWc=;
        b=rcz9+K+yBUj3Qj1ovUUBH93GqxNvKkAVUwi5vt8kltz46zaCZuY1LRwp5NBTBa9yN5
         7YVM5XSsbBLJ02SpGGRskxplDqzKgKgS2c09CoRuZYPoksQTlZCimUJ6Buw9Uv6Bd5ns
         8o819XiDLxSsv2ZzKchNaJtV6eqn4dkUWLqcqefnyhBet9PeiupJoW5zMlMxc2ZdNU7v
         3rbRGEQPpthLvlwnPkWdT6+ddc9a2SvuagX+RhXQ+DDdyp9u81ORkAvhI1m6lWULbAV+
         wWZA4Ye68xUPbwVztBXecCtyONerbd+7BEhPP3Ovi6F37Cz02dRURN9fCTJNUD9P1CfW
         A+1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jEA8+y65zqWSlOUkDJdGcvJw3JxBgOHy/g+Qh3xarWc=;
        b=L673FHLWzMnh2cIOqyu9mImsM7CtSFg+axQ7LciUY6i/g2s9aR3ERWp2ZH21E+YHCg
         DptaQyoOQp4c5jyhx5wad8lLnUcBGjmi3vhJA55frMS9c3xZ6Vg8GWA4koVh9imGhAON
         U58+iVmr7LiCKHEq+LCPMR39i4J4a7r+InZXcacL9wgx267vmVLk5tPKa4XMHq4zAqwM
         0NrS9e78ZxFZ8/lNQzYoS2DMoo6AXc7uKdcclLLySS0v+RzaMj+Vf6oBGvvji5DtOGnd
         LM37eT16OHHJQ1x6XGMfR2wEvVyzVzZV000TkqBbfxzFsYJxjIyBw+y3g2hb0tzitcYu
         LaSw==
X-Gm-Message-State: AOAM530YVJFLtRVYzGkZvpPyssrcLPCXLKMa03ae9Af5cvESfvjISImB
        Skk9bZr9kQVRXof1GepdCexuTHtPEv5UrVlEXdo=
X-Google-Smtp-Source: ABdhPJzTajkWp8OGpeSbbitfdGNtESG5/A+hpNVyEgrVPLmB+JgUi4AzMO00b18GAi3ogNXsTbOi2XvSK30szw6gofU=
X-Received: by 2002:a17:902:7288:: with SMTP id d8mr51838913pll.18.1594227500095;
 Wed, 08 Jul 2020 09:58:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200708155834.19762-1-digetx@gmail.com> <20200708155834.19762-2-digetx@gmail.com>
In-Reply-To: <20200708155834.19762-2-digetx@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 8 Jul 2020 19:58:03 +0300
Message-ID: <CAHp75VcFG3oK7C8Y7RZKoEvwPo9+hKMMucnDhtpqLDmLGoPmJw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] gpio: max77620: Initialize interrupts state
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-tegra@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 8, 2020 at 6:58 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> I noticed on Nexus 7 that after rebooting from downstream kernel to
> upstream, the GPIO interrupt is triggering non-stop despite of interrupts

despite interrupts

> being disabled for all of GPIOs. This happens because Nexus 7 uses a
> soft-reboot, meaning that bootloader should take care of resetting
> hardware, but bootloader doesn't do it well. In a result, GPIO interrupt

but the bootloader

As a result

> may be left ON at a boot time. Let's mask all GPIO interrupts at the
> driver's initialization time in order to resolve the issue.

...

>         mgpio->gpio_chip.ngpio = MAX77620_GPIO_NR;
>         mgpio->gpio_chip.can_sleep = 1;
>         mgpio->gpio_chip.base = -1;
> +       mgpio->gpio_chip.irq.init_hw = max77620_gpio_irq_init_hw,

Now this seems a bit awkward. Perhaps you need first to switch to use
GPIO IRQ chip structure?
It's also in the TODO of the GPIO subsystem ;-)

...

>  #ifdef CONFIG_OF_GPIO
>         mgpio->gpio_chip.of_node = pdev->dev.parent->of_node;
>  #endif

This seems to be done by GPIO library.

Also point to improve: don't shadow error from platform_get_irq().

-- 
With Best Regards,
Andy Shevchenko
