Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 001DB262CA0
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Sep 2020 11:55:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728611AbgIIJzI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Sep 2020 05:55:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728207AbgIIJzD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Sep 2020 05:55:03 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95BADC061755
        for <linux-gpio@vger.kernel.org>; Wed,  9 Sep 2020 02:55:03 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id z22so2624345ejl.7
        for <linux-gpio@vger.kernel.org>; Wed, 09 Sep 2020 02:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GLnm6fS50/hG4SKqNnvGF+6eSY1pTc2O9uX9RZ49myk=;
        b=K0Bpd4sMj+C4pc3ZDNHmKtT83kJehH18+rcC+ENWJR7Oxn2a667as6qJrWgwW946bR
         Xg3jo8zS+WwbSp6UuDDzcGfAVPoO3/zzXOv+WIGcGP5p+vcsmovO933p+uslYiCCzkty
         +Trq8Kvp8WBhDgBwCwn0hYLR1iUCxXqu5LK10r900FFtFa/0seNDIG1T3rCCUSsaDVaf
         Vetd2+oj7M1izcXeBAc6kHf8GjeqlMNMxEk2DEHto7Rf3ckMKKdbG99GAIxxGHrqPTyE
         ELluZvF5z11vZqkF3aneOd537ITjr4bn9dJA9jwJ7Y+DpHwq6kbReij7/S31SLhSXWul
         huVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GLnm6fS50/hG4SKqNnvGF+6eSY1pTc2O9uX9RZ49myk=;
        b=iC82BnW8jOKmqQqZpxYjvXn+ycabh7MNGn3tIrT+76qpff9zDoJhpO1HoFcV1iL4h5
         ZO9Q7pQugM7xoezImi7bRNQhq+nE8ibcMrI5wLWUOffYlhxACtvUfYNqraJFhN2Is+hn
         vQsDrjIPVA3eFr60n9Ufo7RGouQpY3eRnKRvGDLsXhBiOXEi4joRKQJLePFAr68+syoF
         NLFU3FnkXuUcmUnNGab2pmOx5y51DT8vMhW9uQi6Pb/dCeGfwvMUJSRMkPI6IZc2gJbp
         Pz7pNn1ice6oTRjv3b4AIhGDuOOI1/ncsbISicLIkhMsCwc5GN4+HANgi9AlyvOgteua
         va4Q==
X-Gm-Message-State: AOAM531yzbajUm3y9aoDLQXID5AwfCfCV13GuoTwP6M4qFQSZUYfV6ac
        iXgMuXFgI7N+AWw1sFT1PEVWnu4x3B2m3cqDMRYaqA==
X-Google-Smtp-Source: ABdhPJxL+99GcGhuzKwHxoa0LAxKHs9SixyZqjkdSqQ9kwz+V7x2KhYagAkQzhnNRQyLJ94M10zhhK+zUOesCrOVsWY=
X-Received: by 2002:a17:906:c1c3:: with SMTP id bw3mr2741235ejb.516.1599645302156;
 Wed, 09 Sep 2020 02:55:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200905133549.24606-1-warthog618@gmail.com> <20200905133549.24606-8-warthog618@gmail.com>
 <20200909092401.GA1431678@sol> <CAMpxmJXh9pKMAXgPWSCPXeyjP0CSo=A5SgLPrL2eRxX-LAyKag@mail.gmail.com>
 <20200909093523.GA1506132@sol> <CAMpxmJVU9ZniBjFSuhYYaDLUX1jeYeEjYJzdoy06J24SiVNn3w@mail.gmail.com>
 <20200909094906.GA1550063@sol>
In-Reply-To: <20200909094906.GA1550063@sol>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 9 Sep 2020 11:54:51 +0200
Message-ID: <CAMpxmJVff+=qeLCottELYTF2yzykyvaoP=jxZ-vaNgCL-MA2CQ@mail.gmail.com>
Subject: Re: [PATCH v7 07/20] gpiolib: cdev: support GPIO_V2_GET_LINE_IOCTL
 and GPIO_V2_LINE_GET_VALUES_IOCTL
To:     Kent Gibson <warthog618@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 9, 2020 at 11:49 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Wed, Sep 09, 2020 at 11:41:35AM +0200, Bartosz Golaszewski wrote:
> > On Wed, Sep 9, 2020 at 11:35 AM Kent Gibson <warthog618@gmail.com> wrote:
> > >
> > > On Wed, Sep 09, 2020 at 11:26:00AM +0200, Bartosz Golaszewski wrote:
> > > > On Wed, Sep 9, 2020 at 11:24 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > > >
> > > > > On Sat, Sep 05, 2020 at 09:35:36PM +0800, Kent Gibson wrote:
> > > > > > Add support for requesting lines using the GPIO_V2_GET_LINE_IOCTL, and
> > > > > > returning their current values using GPIO_V2_LINE_GET_VALUES_IOCTL.
> > > > > >
> > > > > > The struct linereq implementation is based on the v1 struct linehandle
> > > > > > implementation.
> > > > > >
> > > > > > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > > > > > ---
> > > > > >
> > > > >
> > > > > [snip]
> > > > >
> > > > > >               if (copy_from_user(&offset, ip, sizeof(offset)))
> > > > > >                       return -EFAULT;
> > > > > > @@ -1104,6 +1505,25 @@ int gpiolib_cdev_register(struct gpio_device *gdev, dev_t devt)
> > > > > >                MAJOR(devt), gdev->id);
> > > > > >
> > > > > >       return 0;
> > > > > > +     /*
> > > > > > +      * array sizes must ensure 64-bit alignment and not create holes in
> > > > > > +      * the struct packing.
> > > > > > +      */
> > > > > > +     BUILD_BUG_ON(IS_ALIGNED(GPIO_V2_LINES_MAX, 2));
> > > > > > +     BUILD_BUG_ON(IS_ALIGNED(GPIO_MAX_NAME_SIZE, 8));
> > > > > > +
> > > > > > +     /*
> > > > > > +      * check that uAPI structs are 64-bit aligned for 32/64-bit
> > > > > > +      * compatibility
> > > > > > +      */
> > > > > > +     BUILD_BUG_ON(IS_ALIGNED(sizeof(struct gpio_v2_line_attribute), 8));
> > > > > > +     BUILD_BUG_ON(IS_ALIGNED(sizeof(struct gpio_v2_line_config_attribute), 8));
> > > > > > +     BUILD_BUG_ON(IS_ALIGNED(sizeof(struct gpio_v2_line_config), 8));
> > > > > > +     BUILD_BUG_ON(IS_ALIGNED(sizeof(struct gpio_v2_line_request), 8));
> > > > > > +     BUILD_BUG_ON(IS_ALIGNED(sizeof(struct gpio_v2_line_info), 8));
> > > > > > +     BUILD_BUG_ON(IS_ALIGNED(sizeof(struct gpio_v2_line_info_changed), 8));
> > > > > > +     BUILD_BUG_ON(IS_ALIGNED(sizeof(struct gpio_v2_line_event), 8));
> > > > > > +     BUILD_BUG_ON(IS_ALIGNED(sizeof(struct gpio_v2_line_values), 8));
> > > > > >  }
> > > > > >
> > > > >
> > > > > A couple of things here - these should all be !IS_ALIGNED.
> > > > > And the BUILD_BUG_ON gets compiled out, and so doesn't fail, if they are
> > > > > after the return.
> > > > >
> > > > > How would you like that fixed - v8 or a patch once v7 is in?
> > > > >
> > > > > Cheers,
> > > > > Kent.
> > > >
> > > > v8 please. Why is it compiled out though? Does it need some config option?
> > > >
> > >
> > > Not sure - haven't looked into it.  I only noticed the condition was
> > > inverted in passing, and when I flipped it it still compiled.
> > > Moving the return to the end of the function made them all fail,
> > > as they should if IS_ALIGNED is true.
> > >
> > > Having BUILD_BUG_ON being able to compile out quietly is a problem in
> > > itself.  Nothing special in my setup that I am aware of.
> > >
> > > Cheers,
> > > Kent.
> >
> > From include/linux/compiler_types.h:
> >
> > 295 #ifdef __OPTIMIZE__
> > 296 # define __compiletime_assert(condition, msg, prefix, suffix)           \
> > 297         do {                                                            \
> > 298                 extern void prefix ## suffix(void)
> > __compiletime_error(msg); \
> > 299                 if (!(condition))                                       \
> > 300                         prefix ## suffix();                             \
> > 301         } while (0)
> > 302 #else
> > 303 # define __compiletime_assert(condition, msg, prefix, suffix) do {
> > } while (0)
> > 304 #endif
> >
> > __OPTIMIZE__ is a predefined macro. I'm not sure about your setup but
> > it it's defined for me in all my yocto SDK builds and BUILD_BUG_ON(1)
> > fails as expected.
> >
>
> Even when placed after the return, as was the case here?
>
> Kent.

No of course not, I put it into a void function. Sorry for the noise.

I'm not sure how to disable optimizations for a macro.

For now putting it before return should be fine.

Bart
