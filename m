Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B49610D37C
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Nov 2019 10:53:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726586AbfK2Jxv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Nov 2019 04:53:51 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:56492 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726143AbfK2Jxv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 29 Nov 2019 04:53:51 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id CEADC3B93D162864AE52;
        Fri, 29 Nov 2019 17:53:47 +0800 (CST)
Received: from [127.0.0.1] (10.133.213.239) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.439.0; Fri, 29 Nov 2019
 17:53:44 +0800
Subject: Re: [PATCH -next] gpiolib: of: Make of_gpio_spi_cs_get_count static
To:     Linus Walleij <linus.walleij@linaro.org>,
        Mark Brown <broonie@kernel.org>
References: <20191129085336.15968-1-yuehaibing@huawei.com>
 <CACRpkdbeKdEAEtoPZH8+fWcZEOqJ6cdGTRSkrKx8L9avxnPQQg@mail.gmail.com>
CC:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From:   Yuehaibing <yuehaibing@huawei.com>
Message-ID: <c2b68250-f393-16ee-1b9e-20bf6808ac69@huawei.com>
Date:   Fri, 29 Nov 2019 17:53:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdbeKdEAEtoPZH8+fWcZEOqJ6cdGTRSkrKx8L9avxnPQQg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2019/11/29 17:46, Linus Walleij wrote:
> On Fri, Nov 29, 2019 at 9:53 AM YueHaibing <yuehaibing@huawei.com> wrote:
> 
>> Fix sparse warning:
>>
>> drivers/gpio/gpiolib-of.c:35:5: warning: symbol 'of_gpio_spi_cs_get_count' was not declared. Should it be static?
>>
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Mark merged my patch causing this warning into the SPI tree,
> would you mind resending it to him including my Reviewed-by tag
> and a note to apply it to the SPI tree?

Ok, will resend it.
> 
> Yours,
> Linus Walleij
> 
> 

