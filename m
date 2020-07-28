Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E644230E39
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jul 2020 17:43:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730721AbgG1Pnd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jul 2020 11:43:33 -0400
Received: from out28-149.mail.aliyun.com ([115.124.28.149]:37114 "EHLO
        out28-149.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730679AbgG1Pnd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Jul 2020 11:43:33 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07436282|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.587614-0.000284104-0.412101;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03298;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.I8tI3gH_1595950997;
Received: from 192.168.10.205(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.I8tI3gH_1595950997)
          by smtp.aliyun-inc.com(10.147.41.158);
          Tue, 28 Jul 2020 23:43:18 +0800
Subject: Re: [PATCH 1/1] pinctrl: Ingenic: Add SSI pins support for JZ4770 and
 JZ4780.
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, prasannatsmkumar@gmail.com,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, yanfei.li@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com,
        Zeartul Rojek <contact@artur-rojek.eu>
References: <20200725074605.67919-1-zhouyanjie@wanyeetech.com>
 <20200725074605.67919-2-zhouyanjie@wanyeetech.com>
 <WYY0EQ.BP31MFYK22QR2@crapouillou.net>
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <13d28808-b73f-9cdf-3a53-a0dd219c0e46@wanyeetech.com>
Date:   Tue, 28 Jul 2020 23:43:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <WYY0EQ.BP31MFYK22QR2@crapouillou.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Paul,

在 2020/7/25 下午8:35, Paul Cercueil 写道:
> Hi Zhou,
>
> Le sam. 25 juil. 2020 à 15:46, 周琰杰 (Zhou Yanjie) 
> <zhouyanjie@wanyeetech.com> a écrit :
>> Add SSI pins support for the JZ4770 SoC and the
>> JZ4780 SoC from Ingenic.
>>
>> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>> ---
>>  drivers/pinctrl/pinctrl-ingenic.c | 267 
>> ++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 267 insertions(+)
>>
>> diff --git a/drivers/pinctrl/pinctrl-ingenic.c 
>> b/drivers/pinctrl/pinctrl-ingenic.c
>> index 6a8d44504f94..804c538fa08d 100644
>> --- a/drivers/pinctrl/pinctrl-ingenic.c
>> +++ b/drivers/pinctrl/pinctrl-ingenic.c
>> @@ -630,6 +630,46 @@ static int jz4770_uart2_data_pins[] = { 0x5c, 
>> 0x5e, };
>>  static int jz4770_uart2_hwflow_pins[] = { 0x5d, 0x5f, };
>>  static int jz4770_uart3_data_pins[] = { 0x6c, 0x85, };
>>  static int jz4770_uart3_hwflow_pins[] = { 0x88, 0x89, };
>> +static int jz4770_ssi0_dt_a_pins[] = { 0x15, };
>> +static int jz4770_ssi0_dt_b_pins[] = { 0x35, };
>> +static int jz4770_ssi0_dt_d_pins[] = { 0x55, };
>> +static int jz4770_ssi0_dt_e_pins[] = { 0x71, };
>> +static int jz4770_ssi0_dr_a_pins[] = { 0x14, };
>> +static int jz4770_ssi0_dr_b_pins[] = { 0x34, };
>> +static int jz4770_ssi0_dr_d_pins[] = { 0x54, };
>> +static int jz4770_ssi0_dr_e_pins[] = { 0x6e, };
>> +static int jz4770_ssi0_clk_a_pins[] = { 0x12, };
>> +static int jz4770_ssi0_clk_b_pins[] = { 0x3c, };
>> +static int jz4770_ssi0_clk_d_pins[] = { 0x58, };
>> +static int jz4770_ssi0_clk_e_pins[] = { 0x6f, };
>> +static int jz4770_ssi0_gpc_b_pins[] = { 0x3e, };
>> +static int jz4770_ssi0_gpc_d_pins[] = { 0x56, };
>> +static int jz4770_ssi0_gpc_e_pins[] = { 0x73, };
>> +static int jz4770_ssi0_ce0_a_pins[] = { 0x13, };
>> +static int jz4770_ssi0_ce0_b_pins[] = { 0x3d, };
>> +static int jz4770_ssi0_ce0_d_pins[] = { 0x59, };
>> +static int jz4770_ssi0_ce0_e_pins[] = { 0x70, };
>> +static int jz4770_ssi0_ce1_b_pins[] = { 0x3f, };
>> +static int jz4770_ssi0_ce1_d_pins[] = { 0x57, };
>> +static int jz4770_ssi0_ce1_e_pins[] = { 0x72, };
>
> I think you could group dt/dr/clk together each time, with ce0/ce1/gpc 
> apart, unless you really need such granularity.
>
When connecting certain devices, sometimes only the dt or dr pins (such 
as AD7266, only use dr) need to be used separately. If dt, dr, and clk 
are put in the same group, then the dt pin cannot be used for other 
purposes at this time, ce0, ce1 and gpc also have similar situations, so 
grouping them independently can ensure maximum flexibility and maximum 
utilization.

> Btw, just to avoid duplicated work, know that Artur (Cc'd) is already 
> working on a SPI driver for the JZ4770. In case you were working on one.
>
Yes, I already communicated with him, and because the engineer of 
Ingenic told me that the ssi driver based on Artur's driver has made new 
progress, so I hope to improve the related driver in advance.

Thanks and best regards!

> Cheers,
> -Paul
>
>> +static int jz4770_ssi1_dt_b_pins[] = { 0x35, };
>> +static int jz4770_ssi1_dt_d_pins[] = { 0x55, };
>> +static int jz4770_ssi1_dt_e_pins[] = { 0x71, };
>> +static int jz4770_ssi1_dr_b_pins[] = { 0x34, };
>> +static int jz4770_ssi1_dr_d_pins[] = { 0x54, };
>> +static int jz4770_ssi1_dr_e_pins[] = { 0x6e, };
>> +static int jz4770_ssi1_clk_b_pins[] = { 0x3c, };
>> +static int jz4770_ssi1_clk_d_pins[] = { 0x58, };
>> +static int jz4770_ssi1_clk_e_pins[] = { 0x6f, };
>> +static int jz4770_ssi1_gpc_b_pins[] = { 0x3e, };
>> +static int jz4770_ssi1_gpc_d_pins[] = { 0x56, };
>> +static int jz4770_ssi1_gpc_e_pins[] = { 0x73, };
>> +static int jz4770_ssi1_ce0_b_pins[] = { 0x3d, };
>> +static int jz4770_ssi1_ce0_d_pins[] = { 0x59, };
>> +static int jz4770_ssi1_ce0_e_pins[] = { 0x70, };
>> +static int jz4770_ssi1_ce1_b_pins[] = { 0x3f, };
>> +static int jz4770_ssi1_ce1_d_pins[] = { 0x57, };
>> +static int jz4770_ssi1_ce1_e_pins[] = { 0x72, };
>>  static int jz4770_mmc0_1bit_a_pins[] = { 0x12, 0x13, 0x14, };
>>  static int jz4770_mmc0_4bit_a_pins[] = { 0x15, 0x16, 0x17, };
>>  static int jz4770_mmc0_1bit_e_pins[] = { 0x9c, 0x9d, 0x94, };
>> @@ -700,6 +740,46 @@ static int jz4770_uart2_data_funcs[] = { 0, 0, };
>>  static int jz4770_uart2_hwflow_funcs[] = { 0, 0, };
>>  static int jz4770_uart3_data_funcs[] = { 0, 1, };
>>  static int jz4770_uart3_hwflow_funcs[] = { 0, 0, };
>> +static int jz4770_ssi0_dt_a_funcs[] = { 2, };
>> +static int jz4770_ssi0_dt_b_funcs[] = { 1, };
>> +static int jz4770_ssi0_dt_d_funcs[] = { 1, };
>> +static int jz4770_ssi0_dt_e_funcs[] = { 0, };
>> +static int jz4770_ssi0_dr_a_funcs[] = { 1, };
>> +static int jz4770_ssi0_dr_b_funcs[] = { 1, };
>> +static int jz4770_ssi0_dr_d_funcs[] = { 1, };
>> +static int jz4770_ssi0_dr_e_funcs[] = { 0, };
>> +static int jz4770_ssi0_clk_a_funcs[] = { 2, };
>> +static int jz4770_ssi0_clk_b_funcs[] = { 1, };
>> +static int jz4770_ssi0_clk_d_funcs[] = { 1, };
>> +static int jz4770_ssi0_clk_e_funcs[] = { 0, };
>> +static int jz4770_ssi0_gpc_b_funcs[] = { 1, };
>> +static int jz4770_ssi0_gpc_d_funcs[] = { 1, };
>> +static int jz4770_ssi0_gpc_e_funcs[] = { 0, };
>> +static int jz4770_ssi0_ce0_a_funcs[] = { 2, };
>> +static int jz4770_ssi0_ce0_b_funcs[] = { 1, };
>> +static int jz4770_ssi0_ce0_d_funcs[] = { 1, };
>> +static int jz4770_ssi0_ce0_e_funcs[] = { 0, };
>> +static int jz4770_ssi0_ce1_b_funcs[] = { 1, };
>> +static int jz4770_ssi0_ce1_d_funcs[] = { 1, };
>> +static int jz4770_ssi0_ce1_e_funcs[] = { 0, };
>> +static int jz4770_ssi1_dt_b_funcs[] = { 2, };
>> +static int jz4770_ssi1_dt_d_funcs[] = { 2, };
>> +static int jz4770_ssi1_dt_e_funcs[] = { 1, };
>> +static int jz4770_ssi1_dr_b_funcs[] = { 2, };
>> +static int jz4770_ssi1_dr_d_funcs[] = { 2, };
>> +static int jz4770_ssi1_dr_e_funcs[] = { 1, };
>> +static int jz4770_ssi1_clk_b_funcs[] = { 2, };
>> +static int jz4770_ssi1_clk_d_funcs[] = { 2, };
>> +static int jz4770_ssi1_clk_e_funcs[] = { 1, };
>> +static int jz4770_ssi1_gpc_b_funcs[] = { 2, };
>> +static int jz4770_ssi1_gpc_d_funcs[] = { 2, };
>> +static int jz4770_ssi1_gpc_e_funcs[] = { 1, };
>> +static int jz4770_ssi1_ce0_b_funcs[] = { 2, };
>> +static int jz4770_ssi1_ce0_d_funcs[] = { 2, };
>> +static int jz4770_ssi1_ce0_e_funcs[] = { 1, };
>> +static int jz4770_ssi1_ce1_b_funcs[] = { 2, };
>> +static int jz4770_ssi1_ce1_d_funcs[] = { 2, };
>> +static int jz4770_ssi1_ce1_e_funcs[] = { 1, };
>>  static int jz4770_mmc0_1bit_a_funcs[] = { 1, 1, 0, };
>>  static int jz4770_mmc0_4bit_a_funcs[] = { 1, 1, 1, };
>>  static int jz4770_mmc0_1bit_e_funcs[] = { 0, 0, 0, };
>> @@ -760,6 +840,46 @@ static const struct group_desc jz4770_groups[] = {
>>      INGENIC_PIN_GROUP("uart2-hwflow", jz4770_uart2_hwflow),
>>      INGENIC_PIN_GROUP("uart3-data", jz4770_uart3_data),
>>      INGENIC_PIN_GROUP("uart3-hwflow", jz4770_uart3_hwflow),
>> +    INGENIC_PIN_GROUP("ssi0_dt_a", jz4770_ssi0_dt_a),
>> +    INGENIC_PIN_GROUP("ssi0_dt_b", jz4770_ssi0_dt_b),
>> +    INGENIC_PIN_GROUP("ssi0_dt_d", jz4770_ssi0_dt_d),
>> +    INGENIC_PIN_GROUP("ssi0_dt_e", jz4770_ssi0_dt_e),
>> +    INGENIC_PIN_GROUP("ssi0_dr_a", jz4770_ssi0_dr_a),
>> +    INGENIC_PIN_GROUP("ssi0_dr_b", jz4770_ssi0_dr_b),
>> +    INGENIC_PIN_GROUP("ssi0_dr_d", jz4770_ssi0_dr_d),
>> +    INGENIC_PIN_GROUP("ssi0_dr_e", jz4770_ssi0_dr_e),
>> +    INGENIC_PIN_GROUP("ssi0_clk_a", jz4770_ssi0_clk_a),
>> +    INGENIC_PIN_GROUP("ssi0_clk_b", jz4770_ssi0_clk_b),
>> +    INGENIC_PIN_GROUP("ssi0_clk_d", jz4770_ssi0_clk_d),
>> +    INGENIC_PIN_GROUP("ssi0_clk_e", jz4770_ssi0_clk_e),
>> +    INGENIC_PIN_GROUP("ssi0_gpc_b", jz4770_ssi0_gpc_b),
>> +    INGENIC_PIN_GROUP("ssi0_gpc_d", jz4770_ssi0_gpc_d),
>> +    INGENIC_PIN_GROUP("ssi0_gpc_e", jz4770_ssi0_gpc_e),
>> +    INGENIC_PIN_GROUP("ssi0_ce0_a", jz4770_ssi0_ce0_a),
>> +    INGENIC_PIN_GROUP("ssi0_ce0_b", jz4770_ssi0_ce0_b),
>> +    INGENIC_PIN_GROUP("ssi0_ce0_d", jz4770_ssi0_ce0_d),
>> +    INGENIC_PIN_GROUP("ssi0_ce0_e", jz4770_ssi0_ce0_e),
>> +    INGENIC_PIN_GROUP("ssi0_ce1_b", jz4770_ssi0_ce1_b),
>> +    INGENIC_PIN_GROUP("ssi0_ce1_d", jz4770_ssi0_ce1_d),
>> +    INGENIC_PIN_GROUP("ssi0_ce1_e", jz4770_ssi0_ce1_e),
>> +    INGENIC_PIN_GROUP("ssi1_dt_b", jz4770_ssi1_dt_b),
>> +    INGENIC_PIN_GROUP("ssi1_dt_d", jz4770_ssi1_dt_d),
>> +    INGENIC_PIN_GROUP("ssi1_dt_e", jz4770_ssi1_dt_e),
>> +    INGENIC_PIN_GROUP("ssi1_dr_b", jz4770_ssi1_dr_b),
>> +    INGENIC_PIN_GROUP("ssi1_dr_d", jz4770_ssi1_dr_d),
>> +    INGENIC_PIN_GROUP("ssi1_dr_e", jz4770_ssi1_dr_e),
>> +    INGENIC_PIN_GROUP("ssi1_clk_b", jz4770_ssi1_clk_b),
>> +    INGENIC_PIN_GROUP("ssi1_clk_d", jz4770_ssi1_clk_d),
>> +    INGENIC_PIN_GROUP("ssi1_clk_e", jz4770_ssi1_clk_e),
>> +    INGENIC_PIN_GROUP("ssi1_gpc_b", jz4770_ssi1_gpc_b),
>> +    INGENIC_PIN_GROUP("ssi1_gpc_d", jz4770_ssi1_gpc_d),
>> +    INGENIC_PIN_GROUP("ssi1_gpc_e", jz4770_ssi1_gpc_e),
>> +    INGENIC_PIN_GROUP("ssi1_ce0_b", jz4770_ssi1_ce0_b),
>> +    INGENIC_PIN_GROUP("ssi1_ce0_d", jz4770_ssi1_ce0_d),
>> +    INGENIC_PIN_GROUP("ssi1_ce0_e", jz4770_ssi1_ce0_e),
>> +    INGENIC_PIN_GROUP("ssi1_ce1_b", jz4770_ssi1_ce1_b),
>> +    INGENIC_PIN_GROUP("ssi1_ce1_d", jz4770_ssi1_ce1_d),
>> +    INGENIC_PIN_GROUP("ssi1_ce1_e", jz4770_ssi1_ce1_e),
>>      INGENIC_PIN_GROUP("mmc0-1bit-a", jz4770_mmc0_1bit_a),
>>      INGENIC_PIN_GROUP("mmc0-4bit-a", jz4770_mmc0_4bit_a),
>>      INGENIC_PIN_GROUP("mmc0-1bit-e", jz4770_mmc0_1bit_e),
>> @@ -812,6 +932,22 @@ static const char *jz4770_uart0_groups[] = { 
>> "uart0-data", "uart0-hwflow", };
>>  static const char *jz4770_uart1_groups[] = { "uart1-data", 
>> "uart1-hwflow", };
>>  static const char *jz4770_uart2_groups[] = { "uart2-data", 
>> "uart2-hwflow", };
>>  static const char *jz4770_uart3_groups[] = { "uart3-data", 
>> "uart3-hwflow", };
>> +static const char *jz4770_ssi0_groups[] = {
>> +    "ssi0-dt-a", "ssi0-dt-b", "ssi0-dt-d", "ssi0-dt-e",
>> +    "ssi0-dr-a", "ssi0-dr-b", "ssi0-dr-d", "ssi0-dr-e",
>> +    "ssi0-clk-a", "ssi0-clk-b", "ssi0-clk-d", "ssi0-clk-e",
>> +    "ssi0-gpc-b", "ssi0-gpc-d", "ssi0-gpc-e",
>> +    "ssi0-ce0-a", "ssi0-ce0-b", "ssi0-ce0-d", "ssi0-ce0-e",
>> +    "ssi0-ce1-b", "ssi0-ce1-d", "ssi0-ce1-e",
>> +};
>> +static const char *jz4770_ssi1_groups[] = {
>> +    "ssi1-dt-b", "ssi1-dt-d", "ssi1-dt-e",
>> +    "ssi1-dr-b", "ssi1-dr-d", "ssi1-dr-e",
>> +    "ssi1-clk-b", "ssi1-clk-d", "ssi1-clk-e",
>> +    "ssi1-gpc-b", "ssi1-gpc-d", "ssi1-gpc-e",
>> +    "ssi1-ce0-b", "ssi1-ce0-d", "ssi1-ce0-e",
>> +    "ssi1-ce1-b", "ssi1-ce1-d", "ssi1-ce1-e",
>> +};
>>  static const char *jz4770_mmc0_groups[] = {
>>      "mmc0-1bit-a", "mmc0-4bit-a",
>>      "mmc0-1bit-e", "mmc0-4bit-e", "mmc0-8bit-e",
>> @@ -855,6 +991,8 @@ static const struct function_desc 
>> jz4770_functions[] = {
>>      { "uart1", jz4770_uart1_groups, ARRAY_SIZE(jz4770_uart1_groups), },
>>      { "uart2", jz4770_uart2_groups, ARRAY_SIZE(jz4770_uart2_groups), },
>>      { "uart3", jz4770_uart3_groups, ARRAY_SIZE(jz4770_uart3_groups), },
>> +    { "ssi0", jz4770_ssi0_groups, ARRAY_SIZE(jz4770_ssi0_groups), },
>> +    { "ssi1", jz4770_ssi1_groups, ARRAY_SIZE(jz4770_ssi1_groups), },
>>      { "mmc0", jz4770_mmc0_groups, ARRAY_SIZE(jz4770_mmc0_groups), },
>>      { "mmc1", jz4770_mmc1_groups, ARRAY_SIZE(jz4770_mmc1_groups), },
>>      { "mmc2", jz4770_mmc2_groups, ARRAY_SIZE(jz4770_mmc2_groups), },
>> @@ -897,6 +1035,39 @@ static const struct ingenic_chip_info 
>> jz4770_chip_info = {
>>  static int jz4780_uart2_data_pins[] = { 0x66, 0x67, };
>>  static int jz4780_uart2_hwflow_pins[] = { 0x65, 0x64, };
>>  static int jz4780_uart4_data_pins[] = { 0x54, 0x4a, };
>> +static int jz4780_ssi0_dt_a_19_pins[] = { 0x13, };
>> +static int jz4780_ssi0_dt_a_21_pins[] = { 0x15, };
>> +static int jz4780_ssi0_dt_a_28_pins[] = { 0x1c, };
>> +static int jz4780_ssi0_dt_b_pins[] = { 0x3d, };
>> +static int jz4780_ssi0_dt_d_pins[] = { 0x59, };
>> +static int jz4780_ssi0_dr_a_20_pins[] = { 0x14, };
>> +static int jz4780_ssi0_dr_a_27_pins[] = { 0x1b, };
>> +static int jz4780_ssi0_dr_b_pins[] = { 0x34, };
>> +static int jz4780_ssi0_dr_d_pins[] = { 0x54, };
>> +static int jz4780_ssi0_clk_a_pins[] = { 0x12, };
>> +static int jz4780_ssi0_clk_b_5_pins[] = { 0x25, };
>> +static int jz4780_ssi0_clk_b_28_pins[] = { 0x3c, };
>> +static int jz4780_ssi0_clk_d_pins[] = { 0x58, };
>> +static int jz4780_ssi0_gpc_b_pins[] = { 0x3e, };
>> +static int jz4780_ssi0_gpc_d_pins[] = { 0x56, };
>> +static int jz4780_ssi0_ce0_a_23_pins[] = { 0x17, };
>> +static int jz4780_ssi0_ce0_a_25_pins[] = { 0x19, };
>> +static int jz4780_ssi0_ce0_b_pins[] = { 0x3f, };
>> +static int jz4780_ssi0_ce0_d_pins[] = { 0x57, };
>> +static int jz4780_ssi0_ce1_b_pins[] = { 0x35, };
>> +static int jz4780_ssi0_ce1_d_pins[] = { 0x55, };
>> +static int jz4780_ssi1_dt_b_pins[] = { 0x3d, };
>> +static int jz4780_ssi1_dt_d_pins[] = { 0x59, };
>> +static int jz4780_ssi1_dr_b_pins[] = { 0x34, };
>> +static int jz4780_ssi1_dr_d_pins[] = { 0x54, };
>> +static int jz4780_ssi1_clk_b_pins[] = { 0x3c, };
>> +static int jz4780_ssi1_clk_d_pins[] = { 0x58, };
>> +static int jz4780_ssi1_gpc_b_pins[] = { 0x3e, };
>> +static int jz4780_ssi1_gpc_d_pins[] = { 0x56, };
>> +static int jz4780_ssi1_ce0_b_pins[] = { 0x3f, };
>> +static int jz4780_ssi1_ce0_d_pins[] = { 0x57, };
>> +static int jz4780_ssi1_ce1_b_pins[] = { 0x35, };
>> +static int jz4780_ssi1_ce1_d_pins[] = { 0x55, };
>>  static int jz4780_mmc0_8bit_a_pins[] = { 0x04, 0x05, 0x06, 0x07, 
>> 0x18, };
>>  static int jz4780_i2c3_pins[] = { 0x6a, 0x6b, };
>>  static int jz4780_i2c4_e_pins[] = { 0x8c, 0x8d, };
>> @@ -906,6 +1077,39 @@ static int jz4780_hdmi_ddc_pins[] = { 0xb9, 
>> 0xb8, };
>>  static int jz4780_uart2_data_funcs[] = { 1, 1, };
>>  static int jz4780_uart2_hwflow_funcs[] = { 1, 1, };
>>  static int jz4780_uart4_data_funcs[] = { 2, 2, };
>> +static int jz4780_ssi0_dt_a_19_funcs[] = { 2, };
>> +static int jz4780_ssi0_dt_a_21_funcs[] = { 2, };
>> +static int jz4780_ssi0_dt_a_28_funcs[] = { 2, };
>> +static int jz4780_ssi0_dt_b_funcs[] = { 1, };
>> +static int jz4780_ssi0_dt_d_funcs[] = { 1, };
>> +static int jz4780_ssi0_dr_a_20_funcs[] = { 2, };
>> +static int jz4780_ssi0_dr_a_27_funcs[] = { 2, };
>> +static int jz4780_ssi0_dr_b_funcs[] = { 1, };
>> +static int jz4780_ssi0_dr_d_funcs[] = { 1, };
>> +static int jz4780_ssi0_clk_a_funcs[] = { 2, };
>> +static int jz4780_ssi0_clk_b_5_funcs[] = { 1, };
>> +static int jz4780_ssi0_clk_b_28_funcs[] = { 1, };
>> +static int jz4780_ssi0_clk_d_funcs[] = { 1, };
>> +static int jz4780_ssi0_gpc_b_funcs[] = { 1, };
>> +static int jz4780_ssi0_gpc_d_funcs[] = { 1, };
>> +static int jz4780_ssi0_ce0_a_23_funcs[] = { 2, };
>> +static int jz4780_ssi0_ce0_a_25_funcs[] = { 2, };
>> +static int jz4780_ssi0_ce0_b_funcs[] = { 1, };
>> +static int jz4780_ssi0_ce0_d_funcs[] = { 1, };
>> +static int jz4780_ssi0_ce1_b_funcs[] = { 1, };
>> +static int jz4780_ssi0_ce1_d_funcs[] = { 1, };
>> +static int jz4780_ssi1_dt_b_funcs[] = { 2, };
>> +static int jz4780_ssi1_dt_d_funcs[] = { 2, };
>> +static int jz4780_ssi1_dr_b_funcs[] = { 2, };
>> +static int jz4780_ssi1_dr_d_funcs[] = { 2, };
>> +static int jz4780_ssi1_clk_b_funcs[] = { 2, };
>> +static int jz4780_ssi1_clk_d_funcs[] = { 2, };
>> +static int jz4780_ssi1_gpc_b_funcs[] = { 2, };
>> +static int jz4780_ssi1_gpc_d_funcs[] = { 2, };
>> +static int jz4780_ssi1_ce0_b_funcs[] = { 2, };
>> +static int jz4780_ssi1_ce0_d_funcs[] = { 2, };
>> +static int jz4780_ssi1_ce1_b_funcs[] = { 2, };
>> +static int jz4780_ssi1_ce1_d_funcs[] = { 2, };
>>  static int jz4780_mmc0_8bit_a_funcs[] = { 1, 1, 1, 1, 1, };
>>  static int jz4780_i2c3_funcs[] = { 1, 1, };
>>  static int jz4780_i2c4_e_funcs[] = { 1, 1, };
>> @@ -922,6 +1126,51 @@ static const struct group_desc jz4780_groups[] = {
>>      INGENIC_PIN_GROUP("uart3-data", jz4770_uart3_data),
>>      INGENIC_PIN_GROUP("uart3-hwflow", jz4770_uart3_hwflow),
>>      INGENIC_PIN_GROUP("uart4-data", jz4780_uart4_data),
>> +    INGENIC_PIN_GROUP("ssi0_dt_a_19", jz4780_ssi0_dt_a_19),
>> +    INGENIC_PIN_GROUP("ssi0_dt_a_21", jz4780_ssi0_dt_a_21),
>> +    INGENIC_PIN_GROUP("ssi0_dt_a_28", jz4780_ssi0_dt_a_28),
>> +    INGENIC_PIN_GROUP("ssi0_dt_b", jz4780_ssi0_dt_b),
>> +    INGENIC_PIN_GROUP("ssi0_dt_d", jz4780_ssi0_dt_d),
>> +    INGENIC_PIN_GROUP("ssi0_dt_e", jz4770_ssi0_dt_e),
>> +    INGENIC_PIN_GROUP("ssi0_dr_a_20", jz4780_ssi0_dr_a_20),
>> +    INGENIC_PIN_GROUP("ssi0_dr_a_27", jz4780_ssi0_dr_a_27),
>> +    INGENIC_PIN_GROUP("ssi0_dr_b", jz4780_ssi0_dr_b),
>> +    INGENIC_PIN_GROUP("ssi0_dr_d", jz4780_ssi0_dr_d),
>> +    INGENIC_PIN_GROUP("ssi0_dr_e", jz4770_ssi0_dr_e),
>> +    INGENIC_PIN_GROUP("ssi0_clk_a", jz4780_ssi0_clk_a),
>> +    INGENIC_PIN_GROUP("ssi0_clk_b_5", jz4780_ssi0_clk_b_5),
>> +    INGENIC_PIN_GROUP("ssi0_clk_b_28", jz4780_ssi0_clk_b_28),
>> +    INGENIC_PIN_GROUP("ssi0_clk_d", jz4780_ssi0_clk_d),
>> +    INGENIC_PIN_GROUP("ssi0_clk_e", jz4770_ssi0_clk_e),
>> +    INGENIC_PIN_GROUP("ssi0_gpc_b", jz4780_ssi0_gpc_b),
>> +    INGENIC_PIN_GROUP("ssi0_gpc_d", jz4780_ssi0_gpc_d),
>> +    INGENIC_PIN_GROUP("ssi0_gpc_e", jz4770_ssi0_gpc_e),
>> +    INGENIC_PIN_GROUP("ssi0_ce0_a_23", jz4780_ssi0_ce0_a_23),
>> +    INGENIC_PIN_GROUP("ssi0_ce0_a_25", jz4780_ssi0_ce0_a_25),
>> +    INGENIC_PIN_GROUP("ssi0_ce0_b", jz4780_ssi0_ce0_b),
>> +    INGENIC_PIN_GROUP("ssi0_ce0_d", jz4780_ssi0_ce0_d),
>> +    INGENIC_PIN_GROUP("ssi0_ce0_e", jz4770_ssi0_ce0_e),
>> +    INGENIC_PIN_GROUP("ssi0_ce1_b", jz4780_ssi0_ce1_b),
>> +    INGENIC_PIN_GROUP("ssi0_ce1_d", jz4780_ssi0_ce1_d),
>> +    INGENIC_PIN_GROUP("ssi0_ce1_e", jz4770_ssi0_ce1_e),
>> +    INGENIC_PIN_GROUP("ssi1_dt_b", jz4780_ssi1_dt_b),
>> +    INGENIC_PIN_GROUP("ssi1_dt_d", jz4780_ssi1_dt_d),
>> +    INGENIC_PIN_GROUP("ssi1_dt_e", jz4770_ssi1_dt_e),
>> +    INGENIC_PIN_GROUP("ssi1_dr_b", jz4780_ssi1_dr_b),
>> +    INGENIC_PIN_GROUP("ssi1_dr_d", jz4780_ssi1_dr_d),
>> +    INGENIC_PIN_GROUP("ssi1_dr_e", jz4770_ssi1_dr_e),
>> +    INGENIC_PIN_GROUP("ssi1_clk_b", jz4780_ssi1_clk_b),
>> +    INGENIC_PIN_GROUP("ssi1_clk_d", jz4780_ssi1_clk_d),
>> +    INGENIC_PIN_GROUP("ssi1_clk_e", jz4770_ssi1_clk_e),
>> +    INGENIC_PIN_GROUP("ssi1_gpc_b", jz4780_ssi1_gpc_b),
>> +    INGENIC_PIN_GROUP("ssi1_gpc_d", jz4780_ssi1_gpc_d),
>> +    INGENIC_PIN_GROUP("ssi1_gpc_e", jz4770_ssi1_gpc_e),
>> +    INGENIC_PIN_GROUP("ssi1_ce0_b", jz4780_ssi1_ce0_b),
>> +    INGENIC_PIN_GROUP("ssi1_ce0_d", jz4780_ssi1_ce0_d),
>> +    INGENIC_PIN_GROUP("ssi1_ce0_e", jz4770_ssi1_ce0_e),
>> +    INGENIC_PIN_GROUP("ssi1_ce1_b", jz4780_ssi1_ce1_b),
>> +    INGENIC_PIN_GROUP("ssi1_ce1_d", jz4780_ssi1_ce1_d),
>> +    INGENIC_PIN_GROUP("ssi1_ce1_e", jz4770_ssi1_ce1_e),
>>      INGENIC_PIN_GROUP("mmc0-1bit-a", jz4770_mmc0_1bit_a),
>>      INGENIC_PIN_GROUP("mmc0-4bit-a", jz4770_mmc0_4bit_a),
>>      INGENIC_PIN_GROUP("mmc0-8bit-a", jz4780_mmc0_8bit_a),
>> @@ -969,6 +1218,22 @@ static const struct group_desc jz4780_groups[] = {
>>
>>  static const char *jz4780_uart2_groups[] = { "uart2-data", 
>> "uart2-hwflow", };
>>  static const char *jz4780_uart4_groups[] = { "uart4-data", };
>> +static const char *jz4780_ssi0_groups[] = {
>> +    "ssi0_dt_a_19", "ssi0_dt_a_21", "ssi0_dt_a_28", "ssi0_dt_b", 
>> "ssi0_dt_d", "ssi0_dt_e",
>> +    "ssi0_dr_a_20", "ssi0_dr_a_27", "ssi0_dr_b", "ssi0_dr_d", 
>> "ssi0_dr_e",
>> +    "ssi0_clk_a", "ssi0_clk_b_5", "ssi0_clk_b_28", "ssi0_clk_d", 
>> "ssi0_clk_e",
>> +    "ssi0_gpc_b", "ssi0_gpc_d", "ssi0_gpc_e",
>> +    "ssi0_ce0_a_23", "ssi0_ce0_a_25", "ssi0_ce0_b", "ssi0_ce0_d", 
>> "ssi0_ce0_e",
>> +    "ssi0_ce1_b", "ssi0_ce1_d", "ssi0_ce1_e",
>> +};
>> +static const char *jz4780_ssi1_groups[] = {
>> +    "ssi1_dt_b", "ssi1_dt_d", "ssi1_dt_e",
>> +    "ssi1_dr_b", "ssi1_dr_d", "ssi1_dr_e",
>> +    "ssi1_clk_b", "ssi1_clk_d", "ssi1_clk_e",
>> +    "ssi1_gpc_b", "ssi1_gpc_d", "ssi1_gpc_e",
>> +    "ssi1_ce0_b", "ssi1_ce0_d", "ssi1_ce0_e",
>> +    "ssi1_ce1_b", "ssi1_ce1_d", "ssi1_ce1_e",
>> +};
>>  static const char *jz4780_mmc0_groups[] = {
>>      "mmc0-1bit-a", "mmc0-4bit-a", "mmc0-8bit-a",
>>      "mmc0-1bit-e", "mmc0-4bit-e",
>> @@ -994,6 +1259,8 @@ static const struct function_desc 
>> jz4780_functions[] = {
>>      { "uart2", jz4780_uart2_groups, ARRAY_SIZE(jz4780_uart2_groups), },
>>      { "uart3", jz4770_uart3_groups, ARRAY_SIZE(jz4770_uart3_groups), },
>>      { "uart4", jz4780_uart4_groups, ARRAY_SIZE(jz4780_uart4_groups), },
>> +    { "ssi0", jz4780_ssi0_groups, ARRAY_SIZE(jz4780_ssi0_groups), },
>> +    { "ssi1", jz4780_ssi1_groups, ARRAY_SIZE(jz4780_ssi1_groups), },
>>      { "mmc0", jz4780_mmc0_groups, ARRAY_SIZE(jz4780_mmc0_groups), },
>>      { "mmc1", jz4780_mmc1_groups, ARRAY_SIZE(jz4780_mmc1_groups), },
>>      { "mmc2", jz4780_mmc2_groups, ARRAY_SIZE(jz4780_mmc2_groups), },
>> -- 
>> 2.11.0
>>
>
