Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2ACB56404
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2019 10:10:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726339AbfFZIKy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Jun 2019 04:10:54 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:36647 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725954AbfFZIKy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Jun 2019 04:10:54 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1hg312-0001Wk-QE; Wed, 26 Jun 2019 10:10:52 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1hg311-0007Gu-6Q; Wed, 26 Jun 2019 10:10:51 +0200
Date:   Wed, 26 Jun 2019 10:10:51 +0200
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thierry Reding <treding@nvidia.com>,
        Thorsten Scherer <t.scherer@eckelmann.de>
Subject: Re: [PATCH] gpio: siox: Pass irqchip when adding gpiochip
Message-ID: <20190626081051.bw5qlimpmrrcanam@pengutronix.de>
References: <20190625105346.3267-1-linus.walleij@linaro.org>
 <20190625193328.sxvhastsatc62msh@pengutronix.de>
 <CACRpkdaKY-SScLRrOGQbZwRX5sYP=A9ABKxwj3YA_XLp839FEw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdaKY-SScLRrOGQbZwRX5sYP=A9ABKxwj3YA_XLp839FEw@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Linus,

On Wed, Jun 26, 2019 at 10:05:42AM +0200, Linus Walleij wrote:
> On Tue, Jun 25, 2019 at 9:33 PM Uwe Kleine-König
> <u.kleine-koenig@pengutronix.de> wrote:
> > On Tue, Jun 25, 2019 at 12:53:46PM +0200, Linus Walleij wrote:
> 
> > > The siox GPIO driver passes a IRQ_TYPE_EDGE_RISING as
> > > default IRQ trigger type which seems wrong, as consumers
> > > should explicitly set this up, so set IRQ_TYPE_NONE instead.
> > >
> > > Also gpiochip_remove() was called on the errorpath if
> > > gpiochip_add() failed: this is wrong, if the chip failed
> > > to add it is not there so it should not be removed.
> >
> > So we have a bugfix (gpiochip_remove() in error path), a change of
> > default behaviour (IRQ_TYPE_EDGE_RISING -> IRQ_TYPE_NONE) and a cleanup
> > for an API change (I'm guessing here) in a single patch. :-|
> 
> Yes I tend to do that to save time because I am a bit overwhelmed
> by all the stuff that falls upwards to the GPIO maintainer.
> 
> More often than not there is zero feedback from the maintainer(s)
> of the drivers, and the kernel looks better after than before.
> 
> But since you provide some feedback I'll just go and split
> the patch.

\o/, thanks.

> > @Thorsten: I'm not entirely sure if there is code relying on the default
> > IRQ_TYPE_EDGE_RISING. Do you know off-hand?
> 
> I saw that the driver has #include <linux/of.h> (hm seems unused) so
> if this is used on devicetree systems with normal twocell irqchips then
> there shouldn't be a need for any default type. The default type
> is only used with board files. The siox seems not even possible
> to use with board files (no platform data path).

I think the gpio irq is used from userspace. If you're convinced it
doesn't matter (and you describe that in the commit log) I'm willing to
believe you :-)

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
