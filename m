Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B609476C260
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Aug 2023 03:40:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231516AbjHBBkO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Aug 2023 21:40:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231555AbjHBBkF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Aug 2023 21:40:05 -0400
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4A467211B;
        Tue,  1 Aug 2023 18:39:37 -0700 (PDT)
Received: from loongson.cn (unknown [10.20.42.201])
        by gateway (Coremail) with SMTP id _____8BxpPCcs8lkfYMOAA--.34146S3;
        Wed, 02 Aug 2023 09:38:36 +0800 (CST)
Received: from [10.20.42.201] (unknown [10.20.42.201])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8AxX8+as8lkHshEAA--.47151S3;
        Wed, 02 Aug 2023 09:38:35 +0800 (CST)
Subject: Re: [PATCH v2 1/2] gpio: dt-bindings: add parsing of loongson gpio
 offset
To:     Conor Dooley <conor@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jianmin Lv <lvjianmin@loongson.cn>, wanghongliang@loongson.cn,
        Liu Peibao <liupeibao@loongson.cn>,
        loongson-kernel@lists.loongnix.cn, zhuyinbo@loongson.cn
References: <20230731091059.17323-1-zhuyinbo@loongson.cn>
 <20230731091059.17323-2-zhuyinbo@loongson.cn>
 <20230731-setback-such-61815ee3ef51@spud>
 <041bf8a6-8d91-c2ce-6752-aa7255f946c7@loongson.cn>
 <20230801-whenever-imitation-b2759b212f6b@spud>
 <a5c27913-2a88-d376-0130-22ca8a3d4516@loongson.cn>
 <20230801-varsity-chemo-09cc5e250ded@spud>
From:   Yinbo Zhu <zhuyinbo@loongson.cn>
Message-ID: <26adb487-f8c5-9cf4-5b31-070e9161e761@loongson.cn>
Date:   Wed, 2 Aug 2023 09:38:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20230801-varsity-chemo-09cc5e250ded@spud>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8AxX8+as8lkHshEAA--.47151S3
X-CM-SenderInfo: 52kx5xhqerqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
        ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
        nUUI43ZEXa7xR_UUUUUUUUU==
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



在 2023/8/1 下午11:54, Conor Dooley 写道:
> On Tue, Aug 01, 2023 at 04:34:30PM +0800, Yinbo Zhu wrote:
>>
>>
>> 在 2023/8/1 下午3:23, Conor Dooley 写道:
>>> On Tue, Aug 01, 2023 at 02:39:49PM +0800, Yinbo Zhu wrote:
>>>>
>>>>
>>>> 在 2023/7/31 下午11:55, Conor Dooley 写道:
>>>>> On Mon, Jul 31, 2023 at 05:10:58PM +0800, Yinbo Zhu wrote:
>>>>>> Add parsing GPIO configure, input, output, interrupt register offset
>>>>>> address and GPIO control mode support.
>>>>>
>>>>> This reeks of insufficient use of SoC specific compatibles. Do GPIO
>>>>> controllers on the same SoC have different register offsets?
>>>>
>>>>
>>>> Yes,
>>>>
>>>>> Where are the users for this?
>>>>
>>>>
>>>> For example, ls2k500 contains multiple GPIO chips with different
>>>> (configure, input, output, interrupt) offset addresses, but all others
>>>> are the same.
>>>
>>> Right. That's admittedly not what I expected to hear! Can you firstly
>>> explain this in the commit message,
>>
>>
>> I will add following explain in the commit message. Do you think it's
>> suitable?
>>
>> Loongson GPIO controllers come in multiple variants that are compatible
>> except for certain register offset values.  Add support in yaml file for
>> device properties allowing to specify them in DT.
> 
> Sure, that would be helpful.
> 
>>> and secondly add a soc-specific
>>> compatible for the ls2k500 and only allow these properties on that SoC?
> 
>> Sorry, I may not have described it clearly before, the ls2k500 was only
>> as a example, actually, Loongson GPIO controllers (2k500,2k1000,eg)come
>> in multiple variants that are compatible except for certain register
>> offset values.  So above all offset device property was used to in all
>> loongson gpio controller.
> 
> But it would be good to know why they are different. Do they each
> support some different features, or was there some other reason for
> making controllers like this?


There are no other reasons, just differences in these offset addresses.

Thanks,
Yinbo.

