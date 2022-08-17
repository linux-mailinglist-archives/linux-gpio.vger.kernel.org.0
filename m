Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C68375966D5
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Aug 2022 03:38:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238361AbiHQBhk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Aug 2022 21:37:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238243AbiHQBhj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Aug 2022 21:37:39 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B111295696;
        Tue, 16 Aug 2022 18:37:37 -0700 (PDT)
Received: from [192.168.100.8] (unknown [112.20.110.237])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8Bx5OFaRvxiggADAA--.16150S3;
        Wed, 17 Aug 2022 09:37:31 +0800 (CST)
Message-ID: <78472e8f-b7e8-3e72-d50b-b754cece819a@loongson.cn>
Date:   Wed, 17 Aug 2022 09:37:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2] docs/zh_CN: Update the translation of gpio to 6.0-rc1
To:     Wu XiangCheng <wu.xiangcheng@linux.dev>
Cc:     linus.walleij@linaro.org, brgl@bgdev.pl, tekkamanninja@gmail.com,
        corbet@lwn.net, alexs@kernel.org, linux-gpio@vger.kernel.org,
        linux-doc@vger.kernel.org
References: <20220816114025.4180328-1-siyanteng@loongson.cn>
 <YvuXyKeF8MUf6vKh@bobwxc.mipc>
From:   YanTeng Si <siyanteng@loongson.cn>
In-Reply-To: <YvuXyKeF8MUf6vKh@bobwxc.mipc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Bx5OFaRvxiggADAA--.16150S3
X-Coremail-Antispam: 1UD129KBjvdXoWrZr48uFyxXFWDArWUJry8Grg_yoWDtrgEva
        45KFWjyFn8G3W8Xw1Dua4kGa1kJr1rWr4vqr4xA3y7KFnIqF18trnIk390qa45Xr1UCrW3
        uFZ7Way7WF4aqjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbxAYjsxI4VWxJwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
        8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0
        cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4
        A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
        0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
        1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21l
        c2xSY4AK67AK6w4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxV
        Aqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q
        6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6x
        kF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AK
        xVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07
        j1g4fUUUUU=
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_50,NICE_REPLY_A,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


在 2022/8/16 21:12, Wu XiangCheng 写道:
> 话说 Yanteng Si 于 2022-08-16 (二) 19:40:25 +0800 曰过：
>
>> @@ -444,15 +476,16 @@ GPIO 实现者的框架 (可选)
>>   
>>   
>>   控制器驱动: gpio_chip
>> --------------------
>> +---------------------
>> +
>>   在框架中每个 GPIO 控制器都包装为一个 "struct gpio_chip"，他包含了
>>   该类型的每个控制器的常用信息:
>>   
>> - - 设置 GPIO 方向的方法
>> - - 用于访问 GPIO 值的方法
>> - - 告知调用其方法是否可能休眠的标志
>> - - 可选的 debugfs 信息导出方法 (显示类似上拉配置一样的额外状态)
>> - - 诊断标签
>> +	设置 GPIO 方向的方法
>> +	用于访问 GPIO 值的方法
>> +	告知调用其方法是否可能休眠的标志
>> +	可选的 debugfs 信息导出方法 (显示类似上拉配置一样的额外状态)
>> +	诊断标签
> List style problem, please use '-' or '*', or all items will be put into
> one <p></p>.

I see, I will fix it in v3.


Thanks,

Yanteng

