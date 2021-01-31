Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96E0A309983
	for <lists+linux-gpio@lfdr.de>; Sun, 31 Jan 2021 01:44:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232280AbhAaAn5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 30 Jan 2021 19:43:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231923AbhAaAn4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 30 Jan 2021 19:43:56 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85307C061573;
        Sat, 30 Jan 2021 16:43:16 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id m6so9101397pfk.1;
        Sat, 30 Jan 2021 16:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Bi+IsvsSXp0znUX7pYnup3aiWOEdAJ3KLmdVbOIabxQ=;
        b=J9jHFxXGBJgjbToroef44LlnAzQD1QQ7lpDiqm9cbOf8XZhc7M2BaqLwTRP4ryGs3r
         8OXEdXohWSG6xQ9JpiaZP9MmOEdYy5DYo/cthuejRkBKTDTthqOVRopkqb2QPC1VaszK
         co9amzo8I3uvBvE3E3KLztQg0ZnZ61xSFicB9kfP27TppQ303oNdJrz7jqDYElmG9tFV
         Y5i861nY/oNIs8jAqV9oFk1Pr0KvUyQV5RZXM2Zz1CWwQL5EJSBUmo3acyzcMvWCemH8
         AebIjyr3IB3PpWXBjiCx6nli+lJWa5Pc8OkEfNdhXhcBHOJB6GjEP59X7G4FsBIFNIdx
         dyVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Bi+IsvsSXp0znUX7pYnup3aiWOEdAJ3KLmdVbOIabxQ=;
        b=PwtBGjNfz74WG7rc2jn4PC/zuTJdh8kkkFbQGPO4ZviOj/gwzoukvOmDUlTTrsVBJn
         KZSoIdjcBaF9HlBO4oXhHinLtg5NgBwApkKqGwUj3xfOpHl1tNuHHH5McDTgi2k9RO/S
         j6U/VlPGPn39TppCfPk00Pmwd46N/RKEihkgUnEkFuIh4Olu1DxhRTJBFek1SiNOn5J9
         4arL2drQlKhgqiAwkyg5icubUpX51xsMJ1mOJncad3KoUb/VcJ+0qCZlowQp3I/NAq7n
         AtRj1u4zuhd6lgHPWi/BCFa+UWWlhta3/yLhKB799mCPezQIcQM0CjCCnRD1mNJZJhWD
         DTNw==
X-Gm-Message-State: AOAM533LskO9qsAZdmRR2aa28zk5UEuDE2UoCmU/0g6Paa5NjJT/L0Xb
        rsKkgoE0i5iNqcD+q9FdgjY=
X-Google-Smtp-Source: ABdhPJzk8ZLXXQ4Kl3C8+a4c6WQGnQQI1UFvKx32TJ2QWTh8g8/RUkbw/Q4/ME0vHc06OHKjbMzbKQ==
X-Received: by 2002:a63:7748:: with SMTP id s69mr10772576pgc.81.1612053796058;
        Sat, 30 Jan 2021 16:43:16 -0800 (PST)
Received: from sol (106-69-169-43.dyn.iinet.net.au. [106.69.169.43])
        by smtp.gmail.com with ESMTPSA id q2sm11820333pfj.32.2021.01.30.16.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Jan 2021 16:43:15 -0800 (PST)
Date:   Sun, 31 Jan 2021 08:43:08 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Joel Becker <jlbec@evilplan.org>,
        Christoph Hellwig <hch@lst.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH 8/8] gpio: sim: new testing module
Message-ID: <20210131004308.GA4687@sol>
References: <20210129134624.9247-1-brgl@bgdev.pl>
 <20210129134624.9247-9-brgl@bgdev.pl>
 <YBQwUkQz3LrG5G4i@smile.fi.intel.com>
 <CAMRc=MeSy4zWOAGxfoBih62WxAXuOLtkK3ROyt+4LuqLvDxtaQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MeSy4zWOAGxfoBih62WxAXuOLtkK3ROyt+4LuqLvDxtaQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jan 30, 2021 at 09:37:55PM +0100, Bartosz Golaszewski wrote:
> On Fri, Jan 29, 2021 at 4:57 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Fri, Jan 29, 2021 at 02:46:24PM +0100, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > ...
> >

[snip]

> > Honestly, I don't like the idea of Yet Another (custom) Parser in the kernel.
> >
> > Have you investigated existing parsers? We have cmdline.c, gpio-aggregator.c,
> > etc. Besides the fact of test cases which are absent here. And who knows what
> > we allow to be entered.
> >
> 
> Yes, I looked all around the kernel to find something I could reuse
> but failed to find anything useful for this particular purpose. If you
> have something you could point me towards, I'm open to alternatives.
> 
> Once we agree on the form of the module, I'll port self-tests to using
> it instead of gpio-mockup, so we'll have some tests in the tree.
> 

Given the existing selftests focus on testing the gpio-mockup itself, it
would be more appropriate that you add separate tests for gpio-sim.

As an end user I'm interested in the concrete example of driving gpio-sim
that selftests would provide, so I'm looking forward to seeing that.

Cheers,
Kent.
