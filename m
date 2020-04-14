Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45ED41A783C
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2020 12:16:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729439AbgDNKQA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Apr 2020 06:16:00 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:37071 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438130AbgDNKPz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Apr 2020 06:15:55 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1jOIba-0005HF-SP; Tue, 14 Apr 2020 12:15:46 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1jOIbZ-00089w-DZ; Tue, 14 Apr 2020 12:15:45 +0200
Date:   Tue, 14 Apr 2020 12:15:45 +0200
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Marek Vasut <marek.vasut@gmail.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Mark Brown <broonie@kernel.org>, kernel@pengutronix.de,
        linux-gpio@vger.kernel.org, Marcel Gudert <m.gudert@eckelmann.de>
Subject: Re: [PATCH v2 1/2] gpio: pca953x: fix handling of automatic address
 incrementing
Message-ID: <20200414101545.2bmzlid7c7aosbs6@pengutronix.de>
References: <20200330195018.27494-1-u.kleine-koenig@pengutronix.de>
 <20200330195018.27494-2-u.kleine-koenig@pengutronix.de>
 <20200331100759.GE1922688@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200331100759.GE1922688@smile.fi.intel.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

obviously I failed to Cc: the gpio maintainers. Should I resend because
of that?

On Tue, Mar 31, 2020 at 01:07:59PM +0300, Andy Shevchenko wrote:
> On Mon, Mar 30, 2020 at 09:50:17PM +0200, Uwe Kleine-König wrote:
> 
> ...
> 
> > The history of this bug is a bit complicated. Commit b32cecb46bdc
> > ("gpio: pca953x: Extract the register address mangling to single
> > function") changed which chips and functions are affected. Commit
> > 3b00691cc46a ("gpio: pca953x: hack to fix 24 bit gpio expanders") used
> > some duct tape to make the driver at least appear to work. Commit
> > 49427232764d ("gpio: pca953x: Perform basic regmap conversion")
> > introduced the caching. Commit b4818afeacbd ("gpio: pca953x: Add
> > set_multiple to allow multiple bits to be set in one write.") introduced
> > the .set_multiple() callback which didn't work for chips that need the
> > AI bit which was fixed later for some chips in 8958262af3fb ("gpio:
> > pca953x: Repair multi-byte IO address increment on PCA9575"). So I'm
> > sorry, I don't know which commit I should pick for a Fixes: line.
> 
> It's allowed to put more, but I rather utilize Depends-on for that.
> 
> So, something like
> 
> Fixes: b4818afeacbd ...
> Depends-on: 8958262af3fb ...

I don't know what is best here. Using

Fixes: b4818afeacbd ("gpio: pca953x: Add set_multiple to allow multiple bits to be set in one write.")

seems sensible. Not sure which commits are sensible to list in
Depends-on lines. I tend to just don't list any and then backport on
request of the stable maintainers iff and when application to older
versions failed.

Linus/Bartosz: Do you care for application of the tags according to your
taste?

Best regards
Uwe


-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |
