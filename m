Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18C9749C85
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2019 11:00:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728959AbfFRJAi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Jun 2019 05:00:38 -0400
Received: from mga18.intel.com ([134.134.136.126]:35905 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728889AbfFRJAh (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 18 Jun 2019 05:00:37 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Jun 2019 02:00:37 -0700
X-ExtLoop1: 1
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
  by orsmga005.jf.intel.com with ESMTP; 18 Jun 2019 02:00:33 -0700
Received: from andy by smile with local (Exim 4.92)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1hd9yh-0007Lx-Bm; Tue, 18 Jun 2019 12:00:31 +0300
Date:   Tue, 18 Jun 2019 12:00:31 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     linux-kernel@vger.kernel.org, thloh@altera.com,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, grygorii.strashko@ti.com,
        ssantosh@kernel.org, khilman@kernel.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-gpio@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-tegra@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH 07/30] drivers: gpio: msic: use subsys_platform_driver()
Message-ID: <20190618090031.GK9224@smile.fi.intel.com>
References: <1560796871-18560-1-git-send-email-info@metux.net>
 <1560796871-18560-7-git-send-email-info@metux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1560796871-18560-7-git-send-email-info@metux.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 17, 2019 at 08:40:48PM +0200, Enrico Weigelt, metux IT consult wrote:
> From: Enrico Weigelt <info@metux.net>
> 
> Reduce driver init boilerplate by using the new
> subsys_platform_driver() macro.

> --- a/drivers/gpio/gpio-msic.c
> +++ b/drivers/gpio/gpio-msic.c
> @@ -306,9 +306,4 @@ static int platform_msic_gpio_probe(struct platform_device *pdev)
>  	},
>  	.probe		= platform_msic_gpio_probe,
>  };
> -
> -static int __init platform_msic_gpio_init(void)
> -{
> -	return platform_driver_register(&platform_msic_gpio_driver);
> -}
> -subsys_initcall(platform_msic_gpio_init);
> +subsys_platform_driver(platform_msic_gpio_driver);

How did you test this? Had you even compiled it?

P.S. Perhaps it makes #include <linux/init.h> redundant.

-- 
With Best Regards,
Andy Shevchenko


