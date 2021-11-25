Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DC1A45D897
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Nov 2021 12:00:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354669AbhKYLDJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Nov 2021 06:03:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354691AbhKYLBH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Nov 2021 06:01:07 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68678C061746;
        Thu, 25 Nov 2021 02:56:54 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: shreeya)
        with ESMTPSA id 13DB71F434FE
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
        t=1637837813; bh=pRh80ao/XXYuFlKiG3+ZTO7a4wz1IzxIaMtns5dPMz8=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=CmcdYXlamM2LVwUhdmIoGGwoJWxHGW8OFlUaiymdXO2K7TyS7l8U2MTApb4f0WKpA
         K188Yje1luvp0+3j+Blisupv7cMhJpkuO4BlfdZ9Ye6rOfVoRyKYbGTTM+/C787i+E
         BIEa8nW3kQCMRvnpK3ZJfOmoSMQ7LwAOA6p5Va6pO6JFt6fS3qvTzTrNFaN94Vl1b+
         MRclKawRfNojdlB+hrSjYQC95UtDsUPujMMcNS82oMwCAsQIHzJZs0LQqY621GCj7o
         Q/iIr1kVsozOFkdFoGhB7ahgNbu0w7sazwiwu300jzFgo+3blhglaLSTjRdC9mu4Ky
         cIYLoSnaClenA==
Subject: Re: [PATCH] gpio: Initialize gc->irq.domain before setting gc->to_irq
To:     Gabriel Krisman Bertazi <krisman@collabora.com>,
        linus.walleij@linaro.org, andy.shevchenko@gmail.com,
        sebastian.reichel@collabora.com
Cc:     brgl@bgdev.pl, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com,
        Emil Velikov <emil.velikov@collabora.com>
References: <20211108214148.9724-1-shreeya.patel@collabora.com>
 <YYp8JzxfLK2u0fU4@arch-x1c3> <87tugdxkj6.fsf@collabora.com>
From:   Shreeya Patel <shreeya.patel@collabora.com>
Message-ID: <d7d8bd97-3c12-bf04-a0ad-e0f391158d01@collabora.com>
Date:   Thu, 25 Nov 2021 16:26:45 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87tugdxkj6.fsf@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 16/11/21 1:23 am, Gabriel Krisman Bertazi wrote:
> Emil Velikov <emil.velikov@collabora.com> writes:
>
>> Hi Shreeya, all,
>>
>> On 2021/11/09, Shreeya Patel wrote:
>>> There is a race in registering of gc->irq.domain when
>>> probing the I2C driver.
>>> This sometimes leads to a Kernel NULL pointer dereference
>>> in gpiochip_to_irq function which uses the domain variable.
>>>
>>> To avoid this issue, set gc->to_irq after domain is
>>> initialized. This will make sure whenever gpiochip_to_irq
>>> is called, it has domain already initialized.
>>>
>> What is stopping the next developer to moving the assignment to the
>> incorrect place? Aka should we add an inline comment about this?
> I agree with Emil.  The patch seems like a workaround that doesn't
> really solve the underlying issue.  I'm not familiar with this code, but
> it seems that gc is missing a lock during this initialization, to prevent
> it from exposing a partially initialized gc->irq.

I do not see any locking mechanism used for protecting the use of gc 
members before they are
initialized. We faced a very similar problem with gc->to_irq as well 
where we had to return EPROBE_DEFER until it was initialized and ready 
to be used.

Linus, do you have any suggestion on what would be the correct way to 
fix this issue of race in registration of gc members?


Thanks,
Shreeya Patel
>
