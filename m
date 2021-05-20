Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1794D38A4AC
	for <lists+linux-gpio@lfdr.de>; Thu, 20 May 2021 12:06:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235623AbhETKHj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 May 2021 06:07:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:37782 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231854AbhETKFb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 20 May 2021 06:05:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4A2DA6193E;
        Thu, 20 May 2021 09:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621503680;
        bh=vZajh5UbMpDz/Iqesx+IBHa7vHiuendi2Mqnx13uUb4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LKltMB401mPIjUwQwe43sMun7geDKntsB7NV4npSSnbzASTxoEKGNgZeVJJ8Nnfn8
         P1mDdg75HvhQKqRazcvWorB42JE8FGHEdUxmUSTV7wbuKCOS7xCp0mu0HmOOfqJKiJ
         Pghm2eUI0GDQ+gAchnKg1c05CLOPloPcdUDoJWLYTle4T6An3IeCQasGEoNRlgQ6r+
         kDSHeTcylhiG5T09AlB+yuQvb9dqx+HrpzBCK45UmqdEs77qfFWCAfojYW+V0DP9At
         /t6TbUY12DE7Vq8uA95f3zCz3MrE6/ix6iMeJQP5YT6PpnVfhLzrOCCuRxr7Dyx+0h
         FDjOwob/ayeSQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1ljfB9-0002BA-O9; Thu, 20 May 2021 11:41:19 +0200
Date:   Thu, 20 May 2021 11:41:19 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Kent Gibson <warthog618@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/1] gpiolib: Introduce for_each_gpio_desc_if() macro
Message-ID: <YKYuv+pD4lgmrwdu@hovoldconsulting.com>
References: <20210518083339.23416-1-andriy.shevchenko@linux.intel.com>
 <YKYYp6Z4HAYHLaFz@hovoldconsulting.com>
 <CAHp75Vf_tQxPcRa_ObYngUFQqzFrx2RyUcqemyeHFDOD1XEnbQ@mail.gmail.com>
 <YKYe4rgGTDRfq+va@hovoldconsulting.com>
 <YKYo5EBBDbSDiIwD@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YKYo5EBBDbSDiIwD@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 20, 2021 at 12:16:20PM +0300, Andy Shevchenko wrote:
> On Thu, May 20, 2021 at 10:33:38AM +0200, Johan Hovold wrote:
> > On Thu, May 20, 2021 at 11:15:31AM +0300, Andy Shevchenko wrote:
> > > On Thu, May 20, 2021 at 11:07 AM Johan Hovold <johan@kernel.org> wrote:
> > > > On Tue, May 18, 2021 at 11:33:39AM +0300, Andy Shevchenko wrote:
> > 
> > > > The _if suffix here is too vague.
> > > >
> > > > Please use a more descriptive name so that you don't need to look at the
> > > > implementation to understand what the macro does.
> > > >
> > > > Perhaps call it
> > > >
> > > >         for_each_gpio_desc_with_flag()

> > > > or just add the more generic macro
> > > >
> > > >         for_each_gpio_desc()
> > > >
> > > > and open-code the test so that it's clear what's going on here.
> > 
> > FWIW, NAK due to the non-descriptive for_each_desc_if() name.
> 
> Btw, missed argument
> 
> ..._with_flag(..., FLAG_...)
> 
> breaks the DRY principle. If you read current code it's clear with that
> 
> _if(..., FLAG_...)

That we have precisely zero for_each_ macros with an _if suffix should
also give you a hint that this is not a good idea.

Again, you shouldn't have to look at the implementation to understand
what a helper does.

Johan
