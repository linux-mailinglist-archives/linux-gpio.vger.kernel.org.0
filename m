Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41FFC35AC1B
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Apr 2021 11:07:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231279AbhDJJHW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 10 Apr 2021 05:07:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229992AbhDJJHV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 10 Apr 2021 05:07:21 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39A6BC061763
        for <linux-gpio@vger.kernel.org>; Sat, 10 Apr 2021 02:07:07 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id sd23so3619822ejb.12
        for <linux-gpio@vger.kernel.org>; Sat, 10 Apr 2021 02:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hy+D3/ugFm1KkPPIMlbprnQ9KcfX248Ahg/C6irnkTY=;
        b=nF7C+vMIJPKBKEkRT0Sk6mQuo0/73O3fTO2I9RReSOmP3Yn/u3/aIXpBTrfQxisOeQ
         sgE+WvoIidVWit4bowRRoL+UlTBD8lk8Spfsc1eTOty2M9JRDE+EDsdNgAHvrHVIEZrT
         wArfqz4GWCHfgvOWXypAdzNBWj+A7Ux4BqA1QKxuczZueoladA3/SxhTibwrK4XUDv+j
         ItIzSA9ut6Ht3GJfwfEKySVEdKMXg7ZcRBnngg8ySB0PpHhUMoxcK0U2ZNYzhsk3SoGP
         978O+/tYWQeDPMJj81HQrsYXEazL96EmHJU47wAbcmxVrkAujKHu3cRfXwA1jvVeMFP1
         URdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hy+D3/ugFm1KkPPIMlbprnQ9KcfX248Ahg/C6irnkTY=;
        b=QkRKq1nR/l/Y0EsZkcPYiIC+vDKVhY4I2kQCtH9rg05azKXntIQpcRTbaNyuH1ImZ7
         PmYdMDZcRrpmke362TmG9bn0gljbdpDteYmXRfeGFb4yU1+IXyCcsN55/n1YBAN4L81a
         rCx3o+LvaLanohkmk3uiCDUHvagrmdOFHVaegoDkWWlS4Hm7kx8LroOlTxaHI4a3yEcC
         OHXsYm6CG2PiwoNogT7JYf4vk9ebT0ZkRAZp3Tkd7aCqxOQaq/BhzoiBtLPUP3190hI7
         aCfndhmdPKOTPYb3wQ7gNWVdT0qWcCwGGHaFJQAY5rID1YZj8CgjQgPuhywfwJr/NqLc
         Rl8Q==
X-Gm-Message-State: AOAM530FMb5ImAeQdsNZxyz0nfCvZnR9eb9xAV73Xq5Ycsv8Q/fsUOlq
        JCizxvisfBBurnVax47DZ6UOA25fYrZnvMIPuQjiIg==
X-Google-Smtp-Source: ABdhPJxQL97e3eOy8ciUalzfu+CKlZpF68BngVVKjK0HdtGzdfE9vkWo5rY8Cm3NeFIW3Hk7NerBQwBC9hXMEPnyMKM=
X-Received: by 2002:a17:907:294f:: with SMTP id et15mr4890236ejc.14.1618045625884;
 Sat, 10 Apr 2021 02:07:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210305120240.42830-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=Mfye=O4mMiK01Q6Ok+ztSfMwMcrfaZSs+LhRxi=AM+C2w@mail.gmail.com>
 <YE8z+ohM9abBs9SD@smile.fi.intel.com> <YE9YGGB+k7CsCNDI@smile.fi.intel.com>
 <CAMRc=McLsamBwe8hSob11ustk2GUzOfYh7CcqNtxsM+6vgPENw@mail.gmail.com>
 <YE9whHhaa2XavKfj@smile.fi.intel.com> <CAMpxmJVUVhpcNOVQCB3p8tNpac5e5c7vRQS=-avA6Cuaag9eRw@mail.gmail.com>
 <CAHp75VfsGn=dTo+f2MtssqWpuj_Sm+LHtTaM=7oW9g8riz4xTg@mail.gmail.com> <5bf6771d-5783-0a40-5a72-7ddbb9c694aa@denx.de>
In-Reply-To: <5bf6771d-5783-0a40-5a72-7ddbb9c694aa@denx.de>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sat, 10 Apr 2021 11:06:55 +0200
Message-ID: <CAMRc=Mf+syGC92=UBXjX96wrx5oVUyo8NhOj-zGu9CAPsPTbMQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: Read "gpio-line-names" from a firmware node
To:     Marek Vasut <marex@denx.de>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Roman Guskov <rguskov@dh-electronics.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Apr 10, 2021 at 2:46 AM Marek Vasut <marex@denx.de> wrote:
>
> On 3/15/21 6:04 PM, Andy Shevchenko wrote:
> > On Mon, Mar 15, 2021 at 6:49 PM Bartosz Golaszewski
> > <bgolaszewski@baylibre.com> wrote:
> >>
> >> On Mon, Mar 15, 2021 at 3:34 PM Andy Shevchenko
> >> <andriy.shevchenko@linux.intel.com> wrote:
> >>>
> >>> On Mon, Mar 15, 2021 at 03:04:37PM +0100, Bartosz Golaszewski wrote:
> >>>> On Mon, Mar 15, 2021 at 1:50 PM Andy Shevchenko
> >>>> <andriy.shevchenko@linux.intel.com> wrote:
> >>>>>
> >>>>> On Mon, Mar 15, 2021 at 12:16:26PM +0200, Andy Shevchenko wrote:
> >>>>>> On Mon, Mar 15, 2021 at 10:01:47AM +0100, Bartosz Golaszewski wrote:
> >>>>>>> On Fri, Mar 5, 2021 at 1:03 PM Andy Shevchenko
> >>>>>>> <andriy.shevchenko@linux.intel.com> wrote:
> >>>>>>
> >>>>>>> Unfortunately while this may fix the particular use-case on STM32, it
> >>>>>>> breaks all other users as the 'gpio-line-names' property doesn't live
> >>>>>>> on dev_fwnode(&gdev->dev) but on dev_fwnode(chip->parent).
> >>>>>>>
> >>>>>>> How about we first look for this property on the latter and only if
> >>>>>>> it's not present descend down to the former fwnode?
> >>>>>>
> >>>>>> Oops, I have tested on x86 and it worked the same way.
> >>>>>>
> >>>>>> Lemme check this, but I think the issue rather in ordering when we apply fwnode
> >>>>>> to the newly created device and when we actually retrieve gpio-line-names
> >>>>>> property.
> >>>>>
> >>>>> Hmm... I can't see how it's possible can be. Can you provide a platform name
> >>>>> and pointers to the DTS that has been broken by the change?
> >>>>>
> >>>>
> >>>> I noticed it with gpio-mockup (libgpiod tests failed on v5.12-rc3) and
> >>>> the WiP gpio-sim - but it's the same on most DT platforms. The node
> >>>> that contains the `gpio-line-names` is the one associated with the
> >>>> platform device passed to the GPIO driver. The gpiolib then creates
> >>>> another struct device that becomes the child of that node but it
> >>>> doesn't copy the parent's properties to it (nor should it).
> >>>>
> >>>> Every driver that reads device properties does it from the parent
> >>>> device, not the one in gdev - whether it uses of_, fwnode_ or generic
> >>>> device_ properties.
> >>>
> >>> What you are telling contradicts with the idea of copying parent's fwnode
> >>> (or OF node) in the current code.
> >>>
> >>
> >> Ha! While the OF node of the parent device is indeed assigned to the
> >> gdev's dev, the same isn't done in the core code for fwnodes and
> >> simulated chips don't have an associated OF node, so this is the
> >> culprit I suppose.
> >
> > Close, but not fully correct.
> > First of all it depends on the OF / ACPI / platform enumeration.
> > Second, we are talking about secondary fwnode in the case where it happens.
> >
> > I'm in the middle of debugging this, I'll come up with something soon I believe.
>
> Was there ever any follow up on this ?
>
> I would like to point out that on STM32MP1 in Linux 5.10.y, the
> gpio-line-names are still broken, and a revert of "gpiolib: generalize
> devprop_gpiochip_set_names() for device properties" is still necessary.

Yes, Andy has fixed that in commit b41ba2ec54a7 ("gpiolib: Read
"gpio-line-names" from a firmware node") but for some reason this has
never made its way into stable. I'll resend it.

Bartosz
