Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A37B2399F5D
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jun 2021 12:59:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229849AbhFCLA7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Jun 2021 07:00:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229840AbhFCLA7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Jun 2021 07:00:59 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D2F3C06174A;
        Thu,  3 Jun 2021 03:59:03 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id 27so4838449pgy.3;
        Thu, 03 Jun 2021 03:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tT5BxAW9qQtK1kr/tbUlMH8uwPRuH2kPZ0anFhWVOuY=;
        b=XiIDWcdKcuz0hYa8BP/MY9GJJyOEIHq1odRr1BQ7W9g4DJqv9djHEkNt+UVC8SVjvC
         olyHkMHrXggChI1Eitl1+HezZvhULeAGRjC3Sengf8ZGIXYQFpIDgM6vCZp2r7pWOTBl
         HBGVeUghw30tnKRQuHMYZimfNVDvRWbYBop+NvhdJVg/D18jSui/B2MipFPdFLVaeI5e
         S14C9x8+zF51ZR9QoqabkazEOoNy8cZpz6DWik9UPp33AVSGMBqG1YU5MV/NVZvUXqP+
         pvpS7n2l8u8k6DSzmgdItFEIVz8KAaic9uU2eoY5aRdERtWQV0NUpt8M+JI67zlweCJh
         /7iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tT5BxAW9qQtK1kr/tbUlMH8uwPRuH2kPZ0anFhWVOuY=;
        b=ucDp3UHGFl8yttLHM/eVJKeutWMI4MU0k+X005op2cq3BZpcIaC83v87Hns9mDDUnV
         J1Hc3sekJE2lUBsuLlVuiBooz42qFIVvnzd1uno4Ayn3ZWfqdoaxqNeT/qZI0bPUmAlh
         +YEOxkj4pz8xZfsO5OfCe6RPdkd/HGM+eirK8PbkPeHyxiDgb05P0w3GEuzl/0LgPjmv
         MreJQlInMZYC81/fxPaUMRmwyIjSiyKi9dQUOdIL1F5CnmmYrIzMCcqG6Wiq4nNm8NR7
         tqBEaCkQsFUN7UK3xUe7w9qR6/dCxzGsXuxFLRDeB2uxF/6nS+WAPwU5nJ0KFl3o7Gm+
         yvTw==
X-Gm-Message-State: AOAM532/rZkKbl6lYqxJ6rtF2nxkI0v5R+mZgxwmCVCGYNEjjPzJ8F6M
        DlvKjXvRQxG/LXTo7r4f5l/BqOVOUwkQN79Fofs=
X-Google-Smtp-Source: ABdhPJy92oW8Zc9cNnz7uCmKzbv+VJKK8xEFb0Nm0qDbWI8Qiuoge+ncdt65lKqXrpVHH+Z4pWJEcWF3XzhIbxRYokw=
X-Received: by 2002:a62:bd07:0:b029:2df:2c0a:d5e9 with SMTP id
 a7-20020a62bd070000b02902df2c0ad5e9mr31299153pff.7.1622717942958; Thu, 03 Jun
 2021 03:59:02 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1620735871.git.sander@svanheule.net> <cover.1622713678.git.sander@svanheule.net>
 <56fb027587fa067a249237ecaf40828cd508cdcc.1622713678.git.sander@svanheule.net>
In-Reply-To: <56fb027587fa067a249237ecaf40828cd508cdcc.1622713678.git.sander@svanheule.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 3 Jun 2021 13:58:46 +0300
Message-ID: <CAHp75VeLUufwYagvQ2M+VKsivUzmnHHHQeH4E8-uN2avRWmBag@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] mfd: Add RTL8231 core device
To:     Sander Vanheule <sander@svanheule.net>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michael Walle <michael@walle.cc>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 3, 2021 at 1:01 PM Sander Vanheule <sander@svanheule.net> wrote:
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
>
> To provide different read and write semantics for the GPIO data
> registers, a secondary virtual register range is used to enable separate
> cacheing properties of pin input and output values.

caching

...


> +static int rtl8231_reg_read(void *context, unsigned int reg, unsigned int *val)
> +{
> +       struct mdio_device *mdio_dev = context;
> +       int ret;
> +
> +       ret = mdiobus_read(mdio_dev->bus, mdio_dev->addr, RTL8231_REAL_REG(reg));
> +
> +       if (ret < 0)
> +               return ret;
> +
> +       *val = ret & 0xffff;
> +
> +       return 0;
> +}
> +
> +static int rtl8231_reg_write(void *context, unsigned int reg, unsigned int val)
> +{
> +       struct mdio_device *mdio_dev = context;
> +
> +       return mdiobus_write(mdio_dev->bus, mdio_dev->addr, RTL8231_REAL_REG(reg), val);
> +}

Hmm... Maybe we can amend regmap-mdio to avoid duplication of the
above? Something like xlate in gpio-regmap or so?

...

> +       mdiodev->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);

Missed

  if (IS_ERR(mdiodev->reset_gpio))
    return PTR_ERR(mdiodev->reset_gpio);

-- 
With Best Regards,
Andy Shevchenko
