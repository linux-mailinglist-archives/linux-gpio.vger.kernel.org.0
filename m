Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C68BC331748
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Mar 2021 20:30:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231250AbhCHT3p (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Mar 2021 14:29:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230439AbhCHT3j (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Mar 2021 14:29:39 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DF0DC061761
        for <linux-gpio@vger.kernel.org>; Mon,  8 Mar 2021 11:29:39 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id hs11so22690170ejc.1
        for <linux-gpio@vger.kernel.org>; Mon, 08 Mar 2021 11:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eHJ2XNymZaL0j993KgEpbW1/T5ty0OIGX39okZyZJhY=;
        b=iXpJTUWW7ewuSQGoKHFhnh8Do8MoEKRRaxJFwH5YEIErlilmyNOJlWXoErnqgpMUlC
         wygDSZ9kp18J2P2bNEGJVVwXdIrtS9RbQXKfwIu9JU8NqBl861ZSFnZOfOfl1rdZDym2
         eJV3MucGof+9L5HpzuVYg6rbF/5EASCspZWspAsm83tTpPdWSjPl1p7NEK5jhfbMR8/5
         vtlzhzUdmq3d9+tQUmLugU9k9f5FHb8vqSoeyOtgAOsrnRH1BxZBimzD7x7f5fa9HBCu
         pB/VzCBr3cqY3HvAXXqioay0c0amAL9HjG7oVSLoMt4VkWyW9PlpQnnuQeEC85Ys+ecj
         YTVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eHJ2XNymZaL0j993KgEpbW1/T5ty0OIGX39okZyZJhY=;
        b=aOnzGlNFhGJq2ncYwHYgxK/jFpr7Q8IVWqMuYBEB3sOzj93LWK6e4S3nSl3NGioh4V
         1q0ArM7TnJ/yk5IyQ8MAdkHScjpq7DsQ4Y/r6zLA7JIkaR5LWAj4PoL0QH1MzHCRBZtL
         fS2tR33awrZ9gEFHqry3jUFrZh5+23ysh19ddL0BzAjSS0ANZ1Je0Z8/KM/uwyD6/EjJ
         QCT4hWYvL4Ee/78MwQdUr+pmUko2aNppNYKI1mTRDfl8rLNoPkLL9OG5OP4ClLQMIZMx
         NfyQJDoFhflLR5c+jcQCUtFY3NPSIdHFBvzuFScLFCvLrTYa4coZTtGaIe6RR9S6hyBf
         i+zQ==
X-Gm-Message-State: AOAM53077Rsd1YCXXhlWAEVHhOBo6I4Bmwu4Vr/oXV2vPKMxVVRT3bpn
        sur1+H0jRaLW6+TjFyCIfnXmKCSm2FXe6EnyE/UTa08JxHM=
X-Google-Smtp-Source: ABdhPJxBWarr0tUPIerlQbKpwHvX9N+adkAEGfDD5aWOFSx5L90SjD/pCU8XC8r+VNDIIhRIj7mrJzdnQ1FgxKPtj6U=
X-Received: by 2002:a17:906:565a:: with SMTP id v26mr16931477ejr.516.1615231778033;
 Mon, 08 Mar 2021 11:29:38 -0800 (PST)
MIME-Version: 1.0
References: <20210304201253.14652-1-andriy.shevchenko@linux.intel.com>
 <CAJZ5v0gR=gN2ROo9JSOGHokw5imscMBwDERni8X83p0eWt634w@mail.gmail.com>
 <CAMpxmJUQ3r0YCeQvPq=SW57w-5BLtoTO1_bv=2uw6CX_1-EXcQ@mail.gmail.com> <CAJZ5v0h7zUMU9DMofa3fhop9fYY6UJQ6Nm3xBOmG48bcmLCj3w@mail.gmail.com>
In-Reply-To: <CAJZ5v0h7zUMU9DMofa3fhop9fYY6UJQ6Nm3xBOmG48bcmLCj3w@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 8 Mar 2021 20:29:27 +0100
Message-ID: <CAMpxmJXa2Qxznss3c79Zf-PzsX=SY6WOJorAMvS-UxKoViKP_w@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] gpiolib: switch to fwnode in the core
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Marc Zyngier <maz@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 8, 2021 at 8:26 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
>
> On Mon, Mar 8, 2021 at 8:23 PM Bartosz Golaszewski
> <bgolaszewski@baylibre.com> wrote:
> >
> > On Mon, Mar 8, 2021 at 7:22 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
> > >
> > > On Thu, Mar 4, 2021 at 9:13 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > >
> > > > GPIO library uses of_node and fwnode in the core in non-unified way.
> > > > The series cleans this up and improves IRQ domain creation for non-OF cases
> > > > where currently the names of the domain are 'unknown'.
> > > >
> > > > This has been tested on Intel Galileo Gen 2.
> > > >
> > > > In v3:
> > > > - fix subtle bug in gpiod_count
> > > > - make irq_domain_add_simple() static inline (Marc)
> > > >
> > > > In v2:
> > > > - added a new patch due to functionality in irq_comain_add_simple() (Linus)
> > > > - tagged patches 2-4 (Linus)
> > > > - Cc'ed to Rafael
> > > >
> > > > Andy Shevchenko (5):
> > > >   irqdomain: Introduce irq_domain_create_simple() API
> > > >   gpiolib: Unify the checks on fwnode type
> > > >   gpiolib: Move of_node operations to gpiolib-of and correct fwnode use
> > > >   gpiolib: Introduce acpi_gpio_dev_init() and call it from core
> > > >   gpiolib: Reuse device's fwnode to create IRQ domain
> > >
> > > [1-4/5] applied as 5.13 material and I have a minor comment regarding
> > > the last patch (will send separately).
> > >
> > > Thanks!
> >
> > Hi Rafael!
> >
> > AFAICT this should go through the GPIO tree as usual. Any reason for
> > you to pick these patches this time?
>
> My impression was that Andy wanted me to take them.
>
> However, if you'd rather take care of them yourself, there you go!
>
> I'll drop them now and assume that they will be routed through the GPIO tree.
>
> Thanks!

They touch a lot of core GPIO code and are likely to conflict if any
other changes show up this release cycle. I'd rather take them through
the usual channel. Thanks!

Bartosz
