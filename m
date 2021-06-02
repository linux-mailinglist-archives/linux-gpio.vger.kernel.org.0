Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 180E6398EDD
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jun 2021 17:41:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232250AbhFBPmy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Jun 2021 11:42:54 -0400
Received: from mga17.intel.com ([192.55.52.151]:21723 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232143AbhFBPmx (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 2 Jun 2021 11:42:53 -0400
IronPort-SDR: E0CjcHGYWAXYyWvv/zl78j9BZGzK+Aic2Ep6r2Llk8chXgKkzA57VMYitrjCZFm+qW1BIWZPVs
 2zPCDfy19RMg==
X-IronPort-AV: E=McAfee;i="6200,9189,10003"; a="184185304"
X-IronPort-AV: E=Sophos;i="5.83,242,1616482800"; 
   d="scan'208";a="184185304"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2021 08:41:05 -0700
IronPort-SDR: dmRL/EnHUrnb3++01jCu6QmRSwK7sNLzM7SKFg0rCY6kIQeeNinfsBe7FWitid7W59MSCUxjDk
 zjI9b27TeQHA==
X-IronPort-AV: E=Sophos;i="5.83,242,1616482800"; 
   d="scan'208";a="617244221"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2021 08:41:02 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1loSzM-00Gk0t-4X; Wed, 02 Jun 2021 18:41:00 +0300
Date:   Wed, 2 Jun 2021 18:41:00 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Serge Semin <fancer.lancer@gmail.com>
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v1 2/2] gpio: dwapb: Switch to use fwnode_irq_get()
Message-ID: <YLemjDc1hhuXUojl@smile.fi.intel.com>
References: <20210601162128.35663-1-andriy.shevchenko@linux.intel.com>
 <20210601162128.35663-2-andriy.shevchenko@linux.intel.com>
 <20210602140546.b7o43jnrvdmtdam4@mobilestation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210602140546.b7o43jnrvdmtdam4@mobilestation>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 02, 2021 at 05:05:46PM +0300, Serge Semin wrote:
> On Tue, Jun 01, 2021 at 07:21:28PM +0300, Andy Shevchenko wrote:
> > We have open coded variant of fwnode_irq_get() in dwapb_get_irq().
> > Replace it with a simple call.
> 
> Sometime ago I was trying to figure out a way to simplify this part of
> the driver by using the platform_get_irq_optional() method for both
> ACPI and OF cases. As you must have already found out by yourself it
> didn't work out because of DW APB GPIO DT-nodes are supposed to have
> sub-nodes with ports description. The OF-descriptors of these
> sub-nodes aren't touched by the platform_get_irq_optional() method, it
> just fails to detect IRQ-controller because it only works with the
> device OF-node. So I gave up and decided to leave the code as is. I
> can't remember now why I haven't used fwnode_irq_get() here. Most
> likely I just preferred a direct of_irq_get() invocation here just for
> clarity, since the only way we'd be calling fwnode_irq_get() here is
> to actually get IRQ number from the OF-node anyway, while the
> acpi_irq_get() method call made from the method fwnode_irq_get() will
> hardly ever be required here. If you think otherwise or I missing
> something please tell me.
> 
> Anyway by applying your patch at least we'll save a few lines of the
> code and may in future have swnode-base IRQs support in the
> fwnode_irq_get() method. So it still worths merging in. Thanks for
> suggesting this change.
> 
> Acked-by: Serge Semin <fancer.lancer@gmail.com>
> Tested-by: Serge Semin <fancer.lancer@gmail.com>

Thanks for testing!

-- 
With Best Regards,
Andy Shevchenko


