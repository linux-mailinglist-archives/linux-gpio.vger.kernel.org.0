Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83FCA26246B
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Sep 2020 03:16:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728363AbgIIBQd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Sep 2020 21:16:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726369AbgIIBQb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Sep 2020 21:16:31 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3090DC061573;
        Tue,  8 Sep 2020 18:16:31 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id l126so669685pfd.5;
        Tue, 08 Sep 2020 18:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Bx+pnhd3BydI3cuEIOVY50JzFV5M43Bm8LLLcFtzE7c=;
        b=FCgrxtNKdHUtz9sVnSs7GkiDn8DLY5UBpUY2ICxNUZQoTYvA070wxiMDq8bDnhHBlc
         07znF/HqHYKSLwSexxENmtso0wOeBbVGhfVkM6YGCCJ1UXgPTLVw8XgJXwHvozO7UF65
         pppbY2y+bP3BRfoFrgWu9tBCuQhxaqdCuVmEa1MvMlZPauNHQuXcrvZdpp5rEZZ7zXUz
         +VG6erijGrPg3evlBaL8QZyRy43v5x3spT8nsK8LTuwq5W1bKsk7T+6HUwgbIe5kxUzF
         UlED0ojm62hLrFHTOc1YDxAu+wnEZ5FY5XV8uSjRCUnI7Zsg9+IK7e+hKWQdIp3+4CJB
         U5Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Bx+pnhd3BydI3cuEIOVY50JzFV5M43Bm8LLLcFtzE7c=;
        b=SkWxum6tFXqLwm/RphBn7TnxKOmJbGjmXrlhXVWnTHtfXi7lJh0aE1malzdsnxOzDs
         jyhJ1OBz8MZU4FjR16BjAZWke9+VMpXPn+XgYW1TJd9PhV4sTgZjoaC1J8wRdsh6jnMU
         TpXKsVy68lUYlYiirbPJNNnVs2bSDVoUBPLFqhfajfwXYHlkqunqzPHSJ3erS4PBhev7
         DZ3VdmNb25Tev8xyZWyFF/J/rPkCbTRx34lahCx84Zs5BXQWTfH0f217ZvJ3KIN6QZGI
         +GSOauDyYNAEmJjniP9m+wOJc2zQTq7FwScArfQQgh1LR3AmsSKeUMOt8BDpoZ1kjyGb
         QZfw==
X-Gm-Message-State: AOAM532TWUZ8vs5oZRRtayuDYW8KXJeFcZ+8Z5Q8/0aBu3lbvT2eF+/X
        cE406uaFx8QtOkmlGQuEjeM=
X-Google-Smtp-Source: ABdhPJzOK0bcDDIZpOuxwglM3UBjb1VBLV6qxeOs2HCCb0gMl97xES510NXmFf4qPT60NRH2Qp+pVQ==
X-Received: by 2002:a17:902:8bc2:b029:d0:cbe1:e709 with SMTP id r2-20020a1709028bc2b02900d0cbe1e709mr1678079plo.23.1599614190675;
        Tue, 08 Sep 2020 18:16:30 -0700 (PDT)
Received: from sol (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id ev19sm344776pjb.42.2020.09.08.18.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 18:16:30 -0700 (PDT)
Date:   Wed, 9 Sep 2020 09:16:25 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v7 00/20] gpio: cdev: add uAPI v2
Message-ID: <20200909011625.GB8496@sol>
References: <20200905133549.24606-1-warthog618@gmail.com>
 <CAMpxmJUhTp=KHy_MU7feNDvM+A43u0o0Jjfc3SmSSBh98jjdyQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMpxmJUhTp=KHy_MU7feNDvM+A43u0o0Jjfc3SmSSBh98jjdyQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 08, 2020 at 06:07:49PM +0200, Bartosz Golaszewski wrote:
> On Sat, Sep 5, 2020 at 3:36 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
[ snip]

> >
> >  drivers/gpio/Kconfig        |   29 +-
> >  drivers/gpio/Makefile       |    2 +-
> >  drivers/gpio/gpiolib-cdev.c | 1277 +++++++++++++++++++++++++++++++++--
> >  drivers/gpio/gpiolib-cdev.h |   15 +
> >  drivers/gpio/gpiolib.c      |    5 +
> >  drivers/gpio/gpiolib.h      |    6 +
> >  include/uapi/linux/gpio.h   |  317 ++++++++-
> >  tools/gpio/gpio-event-mon.c |  146 ++--
> >  tools/gpio/gpio-hammer.c    |   56 +-
> >  tools/gpio/gpio-utils.c     |  176 ++++-
> >  tools/gpio/gpio-utils.h     |   48 +-
> >  tools/gpio/gpio-watch.c     |   16 +-
> >  tools/gpio/lsgpio.c         |   60 +-
> >  13 files changed, 1948 insertions(+), 205 deletions(-)
> >
> >
> > base-commit: feeaefd378cae2f6840f879d6123ef265f8aee79
> > --
> > 2.28.0
> >
> 
> To me this looks good enough to queue for v5.10. I think you'll need
> to resend the selftests patches and get an ack from selftests
> maintainer. Once that's done we can get this series into next.
> 

I can hardly resend what has never been sent ;-).

This series is complete without the selftest changes.  Once this is in tree
somewhere, so I have something to base them on, I'll bounce them off
Shuah.

Cheers,
Kent.


