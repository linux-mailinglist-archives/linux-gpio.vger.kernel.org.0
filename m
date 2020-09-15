Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C57D926A218
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Sep 2020 11:24:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726155AbgIOJYy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Sep 2020 05:24:54 -0400
Received: from mga02.intel.com ([134.134.136.20]:30643 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726102AbgIOJYu (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 15 Sep 2020 05:24:50 -0400
IronPort-SDR: St4AlF/Fps3+insam6zBWZf+ISZz9TyoC7V7nYcU3vQdOdPPPu4KNwPqfhUtrlTqoJ7Q649WPE
 Afvabu+1qORg==
X-IronPort-AV: E=McAfee;i="6000,8403,9744"; a="146914825"
X-IronPort-AV: E=Sophos;i="5.76,429,1592895600"; 
   d="scan'208";a="146914825"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2020 02:24:49 -0700
IronPort-SDR: WSGQc3QFeKFId7UBpbqQRaeYt001yQCA0CncDhxGZQiq1GpJVVHGjZQsIbnbxZrFio0G0eoYcy
 581Dm7S9U9WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,429,1592895600"; 
   d="scan'208";a="335581438"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 15 Sep 2020 02:24:47 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kI78Q-00GnpL-8p; Tue, 15 Sep 2020 12:20:22 +0300
Date:   Tue, 15 Sep 2020 12:20:22 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2] gpiolib: Fix line event handling in syscall
 compatible mode
Message-ID: <20200915092022.GR3956970@smile.fi.intel.com>
References: <20200914143743.39871-1-andriy.shevchenko@linux.intel.com>
 <20200914230526.GA4138@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200914230526.GA4138@sol>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 15, 2020 at 07:05:26AM +0800, Kent Gibson wrote:
> On Mon, Sep 14, 2020 at 05:37:43PM +0300, Andy Shevchenko wrote:

...

> It can return size_t now.

> >  	ssize_t bytes_read = 0;
> > +	ssize_t ge_size;
> 
> Similarly here.

I deliberately left the ssize_t type to be consistent with the returned type of
the function and bytes_read. If you insist on the type change I will do, though
I personally like my approach.

Thanks!

-- 
With Best Regards,
Andy Shevchenko


