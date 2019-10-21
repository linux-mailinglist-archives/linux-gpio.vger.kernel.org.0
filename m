Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E07CFDED57
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Oct 2019 15:19:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728920AbfJUNT7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Oct 2019 09:19:59 -0400
Received: from mga14.intel.com ([192.55.52.115]:7465 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728919AbfJUNT7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 21 Oct 2019 09:19:59 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 21 Oct 2019 06:19:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,323,1566889200"; 
   d="scan'208";a="222460495"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga004.fm.intel.com with ESMTP; 21 Oct 2019 06:19:58 -0700
Received: from andy by smile with local (Exim 4.92.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1iMXbJ-0004zN-GQ; Mon, 21 Oct 2019 16:19:57 +0300
Date:   Mon, 21 Oct 2019 16:19:57 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v1 3/3] pinctrl: intel: Introduce intel_restore_intmask()
 helper
Message-ID: <20191021131957.GS32742@smile.fi.intel.com>
References: <20191014084348.42489-1-andriy.shevchenko@linux.intel.com>
 <20191014084348.42489-3-andriy.shevchenko@linux.intel.com>
 <20191021122720.GE2819@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191021122720.GE2819@lahna.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 21, 2019 at 03:27:20PM +0300, Mika Westerberg wrote:
> On Mon, Oct 14, 2019 at 11:43:48AM +0300, Andy Shevchenko wrote:
> > Refactor restoring GPI_IE registers by using an introduced helper.

> > +	struct device *dev = pctrl->dev;
> 
> const?

It's only about dozen occurrences in 8 drivers altogether in the kernel
to have const with struct device.

So, I consider this pattern is unusual.

> Also should we do the same here as we do with others and check first
> whether we need to update the mask at all?

I will look at it.
I think we may do it as a separate change (this doesn't change any
functionality).

-- 
With Best Regards,
Andy Shevchenko


