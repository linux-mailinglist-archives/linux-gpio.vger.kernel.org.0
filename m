Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 590411964CC
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Mar 2020 10:27:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725973AbgC1J1m (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 28 Mar 2020 05:27:42 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:50941 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725937AbgC1J1m (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 28 Mar 2020 05:27:42 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1jI7ka-0005KP-9t; Sat, 28 Mar 2020 10:27:32 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1jI7kY-0000b5-VA; Sat, 28 Mar 2020 10:27:30 +0100
Date:   Sat, 28 Mar 2020 10:27:30 +0100
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Marek Vasut <marek.vasut@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mark Brown <broonie@kernel.org>, kernel@pengutronix.de,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Subject: Re: [PATCH v1 2/2] [RFC] gpio: pca953x: drop unused parameters of
 pca953x_recalc_addr()
Message-ID: <20200328092730.rn7drxqtx7g2xsff@pengutronix.de>
References: <20200327074922.vrxbcjw2xlrv2bkb@pengutronix.de>
 <20200327172244.30816-1-u.kleine-koenig@pengutronix.de>
 <20200327172244.30816-3-u.kleine-koenig@pengutronix.de>
 <DF902AF8-CA86-4F31-9D98-288D40634D69@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DF902AF8-CA86-4F31-9D98-288D40634D69@goldelico.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 27, 2020 at 11:06:43PM +0100, H. Nikolaus Schaller wrote:
> 
> > Am 27.03.2020 um 18:22 schrieb Uwe Kleine-König <u.kleine-koenig@pengutronix.de>:
> > 
> > After the previous patch the two last parameters of
> > pca953x_recalc_addr() are unused and so can be dropped.
> > 
> > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > ---
> > drivers/gpio/gpio-pca953x.c | 31 +++++++++++--------------------
> > 1 file changed, 11 insertions(+), 20 deletions(-)
> > 
> > diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> > index 8168558299c2..f4943cad5d0e 100644
> > --- a/drivers/gpio/gpio-pca953x.c
> > +++ b/drivers/gpio/gpio-pca953x.c
> > @@ -325,8 +325,7 @@ static const struct regmap_config pca953x_ai_i2c_regmap = {
> > 	.max_register = 0x7f,
> > };
> > 
> > -static u8 pca953x_recalc_addr(struct pca953x_chip *chip, int reg, int off,
> > -			      bool write, bool addrinc)
> > +static u8 pca953x_recalc_addr(struct pca953x_chip *chip, int reg, int off)
> > {
> > 	int bank_shift = pca953x_bank_shift(chip);
> > 	int addr = (reg & PCAL_GPIO_MASK) << bank_shift;
> > @@ -338,7 +337,7 @@ static u8 pca953x_recalc_addr(struct pca953x_chip *chip, int reg, int off,
> > 
> > static int pca953x_write_regs(struct pca953x_chip *chip, int reg, unsigned long *val)
> > {
> > -	u8 regaddr = pca953x_recalc_addr(chip, reg, 0, true, true);
> > +	u8 regaddr = pca953x_recalc_addr(chip, reg, 0;
> 
> here is some ")" missing.
> 
> After fix&compile it still works for the pcal6524 of the OMAP5/Pyra
> (LPAE build).

Argh, it seems I didn't try to recompile after rebasing :-|

I'm still waiting for more feedback and then will send out a v2.

Thanks for your test,
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |
