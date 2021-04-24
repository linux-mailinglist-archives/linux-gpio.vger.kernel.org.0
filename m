Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A077B36A0CD
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Apr 2021 13:14:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231387AbhDXLPP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 24 Apr 2021 07:15:15 -0400
Received: from mga02.intel.com ([134.134.136.20]:35603 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231203AbhDXLPO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 24 Apr 2021 07:15:14 -0400
IronPort-SDR: S13mW18+cSUIDnLJ9ODiLK73tSr2YaVykZZYiFcUrmhXZFnHjL3VofrQ2Xg4fdnnxpr1oC6MZw
 sFCDWs7VmHMg==
X-IronPort-AV: E=McAfee;i="6200,9189,9963"; a="183304092"
X-IronPort-AV: E=Sophos;i="5.82,248,1613462400"; 
   d="scan'208";a="183304092"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2021 04:14:36 -0700
IronPort-SDR: RlYoDBKcO4fEiCXNuBpmsJZuNUxTc/o6rIXFz6YvEh9Fqdw53uvqaIzZ9vd70ctiO8BAa6uigh
 ciko9hHUUnWA==
X-IronPort-AV: E=Sophos;i="5.82,248,1613462400"; 
   d="scan'208";a="386603881"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2021 04:14:33 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1laGF4-006ozO-7I; Sat, 24 Apr 2021 14:14:30 +0300
Date:   Sat, 24 Apr 2021 14:14:30 +0300
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
Message-ID: <YIP9ltcdf7mNtYRd@smile.fi.intel.com>
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

> >   bitmap: Make bitmap_remap() and bitmap_bitremap() available to users
> >   gpio: xilinx: Correct kernel doc for xgpio_probe()

Bart, thanks for the warm words, just pointing out that patches 1 and 2 has
been reviewed and may be applied for v5.13 cycle. Up to you.

> I usually trust Andy with his work but is there any chance we can get
> a Tested-by before the merge window?

-- 
With Best Regards,
Andy Shevchenko


