Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9866D4589
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2019 18:37:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728400AbfJKQhw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Oct 2019 12:37:52 -0400
Received: from mailfilter01-out31.webhostingserver.nl ([141.138.168.60]:21492
        "EHLO mailfilter01-out31.webhostingserver.nl" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726331AbfJKQhv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 11 Oct 2019 12:37:51 -0400
X-Greylist: delayed 962 seconds by postgrey-1.27 at vger.kernel.org; Fri, 11 Oct 2019 12:37:50 EDT
X-Halon-ID: b3304960-ec3f-11e9-a6f1-001a4a4cb906
Received: from s198.webhostingserver.nl (unknown [141.138.168.154])
        by mailfilter01.webhostingserver.nl (Halon) with ESMTPSA
        id b3304960-ec3f-11e9-a6f1-001a4a4cb906;
        Fri, 11 Oct 2019 15:56:34 +0000 (UTC)
Received: from cust-178-250-146-69.breedbanddelft.nl ([178.250.146.69] helo=[10.8.0.10])
        by s198.webhostingserver.nl with esmtpa (Exim 4.92.3)
        (envelope-from <fntoth@gmail.com>)
        id 1iIxfh-002wak-T6; Fri, 11 Oct 2019 18:21:41 +0200
Subject: Re: [PATCH 1/5] gpio: merrifield: Restore use of irq_base
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux GPIO <linux-gpio@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20191009165056.76580-1-andriy.shevchenko@linux.intel.com>
 <20191009165056.76580-2-andriy.shevchenko@linux.intel.com>
From:   Ferry Toth <fntoth@gmail.com>
Message-ID: <667bb867-2ec5-c8a5-670c-6221766e84cc@gmail.com>
Date:   Fri, 11 Oct 2019 18:21:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191009165056.76580-2-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SendingUser: hidden
X-SendingServer: hidden
X-Antivirus-Scanner: Clean mail though you should still use an Antivirus
X-Authenticated-Id: hidden
X-SendingUser: hidden
X-SendingServer: hidden
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Op 09-10-19 om 18:50 schreef Andy Shevchenko:
> During conversion to internal IRQ chip initialization the commit
>    8f86a5b4ad67 ("gpio: merrifield: Pass irqchip when adding gpiochip")
> lost the irq_base assignment.
> 
> drivers/gpio/gpio-merrifield.c: In function ‘mrfld_gpio_probe’:
> drivers/gpio/gpio-merrifield.c:405:17: warning: variable ‘irq_base’ set but not used [-Wunused-but-set-variable]
> 
> Assign the girq->first to it.
> 
> Fixes: 8f86a5b4ad67 ("gpio: merrifield: Pass irqchip when adding gpiochip")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Fixes boot when applied 5.4-rc2

Tested-by: Ferry Toth <fntoth@gmail.com>
> ---
>   drivers/gpio/gpio-merrifield.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpio/gpio-merrifield.c b/drivers/gpio/gpio-merrifield.c
> index 4f27ddfe1e2f..9596024c9161 100644
> --- a/drivers/gpio/gpio-merrifield.c
> +++ b/drivers/gpio/gpio-merrifield.c
> @@ -455,6 +455,7 @@ static int mrfld_gpio_probe(struct pci_dev *pdev, const struct pci_device_id *id
>   	if (!girq->parents)
>   		return -ENOMEM;
>   	girq->parents[0] = pdev->irq;
> +	girq->first = irq_base;
>   	girq->default_type = IRQ_TYPE_NONE;
>   	girq->handler = handle_bad_irq;
>   
> 

