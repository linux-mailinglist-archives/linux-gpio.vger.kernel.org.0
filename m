Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F87839CA62
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Jun 2021 20:00:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230049AbhFESCD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Jun 2021 14:02:03 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:33692 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230010AbhFESCA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Jun 2021 14:02:00 -0400
X-Greylist: delayed 375 seconds by postgrey-1.27 at vger.kernel.org; Sat, 05 Jun 2021 14:01:59 EDT
Date:   Sat, 5 Jun 2021 20:53:51 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v1 1/1] gpio-dwapb: Drop unused headers and sort the rest
Message-ID: <20210605175351.hv7m4fzegq4oxlpc@mobilestation>
References: <20210604185013.86662-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210604185013.86662-1-andriy.shevchenko@linux.intel.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 04, 2021 at 09:50:13PM +0300, Andy Shevchenko wrote:
> Drop unused headers and drop the rest.

Thanks for cleanup.
Acked-by: Serge Semin <fancer.lancer@gmail.com>
Tested-by: Serge Semin <fancer.lancer@gmail.com>

-Sergey

> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpio-dwapb.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index 7d61f5821e32..3eb13d6d31ef 100644
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -13,17 +13,15 @@
>  #include <linux/io.h>
>  #include <linux/ioport.h>
>  #include <linux/irq.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> -#include <linux/of_address.h>
> -#include <linux/of_device.h>
> -#include <linux/of_irq.h>
> +#include <linux/platform_data/gpio-dwapb.h>
>  #include <linux/platform_device.h>
>  #include <linux/property.h>
>  #include <linux/reset.h>
> -#include <linux/spinlock.h>
> -#include <linux/platform_data/gpio-dwapb.h>
>  #include <linux/slab.h>
> +#include <linux/spinlock.h>
>  
>  #include "gpiolib.h"
>  #include "gpiolib-acpi.h"
> -- 
> 2.30.2
> 
