Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5275382DE0
	for <lists+linux-gpio@lfdr.de>; Mon, 17 May 2021 15:49:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233718AbhEQNvJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 May 2021 09:51:09 -0400
Received: from mga03.intel.com ([134.134.136.65]:3829 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233139AbhEQNvJ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 17 May 2021 09:51:09 -0400
IronPort-SDR: UPRhEG1ZSMGBg2WGrY8R6LgSnXJHb/uUFGuT5S3kRZKbtFp1NMMTU54UZkYTCif+VvUF2sLbcj
 AiOXjptQNxDg==
X-IronPort-AV: E=McAfee;i="6200,9189,9986"; a="200520459"
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; 
   d="scan'208";a="200520459"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2021 06:49:51 -0700
IronPort-SDR: qPrqaoZIsX7KFEzvrWT847vxuU/vQuXuNBSGdJJhpOobzAlB1E5ZRLycDimZlVlmDAekIzThdb
 mahwX5TRbyRg==
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; 
   d="scan'208";a="393523740"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2021 06:49:48 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1lidcw-00CkNa-2G; Mon, 17 May 2021 16:49:46 +0300
Date:   Mon, 17 May 2021 16:49:46 +0300
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Colin King <colin.king@canonical.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
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
Message-ID: <YKJ0egfeNxw2Aoxl@smile.fi.intel.com>
References: <20210513085227.54392-1-colin.king@canonical.com>
 <20210514053754.GZ1955@kadam>
 <CAHp75Ve-YWh_sfupwQV0xxL7Vk8GNObJ+6O29RqRMXCgAmemCw@mail.gmail.com>
 <20210517133643.GI1955@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210517133643.GI1955@kadam>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 17, 2021 at 04:36:43PM +0300, Dan Carpenter wrote:
> On Mon, May 17, 2021 at 10:07:20AM +0300, Andy Shevchenko wrote:
> > On Fri, May 14, 2021 at 12:26 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > > On Thu, May 13, 2021 at 09:52:27AM +0100, Colin King wrote:
> > 
> > ...
> > 
> > > >       const unsigned long offset = (bit % BITS_PER_LONG) & BIT(5);
> > > >
> > > >       map[index] &= ~(0xFFFFFFFFul << offset);
> > > > -     map[index] |= v << offset;
> > > > +     map[index] |= (unsigned long)v << offset;
> > >
> > > Doing a shift by BIT(5) is super weird.
> > 
> > Not the first place in the kernel with such a trick.
> > 
> > >  It looks like a double shift
> > > bug and should probably trigger a static checker warning.  It's like
> > > when people do BIT(BIT(5)).
> > >
> > > It would be more readable to write it as:
> > >
> > >         int shift = (bit % BITS_PER_LONG) ? 32 : 0;
> > 
> > Usually this code is in a kinda fast path. Have you checked if the
> > compiler generates the same or better code when you are using ternary?
> 
> I wrote a little benchmark to see which was faster and they're the same
> as far as I can see.

Thanks for checking.

Besides the fact that offset should be 0 for 32-bit always and if compiler can
proof that...

The test below doesn't take into account the exact trick is used for offset
(i.e. implicit dependency between BITS_PER_LONG, size of unsigned long, and
 using 5th bit out of value). I don't know if compiler can properly optimize
the ternary in this case (but it looks like it should generate the same code).

That said, I would rather to see the diff between assembly of the exact
function before and after your proposal.

> static inline __attribute__((__gnu_inline__)) unsigned long xgpio_set_value_orig(unsigned long *map, int bit, u32 v)
> {
>         int shift = (bit % 64) & ((((1UL))) << (5));
>         return v << shift;
> }
> 
> static inline __attribute__((__gnu_inline__)) unsigned long xgpio_set_value_new(unsigned long *map, int bit, u32 v)
> {
>         int shift = (bit % 64) ? 32 : 0;
>         return v << shift;
> }
> 
> int main(void)
> {
>         int i;
> 
>         for (i = 0; i < INT_MAX; i++)
>                 xgpio_set_value_orig(NULL, i, 0);
> 
> //      for (i = 0; i < INT_MAX; i++)
> //              xgpio_set_value_new(NULL, i, 0);
> 
>         return 0;
> }
> 

-- 
With Best Regards,
Andy Shevchenko


