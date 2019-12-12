Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9454E11C917
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2019 10:28:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728201AbfLLJ2H (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Dec 2019 04:28:07 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:7225 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726382AbfLLJ2G (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Dec 2019 04:28:06 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 8C59AC99D520A805682B;
        Thu, 12 Dec 2019 17:28:04 +0800 (CST)
Received: from [127.0.0.1] (10.177.131.64) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.439.0; Thu, 12 Dec 2019
 17:27:53 +0800
Subject: Re: [PATCH -next] pinctrl: samsung: fix build error without
 CONFIG_OF_GPIO
To:     <tomasz.figa@gmail.com>, <krzk@kernel.org>,
        <s.nawrocki@samsung.com>
References: <20191212092136.37870-1-chenzhou10@huawei.com>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Hulk Robot <hulkci@huawei.com>
From:   Chen Zhou <chenzhou10@huawei.com>
Message-ID: <407d0a27-187e-7339-197c-15261e79122a@huawei.com>
Date:   Thu, 12 Dec 2019 17:27:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20191212092136.37870-1-chenzhou10@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.131.64]
X-CFilter-Loop: Reflected
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

ignore this patch, i will repost it.

On 2019/12/12 17:21, Chen Zhou wrote:
> If CONFIG_OF_GPIO is n, build fails:
> 
> drivers/pinctrl/samsung/pinctrl-samsung.c: In function samsung_gpiolib_register:
> drivers/pinctrl/samsung/pinctrl-samsung.c:969:5: error: struct gpio_chip has no member named of_node
>    gc->of_node = bank->of_node;
> 
> Use #ifdef to guard this.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>Fixes
> Signed-off-by: Chen Zhou <chenzhou10@huawei.com>
> ---
>  drivers/pinctrl/samsung/pinctrl-samsung.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
> index f26574e..5c29ad8 100644
> --- a/drivers/pinctrl/samsung/pinctrl-samsung.c
> +++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
> @@ -966,7 +966,9 @@ static int samsung_gpiolib_register(struct platform_device *pdev,
>  		gc->base = bank->grange.base;
>  		gc->ngpio = bank->nr_pins;
>  		gc->parent = &pdev->dev;
> +#ifdef CONFIG_OF_GPIO
>  		gc->of_node = bank->of_node;
> +#endif
>  		gc->label = bank->name;
>  
>  		ret = devm_gpiochip_add_data(&pdev->dev, gc, bank);
> 

