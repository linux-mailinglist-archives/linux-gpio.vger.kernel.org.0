Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16FC2195533
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2020 11:27:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726217AbgC0K07 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Mar 2020 06:26:59 -0400
Received: from mga17.intel.com ([192.55.52.151]:29889 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726540AbgC0K07 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 27 Mar 2020 06:26:59 -0400
IronPort-SDR: 13y2L3yxNCrWU6ZAQptlJH17v9d19ujAFzuxJ7VPFS0BWliYu81z2lxNk0RDaeJCBmZJ0QLERO
 AsfR+7wr6kHQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2020 03:26:57 -0700
IronPort-SDR: z8TyAzHNvHnaFD1VWiW6JR2ZUVnBK1p3XsDlWxzMHpgXGwwJG9OQrYCyrNzWu2t5P8h4AR/rqG
 TN4Bt90Asx/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,312,1580803200"; 
   d="scan'208";a="282804442"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002.fm.intel.com with ESMTP; 27 Mar 2020 03:26:57 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jHmCZ-00DNxv-Pb; Fri, 27 Mar 2020 12:26:59 +0200
Date:   Fri, 27 Mar 2020 12:26:59 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Marek Vasut <marek.vasut@gmail.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org
Subject: Re: register access issues in pca953x gpio driver
Message-ID: <20200327102659.GN1922688@smile.fi.intel.com>
References: <20200327074922.vrxbcjw2xlrv2bkb@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200327074922.vrxbcjw2xlrv2bkb@pengutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 27, 2020 at 08:49:22AM +0100, Uwe Kleine-König wrote:
> Hello,
> 
> I have an issue with an pca9505 when the .set_multiple callback is used.
> That chip has a bit ("AI") in the register address that makes the
> address increment automatically on subsequent reads and writes.
> 
> The problem (that was already noticed in commit 3b00691cc46a ("gpio:
> pca953x: hack to fix 24 bit gpio expanders")) is that the regmap stuff
> isn't aware of this bit and so register accesses that make use of the auto
> incrementing are not matched to those without it.
> 
> Additionally there is a bug in pca953x_recalc_addr() that results in the
> AI bit only be set for register writes. (That's the issue that made me
> notice this problem. The result is that in .set_multiple the read
> accesses bank 0's register only (when the hardware is hit) or uses the
> read cache from a location without AI set and then writes using AI set.)
> 
> I didn't try to understand if fixing pca953x_recalc_addr() to not set AI
> depending on write fixes all issues. But to make the register access in
> the driver robust I'm convinced we need to fix the regmap stuff to
> understand the AI bit.
> 
> @broonie: I don't know regmap good enough to instantly know the right
> magic to do this. Can you give a rough overview what would be needed?

Uwe, thank you for the report. Personally I didn't try set_multiple() with this
driver and as you noticed Marek did a big refactoring to the driver to that
part in particular.

So, I guess he may shed a light a bit on this.

-- 
With Best Regards,
Andy Shevchenko


