Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D06A8195844
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2020 14:47:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727115AbgC0NrC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Mar 2020 09:47:02 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:46585 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726959AbgC0NrC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Mar 2020 09:47:02 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1jHpK5-0004zc-V7; Fri, 27 Mar 2020 14:46:57 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1jHpK5-0007gG-Bv; Fri, 27 Mar 2020 14:46:57 +0100
Date:   Fri, 27 Mar 2020 14:46:57 +0100
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Mark Brown <broonie@kernel.org>
Cc:     Marek Vasut <marek.vasut@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        linux-gpio@vger.kernel.org
Subject: Re: register access issues in pca953x gpio driver
Message-ID: <20200327134657.5yes5wh6c4u3nu54@pengutronix.de>
References: <20200327074922.vrxbcjw2xlrv2bkb@pengutronix.de>
 <20200327130321.GA4437@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200327130321.GA4437@sirena.org.uk>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Mark,

On Fri, Mar 27, 2020 at 01:03:21PM +0000, Mark Brown wrote:
> On Fri, Mar 27, 2020 at 08:49:22AM +0100, Uwe Kleine-König wrote:
> 
> > @broonie: I don't know regmap good enough to instantly know the right
> > magic to do this. Can you give a rough overview what would be needed?
> 
> If you want to dynamically change if the register is autoincrementing
> you're going to have to add stuff to regmap for that, it understands
> devices that autoincrement and devices that don't autoincrement but
> there's currently nothing for transitioning between the two.

I'm not entirely sure, but I think they all support autoincrementing but
some need the flag set and others don't. I imagine that this should be
modeled as register range [0-0x7f] (as AI = 0x80) and the accessor
callbacks have to set AI or not depending on the chip.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |
