Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB810366868
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Apr 2021 11:55:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235574AbhDUJzm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Apr 2021 05:55:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235209AbhDUJzm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Apr 2021 05:55:42 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5820C06174A;
        Wed, 21 Apr 2021 02:55:09 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id p67so23316956pfp.10;
        Wed, 21 Apr 2021 02:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ByMLAN+8fxfHgWQZfDPAL+/yX4PSSOJ3+5EBA/A4ztI=;
        b=VUnC747PHATMpObXbQ3+OkD6oFaucOm3iBOLc+SUg1mHuPIFOM4/s/mwzq85qxGFBO
         xCfZayvpn1S5l0wLkgCz8IstDwp88MHMgCARxKyrJrYUkeIo9z12vmJbtojkT5Z9rtE5
         11gFdGeBLbCZeMFnjn99jpK1i0ZUMZssdZB0RuBIClPDOn0b/acACIpybpHRsxJsqxVO
         fuUTHgqjbEnWmPUxGF0XQV/b4BvYy+On0SJngbHAmC+lHG/xHsWtaNFNlExCdU4rFz9h
         MvYjLsK3CC2UAQOF9b6Z/cwVyhJaQ2BJZojAmkc0x/YAinfQXuWQEkx2C6nwHeV8augd
         GnAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ByMLAN+8fxfHgWQZfDPAL+/yX4PSSOJ3+5EBA/A4ztI=;
        b=izN7wRBWbjOfCf73iapdHncBqqBw2WH/TfomCxRGz0I8LP0I9lR2hxhTBFOEqTRVWj
         ElLjkg10rsBVRcoOP9TgLVLJs7Y/HWuxG7ir7lVBOo6YXdT06RmW3UrJCsD5BWT/cAwq
         UKcxjLCg3FugnoiBmwCQZ+IAYuoutfN7u3BUB1JA2Qznq6s6VMZGABlpG8mabkbOHmT5
         +AcGI4A9lClrwR/QM1bSUEiF4qNwiIz4fsqLtKhKk7HkgcNxAN8p1HgWR8wTFt59XDJ4
         lqLNZ32oNaMzjUC/AjEjuwClN7cZMKgHAPnX0B27LJ6xEPTb1KxBil6wtUT/HqDqo8lT
         CKBQ==
X-Gm-Message-State: AOAM532Wz4K91eXtJUOf9MXJkfMp44qPutYriyLra913fsLHfLNdUOYT
        xgLQzlSFwDhS/2IW9tP4SSydwgeFrb3Mui7mlnM=
X-Google-Smtp-Source: ABdhPJwxb+TYZuF0BZ/Y/Qp9OpiXh69nXcwDVd/1f5CmIFyw5Vfv1WiQCSVXkZKS/J0s6/f6d0gucBlXGHPAg1SPJEY=
X-Received: by 2002:a63:a847:: with SMTP id i7mr17049574pgp.203.1618998909268;
 Wed, 21 Apr 2021 02:55:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210420123932.24634-1-tsbogend@alpha.franken.de>
 <CAHp75VcQ4WXm3uS2r=uDpA4+0vPWdKjev6=vV_JDxMLPzpHDRw@mail.gmail.com>
 <20210421083214.GA5694@alpha.franken.de> <CAHp75VeeWTdYjSgyjgzmFSpO=Zc+Q6SCS-06LVcVoghuF9vNgA@mail.gmail.com>
 <20210421091843.GA6174@alpha.franken.de>
In-Reply-To: <20210421091843.GA6174@alpha.franken.de>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 21 Apr 2021 12:54:53 +0300
Message-ID: <CAHp75Vf921iQUR=VgMXTD-M_Ah+8UeAmKXXqgvB8WFz58pQ5Qg@mail.gmail.com>
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

On Wed, Apr 21, 2021 at 12:19 PM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
> On Wed, Apr 21, 2021 at 11:48:59AM +0300, Andy Shevchenko wrote:
> > On Wed, Apr 21, 2021 at 11:32 AM Thomas Bogendoerfer
> > <tsbogend@alpha.franken.de> wrote:
> > > On Wed, Apr 21, 2021 at 11:09:51AM +0300, Andy Shevchenko wrote:
> > > > On Tuesday, April 20, 2021, Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > > > wrote:
> > > >
> > > > > IDT 79RC3243x SoCs integrated a gpio controller, which handles up
> > > > > to 32 gpios. All gpios could be used as interrupt source.
> > > >
> > > >
> > > >
> > > > I would recommend looking for latest new drivers in GPIO subsystem to see
> > > > how you may improve yours.
> > >
> > > Could give me a better pointer to it ? I looked at a lot of gpio driver
> > > and took what fitted best.
> > >
> > > > Here just one question, why it can not be a module
> > >
> > > that's probably doable...
> > >
> > > > why arch_initcall() is used
> > >
> > > without that interrupts weren't avaiable early enough.
> > >
> > > > and why you put a dead code into it (see the first part of the
> > > > question)?
> > >
> > > hmm, pointer please ?
> >
> > It's already in the question above, do your homework :-)
>
> is this some sort of joke I'm not getting ?

Maybe, but no, it's not a joke. You asked where the dead code is. I
answered that you as the author of the code should have a better
understanding of what you are doing. I can admit that it's hard to
cover all aspects of the kernel programming in one go, but at least
this part is a low hanging fruit.

As I promised you, I will do a deep review later on, I'm giving you
time to find issues yourself. That's how you may actually learn the
things. It's solely your choice to follow or not, my promise will be
kept and you will get an answer anyway.

> git log --oneline drivers/gpio/Makefile
>
> 2ad74f40dacc gpio: visconti: Add Toshiba Visconti GPIO support
>
> that's the latest driver added in v5.12-rc8. Is that a good one ?

Briefly looking, I haven't found any problems with that code. It looks neat.

-- 
With Best Regards,
Andy Shevchenko
