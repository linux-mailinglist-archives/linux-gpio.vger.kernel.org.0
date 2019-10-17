Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43647DAA52
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2019 12:49:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408979AbfJQKtD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Oct 2019 06:49:03 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:40285 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404935AbfJQKtD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Oct 2019 06:49:03 -0400
X-Originating-IP: 86.207.98.53
Received: from localhost (aclermont-ferrand-651-1-259-53.w86-207.abo.wanadoo.fr [86.207.98.53])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 57C6360007;
        Thu, 17 Oct 2019 10:49:00 +0000 (UTC)
Date:   Thu, 17 Oct 2019 12:48:59 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     "dmurphy@ti.com" <dmurphy@ti.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
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
Message-ID: <20191017104859.GC3125@piout.net>
References: <cover.1571302099.git.matti.vaittinen@fi.rohmeurope.com>
 <9ccc83f3dfd0fd0dc8178adf41b52115f960c45a.1571302099.git.matti.vaittinen@fi.rohmeurope.com>
 <20191017101225.GB3125@piout.net>
 <a1aa91f74b41033fed4a7106247f48f9b9f78bd9.camel@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1aa91f74b41033fed4a7106247f48f9b9f78bd9.camel@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 17/10/2019 10:36:44+0000, Vaittinen, Matti wrote:
> Hello Alexandre,
> 
> Thanks for quick check! I'll be off for the rest of the week but I will
> re-work this patch at next week :) I agree with you regarding most of
> the comments.
> 
> > > +
> > > +
> > > +/*
> > > + * RTC definitions shared between
> > > + *
> > > + * BD70528
> > > + * and BD71828
> > > + */
> > > +
> > > +#define ROHM_BD1_MASK_RTC_SEC		0x7f
> > > +#define ROHM_BD1_MASK_RTC_MINUTE	0x7f
> > > +#define ROHM_BD1_MASK_RTC_HOUR_24H	0x80
> > > +#define ROHM_BD1_MASK_RTC_HOUR_PM	0x20
> > > +#define ROHM_BD1_MASK_RTC_HOUR		0x3f
> > > +#define ROHM_BD1_MASK_RTC_DAY		0x3f
> > > +#define ROHM_BD1_MASK_RTC_WEEK		0x07
> > > +#define ROHM_BD1_MASK_RTC_MONTH		0x1f
> > > +#define ROHM_BD1_MASK_RTC_YEAR		0xff
> > > +#define ROHM_BD1_MASK_ALM_EN		0x7
> > > +
> > 
> > All that renaming is distracting and useless. Please resubmit without
> > renaming defines, structs and functions to make it easier to review.
> 
> I would prefer renaming because it makes it clearly visible which
> defines/structs/functions are common for both PMICs and which are PMIC
> specific. But I really understand the problem of spotting real changes.
> Would it be Ok if I did renaming in separate patch which does not bring
> in any other changes - and then the functional changes in separate
> patch?
> 

No, unless you can guarantee that all future PMICs from rohm matching
the wildcard will use this driver.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
