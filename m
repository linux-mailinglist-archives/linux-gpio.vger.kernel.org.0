Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA5A22C8317
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Nov 2020 12:22:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbgK3LWb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Nov 2020 06:22:31 -0500
Received: from mga04.intel.com ([192.55.52.120]:6542 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725902AbgK3LWa (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 30 Nov 2020 06:22:30 -0500
IronPort-SDR: lTl7Uu+9OB1motRnm87W/Ps42boK3+pP3zSCpD7CS9LG4lA8GyMZG2mhTp6bSCaevMpS/3oVS4
 YnGfjYrLEKFw==
X-IronPort-AV: E=McAfee;i="6000,8403,9820"; a="170055971"
X-IronPort-AV: E=Sophos;i="5.78,381,1599548400"; 
   d="scan'208";a="170055971"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2020 03:21:50 -0800
IronPort-SDR: s6bBcD5XXuH8CcyHYxPeLfKyKFHJqkNDMGls2aIuhl6c18vpFzFDk+kn6McJ5BVaLyD9uUBAmc
 c0ZP197bSHhQ==
X-IronPort-AV: E=Sophos;i="5.78,381,1599548400"; 
   d="scan'208";a="480619113"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2020 03:21:48 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1kjhGc-00B1xM-2x; Mon, 30 Nov 2020 13:22:50 +0200
Date:   Mon, 30 Nov 2020 13:22:50 +0200
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Luo Jiaxing <luojiaxing@huawei.com>
Cc:     bgolaszewski@baylibre.com, linus.walleij@linaro.org,
        Sergey.Semin@baikalelectronics.ru, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linuxarm@huawei.com
Subject: Re: [PATCH v1] gpio: dwapb: mask/unmask IRQ when disable/enable it
Message-ID: <20201130112250.GK4077@smile.fi.intel.com>
References: <1606728979-44259-1-git-send-email-luojiaxing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1606728979-44259-1-git-send-email-luojiaxing@huawei.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 30, 2020 at 05:36:19PM +0800, Luo Jiaxing wrote:
> The mask and unmask registers are not configured in dwapb_irq_enable() and
> dwapb_irq_disable(). In the following situations, the IRQ will be masked by
> default after the IRQ is enabled:
> 
> mask IRQ -> disable IRQ -> enable IRQ
> 
> In this case, the IRQ status of GPIO controller is inconsistent with it's
> irq_data too. For example, in __irq_enable(), IRQD_IRQ_DISABLED and
> IRQD_IRQ_MASKED are both clear, but GPIO controller do not perform unmask.

Sounds a bit like a papering over the issue which is slightly different.
Can you elaborate more, why ->irq_mask() / ->irq_unmask() are not being called?

-- 
With Best Regards,
Andy Shevchenko


