Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65629466162
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Dec 2021 11:26:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241075AbhLBK3j (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Dec 2021 05:29:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232098AbhLBK3j (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Dec 2021 05:29:39 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 098ABC061756
        for <linux-gpio@vger.kernel.org>; Thu,  2 Dec 2021 02:26:16 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id y12so113903275eda.12
        for <linux-gpio@vger.kernel.org>; Thu, 02 Dec 2021 02:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qJdg0Ht7S45MohBNN0zs4DuQfs/BpAo+2coL2L/NlX4=;
        b=P+rUr4tOHsDwrt3fYXClcDgAjqilDqAT28lqchbzifDznUrCIik2yAjpkWiTI2hDFU
         S3PxCkIbeOls1DkNTsPmIO/BP2vSyLtkBPGX7XtoKzytypJnLda8vK9coT/fwSXcWHzb
         YpnlsfsoSPHh0hXySqrkQISvv5qF2Blq/Vi1H62SF/ZzlXywKMRT79GpIA28GhhUAgp2
         qSHoN03kbj6NuJ9+VKmizEqLIj/x1FqOkARpLa1LdvVwsmmOVqlkHPEfIuDUD/Ftc94h
         nhVvKyLa7h8Jo9me2RD9kGOcP90trSeK5YS1KoQWuyGmhjUoRhtPKPlLAQaSzyZVO9w7
         EGuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qJdg0Ht7S45MohBNN0zs4DuQfs/BpAo+2coL2L/NlX4=;
        b=VB6A6XizcTAHNJ+GsBjDP1cghZxNNXQlSjzzIradJHiRIl63TW54taQ4cLPYt3Szeo
         d5gWMTJHS52tvGygi+6mo7poiMHgT8vX++tyf+eD+N0pP7Mcj0+eiy+2kMbKj6iI4ux9
         rDQWHppPTuDYyGxu7O3X0ckEYmsveU2shS2hP8PMSPOKZwHmqGwDU3i/pkMa5Fz+rn9P
         hIUTsEG9Sg5YxWdOcB2jO9HUy8pLS6EYCGtkpT0swGCAUAYgVf32nQibsICIy/XRcKyD
         HkfrIEJx8TvMBsnA7CD8V7o5NfrS1U5Qzfd4CpG7+HWLlrLtmCSM8dhkydEYUR8iQvOU
         CWYA==
X-Gm-Message-State: AOAM533yHpQevKfZep53NVdNPa6UMlLxUnAdmTgNtAJNCv+za2dq7Zaj
        jQHSA3FIlFtL1gFc2JuMq9/XcD8okQ+9A588/DlTzg==
X-Google-Smtp-Source: ABdhPJy66uPjpO1k03AcA51QiXiGLDvsvTj3uFZ8F3lBC08QDOrz5t9RM08dngV5RYrK79yv4kMcj3eqUvHqEeYtgG4=
X-Received: by 2002:a17:907:7f9e:: with SMTP id qk30mr14374257ejc.313.1638440774357;
 Thu, 02 Dec 2021 02:26:14 -0800 (PST)
MIME-Version: 1.0
References: <20211124122850.7095-1-brgl@bgdev.pl> <20211124122850.7095-2-brgl@bgdev.pl>
 <YZ5QYsu2ed5FiSWE@smile.fi.intel.com> <CAMRc=Mfcph_YPryowhtGtb9G_GOveRm+27BJYyznjxc=BK-jWg@mail.gmail.com>
 <YZ9w8EU8XN8xhpDp@smile.fi.intel.com>
In-Reply-To: <YZ9w8EU8XN8xhpDp@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 2 Dec 2021 11:26:03 +0100
Message-ID: <CAMRc=Mf8RRkhnwTQuEgr5iavaSpxtvouJ9TrpaGeG6k9+Sq6aA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] gpiolib: check the 'ngpios' property in core
 gpiolib code
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Johan Hovold <johan@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 25, 2021 at 12:18 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Nov 25, 2021 at 11:10:08AM +0100, Bartosz Golaszewski wrote:
> > On Wed, Nov 24, 2021 at 3:47 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Wed, Nov 24, 2021 at 01:28:50PM +0100, Bartosz Golaszewski wrote:
>
> ...
>
> > > > +             ret = device_property_read_u32(&gdev->dev, "ngpios", &ngpios);
> > > > +             if (ret) {
> > > > +                     if (ret == -ENODATA) {
> > > > +                             chip_err(gc, "tried to insert a GPIO chip with zero lines\n");
> > > > +                             ret = -EINVAL;
> > > > +                     }
> > > > +
> > > > +                     goto err_free_descs;
> > > > +             }
> > >
> > > And if the property returns 0 in ngpios?
> > >
> > > What about the modified suggestion from previous version:
> > >
> > >         if (gc->ngpio == 0) {
> > >                 ret = device_property_read_u32(&gdev->dev, "ngpios", &ngpios);
>
> > The comment is a good idea but other than that - it's overcomplicating things.
>
> I don't think so. It is plain and self-explaining each step. See at the end of
> the message how.
>
> > >                 if (ret == -ENODATA)
> > >                         ngpios = 0;
> > >                 else if (ret)
> > >                         return ret;
>
> > You still need to goto err_free_descs here.
>
> Right, this doesn't affect the main point / logic here.
>
> > >                 gc->ngpio = ngpios;
> > >         }
> > >
> > >         if (gc->ngpio == 0) {
> >
> > Why check that again? We already know the driver set it to 0, we
> > checked it a couple lines before. If we can't get the setting from the
> > properties then it won't be non 0 here right?
>
> No, it's not right. The check is needed to tell that properties supplied 0.
>
> > >                 chip_err(gc, "tried to insert a GPIO chip with zero lines\n");
> > >                 ret = -EINVAL;
> > >                 goto err_free_descs;
> > >         }
> > >
> > > ?
> > >
> > > > +             gc->ngpio = ngpios;
> > > >       }
> > > >
> > > >       if (gc->ngpio > FASTPATH_NGPIO)
>
> > I suggest the following:
>
> It's buggy as submitted version (I actually haven't found any difference in
> the code, but comments).
>
> You see, I propose less changes and straight forward logic:
>
> 1. Check if the supplied ->ngpio equal to 0
> 2. If so, try device properties
> 2.1. If there is no property found, make sure we a) don't use uninitialized
>      variable, b) we don't change ->ngpio, so it stays 0
> 2.2. If there is an error, return it as is to the caller
> 2.3. Assign ->ngpio by value from property (which very well may be 0!)

Ok, this is the thing I didn't realize, the property can indeed be 0
so your approach is correct.

Bart

> 3. Check ->ngpio for 0 again, if so, issue a message and return -EINVAL to
> the user.
>
> We have three places where ->ngpio can be 0, all of them I covered.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
