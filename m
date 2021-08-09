Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11AF03E45A6
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Aug 2021 14:32:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234718AbhHIMdI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Aug 2021 08:33:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234610AbhHIMdI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Aug 2021 08:33:08 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28DCBC061796;
        Mon,  9 Aug 2021 05:32:48 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id u16so16181293ple.2;
        Mon, 09 Aug 2021 05:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t9TxzXmM/XQ4KE1j91sXxBt2copb8rc8rIOA4q9sUVo=;
        b=pLADm6FVyDC9c+evjFpQQooFad2tPHwrm4TEcNI8buxH3Phbq5R/jYNf8VLaqm4kz8
         HUAyFeFx2y/Yy2O+mxxFhlalcmTYy3BJsr3JQUS6RhvgVktJzTWTz8nWkyodOupJerfQ
         sUtBrI6IQheRMkKAZYkXInoFPoply/gPOYEEY5W5hsE/f04Tq+BQ8LnDuC4PD3TNVr+c
         T+LzGl7qLtcpxp5tTOM7vaWBgAc5DDGBJAzxEQyWcu1QDNXRc8nl5MQz/nN/BRmwRJlQ
         0y+Q6Lhzj76RN/EPhUL6xjoClVCcOLbwmIF5NQHCeKYBm5pk2HexDl1wtt3ZrTj5Fldv
         cWXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t9TxzXmM/XQ4KE1j91sXxBt2copb8rc8rIOA4q9sUVo=;
        b=pGQm3H6cKs8RoUgL/Mxt7QViOg4RVvZw5652PwOvyV//mTx2kfrsKFbwW7tUiQcGxE
         Cf97ZUxdCE+//m9LC6ZPnoOiMxTXGUzm/LtK36YDt7QAYnpXkTwW1z4Myvcn0Z5KfgPz
         bpx2I11cQ8P3z8FhFX4vxpEyOJxF6mOckK1pJfP9KK6JFuQ/WyYQvu99FoeX0uK+Owea
         2diXFOMCLkJrvCltRQLUsc8ZxTqmQhMTg2a+zstotgLhaBUThy7VDnXqKilObZHTqQd1
         V9arNLjxNgzDEb/KXECGX7PIBX0093ZGcOrtuL5cdnyH7SpmPbZa75cDTz2leV3AJhVl
         XdEA==
X-Gm-Message-State: AOAM5304QyeFbrXCn4Idf+j0dHiHw94p/4xcw7RlNlyCAWpsw/AfDdhW
        WQ+NN23/GtRzchi3w+BFQiw+2Uc9uUtj0zGY1jI=
X-Google-Smtp-Source: ABdhPJwwFZogtcw/paQm8tqO8eDU010kuY58FFsI+YQeS7e4eLmn9Ii5jZcc/1XmkXAWspwWp30fr5ve01KK2IZ79Eo=
X-Received: by 2002:a17:90b:33c5:: with SMTP id lk5mr36528133pjb.129.1628512367605;
 Mon, 09 Aug 2021 05:32:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210809121345.967597-1-chrisrblake93@gmail.com>
 <CAHp75VfQr6XKQ0UDQDq0pH7TK=_WUGBhRKcC_=-zzUGOwO8tWQ@mail.gmail.com> <CALpBJjpSJQquzaT14TkoEbTHrvtN8kiQWKLs3n0ZNiziB=iwCA@mail.gmail.com>
In-Reply-To: <CALpBJjpSJQquzaT14TkoEbTHrvtN8kiQWKLs3n0ZNiziB=iwCA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 9 Aug 2021 15:32:11 +0300
Message-ID: <CAHp75Ve2i-5x-Xuoo3Z=JATFXqjV76aGyrnmEz+4d5qR7tLPJw@mail.gmail.com>
Subject: Re: [PATCH v3] platform/x86: add meraki-mx100 platform driver
To:     Chris <chrisrblake93@gmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Christian Lamparter <chunkeey@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 9, 2021 at 3:29 PM Chris <chrisrblake93@gmail.com> wrote:
> On Mon, Aug 9, 2021 at 7:22 AM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Mon, Aug 9, 2021 at 3:13 PM Chris Blake <chrisrblake93@gmail.com> wrote:

(I left below context on purpose)

> > > +static struct platform_device * __init tink_create_dev(
> > > +       const char *name, const void *pdata, size_t sz)
> > > +{
> > > +       struct platform_device *pdev;
> > > +
> > > +       pdev = platform_device_register_data(NULL,
> > > +               name, PLATFORM_DEVID_NONE, pdata, sz);
> > > +       if (IS_ERR(pdev))
> > > +               pr_err("failed registering %s: %ld\n", name, PTR_ERR(pdev));
> > > +
> > > +       return pdev;
> > > +}
> > > +
> > > +static int __init tink_board_init(void)
> > > +{
> > > +       if (!dmi_first_match(tink_systems))
> > > +               return -ENODEV;
> > > +
> > > +       /*
> > > +        * We need to make sure that GPIO60 isn't set to native mode as is default since it's our
> > > +        * Reset Button. To do this, write to GPIO_USE_SEL2 to have GPIO60 set to GPIO mode.
> > > +        * This is documented on page 1609 of the PCH datasheet, order number 327879-005US
> > > +        */
> > > +       outl(inl(0x530) | BIT(28), 0x530);
> > > +
> > > +       gpiod_add_lookup_table(&tink_leds_table);
> > > +       gpiod_add_lookup_table(&tink_keys_table);
> > > +
> > > +       tink_leds_pdev = tink_create_dev("leds-gpio",
> > > +               &tink_leds_pdata, sizeof(tink_leds_pdata));
> >
> > Seems you forgot to add
> > if (IS_ERR())
> >   return PTR_ERR();
> >
> > here...
> >
> > > +       tink_keys_pdev = tink_create_dev("gpio-keys-polled",
> > > +               &tink_buttons_pdata, sizeof(tink_buttons_pdata));
> >
> > and
> >
> > if (IS_ERR()) {
> >  pdev_unreg();
> >  return PTR_ERR();
> > }
> >
> > here.
>
> Are these IS_ERR catches needed since they are done in the
> tink_create_dev struct? This is the same structure as currently done
> in drivers/platform/x86/pcengines-apuv2.c. Adding these 2x additions
> feels a bit redundant, but if I am wrong please correct me.

Care to describe how it's supposed to be taken into account in your opinion?

> > > +       return 0;
> > > +}


-- 
With Best Regards,
Andy Shevchenko
