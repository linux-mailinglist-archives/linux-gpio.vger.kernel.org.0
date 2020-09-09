Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C577262945
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Sep 2020 09:52:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728197AbgIIHwb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Sep 2020 03:52:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728297AbgIIHwQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Sep 2020 03:52:16 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2575C061573
        for <linux-gpio@vger.kernel.org>; Wed,  9 Sep 2020 00:52:14 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id e23so2185532eja.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Sep 2020 00:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HWzTcfsUucf6xK0PgWam/0llyorvOiQpmzd/WH0rzEI=;
        b=JHn0ucpbFptR2XwJsLpf3B3I8Jb8+p+ZxLVHiaEprms1TZBZVHmyajckuNJneXyo/E
         n6ChFk/GDJ9Bb2TV3sTmzv7PCqFB9mgIvob1gDk2YGsBlqddSqVXQvom2AEX8CzvD6Av
         +89xra7KyskO+KxXIq4LHWb2nhAXJUBRTPSvbuDth8pEOisvvhp7mTx5s5n+VlD9i+F+
         +yoAN5GFQSFoy2IMypPzol2gnQmk5DsLlgxrozrZ2TCbUrw9kmp5q/UPIqvEBaF6yDUO
         SG0T5BYLGJ8ynxjjMKI81W28XhAdR8vL+zuycHK6WuNmkgQHvmwtqkXhWFAideCxpUJD
         UhQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HWzTcfsUucf6xK0PgWam/0llyorvOiQpmzd/WH0rzEI=;
        b=EIW36ebQCHG6kbgvZ5wNSCgkSJ9aexYthogmkHH6+ySiWACbS6ufF2lsnOKNVJO6aH
         /bSXrziyzk7BgCrnvDy0STlBX1YwL4Saylb+Bv4AzDZTSBZV1drscVejtl78osMpoCDO
         0ROqT3AmyGsDheZY08h0EWL3kuozDMX5tCHXCNg10dWvAOzIMzIGbGapupsGR1DFC8kY
         Dzg9PI9GSKCtLJl6Svt4vqnSx59ouAqwgnloX2GF99h7Ck0/bBe8IqBMzDr5zTyR4a/9
         ukshNjKmBZKI0mcVu/jos6+it80TGl+i7NcUr83/Aj8WwDOeiFvzL6Z4+h5AriuxPtTC
         9xYg==
X-Gm-Message-State: AOAM531t9njoP6PH7byeFjERGfdhT5o0BRNc74sLEyZ2ps92veYb1iup
        pCqFUw/hj/whQ3q+daMXWr8wzFHKJ+hgAaVhvUhV5BKhmLk=
X-Google-Smtp-Source: ABdhPJz+6UOF4BG8/W6sIFI70JJizk5dU9R7D/MZ9rShWVsH2AyjmmrdC/daKZVrq3ZVzyL5cvOJP9mXerd8fvFOTL0=
X-Received: by 2002:a17:906:fccb:: with SMTP id qx11mr2456963ejb.429.1599637933588;
 Wed, 09 Sep 2020 00:52:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200905133549.24606-1-warthog618@gmail.com> <CAMpxmJUhTp=KHy_MU7feNDvM+A43u0o0Jjfc3SmSSBh98jjdyQ@mail.gmail.com>
 <20200909011625.GB8496@sol>
In-Reply-To: <20200909011625.GB8496@sol>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 9 Sep 2020 09:52:02 +0200
Message-ID: <CAMpxmJVuydgi65_hJWyH4nTFMuaTgvWggwyC=s3ZPxAhxEpC9w@mail.gmail.com>
Subject: Re: [PATCH v7 00/20] gpio: cdev: add uAPI v2
To:     Kent Gibson <warthog618@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 9, 2020 at 3:16 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Tue, Sep 08, 2020 at 06:07:49PM +0200, Bartosz Golaszewski wrote:
> > On Sat, Sep 5, 2020 at 3:36 PM Kent Gibson <warthog618@gmail.com> wrote:
> > >
> [ snip]
>
> > >
> > >  drivers/gpio/Kconfig        |   29 +-
> > >  drivers/gpio/Makefile       |    2 +-
> > >  drivers/gpio/gpiolib-cdev.c | 1277 +++++++++++++++++++++++++++++++++--
> > >  drivers/gpio/gpiolib-cdev.h |   15 +
> > >  drivers/gpio/gpiolib.c      |    5 +
> > >  drivers/gpio/gpiolib.h      |    6 +
> > >  include/uapi/linux/gpio.h   |  317 ++++++++-
> > >  tools/gpio/gpio-event-mon.c |  146 ++--
> > >  tools/gpio/gpio-hammer.c    |   56 +-
> > >  tools/gpio/gpio-utils.c     |  176 ++++-
> > >  tools/gpio/gpio-utils.h     |   48 +-
> > >  tools/gpio/gpio-watch.c     |   16 +-
> > >  tools/gpio/lsgpio.c         |   60 +-
> > >  13 files changed, 1948 insertions(+), 205 deletions(-)
> > >
> > >
> > > base-commit: feeaefd378cae2f6840f879d6123ef265f8aee79
> > > --
> > > 2.28.0
> > >
> >
> > To me this looks good enough to queue for v5.10. I think you'll need
> > to resend the selftests patches and get an ack from selftests
> > maintainer. Once that's done we can get this series into next.
> >
>
> I can hardly resend what has never been sent ;-).
>
> This series is complete without the selftest changes.  Once this is in tree
> somewhere, so I have something to base them on, I'll bounce them off
> Shuah.
>

Oops, sorry I got confused by Shuah's mail.

Bartosz
