Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A98238256A
	for <lists+linux-gpio@lfdr.de>; Mon, 17 May 2021 09:33:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234762AbhEQHeS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 May 2021 03:34:18 -0400
Received: from mga12.intel.com ([192.55.52.136]:9567 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234742AbhEQHeS (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 17 May 2021 03:34:18 -0400
IronPort-SDR: ZUOmVceuxjk4044w2mH7bNq5B//cal4/pNB1ceQPhWQQJabPM33h/U1T9xz01ZMt9tll5KWXAB
 h9XSgcqZV7zA==
X-IronPort-AV: E=McAfee;i="6200,9189,9986"; a="180001399"
X-IronPort-AV: E=Sophos;i="5.82,306,1613462400"; 
   d="scan'208";a="180001399"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2021 00:33:02 -0700
IronPort-SDR: 5XNFRMKOxEKOdgqb1gfmSSD021Ihgc5ethQIgLe94169a3Skxk2vw8QmA5Xj80R81VOBJR3Ukf
 UBIvSJ4vBxjg==
X-IronPort-AV: E=Sophos;i="5.82,306,1613462400"; 
   d="scan'208";a="410714709"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2021 00:32:59 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1liXkG-00Cggg-Re; Mon, 17 May 2021 10:32:56 +0300
Date:   Mon, 17 May 2021 10:32:56 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Colin King <colin.king@canonical.com>
Cc:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        kernel-janitors <kernel-janitors@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH][next] gpio: xilinx: Fix potential integer overflow on
 shift of a u32 int
Message-ID: <YKIcKLLP1VXBhYfO@smile.fi.intel.com>
References: <20210513085227.54392-1-colin.king@canonical.com>
 <CAHp75VdvZEhdmui0+1eS0BXvxBs60=uB0zOPex_TTDTrK7ewnQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VdvZEhdmui0+1eS0BXvxBs60=uB0zOPex_TTDTrK7ewnQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 17, 2021 at 10:03:15AM +0300, Andy Shevchenko wrote:
> On Thu, May 13, 2021 at 12:12 PM Colin King <colin.king@canonical.com> wrote:
> >
> > From: Colin Ian King <colin.king@canonical.com>
> >
> > The left shift of the u32 integer v is evaluated using 32 bit
> > arithmetic and then assigned to a u64 integer. There are cases
> > where v will currently overflow on the shift. Avoid this by
> > casting it to unsigned long (same type as map[]) before shifting
> > it.
> >
> > Addresses-Coverity: ("Unintentional integer overflow")
> > Fixes: 02b3f84d9080 ("gpio: xilinx: Switch to use bitmap APIs")
> 
> No, it is a false positive,
> 
> >         const unsigned long offset = (bit % BITS_PER_LONG) & BIT(5);
> 
> See above, offset is 0 when BITS_PER_LONG == 32 and 32 when it's equal to 64.

Should be read as "...and 0 or 32 when..."

> > -       map[index] |= v << offset;
> > +       map[index] |= (unsigned long)v << offset;

-- 
With Best Regards,
Andy Shevchenko


