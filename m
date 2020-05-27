Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5205E1E4D16
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2020 20:26:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389304AbgE0S0l (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 May 2020 14:26:41 -0400
Received: from smtp06.smtpout.orange.fr ([80.12.242.128]:20290 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388887AbgE0S0l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 May 2020 14:26:41 -0400
Received: from belgarion ([86.210.245.36])
        by mwinf5d11 with ME
        id juSb220020nqnCN03uSbp8; Wed, 27 May 2020 20:26:39 +0200
X-ME-Helo: belgarion
X-ME-Auth: amFyem1pay5yb2JlcnRAb3JhbmdlLmZy
X-ME-Date: Wed, 27 May 2020 20:26:39 +0200
X-ME-IP: 86.210.245.36
From:   Robert Jarzmik <robert.jarzmik@free.fr>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Ray Jui <rjui@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH 2/3] gpio: pxa: Fix return value of pxa_gpio_probe()
References: <1590120740-22912-1-git-send-email-yangtiezhu@loongson.cn>
        <1590120740-22912-2-git-send-email-yangtiezhu@loongson.cn>
        <874ks7okk4.fsf@belgarion.home>
        <3382c1df-1429-ecd3-70b6-35bc00343608@loongson.cn>
X-URL:  http://belgarath.falguerolles.org/
Date:   Wed, 27 May 2020 20:26:07 +0200
In-Reply-To: <3382c1df-1429-ecd3-70b6-35bc00343608@loongson.cn> (Tiezhu Yang's
        message of "Sat, 23 May 2020 11:24:46 +0800")
Message-ID: <87zh9tmdz4.fsf@belgarion.home>
User-Agent: Gnus/5.130008 (Ma Gnus v0.8) Emacs/26 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Tiezhu Yang <yangtiezhu@loongson.cn> writes:

> On 05/23/2020 03:07 AM, Robert Jarzmik wrote:
>> Tiezhu Yang <yangtiezhu@loongson.cn> writes:
>>
>>> When call function devm_platform_ioremap_resource(), we should use IS_ERR()
>>> to check the return value and return PTR_ERR() if failed.
>>>
>>> Fixes: 542c25b7a209 ("drivers: gpio: pxa: use devm_platform_ioremap_resource()")
>>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>>> ---
>>>   drivers/gpio/gpio-pxa.c | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
>>> index 1361270..0cb6600 100644
>>> --- a/drivers/gpio/gpio-pxa.c
>>> +++ b/drivers/gpio/gpio-pxa.c
>>> @@ -660,8 +660,8 @@ static int pxa_gpio_probe(struct platform_device *pdev)
>>>   	pchip->irq1 = irq1;
>>>     	gpio_reg_base = devm_platform_ioremap_resource(pdev, 0);
>>> -	if (!gpio_reg_base)
>>> -		return -EINVAL;
>>> +	if (IS_ERR(gpio_reg_base))
>>> +		return PTR_ERR(gpio_reg_base);
>> As far as I know, devm_platform_ioremap_resource() could return NULL which is
>> not handled by this test (unless __devm_ioremap() semantics changed since I had
>> a look).
>
> Hi Robert,
>
> In the function __devm_ioremap_resource(), if __devm_ioremap returns NULL,
> it will return IOMEM_ERR_PTR(-ENOMEM).
>
> devm_platform_ioremap_resource()
>         devm_ioremap_resource()
>                 __devm_ioremap_resource()
>                        __devm_ioremap()
>
> static void __iomem *
> __devm_ioremap_resource(struct device *dev, const struct resource *res,
>             enum devm_ioremap_type type)
> {
> ...
>     dest_ptr = __devm_ioremap(dev, res->start, size, type);
>     if (!dest_ptr) {
>         dev_err(dev, "ioremap failed for resource %pR\n", res);
>         devm_release_mem_region(dev, res->start, size);
>         dest_ptr = IOMEM_ERR_PTR(-ENOMEM);
>     }
>
>     return dest_ptr;
> }
>
> And also, we can see the comment of devm_ioremap_resource():
>
> Usage example:
>
>         res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>         base = devm_ioremap_resource(&pdev->dev, res);
>         if (IS_ERR(base))
>                 return PTR_ERR(base);
>
>>
>> Therefore, this patch is incorrect, or rather incomplete.
>
> So I think this patch is correct, do I miss something?
You're right, my bad, didn't see the test in __devm_ioremap_resource().

Cheers.

-- 
Robert
