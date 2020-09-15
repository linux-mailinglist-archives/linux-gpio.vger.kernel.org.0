Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E9D526B0DE
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Sep 2020 00:21:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727776AbgIOWVD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Sep 2020 18:21:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727693AbgIOQ3P (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Sep 2020 12:29:15 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B770BC061222
        for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2020 09:03:18 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id z23so5783601ejr.13
        for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2020 09:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c1lfPyfpR3MIdTzczk3F37y8kFkSG7QNcKC/F+53Umo=;
        b=hYng2VdXUMalsQlpbxvEaolvVrPXjjO1dg1IBNOJpR5POkg+h+5dS3w6ALmjl43QBv
         2kG3eFGBMkUjnyQkOgDNuJN6KiCSm2Xz+1UBa8swFgxPuWy5j8g7p8aPFbbzCNJUVgTi
         XTq9x3K52I7ybf36Z2pMDOaEp0SObYccGT0njIzOFGqscUVXUzET+d+qdoa70XNgeuIq
         ychiRQy9UO2BSe1I3ZkArwzDgmWXvpkEs/amhQ+IIrqVJ+u+TGU6vHxuH2Ocno64YMWW
         lWGLtShJwmSH8u00qJQXoTlVRtckLrfdDBCybJTNP4Ck/xv44l9uzkdhrjP9gzNWDaBx
         aRhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c1lfPyfpR3MIdTzczk3F37y8kFkSG7QNcKC/F+53Umo=;
        b=PPNX/yOD9m5R2EuwS9ct6DW0DVW1PE68AYtD4GS+fFyjAhrbxkxRrswwuQxEcxbPhL
         K1Xf6vHLHEFLwQsqSghRERn4yUl6hy8dzkfrCv7WwiYpt0mz5lkYcdbwqmVmVfz53CAN
         SBdn9X/W/eRavGRNltnda1CfjeH6mbO96lWhBDD6HRMKNmPm+xyb/qP5ms/QRlq2bcff
         czhHPYwlKaA0f21cDnbXiX6JPNk2+KXaWYtZSyXvtFNivnACYeEZWtIah8lf/tLe5i+r
         vI5M7LynADjcLygKKTt7zZemOG8OS6JxN345qiSeOmjofIVu/Z6uDOB8to336VSwTuvQ
         lbFQ==
X-Gm-Message-State: AOAM533xiVpZPmYoRIpLuePYBF5G+yQkI+/V3B298Gd3LqEIty462Eyl
        eVcYSrpBq1oiQT7hv6eGNHQT3ymxm9gfF5Ss4fHUOA==
X-Google-Smtp-Source: ABdhPJxYCowJHvOnUFmc3bdVZqbBgmz4hRM4SON4OjzOoHFhBUb9Zqenf9cirxMo9cDeB/QVoD9ttHN6GESWUQ8YGig=
X-Received: by 2002:a17:906:6007:: with SMTP id o7mr21824842ejj.550.1600185797421;
 Tue, 15 Sep 2020 09:03:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200908125813.8809-1-brgl@bgdev.pl> <CADYN=9+3kHG0CexzZiMQoXdF2piN2ZhOTObhY=7VCKrnFVN0Kw@mail.gmail.com>
 <20200915131228.GX3956970@smile.fi.intel.com> <20200915131648.GY3956970@smile.fi.intel.com>
In-Reply-To: <20200915131648.GY3956970@smile.fi.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 15 Sep 2020 18:03:06 +0200
Message-ID: <CAMpxmJUOhFjmFFq3sKZSh3QTjgZSGLhRRFt=iSzYAmXzNzupaw@mail.gmail.com>
Subject: Re: [PATCH 0/3] gpiolib: generalize GPIO line names property
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Anders Roxell <anders.roxell@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 15, 2020 at 3:16 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Sep 15, 2020 at 04:12:28PM +0300, Andy Shevchenko wrote:
> > On Tue, Sep 15, 2020 at 02:01:56PM +0200, Anders Roxell wrote:
> > > On Tue, 8 Sep 2020 at 18:40, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > > >
> > > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > >
> > > > I initially sent this as part of the gpio-mockup overhaul but since
> > > > these patches are indepentent and the work on gpio-mockup may become
> > > > more complicated - I'm sending these separately.
> > > >
> > > > The only change is adding additional property helpers to count strings
> > > > in array.
> > > >
> > > > Bartosz Golaszewski (3):
> > > >   device: property: add helpers to count items in string arrays
> > > >   gpiolib: generalize devprop_gpiochip_set_names() for device properties
> > > >   gpiolib: unexport devprop_gpiochip_set_names()
> >
> > Ha-ha, OF unittest is of_node centric. definitely there is no backed device.
> >
> > Bart, it seems we are stuck with fwnode interface.
>
> Hmm... There is a platform device. So, it means that it fails along these
> lines:
>   return IS_ENABLED(CONFIG_OF) && dev->of_node ? &dev->of_node->fwnode : dev->fwnode;
> so, who should set fwnode for of_node?
>

It's strange because the device for this unittest is registered
similarly to how we do it in gpio-mockup where this function works.
I've not investigated the internals but somewhere someone sets the
fwnode for these platform devices.

Bartosz
