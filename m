Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A49111BC21B
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2020 16:58:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728045AbgD1O6l (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Apr 2020 10:58:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727108AbgD1O6l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 28 Apr 2020 10:58:41 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12199C03C1AB
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 07:58:41 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id g10so17066221lfj.13
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 07:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=AI/lAl2E39n1eOLRzzi7kmT9878t5PM3d6Yd1uaMdxI=;
        b=Je3aj6V0coCuXOHuX9V2/3Tz7gBuN7LSSoayvjoylpdiQsHmqV+Clntyta7S7f9pH2
         /+OkDRLIjBYMQDsrUwvBfmAgX4imusgpfYZkfpEH84k5cUr+b6tQmrChTCyOJ9LSEm53
         YRo2Bpn/26bcwZUrdYH0rfA2v91mHhqaR/RgJJpQzxeG6W8795cmtIn8KJcRUaEBddpS
         TUQXQ6t6dQP//9HPgDCGKBn0WBOl6Bujgi/O0ZSV06a4gOo48UkzVwzvvp7NTjppssQK
         jSKbgifqj9epfO8SwkjiWdhXQYut/l2emHfU/RalppnwkLOciehN6woaOhN3o08h1lci
         kclQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=AI/lAl2E39n1eOLRzzi7kmT9878t5PM3d6Yd1uaMdxI=;
        b=H0ODB018rBA5YJ1vnIDo+MeW9F8ks7gCNFwQZq4RfOnyFO7SrcbQPSLgVV41uD+skD
         WWu4fMz/DZiDkMvGOP1JktupmQ30gjpQRD7wi1o5jC53t7gudYRG+LyBg9vyBfygXDGH
         UXHt7RigdW5qSB4pD++XIwcRKK758VvsCB8n410HyCeeXkHjUfiTXb17ZiHK/xm7SCkN
         dQ6ktukrY2/+mFM9fAeKUXTUehJENX793xWfXjaFfqr7I2n5Xe+0d1Ez97JYjdphkj9m
         Ezm2nDY6BkHXAcycdcwQe8YbuyvtxqE73L0vdR/6gyLz+6qDFlL8amekp5J/9ilf4D0C
         o1Ug==
X-Gm-Message-State: AGi0Pua2GU8O2Riw5WivqqrHhW1i8sXxRfczwY/nK3xqDXKJytaOu7gk
        Eh9E2nJD99FwNgHLtz5lgdUXB3oRNGtmOHvNul97OQ==
X-Google-Smtp-Source: APiQypKai5078NnTqqUdcWSa7D87j+Ii4ct8v3YUt0zDo3a9RNp94NFAyzhgndaoptxuukFTOnQQbaaRngpT5kxHAJU=
X-Received: by 2002:ac2:4554:: with SMTP id j20mr19740573lfm.91.1588085919444;
 Tue, 28 Apr 2020 07:58:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200420172752.33588-1-andriy.shevchenko@linux.intel.com>
 <20200421130300.GK185537@smile.fi.intel.com> <CAMpxmJVVDUN6ei__wt5z+hOJQ0w0r9TZjhN9HCtpCA8Vrud0qg@mail.gmail.com>
 <CACRpkdYDHiscnm0BrSTwG6=-SCWZeqVfnEEkMAeQcco77GM8kg@mail.gmail.com>
 <20200428124129.GR185537@smile.fi.intel.com> <CAD56B7cR9asgW-6PS7V+jZ8O7AYeYuH9egnF1G0uoQQaS9GhMA@mail.gmail.com>
 <20200428141857.GW185537@smile.fi.intel.com>
In-Reply-To: <20200428141857.GW185537@smile.fi.intel.com>
From:   Paul Thomas <pthomas8589@gmail.com>
Date:   Tue, 28 Apr 2020 10:58:28 -0400
Message-ID: <CAD56B7eBsLUoLGybzvk-4qQA67-5dCV=UaKFO=zOar6ZVLcaaw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] gpio: pca953x: Rewrite ->get_multiple() function
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 28, 2020 at 10:18 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Apr 28, 2020 at 09:09:03AM -0400, Paul Thomas wrote:
> > On Tue, Apr 28, 2020 at 8:41 AM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > On Tue, Apr 28, 2020 at 02:13:21PM +0200, Linus Walleij wrote:
> > > > On Tue, Apr 21, 2020 at 5:42 PM Bartosz Golaszewski
> > > > <bgolaszewski@baylibre.com> wrote:
> > > > > wt., 21 kwi 2020 o 15:03 Andy Shevchenko
> > > > > <andriy.shevchenko@linux.intel.com> napisa=C5=82(a):
> > > > > > On Mon, Apr 20, 2020 at 08:27:50PM +0300, Andy Shevchenko wrote=
:
> > >
> > > ...
> > >
> > > > I don't mind trying to put in code to optimize use cases
> > > > when accessing single bytes here either. But I'd like there
> > > > to be explicit comments in the code saying why these
> > > > optimizations are there. Can we do those on top of
> > > > this (hopefully) known working base?
> > For the record my original get_multiple patch was a known working base.
> >
> > >
> > > As I pointed out to Paul, the optimization like he proposed is not ba=
d thing
> > > per se, the implementation is. On top of that I suggested to take a l=
ook to IRQ
> > > status bits, which presumable will leverage from this optimization as=
 well.
> > >
> > > So, After applying this series it would be matter of change one line =
in the
> > > ->get_multiple() to replace read_regs() with optimized version or so =
along with
> > > IRQ bits changes.
> >
> > This new function would then at least need to be called with mask as
> > an additional argument right? Then the bitmap_replace() will set
> > everything regardless of if it was read, this is fine I suppose
> > because it doesn't matter if it's setting bits outside of mask. You
> > just have two loops one in the new function and one in
> > bitmap_replace().
>
> Note, on 64-bit architectures there is no loop in bitmap ops (since 40 <=
=3D 64 in
> this case). On 32-bit it might be (only for 40 case, which I think less p=
resent
> in the wild than the rest). And bitmap ops are optimized over longs, so, =
it's
> pretty much fast (esp. in comparison to I=C2=B2C IO).
>
> > If this is what people would like to see I can work
> > on it. I did look into the sparse reads and it seems as though regmap
> > has a gather_write, but not a gather_read and gather_write isn't in
> > regmap-i2c.c anyway.
>
> Yes, I think this is the right way to go.
OK, sounds good.

-Paul

>
> --
> With Best Regards,
> Andy Shevchenko
>
>
