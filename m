Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E96A75B85D
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jul 2023 21:57:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231199AbjGTT46 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Jul 2023 15:56:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229905AbjGTT44 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Jul 2023 15:56:56 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EB771BC1;
        Thu, 20 Jul 2023 12:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Content-ID:Content-Description;
        bh=UHdi0ppk3HXbhJCoymxLyW1bqeamBc8EoLRaETJq4AQ=; b=N1l2h8cjGcfj24djGmGMdsVkky
        VmxdSt1irycyZzCdaUYSGwogLNFeqbDl5ccHbT9JTQFt/o3q18lAZ2A/TPa6xNqm76+ckwyYye2qk
        mXwEprBy4YLfAGO/7hzVyZvi+4f0rt15BzeDf3oqM+ZqIpIaZsBGC48oH7uMraOc5zuzK+MR1GTPs
        qjW+T0tuOzCMDal7qzHNi7izVC5LxqO2oBEXrCe3DtpzoEC0vgrQimCyBbqQQIPYMQrA1ywEwdrHf
        NiV2EJVvRyaYup/hVKSeSao7mSGBPjEsk3cMEDNXcHk2/eJlbAJEMy52DwReo237W8b3Zrm/Ytx2Z
        BSYSpWyA==;
Received: from [2601:1c2:980:9ec0::2764]
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1qMZle-00C6Sk-1j;
        Thu, 20 Jul 2023 19:56:54 +0000
Message-ID: <f1e4938f-ddb8-1301-bd7a-f86679313eee@infradead.org>
Date:   Thu, 20 Jul 2023 12:56:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: linux-next: Tree for Jul 20 (gpio/gpio-ge)
Content-Language: en-US
From:   Randy Dunlap <rdunlap@infradead.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>
References: <20230720142243.1b463b82@canb.auug.org.au>
 <65b4ac1a-1128-6e2a-92c0-9bbcca4b760a@infradead.org>
In-Reply-To: <65b4ac1a-1128-6e2a-92c0-9bbcca4b760a@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 7/20/23 12:54, Randy Dunlap wrote:
> 
> 
> On 7/19/23 21:22, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20230719:
>>
> 
> on ppc32:
> when CONFIG_MODULES is not set:
> 
> ../drivers/gpio/gpio-ge.c:53:41: warning: 'struct platform_device' declared inside parameter list will not be visible outside of this definition or declaration
>    53 | static int __init gef_gpio_probe(struct platform_device *pdev)
>       |                                         ^~~~~~~~~~~~~~~
> ../drivers/gpio/gpio-ge.c: In function 'gef_gpio_probe':
> ../drivers/gpio/gpio-ge.c:59:32: error: invalid use of undefined type 'struct platform_device'
>    59 |         gc = devm_kzalloc(&pdev->dev, sizeof(*gc), GFP_KERNEL);
>       |                                ^~
> ../drivers/gpio/gpio-ge.c:63:29: error: invalid use of undefined type 'struct platform_device'
>    63 |         regs = of_iomap(pdev->dev.of_node, 0);
>       |                             ^~
> ../drivers/gpio/gpio-ge.c:67:35: error: invalid use of undefined type 'struct platform_device'
>    67 |         ret = bgpio_init(gc, &pdev->dev, 4, regs + GEF_GPIO_IN,
>       |                                   ^~
> In file included from ../include/linux/device.h:15,
>                  from ../arch/powerpc/include/asm/io.h:22,
>                  from ../include/linux/io.h:13,
>                  from ../drivers/gpio/gpio-ge.c:21:
> ../drivers/gpio/gpio-ge.c:71:30: error: invalid use of undefined type 'struct platform_device'
>    71 |                 dev_err(&pdev->dev, "bgpio_init failed\n");
>       |                              ^~
> ../include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
>   110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
>       |                         ^~~
> ../drivers/gpio/gpio-ge.c:71:17: note: in expansion of macro 'dev_err'
>    71 |                 dev_err(&pdev->dev, "bgpio_init failed\n");
>       |                 ^~~~~~~
> ../drivers/gpio/gpio-ge.c:76:41: error: invalid use of undefined type 'struct platform_device'
>    76 |         gc->label = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%pOF", pdev->dev.of_node);
>       |                                         ^~
> ../drivers/gpio/gpio-ge.c:76:72: error: invalid use of undefined type 'struct platform_device'
>    76 |         gc->label = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%pOF", pdev->dev.of_node);
>       |                                                                        ^~
> ../drivers/gpio/gpio-ge.c:83:67: error: invalid use of undefined type 'struct platform_device'
>    83 |         gc->ngpio = (u16)(uintptr_t)of_device_get_match_data(&pdev->dev);
>       |                                                                   ^~
> In file included from ../drivers/gpio/gpio-ge.c:26:
> ../drivers/gpio/gpio-ge.c:86:43: error: invalid use of undefined type 'struct platform_device'
>    86 |         ret = devm_gpiochip_add_data(&pdev->dev, gc, NULL);
>       |                                           ^~
> ../include/linux/gpio/driver.h:589:49: note: in definition of macro 'devm_gpiochip_add_data'
>   589 |                 devm_gpiochip_add_data_with_key(dev, gc, data, &lock_key, \
>       |                                                 ^~~
> In file included from ../include/linux/kernel.h:30,
>                  from ../drivers/gpio/gpio-ge.c:20:
> ../drivers/gpio/gpio-ge.c:93:61: error: invalid use of undefined type 'struct platform_device'
>    93 |         pr_err("%pOF: GPIO chip registration failed\n", pdev->dev.of_node);
>       |                                                             ^~
> ../include/linux/printk.h:427:33: note: in definition of macro 'printk_index_wrap'
>   427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
>       |                                 ^~~~~~~~~~~
> ../include/linux/printk.h:498:9: note: in expansion of macro 'printk'
>   498 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
>       |         ^~~~~~
> ../drivers/gpio/gpio-ge.c:93:9: note: in expansion of macro 'pr_err'
>    93 |         pr_err("%pOF: GPIO chip registration failed\n", pdev->dev.of_node);
>       |         ^~~~~~
> ../drivers/gpio/gpio-ge.c: At top level:
> ../drivers/gpio/gpio-ge.c:97:15: error: variable 'gef_gpio_driver' has initializer but incomplete type
>    97 | static struct platform_driver gef_gpio_driver = {
>       |               ^~~~~~~~~~~~~~~
> ../drivers/gpio/gpio-ge.c:98:10: error: 'struct platform_driver' has no member named 'driver'
>    98 |         .driver = {
>       |          ^~~~~~
> ../drivers/gpio/gpio-ge.c:98:19: error: extra brace group at end of initializer
>    98 |         .driver = {
>       |                   ^
> ../drivers/gpio/gpio-ge.c:98:19: note: (near initialization for 'gef_gpio_driver')
> ../drivers/gpio/gpio-ge.c:98:19: warning: excess elements in struct initializer
> ../drivers/gpio/gpio-ge.c:98:19: note: (near initialization for 'gef_gpio_driver')
> ../drivers/gpio/gpio-ge.c:103:1: warning: data definition has no type or storage class
>   103 | module_platform_driver_probe(gef_gpio_driver, gef_gpio_probe);
>       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpio/gpio-ge.c:103:1: error: type defaults to 'int' in declaration of 'module_platform_driver_probe' [-Werror=implicit-int]
> ../drivers/gpio/gpio-ge.c:103:1: warning: parameter names (without types) in function declaration
> ../drivers/gpio/gpio-ge.c:97:31: error: storage size of 'gef_gpio_driver' isn't known
>    97 | static struct platform_driver gef_gpio_driver = {
>       |                               ^~~~~~~~~~~~~~~
> ../drivers/gpio/gpio-ge.c:97:31: warning: 'gef_gpio_driver' defined but not used [-Wunused-variable]
> ../drivers/gpio/gpio-ge.c:53:19: warning: 'gef_gpio_probe' defined but not used [-Wunused-function]
>    53 | static int __init gef_gpio_probe(struct platform_device *pdev)
>       |                   ^~~~~~~~~~~~~~
> cc1: some warnings being treated as errors
> 
> 
> @Martyn:
> Please add a trailing '>' here:
> MODULE_AUTHOR("Martyn Welch <martyn.welch@ge.com");

and email to Martyn bounced... :(

-- 
~Randy
