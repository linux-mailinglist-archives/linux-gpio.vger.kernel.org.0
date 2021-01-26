Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81BC63057D5
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jan 2021 11:08:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S313261AbhAZXIX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Jan 2021 18:08:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389310AbhAZRO3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Jan 2021 12:14:29 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9385BC061756;
        Tue, 26 Jan 2021 09:13:46 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id b17so3586383plz.6;
        Tue, 26 Jan 2021 09:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t5TtFJJmGGXnlkPzRkZI964XfU9tnGtrVx8sJ+nhhgg=;
        b=C3EzaIXBST8Cm9Ao23YPKGZNoi53AvO8DVjjAwPROAIXUYs1VE82+8vfqjXNnqjdzD
         liqtV8Y1DERtPWo1nyvHfJ0dIM/8zl2g2OV+IH1gVcjgZEzRSEwCDurFQdLYTY8HnEN1
         0fEepFjeJDCr3qWqSlfUjxky/XAISoB3hBYR8DzKKdH2NMCPGUGAbfnSuwrsbFq96NSW
         FlpZ22yilEbZ4sX0iNjxessv0r3jc76/3YCmf9c62Vft0I82Rgw+V8YLURrimjjWJIAj
         1uTnO8ujuLiPhWVT8RByXB8RRIBu5vPkxq1srzRNiDQBiGg7xvbsiV//h51SSHrX+7L6
         Zmsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t5TtFJJmGGXnlkPzRkZI964XfU9tnGtrVx8sJ+nhhgg=;
        b=EQrAyz7uNWIbMzrEI9XTa5+pomvQxKZvOQa7VRXe44hgs5/UndIzIfk5kvkqviTlWK
         qmLKsw2P/2ssZ/MGfHEYt9wI30OD2IStIk5GOLKhhkaDSqz7XmlVUUkpOi/lTxzgtu8Z
         /JvqU27ePZTbIvkf8YPG6rmd+Tl/PNlN4jqd0+EKNRu9q2L+eTqE8abG4JWLhR1Mf6O3
         ZjW9GYZKq5cmWDctzwSoIUsWPdUG3l5mhUGetQi+0D0ewpWhAyEwHQG5M63A3IfV2SNe
         GuURoDjupeexct32qOffijaHoY2XKygZ3TwEFMMGUoiLuiZTQckLB3v8ylyk5izLL5tl
         DJag==
X-Gm-Message-State: AOAM530yVKCo8yzmsb9sYwXHfNI+bec0ZLEc1dwXFh6sgomRRfYT7YKg
        13ZRYhSh2wgHH13KGNnskb7G94yAFlSGunmaJFM=
X-Google-Smtp-Source: ABdhPJx92R0qs5/XdlRo/afRbr8RCC/r8mWGIZcmtX5Tb/02Z6ZBjPok93oodD57c37HChymbSyI5sp/7oQ9C8Xpisw=
X-Received: by 2002:a17:90a:644a:: with SMTP id y10mr797421pjm.129.1611681226049;
 Tue, 26 Jan 2021 09:13:46 -0800 (PST)
MIME-Version: 1.0
References: <YBANNJ8XtoRf7SuW@smile.fi.intel.com> <CAMeQTsbGBrTvfkz6BStwL240Kz-dbrQVKtXbYkRtbD3OoUKCcg@mail.gmail.com>
 <CAHp75Vc9RAHvTDAw1ryHq_CPRMtjqkzg9081nw0+RPY_yWPJgA@mail.gmail.com> <CAMeQTsY6k64LUg3DYbi67W6-Gx6znOeJbDfKUhzGt-BxF2BgKA@mail.gmail.com>
In-Reply-To: <CAMeQTsY6k64LUg3DYbi67W6-Gx6znOeJbDfKUhzGt-BxF2BgKA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 26 Jan 2021 19:14:35 +0200
Message-ID: <CAHp75VdKxARQAyyTd=ZcaoER1iF6Mk4AS1Dn6U9VCjt_D_+q8A@mail.gmail.com>
Subject: Re: [GIT PULL] ib-drm-gpio-pdx86-rtc-wdt-v5.12-1
To:     Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>, linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 26, 2021 at 6:55 PM Patrik Jakobsson
<patrik.r.jakobsson@gmail.com> wrote:
> On Tue, Jan 26, 2021 at 4:51 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> >
> > On Tue, Jan 26, 2021 at 5:25 PM Patrik Jakobsson
> > <patrik.r.jakobsson@gmail.com> wrote:
> > > On Tue, Jan 26, 2021 at 1:37 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > >
> > > > Hi guys,
> > > >
> > > > This is first part of Intel MID outdated platforms removal. It's collected into
> > > > immutable branch with a given tag, please pull to yours subsystems.
> > >
> > > Hi Andy,
> > > Do you plan on eventually removing X86_INTEL_MID completely? If so,
> > > then I should probably start looking at removing the corresponding
> > > parts in GMA500.
> >
> > Nope. It is related to only Medfield / Clovertrail platforms.
> >
> > There are other (MID) platforms that may / might utilize this driver
> > in the future.
>
> Right, there's still Oaktrail / Moorestown with hardware in the wild.

Actually Moorestown had to be removed a few years ago (kernel won't
boot on them anyway from that date when Alan removed support under
arch/x86 for it).

I'm talking about Merrifield and Moorefield that can utilize it and
also some other platforms that are not SFI based (Cedar something...
IIRC).

> > I.o.w. we probably can remove the oldest stuff in the driver WRT above
> > mentioned platforms, but leave the driver for the rest.
> > I wouldn't be in a hurry with this though, display drivers are easy to
> > remove, but really hard to get back on velocity after that.
>
> Ok, I'll have a look at removing Medfield. That code should have been
> removed a long time ago.

-- 
With Best Regards,
Andy Shevchenko
