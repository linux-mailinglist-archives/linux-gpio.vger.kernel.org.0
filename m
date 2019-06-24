Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4303507E8
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2019 12:13:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730040AbfFXKLw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Jun 2019 06:11:52 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:42609 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730103AbfFXKG2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Jun 2019 06:06:28 -0400
Received: from [192.168.1.110] ([77.4.138.202]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MirfI-1iB8Md1MgO-00er3h; Mon, 24 Jun 2019 12:05:43 +0200
Subject: Re: [PATCH] drivers: Adjust scope for CONFIG_HAS_IOMEM before
 devm_platform_ioremap_resource()
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Markus Elfring <Markus.Elfring@web.de>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Keerthy <j-keerthy@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
References: <20190221162627.3476-1-brgl@bgdev.pl>
 <9efcbce2-4d49-7197-a3d8-0e83850892d5@web.de>
 <CAMpxmJX-wXQ-ff1RWkPmJBWSsP_v2MjZrA3fhj3HQX0_zM0eZA@mail.gmail.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <39ae399a-c606-c6de-f84d-35e39d0410c0@metux.net>
Date:   Mon, 24 Jun 2019 12:05:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAMpxmJX-wXQ-ff1RWkPmJBWSsP_v2MjZrA3fhj3HQX0_zM0eZA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Y5KmhAuGYBWpz63kWCoOrWjQppi2GCM7nw4zwIl5goqEXlJ5BbX
 t8ubaYngOokp6Z8xrfJZdvOg8jSkCfYvjScNX1xaVigp3qfACw0j20K6xuf4CANZ46Nq9me
 q08dSj4GKou4/MPmMnT9912RJMpzT2PhiqIUQy8YOCHkkeHk9RA7GVcmp4d+Al1H+rYRXPs
 32V86gxzCU6XHurLGQZkA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:EhlFrXnRRgs=:/a8XyZ7CEl2MasOCthdPtj
 GHPmIV3VKUQE9+3JzxCKgOABObymqWS20d1W1RBSBjOszBrrtsH9gfXYJYPn76gflfz2vENlz
 f7yuhlrfbJvb/GmOQW0IF0Mio5exilcACOo3xQHJXqqHp2i5N1BXXYS7k5+XdcYDSCfPKS+ZU
 8pYNFguDUshvnjh2oUJ80YdL8blZUSa08lYuap5dZtqw4LAgNmuJmpzRltz/125xVxwPE8Ccl
 1Yd2YmZ2kfhnd1EmwVn6OeN3Fj/zeuXq+aJq3F0QHpUP+K5mPhlEs7h+RJwooknu04BCD+VsR
 nUr+BfT1xIWR/sTJJ4WgIJ64t1dTTangFgfUiadeSMwaEV6OvOaOpvR4JQ5h5+phkGo24n6LD
 QC+KNoTH/n4wDIHzqMyqX5Ev35mg9SvjSrIwoSmBx2aCHvX0tGazcolLApMyZx4Nmrx79iQiD
 uoOz6UVo0p5K2+W/qigonOACW2LdYozDvoaePPP/4F9CMdG/79hvp5Qjk02aSHpy+ki18VXH+
 CFLv6ygB+oMEAVxl4EvuffVb5WYkGHvkUjQMspnD7rc5mGFJllTXRsrLoB4h+8InP6OTM9w8l
 khKa6p00oEoCBymM8BKqFu0Zr+ZcHWEiXSpJUzLkoob77+hG+k3WltUeg0zOCcED/lLOJPKsf
 2BkRkkh3rMPoy3a/iusG2prGte2LUVNt5UBGA1Yr3ry2YBA2rsYbudm44rtCdPpzZgaU6K/h9
 D/eNKp1aT1PhRS9h7Kuoi1K+0coK98p/mkx00aFfY0souEtU/PI3+UTZ3QvcWfKkaIgS8MpQ3
 eLPWthYy3Xf2gooeBE1FiY5qhbOertn8d6oftV/J6aDRj0kTdaFsDmFZfHJNuGW4qQlnHAF
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 24.06.19 10:29, Bartosz Golaszewski wrote:
> pt., 14 cze 2019 o 18:50 Markus Elfring <Markus.Elfring@web.de> napisał(a):
>>
>> From: Markus Elfring <elfring@users.sourceforge.net>
>> Date: Fri, 14 Jun 2019 17:45:13 +0200
>>
>> Move the preprocessor statement “#ifdef CONFIG_HAS_IOMEM” so that
>> the corresponding scope for conditional compilation includes also comments
>> for this function implementation.
>>
>> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
>> ---
>>  drivers/base/platform.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/base/platform.c b/drivers/base/platform.c
>> index 4d1729853d1a..a5f40974a6ef 100644
>> --- a/drivers/base/platform.c
>> +++ b/drivers/base/platform.c
>> @@ -78,6 +78,7 @@ struct resource *platform_get_resource(struct platform_device *dev,
>>         return NULL;
>>  }
>>  EXPORT_SYMBOL_GPL(platform_get_resource);
>> +#ifdef CONFIG_HAS_IOMEM
>>
>>  /**
>>   * devm_platform_ioremap_resource - call devm_ioremap_resource() for a platform
>> @@ -87,7 +88,6 @@ EXPORT_SYMBOL_GPL(platform_get_resource);
>>   *        resource management
>>   * @index: resource index
>>   */
>> -#ifdef CONFIG_HAS_IOMEM
>>  void __iomem *devm_platform_ioremap_resource(struct platform_device *pdev,
>>                                              unsigned int index)
>>  {
>> --
>> 2.22.0
>>
> 
> And what is the purpose of that?

I can imagine that this could improve readability a little bit. Maybe if
one uses same fancy ide/editor that can fold code blocks like functions
and conditionals, this patch could make the code prettier.

The patch seems pretty trivial and doesn't change any actual code, so
I don't see hard resons for rejecting it.


--mtx


-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
