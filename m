Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1590E225CCA
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jul 2020 12:42:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728336AbgGTKk3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Jul 2020 06:40:29 -0400
Received: from mga05.intel.com ([192.55.52.43]:48629 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728290AbgGTKk3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 20 Jul 2020 06:40:29 -0400
IronPort-SDR: GuUILsx+nWhqO4bdDUozdYlzFb52sYTe8kGDHwsSmuqlxujvtNmUyQWwNAk4+M/gzUaf+lr7VD
 traVmEbHNqDA==
X-IronPort-AV: E=McAfee;i="6000,8403,9687"; a="234737789"
X-IronPort-AV: E=Sophos;i="5.75,374,1589266800"; 
   d="scan'208";a="234737789"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2020 03:40:28 -0700
IronPort-SDR: pdIOofzQnu5O/sZtthT/dTa7D4DE++Jyz1vkPToorQsEa9ta5YA52oVGSZ7xaTxubx57ElwWTa
 OkiUlUAxf2Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,374,1589266800"; 
   d="scan'208";a="431568927"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004.jf.intel.com with ESMTP; 20 Jul 2020 03:40:26 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1jxTDe-002riE-LP; Mon, 20 Jul 2020 13:40:26 +0300
Date:   Mon, 20 Jul 2020 13:40:26 +0300
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH][next] pinctrl: baytrail: Use fallthrough pseudo-keyword
Message-ID: <20200720104026.GR3703480@smile.fi.intel.com>
References: <20200716211919.GA17378@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200716211919.GA17378@embeddedor>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 16, 2020 at 04:19:19PM -0500, Gustavo A. R. Silva wrote:
> Replace the existing /* fall through */ comments and its variants with
> the new pseudo-keyword macro fallthrough[1].
> 
> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html?highlight=fallthrough#implicit-switch-case-fall-through

Pushed to my review and testing queue, thanks!

> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  drivers/pinctrl/intel/pinctrl-baytrail.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
> index a917a2df520e..d6e35cba3065 100644
> --- a/drivers/pinctrl/intel/pinctrl-baytrail.c
> +++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
> @@ -1372,13 +1372,13 @@ static void byt_irq_unmask(struct irq_data *d)
>  	switch (irqd_get_trigger_type(d)) {
>  	case IRQ_TYPE_LEVEL_HIGH:
>  		value |= BYT_TRIG_LVL;
> -		/* fall through */
> +		fallthrough;
>  	case IRQ_TYPE_EDGE_RISING:
>  		value |= BYT_TRIG_POS;
>  		break;
>  	case IRQ_TYPE_LEVEL_LOW:
>  		value |= BYT_TRIG_LVL;
> -		/* fall through */
> +		fallthrough;
>  	case IRQ_TYPE_EDGE_FALLING:
>  		value |= BYT_TRIG_NEG;
>  		break;
> -- 
> 2.27.0
> 

-- 
With Best Regards,
Andy Shevchenko


