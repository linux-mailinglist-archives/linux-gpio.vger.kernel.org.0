Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65D2318FCCF
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2020 19:39:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727867AbgCWSij (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Mar 2020 14:38:39 -0400
Received: from mga05.intel.com ([192.55.52.43]:4056 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727854AbgCWSij (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 23 Mar 2020 14:38:39 -0400
IronPort-SDR: BBUrZUaHloqpr93dVpPjlPaOMYCNjlXzDiRHa6impAjhERXagygWx8jt8NKpOWcJHsx7Wuhlfd
 dxlckur55CZg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2020 11:38:38 -0700
IronPort-SDR: 1FlYqR1KoeDYH/7vk9o1g1GPHmW8uhLynXsrrIUqkHPjzg1egWVNpjS2QB2+qzMMfys5pu6Sbz
 gKj10E4UOnuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,297,1580803200"; 
   d="scan'208";a="445908404"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga005.fm.intel.com with ESMTP; 23 Mar 2020 11:38:35 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jGRy9-00CJWk-6v; Mon, 23 Mar 2020 20:38:37 +0200
Date:   Mon, 23 Mar 2020 20:38:37 +0200
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
        Allison Randal <allison@lohutok.net>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/6] gpio: dwapb: Add debounce reference clock support
Message-ID: <20200323183837.GV1922688@smile.fi.intel.com>
References: <20200306132505.8D3B88030795@mail.baikalelectronics.ru>
 <20200323180632.14119-1-Sergey.Semin@baikalelectronics.ru>
 <20200323180632.14119-6-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200323180632.14119-6-Sergey.Semin@baikalelectronics.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 23, 2020 at 09:06:31PM +0300, Sergey.Semin@baikalelectronics.ru wrote:
> From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> Aside from the APB reference clock DW GPIO controller can have a
> dedicated clock connected to setup a debounce time interval for
> GPIO-based IRQs. Since this functionality is optional the corresponding
> clock source is also optional. Due to this lets handle the debounce
> clock in the same way as it has been developed for the APB reference
> clock, but using the bulk request/enable-disable methods.

> +	if (err) {
> +		dev_err(gpio->dev, "Cannot reenable APB/Debounce clocks\n");
> +		return err;
> +	}

Yeah, this should be a separate change.

Otherwise looks good.

Also, did I miss the documentation update (bindings)?

-- 
With Best Regards,
Andy Shevchenko


