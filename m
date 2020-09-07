Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DC1F25FA28
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Sep 2020 14:09:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729081AbgIGMJg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Sep 2020 08:09:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729177AbgIGMGk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Sep 2020 08:06:40 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 320EAC061573
        for <linux-gpio@vger.kernel.org>; Mon,  7 Sep 2020 05:06:27 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id q13so17876319ejo.9
        for <linux-gpio@vger.kernel.org>; Mon, 07 Sep 2020 05:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Tw4f2wX8YqmmfCG4fLEsa1aDy9xcwa2clW6NhysDtyc=;
        b=vXqecv/JD1j08x2l2xv8uMY2f5Yrx4K3HukAwUizDgeJSij+T75ajGmL1q9blQ9UrJ
         qCvwj8FsbXkYLIOkfpnIyoCMd0YWDwu7jzDwuPBz5d/I0pvFV2rv2MaIlzwpB+L6BBvL
         KLuAAE/uYoT21Qcb0Ek9uNjNv+Tc1kJZB6gBNZEqfR4K8F3owTI8UDBaBNdeerEXBRQf
         svknQedIT00FvncGNd3SMt5eJGRvr9n1qI1k7jYBXFJTuIChik7GAJQR8GK7RuqOeYDV
         6OpI9z0F1CVv5xPg/cyAf/YafdgiGJcwRMOp33wT+hcztaMEzFbH2LHAvgY5FPcU8BxK
         qNyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Tw4f2wX8YqmmfCG4fLEsa1aDy9xcwa2clW6NhysDtyc=;
        b=FEtgFewQGIGkvb3/6w57/WYgHPR4pGEZn4XtJyI9+WOGwRIcW+rBT4TMri4GXwXmd7
         3GcqSRwFYzplduWdOuVVIucYu2k3TthoFYdoZb83IrDnc6URJMh5sV7L5GvUIegtQKLc
         4omugxIcSdi/rQEzs533taSZVSJANakUwC+X1pFbiZHND5fwl+wvEY2KAHSoe0B17Ruf
         +k48YG2WfV5AyziuTFsbiMnyBx8lPrE5ajy4lgfpW7MMMoKSs3DpVsdS4+HJEbx9TulT
         I1SrIJQbxh65yZM/6R7xzZvNuCTkx6fhY1bGhSjEOYd4nNF21v8Sdl0kA/2onEWcQCVg
         Sn2g==
X-Gm-Message-State: AOAM5316svziUzrTdq2pufiIuwEmdUT9Ggwz9LFusixlIp4DIo9j4Yf0
        ItQnQtI5Z4/awGWyXF9sUHb0q4GbtrexSoZ+wJAaZQ==
X-Google-Smtp-Source: ABdhPJw+GbBoK76Yk9oXUxiHnhTP8BrVOQx6dDXADdyKLjOSvFHDs9IyPG0ZhERjAUhRxXRKmTxwpbMibpY7sdicuFI=
X-Received: by 2002:a17:906:f11:: with SMTP id z17mr2135074eji.88.1599480386425;
 Mon, 07 Sep 2020 05:06:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200904154547.3836-1-brgl@bgdev.pl> <20200904154547.3836-24-brgl@bgdev.pl>
 <26ea1683-da8f-30e7-f004-3616e96d56b3@infradead.org> <20200907095932.GU1891694@smile.fi.intel.com>
 <CAMpxmJXvhYOVkZY7LLf=v+o8E2xKTh1RYhLrdVsS9nN1XZ5QJQ@mail.gmail.com> <20200907115310.GA1891694@smile.fi.intel.com>
In-Reply-To: <20200907115310.GA1891694@smile.fi.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 7 Sep 2020 14:06:15 +0200
Message-ID: <CAMpxmJUfNkko4Rrb4N5CF_rdwRAWGhVr9DSOHfhYyTxYSH7dsQ@mail.gmail.com>
Subject: Re: [PATCH 23/23] Documentation: gpio: add documentation for gpio-mockup
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 7, 2020 at 1:53 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Sep 07, 2020 at 12:26:34PM +0200, Bartosz Golaszewski wrote:
> > On Mon, Sep 7, 2020 at 11:59 AM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > On Fri, Sep 04, 2020 at 08:15:59PM -0700, Randy Dunlap wrote:
> > > > On 9/4/20 8:45 AM, Bartosz Golaszewski wrote:
> > >
> > > ...
> > >
> > > > > +GPIO Testing Driver
> > > > > +===================
> > > > > +
> > > > > +The GPIO Testing Driver (gpio-mockup) provides a way to create simulated GPIO
> > > > > +chips for testing purposes. There are two ways of configuring the chips exposed
> > > > > +by the module. The lines can be accessed using the standard GPIO character
> > > > > +device interface as well as manipulated using the dedicated debugfs directory
> > > > > +structure.
> > > >
> > > > Could configfs be used for this instead of debugfs?
> > > > debugfs is ad hoc.
> > >
> > > Actually sounds like a good idea.
> > >
> >
> > Well, then we can go on and write an entirely new mockup driver
> > (ditching module params and dropping any backwards compatibility)
> > because we're already using debugfs for line values.
> >
> > How would we pass the device properties to configfs created GPIO chips
> > anyway? Devices seem to only be created using mkdir. Am I missing
> > something?
>
> Same way how USB composite works, no?
>

OK, so create a new chip directory in configfs, configure it using
some defined configfs attributes and then finally instantiate it from
sysfs?

Makes sense and is probably the right way to go. Now the question is:
is it fine to just entirely remove the previous gpio-mockup? Should we
keep some backwards compatibility? Should we introduce an entirely new
module and have a transition period before removing previous
gpio-mockup?

Also: this is a testing module so to me debugfs is just fine. Is
configfs considered stable ABI like sysfs?

Bart
