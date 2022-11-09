Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BFF6622550
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Nov 2022 09:27:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229814AbiKII1b (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Nov 2022 03:27:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229794AbiKII1b (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Nov 2022 03:27:31 -0500
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D650313D16
        for <linux-gpio@vger.kernel.org>; Wed,  9 Nov 2022 00:27:29 -0800 (PST)
Received: from kwepemi500024.china.huawei.com (unknown [172.30.72.53])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4N6dPG73zpzmVnr;
        Wed,  9 Nov 2022 16:27:14 +0800 (CST)
Received: from [10.174.179.163] (10.174.179.163) by
 kwepemi500024.china.huawei.com (7.221.188.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 9 Nov 2022 16:27:27 +0800
Message-ID: <9bc294da-080c-9854-193d-a0474d058df0@huawei.com>
Date:   Wed, 9 Nov 2022 16:27:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH] gpiolib: fix memory leak in gpiochip_setup_dev
To:     Kent Gibson <warthog618@gmail.com>
CC:     <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <liwei391@huawei.com>,
        <linux-gpio@vger.kernel.org>
References: <20221108115324.270361-1-zengheng4@huawei.com>
 <Y2qKjPD8zcmybugm@sol> <Y2s2oUpjtU+ENuzN@sol>
Content-Language: en-US
From:   Zeng Heng <zengheng4@huawei.com>
In-Reply-To: <Y2s2oUpjtU+ENuzN@sol>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.179.163]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500024.china.huawei.com (7.221.188.100)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 2022/11/9 13:12, Kent Gibson wrote:
> On Wed, Nov 09, 2022 at 12:57:48AM +0800, Kent Gibson wrote:
>> On Tue, Nov 08, 2022 at 07:53:24PM +0800, Zeng Heng wrote:
>>> gcdev_register & gcdev_unregister call device_add & device_del to
>>> request/release source. But in device_add, the dev->p allocated by
>>> device_private_init is not released by device_del.
>>>
>>> So when calling gcdev_unregister to release gdev, it needs put_device
>>> to release dev in the following.
>>>
>>> Otherwise, kmemleak would report memory leak such as below:
>>>
>>> unreferenced object 0xffff88810b406400 (size 512):
>>>    comm "python3", pid 1682, jiffies 4295346908 (age 24.090s)
>>>    hex dump (first 32 bytes):
>>>      00 00 00 00 ad 4e ad de ff ff ff ff 00 00 00 00  .....N..........
>>>      ff ff ff ff ff ff ff ff a0 5e 23 90 ff ff ff ff  .........^#.....
>>>    backtrace:
>>>      [<00000000a58ee5fe>] kmalloc_trace+0x22/0x110
>>>      [<0000000045fe2058>] device_add+0xb34/0x1130
>>>      [<00000000d778b45f>] cdev_device_add+0x83/0xe0
>>>      [<0000000089f948ed>] gpiolib_cdev_register+0x73/0xa0
>>>      [<00000000a3a8a316>] gpiochip_setup_dev+0x1c/0x70
>>>      [<00000000787227b4>] gpiochip_add_data_with_key+0x10f6/0x1bf0
>>>      [<000000009ac5742c>] devm_gpiochip_add_data_with_key+0x2e/0x80
>>>      [<00000000bf2b23d9>] xra1403_probe+0x192/0x1b0 [gpio_xra1403]
>>>      [<000000005b5ef2d4>] spi_probe+0xe1/0x140
>>>      [<000000002b26f6f1>] really_probe+0x17c/0x3f0
>>>      [<00000000dd2dad9c>] __driver_probe_device+0xe3/0x170
>>>      [<000000005ca60d2a>] device_driver_attach+0x34/0x80
>>>      [<00000000e9db90db>] bind_store+0x10b/0x1a0
>>>      [<00000000e2650f8a>] drv_attr_store+0x49/0x70
>>>      [<0000000080a80b2b>] sysfs_kf_write+0x8c/0xb0
>>>      [<00000000a28b45b9>] kernfs_fop_write_iter+0x216/0x2e0
>>>
>>> unreferenced object 0xffff888100de9800 (size 512):
>>>    comm "python3", pid 264, jiffies 4294737615 (age 33.514s)
>>>    hex dump (first 32 bytes):
>>>      00 00 00 00 ad 4e ad de ff ff ff ff 00 00 00 00  .....N..........
>>>      ff ff ff ff ff ff ff ff a0 5e 63 a1 ff ff ff ff  .........^c.....
>>>    backtrace:
>>>      [<00000000bcc571d0>] kmalloc_trace+0x22/0x110
>>>      [<00000000eeb06124>] device_add+0xb34/0x1130
>>>      [<000000007e5cd2fd>] cdev_device_add+0x83/0xe0
>>>      [<000000008f6bcd3a>] gpiolib_cdev_register+0x73/0xa0
>>>      [<0000000012c93b24>] gpiochip_setup_dev+0x1c/0x70
>>>      [<00000000a24b646a>] gpiochip_add_data_with_key+0x10f6/0x1bf0
>>>      [<000000000c225212>] tpic2810_probe+0x16e/0x196 [gpio_tpic2810]
>>>      [<00000000b52d04ff>] i2c_device_probe+0x651/0x680
>>>      [<0000000058d3ff6b>] really_probe+0x17c/0x3f0
>>>      [<00000000586f43d3>] __driver_probe_device+0xe3/0x170
>>>      [<000000003f428602>] device_driver_attach+0x34/0x80
>>>      [<0000000040e91a1b>] bind_store+0x10b/0x1a0
>>>      [<00000000c1d990b9>] drv_attr_store+0x49/0x70
>>>      [<00000000a23bfc22>] sysfs_kf_write+0x8c/0xb0
>>>      [<00000000064e6572>] kernfs_fop_write_iter+0x216/0x2e0
>>>      [<00000000026ce093>] vfs_write+0x658/0x810
>>>
>>> Because at the point of gpiochip_setup_dev here, where dev.release
>>> does not set yet, calling put_device would cause the warning of
>>> no release function and double-free in the following fault handler
>>> route (when kfree dev_name). So directly calling kfree to release
>>> dev->p here in case of memory leak.
>>>
>>> Fixes: 1f5eb8b17f02 ("gpiolib: fix sysfs when cdev is not selected")
>> I'm confused. You say "gcdev_register & gcdev_unregister call device_add
>> & device_del" - which is only the case when CONFIG_GPIO_CDEV is not set.
>>
>> But your trace shows CONFIG_GPIO_CDEV is set, as otherwise
>> gpiolib_cdev_register() would not exist.
>>
>> Can you clarify the configuration in which you are seeing the problem?
>>
>> Assuming CONFIG_GPIO_CDEV is NOT set:
>>
>> Provide a more appropriate trace.
>>
>>  From a reading of the device_add() documentation, there is a problem if
>> the device_add() fails - in that case put_device() should be called - and
>> it is not, instead gpiochip_setup_dev() returns immediately - not going
>> via the err_remove_device path where your fix is??.
>> The correct fix for that would be to change the gcdev_register() to call
>> put_device() if device_add() fails.
>>
> Ignore that - as you mentioned the dev.release hasn't been set at that
> point.
>
> Having another look at this, I don't think the problem is related to the
> Fixed commit at all - it looks more general.
> How did you conclude that that commit introduced the problem?
> Is it easily repeatable and have you bisected for it?
>
> Cheers,
> Kent.
>   

Thanks to your patience for taking another look at this mail.

And allow me to claim that I indeed do the inject-fault test and 
regression test based on the patch.


My test environment has included CONFIG_GPIO_CDEV config, but no matter 
includes this config or not,

there is still memory leak in fault handle route about dev->p because of 
calling device_add.


Apologize for the fixed commit is not accurate, and exactly it's this one:

Fixes: 159f3cd92f17 ("gpiolib: Defer gpio device setup until after 
gpiolib initialization")


If everything is all right, I would send the second version patch and 
correct fix tag.

thanks all,

Zeng Heng


