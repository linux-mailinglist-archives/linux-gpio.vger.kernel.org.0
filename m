Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9645366745
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Apr 2021 10:49:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237563AbhDUItu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Apr 2021 04:49:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231685AbhDUItt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Apr 2021 04:49:49 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 889F4C06174A;
        Wed, 21 Apr 2021 01:49:16 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id y62so4271250pfg.4;
        Wed, 21 Apr 2021 01:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nyG8M0+jDsXmgNyxaYwY/Nj8F4LWNrBZnNTWBz+bDbk=;
        b=p3UP0qVsgrgFNIgFvL0xCqYPLwPBV0QOdIQG9zi28XJvbF8xwhPDhLE3b3mZdIPr16
         2P/Xx0MXxZAzcJJUSgL+4XhuPdXXYUjpd4G7v0w3aJL8PxaZQ4RnkGxGE9XSqefskZHR
         n+z9f4fPD/7fAgs9+ObQdW+opmKLznPGwJCo3MpEiLEWKOsi0y3tMTjPyleoyjmIUlUb
         bt30VcaRoFKLKJXi0Nt59OTAqiO7JLTvek0Mz/jBueBkxWUHBFDkI5l6SOCsVoe2qsQ3
         dJl+HQQuSWNBogxc3+EPQT7dIKSPkGG+93xN+l067HKGASFYLKqn6E9ixA839o/vuZEB
         n4oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nyG8M0+jDsXmgNyxaYwY/Nj8F4LWNrBZnNTWBz+bDbk=;
        b=mxUPJF6abg8IuQlw4bd166W/rGRLcCDeGo6fdvlLAKRiQ9H/NIAKN3XHdP7tOCw8n+
         4em4k4QDdYX+sTpX4y55VKiLvCw7bX0sqnO58Ynewtysw96/Ka5ERre1lStEolS0hZwa
         EzjmJuvwqqmaGy4WjzubTbZnZkgpEKDXJ1mFmUX8NWWjk6i5ikEihPsTwyRtvYfPu+JJ
         VD+VfPnztdB8n+tfZWX7HpEt9ce8/AohgG5OeRClT5d6GzOmJ/+pBOzCpXF9+EC2cpWi
         eWj0HzK3z6H96dQunTfPml2UmSjZViS/xtlOSg/kBHETObu9wWfeqwqpEx35VfbTcSOI
         X+Vw==
X-Gm-Message-State: AOAM533DYpUToeHC4q9/CoDv7EA7UAcS9uHFp2p9WaKvpjvgON46yTHB
        OcgXOP978TEO5VkeDeRA4jZhXOtZfaq/4SEcx9XkGN747Rw=
X-Google-Smtp-Source: ABdhPJxPqlfXv94yNmBqNzuQBPYE0DQP0u0frGcqsdfZFmB8vPO2chdLb8mdatesmZz1zX8Z0ndcqCWxZTHHCbU0u9M=
X-Received: by 2002:a17:90a:bd13:: with SMTP id y19mr10390534pjr.181.1618994956133;
 Wed, 21 Apr 2021 01:49:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210420123932.24634-1-tsbogend@alpha.franken.de>
 <CAHp75VcQ4WXm3uS2r=uDpA4+0vPWdKjev6=vV_JDxMLPzpHDRw@mail.gmail.com> <20210421083214.GA5694@alpha.franken.de>
In-Reply-To: <20210421083214.GA5694@alpha.franken.de>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 21 Apr 2021 11:48:59 +0300
Message-ID: <CAHp75VeeWTdYjSgyjgzmFSpO=Zc+Q6SCS-06LVcVoghuF9vNgA@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: Add support for IDT 79RC3243x GPIO controller
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 21, 2021 at 11:32 AM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
> On Wed, Apr 21, 2021 at 11:09:51AM +0300, Andy Shevchenko wrote:
> > On Tuesday, April 20, 2021, Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > wrote:
> >
> > > IDT 79RC3243x SoCs integrated a gpio controller, which handles up
> > > to 32 gpios. All gpios could be used as interrupt source.
> >
> >
> >
> > I would recommend looking for latest new drivers in GPIO subsystem to see
> > how you may improve yours.
>
> Could give me a better pointer to it ? I looked at a lot of gpio driver
> and took what fitted best.
>
> > Here just one question, why it can not be a module
>
> that's probably doable...
>
> > why arch_initcall() is used
>
> without that interrupts weren't avaiable early enough.
>
> > and why you put a dead code into it (see the first part of the
> > question)?
>
> hmm, pointer please ?

It's already in the question above, do your homework :-)

-- 
With Best Regards,
Andy Shevchenko
