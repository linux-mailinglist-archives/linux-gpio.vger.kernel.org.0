Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C97C830D7
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Aug 2019 13:39:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730935AbfHFLjx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Aug 2019 07:39:53 -0400
Received: from mga06.intel.com ([134.134.136.31]:3085 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729898AbfHFLjx (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 6 Aug 2019 07:39:53 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Aug 2019 04:39:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,353,1559545200"; 
   d="scan'208";a="349401189"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
  by orsmga005.jf.intel.com with ESMTP; 06 Aug 2019 04:39:26 -0700
Received: from andy by smile with local (Exim 4.92)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1huxoK-0007MF-W1; Tue, 06 Aug 2019 14:39:24 +0300
Date:   Tue, 6 Aug 2019 14:39:24 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v1] pinctrl: intel: Use NSEC_PER_USEC for debounce
 calculus
Message-ID: <20190806113924.GS23480@smile.fi.intel.com>
References: <20190723155431.65095-1-andriy.shevchenko@linux.intel.com>
 <20190806101412.GJ2548@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190806101412.GJ2548@lahna.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 06, 2019 at 01:14:12PM +0300, Mika Westerberg wrote:
> On Tue, Jul 23, 2019 at 06:54:31PM +0300, Andy Shevchenko wrote:
> > Replace hard coded constants with self-explanatory names, i.e.
> > use NSEC_PER_USEC for debounce calculus.
> > 
> > While here, add a unit suffix to debounce period constant.

> > -#define DEBOUNCE_PERIOD			31250 /* ns */
> > +#define DEBOUNCE_PERIOD_NS		31250
> 
> Should this be called DEBOUNCE_PERIOD_NSEC to be consistent with
> NSEC_PER_USEC?

Either will good look to me.

> Otherwise looks good.

Will fix for v2.

Thanks!

-- 
With Best Regards,
Andy Shevchenko


