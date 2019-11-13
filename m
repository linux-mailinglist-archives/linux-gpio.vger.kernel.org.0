Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8AB25FAC97
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2019 10:09:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727208AbfKMJJG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Nov 2019 04:09:06 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:43717 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727171AbfKMJJF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Nov 2019 04:09:05 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1iUoe7-0000TC-92; Wed, 13 Nov 2019 10:09:03 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1iUoe6-0002mQ-73; Wed, 13 Nov 2019 10:09:02 +0100
Date:   Wed, 13 Nov 2019 10:09:02 +0100
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     "thorsten.scherer@eckelmann.de" <thorsten.scherer@eckelmann.de>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH 40/62] gpio: gpio-siox: Use new GPIO_LINE_DIRECTION
Message-ID: <20191113090902.dev6yxyxvbf6bupm@pengutronix.de>
References: <cover.1572945896.git.matti.vaittinen@fi.rohmeurope.com>
 <91a796dd2811b58f4be30875f5ef644f0e43f241.1572945896.git.matti.vaittinen@fi.rohmeurope.com>
 <20191111072715.GB4117@ws067.eckelmann.group>
 <e38b59d9c8bcf81bbd49fed2d9d17350d4dc4866.camel@fi.rohmeurope.com>
 <20191111104252.5ixcb2tpnj6n5e6t@pengutronix.de>
 <20191113084637.GA23872@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191113084637.GA23872@localhost.localdomain>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 13, 2019 at 10:46:37AM +0200, Matti Vaittinen wrote:
> On Mon, Nov 11, 2019 at 11:42:52AM +0100, Uwe Kleine-König wrote:
> > Hello Matti,
> > 
> > On Mon, Nov 11, 2019 at 07:43:50AM +0000, Vaittinen, Matti wrote:
> > > On Mon, 2019-11-11 at 08:27 +0100, Thorsten Scherer wrote:
> > > > Hello,
> > > > 
> > > > On Tue, Nov 05, 2019 at 12:30:58PM +0200, Matti Vaittinen wrote:
> > > > > It's hard for occasional GPIO code reader/writer to know if values
> > > > > 0/1
> > > > > equal to IN or OUT. Use defined GPIO_LINE_DIRECTION_IN and
> > > > > GPIO_LINE_DIRECTION_OUT to help them out.
> > > > > 
> > > > > Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> > > > 
> > > > for SIOX gpio:
> > > > 
> > > > Acked-by: Thorsten Scherer <t.scherer@eckelmann.de>
> > > > 
> > > > > Patches are compile-tested only. I have no HW to really test
> > > > > them.  Thus
> > > > > I'd appreciate carefull review. This work is mainly about
> > > > > converting
> > > > > zeros and ones to the new defines but it wouldn't be first time I
> > > > > get it wrong in one of the patches
> > > > > :)                                                   
> > > > 
> > > > Applied the patch(es) and tested them with SIOX device
> > > > 
> > > > Tested-by: Thorsten Scherer <t.scherer@eckelmann.de>
> > > 
> > > Big thanks! It's _really_ nice that someone takes the time to do the
> > > testing! Highly appreciated! :]
> > 
> > without wanting to devalue Thorsten's testing, I think testing your
> > series can be trivially done without a runtime check as your patches
> > won't change the compiled result. So just compile once without the patch
> > and once with and compare the results. If they are bit-by-bit identical
> > everything is fine.
> 
> Right again Uwe. This is correct for most of the modules - assuming
> there's no __LINE__ or time related macros used. Few of the modules did
> get actual changes though.

So as you did this research, I think it's worth pointing this out in the
commit log. Either something like:

	There are no changes in the compile result.

or

	This results in changes to the compiled module because ...

(and probably ... is worth fixing).

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |
