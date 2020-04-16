Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BF5C1ABE13
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2020 12:39:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505373AbgDPKjh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Apr 2020 06:39:37 -0400
Received: from mga17.intel.com ([192.55.52.151]:1855 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2505352AbgDPKjK (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Apr 2020 06:39:10 -0400
IronPort-SDR: NGZeJ0+fm8TUBqsDibiv9TKmw7gBZkneF5N/1xttWAlXrSO0zYowVyQTdwD/66GGmU3WmJOtDQ
 HCiJkfxiLqhw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2020 03:39:10 -0700
IronPort-SDR: a3ezKp64KdgfmwLRLcFP3yiMxwrf4aHAVPhtkgjrwoBwwa8mgqzs6MoUOL6QFqBd+rDmAkhk2S
 s9afEAsO4ZVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,390,1580803200"; 
   d="scan'208";a="299271809"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by FMSMGA003.fm.intel.com with ESMTP; 16 Apr 2020 03:39:08 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jP1vL-0010XD-F1; Thu, 16 Apr 2020 13:39:11 +0300
Date:   Thu, 16 Apr 2020 13:39:11 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Serge Semin <fancer.lancer@gmail.com>,
        Jan Kiszka <jan.kiszka@siemens.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 08/14] gpio: dwapb: Convert to use IRQ core provided
 macros
Message-ID: <20200416103911.GX185537@smile.fi.intel.com>
References: <20200415141534.31240-1-andriy.shevchenko@linux.intel.com>
 <20200415141534.31240-9-andriy.shevchenko@linux.intel.com>
 <20200415175309.6l6skv7qsdjqsryi@mobilestation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200415175309.6l6skv7qsdjqsryi@mobilestation>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 15, 2020 at 08:53:09PM +0300, Serge Semin wrote:
> On Wed, Apr 15, 2020 at 05:15:28PM +0300, Andy Shevchenko wrote:
> > IRQ core provides macros such as IRQ_RETVAL().
> > Convert code to use them.

> BTW Forgot to mention. Irrelevantly to this patch just so you know seeing
> you are from Intel and this part is being utilized by the Intel Quark SoC.
> dwapb_irq_handler_mfd() handler will cause a problem in RT-patched kernel
> (I've seen such issue in another GPIO-driver). So if PREEMP_RT_FULL patch
> is applied and the FULL-RT scheduler is enabled all interrupt handlers
> specified by request_irq()-based methods will be handled by a kernel thread,
> while generic_handle_irq() is supposed to be called from the atomic context
> only (with interrupts disabled). As a result an ugly stack dump will be printed
> to the kernel log by the next code:
> https://elixir.bootlin.com/linux/latest/source/kernel/irq/handle.c#L152
> 
> A way to fix this is described in Documentation/driver-api/gpio/driver.rst

There is patch from Siemens to fix that [1]. I dunno if they are going to upstream it.
Jan?

[1]: https://github.com/siemens/meta-iot2000/blob/master/meta-iot2000-bsp/recipes-kernel/linux/patches/rt-0002-gpio-dwapb-Work-around-RT-full-s-enforced-IRQ-thread.patch

-- 
With Best Regards,
Andy Shevchenko


