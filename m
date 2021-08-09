Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12F563E45E5
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Aug 2021 14:46:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233342AbhHIMrE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Aug 2021 08:47:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233279AbhHIMrE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Aug 2021 08:47:04 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02F77C0613D3;
        Mon,  9 Aug 2021 05:46:44 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id c2-20020a0568303482b029048bcf4c6bd9so17754764otu.8;
        Mon, 09 Aug 2021 05:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QMYvGEawfVzLXF55MEuHd1fUgYBElHTIUYmhiEV2ZcQ=;
        b=orISg8SyCRGEJGRgvxU7cDy51dWJW+9U2faRRQLU2FO/kZUqDRk+7Nt/SRzWLwKjVn
         AkCHs3skqH4oKIjcyejGGwKcXniaOUaQm1nyEEUKfqEtiZMlV0n9kwhzcOrbojmZeupH
         zIaNTEPWdqp14ZiMjpsYRgK80kL1KGyabWChmincY78jZtGQJl4PjIlmrYOVmrN4Plwf
         /U21GaWzut4DC8R5na8DNG/LaJXABb3ssjAyMGV5D1quPulq5kV8QUsB2uZSCxoY1H8K
         GvcC6fiTeCFSb2UkllCGP5OCN4zr+nVj9Aah1QFHAfzXkEdrjv7BYibtpYRg7nPxmHsG
         HcUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QMYvGEawfVzLXF55MEuHd1fUgYBElHTIUYmhiEV2ZcQ=;
        b=eVqhHUpV+hvDVmhEEWXevwi5z5SyuLZSuTvLN4Q9luM93rwNfuWvOX/+FK8u9leYmd
         Vj5ykrOguGxxF1dhNi8zeOIDHuso+YfYXaPjIfrQbb4/MjUyUk/G5FQiEj7QT6IQwKSK
         r+QbBD/dXFYuynPP1NASv69miNwkatQEelE50+59oA0qiC4C4+wOWzKRtu7AFtYx7Z/d
         a3iapMpVh4/2UQiqzCSeTMpa8EWt+hmp/dnLTCp0iyWYy9h2VnalSKRZ+YDTfpJG7m3P
         0VzHBIkg+W4IE7e47rUgtSAXfpc5O6oabzQFSjgllg5J9CRFy496EGOsT+CxzgTHZV5k
         EAow==
X-Gm-Message-State: AOAM5333A+p2jsaHEcQqUMgx/nMWautcZDcqrlibl24qwo5oRwKjpMy1
        4OfH9SUS1RqcO8C8MLLL/20ji+9FdtH0RvD64to=
X-Google-Smtp-Source: ABdhPJxiRsUdAbBSgT8JJtyLoBMkZNP9a9fJHxKKP7WTD69T1GqvNSdvfMw1BxSMYI2warFIn34i0SDFKoBaRqUSn1E=
X-Received: by 2002:a9d:2609:: with SMTP id a9mr575028otb.365.1628513203319;
 Mon, 09 Aug 2021 05:46:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210809121345.967597-1-chrisrblake93@gmail.com>
 <CAHp75VfQr6XKQ0UDQDq0pH7TK=_WUGBhRKcC_=-zzUGOwO8tWQ@mail.gmail.com>
 <CALpBJjpSJQquzaT14TkoEbTHrvtN8kiQWKLs3n0ZNiziB=iwCA@mail.gmail.com> <CAHp75Ve2i-5x-Xuoo3Z=JATFXqjV76aGyrnmEz+4d5qR7tLPJw@mail.gmail.com>
In-Reply-To: <CAHp75Ve2i-5x-Xuoo3Z=JATFXqjV76aGyrnmEz+4d5qR7tLPJw@mail.gmail.com>
From:   Chris <chrisrblake93@gmail.com>
Date:   Mon, 9 Aug 2021 07:46:32 -0500
Message-ID: <CALpBJjp7bRJF_ivPhxf=PKbZbB+1UZXOH=+soNLxoYxA_F4Sww@mail.gmail.com>
Subject: Re: [PATCH v3] platform/x86: add meraki-mx100 platform driver
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Christian Lamparter <chunkeey@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

 On Mon, Aug 9, 2021 at 7:32 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Mon, Aug 9, 2021 at 3:29 PM Chris <chrisrblake93@gmail.com> wrote:
> > On Mon, Aug 9, 2021 at 7:22 AM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > > On Mon, Aug 9, 2021 at 3:13 PM Chris Blake <chrisrblake93@gmail.com> wrote:
>
> (I left below context on purpose)
>
> > > > +static struct platform_device * __init tink_create_dev(
> > > > +       const char *name, const void *pdata, size_t sz)
> > > > +{
> > > > +       struct platform_device *pdev;
> > > > +
> > > > +       pdev = platform_device_register_data(NULL,
> > > > +               name, PLATFORM_DEVID_NONE, pdata, sz);
> > > > +       if (IS_ERR(pdev))
> > > > +               pr_err("failed registering %s: %ld\n", name, PTR_ERR(pdev));
> > > > +
> > > > +       return pdev;
> > > > +}
> > > > +
> > > > +static int __init tink_board_init(void)
> > > > +{
> > > > +       if (!dmi_first_match(tink_systems))
> > > > +               return -ENODEV;
> > > > +
> > > > +       /*
> > > > +        * We need to make sure that GPIO60 isn't set to native mode as is default since it's our
> > > > +        * Reset Button. To do this, write to GPIO_USE_SEL2 to have GPIO60 set to GPIO mode.
> > > > +        * This is documented on page 1609 of the PCH datasheet, order number 327879-005US
> > > > +        */
> > > > +       outl(inl(0x530) | BIT(28), 0x530);
> > > > +
> > > > +       gpiod_add_lookup_table(&tink_leds_table);
> > > > +       gpiod_add_lookup_table(&tink_keys_table);
> > > > +
> > > > +       tink_leds_pdev = tink_create_dev("leds-gpio",
> > > > +               &tink_leds_pdata, sizeof(tink_leds_pdata));
> > >
> > > Seems you forgot to add
> > > if (IS_ERR())
> > >   return PTR_ERR();
> > >
> > > here...
> > >
> > > > +       tink_keys_pdev = tink_create_dev("gpio-keys-polled",
> > > > +               &tink_buttons_pdata, sizeof(tink_buttons_pdata));
> > >
> > > and
> > >
> > > if (IS_ERR()) {
> > >  pdev_unreg();
> > >  return PTR_ERR();
> > > }
> > >
> > > here.
> >
> > Are these IS_ERR catches needed since they are done in the
> > tink_create_dev struct? This is the same structure as currently done
> > in drivers/platform/x86/pcengines-apuv2.c. Adding these 2x additions
> > feels a bit redundant, but if I am wrong please correct me.
>
> Care to describe how it's supposed to be taken into account in your opinion?

I don't mind adding those blocks in, I am just trying to understand
the benefit. In tink_create_dev() we do if (IS_ERR(pdev)) right after
platform_device_register_data is called, so I am just curious why we
would add another if (IS_ERR()) conditional after the 2x calls to
tink_create_dev(). I don't have a ton of work in the kernel, so
knowing why this was requested will help me improve any future PRs.

>
> > > > +       return 0;
> > > > +}
>
>
> --
> With Best Regards,
> Andy Shevchenko
