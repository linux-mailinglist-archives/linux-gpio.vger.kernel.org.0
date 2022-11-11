Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B800162545C
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Nov 2022 08:17:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229461AbiKKHRM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Nov 2022 02:17:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230303AbiKKHRL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Nov 2022 02:17:11 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 003F071F26
        for <linux-gpio@vger.kernel.org>; Thu, 10 Nov 2022 23:17:10 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id v1so5275267wrt.11
        for <linux-gpio@vger.kernel.org>; Thu, 10 Nov 2022 23:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/fWC1wP5nbMCTSn+P416G4CNx3LZaeg5NEw0q2n99Ko=;
        b=QkluRuy1axQjAJBktLILALb3VQF8PwJSrx8LEYLYhow4ak/hNaiDBvTMa6QOfOAw1G
         QqB/ww7RitkfuCpdXOfhxfnnB3J79uftIRASu+H43n6VupXfyaXaunj394g66RDIIQuS
         Aifvm4zxeOqrF2L+2A6oOYbR5AiymlhLWnvSYbAkCwgo/i6ztFqBgExVglEva2pGrzlf
         lOVvWjWiuVQufEa+8VgwHzbi0BZNr4e49cQOQculcW5znyjI7E8kAvM4B7TQnpnB/ls4
         eTpo/YHyYpwM6O92LFQgJ1CUdyFKIVRwacaJMONNNeMYyOu111FJPtrhkDzTaYhDQi72
         pzUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/fWC1wP5nbMCTSn+P416G4CNx3LZaeg5NEw0q2n99Ko=;
        b=kOULpwC61ZpStHswIjrncRCr34rCpEzIk/L29si9F8a4mpKcMfU5/uoL8eCFQDGJHT
         edRWr/9aLV4nGV+EuIXGeHNRrfqMIodbJGJK2qID53yAZM61A8TnxDXYywf91eXbrE+L
         Z9zd9dPH5wu4v/l7tROCq5zhLs5DlYstkldZHgjBMcHwq5q3GH1BD6bzuXYds9j717JO
         GX2CewykjFlL0gZS5jTEOkYwhMeoML3NU0Cp/SNGTvDz5B/yswPNAzig8V40EEkibYdG
         F8zFhjoHXB/leA268D5nVYFzCu0ioEWAg4RZMxZ1D9Fxt3epMjwTVbSmX2v6dTmJQXNM
         YF1g==
X-Gm-Message-State: ANoB5pkblNxisEbUlHi2vMQcrytKSya15Ir+ZhRRL1724KnLzrT82v8/
        RvX8fQJMjecwkcObiSN33IcW+Q==
X-Google-Smtp-Source: AA0mqf7qlIuZC1ets2DVnsaUIx4Za16kjR5m0jYauddxIfXn8mU8OaXzanZosF6REbRDE+DYnxSSEQ==
X-Received: by 2002:adf:bc10:0:b0:236:8a6d:eaeb with SMTP id s16-20020adfbc10000000b002368a6deaebmr404550wrg.208.1668151029550;
        Thu, 10 Nov 2022 23:17:09 -0800 (PST)
Received: from [192.168.1.166] ([212.228.7.114])
        by smtp.gmail.com with ESMTPSA id j5-20020a05600c1c0500b003cfbbd54178sm12068342wms.2.2022.11.10.23.17.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 23:17:09 -0800 (PST)
Message-ID: <e54b421c-20f3-9f2e-c087-20ea6fefb2a7@linaro.org>
Date:   Fri, 11 Nov 2022 07:17:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH RFC 0/3] pinctrl: add ACPI support to pin controller
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, mika.westerberg@linux.intel.com,
        rafael@kernel.org, linus.walleij@linaro.org
References: <20221110191258.1134378-1-niyas.sait@linaro.org>
 <Y21btYwNRMD4xXXL@smile.fi.intel.com>
From:   Niyas Sait <niyas.sait@linaro.org>
In-Reply-To: <Y21btYwNRMD4xXXL@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> I'm not sure it will go to the v6/2-rc1 due to tough time range
> (we are almost at -rc5), I hope you are not in such hurry.

Thanks. That's fine.

On 10/11/2022 20:14, Andy Shevchenko wrote:
> On Thu, Nov 10, 2022 at 07:12:55PM +0000, Niyas Sait wrote:
>> This is a proposal for adding ACPI support to pin controller.
>>
>> The patch supports following resources introduced in ACPI from v6.2
>>
>> - PinFunction
>> - PinConfig
>> - PinGroupFunction
>> - PinGroupConfig
>> - PinGroup
>>
>> The patch has been tested on NXP I.MX8MP Plus platform with ACPI.
> 
> Thank you very much for this work!
> 
> I will take time to review it, presumably next week.
> 
> I'm not sure it will go to the v6/2-rc1 due to tough time range
> (we are almost at -rc5), I hope you are not in such hurry.
> 
>> Niyas Sait (3):
>>    pinctrl: add support for acpi PinGroup resource
>>    pinconf-generic: add pull up and pull down config with resistance
>>    pinctrl: add support for acpi pin function and config resources
>>
>>   drivers/pinctrl/Makefile                |   1 +
>>   drivers/pinctrl/core.c                  |  19 +-
>>   drivers/pinctrl/core.h                  |   3 +
>>   drivers/pinctrl/pinctrl-acpi.c          | 450 ++++++++++++++++++++++++
>>   drivers/pinctrl/pinctrl-acpi.h          |  50 +++
>>   include/linux/pinctrl/pinconf-generic.h |   6 +
>>   include/linux/pinctrl/pinctrl.h         |  15 +
>>   7 files changed, 540 insertions(+), 4 deletions(-)
>>   create mode 100644 drivers/pinctrl/pinctrl-acpi.c
>>   create mode 100644 drivers/pinctrl/pinctrl-acpi.h
>>
>> -- 
>> 2.25.1
>>
> 
