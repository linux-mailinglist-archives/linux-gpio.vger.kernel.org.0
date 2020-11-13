Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 470822B1869
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Nov 2020 10:38:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726583AbgKMJi3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Nov 2020 04:38:29 -0500
Received: from mga07.intel.com ([134.134.136.100]:38598 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726578AbgKMJi3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 13 Nov 2020 04:38:29 -0500
IronPort-SDR: xHebOilmljPxv6d3sowUceTouXqQvZF2z36ueRyabVsSn6lZRxs2OozGjdfdvfmw89lvdHTelR
 gZ/+F4Z1o1DA==
X-IronPort-AV: E=McAfee;i="6000,8403,9803"; a="234608629"
X-IronPort-AV: E=Sophos;i="5.77,475,1596524400"; 
   d="scan'208";a="234608629"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2020 01:38:26 -0800
IronPort-SDR: fn5X2b5wVG3IulisJHKM9u17yslKHrqHKmJWBfVgrlSLS6coBQ7N8K7dYsqznXcuA9M8Kr5KSA
 v811mv8jALyg==
X-IronPort-AV: E=Sophos;i="5.77,475,1596524400"; 
   d="scan'208";a="357447563"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2020 01:38:23 -0800
Received: by lahna (sSMTP sendmail emulation); Fri, 13 Nov 2020 11:36:11 +0200
Date:   Fri, 13 Nov 2020 11:36:11 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1] pinctrl: baytrail: Avoid clearing debounce value when
 turning it off
Message-ID: <20201113093611.GL2495@lahna.fi.intel.com>
References: <20201112190301.44373-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201112190301.44373-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 12, 2020 at 09:03:01PM +0200, Andy Shevchenko wrote:
> Baytrail pin control has a common register to set up debounce timeout.
> When a pin configuration requested debounce to be disabled, the rest
> of the pins may still want to have debounce enabled and thus rely on
> the common timeout value. Avoid clearing debounce value when turning
> it off for one pin while others may still use it.
> 
> Fixes: 658b476c742f ("pinctrl: baytrail: Add debounce configuration")
> Depends-on: 04ff5a095d66 ("pinctrl: baytrail: Rectify debounce support")
> Depends-on: 827e1579e1d5 ("pinctrl: baytrail: Rectify debounce support (part 2)")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
