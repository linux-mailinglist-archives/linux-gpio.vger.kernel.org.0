Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24815195253
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2020 08:49:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726169AbgC0Htb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Mar 2020 03:49:31 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:54693 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725946AbgC0Htb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Mar 2020 03:49:31 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1jHjk3-00041i-2w; Fri, 27 Mar 2020 08:49:23 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1jHjk2-0002Sr-EI; Fri, 27 Mar 2020 08:49:22 +0100
Date:   Fri, 27 Mar 2020 08:49:22 +0100
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Marek Vasut <marek.vasut@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Mark Brown <broonie@kernel.org>
Cc:     linux-gpio@vger.kernel.org
Subject: register access issues in pca953x gpio driver
Message-ID: <20200327074922.vrxbcjw2xlrv2bkb@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

I have an issue with an pca9505 when the .set_multiple callback is used.
That chip has a bit ("AI") in the register address that makes the
address increment automatically on subsequent reads and writes.

The problem (that was already noticed in commit 3b00691cc46a ("gpio:
pca953x: hack to fix 24 bit gpio expanders")) is that the regmap stuff
isn't aware of this bit and so register accesses that make use of the auto
incrementing are not matched to those without it.

Additionally there is a bug in pca953x_recalc_addr() that results in the
AI bit only be set for register writes. (That's the issue that made me
notice this problem. The result is that in .set_multiple the read
accesses bank 0's register only (when the hardware is hit) or uses the
read cache from a location without AI set and then writes using AI set.)

I didn't try to understand if fixing pca953x_recalc_addr() to not set AI
depending on write fixes all issues. But to make the register access in
the driver robust I'm convinced we need to fix the regmap stuff to
understand the AI bit.

@broonie: I don't know regmap good enough to instantly know the right
magic to do this. Can you give a rough overview what would be needed?

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |
