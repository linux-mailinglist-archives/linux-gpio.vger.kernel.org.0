Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FDD830A373
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Feb 2021 09:40:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229558AbhBAIjP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Feb 2021 03:39:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232285AbhBAIjG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Feb 2021 03:39:06 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65FA9C0613ED
        for <linux-gpio@vger.kernel.org>; Mon,  1 Feb 2021 00:38:05 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id b9so3414881ejy.12
        for <linux-gpio@vger.kernel.org>; Mon, 01 Feb 2021 00:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=z4AuE6zxjnO1SI9ppd5bfchNPmK3baNkX/gyPe+l0t8=;
        b=kCyNznqU+jdacM7Tug3g2mt986OIGwhThXmFdCnBI5qvL7bKM0q4Ue4w33dvry2Nfg
         BXAOVMrP8rpJ8JjScqAN/7PBO8mvhyP0pBwMr/d+fupexWDNqfFcZvC8GI/yRY8dV++t
         rU1epvmkKxi3+FCTCONM/tSZE8Z85GGn6xwDdwvdAEX+uB5Del88TU5AolPYq6bZlD6i
         /irA7W60+faSJVy3yuvhPdkFqBkmr2g/k/Mv1R2PhlBAWIfMWzRLle196mjwzbztwmpU
         Wx2k4ajd+LAFv7YufsWTAdDV4ywpoS4iqi6G2Kwxv0F1orO3G9NJZLBB+zj+nu3MlOBK
         K1jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z4AuE6zxjnO1SI9ppd5bfchNPmK3baNkX/gyPe+l0t8=;
        b=HkDlX9/rpFXVQOuRZwfnwpUmdwmCQ/HxdNt7fBKgj9E/MkXK+ZSOCWTT5qWAIS0XiP
         +V5XsSm0B24PDA4geyd3HuFh5hDxwykk8OMNjZ3BuYD3bGhXuFozCGmyEAZ2EsO8Rg0v
         bvNDRyFNdgBpjTZHyr6m5jP4nXVkJER8XWLZx/vL/9WsyfAj+TQ4KFl/hHa9sm6YEsrn
         LNrYL7csbynE7/vsLZuyKWlSo8Fu+sD/93eN5fvc1NjCW9AT5F/sBUETPYHx3prH5+sF
         J3HjHaA7TFlM0OJcTvTVvwxFb8kzHpLXuz5L8FgPOaD972o33d2TxC+2vSor7uMgfiYn
         Eg3Q==
X-Gm-Message-State: AOAM531o+Yey8R/u7ttkPcalIdsYnhkfDooWN96oFMUKGCMtnCnR+x8+
        q5K8l8RG3990ImF/w1z4sn3RML0eCksmFncM86wJQA==
X-Google-Smtp-Source: ABdhPJw7iZgXyHCD35LZFETL5VROJDAs+q4uynErDBWz1W4mY47jjlfbaQN0o2fztKMogr1ympEDX0yMLs5fnR2rmu0=
X-Received: by 2002:a17:906:4707:: with SMTP id y7mr4854532ejq.445.1612168684094;
 Mon, 01 Feb 2021 00:38:04 -0800 (PST)
MIME-Version: 1.0
References: <20210129134624.9247-1-brgl@bgdev.pl> <20210129134624.9247-9-brgl@bgdev.pl>
 <YBQwUkQz3LrG5G4i@smile.fi.intel.com> <CAMRc=MeSy4zWOAGxfoBih62WxAXuOLtkK3ROyt+4LuqLvDxtaQ@mail.gmail.com>
 <20210131004308.GA4687@sol>
In-Reply-To: <20210131004308.GA4687@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 1 Feb 2021 09:37:53 +0100
Message-ID: <CAMRc=Me+Cg1WdV4eaggigBy4ZtnOLmaQ_c34kKv-iWU6Qtg9uQ@mail.gmail.com>
Subject: Re: [PATCH 8/8] gpio: sim: new testing module
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Joel Becker <jlbec@evilplan.org>,
        Christoph Hellwig <hch@lst.de>,
        Jonathan Corbet <corbet@lwn.net>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jan 31, 2021 at 1:43 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Sat, Jan 30, 2021 at 09:37:55PM +0100, Bartosz Golaszewski wrote:
> > On Fri, Jan 29, 2021 at 4:57 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > On Fri, Jan 29, 2021 at 02:46:24PM +0100, Bartosz Golaszewski wrote:
> > > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > ...
> > >
>
> [snip]
>
> > > Honestly, I don't like the idea of Yet Another (custom) Parser in the kernel.
> > >
> > > Have you investigated existing parsers? We have cmdline.c, gpio-aggregator.c,
> > > etc. Besides the fact of test cases which are absent here. And who knows what
> > > we allow to be entered.
> > >
> >
> > Yes, I looked all around the kernel to find something I could reuse
> > but failed to find anything useful for this particular purpose. If you
> > have something you could point me towards, I'm open to alternatives.
> >
> > Once we agree on the form of the module, I'll port self-tests to using
> > it instead of gpio-mockup, so we'll have some tests in the tree.
> >
>
> Given the existing selftests focus on testing the gpio-mockup itself, it
> would be more appropriate that you add separate tests for gpio-sim.
>
> As an end user I'm interested in the concrete example of driving gpio-sim
> that selftests would provide, so I'm looking forward to seeing that.
>
> Cheers,
> Kent.

Makes sense, I'll add tests in v2.

Bartosz
