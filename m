Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FC7C7C0C4
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2019 14:09:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726853AbfGaMJe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Jul 2019 08:09:34 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:3671 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725793AbfGaMJd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 31 Jul 2019 08:09:33 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id CD03E15202C67FF2B54E;
        Wed, 31 Jul 2019 20:09:30 +0800 (CST)
Received: from [127.0.0.1] (10.133.213.239) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.439.0; Wed, 31 Jul 2019
 20:09:26 +0800
Subject: Re: [PATCH] gpio: remove duplicated function definition
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <yamada.masahiro@socionext.com>
References: <20190731100028.48884-1-yuehaibing@huawei.com>
CC:     <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
From:   Yuehaibing <yuehaibing@huawei.com>
Message-ID: <1ce6b018-fca4-7b5e-7ddf-e55be9cdb221@huawei.com>
Date:   Wed, 31 Jul 2019 20:09:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20190731100028.48884-1-yuehaibing@huawei.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Pls drop this

On 2019/7/31 18:00, YueHaibing wrote:
> when building without CONFIG_PINCTRL:
> 
> In file included from drivers/hwmon/pmbus/ucd9000.c:19:0:
> ./include/linux/gpio/driver.h:576:1: error: redefinition of gpiochip_add_pin_range
>  gpiochip_add_pin_range(struct gpio_chip *chip, const char *pinctl_name,
>  ^~~~~~~~~~~~~~~~~~~~~~
> In file included from drivers/hwmon/pmbus/ucd9000.c:18:0:
> ./include/linux/gpio.h:245:1: note: previous definition of gpiochip_add_pin_range was here
>  gpiochip_add_pin_range(struct gpio_chip *chip, const char *pinctl_name,
>  ^~~~~~~~~~~~~~~~~~~~~~
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Fixes: 964cb341882f ("gpio: move pincontrol calls to <linux/gpio/driver.h>")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  include/linux/gpio/driver.h | 35 +----------------------------------
>  1 file changed, 1 insertion(+), 34 deletions(-)
> 
> diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
> index f28f534..09f96ec 100644
> --- a/include/linux/gpio/driver.h
> +++ b/include/linux/gpio/driver.h
> @@ -10,6 +10,7 @@
>  #include <linux/lockdep.h>
>  #include <linux/pinctrl/pinctrl.h>
>  #include <linux/pinctrl/pinconf-generic.h>
> +#include <linux/gpio.h>
>  
>  struct gpio_desc;
>  struct of_phandle_args;
> @@ -560,40 +561,6 @@ struct gpio_pin_range {
>  	struct pinctrl_gpio_range range;
>  };
>  
> -#ifdef CONFIG_PINCTRL
> -
> -int gpiochip_add_pin_range(struct gpio_chip *chip, const char *pinctl_name,
> -			   unsigned int gpio_offset, unsigned int pin_offset,
> -			   unsigned int npins);
> -int gpiochip_add_pingroup_range(struct gpio_chip *chip,
> -			struct pinctrl_dev *pctldev,
> -			unsigned int gpio_offset, const char *pin_group);
> -void gpiochip_remove_pin_ranges(struct gpio_chip *chip);
> -
> -#else /* ! CONFIG_PINCTRL */
> -
> -static inline int
> -gpiochip_add_pin_range(struct gpio_chip *chip, const char *pinctl_name,
> -		       unsigned int gpio_offset, unsigned int pin_offset,
> -		       unsigned int npins)
> -{
> -	return 0;
> -}
> -static inline int
> -gpiochip_add_pingroup_range(struct gpio_chip *chip,
> -			struct pinctrl_dev *pctldev,
> -			unsigned int gpio_offset, const char *pin_group)
> -{
> -	return 0;
> -}
> -
> -static inline void
> -gpiochip_remove_pin_ranges(struct gpio_chip *chip)
> -{
> -}
> -
> -#endif /* CONFIG_PINCTRL */
> -
>  struct gpio_desc *gpiochip_request_own_desc(struct gpio_chip *chip, u16 hwnum,
>  					    const char *label,
>  					    enum gpio_lookup_flags lflags,
> 

