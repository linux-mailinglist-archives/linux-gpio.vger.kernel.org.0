Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6246262C71
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Sep 2020 11:49:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726605AbgIIJtP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Sep 2020 05:49:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726005AbgIIJtN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Sep 2020 05:49:13 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CE4AC061573;
        Wed,  9 Sep 2020 02:49:12 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id u13so1702887pgh.1;
        Wed, 09 Sep 2020 02:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Ui6wdAkLPmIGVZc/XTe51VcL+XWEI5jxee8nxyq2t0Q=;
        b=QYtMSabFIGqB7+Sw3QDcgw7vUDTBo0IG1wW2a9ylFbisyzlkRX7q7ger15wG9T+nLa
         AOGGBaf1JeMtFEK40bwn4vJO8rN4InlVCzp/lYRu6ZhdrmM8VtpSAjMi+uPxb1FZZB+p
         fuai9uuNMv1qVptZX++76hmY3ziDGiHezQzVWP+rO2S8TiNw0qNTcr/yVoq53l3EvPXx
         +abma0MYLzYMNa1KnmVkVu9iI5CfMFPf+ozBPmWQH7cOc6dQQEzDdkqT3OdVp6XiGmSf
         1PrXGT6F9b01+MRQ36QB/WXpTMkWymEnuG2XrZ0gFDpZfUVSTzvYU2sX0YOxQsKWNcoa
         b5mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ui6wdAkLPmIGVZc/XTe51VcL+XWEI5jxee8nxyq2t0Q=;
        b=bMWu9KGaTdQoJVcEopEy0kHfv8A3vmJBXEzeHQG3MA6FD49CUZ19Ra2f+i+CAfbr9h
         W0W5ybIXs2NGzv0Qj2Px6esOIA1F7GOEcpLyFsjg+hoAKSbRgzlox3+qX3LQQCFV/XCv
         dsNVRI8+qnJSTUUq2OuqNvFyfyI9hKvIYDmpspONY62Rs52BVRePQLMoCFBw+x325qBK
         FQvXpx/bZzucnNVz2JoIdDKWLOO9lI+gSCjwJMXo7pbqhtiVcMT3Vz+/W3aHmEj8GMiw
         UqVknSbqdh/iW0HBAavLqOMpMyLbtPkjAdshFdBA8DonH3Mx+5PtVJFp7WO+nz8bSBEW
         vZLg==
X-Gm-Message-State: AOAM530V3pglewjCUWiIkZVg4/7cX8s4331uEiY1AtboZUSMd21q5i5Y
        4osFB/MF4+waXHKnbAZc9N8=
X-Google-Smtp-Source: ABdhPJzhyEFk3jQ+icqIaETDFC8xxnIRyvj9MGcQp5GnV73bajiuBmQ9pCYR5vPppL/HDaPQw10NrA==
X-Received: by 2002:a65:5502:: with SMTP id f2mr20108pgr.418.1599644951847;
        Wed, 09 Sep 2020 02:49:11 -0700 (PDT)
Received: from sol (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id c199sm2147138pfc.128.2020.09.09.02.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 02:49:11 -0700 (PDT)
Date:   Wed, 9 Sep 2020 17:49:06 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v7 07/20] gpiolib: cdev: support GPIO_V2_GET_LINE_IOCTL
 and GPIO_V2_LINE_GET_VALUES_IOCTL
Message-ID: <20200909094906.GA1550063@sol>
References: <20200905133549.24606-1-warthog618@gmail.com>
 <20200905133549.24606-8-warthog618@gmail.com>
 <20200909092401.GA1431678@sol>
 <CAMpxmJXh9pKMAXgPWSCPXeyjP0CSo=A5SgLPrL2eRxX-LAyKag@mail.gmail.com>
 <20200909093523.GA1506132@sol>
 <CAMpxmJVU9ZniBjFSuhYYaDLUX1jeYeEjYJzdoy06J24SiVNn3w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMpxmJVU9ZniBjFSuhYYaDLUX1jeYeEjYJzdoy06J24SiVNn3w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 09, 2020 at 11:41:35AM +0200, Bartosz Golaszewski wrote:
> On Wed, Sep 9, 2020 at 11:35 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Wed, Sep 09, 2020 at 11:26:00AM +0200, Bartosz Golaszewski wrote:
> > > On Wed, Sep 9, 2020 at 11:24 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > >
> > > > On Sat, Sep 05, 2020 at 09:35:36PM +0800, Kent Gibson wrote:
> > > > > Add support for requesting lines using the GPIO_V2_GET_LINE_IOCTL, and
> > > > > returning their current values using GPIO_V2_LINE_GET_VALUES_IOCTL.
> > > > >
> > > > > The struct linereq implementation is based on the v1 struct linehandle
> > > > > implementation.
> > > > >
> > > > > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > > > > ---
> > > > >
> > > >
> > > > [snip]
> > > >
> > > > >               if (copy_from_user(&offset, ip, sizeof(offset)))
> > > > >                       return -EFAULT;
> > > > > @@ -1104,6 +1505,25 @@ int gpiolib_cdev_register(struct gpio_device *gdev, dev_t devt)
> > > > >                MAJOR(devt), gdev->id);
> > > > >
> > > > >       return 0;
> > > > > +     /*
> > > > > +      * array sizes must ensure 64-bit alignment and not create holes in
> > > > > +      * the struct packing.
> > > > > +      */
> > > > > +     BUILD_BUG_ON(IS_ALIGNED(GPIO_V2_LINES_MAX, 2));
> > > > > +     BUILD_BUG_ON(IS_ALIGNED(GPIO_MAX_NAME_SIZE, 8));
> > > > > +
> > > > > +     /*
> > > > > +      * check that uAPI structs are 64-bit aligned for 32/64-bit
> > > > > +      * compatibility
> > > > > +      */
> > > > > +     BUILD_BUG_ON(IS_ALIGNED(sizeof(struct gpio_v2_line_attribute), 8));
> > > > > +     BUILD_BUG_ON(IS_ALIGNED(sizeof(struct gpio_v2_line_config_attribute), 8));
> > > > > +     BUILD_BUG_ON(IS_ALIGNED(sizeof(struct gpio_v2_line_config), 8));
> > > > > +     BUILD_BUG_ON(IS_ALIGNED(sizeof(struct gpio_v2_line_request), 8));
> > > > > +     BUILD_BUG_ON(IS_ALIGNED(sizeof(struct gpio_v2_line_info), 8));
> > > > > +     BUILD_BUG_ON(IS_ALIGNED(sizeof(struct gpio_v2_line_info_changed), 8));
> > > > > +     BUILD_BUG_ON(IS_ALIGNED(sizeof(struct gpio_v2_line_event), 8));
> > > > > +     BUILD_BUG_ON(IS_ALIGNED(sizeof(struct gpio_v2_line_values), 8));
> > > > >  }
> > > > >
> > > >
> > > > A couple of things here - these should all be !IS_ALIGNED.
> > > > And the BUILD_BUG_ON gets compiled out, and so doesn't fail, if they are
> > > > after the return.
> > > >
> > > > How would you like that fixed - v8 or a patch once v7 is in?
> > > >
> > > > Cheers,
> > > > Kent.
> > >
> > > v8 please. Why is it compiled out though? Does it need some config option?
> > >
> >
> > Not sure - haven't looked into it.  I only noticed the condition was
> > inverted in passing, and when I flipped it it still compiled.
> > Moving the return to the end of the function made them all fail,
> > as they should if IS_ALIGNED is true.
> >
> > Having BUILD_BUG_ON being able to compile out quietly is a problem in
> > itself.  Nothing special in my setup that I am aware of.
> >
> > Cheers,
> > Kent.
> 
> From include/linux/compiler_types.h:
> 
> 295 #ifdef __OPTIMIZE__
> 296 # define __compiletime_assert(condition, msg, prefix, suffix)           \
> 297         do {                                                            \
> 298                 extern void prefix ## suffix(void)
> __compiletime_error(msg); \
> 299                 if (!(condition))                                       \
> 300                         prefix ## suffix();                             \
> 301         } while (0)
> 302 #else
> 303 # define __compiletime_assert(condition, msg, prefix, suffix) do {
> } while (0)
> 304 #endif
> 
> __OPTIMIZE__ is a predefined macro. I'm not sure about your setup but
> it it's defined for me in all my yocto SDK builds and BUILD_BUG_ON(1)
> fails as expected.
> 

Even when placed after the return, as was the case here?

Kent.
