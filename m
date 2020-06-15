Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 350451F97DE
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2020 15:05:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729981AbgFONF4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Jun 2020 09:05:56 -0400
Received: from mga04.intel.com ([192.55.52.120]:13607 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729977AbgFONFz (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 15 Jun 2020 09:05:55 -0400
IronPort-SDR: l8yD0TOKhp+yrN4yk03F/kkDnq9ROSSO8YSM/YZIAvvL+xRUSAuJDaa3QszF2G/Ko0FARzTuzi
 2u+ARIoqlG/A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2020 06:04:23 -0700
IronPort-SDR: d2T8tXvji6vFOiFKQKH5X0fVLkK3mbh5PpP1RHuFoOtwJPSU7/WC2xvRvP6VmaLhes0sabmNUl
 9skODP5kqyOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,514,1583222400"; 
   d="scan'208";a="272767537"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003.jf.intel.com with ESMTP; 15 Jun 2020 06:04:21 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jkomm-00DZlg-56; Mon, 15 Jun 2020 16:04:24 +0300
Date:   Mon, 15 Jun 2020 16:04:24 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 01/13] pinctrl: intel: Disable input and output buffer
 when switching to GPIO
Message-ID: <20200615130424.GE2428291@smile.fi.intel.com>
References: <20200612145006.9145-1-andriy.shevchenko@linux.intel.com>
 <20200615120103.GH247495@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200615120103.GH247495@lahna.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 15, 2020 at 03:01:03PM +0300, Mika Westerberg wrote:
> On Fri, Jun 12, 2020 at 05:49:54PM +0300, Andy Shevchenko wrote:
> > It's possible scenario that pin has been in different mode, while
> > the respective GPIO register has a leftover output buffer enabled.
> > In such case when we request GPIO it will switch to GPIO mode, and
> > thus to output with unknown value, followed by switching to input
> > mode. This can produce a glitch on the pin.
> > 
> > Disable input and output buffer when switching to GPIO to avoid
> > potential glitches.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> There was a minor comment on one patch but other than that this looks
> good.

I will apply patches to my review and testing queue soon, but I will reconsider
few of them (for_each_requested_gpio() helper and its use) for v2.

> For the whole series,
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Thanks!

-- 
With Best Regards,
Andy Shevchenko


