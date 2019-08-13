Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B53C28B82E
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Aug 2019 14:15:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726637AbfHMMP6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Aug 2019 08:15:58 -0400
Received: from mga18.intel.com ([134.134.136.126]:52790 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726551AbfHMMP6 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 13 Aug 2019 08:15:58 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Aug 2019 05:15:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,381,1559545200"; 
   d="scan'208";a="327660348"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
  by orsmga004.jf.intel.com with ESMTP; 13 Aug 2019 05:15:56 -0700
Received: from andy by smile with local (Exim 4.92.1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1hxViU-0005md-1n; Tue, 13 Aug 2019 15:15:54 +0300
Date:   Tue, 13 Aug 2019 15:15:54 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Pavel Machek <pavel@denx.de>
Cc:     Stefan Roese <sr@denx.de>, linux-serial@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 2/2] serial: mctrl_gpio: Support all GPIO suffixes (gpios
 vs gpio)
Message-ID: <20190813121554.GU30120@smile.fi.intel.com>
References: <20190808132543.26274-1-sr@denx.de>
 <20190808132543.26274-2-sr@denx.de>
 <20190808134859.GY30120@smile.fi.intel.com>
 <c4d14b64-6c2f-7e87-ea45-aa780dca85b8@denx.de>
 <20190812105307.GA30120@smile.fi.intel.com>
 <20190813114258.GA11559@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190813114258.GA11559@amd>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 13, 2019 at 01:42:58PM +0200, Pavel Machek wrote:
> On Mon 2019-08-12 13:53:07, Andy Shevchenko wrote:
> > On Thu, Aug 08, 2019 at 03:59:36PM +0200, Stefan Roese wrote:
> > > On 08.08.19 15:48, Andy Shevchenko wrote:
> > > > On Thu, Aug 08, 2019 at 03:25:43PM +0200, Stefan Roese wrote:

> > I tried hard to find an evidence of this in Linux kernel, I assume that comes
> > from DT compiler or something, but fail. Linux kernel OF properties handling is
> > written in the assumption of arbitrary length of the property name.
> > 
> > It might be that my hard was not hard at all and I missed something.
> > 
> > > > Or maybe we can still continue using kasprintf() approach?
> > > 
> > > Frankly, I was feeling a bit uncomfortable with this memory allocation
> > > in a loop. And Pavel also commented on this:
> > > 
> > > https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg2066286.html
> > 
> > If memory allocator fails, it's a big issue, and what will happen next probably
> > much less important.
> 
> Not... really. With "too big" allocations, it will fail.

Yeah, or with relatively small if memory is too much fragmented.
But we are talking about really small allocations here in most cases, right?

> Anyway, my point is that allocating in a loop for this is slow and
> ugly. If we don't have a maximum property length, we should probably
> invent some. I mean, we can agree that 64KB property name is not okay,
> right?

My point that is should be declared on the level of property API.
Restricting it on the level of one, 'client' to that API, framework is not
a solution.

-- 
With Best Regards,
Andy Shevchenko


