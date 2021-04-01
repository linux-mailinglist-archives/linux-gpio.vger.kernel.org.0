Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2968351F0C
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Apr 2021 20:56:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237321AbhDASw2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Apr 2021 14:52:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235029AbhDASr3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Apr 2021 14:47:29 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D227DC0A88A8
        for <linux-gpio@vger.kernel.org>; Thu,  1 Apr 2021 10:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=cFSwgPDIn6gpd6EHox7yo63hyR5Fm/mdHj5Yr7NFgtY=; b=blkbeOkN1B3sV+wCawaaWlMGQP
        +DIDIrvqHzFkz1Vi1WEkAoRgJkwD3K32IoHKOM3kcLOJFr7uvLSQo1QQI9ofW+xfZ46nEJwfDN9mP
        sDwLVlXKKztwpqLQzzB7GbLMww1kbaaSAsPKZE9uDv/d0vX0oqolPBCgudaiSlARFSJnS87GXRMBO
        aYBb3WsZYcPpthpqllVGHQaV+4czJeIDg8pcB/Ht7iWX7uYVV2CU9WrhcqtZJpvFcBli35eYEWICW
        0CRSVpqS+dndXSyWJvWRgEU3rC0twEYBBy8xJqa3zrCEBx99MU8LVa7RZve2j8XtCPMV0n7hG6KeH
        j0MiYX/w==;
Received: from [2601:1c0:6280:3f0::e0e1]
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lS1PN-006RJp-Oz; Thu, 01 Apr 2021 17:47:20 +0000
Subject: [PATCH] pinctrl: bcm63xx: Fix More dependencies
From:   Randy Dunlap <rdunlap@infradead.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Cc:     =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>
References: <20210331124733.2059013-1-linus.walleij@linaro.org>
 <1a2033f5-dff4-ef2f-82c4-26c1f2fbd785@infradead.org>
Message-ID: <9e1cec76-1c0a-9203-7995-4c2d09b711d8@infradead.org>
Date:   Thu, 1 Apr 2021 10:47:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <1a2033f5-dff4-ef2f-82c4-26c1f2fbd785@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 3/31/21 11:48 AM, Randy Dunlap wrote:
> On 3/31/21 5:47 AM, Linus Walleij wrote:
>> Add depends on OF so we don't get weird build errors on
>> randconfig.
>>
>> Also order selects the same as the other drivers for
>> pure aestetic reasons.
>>
>> Reported-by: Randy Dunlap <rdunlap@infradead.org>
>> Cc: Álvaro Fernández Rojas <noltari@gmail.com>
>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>> ---
>>  drivers/pinctrl/bcm/Kconfig | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/pinctrl/bcm/Kconfig b/drivers/pinctrl/bcm/Kconfig
>> index 33660e8fec05..17615674ac1a 100644
>> --- a/drivers/pinctrl/bcm/Kconfig
>> +++ b/drivers/pinctrl/bcm/Kconfig
>> @@ -31,10 +31,12 @@ config PINCTRL_BCM2835
>>  
>>  config PINCTRL_BCM63XX
>>  	bool
>> +	depends on OF
>> +	select PINMUX
>> +	select PINCONF
>>  	select GENERIC_PINCONF
>> +	select GPIOLIB
>>  	select GPIO_REGMAP
>> -	select PINCONF
>> -	select PINMUX
>>  
>>  config PINCTRL_BCM6318
>>  	bool "Broadcom BCM6318 GPIO driver"
>>
> 
> That gives me:
> 
> WARNING: unmet direct dependencies detected for PINCTRL_BCM63XX
>   Depends on [n]: PINCTRL [=y] && OF [=n]
>   Selected by [y]:
>   - PINCTRL_BCM6328 [=y] && PINCTRL [=y] && (BMIPS_GENERIC || COMPILE_TEST [=y])
>   - PINCTRL_BCM6358 [=y] && PINCTRL [=y] && (BMIPS_GENERIC || COMPILE_TEST [=y])
>   - PINCTRL_BCM6362 [=y] && PINCTRL [=y] && (BMIPS_GENERIC || COMPILE_TEST [=y])
>   - PINCTRL_BCM63268 [=y] && PINCTRL [=y] && (BMIPS_GENERIC || COMPILE_TEST [=y])
> 
> and
> 
> ld: drivers/pinctrl/bcm/pinctrl-bcm6328.o: in function `pinconf_generic_dt_node_to_map_pin':
> pinctrl-bcm6328.c:(.text+0xe7): undefined reference to `pinconf_generic_dt_node_to_map'
> ld: drivers/pinctrl/bcm/pinctrl-bcm6358.o: in function `pinconf_generic_dt_node_to_map_pin':
> pinctrl-bcm6358.c:(.text+0x207): undefined reference to `pinconf_generic_dt_node_to_map'
> ld: drivers/pinctrl/bcm/pinctrl-bcm6362.o: in function `pinconf_generic_dt_node_to_map_pin':
> pinctrl-bcm6362.c:(.text+0xe7): undefined reference to `pinconf_generic_dt_node_to_map'
> ld: drivers/pinctrl/bcm/pinctrl-bcm63268.o: in function `pinconf_generic_dt_node_to_map_pin':
> pinctrl-bcm63268.c:(.text+0xe7): undefined reference to `pinconf_generic_dt_node_to_map'

The additional patch below fixes all of the kconfig warnings and build errors
for me.

---
From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH -next] pinctrl: bcm: fix bcx63xx build errors

All of the drivers that select PINCTRL_BCM63XX also should depend on
OF since 'select' does not follow any dependency chains and there
can still be kconfig warnings and build errors without this.

pinctrl-bcm6328.c:(.text+0xe7): undefined reference to `pinconf_generic_dt_node_to_map'
pinctrl-bcm6358.c:(.text+0x207): undefined reference to `pinconf_generic_dt_node_to_map'
pinctrl-bcm6362.c:(.text+0xe7): undefined reference to `pinconf_generic_dt_node_to_map'
pinctrl-bcm63268.c:(.text+0xe7): undefined reference to `pinconf_generic_dt_node_to_map'

WARNING: unmet direct dependencies detected for PINCTRL_BCM63XX
  Depends on [n]: PINCTRL [=y] && OF [=n]
  Selected by [y]:
  - PINCTRL_BCM6328 [=y] && PINCTRL [=y] && (BMIPS_GENERIC || COMPILE_TEST [=y])
  - PINCTRL_BCM6358 [=y] && PINCTRL [=y] && (BMIPS_GENERIC || COMPILE_TEST [=y])
  - PINCTRL_BCM6362 [=y] && PINCTRL [=y] && (BMIPS_GENERIC || COMPILE_TEST [=y])
  - PINCTRL_BCM63268 [=y] && PINCTRL [=y] && (BMIPS_GENERIC || COMPILE_TEST [=y])

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Álvaro Fernández Rojas <noltari@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/bcm/Kconfig |    6 ++++++
 1 file changed, 6 insertions(+)

--- linux-next-20210331.orig/drivers/pinctrl/bcm/Kconfig
+++ linux-next-20210331/drivers/pinctrl/bcm/Kconfig
@@ -41,6 +41,7 @@ config PINCTRL_BCM63XX
 config PINCTRL_BCM6318
 	bool "Broadcom BCM6318 GPIO driver"
 	depends on (BMIPS_GENERIC || COMPILE_TEST)
+	depends on OF
 	select PINCTRL_BCM63XX
 	default BMIPS_GENERIC
 	help
@@ -49,6 +50,7 @@ config PINCTRL_BCM6318
 config PINCTRL_BCM6328
 	bool "Broadcom BCM6328 GPIO driver"
 	depends on (BMIPS_GENERIC || COMPILE_TEST)
+	depends on OF
 	select PINCTRL_BCM63XX
 	default BMIPS_GENERIC
 	help
@@ -57,6 +59,7 @@ config PINCTRL_BCM6328
 config PINCTRL_BCM6358
 	bool "Broadcom BCM6358 GPIO driver"
 	depends on (BMIPS_GENERIC || COMPILE_TEST)
+	depends on OF
 	select PINCTRL_BCM63XX
 	default BMIPS_GENERIC
 	help
@@ -65,6 +68,7 @@ config PINCTRL_BCM6358
 config PINCTRL_BCM6362
 	bool "Broadcom BCM6362 GPIO driver"
 	depends on (BMIPS_GENERIC || COMPILE_TEST)
+	depends on OF
 	select PINCTRL_BCM63XX
 	default BMIPS_GENERIC
 	help
@@ -73,6 +77,7 @@ config PINCTRL_BCM6362
 config PINCTRL_BCM6368
 	bool "Broadcom BCM6368 GPIO driver"
 	depends on (BMIPS_GENERIC || COMPILE_TEST)
+	depends on OF
 	select PINCTRL_BCM63XX
 	default BMIPS_GENERIC
 	help
@@ -81,6 +86,7 @@ config PINCTRL_BCM6368
 config PINCTRL_BCM63268
 	bool "Broadcom BCM63268 GPIO driver"
 	depends on (BMIPS_GENERIC || COMPILE_TEST)
+	depends on OF
 	select PINCTRL_BCM63XX
 	default BMIPS_GENERIC
 	help

