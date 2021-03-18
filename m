Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 108D634057A
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Mar 2021 13:27:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231126AbhCRM07 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Mar 2021 08:26:59 -0400
Received: from mga07.intel.com ([134.134.136.100]:61366 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230335AbhCRM0c (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 18 Mar 2021 08:26:32 -0400
IronPort-SDR: 1byFGz/+qa/08Wlu4FMYtqMkd0utZDTZd1UtYElZ/bXqNeZtVdCmB7ZMS/1eAMVsjP0KnVil+0
 P5Q0MLfvYqOQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9926"; a="253675488"
X-IronPort-AV: E=Sophos;i="5.81,258,1610438400"; 
   d="scan'208";a="253675488"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2021 05:26:31 -0700
IronPort-SDR: q6+TVo21t8aK9xYdbt/+bHI1bK7pr/OfVL5p5E1l2HBv7zbHzWheDlvsaGrmw2FXsk2HEQkFnn
 rXTNQbXkK5rA==
X-IronPort-AV: E=Sophos;i="5.81,258,1610438400"; 
   d="scan'208";a="372691124"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2021 05:26:30 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lMrjP-00DZ69-Ht; Thu, 18 Mar 2021 14:26:27 +0200
Date:   Thu, 18 Mar 2021 14:26:27 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v5 0/2] gpio: sch: Interrupt support
Message-ID: <YFNG8+sdIj6Orbjq@smile.fi.intel.com>
References: <20210317151928.41544-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210317151928.41544-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 17, 2021 at 05:19:26PM +0200, Andy Shevchenko wrote:
> The series adds event support to the Intel GPIO SCH driver. The hardware
> routes all events through GPE0 GPIO event.
> 
> I validated this on Intel Minnowboard (v1).
> 
> If somebody has different hardware with the same GPIO controller, I would
> appreciate additional testing.

I've applied this to my review and testing queue, thanks!

> Changes in v5:
> - added missed IRQ acknowledge callback (hence kernel Oops)
> - rewrite patch 2 completely from SCI to GPE hook
> 
> Changes in v4 (https://lore.kernel.org/linux-gpio/20210316162613.87710-1-andriy.shevchenko@linux.intel.com/T/#u):
> - turned to GPIO core infrastructure of IRQ chip instantiation (Linus)
> - converted IRQ callbacks to use better APIs
> - use handle_bad_irq() as default handler and now I know why, see
>   eb441337c714 ("gpio: pca953x: Set IRQ type when handle Intel Galileo Gen 2")
>     for the real example what happens if it's preset to something meaningful
> - fixed remove stage (we have to remove SCI handler, which wasn't done in v3)
> 
> Changes in v3 (https://lore.kernel.org/linux-gpio/cover.1574277614.git.jan.kiszka@siemens.com/T/#u):
> - split-up of the irq enabling patch as requested by Andy
> 
> Andy Shevchenko (1):
>   gpio: sch: Hook into ACPI GPE handler to catch GPIO edge events
> 
> Jan Kiszka (1):
>   gpio: sch: Add edge event support
> 
>  drivers/gpio/gpio-sch.c | 196 ++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 188 insertions(+), 8 deletions(-)
> 
> -- 
> 2.30.2
> 

-- 
With Best Regards,
Andy Shevchenko


