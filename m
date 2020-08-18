Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B12B248487
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Aug 2020 14:11:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726422AbgHRMLF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Aug 2020 08:11:05 -0400
Received: from mga01.intel.com ([192.55.52.88]:45751 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726837AbgHRMLC (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 18 Aug 2020 08:11:02 -0400
IronPort-SDR: Hweq4g12nBSyIhuZ9ruuXQxzwuxPCh//NOnt9lZluPdvNmAPbuQcBQT32Ink+5KskYA1j9SRVk
 hJl1zxVwTLLQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="172936586"
X-IronPort-AV: E=Sophos;i="5.76,327,1592895600"; 
   d="scan'208";a="172936586"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2020 05:11:01 -0700
IronPort-SDR: FQ73LHi2EjOe582yW7cs31CitVHjSqsKL9zTWmrLSFsiIQ+B+5Fnm+amZkFNGUDbeDQhOMWoPS
 il/jznqZHeeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,327,1592895600"; 
   d="scan'208";a="326713183"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 18 Aug 2020 05:11:00 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1k80SB-009dss-3z; Tue, 18 Aug 2020 15:10:59 +0300
Date:   Tue, 18 Aug 2020 15:10:59 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1] pinctrl: cherryview: Utilize temporary variable to
 hold device pointer
Message-ID: <20200818121059.GK1891694@smile.fi.intel.com>
References: <20200729120230.43005-1-andriy.shevchenko@linux.intel.com>
 <20200803123440.GS1375436@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200803123440.GS1375436@lahna.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 03, 2020 at 03:34:40PM +0300, Mika Westerberg wrote:
> On Wed, Jul 29, 2020 at 03:02:30PM +0300, Andy Shevchenko wrote:
> > By one of the previous clean up change we got a temporary variable to hold
> > a device pointer. It can be utilized in other calls in the ->probe() and
> > save a bit of LOCs.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Applied to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko


