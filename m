Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D49F27B056
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Sep 2020 16:52:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726578AbgI1Owi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Sep 2020 10:52:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726424AbgI1Owi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Sep 2020 10:52:38 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73469C061755
        for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2020 07:52:38 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id p15so8924698ejm.7
        for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2020 07:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pb2hEgRaRZDX0+sB29ngdH9rbWg1o3VgDq0s7JnHNBs=;
        b=FntVd3CAlGxvIH4D+noS3jlMmsCTpRkC5DCHq1JxdpEAXzkRTzYq261oz+W7Lof3vk
         hGokbGShQ01LM1tmcsHu+Hx//aZCwNyAU+V6nWjgmSn9sdxDcInd2Aue35dQbaKmZ9TZ
         NTJuZ8wCzV+W83TR6rvT+PfxVsyjAMsy6N8y8yiDtV9N6oKKLUgNwuYQXAQVY3eGFLh4
         NZ2BmJpg3yCZmeiMWUKJaN3uVcpI5+sBo+b0pNvWOFGFcOuDNh5ayN9eyEI2LEXmhRa/
         WZqvMztMmjoFxeg2m6w4QFLfng09t25Iv+k+WZG074s9e/uTZHlwMfK4p11mv8htlXZo
         tXNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pb2hEgRaRZDX0+sB29ngdH9rbWg1o3VgDq0s7JnHNBs=;
        b=KZto3sZJVMXEX9j8u8LIBSVjhQExjdWTZHM2nBOQh+ouOEJ4gJ5lptHGRKnshU8Kt+
         XXhYLd9l4ry0VTwJLlA7RsI695wRZ2ycCU2GOQJ2hr1lSd9g8Mc7d9mfHOd5aMSj+Xru
         ZfOK+4kAWGvthvRLilMjJLVWDmBB8ARBSubIyh2nQDVXbjTF4P4uyg6oPhE7lClZX1hE
         A9UvCnw85MKMPXYI74Yz+pk+fqkQEuGzL7PGr3JenVx32oSaY4zJOGnpvqTIwXjHWlEC
         lLaVl/pehkyRHqpelz3DYBt3rssxfEWzVls8PZdc330iEK/5LwnUrzC/U2RKTWvur9Va
         EhXw==
X-Gm-Message-State: AOAM531ffdWz4m1e3yyOaofQ502isUD6rVJXQlXr+OgGKCR4QpHp5adj
        B4VrvZI6Vkq5g+SADzXkq31XLFzwM5431Bdnn7YWgw==
X-Google-Smtp-Source: ABdhPJxAVB9xurPA1BXZAPcuQbV34dpBJ02LnYYlhE5yglFppCdXdT/R38mm7JohT1o0mbbC7O6T5vKvHG2sRQ3ukPE=
X-Received: by 2002:a17:906:fccb:: with SMTP id qx11mr2049874ejb.429.1601304756574;
 Mon, 28 Sep 2020 07:52:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200928104155.7385-1-brgl@bgdev.pl> <20200928104155.7385-8-brgl@bgdev.pl>
 <20200928130023.GJ3956970@smile.fi.intel.com> <CAMpxmJVGAe224JaXL4EmeEFV4Qv7ohjgn_W_CwPjC4MHgP4gTA@mail.gmail.com>
 <20200928140028.GO3956970@smile.fi.intel.com>
In-Reply-To: <20200928140028.GO3956970@smile.fi.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 28 Sep 2020 16:52:25 +0200
Message-ID: <CAMpxmJUMMia+b6DQ1KoZ70XPUzhutg1tnWF5PCvfaRF5-XQnVg@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] gpio: mockup: pass the chip label as device property
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Kent Gibson <warthog618@gmail.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 28, 2020 at 4:00 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Sep 28, 2020 at 03:13:53PM +0200, Bartosz Golaszewski wrote:
> > On Mon, Sep 28, 2020 at 3:00 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > On Mon, Sep 28, 2020 at 12:41:53PM +0200, Bartosz Golaszewski wrote:
> > > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > >
> > > > While we do check the "chip-name" property in probe(), we never actually
> > > > use it. Let's pass the chip label to the driver using device properties
> > > > as we'll want to allow users to define their own once dynamically
> > > > created chips are supported.
> > > >
> > > > The property is renamed to "chip-label" to not cause any confusion with
> > > > the actual chip name which is of the form: "gpiochipX".
> > > >
> >
> > ^^^ here, see below
> >
> > > > If the "chip-label" property is missing, let's do what most devices in
> > > > drivers/gpio/ do and use dev_name().
> > >
> > > ...
> > >
> > > > +             snprintf(chip_label, sizeof(chip_label),
> > > > +                      "gpio-mockup-%c", i + 'A');
> > > > +             properties[prop++] = PROPERTY_ENTRY_STRING("chip-label",
> > > > +                                                        chip_label);
> > >
> > > You added new property, now count is up to 4. But at the same time
> > >
> > >         #define GPIO_MOCKUP_MAX_PROP  4
> > >
> > > how do you avoid overflow?
> > >
> >
> > I renamed the property, the previous "chip-name" is no longer used. In
> > fact it was never used but was accounted for in GPIO_MOCKUP_MAX_PROP.
>
> Either I'm missing something or...
>
> Current code in linux-next has 3 properties to be possible
>
> PROPERTY_ENTRY_U32("gpio-base", base);
> PROPERTY_ENTRY_U16("nr-gpios", ngpio);
> PROPERTY_ENTRY_BOOL("named-gpio-lines");
>
> You adding here
> PROPERTY_ENTRY_STRING("chip-label", chip_label);
>
> Altogether after this patch is 4 which is maximum, but since array is passed by
> a solely pointer, the terminator is a must.
>

Thanks for explaining my code to me. Yes you're right and I'm not sure
why I missed this. :)

I'll fix this in v3.

Actually this means the code is wrong even before this series - it's
just that we don't use the "chip-name" property.

Bartosz
