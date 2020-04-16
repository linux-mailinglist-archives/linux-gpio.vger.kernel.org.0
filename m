Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 088EF1ABFD1
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2020 13:41:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2506471AbgDPLlJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Apr 2020 07:41:09 -0400
Received: from mga05.intel.com ([192.55.52.43]:26417 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2505833AbgDPK6U (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Apr 2020 06:58:20 -0400
IronPort-SDR: rvDSWYjrzFGdMPHWPHLAavbUpAF80AJMgGXlaGNc5LrTf7VPlZQxm3RRy9C523JwfBh+A2x3ld
 fuX4BQXVLUbA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2020 03:56:13 -0700
IronPort-SDR: QIsi64xegMHfaZCxpoGk/hEdOPnywLxzOxlkLX6eZWkQwNcI0wyXj8THfoXv0lwou0ARyFL7sC
 upWIWbMDFsqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,390,1580803200"; 
   d="scan'208";a="245960358"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008.fm.intel.com with ESMTP; 16 Apr 2020 03:56:12 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jP2Bq-0010h8-UO; Thu, 16 Apr 2020 13:56:14 +0300
Date:   Thu, 16 Apr 2020 13:56:14 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Serge Semin <fancer.lancer@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 14/14] gpio: dwapb: Amend indentation in some cases
Message-ID: <20200416105614.GZ185537@smile.fi.intel.com>
References: <20200415141534.31240-1-andriy.shevchenko@linux.intel.com>
 <20200415141534.31240-15-andriy.shevchenko@linux.intel.com>
 <20200415171516.cugbzhvjua6cygnq@mobilestation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200415171516.cugbzhvjua6cygnq@mobilestation>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 15, 2020 at 08:15:16PM +0300, Serge Semin wrote:
> On Wed, Apr 15, 2020 at 05:15:34PM +0300, Andy Shevchenko wrote:
> > In some cases indentation makes code harder to read. Amend indentation
> > in those cases despite of lines go a bit over 80 character limit.

> > +			dev_err(dev, "missing/invalid port index for port%d\n", i);
> 
> What about shortening the message text to fit the 80 chars per line rule?
> I suppose the "missing" word could be omitted.

More likely port is not needed, but I think this kind of changes are material
for another (logically separated) patch.

...

> >  			/* Mask out interrupts */
> > -			dwapb_write(gpio, GPIO_INTMASK,
> > -				    0xffffffff & ~ctx->wake_en);
> 
> > +			dwapb_write(gpio, GPIO_INTMASK, 0xffffffff & ~ctx->wake_en);
> 
> Hm, do I need some rest and missing something or the &-operation with 1s here
> does nothing seeing the operands data types have the same width?
> 
> (the change introduced by commit 6437c7ba69c3 ("gpio: dwapb: Add wakeup source support"))

No, you are right, it seems no-op to me, I have noticed it as well, but I think
we may improve this by separate change (as you seems also prefer not to mix
logically different changes in one patch).

-- 
With Best Regards,
Andy Shevchenko


