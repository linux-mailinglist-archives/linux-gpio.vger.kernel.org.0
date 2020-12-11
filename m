Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 834A42D77FF
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Dec 2020 15:35:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406307AbgLKOet (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Dec 2020 09:34:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406299AbgLKOed (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Dec 2020 09:34:33 -0500
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D580C0613CF
        for <linux-gpio@vger.kernel.org>; Fri, 11 Dec 2020 06:33:53 -0800 (PST)
Received: by mail-io1-xd44.google.com with SMTP id n4so9649754iow.12
        for <linux-gpio@vger.kernel.org>; Fri, 11 Dec 2020 06:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p/RtycXA9ADHKyVbVNDgFgrHxMfedlktT2sOG/LRSCg=;
        b=nivg3pwz1r98n1YrS9RchD6E4/IKCC/41G7mfuUWQiAcUZHPG4U2pgp53RQhnXIjDP
         0ZG9ETQFyA3z7sXKFqRMcLzpIV6sMpFDON2La0xeBduhIh4mVKbuVb0z9swlJbjjrGAp
         mqzFFqUyDku6MdB8GmBAUF1DFFMfFA+zmSNaKZRHsgsDIrYrewBlW0ttGcRQaT+hvumI
         ZATYdnzqN/OlfC0AVAUB3sRvY7/ct7ZPmFQvh/m/MfMzN6IomL9tQdvRi39U+YxFkFUz
         CNRGeZx0uk2LFdlwxFK/a6k+Xvh+5s+jxJ/jrX4AItAPmYa05nCHTXoGg5jvbFBUkRIz
         s0IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p/RtycXA9ADHKyVbVNDgFgrHxMfedlktT2sOG/LRSCg=;
        b=Pl3BZ4Z+/dhxtXcb8diQhTMT5VCsyBKZeWCcEwtiffgFpoVQeKqSJz794eb15NuFt9
         /5qUzEZ0ttkmX/JRf856kQDVIS5uVJhT0pBHkGpGgMYK0CbLSUDuhFXwnvQuTYxFO1FV
         SN2rJTQs5jbuK+ddg76BCeqez1i5ouDtE/B9vYDdTyAepW0X1VxycpPjHlrKSvCbSjeN
         rZoS36MPkY3E2b3tEkZ2AA2h49WL21zAXa+bpmM2tIY6Ak4P9N/V3nQI3pP7o+3RFR2s
         eqchSD3avyz8tFyffK2lSFE2rENgyyXJCIWxVE4tBFF6tLsBJu0ZA2g3tpjVJmpQRfaU
         AKIQ==
X-Gm-Message-State: AOAM533Ii+XpFR/CMgJDs2DCEPWplJ1ScAfLiITJ4SKgIMc3dNqncRSY
        WjcaQbCnGpV/TWV6v2jIZBeRYovAGstCkWtP5lhrfw==
X-Google-Smtp-Source: ABdhPJwUacFvwa5jgHiv6pmGkp1BUF/hJ4tg1ELRf+uCbeCELolsSVhbS0cMk5QzQOx/Lcicejc2EtflaSp8RWugJoM=
X-Received: by 2002:a02:cc54:: with SMTP id i20mr16831712jaq.136.1607697232501;
 Fri, 11 Dec 2020 06:33:52 -0800 (PST)
MIME-Version: 1.0
References: <20201210132315.5785-1-brgl@bgdev.pl> <20201210135627.GH4077@smile.fi.intel.com>
 <CAMRc=McJLC23-RcOH+EyCWiwhSjgwfjS4W=tCijBmqWUcqdVRg@mail.gmail.com> <20201211143129.GR4077@smile.fi.intel.com>
In-Reply-To: <20201211143129.GR4077@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 11 Dec 2020 15:33:41 +0100
Message-ID: <CAMRc=Md8p-JbyM4fQzFry7_7gHwcDy9CE0NRH_6vWPuVfj-Opg@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 00/14] treewide: start shaving off cruft for v2.0
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 11, 2020 at 3:30 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Dec 11, 2020 at 09:38:44AM +0100, Bartosz Golaszewski wrote:
> > On Thu, Dec 10, 2020 at 2:55 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > On Thu, Dec 10, 2020 at 02:23:01PM +0100, Bartosz Golaszewski wrote:
> > > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > >
> > > > The following series removes a lot of interfaces that were deemed overkill
> > > > in libgpiod and the removal of which was suggested to me before proceeding
> > > > with the new API.
> > > >
> > > > This leaves a couple holes in the library but we'll follow them up with
> > > > more improvements all over the tree. We'll create a new object called
> > > > gpiod_request for dealing with line requests of arbitrary size. We'll
> > > > probably remove the the bulk objects from bindings and eventually we'll
> > > > switch to using the v2 kernel uAPI.
> > > >
> > > > Andy - a note for you: I know you're always very thorough in your reviews
> > > > but in this case let's consider this series preparing a construction zone
> > > > for the new API. Please don't nitpick too much. :)
> > >
> > > I don't know what you are talking about. The series looks nice, esp. taking
> > > into account statistics! FWIW,
> > >
> > > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > >
> > > One side note, though. Are you already plan to support autotools-2.70?
> > >
> >
> > Isn't it already supported? 2.69 is the minimum version, 2.70 should just work.
>
> Have you read an article on LWN about changes [1]? There are a lot of
> incompatibilities (note between 2.69 and 2.70 _8_ years passed).
>
> [1]: https://lwn.net/Articles/839395/
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

How will distros handle the incompatibilities? I don't think all
projects - many no longer even supported - will suddenly switch to new
autoconf.

Bartosz
