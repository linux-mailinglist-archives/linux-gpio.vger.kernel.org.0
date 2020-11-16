Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 647222B406E
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Nov 2020 11:05:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726754AbgKPKDe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Nov 2020 05:03:34 -0500
Received: from mga05.intel.com ([192.55.52.43]:24224 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726584AbgKPKDe (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 16 Nov 2020 05:03:34 -0500
IronPort-SDR: 47kVzs1o94husmOdaVuARRGKQCoZT5xClJNPRYrvL2M6exMTWkSCWZNrxn5B50F5BqvDmEByQB
 Ynf5IgpS1KYQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9806"; a="255435443"
X-IronPort-AV: E=Sophos;i="5.77,482,1596524400"; 
   d="scan'208";a="255435443"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2020 02:03:33 -0800
IronPort-SDR: qWsE8fftXFfnTqVtxm9iIDUGVLPIZQ6P4nHlR8hOxs0/nfF21nTiPot18en3xwA+mxDscUliEX
 XjSEidVQTDBg==
X-IronPort-AV: E=Sophos;i="5.77,482,1596524400"; 
   d="scan'208";a="358411589"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2020 02:03:32 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kebNC-0072RQ-QA; Mon, 16 Nov 2020 12:04:34 +0200
Date:   Mon, 16 Nov 2020 12:04:34 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1] pinctrl: baytrail: Avoid clearing debounce value when
 turning it off
Message-ID: <20201116100434.GU4077@smile.fi.intel.com>
References: <20201112190301.44373-1-andriy.shevchenko@linux.intel.com>
 <20201113093611.GL2495@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201113093611.GL2495@lahna.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 13, 2020 at 11:36:11AM +0200, Mika Westerberg wrote:
> On Thu, Nov 12, 2020 at 09:03:01PM +0200, Andy Shevchenko wrote:
> > Baytrail pin control has a common register to set up debounce timeout.
> > When a pin configuration requested debounce to be disabled, the rest
> > of the pins may still want to have debounce enabled and thus rely on
> > the common timeout value. Avoid clearing debounce value when turning
> > it off for one pin while others may still use it.
> > 
> > Fixes: 658b476c742f ("pinctrl: baytrail: Add debounce configuration")
> > Depends-on: 04ff5a095d66 ("pinctrl: baytrail: Rectify debounce support")
> > Depends-on: 827e1579e1d5 ("pinctrl: baytrail: Rectify debounce support (part 2)")
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko


