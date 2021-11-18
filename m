Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 466B9456431
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Nov 2021 21:30:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233255AbhKRUd2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Nov 2021 15:33:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233243AbhKRUd1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Nov 2021 15:33:27 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F51FC061574
        for <linux-gpio@vger.kernel.org>; Thu, 18 Nov 2021 12:30:27 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id y12so32479368eda.12
        for <linux-gpio@vger.kernel.org>; Thu, 18 Nov 2021 12:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wwg+Ca9jb9pUEm7rE+CduZsgo7GneYWcNrMAsYNN4w0=;
        b=J9QOzTq127+fjB9bPz1Tnkq8fAIAL3i5cPhju4I+zno7r6Z0aHsjUzVuJ+w32/a2Q7
         RIO526yWOq/eal3vMxgZIKyyhjNMlEhgJs1eDXiPQE0NsNprB6qriiR7Wgsbrecrq+ez
         QuyIbgcopabzqAIu2L6lhS70RNLKh00a3v3a2ZprgWdnPCFAeWW0kiwblid1NUwc96yC
         Tp8dl/pjplMx8XddvkdoNoROcC0Sub/8IwP0p5ArtnbG4R3QPLL74z9buVSle0iD2Nc0
         5tLmpZhp7pg5CqPUA69D4PYecmNlT74wayeiqMWMg/ZYZsNGalBVUnMwRNtMKDhXAECX
         o9NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wwg+Ca9jb9pUEm7rE+CduZsgo7GneYWcNrMAsYNN4w0=;
        b=xSzyutePb3ZZkWV8mCBj1DSeQRQZrGyRDDyTYxyqUvYUAi8pZHaTqo2lGGfh7YqrnB
         ZhGhOd14cStZyEAnNUGWXTtg5feCmWEda4q0jr/Oh8TkF0Z2x852DneQHwf4rKmPrNqd
         PNeHNyTNKSQiHBzBvs+OzJNj8V8l4+UP5EO0IKyBSRwx81TT6cDf7DdryHhWkH6Hsn4o
         zqUhA3GVyRXjg0O4xTX/5CoCv/T3rlO3ARt8xxg3dr9aiG8GPLE7H9KnvCT7vgv3viwS
         QuQBJGvIPe/tSLcpo6AJag2pjiLlo5fFJTLcOd8yU746M26GOnLAYKJijqLgh2pTtTtG
         9gog==
X-Gm-Message-State: AOAM531hrgpteILmr/fAAhyAZG2i9eDGZOtu0gvuYKNGYeJGwnhO9ZW9
        yEttvwuPk6KKRSvO/gGIcnPPwoIyrGLqZwa9joSZJg==
X-Google-Smtp-Source: ABdhPJwmTWmlHt4Iw5Q0nSvh9x75b6Y1V3AEdkg+yigj2bPoOupsbO8rrcQLoT70uyjwd8iVWqIasKW1gEPKi1IWv7Q=
X-Received: by 2002:a50:ef02:: with SMTP id m2mr15409971eds.172.1637267425669;
 Thu, 18 Nov 2021 12:30:25 -0800 (PST)
MIME-Version: 1.0
References: <20211105124242.27288-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdZ2-MRY_L2J4RvKDNW1yyThg7KUFbd80ZMpRY209RNxnw@mail.gmail.com>
 <YZJDFhMNyRaH+HFE@smile.fi.intel.com> <YZaFuGZ4AEN8HjUv@smile.fi.intel.com>
In-Reply-To: <YZaFuGZ4AEN8HjUv@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 18 Nov 2021 21:30:14 +0100
Message-ID: <CAMRc=MfD54gjMcZazJqXKUMTaW45_qKH6GSLOfs4eciKGtfrCw@mail.gmail.com>
Subject: Re: [PATCH v1 01/19] lib/string_helpers: Introduce kasprintf_strarray()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jianqun Xu <jay.xu@rock-chips.com>,
        Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Bamvor Jian Zhang <bamv2005@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 18, 2021 at 5:56 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Nov 15, 2021 at 01:23:02PM +0200, Andy Shevchenko wrote:
> > On Tue, Nov 09, 2021 at 12:42:00PM +0100, Linus Walleij wrote:
> > > On Fri, Nov 5, 2021 at 1:43 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > > We have a few users already that basically want to have array of
> > > > sequential strings to be allocated and filled.
> > > >
> > > > Provide a helper for them (basically adjusted version from gpio-mockup.c).
> > > >
> > > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > >
> > > Fulfils Rusty Russell's API design hierarchy requirements
> > > and help people to make less mistakes so:
> > > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> >
> > Thanks!
> >
> > Should I resend, take into mine PR, or you just apply it as is?
> >
> > As I answered previously the series doesn't require additional work
> > from my perspective.
>
> Okay, I'm about to send a PR to you and Bart for this.
> Does it sound good?
>

Sounds good to me.

Bart
