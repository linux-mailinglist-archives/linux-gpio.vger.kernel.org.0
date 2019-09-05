Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FDF4A9836
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2019 04:04:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730741AbfIECEf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Sep 2019 22:04:35 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:34622 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730730AbfIECEf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 4 Sep 2019 22:04:35 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id AB9F98287DF39B640022;
        Thu,  5 Sep 2019 10:04:33 +0800 (CST)
Received: from [127.0.0.1] (10.133.213.239) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.439.0; Thu, 5 Sep 2019
 10:04:28 +0800
Subject: Re: [PATCH] gpio: Move gpiochip_.*lock_as_irq() to the proper ifdef
To:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>
References: <20190822031817.32888-1-yuehaibing@huawei.com>
 <CACRpkdapgDbkm3JjywtPv=5gYKQCCXzdabDumVukFv5Dn5pomA@mail.gmail.com>
 <20190904154631.kjegnsk6cf473nr6@flow>
CC:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alexandre Courbot <acourbot@nvidia.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>
From:   Yuehaibing <yuehaibing@huawei.com>
Message-ID: <23aeaa05-3a59-5f01-7a67-de1d1d1de547@huawei.com>
Date:   Thu, 5 Sep 2019 10:04:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20190904154631.kjegnsk6cf473nr6@flow>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2019/9/4 23:46, Sebastian Andrzej Siewior wrote:
> In a recent commit the gpiochip_.*lock_as_irq() were moved and ended up
> in the wrong `ifdef' section. Now for !CONFIG_GPIOLIB the function is
> defined twice leading to an compile error.
> 
> Move the extern function declaration under CONFIG_GPIOLIB, the "static
> inline" version is already under !CONFIG_GPIOLIB.
> 
> Fixes: c7663fa2a6631 ("gpio: Move gpiochip_lock/unlock_as_irq to gpio/driver.h")
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>  include/linux/gpio/driver.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
> index b74a3bee85e5d..fb134ff20f6b2 100644
> --- a/include/linux/gpio/driver.h
> +++ b/include/linux/gpio/driver.h
> @@ -702,14 +702,14 @@ void gpiochip_free_own_desc(struct gpio_desc *desc);
>  void devprop_gpiochip_set_names(struct gpio_chip *chip,
>  				const struct fwnode_handle *fwnode);
>  
> -/* lock/unlock as IRQ */
> -int gpiochip_lock_as_irq(struct gpio_chip *chip, unsigned int offset);
> -void gpiochip_unlock_as_irq(struct gpio_chip *chip, unsigned int offset);
> -
>  #ifdef CONFIG_GPIOLIB
>  
>  struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc);
>  
> +/* lock/unlock as IRQ */
> +int gpiochip_lock_as_irq(struct gpio_chip *chip, unsigned int offset);
> +void gpiochip_unlock_as_irq(struct gpio_chip *chip, unsigned int offset);
> +
>  #else /* CONFIG_GPIOLIB */

Interesting, my patch indeed do the correct thing：

+/* lock/unlock as IRQ */
+int gpiochip_lock_as_irq(struct gpio_chip *chip, unsigned int offset);
+void gpiochip_unlock_as_irq(struct gpio_chip *chip, unsigned int offset);
+
 #else /* CONFIG_GPIOLIB */

however, now in include/linux/gpio/driver.h, it is:

/* lock/unlock as IRQ */
int gpiochip_lock_as_irq(struct gpio_chip *chip, unsigned int offset);
void gpiochip_unlock_as_irq(struct gpio_chip *chip, unsigned int offset);

#ifdef CONFIG_GPIOLIB

struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc);

#else /* CONFIG_GPIOLIB */


Maybe this caused by the fuzzing?  Anyway, this fix the issue, so

Reviewed-by: YueHaibing <yuehaibing@huawei.com>

>  
>  static inline struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc)
> 

