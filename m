Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8376463DDC
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Nov 2021 19:32:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245495AbhK3SgC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Nov 2021 13:36:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245189AbhK3SgA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Nov 2021 13:36:00 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F755C061748
        for <linux-gpio@vger.kernel.org>; Tue, 30 Nov 2021 10:32:40 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id r25so25249605edq.7
        for <linux-gpio@vger.kernel.org>; Tue, 30 Nov 2021 10:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Go/81xVzZnhSKrXXt1Oku01bzv41r4nEoZnz9LX/CNo=;
        b=V5A5u+2GJDz6goQ4POTOs+NBG96bqznhfM/KNENVTWUYwRiTOswVz1gYaBOW5Jdw0q
         xKXHYsiHbDIYScUFk5YmP/+BPgJyaQoj3UBRv1nwT2PLv6pYM1fqWUKw5hWLwQo5F9Ej
         pWmSm5c16Vb+vRKprQtqmQGj+O+PpqPeyIN2dXTPcT0xTrghz5CSHCRMZj33yT37o3ih
         /PIsR/MYbu98FVysewGtFjF/wgV6XJoiiR7dzPELKRxQrUbD1Hpfl6qI9GMrlimByGUp
         4l0vmkrWH4D9oq1e87xf1yHyblam+n2mk8ng4PywvXP6acObKSIi/SENMb3OUXDtUJ8V
         oelw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Go/81xVzZnhSKrXXt1Oku01bzv41r4nEoZnz9LX/CNo=;
        b=FjiaXozFZCkHYN+NhyiotMTcAhiQqpy+QHmwJKkpCAoBFq9jH+rp3mzdaAfREVGssy
         YkMrCdy7Rn5XzUNjVGm7XGS2hXaJMdR+AzfjvSb41hYhXcA7V5bY1ihwnN+wSsFgF81p
         gE/CIMA6lsoZmnovNZcupprE1MJb8xzcbJwI6ZLRs9lyYwCtf7zH4lyEVJBz3XXVPSfS
         AL01zeggJoOQsYeTftmg3tFd9ULF5YAQUPcO2V85XlQg1S/EcYv/td00x7wDIDY3zo5t
         RUBzhRV8IcG1Jx45TKGmCpab6msp5efrjrVHjhcGjl/EPjom/g/GHdi7ljpLeggiID8a
         G90w==
X-Gm-Message-State: AOAM532u2hsKv/r39pzWtv47BCZAUHba1lsWwmfhqZkq3XX+d7y/8wSD
        k07hNUdnO7P/sF94WG2ZUvW0SiHKK1qtwZQt7F/MRQ==
X-Google-Smtp-Source: ABdhPJzWYR3y3DREARkuzeXWj5zsrF63zUTM2SaKSKHvEtDMUJDBwG2a3cN0weWZRSrCI2BUf/z2HjoeN5LJ/KjYfYk=
X-Received: by 2002:a17:907:c15:: with SMTP id ga21mr860248ejc.349.1638297158632;
 Tue, 30 Nov 2021 10:32:38 -0800 (PST)
MIME-Version: 1.0
References: <20211130154127.12272-1-brgl@bgdev.pl> <20211130154127.12272-3-brgl@bgdev.pl>
 <YaZNyMV5gX5cZpar@smile.fi.intel.com> <YaZPACT53i4LovrM@smile.fi.intel.com>
In-Reply-To: <YaZPACT53i4LovrM@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 30 Nov 2021 19:32:28 +0100
Message-ID: <CAMRc=MdRMeyzonY+AZa8CWfh6Bk64e3OXAmGk3X=rx=DrM4-mw@mail.gmail.com>
Subject: Re: [PATCH v11 2/6] gpiolib: allow to specify the firmware node in
 struct gpio_chip
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Shuah Khan <shuah@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 30, 2021 at 5:20 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Nov 30, 2021 at 06:14:01PM +0200, Andy Shevchenko wrote:
> > On Tue, Nov 30, 2021 at 04:41:23PM +0100, Bartosz Golaszewski wrote:
>
> ...
>
> > Not sure I understand the proposal. Can you provide couple of (simplest)
> > examples?
> >
> > And also it sounds like reinventing a wheel. What problem do you have that you
> > need to solve this way?
>
> Have you seen these:
>         drivers/gpio/gpio-dwapb.c
>         drivers/mfd/intel_quark_i2c_gpio.c
> ?
>
> GPIO driver has a main (controller level) node along with children on per bank
> basis. Currently it works with the provided approach (see second driver).
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Yep, I know dwapd. What happens in probe is that each bank device is
created using the properties from the associated child fwnode but the
parent device's fwnode is actually assigned as the gpiochip's fwnode.
This is logically wrong and OF doesn't do it - it assigns the child
of_node to the child device if gpio_chip->of_node is assigned in the
driver. I'm not sure if ACPI does this.

Non-OF drivers don't have a way to do this and this patch enables it.

I want to add it mostly because gpio-sim can then use the software
node to identify the device in the configfs by that software node but
IMO this is logically correct too.

Bart
