Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D815262BF4
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Sep 2020 11:35:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726408AbgIIJfb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Sep 2020 05:35:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726005AbgIIJfa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Sep 2020 05:35:30 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7252BC061573;
        Wed,  9 Sep 2020 02:35:29 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id u13so1679434pgh.1;
        Wed, 09 Sep 2020 02:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rUMM26Eh1qMtncc4/WqzQ8pK0qp9gOhr6F1dkKvdtyY=;
        b=ag+PT8ukrimDRfbfIhHjpeu42vFjqkYUuIKYM+2NOhMWllqqIG+lrGAPR+eWR3ukbb
         wMjuYhiFTZwm+76ARlzbDxPsf0WDHllktjaOVyBOlACtSw2ufmT/blFrMMuXcxK+QTBt
         RnPLTFrgVdZVj4qN+gDive0hoVNgC29g/TthTgiJ+Cf0vuQgOImfS4bY2gXwqF6zyHjF
         DPMrj7qSJQTeU0JzsINVCHJ9HnC/uYN/nKJYF85qLEAafvJU/FWfYt5ybiXsVqHdqcCo
         tfjrg78U6InYv+ChZ3R3jObFqcEVnse7cvRDksgP7Pk6894y9zXHTv0obs1cajgkZ1D9
         Uwjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rUMM26Eh1qMtncc4/WqzQ8pK0qp9gOhr6F1dkKvdtyY=;
        b=YhBKGge6CRyeXUv7OqqPYFcTdq/IgF6xJN/4mEsWVZEd/zLKLNMd9E1TFmL3ogOGH+
         nK1LBwqB+0lC2OJFbv8JcJlXIR4I+FiTVymrsVRkTIvlqIARilboGp5UWV3q6GR02NMz
         dgOUMt/VU5UK464+Pggbt/IakwsFel5M8SRF9TgY9ASlE6bcr3nQzLEq7CCLBti4vah5
         bN6zzkLg9L7N8id/F+Cm0i/Tyv+IIIeizT9vHtdh3XhGHfWY/hMSK7L8UsYP/4OImsuC
         QvMG8854Ow1KQD1M2gRQwKFp79mj2bhHWc5PGAp1bggT5WX7JXBG60DSEDZzlv9rbZdF
         aKbg==
X-Gm-Message-State: AOAM532eMYqXlP1SMauZlfECGJWaqJmY1vo9Q8nPZgdzP/Gh+pgOiwbO
        ysy38vII5k0eSYzpiuFwhdKJ+6h76W8=
X-Google-Smtp-Source: ABdhPJyA6svORv5Yq4fMn/Aic/zR8YgAw5Q11Q3iouElifaENfaUmF+/ReJF8TNcqiZnpRVySxKtsw==
X-Received: by 2002:a17:902:ac8b:b029:d0:89f4:6220 with SMTP id h11-20020a170902ac8bb02900d089f46220mr89212plr.8.1599644128952;
        Wed, 09 Sep 2020 02:35:28 -0700 (PDT)
Received: from sol (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id r6sm2165019pfq.11.2020.09.09.02.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 02:35:28 -0700 (PDT)
Date:   Wed, 9 Sep 2020 17:35:23 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v7 07/20] gpiolib: cdev: support GPIO_V2_GET_LINE_IOCTL
 and GPIO_V2_LINE_GET_VALUES_IOCTL
Message-ID: <20200909093523.GA1506132@sol>
References: <20200905133549.24606-1-warthog618@gmail.com>
 <20200905133549.24606-8-warthog618@gmail.com>
 <20200909092401.GA1431678@sol>
 <CAMpxmJXh9pKMAXgPWSCPXeyjP0CSo=A5SgLPrL2eRxX-LAyKag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMpxmJXh9pKMAXgPWSCPXeyjP0CSo=A5SgLPrL2eRxX-LAyKag@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 09, 2020 at 11:26:00AM +0200, Bartosz Golaszewski wrote:
> On Wed, Sep 9, 2020 at 11:24 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Sat, Sep 05, 2020 at 09:35:36PM +0800, Kent Gibson wrote:
> > > Add support for requesting lines using the GPIO_V2_GET_LINE_IOCTL, and
> > > returning their current values using GPIO_V2_LINE_GET_VALUES_IOCTL.
> > >
> > > The struct linereq implementation is based on the v1 struct linehandle
> > > implementation.
> > >
> > > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > > ---
> > >
> >
> > [snip]
> >
> > >               if (copy_from_user(&offset, ip, sizeof(offset)))
> > >                       return -EFAULT;
> > > @@ -1104,6 +1505,25 @@ int gpiolib_cdev_register(struct gpio_device *gdev, dev_t devt)
> > >                MAJOR(devt), gdev->id);
> > >
> > >       return 0;
> > > +     /*
> > > +      * array sizes must ensure 64-bit alignment and not create holes in
> > > +      * the struct packing.
> > > +      */
> > > +     BUILD_BUG_ON(IS_ALIGNED(GPIO_V2_LINES_MAX, 2));
> > > +     BUILD_BUG_ON(IS_ALIGNED(GPIO_MAX_NAME_SIZE, 8));
> > > +
> > > +     /*
> > > +      * check that uAPI structs are 64-bit aligned for 32/64-bit
> > > +      * compatibility
> > > +      */
> > > +     BUILD_BUG_ON(IS_ALIGNED(sizeof(struct gpio_v2_line_attribute), 8));
> > > +     BUILD_BUG_ON(IS_ALIGNED(sizeof(struct gpio_v2_line_config_attribute), 8));
> > > +     BUILD_BUG_ON(IS_ALIGNED(sizeof(struct gpio_v2_line_config), 8));
> > > +     BUILD_BUG_ON(IS_ALIGNED(sizeof(struct gpio_v2_line_request), 8));
> > > +     BUILD_BUG_ON(IS_ALIGNED(sizeof(struct gpio_v2_line_info), 8));
> > > +     BUILD_BUG_ON(IS_ALIGNED(sizeof(struct gpio_v2_line_info_changed), 8));
> > > +     BUILD_BUG_ON(IS_ALIGNED(sizeof(struct gpio_v2_line_event), 8));
> > > +     BUILD_BUG_ON(IS_ALIGNED(sizeof(struct gpio_v2_line_values), 8));
> > >  }
> > >
> >
> > A couple of things here - these should all be !IS_ALIGNED.
> > And the BUILD_BUG_ON gets compiled out, and so doesn't fail, if they are
> > after the return.
> >
> > How would you like that fixed - v8 or a patch once v7 is in?
> >
> > Cheers,
> > Kent.
> 
> v8 please. Why is it compiled out though? Does it need some config option?
> 

Not sure - haven't looked into it.  I only noticed the condition was
inverted in passing, and when I flipped it it still compiled.
Moving the return to the end of the function made them all fail,
as they should if IS_ALIGNED is true.

Having BUILD_BUG_ON being able to compile out quietly is a problem in
itself.  Nothing special in my setup that I am aware of.

Cheers,
Kent.
