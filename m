Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B1114849E4
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jan 2022 22:31:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233873AbiADVb2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Jan 2022 16:31:28 -0500
Received: from mga17.intel.com ([192.55.52.151]:21721 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232437AbiADVb1 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 4 Jan 2022 16:31:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641331887; x=1672867887;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7RkX0G4ff38JzBl1hu8k4XOdmO23whLzdLTauYUvclM=;
  b=JukgViWZpaIIslxuD10VOJGd8f0ajpxli9jjV5O04slRlA/aBN3jGCrr
   717zWYabJPEWNXGzxjommmzuktme6UqSt3VjgKOScpXx/dhFFlNSg+3MZ
   7qcXZa6shj93DrU23DNM0FZy5rjR1jriCQs++XKhvfCAsd9xQsUckWPr+
   nnGy0wD3ZaZSxXm4Okz84aZ4eYpqOD0t8TvYwVQhLraTB837YrfQ30Ql0
   eUwY8j+r9bsPmVtP8aY/+hEFJf0pydMxnpJcYycA82vJHCl8flj+R/DYm
   h303FVN2JDSwJhj60F5EUi4vAD+OkMjKyYzko4PsvyHFzXBLcQX9O1NnD
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="222978949"
X-IronPort-AV: E=Sophos;i="5.88,262,1635231600"; 
   d="scan'208";a="222978949"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2022 13:31:27 -0800
X-IronPort-AV: E=Sophos;i="5.88,262,1635231600"; 
   d="scan'208";a="611225621"
Received: from smile.fi.intel.com ([10.237.72.61])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2022 13:31:25 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1n4rNf-006RUp-SF;
        Tue, 04 Jan 2022 23:30:07 +0200
Date:   Tue, 4 Jan 2022 23:30:07 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: Re: [PATCH] pinctrl: cherryview: Trigger hwirq0 for interrupt-lines
 without a mapping
Message-ID: <YdS8X1w7YWizdady@smile.fi.intel.com>
References: <20220104164238.253142-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220104164238.253142-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 04, 2022 at 05:42:38PM +0100, Hans de Goede wrote:
> Commit bdfbef2d29dc ("pinctrl: cherryview: Don't use selection 0 to mark
> an interrupt line as unused") made the code properly differentiate
> between unset vs (hwirq) 0 entries in the GPIO-controller interrupt-line
> to GPIO pinnumber/hwirq mapping.
> 
> This is causing some boards to not boot. This commit restores the old
> behavior of triggering hwirq 0 when receiving an interrupt on an
> interrupt-line for which there is no mapping.

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Linus, can you apply this directly for v5.16 release?

> Fixes: bdfbef2d29dc ("pinctrl: cherryview: Don't use selection 0 to mark an interrupt line as unused")
> Reported-and-tested-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/pinctrl/intel/pinctrl-cherryview.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
> index 683b95e9639a..5d85ef5d5da8 100644
> --- a/drivers/pinctrl/intel/pinctrl-cherryview.c
> +++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
> @@ -1471,8 +1471,9 @@ static void chv_gpio_irq_handler(struct irq_desc *desc)
>  
>  		offset = cctx->intr_lines[intr_line];
>  		if (offset == CHV_INVALID_HWIRQ) {
> -			dev_err(dev, "interrupt on unused interrupt line %u\n", intr_line);
> -			continue;
> +			dev_warn_once(dev, "interrupt on unmapped interrupt line %u\n", intr_line);
> +			/* Some boards expect hwirq 0 to trigger in this case */
> +			offset = 0;
>  		}
>  
>  		generic_handle_domain_irq(gc->irq.domain, offset);
> -- 
> 2.33.1
> 

-- 
With Best Regards,
Andy Shevchenko


