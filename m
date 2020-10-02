Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 097652810AC
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Oct 2020 12:41:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387677AbgJBKlA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Oct 2020 06:41:00 -0400
Received: from mga05.intel.com ([192.55.52.43]:56817 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387661AbgJBKk7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 2 Oct 2020 06:40:59 -0400
IronPort-SDR: lZt/o7RBAEyTiVrD/gN1BKFJ9rS8VAc7jJ5bnEhdplJ2AexX9JV5Muel25jckPjTFpML0oEmC2
 1HxQRr+hKZUw==
X-IronPort-AV: E=McAfee;i="6000,8403,9761"; a="247703078"
X-IronPort-AV: E=Sophos;i="5.77,327,1596524400"; 
   d="scan'208";a="247703078"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2020 03:40:55 -0700
IronPort-SDR: cX8mX9Vbw4e2sgS1cHCiPGTzJHfZzSc4hTGlz6VG1+uUjlgV0STW+IR5y2bSWqw48mRE7ev+jt
 QItINWAqsCEw==
X-IronPort-AV: E=Sophos;i="5.77,327,1596524400"; 
   d="scan'208";a="313468950"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2020 03:40:52 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kOIUY-003PvH-Uq; Fri, 02 Oct 2020 13:40:46 +0300
Date:   Fri, 2 Oct 2020 13:40:46 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, Adam Ford <aford173@gmail.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH] gpio: pca953x: Use irqchip template
Message-ID: <20201002104046.GA3956970@smile.fi.intel.com>
References: <20200717144040.63253-1-linus.walleij@linaro.org>
 <20200930104729.ajufkrklfhf25d55@NiksLab>
 <CACRpkdaOAdcO4P-3MphdV7bq1-CfMr0KR96+iPvJrsEX1nZeNQ@mail.gmail.com>
 <2ced9bd9-9446-5060-18a4-d743238277fc@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ced9bd9-9446-5060-18a4-d743238277fc@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 02, 2020 at 12:07:50AM +0300, Grygorii Strashko wrote:
> On 30/09/2020 16:51, Linus Walleij wrote:
> > On Wed, Sep 30, 2020 at 12:47 PM Nikhil Devshatwar <nikhil.nd@ti.com> wrote:
> > 
> > > I am getting a kernel crash on K3 j721e common processor board
> > > when HDMI is plugged in. Following is the full log with crash
> > > for NULL pointer derefence
> > > 
> > > https://pastebin.ubuntu.com/p/wBPS2ymmqR/
> > > 
> > > Upon inspection, I found that the "irq_find_mapping" call
> > > in the "pca953x_irq_handler" returns 0 and the same is passed
> > > to "handle_nested_irq"
> > 
> > This would typically happen if the driver using an IRQ
> > from the PCA953x does not properly request it.

...

> We've just got another similar report, don't know the root cause, but it's not HDMI

Does
 e43c26e12dd4 ("gpio: pca953x: Fix uninitialized pending variable")
help?

-- 
With Best Regards,
Andy Shevchenko


