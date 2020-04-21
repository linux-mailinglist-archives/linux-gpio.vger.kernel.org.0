Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A53F61B29CF
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2020 16:33:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728864AbgDUOb5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Apr 2020 10:31:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726780AbgDUOb5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Apr 2020 10:31:57 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27BBBC061A10
        for <linux-gpio@vger.kernel.org>; Tue, 21 Apr 2020 07:31:57 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1jQtwI-00015V-Km; Tue, 21 Apr 2020 16:31:54 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1jQtwI-0002SC-4A; Tue, 21 Apr 2020 16:31:54 +0200
Date:   Tue, 21 Apr 2020 16:31:54 +0200
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Paul Thomas <pthomas8589@gmail.com>,
        kernel@pengutronix.de
Subject: Re: [PATCH v3 1/3] gpio: pca953x: Rewrite ->get_multiple() function
Message-ID: <20200421143154.wb2msmxf6clvbk3i@pengutronix.de>
References: <20200420172752.33588-1-andriy.shevchenko@linux.intel.com>
 <20200421130300.GK185537@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200421130300.GK185537@smile.fi.intel.com>
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

On Tue, Apr 21, 2020 at 04:03:00PM +0300, Andy Shevchenko wrote:
> On Mon, Apr 20, 2020 at 08:27:50PM +0300, Andy Shevchenko wrote:
> > The commit 96d7c7b3e654 ("gpio: gpio-pca953x, Add get_multiple function")
> > basically did everything wrong from style and code reuse perspective, i.e.
> > - it didn't utilize existing PCA953x internal helpers
> > - it didn't utilize bitmap API
> > - it misses the point that ilog2(), besides that BANK_SFT is useless,
> >   can be used in macros
> > - it has indentation issues.
> > 
> > Rewrite the function completely.
> 
> Bart, Linus, please, consider this series to be applied, because it has Uwe's fixes.
> We may still discuss the approach with ->get_multiple(), though.
> 
> For the record, should some of us volunteer to be a reviewer for this driver.
> It's awful that almost every release we get something either ugly or broken in it.
> Uwe, would you like to be a designated reviewer (I would also support)?

Yeah that would be fine. I'm not sure how long I will have access to the
hardware I fixed the problem on, but I can see what to do when it
happens.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |
