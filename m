Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78F441F9751
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2020 14:55:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730276AbgFOMzF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Jun 2020 08:55:05 -0400
Received: from mga05.intel.com ([192.55.52.43]:56842 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730123AbgFOMxs (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 15 Jun 2020 08:53:48 -0400
IronPort-SDR: 4MXRCOgUBHBh8Q03bh3MuQMBeyb3Q6plqU0cjZKfsfkvk/l2PlCFXaxI9apBMFlCjoCGtijq6A
 yOVupo8lgBOw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2020 05:53:48 -0700
IronPort-SDR: 9AWUi8vBSUDGs3O8vIVOfV+pl5iANM5qD7wipVx6FOBtTdSzNTaKkv9ZbseJjEEu0AW2CoA40h
 sItMMayIXAlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,514,1583222400"; 
   d="scan'208";a="261092670"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga007.fm.intel.com with ESMTP; 15 Jun 2020 05:53:46 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jkocX-00DZZd-D7; Mon, 15 Jun 2020 15:53:49 +0300
Date:   Mon, 15 Jun 2020 15:53:49 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v1 4/4] gpio: pca953x: disable regmap locking for
 automatic address incrementing
Message-ID: <20200615125349.GD2428291@smile.fi.intel.com>
References: <20200605134036.9013-1-andriy.shevchenko@linux.intel.com>
 <20200605134036.9013-4-andriy.shevchenko@linux.intel.com>
 <20200615122044.j2vdhpmhbpsw6qkb@taurus.defre.kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200615122044.j2vdhpmhbpsw6qkb@taurus.defre.kleine-koenig.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 15, 2020 at 02:20:44PM +0200, Uwe Kleine-König wrote:
> On Fri, Jun 05, 2020 at 04:40:36PM +0300, Andy Shevchenko wrote:
> > It's a repetition of the commit aa58a21ae378
> >   ("gpio: pca953x: disable regmap locking")
> > which states the following:
> > 
> >   This driver uses its own locking but regmap silently uses
> >   a mutex for all operations too. Add the option to disable
> >   locking to the regmap config struct.
> > 
> > Fixes: bcf41dc480b1 ("gpio: pca953x: fix handling of automatic address incrementing")
> > Cc: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Ah, good catch. I assume that I didn't have aa58a21ae378 in my tree when
> I created the patch that then became bcf41dc480b1.
> 
> Looks right
> 
> Reviewed-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Thanks!

Linus, Bart, just to clarify that this is material for one of the next v5.8-rcX
(this cycle!).

-- 
With Best Regards,
Andy Shevchenko


