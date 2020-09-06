Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 935CC25EF43
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Sep 2020 19:12:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726410AbgIFRMy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 6 Sep 2020 13:12:54 -0400
Received: from out28-73.mail.aliyun.com ([115.124.28.73]:41542 "EHLO
        out28-73.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725816AbgIFRMx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 6 Sep 2020 13:12:53 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07476211|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.549089-0.000560625-0.450351;FP=0|0|0|0|0|-1|-1|-1;HT=e01a16378;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=10;RT=10;SR=0;TI=SMTPD_---.ITZVRCT_1599412368;
Received: from 192.168.178.128(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.ITZVRCT_1599412368)
          by smtp.aliyun-inc.com(10.147.40.7);
          Mon, 07 Sep 2020 01:12:49 +0800
Subject: Re: [PATCH v2 2/3] pinctrl: Ingenic: Correct the pullup and pulldown
 parameters of JZ4780
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, aric.pzqi@ingenic.com,
        dongsheng.qiu@ingenic.com, rick.tyliu@ingenic.com,
        yanfei.li@ingenic.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com
References: <20200831154324.64951-1-zhouyanjie@wanyeetech.com>
 <20200831154324.64951-3-zhouyanjie@wanyeetech.com>
 <ASQ8GQ.DEHG1O3SW93A3@crapouillou.net>
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <c8f74c6f-6eac-3d54-d4ec-cb6e974ef3ff@wanyeetech.com>
Date:   Mon, 7 Sep 2020 01:12:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <ASQ8GQ.DEHG1O3SW93A3@crapouillou.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Paul,

在 2020/9/6 下午10:26, Paul Cercueil 写道:
> Hi Zhou,
>
> Le lun. 31 août 2020 à 23:43, 周琰杰 (Zhou Yanjie) 
> <zhouyanjie@wanyeetech.com> a écrit :
>> Correct the pullup and pulldown parameters of JZ4780 to make them
>> consistent with the parameters on the datasheet.
>>
>> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>> ---
>>
>> Notes:
>>     v2:
>>     New patch.
>>
>>  drivers/pinctrl/pinctrl-ingenic.c | 12 ++++++++++--
>>  1 file changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/pinctrl/pinctrl-ingenic.c 
>> b/drivers/pinctrl/pinctrl-ingenic.c
>> index 00f29fd684fa..ae7b8876d3b4 100644
>> --- a/drivers/pinctrl/pinctrl-ingenic.c
>> +++ b/drivers/pinctrl/pinctrl-ingenic.c
>> @@ -1035,6 +1035,14 @@ static const struct ingenic_chip_info 
>> jz4770_chip_info = {
>>      .pull_downs = jz4770_pull_downs,
>>  };
>>
>> +static const u32 jz4780_pull_ups[6] = {
>> +    0x3fffffff, 0xfff0f3fc, 0x0fffffff, 0xffff4fff, 0xffff7b7c, 
>> 0x7fa7f00f,
>> +};
>
> PE15 has a pull-up in my datasheet.
>

Yep,  you are right, it has a pull-up, I will fix it in the next version.

Thanks and best regards!

> The rest looks good.
>
> Cheers,
> -Paul
>
>> +
>> +static const u32 jz4780_pull_downs[6] = {
>> +    0x00000000, 0x000f0c03, 0x00000000, 0x0000b000, 0x00000483, 
>> 0x00580ff0,
>> +};
>> +
>>  static int jz4780_uart2_data_pins[] = { 0x66, 0x67, };
>>  static int jz4780_uart2_hwflow_pins[] = { 0x65, 0x64, };
>>  static int jz4780_uart4_data_pins[] = { 0x54, 0x4a, };
>> @@ -1301,8 +1309,8 @@ static const struct ingenic_chip_info 
>> jz4780_chip_info = {
>>      .num_groups = ARRAY_SIZE(jz4780_groups),
>>      .functions = jz4780_functions,
>>      .num_functions = ARRAY_SIZE(jz4780_functions),
>> -    .pull_ups = jz4770_pull_ups,
>> -    .pull_downs = jz4770_pull_downs,
>> +    .pull_ups = jz4780_pull_ups,
>> +    .pull_downs = jz4780_pull_downs,
>>  };
>>
>>  static const u32 x1000_pull_ups[4] = {
>> -- 
>> 2.11.0
>>
>
