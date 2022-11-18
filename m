Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF3C562EBF4
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Nov 2022 03:31:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240477AbiKRCbN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Nov 2022 21:31:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240571AbiKRCbM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Nov 2022 21:31:12 -0500
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85F3759854
        for <linux-gpio@vger.kernel.org>; Thu, 17 Nov 2022 18:31:11 -0800 (PST)
Received: from kwepemi500024.china.huawei.com (unknown [172.30.72.56])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4ND10b3b92zJnhS;
        Fri, 18 Nov 2022 10:27:59 +0800 (CST)
Received: from [10.174.179.163] (10.174.179.163) by
 kwepemi500024.china.huawei.com (7.221.188.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 18 Nov 2022 10:31:09 +0800
Message-ID: <95773a87-8087-ece9-2ac6-c9714eacffd1@huawei.com>
Date:   Fri, 18 Nov 2022 10:31:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v3] gpiolib: fix memory leak in gpiochip_setup_dev()
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
CC:     <brgl@bgdev.pl>, <linux@roeck-us.net>, <linus.walleij@linaro.org>,
        <warthog618@gmail.com>, <linux-gpio@vger.kernel.org>,
        <liwei391@huawei.com>
References: <f118d0b1-1bf2-b710-c3b4-2745c72f02b3@huawei.com>
 <20221117090247.122980-1-zengheng4@huawei.com>
 <Y3YR0rBSWHu5WhfL@smile.fi.intel.com>
 <3ccf3b72-a3dd-66fe-4d8a-b22140ed9364@huawei.com>
 <Y3ZT6KUkPlSS7whW@smile.fi.intel.com>
From:   Zeng Heng <zengheng4@huawei.com>
In-Reply-To: <Y3ZT6KUkPlSS7whW@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.179.163]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
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


On 2022/11/17 23:31, Andy Shevchenko wrote:
> On Thu, Nov 17, 2022 at 10:12:31PM +0800, Zeng Heng wrote:
>> On 2022/11/17 18:49, Andy Shevchenko wrote:
>>> On Thu, Nov 17, 2022 at 05:02:47PM +0800, Zeng Heng wrote:
> ...
>
>>>> +	/*
>>>> +	 * If gdev->dev.release has been registered by
>>>> +	 * gpiochip_setup_dev(), print err msg and
>>>> +	 * call put_device() to release all.
>>>> +	 */
>>>> +	if (gdev->dev.release)
>>>> +		goto err_free_gdev;
>>> (1)
>>>
>>>>    err_remove_from_list:
>>>>    	spin_lock_irqsave(&gpio_lock, flags);
>>>>    	list_del(&gdev->list);
>>> ...
>>>
>>>> -	kfree(gdev);
>>>> +	if (gdev->dev.release)
>>>> +		put_device(&gdev->dev);
>>> Why you can't do this above at (1)?
>>> Is there any other hidden way to get here with release set?
>> As already mentioned in the mail, keep the error print info.
> Can you refactor that to avoid double condition on the ->release() presence?

Sure.

Zeng Heng

>
>>>> +	else
>>>> +		kfree(gdev);
>>>>    	return ret;
