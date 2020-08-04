Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E56B923B760
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Aug 2020 11:12:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726202AbgHDJMi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Aug 2020 05:12:38 -0400
Received: from mga02.intel.com ([134.134.136.20]:57719 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726201AbgHDJMh (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 4 Aug 2020 05:12:37 -0400
IronPort-SDR: w8d+ITDaA7kvGjgpgR6jp0Uskko4QI1ZXEBCJ6kB1qlOTN8INvowcbJKJAP78ZGcmiyXVlo5vX
 Nk8do/xdiUIA==
X-IronPort-AV: E=McAfee;i="6000,8403,9702"; a="140196121"
X-IronPort-AV: E=Sophos;i="5.75,433,1589266800"; 
   d="scan'208";a="140196121"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2020 02:12:37 -0700
IronPort-SDR: mAIWu98IXxwvarBhr7sI53YkqEbzBLfx8venraJjCaTatmYepjEcyGkDfAc1QpphIl181h0hjG
 jYz2rcoyCi7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,433,1589266800"; 
   d="scan'208";a="322691013"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 04 Aug 2020 02:12:36 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1k2szr-006Aii-MT; Tue, 04 Aug 2020 12:12:35 +0300
Date:   Tue, 4 Aug 2020 12:12:35 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: Re: [PATCH v1 1/3] gpio: pca953x: Request IRQ after all
 initialisation done
Message-ID: <20200804091235.GS3703480@smile.fi.intel.com>
References: <20200728125504.27786-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdbx63cDuG7-wwroGsKuyGOdSxKxwAf7OdTRBGute2P0Kw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdbx63cDuG7-wwroGsKuyGOdSxKxwAf7OdTRBGute2P0Kw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 04, 2020 at 01:26:12AM +0200, Linus Walleij wrote:
> On Tue, Jul 28, 2020 at 2:55 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > There is logically better to request IRQ when we initialise all structures.
> > Align the driver with the rest on the same matter.

> I just applied these three
> (despite 2 & 3 hitting Intel drivers) since
> we are in the
> merge window and it needs to be in good shape for the merge.

That's exactly my understanding how it has to be proceeded.
Thanks!

-- 
With Best Regards,
Andy Shevchenko


