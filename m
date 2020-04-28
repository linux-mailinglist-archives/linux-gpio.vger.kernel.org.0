Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFDE91BBDBF
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2020 14:41:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726678AbgD1Mla (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Apr 2020 08:41:30 -0400
Received: from mga18.intel.com ([134.134.136.126]:54094 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726544AbgD1Ml3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 28 Apr 2020 08:41:29 -0400
IronPort-SDR: jUf4WnhjgX9S6an5LekhnF/djlAZhLXxatOzjRAFcEm4cE454jrNrQuqDx+3nlYoVKJtgCQhpN
 wdz4rsAPDKeg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2020 05:41:29 -0700
IronPort-SDR: lrbuD/KegcDTY//9tCxcLtod41AI/QXVk2M281ItGEUMddrbnnhXUzKwfAjLoCT5bKjU2B22uj
 w1KpzqRaXFug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,327,1583222400"; 
   d="scan'208";a="261084754"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga006.jf.intel.com with ESMTP; 28 Apr 2020 05:41:26 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jTPYH-003YjU-C2; Tue, 28 Apr 2020 15:41:29 +0300
Date:   Tue, 28 Apr 2020 15:41:29 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Paul Thomas <pthomas8589@gmail.com>
Subject: Re: [PATCH v3 1/3] gpio: pca953x: Rewrite ->get_multiple() function
Message-ID: <20200428124129.GR185537@smile.fi.intel.com>
References: <20200420172752.33588-1-andriy.shevchenko@linux.intel.com>
 <20200421130300.GK185537@smile.fi.intel.com>
 <CAMpxmJVVDUN6ei__wt5z+hOJQ0w0r9TZjhN9HCtpCA8Vrud0qg@mail.gmail.com>
 <CACRpkdYDHiscnm0BrSTwG6=-SCWZeqVfnEEkMAeQcco77GM8kg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdYDHiscnm0BrSTwG6=-SCWZeqVfnEEkMAeQcco77GM8kg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 28, 2020 at 02:13:21PM +0200, Linus Walleij wrote:
> On Tue, Apr 21, 2020 at 5:42 PM Bartosz Golaszewski
> <bgolaszewski@baylibre.com> wrote:
> > wt., 21 kwi 2020 o 15:03 Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> napisał(a):
> > > On Mon, Apr 20, 2020 at 08:27:50PM +0300, Andy Shevchenko wrote:

...

> I don't mind trying to put in code to optimize use cases
> when accessing single bytes here either. But I'd like there
> to be explicit comments in the code saying why these
> optimizations are there. Can we do those on top of
> this (hopefully) known working base?

As I pointed out to Paul, the optimization like he proposed is not bad thing
per se, the implementation is. On top of that I suggested to take a look to IRQ
status bits, which presumable will leverage from this optimization as well.

So, After applying this series it would be matter of change one line in the
->get_multiple() to replace read_regs() with optimized version or so along with
IRQ bits changes.

-- 
With Best Regards,
Andy Shevchenko


