Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 939703E3C77
	for <lists+linux-gpio@lfdr.de>; Sun,  8 Aug 2021 21:11:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232334AbhHHTLq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 8 Aug 2021 15:11:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231717AbhHHTLp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 8 Aug 2021 15:11:45 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50C59C061760
        for <linux-gpio@vger.kernel.org>; Sun,  8 Aug 2021 12:11:26 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id cf5so21245117edb.2
        for <linux-gpio@vger.kernel.org>; Sun, 08 Aug 2021 12:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gVHWlzMU2uUZB4qZGqJ7ih5CIQ99E5bfDgy8Dgg2Rdw=;
        b=B1xEU/BHG5+KIVq7Bbc7HF9d5U9Xd6e3Cenji+O9h9Na7zD0WwsESNO7t30D3RAUT4
         wwkOeZfwPba9mktqxcci8ow1sHsu/vb5pYDRxKLvPbB8Ct9lWRyDKAiAHvnsj/LAeO4g
         TkaCP1ZB6LxbM7+awRFc4I1vfVX/tcIMsvJY0I7CzqBIN3ny+0XRdUtgOuuvhJWemRHT
         h0PeB2tt/3UxLSlTsJjM2erGgstlf0mmk+2gd8YS9uRaM1CfktgloRs99hFNJCoyzguq
         XdNnY0TkMq6cpSqSLhxXgxjFo2+50OfJ8VoKmPqNEio0y4JAr8jjIQ3oHiz8f2j6JUfN
         zfbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gVHWlzMU2uUZB4qZGqJ7ih5CIQ99E5bfDgy8Dgg2Rdw=;
        b=lRE/dI5U1v6Na8OHJpUAD9A+E/d/rz9laZl4nmBtd1ufIrQP9sm/4Lz8VY9rcaUyuw
         TBhciVXgF9p+fBW8Z3czD+FQPyIXsh8u3mLdAZK2LZEDPRdM46/LRe0PUKkTM82m8SuI
         K6zggcPp4BpkyetlLDn8bO4wOksQbWzWhMT7cQF5Ge08ieKgEVtGVYr03NtvLcMrZ7G+
         wRUO3UNQ8IDA859hOtl54UXD05IP7/WbusM35x1o7frnAVCNnoZ8s3fHbofzzb7dOWYX
         iCNtyxk87QafxbOSzqQJYRY7PH2gPADoT65rcJzkQhuNsPDW96ORo1Wd57b6i7BvRvjW
         deQg==
X-Gm-Message-State: AOAM532VbO7cDLKAyp+g7WJIYqn11Hcd9c3FrFhbsoirglLxdZlL47s/
        Q3uGrO5eaisI7PCcCcG7siFohOX4Qg+A2uDSsEE3cw==
X-Google-Smtp-Source: ABdhPJzn8vMq3c/WcYThDNnEWK2p2wecpLxvx8rsPo9hKqCWOQteS36tW9rpcuojI0/mMGzhV/Q5PpOj1E4o3FhCk+I=
X-Received: by 2002:a05:6402:498:: with SMTP id k24mr26118685edv.25.1628449884843;
 Sun, 08 Aug 2021 12:11:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210806132810.23556-1-brgl@bgdev.pl> <20210807084809.GA17852@sol>
In-Reply-To: <20210807084809.GA17852@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sun, 8 Aug 2021 21:11:14 +0200
Message-ID: <CAMRc=McQOcWDexBeWKcA9CosxfG_59quusnVLYN7qu-p86BPag@mail.gmail.com>
Subject: Re: [libgpiod v2.0][PATCH] core: extend config objects
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        Ben Hutchings <ben.hutchings@essensium.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Aug 7, 2021 at 10:48 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Fri, Aug 06, 2021 at 03:28:10PM +0200, Bartosz Golaszewski wrote:
> > Kent suggested that we may want to add getters for the config objects in
> > his reviews under the C++ patches. Indeed when working on Python bindings
> > I noticed it would be useful for implementing __str__ and __repr__
> > callbacks. In C++ too we could use them for overloading stream operators.
> >
> > This extends the config objects with getters. They are straightforward for
> > the request config but for the line config, they allow to only read
> > per-offset values that would be used if the object was used in a request
> > at this moment. We also add getters for the output values: both taking
> > the line offset as argument as well as ones that take the index and allow
> > to iterate over all configured output values.
> >
> > The sanitization of input for the getters has subsequently been changed
> > so that we never return invalid values. The input values are verified
> > immediately and if an invalid value is passed, it's silently replaced
> > by the default value for given setting.
> >
> > This patch also adds the reset function for the line config object - it
> > can be used to reset all stored configuration if - for example - the
> > config has become too complex.
> >
> > As this patch will be squashed into the big v2 patch anyway, I allowed
> > myself to include some additional changes: some variable renames and
> > other minor tweaks.
> >
> > Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
>
> A few minor nit-picks in the gpiod.h documentation below...
>
> Cheers,
> Kent.
>

Thanks,

With that fixed, do you think it's good to be applied?

Bart
