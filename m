Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C05D73E0161
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Aug 2021 14:45:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238219AbhHDMpI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Aug 2021 08:45:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238192AbhHDMou (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Aug 2021 08:44:50 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E36AC061799;
        Wed,  4 Aug 2021 05:44:37 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id n17so1497560lft.13;
        Wed, 04 Aug 2021 05:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wnktbUFKuuRskzgHK8SlfPzSzc87+GmivQtXGmsj37A=;
        b=mSTEzfrGofZh5G859M5bI23nQF7ztT0ECQ/RNAWtHFOaVbpAwxQytlZ7FLz5Um5cdf
         dHmXfnjVMFe+6qdF0Zh8116wH+dcIp/JY2jRvYZLNN5hQK6ue4FTPhaGf3+u6FnzJftz
         iMf7skkmlSYlG9xAGLHgCg0CeQkeYI2CSG1I9vQFWLJI7O4m/A/Y/QtVinCtmOP8R/b5
         L53WSqC9cSCJoSaHYjsqpR6nKRk2kDAu4qUNz3xLemqLB2oSuVmhBZkGv7Mt8BwwRAHK
         RVA7QdGXolNDVOmlYm3Gt7wvqTm8jdRFApcp8qzVuCaW5xaZeA0PGn6GON1+dvy11uHR
         +1zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wnktbUFKuuRskzgHK8SlfPzSzc87+GmivQtXGmsj37A=;
        b=GzpokhFQJo5zHXtIHz0hNPQlzA+k9yxImiI3fd5GRRbqkW83m9ATbvxJyR1z9Qfzt4
         pNlwkpyEQbzqTUqa2Cssroz3wtDkYXdqb3NqpYHURl56c7x8bnB9dAJgI3kZGGCWtGWZ
         kInifezlSENkv7aYJ7FEJHwUbYGqSQOhjxRlSIS1GDn5M58K1WsZ0lVBx2hVfmz/nK/9
         f2pnUL22xTqVoxQlFwiQ0xKgWLfPVjxvmaGSoVRDLOSlR1sXxSpZc/H+DQNont8Azfuw
         M1hpjastNPqdgKgI8Xd/cbgJ+7b9YptTLOKUlnn3WSdKzMS9A6NdM/BY5HiXKEdnkJSn
         gqUg==
X-Gm-Message-State: AOAM532Ghq8HVV9/sev9SafY+H/e9QpuhgybctIlu8E+9XhciatWCgtL
        G/DtLbIwoVlQGJO495N3tDU=
X-Google-Smtp-Source: ABdhPJy2eX5UL9NlcymGWnUOdyVSFQEbYwyyG7vUFvYUzWmBwDRLd/jtmcHii/0jHnuHC20hzhzbRQ==
X-Received: by 2002:a05:6512:3f16:: with SMTP id y22mr13668373lfa.356.1628081075653;
        Wed, 04 Aug 2021 05:44:35 -0700 (PDT)
Received: from mobilestation ([95.79.127.110])
        by smtp.gmail.com with ESMTPSA id w26sm153859ljd.89.2021.08.04.05.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 05:44:35 -0700 (PDT)
Date:   Wed, 4 Aug 2021 15:44:33 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Lee Jones <lee.jones@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Hoan Tran <hoan@os.amperecomputing.com>
Subject: Re: [PATCH v1 2/4] gpio: dwapb: Read GPIO base from gpio-base
 property
Message-ID: <20210804124433.crh7w6jzfjcswubo@mobilestation>
References: <20210726125436.58685-1-andriy.shevchenko@linux.intel.com>
 <20210726125436.58685-2-andriy.shevchenko@linux.intel.com>
 <20210802135839.4clqd34npppwasyh@mobilestation>
 <CAHp75Vcz=vkaGObUcOOTZA51pHPoMc50RpPBLg4fgZgHdUStRA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vcz=vkaGObUcOOTZA51pHPoMc50RpPBLg4fgZgHdUStRA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

@Linus, @Bartosz, @Rob, could you join the discussion regarding the
gpio-base property usage?

On Mon, Aug 02, 2021 at 06:52:28PM +0300, Andy Shevchenko wrote:
> On Mon, Aug 2, 2021 at 5:14 PM Serge Semin <fancer.lancer@gmail.com> wrote:
> > On Mon, Jul 26, 2021 at 03:54:34PM +0300, Andy Shevchenko wrote:
> > > For backward compatibility with some legacy devices introduce
> > > a new (*) property gpio-base to read GPIO base. This will allow
> > > further cleanup of the driver.
> 
> Thanks for the review! My answers below.
> 
> > > *) Note, it's not new for GPIO library since mockup driver is
> > >    using it already.
> >
> > You are right but I don't think it's a good idea to advertise the
> > pure Linux-internal property "gpio-base" to any use-case like OF
> > and ACPI FW nodes.
> 

> I don't want to advertise them, actually (that's why no bindings are
> modified). Perhaps introducing a paragraph in the GPIO documentation
> about this (and / or in GPIO generic bindings) that gpio-base property
> is solely for internal use and should't be used in actual DTs?

It might have been not that clear but by "advertising" I meant to have
the property generically handled in the driver, thus permitting it
being specified not only via the SW-nodes but also via the ACPI
and OF firmware. (Please see my next comment for more details.)

Regarding adding the gpio-base property documentation. I am pretty
sure it shouldn't be mentioned neither in the DW APB GPIO bindings,
nor in any other GPIO device DT-bindings because as you are right
saying it is the solely Linux kernel-specific parameter and isn't
supposed to be part of the device tree specification. On the other
hand if it gets to be frequently used then indeed we need to somehow
have it described and of course make sure it isn't used
inappropriately. Thus a possible option of documenting the property
would be just adding a new paragraph/file somewhere in
Documentation/driver-api/gpio/ since the property name implies that
it's going to be generic and permitted to be specified for all
GPIO-chips. Though it's for @Linus and @Bartosz to decide after all.

> 
> >  Especially seeing we don't have it described in the
> > DT-bindings and noting that the mockup driver is dedicated for the
> > GPIO tests only. What about restricting the property usage for the
> > SW-nodes only by adding an additional check: is_software_node() here?
> 

> I don't think we need this. But if you think it's better this way just
> to avoid usage of this property outside of internal properties, I'm
> fine to add. Perhaps we may issue a warning and continue? (see also
> above)

In my opinion it's very required and here is why. Adding the generic
gpio-base property support into the driver basically means saying:
"Hey, the driver supports it, so you can add it to your firmware."
Even if the property isn't described in the bindings, the platform
developers will be able to use it in new DTS-files since it's much
easier to add a property into a DT-file and make things working than
to convert the drivers/platforms/apps to using the GPIOd API. In case
if maintainers aren't that careful at review such dts may get slip
into the kernel, which in its turn will de facto make the property
being part of the DT specification and will need to be supported. That
is we must be very careful in what properties are permitted in the
driver. Thus, yes, I think we need to make sure here that the property
is only used in framework of the kernel and isn't passed via
inappropriate paths like DT/ACPI fw so not to get into the
maintainability troubles in future.

Issuing a warning but accepting the property isn't good alternative
due to the same reason. Why do we need to add the DT/ACPI property
support, which isn't supposed to be used like that instead of just
restricting the usecases beforehand? So I vote for parsing the
"gpio-base" property only if it's passed as a part of the SW-node.

-Sergey

> 
> > @Linus, @Bartosz, @Rob, what do you think about that?
> 
> -- 
> With Best Regards,
> Andy Shevchenko
