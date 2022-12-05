Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A78ED6420E7
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Dec 2022 01:57:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230483AbiLEA5h (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 4 Dec 2022 19:57:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230453AbiLEA5g (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 4 Dec 2022 19:57:36 -0500
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CFA34BC01;
        Sun,  4 Dec 2022 16:57:32 -0800 (PST)
Received: from loongson.cn (unknown [117.133.84.183])
        by gateway (Coremail) with SMTP id _____8CxpfD7QY1jHCoDAA--.7225S3;
        Mon, 05 Dec 2022 08:57:31 +0800 (CST)
Received: from [192.168.1.2] (unknown [117.133.84.183])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8Dx_eH6QY1jcKklAA--.27000S3;
        Mon, 05 Dec 2022 08:57:30 +0800 (CST)
Message-ID: <2b86e0a3-2367-c7e8-1086-ee79ffb19907@loongson.cn>
Date:   Mon, 5 Dec 2022 08:57:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v1] gpio: loongson: enable irqdomain hierarchy config
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        WANG Xuerui <kernel@xen0n.name>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Juxin Gao <gaojuxin@loongson.cn>,
        Bibo Mao <maobibo@loongson.cn>,
        Yanteng Si <siyanteng@loongson.cn>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
        Arnaud Patard <apatard@mandriva.com>,
        Huacai Chen <chenhuacai@kernel.org>
References: <20221203105825.15886-1-zhuyinbo@loongson.cn>
 <b6b34bc4-4089-9c02-81b2-9eaf2c9a4663@loongson.cn>
 <CAMRc=MdqOA_xU6TdcMspF=GMYx0MbKv0MzrTNOuZ7W=kg2skDw@mail.gmail.com>
From:   Yinbo Zhu <zhuyinbo@loongson.cn>
In-Reply-To: <CAMRc=MdqOA_xU6TdcMspF=GMYx0MbKv0MzrTNOuZ7W=kg2skDw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Dx_eH6QY1jcKklAA--.27000S3
X-CM-SenderInfo: 52kx5xhqerqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvdXoW7XF4kWrWrCFy8GF4UtrWfuFg_yoWkArg_Cw
        nFyFs7Cr1UGr929FsI9rWfZr9IkayDWr1rC3Wqqw13Xw12qay8uw1Yvwn3W3W7WrW7WFn7
        ZrWSyFy7ZrWIgjkaLaAFLSUrUUUUnb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
        xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUO
        17CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2
        IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84AC
        jcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM2
        8EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1UM2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE
        52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I
        80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCj
        c4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AFwI
        0_JF0_Jw1l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VWrMxC20s026xCaFVCj
        c4AY6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
        Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY
        6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6x
        AIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY
        1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8FAp5UUUUU==
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


在 2022/12/3 23:01, Bartosz Golaszewski 写道:
> On Sat, Dec 3, 2022 at 12:05 PM Yinbo Zhu <zhuyinbo@loongson.cn> wrote:
>>
>> 在 2022/12/3 18:58, Yinbo Zhu 写道:
>>> The loongson gpio driver need select IRQ_DOMAIN_HIERARCHY and add
>>> such support.
>>>
>>> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
>>> ---
>>>    drivers/gpio/Kconfig | 1 +
>>>    1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
>>> index 55b7c5bae4aa..0f014411703e 100644
>>> --- a/drivers/gpio/Kconfig
>>> +++ b/drivers/gpio/Kconfig
>>> @@ -395,6 +395,7 @@ config GPIO_LOONGSON_64BIT
>>>        depends on LOONGARCH || COMPILE_TEST
>>>        select GPIO_GENERIC
>>>        select GPIOLIB_IRQCHIP
>>> +     select IRQ_DOMAIN_HIERARCHY
>>>        help
>>>          Say yes here to support the GPIO functionality of a number of
>>>          Loongson series of chips. The Loongson GPIO controller supports
>> Hi Bartosz,
>>
>>
>> please help merge this patch on top of the existing series.
>>
> I applied this, but please don't ping me an hour after you submit a
> patch on a Saturday.
>
> Bart

okay, I'll pay attention later.


Thanks,

Yinbo.

