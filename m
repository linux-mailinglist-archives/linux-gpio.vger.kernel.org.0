Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5885A36A0C7
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Apr 2021 13:08:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229848AbhDXLJ2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 24 Apr 2021 07:09:28 -0400
Received: from mga18.intel.com ([134.134.136.126]:6342 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232004AbhDXLJ1 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 24 Apr 2021 07:09:27 -0400
IronPort-SDR: NDnWR2hcNMZjSk2H9MjGWOC+nIaOuPlmcW483dUfYnOTL+l+eg0eBQqMYJdvVgyC2e5BegMfmD
 7l++0TO71ffw==
X-IronPort-AV: E=McAfee;i="6200,9189,9963"; a="183658133"
X-IronPort-AV: E=Sophos;i="5.82,248,1613462400"; 
   d="scan'208";a="183658133"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2021 04:08:48 -0700
IronPort-SDR: 2DvsZH/jB4k6QoHuotJmnDzYDmCf2+3Tx1gBihus2AZuiSaizdxtcress5mIceoE2H6pUi8HP1
 vLYZEnTpwi7w==
X-IronPort-AV: E=Sophos;i="5.82,248,1613462400"; 
   d="scan'208";a="402426064"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2021 04:08:45 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1laG9S-006ovQ-TO; Sat, 24 Apr 2021 14:08:42 +0300
Date:   Sat, 24 Apr 2021 14:08:42 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Yury Norov <yury.norov@gmail.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Syed Nayyar Waris <syednwaris@gmail.com>,
        William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: Re: [RFT, PATCH v1 0/5] gpio: xilinx: convert to use bitmap API
Message-ID: <YIP8OsHSpEi1/RJg@smile.fi.intel.com>
References: <20210408145601.68651-1-andriy.shevchenko@linux.intel.com>
 <CAMpxmJU+K6C_xbQPT=9QKtLLTnajJQbgJH0A2QqbGjCV+b9Z_g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMpxmJU+K6C_xbQPT=9QKtLLTnajJQbgJH0A2QqbGjCV+b9Z_g@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 23, 2021 at 10:41:26PM +0200, Bartosz Golaszewski wrote:
> On Thu, Apr 8, 2021 at 4:55 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > The change in the series has been inspired by [1], which, I think,
> > can be improved. Here I present the view how it can be done.
> >
> > The series marked as RFT since I have no hardware and I perform
> > compile test only.
> >
> > The patches 1 and 2 can be (independently) applied for v5.13, but I'm not in
> > hurry with the series, due to above (lack of real testing). So I'm flexible in
> > a way how it can be proceed.
> >
> > [1]: cover.1617380819.git.syednwaris@gmail.com

> I usually trust Andy with his work but is there any chance we can get
> a Tested-by before the merge window?

I'm not in hurry with this and I really want to have a confirmation on this
before we proceed. I may send a v2 RFT after v5.13-rc1 is out.

Note TWIMC that the series has an additional followup fix that I sent
separately (it's properly linked to the thread nevertheless).

-- 
With Best Regards,
Andy Shevchenko


