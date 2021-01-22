Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9567A3002BF
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Jan 2021 13:21:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727263AbhAVMSc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Jan 2021 07:18:32 -0500
Received: from mga05.intel.com ([192.55.52.43]:24395 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727815AbhAVMSV (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 22 Jan 2021 07:18:21 -0500
IronPort-SDR: KR0+RJ8/cQP5DyaH4o4Ok76D6YyHDaM9Zw5cFYd4Jl+mAsQEl+oQPy3O2CDLruKbm8bSXyi996
 6LysIUplzNOw==
X-IronPort-AV: E=McAfee;i="6000,8403,9871"; a="264255541"
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; 
   d="scan'208";a="264255541"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2021 04:16:36 -0800
IronPort-SDR: WItIChbS6ax3acWXO6rgpUIL2zM88u2AcZUf0fSgR/M6oD+YBU6GDurRHRU04zStvByIDth58g
 Pctlzq6Ra3Ww==
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; 
   d="scan'208";a="467909267"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2021 04:16:34 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1l2vNh-008r1C-NA; Fri, 22 Jan 2021 14:17:37 +0200
Date:   Fri, 22 Jan 2021 14:17:37 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v1] gpio: aggregator: Use compound literal from the header
Message-ID: <YArCYTsuA2r+segw@smile.fi.intel.com>
References: <20210122105045.23820-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210122105045.23820-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 22, 2021 at 12:50:45PM +0200, Andy Shevchenko wrote:
> Instead of doing it in place, convert GPIO_LOOKUP_IDX() and GPIO_HOG()
> to be compund literals that's allow to use them as rvalue in assignments.
> 
> Due to above conversion, use compound literal from the header
> in the gpio-aggregator.c.

I will resend this as a part of other aggregator related series as v3.

-- 
With Best Regards,
Andy Shevchenko


