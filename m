Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC8E01AABE5
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2020 17:31:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393130AbgDOP3N (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Apr 2020 11:29:13 -0400
Received: from mga03.intel.com ([134.134.136.65]:44093 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389666AbgDOP3L (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 15 Apr 2020 11:29:11 -0400
IronPort-SDR: GdYQJy+0RyOYKP81WkKaU9x9e6I/Kdf+QGGDCzwCI/CLvijv0v0s+wPhfbkJB+kRqsz+rJ6nIZ
 Db5hfil0vVYw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2020 08:29:02 -0700
IronPort-SDR: B6ww96zrWuP+iUbUuhSifkGhJMXPPL3Bsxn6XPFnhTJC8DMCYh/AeHfQV05TzyJtZyARRazyAG
 64EB8GGtZygg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,387,1580803200"; 
   d="scan'208";a="277647475"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga004.fm.intel.com with ESMTP; 15 Apr 2020 08:29:01 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jOjyK-000od8-56; Wed, 15 Apr 2020 18:29:04 +0300
Date:   Wed, 15 Apr 2020 18:29:04 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v1 1/2] pinctrl: baytrail: Use
 platform_get_irq_optional() explicitly
Message-ID: <20200415152904.GR185537@smile.fi.intel.com>
References: <20200414161338.3025-1-andriy.shevchenko@linux.intel.com>
 <20200415072651.GQ2586@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200415072651.GQ2586@lahna.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 15, 2020 at 10:26:51AM +0300, Mika Westerberg wrote:
> On Tue, Apr 14, 2020 at 07:13:37PM +0300, Andy Shevchenko wrote:
> > There is no need to repeat functionality of platform_get_irq_optional()
> > in the driver. Replace it with explicit call to the helper.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Both applied to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko


