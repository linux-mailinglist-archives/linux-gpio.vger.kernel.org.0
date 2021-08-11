Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DABF3E91FC
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Aug 2021 14:55:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229811AbhHKM4I (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Aug 2021 08:56:08 -0400
Received: from mga02.intel.com ([134.134.136.20]:13614 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229473AbhHKM4I (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Aug 2021 08:56:08 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10072"; a="202301506"
X-IronPort-AV: E=Sophos;i="5.84,313,1620716400"; 
   d="scan'208";a="202301506"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2021 05:55:44 -0700
X-IronPort-AV: E=Sophos;i="5.84,313,1620716400"; 
   d="scan'208";a="439705010"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2021 05:55:42 -0700
Received: from andy by smile with local (Exim 4.94.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mDnlg-007pM3-A5; Wed, 11 Aug 2021 15:55:36 +0300
Date:   Wed, 11 Aug 2021 15:55:36 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Cc:     Hoan Tran <hoan@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v2 1/4] gpio: dwapb: Unify ACPI enumeration checks in
 get_irq() and configure_irqs()
Message-ID: <YRPIyK7OjAERc9uD@smile.fi.intel.com>
References: <20210804160019.77105-1-andriy.shevchenko@linux.intel.com>
 <YRPFs7qoACdN+bEw@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YRPFs7qoACdN+bEw@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 11, 2021 at 03:42:27PM +0300, Andy Shevchenko wrote:
> On Wed, Aug 04, 2021 at 07:00:16PM +0300, Andy Shevchenko wrote:
> > Shared IRQ is only enabled for ACPI enumeration, there is no need
> > to have a special flag for that, since we simple can test if device
> > has been enumerated by ACPI. This unifies the checks in dwapb_get_irq()
> > and dwapb_configure_irqs().
> 
> Bart, are you okay with the series? Can it be applied, please?

I can send it inside my PR if you prefer, btw. (I jest realized that I have
already couple of patches in the queue.

-- 
With Best Regards,
Andy Shevchenko


