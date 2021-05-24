Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C07F38E21A
	for <lists+linux-gpio@lfdr.de>; Mon, 24 May 2021 10:02:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232311AbhEXIEF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 May 2021 04:04:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232099AbhEXIEE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 May 2021 04:04:04 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F545C061574;
        Mon, 24 May 2021 01:02:36 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id 22so19806822pfv.11;
        Mon, 24 May 2021 01:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3tG71KFeGvB6Bz61w8pRbOH7Ofvu8zef1oUzyLHGfF0=;
        b=EjKcQ96zD1JI5HCMcQ8CIcLyTRF90OuzoQzejQpkXMvZIhYcJ/v22bfBemkMSselbF
         PbvSnv1wnz6GDztK+u/Z6x5VdVxT+w7sifjH7oUBJ1k5wf/1u8lWhxmXLX4d1lyPLs7V
         EW6aUPkeqsZNWIUJYuYZRD1DAJRbu+Vujr834rrjEzKfd/1gyjk9speagdG0P+6bWvm1
         qOr+W2PPFe+6FkiwnU3b3Zr/rTzPP+w+qfwemzteqeV3GxifvciWry6OzjQD7yxfOC0O
         ZEdRZKNGsfxU+MbW7FkKJKY6Vd632ZK7KXccQO7G+icCNvQ9aymabcaYazM44M3ZP7jL
         R7Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3tG71KFeGvB6Bz61w8pRbOH7Ofvu8zef1oUzyLHGfF0=;
        b=e81MYE19N2zEwdaLztnraC2uPVht1NSCCeOmmX+WWVaQVmzzlmcmIATvKuNI63ygWd
         Y4ASH2uDG5nwfhiCtPpZAGhXg9HIfxOleIyUmPtPM69BmXuNwNjU5P0GgzD9LaagpobP
         H/c0WzFLfSpgtASvYqi6f/dPjn3h8LsDYyMhAujgLg2tUYZhfogmlEj6AKI5NUCaWjlu
         2DRbVlGhFxHnwHrQcSUWwWx4CikfbPQy37xThlhuXXOOYidsw8aO6du5p6uN8SNFoz72
         7fovTQ3NX9fBEseUV8WTRcw16edJY+Zq84IuEcti/1CGZsnvEJ7FLcAadnOPxP6DT6UA
         GtRQ==
X-Gm-Message-State: AOAM533vv1U5EIbZH43GEyGDDb9rm7MkgjeSqN0t5l0aaKd6oR7w4RVj
        KGsFjpfC28uAPdkbmCGYhfHYhuFlx6xVC5556+Z1VUWmsAA=
X-Google-Smtp-Source: ABdhPJylHCLD9rP65qJ0C77l3k8KRNc0rFvkvvth1kYxsH6Q4515gZYtN0QN4f8ValEOjiGy/wQPbpixdoRVLpqE4vI=
X-Received: by 2002:a63:4145:: with SMTP id o66mr12431070pga.4.1621843355752;
 Mon, 24 May 2021 01:02:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1621809029.git.sander@svanheule.net> <6d14b72bc545a818675d99c8e91e99c96cc3e286.1621809029.git.sander@svanheule.net>
In-Reply-To: <6d14b72bc545a818675d99c8e91e99c96cc3e286.1621809029.git.sander@svanheule.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 24 May 2021 11:02:19 +0300
Message-ID: <CAHp75VcbRKGYSJZK_Rg969-Uck=h+8byWt0B3MtQJDqwbdf2sw@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] mfd: Add RTL8231 core device
To:     Sander Vanheule <sander@svanheule.net>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 24, 2021 at 1:34 AM Sander Vanheule <sander@svanheule.net> wrote:
>
> The RTL8231 is implemented as an MDIO device, and provides a regmap
> interface for register access by the core and child devices.
>
> The chip can also be a device on an SMI bus, an I2C-like bus by Realtek.
> Since kernel support for SMI is limited, and no real-world SMI
> implementations have been encountered for this device, this is currently
> unimplemented. The use of the regmap interface should make any future
> support relatively straightforward.
>
> After reset, all pins are muxed to GPIO inputs before the pin drivers
> are enabled. This is done to prevent accidental system resets, when a
> pin is connected to the parent SoC's reset line.

...

> [missing MDIO_BUS dependency, provided via REGMAP_MDIO]
> Reported-by: kernel test robot <lkp@intel.com>

What does this fix? Shouldn't it have a Fixes tag? (Yes, I know that
you answered in the other email, but here is a hint: before settling
these kinds of things do not send a new version. Instead of speeding
up the review you are closer to the chance to have this been not
applied for v5.14 at all)

...

> +       /* SOFT_RESET bit self-clears when done */
> +       regmap_update_bits(map, RTL8231_REG_PIN_HI_CFG,
> +               RTL8231_PIN_HI_CFG_SOFT_RESET, RTL8231_PIN_HI_CFG_SOFT_RESET);

> +       usleep_range(1000, 10000);

It's strange to see this big range of minimum and maximum sleep.
Usually the ratio should not be bigger than ~3-4 between the values.

...

> +       regmap_write(map, RTL8231_REG_PIN_MODE0, 0xffff);
> +       regmap_write(map, RTL8231_REG_GPIO_DIR0, 0xffff);
> +       regmap_write(map, RTL8231_REG_PIN_MODE1, 0xffff);
> +       regmap_write(map, RTL8231_REG_GPIO_DIR1, 0xffff);

GENMASK() ?
Actually it seems it deserves a special definition like

..._ALL_PIN_MASK  GENMASK(15, 0)

-- 
With Best Regards,
Andy Shevchenko
