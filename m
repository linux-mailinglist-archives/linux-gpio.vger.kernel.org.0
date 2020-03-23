Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8BBA18FCC1
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2020 19:37:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727175AbgCWShC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Mar 2020 14:37:02 -0400
Received: from mga09.intel.com ([134.134.136.24]:31066 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726643AbgCWShB (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 23 Mar 2020 14:37:01 -0400
IronPort-SDR: YOkxqaso6Z7uPrm7mC6ZXusdJl53vhgH/gxmpk1KbItWK/qT0YLgSBdgeK+0iDSql1fefjyTR4
 r/QgSnwNSIJg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2020 11:37:01 -0700
IronPort-SDR: tn0NhD+lQU0//7+OWZF8rpqEyWHco1D+xNqV3wisea2CpAF7U/EzfOgg4BIY8Y53j3XrvIKEJR
 Fy+53NbiH7SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,297,1580803200"; 
   d="scan'208";a="235304109"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga007.jf.intel.com with ESMTP; 23 Mar 2020 11:36:57 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jGRwZ-00CJV4-2O; Mon, 23 Mar 2020 20:36:59 +0200
Date:   Mon, 23 Mar 2020 20:36:59 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Sergey.Semin@baikalelectronics.ru
Cc:     Hoan Tran <hoan@os.amperecomputing.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/6] gpio: dwapb: Use optional-clocks interface for
 APB ref-clock
Message-ID: <20200323183659.GU1922688@smile.fi.intel.com>
References: <20200306132505.8D3B88030795@mail.baikalelectronics.ru>
 <20200323180632.14119-1-Sergey.Semin@baikalelectronics.ru>
 <20200323180632.14119-5-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200323180632.14119-5-Sergey.Semin@baikalelectronics.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 23, 2020 at 09:06:30PM +0300, Sergey.Semin@baikalelectronics.ru wrote:
> From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> The common clocks kernel framework provides a generic way to use
> an optional reference clock sources. If it's utilized there is no
> need in checking whether the clock descriptor pointer is actually a
> negative error at the moment of the prepare/unprepare clocks method
> calling. So if the corresponding clock source is provided, then
> getting an error shall actually terminate the device probe procedure.
> If it isn't specified then the driver shall proceed with further
> initializations.
> 
> We'll use the optional clocks getting method to handle the APB reference
> clock, which can be provided for instance in the device of-node with
> "bus" clock-name.

> -	if (!IS_ERR(gpio->clk))
> -		clk_prepare_enable(gpio->clk);
> +	clk_prepare_enable(gpio->clk);

Perhaps it makes sense now to consider error code returned by above.
Maybe it's material for a separate patch (up to you).

The rest looks good.

-- 
With Best Regards,
Andy Shevchenko


