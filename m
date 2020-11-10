Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88C942AD994
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 16:00:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730200AbgKJPAv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 10:00:51 -0500
Received: from mga02.intel.com ([134.134.136.20]:16060 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731054AbgKJPAv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 10 Nov 2020 10:00:51 -0500
IronPort-SDR: KUJF6RES29JEwO8GNmj0G3+9RfsOV0WNV9XzypfBcjDD+C+xfqusOdCN4r2Pq1Yl57dkLfaRiU
 rRK4SL1RhWmg==
X-IronPort-AV: E=McAfee;i="6000,8403,9801"; a="156990559"
X-IronPort-AV: E=Sophos;i="5.77,466,1596524400"; 
   d="scan'208";a="156990559"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2020 07:00:43 -0800
IronPort-SDR: 0m+sLG7EaSBtlxIOGydFu1MSzxEGYua1iyjNhe/OIQVXozS4eZ8mzpYzjSPOymLLaXQJCkdVFl
 oPvRg773uhNA==
X-IronPort-AV: E=Sophos;i="5.77,466,1596524400"; 
   d="scan'208";a="327706939"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2020 07:00:41 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kcV9T-005VNY-0j; Tue, 10 Nov 2020 17:01:43 +0200
Date:   Tue, 10 Nov 2020 17:01:43 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Jan Kiszka <jan.kiszka@siemens.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        David Laight <David.Laight@aculab.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 6/7] gpio: exar: switch to using regmap
Message-ID: <20201110150143.GV4077@smile.fi.intel.com>
References: <20201110123406.3261-1-brgl@bgdev.pl>
 <20201110123406.3261-7-brgl@bgdev.pl>
 <20201110142624.GT4077@smile.fi.intel.com>
 <20201110142750.GU4077@smile.fi.intel.com>
 <CAMpxmJUQ3t02q-Chd-WE+pYRAsOOEnbQ0jB+G_uAGv+sJBK1tg@mail.gmail.com>
 <a5b0fcd0-eb62-79b3-3f27-6595b9bdb91c@siemens.com>
 <CAMpxmJW1j9+KAj12OKs3njUWy+UA5B993Pyd=xmo4k8LM-8GUw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMpxmJW1j9+KAj12OKs3njUWy+UA5B993Pyd=xmo4k8LM-8GUw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 10, 2020 at 03:52:00PM +0100, Bartosz Golaszewski wrote:
> On Tue, Nov 10, 2020 at 3:50 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
> > On 10.11.20 15:30, Bartosz Golaszewski wrote:

...

> > Removing the line that Andy found made things work here. And switching
> > to 16 for reg_bits didn't make things worse again.
> >
> > Jan
> 
> Alright! I'll send a v4 with these things fixed then.

Hold on, the registers are 16-bit wide, but their halves are sparsed!
So, I guess 8 and 8 with helpers to get hi and lo parts are essential.


-- 
With Best Regards,
Andy Shevchenko


