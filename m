Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C70A3E2492
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Aug 2021 09:52:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbhHFHwz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Aug 2021 03:52:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235894AbhHFHwy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Aug 2021 03:52:54 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 249FDC06179B;
        Fri,  6 Aug 2021 00:52:37 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id u21-20020a17090a8915b02901782c36f543so12511421pjn.4;
        Fri, 06 Aug 2021 00:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Rc7uret13niyCIVXJ1YRvTucG/7HWeoFTut9F0hkboo=;
        b=mmU4ad6/KzkutzMXgYardMWrocI0yTvJbjuCbJYWoyvt9fVf5AIzj+vklyc3fgMSRX
         jVscRJ0ikaCbXLMDluT1qCkCfUvDFt+OTU4RhRyy7V3w/IIC7m7BFk262fopKBWQahR9
         5p+57WuTfBmFIlbmNIjkD8AdwI9d3dMJWyOCFTMIXemgpgj+3mnP7sw7JTpRcFHLWiMv
         C0C52YVjRhAs4bsD9swsh8i0GKnPu+MchCc3+mWV+EvlOx6jMGbPHeGPyi0mNN938H73
         tKu097HTwY+Do8PJtN3vD/goxOFQ4qgDc5NPL5ftbcUCXaFtqAebZxR4SSxzPxekZs0m
         HtpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Rc7uret13niyCIVXJ1YRvTucG/7HWeoFTut9F0hkboo=;
        b=OgIMTxeYP5Je4PatXccpW1Xw/AJQpJQlRrDopqNPaLkPNNfXkQUKAPBrd6/qsPYccG
         G/z47kB8sz/OUyKPaRF/6HIXfsKyp2/rzSW/RBwnYNcq4RhjmgcA/b0O4TTDUthA4Wsa
         TqSoUXpbaX/EzhVW2k7bmk6TcO5f0qAOs4L8wLn0fYQVm5kmWmSx1WawUvU5VJfcPwlQ
         sJBB82dorkXp+FlDkKcLHCaDj58B8f98VM7yUkGED/E/WC31hcywXdWVFqQx9oUH1gXO
         3o8fc6tWHfYjAF0y92mHcACOk9y1Plm9K2zJ+SU89xgJCSdVaAMn+1rP9Sh9OpNO9nh1
         8Ziw==
X-Gm-Message-State: AOAM533Z1emSsJ1dwJUEwoUsstjxou2jTPI6hDoZh14JHGmkW6vi9T34
        nNWsRSQWL4KBhnXLxPmQm4Md2X9ewtXqKj+sNoQ=
X-Google-Smtp-Source: ABdhPJwpLUZJwo7/G1igvLBOgf3ykCUZdsk8nzSi+wFW7rZb/ctc95xTQKA29AoAq0bscciPq4NmehqZ8QoOb7XP9jQ=
X-Received: by 2002:a65:5ccd:: with SMTP id b13mr860372pgt.203.1628236357392;
 Fri, 06 Aug 2021 00:52:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210806005755.2295193-1-chrisrblake93@gmail.com>
In-Reply-To: <20210806005755.2295193-1-chrisrblake93@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 6 Aug 2021 10:52:01 +0300
Message-ID: <CAHp75VenSw9BanwH58VSCNpw4cNFf7h3uSWTXLb5n0+OPtnDTQ@mail.gmail.com>
Subject: Re: [PATCH v2] platform/x86: add meraki-mx100 platform driver
To:     Chris Blake <chrisrblake93@gmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Christian Lamparter <chunkeey@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 6, 2021 at 5:47 AM Chris Blake <chrisrblake93@gmail.com> wrote:
>
> This adds platform support for the Cisco Meraki MX100 (Tinkerbell)
> network appliance. This sets up the network LEDs and Reset
> button. Note that this patch requires

> mfd: lpc_ich: Enable GPIO driver for DH89xxCC

Use standard format for the commits, and you may find its SHA in the
repository of respective maintainer I suppose.

> which has been accepted
> and is currently targeted for 5.15.
>
> Signed-off-by: Chris Blake <chrisrblake93@gmail.com>

> Co-developed-by: Christian Lamparter <chunkeey@gmail.com>

Missed SoB of co-developer.

...

> +#include <linux/gpio.h>

This is wrong. Mustn't be included in the new code.

> +#include <linux/gpio_keys.h>

> +#include <linux/gpio/machine.h>

Does this provide a GPIO controller driver? I don't think so.

> +#include <linux/input.h>
> +#include <linux/kernel.h>
> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>

...

> +static struct platform_device * __init tink_create_dev(
> +       const char *name,
> +       const void *pdata,
> +       size_t sz)

Use less LOCs for this...

...

> +       pdev = platform_device_register_data(NULL,
> +               name,
> +               PLATFORM_DEVID_NONE,
> +               pdata,
> +               sz);

...and for this (put name and sz to the respective previous lines).

> +

Unneeded blank line.

> +       if (IS_ERR(pdev))
> +               pr_err("failed registering %s: %ld\n", name, PTR_ERR(pdev));
> +

...

> +       /* We need to make sure that GPIO60 isn't set to native mode as is default since it's our
> +        * Reset Button. To do this, write to GPIO_USE_SEL2 to have GPIO60 set to GPIO mode.
> +        * This is documented on page 1609 of the PCH datasheet, order number 327879-005US
> +        */

/*
 * Multi-line comment style is not
 * for this subsystem.
 */

...

> +       tink_leds_pdev = tink_create_dev(
> +               "leds-gpio",
> +               &tink_leds_pdata,
> +               sizeof(tink_leds_pdata));
> +
> +       tink_keys_pdev = tink_create_dev(
> +               "gpio-keys-polled",
> +               &tink_buttons_pdata,
> +               sizeof(tink_buttons_pdata));

Again, use less LOCs.

...

> +

Unneeded blank line, attach the below to the respective functions

> +module_init(tink_board_init);
> +module_exit(tink_board_exit);

...

> +MODULE_DEVICE_TABLE(dmi, tink_systems);
Put this closer to the structure.

-- 
With Best Regards,
Andy Shevchenko
