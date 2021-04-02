Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CF06352D8F
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Apr 2021 18:11:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234516AbhDBQLn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Apr 2021 12:11:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229605AbhDBQLm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Apr 2021 12:11:42 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45EC3C0613E6;
        Fri,  2 Apr 2021 09:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=Np2JCwfDCdo/ra8gFfhhpsJDI0A0gGoHyahJ9Xf1jxU=; b=BkBTNKrMj0VOK8BWlcfjicpB1B
        zTWNurmyc+F8WctnN09Qh06JS7/QzwxgALtYkOCZPMy917M0g8tW/x0ZMJ8dM1iNecM4O/ksuXxQS
        v6VWMZnlGbF5GDLEa0Vz/OyGIjMP38Pfn0r1/y5YlSaGjvADSEwuU+H3AAsCYuAn9ZMcSGuCWY2iP
        eA/3W47wEF4k9fGifoxZ5YVVh4yha4oV9IbP8zR145Tdv4w9YVWA9dBMa9eRwgP5aw8VHqBHvEN/D
        GKs9vogWKD3KJxXvwgyR8lACPsSRe4rw5tor+OsTZCYl1Tv5nCO/6DKn69dJgJvJuvlRH5LRp4a5M
        fYYnjouQ==;
Received: from [2601:1c0:6280:3f0::e0e1]
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lSMOF-007qgY-ES; Fri, 02 Apr 2021 16:11:22 +0000
Subject: Re: [PATCH -next] gpio: GPIO_SCH: depends on PCI same as LPC_SCH
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Denis Turischev <denis@compulab.co.il>
References: <20210402002124.17207-1-rdunlap@infradead.org>
 <CAHp75VfqFde+uBHfYe5tZDgwcy3z_yME6MmQea5rydVOfFVkhQ@mail.gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <72016dea-515d-e254-cda5-adc097635e19@infradead.org>
Date:   Fri, 2 Apr 2021 09:11:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VfqFde+uBHfYe5tZDgwcy3z_yME6MmQea5rydVOfFVkhQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 4/2/21 2:00 AM, Andy Shevchenko wrote:
> On Friday, April 2, 2021, Randy Dunlap <rdunlap@infradead.org> wrote:
> 
>> Since LPC_SCH depends on PCI, GPIO_SCH must also depend on PCI
>> to prevent kconfig warning and build errors:
>>
>> WARNING: unmet direct dependencies detected for LPC_SCH
>>   Depends on [n]: HAS_IOMEM [=y] && PCI [=n]
>>   Selected by [y]:
>>   - GPIO_SCH [=y] && GPIOLIB [=y] && X86 [=y] && (X86 [=y] || COMPILE_TEST
>> [=n]) && ACPI [=y]
>>
>> and
>>
>> ../drivers/mfd/lpc_sch.c:204:1: warning: data definition has no type or
>> storage class
>>  module_pci_driver(lpc_sch_driver);
>>  ^~~~~~~~~~~~~~~~~
>> ../drivers/mfd/lpc_sch.c:204:1: error: type defaults to ‘int’ in
>> declaration of ‘module_pci_driver’ [-Werror=implicit-int]
>> ../drivers/mfd/lpc_sch.c:204:1: warning: parameter names (without types)
>> in function declaration
>> ../drivers/mfd/lpc_sch.c:197:26: warning: ‘lpc_sch_driver’ defined but
>> not used [-Wunused-variable]
>>  static struct pci_driver lpc_sch_driver = {
>>                           ^~~~~~~~~~~~~~
>>
>>
> Thanks for catching this!
> But I am wondering if this actually should be fixed by switching to depends
> on LPC_SCH. What do you think?
> 

Sounds good to me. I'll send v2 like that.
Thanks.

> 
> 
>> Fixes: 6c46215d6b62 ("gpio: sch: Hook into ACPI GPE handler to catch GPIO
>> edge events")
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>> Cc: linux-gpio@vger.kernel.org
>> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>> Cc: Denis Turischev <denis@compulab.co.il>
>> ---
>>  drivers/gpio/Kconfig |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> --- linux-next-20210401.orig/drivers/gpio/Kconfig
>> +++ linux-next-20210401/drivers/gpio/Kconfig
>> @@ -860,7 +860,7 @@ config GPIO_IT87
>>
>>  config GPIO_SCH
>>         tristate "Intel SCH/TunnelCreek/Centerton/Quark X1000 GPIO"
>> -       depends on (X86 || COMPILE_TEST) && ACPI
>> +       depends on (X86 || COMPILE_TEST) && ACPI && PCI
>>         select GPIOLIB_IRQCHIP
>>         select MFD_CORE
>>         select LPC_SCH
>>
> 
> 


-- 
~Randy

