Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12759B0261
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Sep 2019 19:10:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729256AbfIKRKV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Sep 2019 13:10:21 -0400
Received: from mga01.intel.com ([192.55.52.88]:28396 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729182AbfIKRKV (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Sep 2019 13:10:21 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Sep 2019 10:10:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,494,1559545200"; 
   d="scan'208";a="185879140"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga007.fm.intel.com with ESMTP; 11 Sep 2019 10:10:19 -0700
Received: from andy by smile with local (Exim 4.92.1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1i868I-0001wy-CC; Wed, 11 Sep 2019 20:10:18 +0300
Date:   Wed, 11 Sep 2019 20:10:18 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH 08/11] gpiolib: of: tease apart of_find_gpio()
Message-ID: <20190911171018.GT2680@smile.fi.intel.com>
References: <20190911075215.78047-1-dmitry.torokhov@gmail.com>
 <20190911075215.78047-9-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190911075215.78047-9-dmitry.torokhov@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 11, 2019 at 12:52:12AM -0700, Dmitry Torokhov wrote:
> Tease apart of_find_gpio() into common function that works on the
> firmware node, and a fallback handler that works on the device
> structure, so that we can later use of_find_gpio() in
> fwnode_gpiod_get_index().

> +			desc = of_find_gpio(dev_fwnode(dev),
> +					    con_id, idx, &lookupflags);

Couple of parameters can be placed on previous line.

> +			if (desc == ERR_PTR(-ENOENT))
> +				desc = of_find_gpio_fallback(dev, con_id, idx,
> +							     &lookupflags);

> +

Do we need extra blank line?


-- 
With Best Regards,
Andy Shevchenko


