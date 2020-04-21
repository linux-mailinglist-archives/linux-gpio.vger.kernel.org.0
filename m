Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AB1C1B2903
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2020 16:06:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728524AbgDUOG3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Apr 2020 10:06:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726691AbgDUOG3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 21 Apr 2020 10:06:29 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FB03C061A10
        for <linux-gpio@vger.kernel.org>; Tue, 21 Apr 2020 07:06:29 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1jQtXd-0005xZ-13; Tue, 21 Apr 2020 16:06:25 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1jQtXc-0001nd-5d; Tue, 21 Apr 2020 16:06:24 +0200
Date:   Tue, 21 Apr 2020 16:06:24 +0200
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Paul Thomas <pthomas8589@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v3 1/3] gpio: pca953x: Rewrite ->get_multiple() function
Message-ID: <20200421140624.sipahotlak5ukrxy@pengutronix.de>
References: <20200420172752.33588-1-andriy.shevchenko@linux.intel.com>
 <CAD56B7da+DDxpMvvntmq_nQaZ8aiJ+up4CY5QQ6t2hz_C8LhjQ@mail.gmail.com>
 <20200421125553.GJ185537@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200421125553.GJ185537@smile.fi.intel.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Andy,

first of all thanks for picking up my patches, very appreciated.

On Tue, Apr 21, 2020 at 03:55:53PM +0300, Andy Shevchenko wrote:
> On Mon, Apr 20, 2020 at 11:23:57PM -0400, Paul Thomas wrote:
> > On Mon, Apr 20, 2020 at 1:27 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > The commit 96d7c7b3e654 ("gpio: gpio-pca953x, Add get_multiple function")
> > > basically did everything wrong from style and code reuse perspective, i.e.
> > Hi Andy,
> > 
> > Well your version is certainly elegant and simple, and does better
> > with code reuse. However there are a couple of other goals I had in
> > mind.
> > First, the "lazy" approach of 96d7c7b3e654 is actually faster when
> > user space sets up a 8-bit linehandle[1]146us (single regmap_read())
> > vs 172us (pca953x_read_regs()) which incidentally is what we do in our
> > application. In lazily reading 1 byte at a time it is the fastest
> > access for that, if user space is always setting up the linehandle for
> > the whole chip pca953x_read_regs() would be faster. Seeing as
> > get_multiple has been unimplemented for this chip until now perhaps
> > our use case deserves some consideration?
> 
> I understand completely your goal, but
> - for I²C expanders timings is the last thing to look for (they are quite slow
>   by nature), so, I really don't care about 16% speed up for one call; don't
>   forget that we are in multi-task OS, where this can be easily interrupted and
>   user will see the result quite after expected quick result

I didn't do any timing analysis and while I understand your
argumentation, I'm not sure to agree. I noticed while debugging the
problem that then resulted in my fix that gpioctl uses the .set_multiple
callback. I told my customer to use gpioctl instead of /sys/class/gpio
because it performs better just to notice that when using gpioctl to set
a single GPIO this transfers five bytes instead of only two.

Having said that I think the sane approach is to optimize
.{g,s}et_multiple to reduce the read/write size to the smallest bulk
size possible that covers all bits that have their corresponding bit set
in mask.

> - the code maintenance has a priority over micro-optimization (this driver
>   suffered many times of breakages because of some optimizations done)

ack here. Some parts of the driver were harder to grasp than necessary.

> - it breaks Uwe's approach to fix AI chips, after my patch Uwe's ones are
>   applied cleanly

I didn't check, is 96d7c7b3e654 broken for some chips?

I will add my suggested optimisation to my todo list for evaluation. If
I think it is still nice and maintainable I'll send a patch. Until I
have looked into this (or someone else did) I'm in favour of applying
Andy's patch.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |
