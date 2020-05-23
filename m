Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7071C1DF45B
	for <lists+linux-gpio@lfdr.de>; Sat, 23 May 2020 05:25:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387516AbgEWDZZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 May 2020 23:25:25 -0400
Received: from mail.loongson.cn ([114.242.206.163]:49774 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387509AbgEWDZY (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 22 May 2020 23:25:24 -0400
Received: from [10.130.0.52] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxH95+l8hejRE4AA--.282S3;
        Sat, 23 May 2020 11:24:48 +0800 (CST)
Subject: Re: [PATCH 2/3] gpio: pxa: Fix return value of pxa_gpio_probe()
To:     Robert Jarzmik <robert.jarzmik@free.fr>
References: <1590120740-22912-1-git-send-email-yangtiezhu@loongson.cn>
 <1590120740-22912-2-git-send-email-yangtiezhu@loongson.cn>
 <874ks7okk4.fsf@belgarion.home>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Ray Jui <rjui@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <3382c1df-1429-ecd3-70b6-35bc00343608@loongson.cn>
Date:   Sat, 23 May 2020 11:24:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <874ks7okk4.fsf@belgarion.home>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9DxH95+l8hejRE4AA--.282S3
X-Coremail-Antispam: 1UD129KBjvJXoW7uw4kCr47Jw18Gr45Xw1kXwb_yoW8uw45pr
        WkWFWF9r15GF12ga9FyanrCFs3A3W7t3yYkr48X3Zaq3WDJrW7Ar48CFWj9ryrCFW8tw10
        qr4fCry8Aa4kZF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUv014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
        1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
        7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r
        1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE
        67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
        AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCI
        c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267
        AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_
        Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUb
        0D73UUUUU==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 05/23/2020 03:07 AM, Robert Jarzmik wrote:
> Tiezhu Yang <yangtiezhu@loongson.cn> writes:
>
>> When call function devm_platform_ioremap_resource(), we should use IS_ERR()
>> to check the return value and return PTR_ERR() if failed.
>>
>> Fixes: 542c25b7a209 ("drivers: gpio: pxa: use devm_platform_ioremap_resource()")
>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>> ---
>>   drivers/gpio/gpio-pxa.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
>> index 1361270..0cb6600 100644
>> --- a/drivers/gpio/gpio-pxa.c
>> +++ b/drivers/gpio/gpio-pxa.c
>> @@ -660,8 +660,8 @@ static int pxa_gpio_probe(struct platform_device *pdev)
>>   	pchip->irq1 = irq1;
>>   
>>   	gpio_reg_base = devm_platform_ioremap_resource(pdev, 0);
>> -	if (!gpio_reg_base)
>> -		return -EINVAL;
>> +	if (IS_ERR(gpio_reg_base))
>> +		return PTR_ERR(gpio_reg_base);
> As far as I know, devm_platform_ioremap_resource() could return NULL which is
> not handled by this test (unless __devm_ioremap() semantics changed since I had
> a look).

Hi Robert,

In the function __devm_ioremap_resource(), if __devm_ioremap returns NULL,
it will return IOMEM_ERR_PTR(-ENOMEM).

devm_platform_ioremap_resource()
         devm_ioremap_resource()
                 __devm_ioremap_resource()
                        __devm_ioremap()

static void __iomem *
__devm_ioremap_resource(struct device *dev, const struct resource *res,
             enum devm_ioremap_type type)
{
...
     dest_ptr = __devm_ioremap(dev, res->start, size, type);
     if (!dest_ptr) {
         dev_err(dev, "ioremap failed for resource %pR\n", res);
         devm_release_mem_region(dev, res->start, size);
         dest_ptr = IOMEM_ERR_PTR(-ENOMEM);
     }

     return dest_ptr;
}

And also, we can see the comment of devm_ioremap_resource():

Usage example:

         res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
         base = devm_ioremap_resource(&pdev->dev, res);
         if (IS_ERR(base))
                 return PTR_ERR(base);

>
> Therefore, this patch is incorrect, or rather incomplete.

So I think this patch is correct, do I miss something?

Thanks,
Tiezhu Yang

>
> Cheers.
>

