Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A72527136F
	for <lists+linux-gpio@lfdr.de>; Sun, 20 Sep 2020 13:12:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726290AbgITLMK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 20 Sep 2020 07:12:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726262AbgITLMK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 20 Sep 2020 07:12:10 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99A16C061755;
        Sun, 20 Sep 2020 04:12:10 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id t7so5695094pjd.3;
        Sun, 20 Sep 2020 04:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SK3azXNEl6yyJpFq5d1iG5zYYrlyno7Q8Ly4/yE9BOw=;
        b=n6+rQwSl1SrCYFdOOctb8jo002SA1KxyLmOokDezLuQi+zK4b9DqigFXhppot6OT6U
         FzkYUI8U4gUr2QCMDpKZxrbtU67rOmxWoWN4bkk7hiR5h9mhB4xDeLkqkOlXLHwd7SUv
         37z3mreIRiM2OGDTAcZ5Vmdur61iTwrpCnpJnIIsxXajBGH1m1Ts4FLbpPXipaz/sVvk
         3nUOwfx2aOYTksA1tzaNhY7phJnfuKL3xIE2K6Wgp+Eibe3qUKljivBSxdedUIYb2CtL
         UeYMWF3ibd1Iv2pULnKqMqrK/zuLOo72imdf5kXZSuaeXZStxRV37yHMZtqFjKv4lVAN
         i5Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SK3azXNEl6yyJpFq5d1iG5zYYrlyno7Q8Ly4/yE9BOw=;
        b=t5EwD+A8vY546ObXZJzAgN+gKQLmakY3RKYG+PJfEivF0DT0Ibtsf49fr0I9gSB4Io
         DY/aWMKSNES+R1yq09t6fvB3CsQCsuecox7q381zQvNfMFee3g0rDXzL7anSGzgEUsGT
         YKCaOGeKQfR08kVnetMYawZuy55yqfqDsj2K35tBDEjug9cNvGBAh+lO+EFgufuuyqAW
         fc+B6fPoegf06ooLwjHyBrSof0BKDkh0dwgOlN46DR/p1T/uEeNOgNNHeJpwXieQ2rUL
         5Y0d5Nhp7nId8YY8nAnYRNUpJIhVuhO2GfP30CLUsb9GlIkV6t0COAjOKhe/vpLYykNW
         OXRA==
X-Gm-Message-State: AOAM531YSayh8/mWe1Lv6tG1RuxkBriGZ2lvMd5BYFKJ0dUiK5lug0LI
        dU7eK/kQI++HMPIL35V5lZCm7yWdtDA=
X-Google-Smtp-Source: ABdhPJyFAoID7PRDy1inYmvnuEgVJulyUyCgaasKVkQI/AEnllQRjdzPTg+beyPuTWM5cLVTgrOk6w==
X-Received: by 2002:a17:90a:c83:: with SMTP id v3mr20130659pja.229.1600600329910;
        Sun, 20 Sep 2020 04:12:09 -0700 (PDT)
Received: from sol (106-69-189-59.dyn.iinet.net.au. [106.69.189.59])
        by smtp.gmail.com with ESMTPSA id j13sm5469374pjn.14.2020.09.20.04.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2020 04:12:09 -0700 (PDT)
Date:   Sun, 20 Sep 2020 19:12:04 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v7 07/20] gpiolib: cdev: support GPIO_V2_GET_LINE_IOCTL
 and GPIO_V2_LINE_GET_VALUES_IOCTL
Message-ID: <20200920111204.GB793608@sol>
References: <20200905133549.24606-1-warthog618@gmail.com>
 <20200905133549.24606-8-warthog618@gmail.com>
 <CAHp75Vdm=61wibz70ScvayXk_D77rZw_pG7wPkLXkbkzagRPNA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vdm=61wibz70ScvayXk_D77rZw_pG7wPkLXkbkzagRPNA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 15, 2020 at 01:31:27PM +0300, Andy Shevchenko wrote:
> On Sat, Sep 5, 2020 at 4:49 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > Add support for requesting lines using the GPIO_V2_GET_LINE_IOCTL, and
> > returning their current values using GPIO_V2_LINE_GET_VALUES_IOCTL.
> >
> > The struct linereq implementation is based on the v1 struct linehandle
> > implementation.
> >
> > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > ---
> >

[snip]
> 
> > +       /* Bias requires explicit direction. */
> > +       if ((flags & GPIO_V2_LINE_BIAS_FLAGS) &&
> > +           !(flags & GPIO_V2_LINE_DIRECTION_FLAGS))
> > +               return -EINVAL;
> 
> Why is this? If I request a line as is and after set a bias, should I
> really care about direction?
> 

Yeah, you probably should be aware of the direction if they are setting
the bias, so this makes sure they are.

The practical reason is that gpiod_direction_output() or
gpiod_direction_input() have to be called to set the bias, and they are
only called if the corresponding flag is set.

> 
> > +       for (num_get = 0, i = 0; i < lr->num_lines; i++) {
> > +               if (lv.mask & BIT_ULL(i)) {
> 
> for_each_set_bit() ?
> 

No - lv.mask is u64, not unsigned long.
You could do a cast, but it would break on BE-32.
Sound familar? - you caught me doing just that in your review of an earlier
version.

> > +       ulr.consumer[sizeof(ulr.consumer)-1] = '\0';
> > +       if (strlen(ulr.consumer)) {
> > +               lr->label = kstrdup(ulr.consumer, GFP_KERNEL);
> 
> Sounds like kstrndup()
> 

Been here before too - they differ slightly in that here lr->label is
left null if consumer is empty,  whereas kstrndup() would alloc one byte
just for the null terminator.

> > +               }
> > +
> > +               blocking_notifier_call_chain(&desc->gdev->notifier,
> > +                                            GPIOLINE_CHANGED_REQUESTED, desc);
> > +
> 
> > +               dev_dbg(&gdev->dev, "registered chardev handle for line %d\n",
> > +                       offset);
> 
> Hmm... I would rather see trace events / points than new dev_dbg() /
> pr_debug() calls.
> 

Agreed - it is on the TODO list.
I have looked at it and doing it properly would mean adding tracepoints
to gpiolib.c, and modifying the v1 code as well, so it is best done in a
separate patch later...

> > @@ -1104,6 +1505,25 @@ int gpiolib_cdev_register(struct gpio_device *gdev, dev_t devt)
> >                  MAJOR(devt), gdev->id);
> >
> >         return 0;
> > +       /*
> > +        * array sizes must ensure 64-bit alignment and not create holes in
> > +        * the struct packing.
> > +        */
> > +       BUILD_BUG_ON(IS_ALIGNED(GPIO_V2_LINES_MAX, 2));
> > +       BUILD_BUG_ON(IS_ALIGNED(GPIO_MAX_NAME_SIZE, 8));
> > +
> > +       /*
> > +        * check that uAPI structs are 64-bit aligned for 32/64-bit
> > +        * compatibility
> > +        */
> > +       BUILD_BUG_ON(IS_ALIGNED(sizeof(struct gpio_v2_line_attribute), 8));
> > +       BUILD_BUG_ON(IS_ALIGNED(sizeof(struct gpio_v2_line_config_attribute), 8));
> > +       BUILD_BUG_ON(IS_ALIGNED(sizeof(struct gpio_v2_line_config), 8));
> > +       BUILD_BUG_ON(IS_ALIGNED(sizeof(struct gpio_v2_line_request), 8));
> > +       BUILD_BUG_ON(IS_ALIGNED(sizeof(struct gpio_v2_line_info), 8));
> > +       BUILD_BUG_ON(IS_ALIGNED(sizeof(struct gpio_v2_line_info_changed), 8));
> > +       BUILD_BUG_ON(IS_ALIGNED(sizeof(struct gpio_v2_line_event), 8));
> > +       BUILD_BUG_ON(IS_ALIGNED(sizeof(struct gpio_v2_line_values), 8));
> 
> Can we use static_assert() at the top of the file? Presumably after
> inclusion block.
> 

Good idea - will do.

Cheers,
Kent.

