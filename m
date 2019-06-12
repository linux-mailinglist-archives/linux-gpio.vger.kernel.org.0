Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70044425EB
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2019 14:33:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438948AbfFLMdM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Jun 2019 08:33:12 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:40859 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439038AbfFLMdM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Jun 2019 08:33:12 -0400
Received: from [192.168.1.110] ([95.115.5.111]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1M4384-1hb2Qz2CzQ-0006Zk; Wed, 12 Jun 2019 14:32:57 +0200
Subject: Re: [PATCH V1 1/2] gpio: inverter: Add virtual controller for gpio
 configuration
To:     Phil Reid <preid@electromag.com.au>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio@vger.kernel.org,
        Balasubramani Vivekanandan 
        <balasubramani_vivekanandan@mentor.com>
References: <1560315034-29712-1-git-send-email-harish_kandiga@mentor.com>
 <1560315034-29712-2-git-send-email-harish_kandiga@mentor.com>
 <09bd2a7d-3da5-3158-0fae-d80c4d3e9998@electromag.com.au>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <9a9a7fc5-022d-340b-1bc1-c3e050f05b7e@metux.net>
Date:   Wed, 12 Jun 2019 14:32:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <09bd2a7d-3da5-3158-0fae-d80c4d3e9998@electromag.com.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:smQWdNmH5DLF6D3xSsBXb9gf3WoHkptIYEQg2W151IelIKVFeGA
 LVOVcla9mIfe9LsxnXGnnLeo7tqOormgrop+Fu0GBisEXZj1V9e2DyuhfqE8cJlYJzLbJtX
 o9QvutAis0JnhfYrm4hcuxra+UTCsCuq9iNSoDWEyTd5VYfcsS1tefG1LPpx2eCDOaoDm7w
 PGvhhzij+GfZDkqge/gRg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:JHHEIPHOVvk=:748DW8/oNPS2MkWETogf3N
 Nn0zmYqsPdeDI88+mxCcnHbEsENoYHLNXSTNkZL62HvIzxKeCk+7LlSy1Lzk/Cy79i7fBcuTC
 Poou+i6Q7l7GHL6uRrxjoqYjUGfosySrOx1bQe5PLO0vwkhWyo3+Pzvbb4ssBCzNCp3UEoNkU
 NJy1NeKabfSCste5I+ZcyVelisBah2Yqe23KhTy1Sjg/mtmtFjQAB38i9ZxOPqS4ma9zKEHoB
 lponba/ThH+TmLBS4dTKt7FdMx3hyXQ19hSa1IfjdtDeHrAdbDt/ZPcaTgPdtAPWzMAVF3Um3
 UA6ndSb+FhzT2Wjw9f8WGqWTRiC4F6XVq3ZQuFMtloNIdQDpdfcXHE/5HgU1p56EJTajEkjGB
 SHTx8+XL5YNK4Jx1LgGIG6jehF6+Uk/Fhmoq1uJFtj2+zNrbypWy1Hy5ya3h8QdXxqwIY/Cr2
 jyQGGmICQRkHzycvisfK5q0w0rGWFGFaeICFHQzEEknzlifsZKccXCbCCQvaJs2WBNrvYiZAI
 CmbUaoVsiQZn3JkRcYRG60UWSkRR5xP69SqWHi5Xj8vUmy0s1Xw8lC06wXWjUO9fNV0bnnrUw
 mVyL1C8cHWgMBXhgGpNdYqIwD1gOLvftDqpPwOOz/6dfjGv30N8/OVXeiV58C/pFEEiRVWNza
 o4xWEue4SOeiDISfVtwAyY8UJe9pCvmpgxm1RFmXXtnCEOHdnnKZgMr32bD7GNxX6gxMMpYG0
 VAF2yAUsbt0Jeiqf8eQq8lrTonUApXR37zmJ/aD0IZeVM37U9r0LriKYCKuga4aIcpIlm9Oj3
 aZPVqQI
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 12.06.19 08:27, Phil Reid wrote:

Hi,

>> +#include <linux/gpio.h>
> This is a legacy header.
> You probably want to include <linux/gpio/driver.h>

Just counted 754 cases of such includes, 289 in arch, 345 in drivers.

Shall them be replaced ? Or is the new include only meant for gpio
*drivers* ?

>> +    size = sizeof(*virt) + count * sizeof(struct gpio_desc *);
>> +    virt = devm_kzalloc(dev, size, GFP_KERNEL);
> there's a helper now: size struct_size(virt, gpios, count), eg:
>     virt = devm_kzalloc(dev, struct_size(virt, gpios, count), GFP_KERNEL);

Didn't we also have a macro for allocating structs ?
(IIRC there at was least one for struct arrays)

>> +static int __init gpio_inverter_init(void)
>> +{
>> +    return platform_driver_register(&gpio_inverter_driver);
>> +}
>> +late_initcall(gpio_inverter_init);
>> +
>> +static void __exit gpio_inverter_exit(void)
>> +{
>> +    platform_driver_unregister(&gpio_inverter_driver);
>> +}

IMHO, we should introduce a macro for that, similar to
module_i2c_driver()+friends.


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
