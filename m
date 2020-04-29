Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EBC51BDA81
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2020 13:21:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbgD2LVs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Apr 2020 07:21:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726554AbgD2LVr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 29 Apr 2020 07:21:47 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FF6DC03C1AD
        for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2020 04:21:47 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id c23so1425986qtp.11
        for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2020 04:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=H15ePqVaz6MlNp1qbpqNmeMZQJI+F3pchrLdRA2nTd8=;
        b=v0+JrhwzkWp2nrIdY8/ubVTe/YRtC7RnC4KdsNZ/RijNZ5tLJWt6WUZBaFMZI3V1Aw
         8fw+sZmL0IEcCq+3SyWWpN7SFie/mCn4qjraCcRTSRyiB/coyn0cb5+wb7fH4Um2rpX7
         we/CARi0eNqL7TINbTG+NS8tG7fUywOfy/LHuJlj0w9MdhyrnpMcSCK0CVJXsiZ/hTvP
         ZhQW35gwPNjgcsnYxg6sPBwk2QQyNuUybrb+0wPH1aYApqLl/oYzqyy4JG1AAKAtoEjt
         ewETE6o6QOK+Q03b+qmkr5WxmimJMGL9zGE2uDoL2tsSbeHvxe85NzzcCLXD5wIJGtU3
         4Q9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=H15ePqVaz6MlNp1qbpqNmeMZQJI+F3pchrLdRA2nTd8=;
        b=sfnQF9N7BPYCwXDyrA+K5tT0YESmGUuph1p+J3XMOGTsEv3IkfM28BpcSlz0AgVqVY
         8lpfiif+BMFt53VUukEO8j9KWM6zxna0FgtuSq+bFMoyJ9RzU+QLL0vTIyxT2Zt47+am
         zqqTLdVnzL4ulxmfdgtxHnYzrlsIuS9kmoY+01mV+vSbKX4CbEhrkGBvr5XQm18Fx22k
         JlscN2r6BMr7VmUlulC4yGlPjz5ZENwboS1BI0RwKbDEEGVBpdblwgGnTF2v6Knuxz+7
         klT1zKNpSbmxk2GisD7fzH45oflC0lSpTWM+XEC9JJv4kFqGZIQHNq2i8juvNqIuUgA4
         sMEA==
X-Gm-Message-State: AGi0PuYRFZ7eId8ITzhPxI6JHKpe1TJZQ6qFgwlS0Il1JzWtnOluld9s
        5uukidhCottPuApgdXS8ELYesqZ/Uq4GprowSTIifg==
X-Google-Smtp-Source: APiQypKGL7WhC7+GVipfd9MJ7ZAN1+SrdSJ0AAHOm3JOtQ2okTTuryj+NMfIgY2dU/cnadUQGW2dSD/6k4j0jB8rBng=
X-Received: by 2002:ac8:346f:: with SMTP id v44mr32766425qtb.27.1588159306759;
 Wed, 29 Apr 2020 04:21:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200420172752.33588-1-andriy.shevchenko@linux.intel.com>
 <20200421130300.GK185537@smile.fi.intel.com> <CAMpxmJVVDUN6ei__wt5z+hOJQ0w0r9TZjhN9HCtpCA8Vrud0qg@mail.gmail.com>
 <CACRpkdYDHiscnm0BrSTwG6=-SCWZeqVfnEEkMAeQcco77GM8kg@mail.gmail.com>
 <20200428124129.GR185537@smile.fi.intel.com> <CAD56B7cR9asgW-6PS7V+jZ8O7AYeYuH9egnF1G0uoQQaS9GhMA@mail.gmail.com>
 <20200428141857.GW185537@smile.fi.intel.com> <CAD56B7eBsLUoLGybzvk-4qQA67-5dCV=UaKFO=zOar6ZVLcaaw@mail.gmail.com>
In-Reply-To: <CAD56B7eBsLUoLGybzvk-4qQA67-5dCV=UaKFO=zOar6ZVLcaaw@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 29 Apr 2020 13:21:35 +0200
Message-ID: <CAMpxmJVHeWWxgdOMF=v2CW+g=3jR+vWvnK2=jOQQc0V13aj8UA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] gpio: pca953x: Rewrite ->get_multiple() function
To:     Paul Thomas <pthomas8589@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 28 kwi 2020 o 16:58 Paul Thomas <pthomas8589@gmail.com> napisa=C5=82(a=
):
>
> On Tue, Apr 28, 2020 at 10:18 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Tue, Apr 28, 2020 at 09:09:03AM -0400, Paul Thomas wrote:
> > > On Tue, Apr 28, 2020 at 8:41 AM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > >
> > > > On Tue, Apr 28, 2020 at 02:13:21PM +0200, Linus Walleij wrote:
> > > > > On Tue, Apr 21, 2020 at 5:42 PM Bartosz Golaszewski
> > > > > <bgolaszewski@baylibre.com> wrote:
> > > > > > wt., 21 kwi 2020 o 15:03 Andy Shevchenko
> > > > > > <andriy.shevchenko@linux.intel.com> napisa=C5=82(a):
> > > > > > > On Mon, Apr 20, 2020 at 08:27:50PM +0300, Andy Shevchenko wro=
te:
> > > >
> > > > ...
> > > >
> > > > > I don't mind trying to put in code to optimize use cases
> > > > > when accessing single bytes here either. But I'd like there
> > > > > to be explicit comments in the code saying why these
> > > > > optimizations are there. Can we do those on top of
> > > > > this (hopefully) known working base?
> > > For the record my original get_multiple patch was a known working bas=
e.
> > >
> > > >
> > > > As I pointed out to Paul, the optimization like he proposed is not =
bad thing
> > > > per se, the implementation is. On top of that I suggested to take a=
 look to IRQ
> > > > status bits, which presumable will leverage from this optimization =
as well.
> > > >
> > > > So, After applying this series it would be matter of change one lin=
e in the
> > > > ->get_multiple() to replace read_regs() with optimized version or s=
o along with
> > > > IRQ bits changes.
> > >
> > > This new function would then at least need to be called with mask as
> > > an additional argument right? Then the bitmap_replace() will set
> > > everything regardless of if it was read, this is fine I suppose
> > > because it doesn't matter if it's setting bits outside of mask. You
> > > just have two loops one in the new function and one in
> > > bitmap_replace().
> >
> > Note, on 64-bit architectures there is no loop in bitmap ops (since 40 =
<=3D 64 in
> > this case). On 32-bit it might be (only for 40 case, which I think less=
 present
> > in the wild than the rest). And bitmap ops are optimized over longs, so=
, it's
> > pretty much fast (esp. in comparison to I=C2=B2C IO).
> >
> > > If this is what people would like to see I can work
> > > on it. I did look into the sparse reads and it seems as though regmap
> > > has a gather_write, but not a gather_read and gather_write isn't in
> > > regmap-i2c.c anyway.
> >
> > Yes, I think this is the right way to go.
> OK, sounds good.
>

I applied the whole series to my for-next branch. I'll soon send a PR to Li=
nus.

Bart
