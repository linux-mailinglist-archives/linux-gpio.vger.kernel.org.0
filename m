Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F34CE89F1
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Oct 2019 14:51:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388890AbfJ2Nuv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Oct 2019 09:50:51 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:39625 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388773AbfJ2Nuv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Oct 2019 09:50:51 -0400
X-Originating-IP: 92.184.102.232
Received: from localhost (unknown [92.184.102.232])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 734B0FF811;
        Tue, 29 Oct 2019 13:50:32 +0000 (UTC)
Date:   Tue, 29 Oct 2019 14:50:21 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     "dmurphy@ti.com" <dmurphy@ti.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "pavel@ucw.cz" <pavel@ucw.cz>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>
Subject: Re: [RFC PATCH 09/13] mfd: rtc: support RTC on ROHM BD71828 with
 BD70528 driver
Message-ID: <20191029135021.GC11234@piout.net>
References: <cover.1571302099.git.matti.vaittinen@fi.rohmeurope.com>
 <9ccc83f3dfd0fd0dc8178adf41b52115f960c45a.1571302099.git.matti.vaittinen@fi.rohmeurope.com>
 <20191017101225.GB3125@piout.net>
 <a1aa91f74b41033fed4a7106247f48f9b9f78bd9.camel@fi.rohmeurope.com>
 <20191017104859.GC3125@piout.net>
 <bf7a8ce661277aca3c4dede5fb17ef4163a56027.camel@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf7a8ce661277aca3c4dede5fb17ef4163a56027.camel@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 23/10/2019 10:27:43+0000, Vaittinen, Matti wrote:
> Hello again Alexandre,
> 
> On Thu, 2019-10-17 at 12:48 +0200, Alexandre Belloni wrote:
> > On 17/10/2019 10:36:44+0000, Vaittinen, Matti wrote:
> > > Hello Alexandre,
> > > 
> > > Thanks for quick check! I'll be off for the rest of the week but I
> > > will
> > > re-work this patch at next week :) I agree with you regarding most
> > > of
> > > the comments.
> > > 
> > > > > +
> > > > > +
> > > > > +/*
> > > > > + * RTC definitions shared between
> > > > > + *
> > > > > + * BD70528
> > > > > + * and BD71828
> > > > > + */
> > > > > +
> > > > > +#define ROHM_BD1_MASK_RTC_SEC		0x7f
> > > > > +#define ROHM_BD1_MASK_RTC_MINUTE	0x7f
> > > > > +#define ROHM_BD1_MASK_RTC_HOUR_24H	0x80
> > > > > +#define ROHM_BD1_MASK_RTC_HOUR_PM	0x20
> > > > > +#define ROHM_BD1_MASK_RTC_HOUR		0x3f
> > > > > +#define ROHM_BD1_MASK_RTC_DAY		0x3f
> > > > > +#define ROHM_BD1_MASK_RTC_WEEK		0x07
> > > > > +#define ROHM_BD1_MASK_RTC_MONTH		0x1f
> > > > > +#define ROHM_BD1_MASK_RTC_YEAR		0xff
> > > > > +#define ROHM_BD1_MASK_ALM_EN		0x7
> > > > > +
> > > > 
> > > > All that renaming is distracting and useless. Please resubmit
> > > > without
> > > > renaming defines, structs and functions to make it easier to
> > > > review.
> > > 
> > > I would prefer renaming because it makes it clearly visible which
> > > defines/structs/functions are common for both PMICs and which are
> > > PMIC
> > > specific. But I really understand the problem of spotting real
> > > changes.
> > > Would it be Ok if I did renaming in separate patch which does not
> > > bring
> > > in any other changes - and then the functional changes in separate
> > > patch?
> > > 
> > 
> > No, unless you can guarantee that all future PMICs from rohm matching
> > the wildcard will use this driver.
> > 
> I started re-working this patch and remembered my original idea
> regarding the naming :) I should have commented it as I had already
> forgotten it. You are correct what comes to the difficulty of using
> correct wild-cards. And I agree with you what comes to function and
> struct names like bd7xx28 - those are somewhat fragile as next PMIC
> which we want to support with this driver may be BD12345 - yielding our
> wild-card useless.
> 
> But if we take a look of common definitions in header rohm-shared.h
> which I added - those are prefixed as ROHM_BD1. My idea was introducing
> this common RTC define group 1 - which would be common define group for
> all devices which belong to BD1 group. Currently that would be BD71828
> and BD70528. What was missing is the comment explaining this (and lack
> of comment made this useless as even I forgot it already).
> 
> I already reverted this naming change and all BD70528 specific and
> common defines/functions/enums are prefixed with the good old BD70528.
> Only new definitions which I added for BD71828 are prefixed with
> BD71828. But how do you see the grouping the common defines to format
> ROHM_BD<group number>_FOO_BAR in the rohm-shared.h - with comment that
> group BD1 consists of definitions which are common for BD70528 and
> BD71828?
> 
> My only fear when using prefix BD70528 for common defines is that
> someone changes some defines to match the BD70528 data-sheet without
> evaluating if this impacts to other PMICs. It may be useless paranoia
> though - hence I am asking for your opinion at this phase. I can do
> this grouping in own patch - or just leave it as it is now in my local
> repo - with the old BD70528 being common prefix.
> 

I don't think those masks will ever change, all the BCD RTCs are using
the same.

Note that ROHM_BD1_MASK_RTC_HOUR_24H, ROHM_BD1_MASK_RTC_HOUR_PM and
ROHM_BD1_MASK_ALM_EN are bits and should use BIT() to make that clear.
Those may change later but I don't see how someone looking at the
BD70528 datasheet would get those wrong.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
