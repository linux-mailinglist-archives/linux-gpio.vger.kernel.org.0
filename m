Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E25089C18
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Aug 2019 12:58:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727846AbfHLK6z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Aug 2019 06:58:55 -0400
Received: from mga02.intel.com ([134.134.136.20]:1866 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727691AbfHLK6z (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 12 Aug 2019 06:58:55 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Aug 2019 03:58:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,377,1559545200"; 
   d="scan'208";a="177443447"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
  by fmsmga007.fm.intel.com with ESMTP; 12 Aug 2019 03:58:27 -0700
Received: from andy by smile with local (Exim 4.92.1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1hx81x-0005cp-OT; Mon, 12 Aug 2019 13:58:25 +0300
Date:   Mon, 12 Aug 2019 13:58:25 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        David Cohen <david.a.cohen@linux.intel.com>,
        Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH] gpio: lynxpoint: Pass irqchip when adding gpiochip
Message-ID: <20190812105825.GB30120@smile.fi.intel.com>
References: <20190812081351.21284-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190812081351.21284-1-linus.walleij@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 12, 2019 at 10:13:51AM +0200, Linus Walleij wrote:
> We need to convert all old gpio irqchips to pass the irqchip
> setup along when adding the gpio_chip. For more info see
> drivers/gpio/TODO.
> 
> For chained irqchips this is a pretty straight-forward
> conversion.
> 
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Cc: David Cohen <david.a.cohen@linux.intel.com>
> Cc: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Andy: when you're happy with this you can either supply an
> ACK and I will merge it or you can merge it into your tree
> for a later pull request, just tell me what you prefer.

I'll take through my tree.
See comment below.

> +		girq->num_parents = 1;
> +		girq->parents = devm_kcalloc(&pdev->dev, 1,
> +					     sizeof(*girq->parents),
> +					     GFP_KERNEL);
> +		if (!girq->parents)
> +			return -ENOMEM;

I understand the point to use kcalloc() for one entry, though I would make
intention more explicitly, i.e. use girq->num_parents in it instead of hard
coded value.

> +		girq->parents[0] = (unsigned)irq_rc->start;
> +		girq->default_type = IRQ_TYPE_NONE;

> +		girq->handler = handle_simple_irq;

> -		ret = gpiochip_irqchip_add(gc, &lp_irqchip, 0,
> -					   handle_simple_irq, IRQ_TYPE_NONE);

Hmm... Now I'm wondering, shall we use handle_bad_irq() here?

-- 
With Best Regards,
Andy Shevchenko


