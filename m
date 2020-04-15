Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D46011AA409
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2020 15:23:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2506229AbgDONQf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Apr 2020 09:16:35 -0400
Received: from mga01.intel.com ([192.55.52.88]:35006 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2506223AbgDONQa (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 15 Apr 2020 09:16:30 -0400
IronPort-SDR: odPh2Jpo/tcVIWKZ2fGp8oOqAX6LepohK9oOuhC6jQQ6FRHmlvxZUeaXu5gKpqj4Odh7HknnIs
 8/Bq2a62oC4w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2020 06:16:28 -0700
IronPort-SDR: f2cq93MnGGWkHLAWpAfsQOgK6ecOvIEV/ARtJ9+pPb+YOZ9X53nHaG4aILErw6Lh1+IIZTTjPk
 J3bkDabOMVyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,387,1580803200"; 
   d="scan'208";a="242301342"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga007.jf.intel.com with ESMTP; 15 Apr 2020 06:16:27 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jOhu1-000n5L-UK; Wed, 15 Apr 2020 16:16:29 +0300
Date:   Wed, 15 Apr 2020 16:16:29 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Serge Semin <fancer.lancer@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v1 05/13] gpio: dwapb: Convert to use irqd_to_hwirq()
Message-ID: <20200415131629.GE185537@smile.fi.intel.com>
References: <20200409141228.49561-1-andriy.shevchenko@linux.intel.com>
 <20200409141228.49561-6-andriy.shevchenko@linux.intel.com>
 <20200415124242.nnk7wamjw6e5jyez@mobilestation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200415124242.nnk7wamjw6e5jyez@mobilestation>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 15, 2020 at 03:42:42PM +0300, Serge Semin wrote:
> On Thu, Apr 09, 2020 at 05:12:20PM +0300, Andy Shevchenko wrote:
> > Convert to use irqd_to_hwirq() instead of direct access to the hwirq member.

> > -	int bit = d->hwirq;

> > +	u32 bit = irqd_to_hwirq(d);
> 
> I'm not saying that the rest of the driver code is highly coherent with
> ideal design and style. But here I don't really see a point in converting
> the type to u32. As I see it int-like type is more appropriate since
> we don't need to signify the data type width in this context.

> > +	u32 bit = irqd_to_hwirq(d);

The idea is that it corresponds the hardware register width. But, i think the
proper one is irq_hw_number_t as return type in all cases.
Let me check this and fix accordingly.

> > +	irq_hw_number_t hwirq;

-- 
With Best Regards,
Andy Shevchenko


