Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C65C9100B66
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2019 19:22:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726336AbfKRSWW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Nov 2019 13:22:22 -0500
Received: from mga03.intel.com ([134.134.136.65]:24718 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726216AbfKRSWW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 18 Nov 2019 13:22:22 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Nov 2019 10:22:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,321,1569308400"; 
   d="scan'208";a="204275190"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga007.fm.intel.com with ESMTP; 18 Nov 2019 10:22:20 -0800
Received: from andy by smile with local (Exim 4.93-RC1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1iWlfH-0006ML-Sv; Mon, 18 Nov 2019 20:22:19 +0200
Date:   Mon, 18 Nov 2019 20:22:19 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v1] gpio: lynxpoint: Setup correct IRQ handlers
Message-ID: <20191118182219.GA32742@smile.fi.intel.com>
References: <20191118180251.31439-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191118180251.31439-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 18, 2019 at 08:02:51PM +0200, Andy Shevchenko wrote:
> When commit 75e99bf5ed8f ("gpio: lynxpoint: set default handler to be
> handle_bad_irq()") switched default handler to be handle_bad_irq() the
> lp_irq_type() function remained untouched. It means that even request_irq()
> can't change the handler and we are not able to handle IRQs properly anymore.
> Fix it by setting correct handlers in the lp_irq_type() callback.

Linus, I can send this one and MAINTAINERS update as a PR for v5.4 if it would
work better for you.

P.S. I eventually found the platform to test this with GPIO IRQs (another
platform I had wasn't providing GpioInt() resources and thus not possible to
test).

> Fixes: 75e99bf5ed8f ("gpio: lynxpoint: set default handler to be handle_bad_irq()")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpio-lynxpoint.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpio/gpio-lynxpoint.c b/drivers/gpio/gpio-lynxpoint.c
> index e9e47c0d5be7..490ce7bae25e 100644
> --- a/drivers/gpio/gpio-lynxpoint.c
> +++ b/drivers/gpio/gpio-lynxpoint.c
> @@ -164,6 +164,12 @@ static int lp_irq_type(struct irq_data *d, unsigned type)
>  		value |= TRIG_SEL_BIT | INT_INV_BIT;
>  
>  	outl(value, reg);
> +
> +	if (type & IRQ_TYPE_EDGE_BOTH)
> +		irq_set_handler_locked(d, handle_edge_irq);
> +	else if (type & IRQ_TYPE_LEVEL_MASK)
> +		irq_set_handler_locked(d, handle_level_irq);
> +
>  	spin_unlock_irqrestore(&lg->lock, flags);
>  
>  	return 0;
> -- 
> 2.24.0
> 

-- 
With Best Regards,
Andy Shevchenko


