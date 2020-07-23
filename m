Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18CC422AC20
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jul 2020 12:06:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728235AbgGWKGi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Jul 2020 06:06:38 -0400
Received: from mga12.intel.com ([192.55.52.136]:14040 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727828AbgGWKGh (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 23 Jul 2020 06:06:37 -0400
IronPort-SDR: nfl2vYjqNDfPW7GROQU4Se+knnMcbKs3roeRScpJ0iT63YuGk4dOS4HuhkHBgJM5oxbn5jMumS
 Rh2CFkDOF1hw==
X-IronPort-AV: E=McAfee;i="6000,8403,9690"; a="130059714"
X-IronPort-AV: E=Sophos;i="5.75,386,1589266800"; 
   d="scan'208";a="130059714"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2020 03:06:37 -0700
IronPort-SDR: 08hu/07UEbSbUKViBCKQSar54I/4i7troQu9GdoNbRTapjQ6XbGlt9barFjCMs8S5gbpZwEPjA
 G8LYFcwvhjLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,386,1589266800"; 
   d="scan'208";a="328512965"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga007.jf.intel.com with ESMTP; 23 Jul 2020 03:06:34 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1jyY7W-003QJJ-LJ; Thu, 23 Jul 2020 13:06:34 +0300
Date:   Thu, 23 Jul 2020 13:06:34 +0300
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Hoan Tran <hoan@os.amperecomputing.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] gpio: dwapb: Refactor GPIO resources initialization
Message-ID: <20200723100634.GK3703480@smile.fi.intel.com>
References: <20200723013858.10766-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200723013858.10766-1-Sergey.Semin@baikalelectronics.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 23, 2020 at 04:38:51AM +0300, Serge Semin wrote:
> This series is about the DW APB GPIO device initialization procedure
> cleaning up. First of all it has been discovered that having a
> vendor-specific "snps,nr-gpios" property isn't only redundant but also
> might be dangerous (see the commit log for details). Instead we suggest to
> use the generic "ngpios" property to define a number of GPIOs each DW APB
> GPIO controller port supports. Secondly seeing a tendency of the other
> GPIO drivers getting converted to using the GPIO-lib-based IRQ-chip
> interface this series provides a patch, which replaces the DW APB GPIO
> driver Generic IRQ-chip implementation with the GPIO-lib IRQ-chip one.
> Finally the DW APB GPIO device probe procedure is simplified by
> converting the code to be using the device managed resources for the
> reference clocks initialization, reset control assertion/de-assertion
> and GPIO-chip registration.

Thanks! For non-commented patches, excluding DT one,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: linux-gpio@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> 
> Serge Semin (7):
>   dt-bindings: gpio: dwapb: Add ngpios property support
>   gpio: dwapb: Add ngpios DT-property support
>   gpio: dwapb: Move MFD-specific IRQ handler
>   gpio: dwapb: Convert driver to using the GPIO-lib-based IRQ-chip
>   gpio: dwapb: Get reset control by means of resource managed interface
>   gpio: dwapb: Get clocks by means of resource managed interface
>   gpio: dwapb: Use resource managed GPIO-chip add data method
> 
>  .../bindings/gpio/snps,dw-apb-gpio.yaml       |   6 +
>  drivers/gpio/Kconfig                          |   2 +-
>  drivers/gpio/gpio-dwapb.c                     | 324 +++++++++---------
>  3 files changed, 161 insertions(+), 171 deletions(-)
> 
> -- 
> 2.26.2
> 

-- 
With Best Regards,
Andy Shevchenko


