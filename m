Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FF8B262C22
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Sep 2020 11:41:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727055AbgIIJls (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Sep 2020 05:41:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726169AbgIIJlr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Sep 2020 05:41:47 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 907FEC061755
        for <linux-gpio@vger.kernel.org>; Wed,  9 Sep 2020 02:41:47 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id ay8so1955737edb.8
        for <linux-gpio@vger.kernel.org>; Wed, 09 Sep 2020 02:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T5ZH6tpiwfQ5fkv123INJrXWMFwMdaXrCNUYVgSIWI4=;
        b=xLBTyw9anFQR+Kd7rhXDv95SHUeqRvsrFyIPWyC7lK4IT43ttofu28gInL/oBJiZHG
         zY0xcKEvl/VlNT2DvH8wR+R1NvWnawwteul+afp80y/DIXoj7Pg+m+Dk5S9NRGQZQxJS
         e3InbabcRiDRO0ykYIFEHeVHlRRsaB6EVELbndvv/AbXHqDGczyL3wbT3c0DjtochAGD
         WPKU4F9e//wlu2KdPwBkspVAGF31KAgd28zIx9sY3MgctFYl1wLfgwpxzyUBUz9Avkwc
         nCg7/9jvn+LPUzuKp30mDjgcu9Vy1qVz1sbXBBdhkpamrbRszAwwQQ008ompPs/NYAh3
         Lsyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T5ZH6tpiwfQ5fkv123INJrXWMFwMdaXrCNUYVgSIWI4=;
        b=Amb5mqWiMyKNTNjUV/N98xWyF+NM5+2By/9HxLpzXXagFhlZNQJE8AUiKnvxP/xcHE
         sDCh2vAG0NeqBdwQBidQmxsjyYzMOh73Fj5HIX6lpnEUBwP7JENk7uXjvxzRq/IqzaoH
         yLomSk55NK5CfwVayVAln2BH3HWdAAHObDD4IZsdQIIQO/Dd8RIUUIzOM6Yz/p+COzqw
         zDo8m77chHu6m8ll8yktHmeTRGajcHsd/8LpKc5q2/EkA0i1iUJRv9qsD2R5UjwO9IU6
         6rvpQlVbTJ0pHCcmsdNhZwy0nOnH/PS1aCn87M9FgluzIvMWo79M12/JseWLPMe6blGz
         F+Kw==
X-Gm-Message-State: AOAM532zUgC4RvdiK86me011uIlKYQqOTFwr/fdDmtJLEgzluW5VfRAq
        me42c20wp6lRUKZ/iJVCUDjfms1LCxXi/kIiEJLTpHMP+GBv2A==
X-Google-Smtp-Source: ABdhPJywjOk7vZxGOJJADXbQK4tIIqhiK4TeZPZSPtyi3/XubxpIX3IXQbGCy9TL1N/HXNeWieEVbbkpxJTBGX+go9I=
X-Received: by 2002:a50:99d5:: with SMTP id n21mr3214899edb.88.1599644506197;
 Wed, 09 Sep 2020 02:41:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200905133549.24606-1-warthog618@gmail.com> <20200905133549.24606-8-warthog618@gmail.com>
 <20200909092401.GA1431678@sol> <CAMpxmJXh9pKMAXgPWSCPXeyjP0CSo=A5SgLPrL2eRxX-LAyKag@mail.gmail.com>
 <20200909093523.GA1506132@sol>
In-Reply-To: <20200909093523.GA1506132@sol>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 9 Sep 2020 11:41:35 +0200
Message-ID: <CAMpxmJVU9ZniBjFSuhYYaDLUX1jeYeEjYJzdoy06J24SiVNn3w@mail.gmail.com>
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

On Wed, Sep 9, 2020 at 11:35 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Wed, Sep 09, 2020 at 11:26:00AM +0200, Bartosz Golaszewski wrote:
> > On Wed, Sep 9, 2020 at 11:24 AM Kent Gibson <warthog618@gmail.com> wrote:
> > >
> > > On Sat, Sep 05, 2020 at 09:35:36PM +0800, Kent Gibson wrote:
> > > > Add support for requesting lines using the GPIO_V2_GET_LINE_IOCTL, and
> > > > returning their current values using GPIO_V2_LINE_GET_VALUES_IOCTL.
> > > >
> > > > The struct linereq implementation is based on the v1 struct linehandle
> > > > implementation.
> > > >
> > > > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > > > ---
> > > >
> > >
> > > [snip]
> > >
> > > >               if (copy_from_user(&offset, ip, sizeof(offset)))
> > > >                       return -EFAULT;
> > > > @@ -1104,6 +1505,25 @@ int gpiolib_cdev_register(struct gpio_device *gdev, dev_t devt)
> > > >                MAJOR(devt), gdev->id);
> > > >
> > > >       return 0;
> > > > +     /*
> > > > +      * array sizes must ensure 64-bit alignment and not create holes in
> > > > +      * the struct packing.
> > > > +      */
> > > > +     BUILD_BUG_ON(IS_ALIGNED(GPIO_V2_LINES_MAX, 2));
> > > > +     BUILD_BUG_ON(IS_ALIGNED(GPIO_MAX_NAME_SIZE, 8));
> > > > +
> > > > +     /*
> > > > +      * check that uAPI structs are 64-bit aligned for 32/64-bit
> > > > +      * compatibility
> > > > +      */
> > > > +     BUILD_BUG_ON(IS_ALIGNED(sizeof(struct gpio_v2_line_attribute), 8));
> > > > +     BUILD_BUG_ON(IS_ALIGNED(sizeof(struct gpio_v2_line_config_attribute), 8));
> > > > +     BUILD_BUG_ON(IS_ALIGNED(sizeof(struct gpio_v2_line_config), 8));
> > > > +     BUILD_BUG_ON(IS_ALIGNED(sizeof(struct gpio_v2_line_request), 8));
> > > > +     BUILD_BUG_ON(IS_ALIGNED(sizeof(struct gpio_v2_line_info), 8));
> > > > +     BUILD_BUG_ON(IS_ALIGNED(sizeof(struct gpio_v2_line_info_changed), 8));
> > > > +     BUILD_BUG_ON(IS_ALIGNED(sizeof(struct gpio_v2_line_event), 8));
> > > > +     BUILD_BUG_ON(IS_ALIGNED(sizeof(struct gpio_v2_line_values), 8));
> > > >  }
> > > >
> > >
> > > A couple of things here - these should all be !IS_ALIGNED.
> > > And the BUILD_BUG_ON gets compiled out, and so doesn't fail, if they are
> > > after the return.
> > >
> > > How would you like that fixed - v8 or a patch once v7 is in?
> > >
> > > Cheers,
> > > Kent.
> >
> > v8 please. Why is it compiled out though? Does it need some config option?
> >
>
> Not sure - haven't looked into it.  I only noticed the condition was
> inverted in passing, and when I flipped it it still compiled.
> Moving the return to the end of the function made them all fail,
> as they should if IS_ALIGNED is true.
>
> Having BUILD_BUG_ON being able to compile out quietly is a problem in
> itself.  Nothing special in my setup that I am aware of.
>
> Cheers,
> Kent.

From include/linux/compiler_types.h:

295 #ifdef __OPTIMIZE__
296 # define __compiletime_assert(condition, msg, prefix, suffix)           \
297         do {                                                            \
298                 extern void prefix ## suffix(void)
__compiletime_error(msg); \
299                 if (!(condition))                                       \
300                         prefix ## suffix();                             \
301         } while (0)
302 #else
303 # define __compiletime_assert(condition, msg, prefix, suffix) do {
} while (0)
304 #endif

__OPTIMIZE__ is a predefined macro. I'm not sure about your setup but
it it's defined for me in all my yocto SDK builds and BUILD_BUG_ON(1)
fails as expected.

Bartosz
