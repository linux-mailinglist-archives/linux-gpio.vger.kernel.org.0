Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5EE43587DD
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Apr 2021 17:08:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232099AbhDHPIa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Apr 2021 11:08:30 -0400
Received: from mga04.intel.com ([192.55.52.120]:20617 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231995AbhDHPI3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 8 Apr 2021 11:08:29 -0400
IronPort-SDR: sBgCErCiu50mTO6P65OaWvgXZXmZpfGnHbKLYI8fy39LO2tW9bn6K53LrSE+GkIpm5Cpdkp5uU
 ioa7mS8a7FxQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9948"; a="191406154"
X-IronPort-AV: E=Sophos;i="5.82,206,1613462400"; 
   d="scan'208";a="191406154"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2021 08:08:16 -0700
IronPort-SDR: eyr3XZ4aMEISqgXdcU5mtNIg+bh+K3PnYPQbTtIz5W7c8WvkKTZStEsTbpK2D+42s2odi13GjK
 UVm7E8cJyBiQ==
X-IronPort-AV: E=Sophos;i="5.82,206,1613462400"; 
   d="scan'208";a="449710603"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2021 08:08:13 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lUWGO-002JkX-L9; Thu, 08 Apr 2021 18:08:08 +0300
Date:   Thu, 8 Apr 2021 18:08:08 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Yury Norov <yury.norov@gmail.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Syed Nayyar Waris <syednwaris@gmail.com>,
        vilhelm.gray@gmail.com
Subject: Re: [PATCH v1 4/5] gpio: xilinx: Switch to use bitmap APIs
Message-ID: <YG8cWBkcF8ulHW0D@smile.fi.intel.com>
References: <20210408145601.68651-1-andriy.shevchenko@linux.intel.com>
 <20210408145601.68651-5-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210408145601.68651-5-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 08, 2021 at 05:56:00PM +0300, Andy Shevchenko wrote:
> It seems that Xilinx GPIO driver operates with bit arrays longer than 32 and
> thus can leverage bitmap APIs for that. It makes code better to understand.
> 
> The ->probe() function is modified to try read properties for both channels
> since is_dual check makes only sense for the amount of pins used for the second
> channel. On top of that kzalloc() guarantees zero initial values for the fields
> in the private data structure, hence drop unneeded conditionals and assignments.
> 
> The change is inspired by Syed Nayyar Waris' ideas about bitmap API extension.

As I was afraid in the cover letter, I found some mistakes already.
In any case, I'll wait for the comments and test of other patches if possible.

Out of curiosity, below I point out the issues.

...

> +	return bitmap_bitremap(gpio, chip->sw_map, chip->hw_map, chip->gc.ngpio);

Seems we have to use 64 instead of ngpio here.

...

> +	bitmap_replace(state, chip->state, hw_bits, hw_mask, gc->ngpio);

Ditto.

...

> +	bitmap_copy(chip->state, state, gc->ngpio);

Ditto.

...

> +	for_each_set_bit(bit, all, 64)
> +		generic_handle_irq(irq_find_mapping(gc->irq.domain, bit));

Here should be used gpio actually and ngpio IIUC.

-- 
With Best Regards,
Andy Shevchenko


