Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1948425EF3D
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Sep 2020 19:09:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725841AbgIFRJy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 6 Sep 2020 13:09:54 -0400
Received: from out28-196.mail.aliyun.com ([115.124.28.196]:34726 "EHLO
        out28-196.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725816AbgIFRJy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 6 Sep 2020 13:09:54 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07436282|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0718977-0.000974892-0.927127;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03275;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=10;RT=10;SR=0;TI=SMTPD_---.ITZ2GFG_1599412188;
Received: from 192.168.178.128(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.ITZ2GFG_1599412188)
          by smtp.aliyun-inc.com(10.147.41.187);
          Mon, 07 Sep 2020 01:09:49 +0800
Subject: Re: [PATCH v2 1/3] pinctrl: Ingenic: Add SSI pins support for JZ4770
 and JZ4780.
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, aric.pzqi@ingenic.com,
        dongsheng.qiu@ingenic.com, rick.tyliu@ingenic.com,
        yanfei.li@ingenic.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com
References: <20200831154324.64951-1-zhouyanjie@wanyeetech.com>
 <20200831154324.64951-2-zhouyanjie@wanyeetech.com>
 <1QY4GQ.ER1P2TWMJCKH@crapouillou.net> <NDQ8GQ.2F1QH5XYPGSV1@crapouillou.net>
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <0bdd7132-cdbf-02eb-0078-ec644b6611ca@wanyeetech.com>
Date:   Mon, 7 Sep 2020 01:09:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <NDQ8GQ.2F1QH5XYPGSV1@crapouillou.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Paul,

在 2020/9/6 下午10:17, Paul Cercueil 写道:
> Hi Zhou,
>
> Le ven. 4 sept. 2020 à 15:27, Paul Cercueil <paul@crapouillou.net> a 
> écrit :
>> Hi Zhou,
>>
>> Le lun. 31 août 2020 à 23:43, 周琰杰 (Zhou Yanjie) 
>> <zhouyanjie@wanyeetech.com> a écrit :
>>> Add SSI pins support for the JZ4770 SoC and the
>>> JZ4780 SoC from Ingenic.
>>>
>>> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>>> ---
>>>
>>> Notes:
>>>     v1->v2:
>>>     Rebase on top of kernel 5.9-rc3.
>>>
>>>  drivers/pinctrl/pinctrl-ingenic.c | 267 
>>> ++++++++++++++++++++++++++++++++++++++
>>>  1 file changed, 267 insertions(+)
>>>
>>> diff --git a/drivers/pinctrl/pinctrl-ingenic.c 
>>> b/drivers/pinctrl/pinctrl-ingenic.c
>>> index a8d1b53ec4c1..00f29fd684fa 100644
>>> --- a/drivers/pinctrl/pinctrl-ingenic.c
>>> +++ b/drivers/pinctrl/pinctrl-ingenic.c
>>> @@ -633,6 +633,46 @@ static int jz4770_uart2_data_pins[] = { 0x5c, 
>>> 0x5e, };
>>>  static int jz4770_uart2_hwflow_pins[] = { 0x5d, 0x5f, };
>>>  static int jz4770_uart3_data_pins[] = { 0x6c, 0x85, };
>>>  static int jz4770_uart3_hwflow_pins[] = { 0x88, 0x89, };
>>> +static int jz4770_ssi0_dt_a_pins[] = { 0x15, };
>>> +static int jz4770_ssi0_dt_b_pins[] = { 0x35, };
>>> +static int jz4770_ssi0_dt_d_pins[] = { 0x55, };
>>> +static int jz4770_ssi0_dt_e_pins[] = { 0x71, };
>>> +static int jz4770_ssi0_dr_a_pins[] = { 0x14, };
>>> +static int jz4770_ssi0_dr_b_pins[] = { 0x34, };
>>> +static int jz4770_ssi0_dr_d_pins[] = { 0x54, };
>>> +static int jz4770_ssi0_dr_e_pins[] = { 0x6e, };
>>> +static int jz4770_ssi0_clk_a_pins[] = { 0x12, };
>>> +static int jz4770_ssi0_clk_b_pins[] = { 0x3c, };
>>> +static int jz4770_ssi0_clk_d_pins[] = { 0x58, };
>>> +static int jz4770_ssi0_clk_e_pins[] = { 0x6f, };
>>> +static int jz4770_ssi0_gpc_b_pins[] = { 0x3e, };
>>> +static int jz4770_ssi0_gpc_d_pins[] = { 0x56, };
>>> +static int jz4770_ssi0_gpc_e_pins[] = { 0x73, };
>>> +static int jz4770_ssi0_ce0_a_pins[] = { 0x13, };
>>> +static int jz4770_ssi0_ce0_b_pins[] = { 0x3d, };
>>> +static int jz4770_ssi0_ce0_d_pins[] = { 0x59, };
>>> +static int jz4770_ssi0_ce0_e_pins[] = { 0x70, };
>>> +static int jz4770_ssi0_ce1_b_pins[] = { 0x3f, };
>>> +static int jz4770_ssi0_ce1_d_pins[] = { 0x57, };
>>> +static int jz4770_ssi0_ce1_e_pins[] = { 0x72, };
>>> +static int jz4770_ssi1_dt_b_pins[] = { 0x35, };
>>> +static int jz4770_ssi1_dt_d_pins[] = { 0x55, };
>>> +static int jz4770_ssi1_dt_e_pins[] = { 0x71, };
>>> +static int jz4770_ssi1_dr_b_pins[] = { 0x34, };
>>> +static int jz4770_ssi1_dr_d_pins[] = { 0x54, };
>>> +static int jz4770_ssi1_dr_e_pins[] = { 0x6e, };
>>> +static int jz4770_ssi1_clk_b_pins[] = { 0x3c, };
>>> +static int jz4770_ssi1_clk_d_pins[] = { 0x58, };
>>> +static int jz4770_ssi1_clk_e_pins[] = { 0x6f, };
>>> +static int jz4770_ssi1_gpc_b_pins[] = { 0x3e, };
>>> +static int jz4770_ssi1_gpc_d_pins[] = { 0x56, };
>>> +static int jz4770_ssi1_gpc_e_pins[] = { 0x73, };
>>> +static int jz4770_ssi1_ce0_b_pins[] = { 0x3d, };
>>> +static int jz4770_ssi1_ce0_d_pins[] = { 0x59, };
>>> +static int jz4770_ssi1_ce0_e_pins[] = { 0x70, };
>>> +static int jz4770_ssi1_ce1_b_pins[] = { 0x3f, };
>>> +static int jz4770_ssi1_ce1_d_pins[] = { 0x57, };
>>> +static int jz4770_ssi1_ce1_e_pins[] = { 0x72, };
>>>  static int jz4770_mmc0_1bit_a_pins[] = { 0x12, 0x13, 0x14, };
>>>  static int jz4770_mmc0_4bit_a_pins[] = { 0x15, 0x16, 0x17, };
>>>  static int jz4770_mmc0_1bit_e_pins[] = { 0x9c, 0x9d, 0x94, };
>>> @@ -703,6 +743,46 @@ static int jz4770_uart2_data_funcs[] = { 0, 0, };
>>>  static int jz4770_uart2_hwflow_funcs[] = { 0, 0, };
>>>  static int jz4770_uart3_data_funcs[] = { 0, 1, };
>>>  static int jz4770_uart3_hwflow_funcs[] = { 0, 0, };
>>> +static int jz4770_ssi0_dt_a_funcs[] = { 2, };
>>> +static int jz4770_ssi0_dt_b_funcs[] = { 1, };
>>> +static int jz4770_ssi0_dt_d_funcs[] = { 1, };
>>> +static int jz4770_ssi0_dt_e_funcs[] = { 0, };
>>> +static int jz4770_ssi0_dr_a_funcs[] = { 1, };
>>> +static int jz4770_ssi0_dr_b_funcs[] = { 1, };
>>> +static int jz4770_ssi0_dr_d_funcs[] = { 1, };
>>> +static int jz4770_ssi0_dr_e_funcs[] = { 0, };
>>> +static int jz4770_ssi0_clk_a_funcs[] = { 2, };
>>> +static int jz4770_ssi0_clk_b_funcs[] = { 1, };
>>> +static int jz4770_ssi0_clk_d_funcs[] = { 1, };
>>> +static int jz4770_ssi0_clk_e_funcs[] = { 0, };
>>> +static int jz4770_ssi0_gpc_b_funcs[] = { 1, };
>>> +static int jz4770_ssi0_gpc_d_funcs[] = { 1, };
>>> +static int jz4770_ssi0_gpc_e_funcs[] = { 0, };
>>> +static int jz4770_ssi0_ce0_a_funcs[] = { 2, };
>>> +static int jz4770_ssi0_ce0_b_funcs[] = { 1, };
>>> +static int jz4770_ssi0_ce0_d_funcs[] = { 1, };
>>> +static int jz4770_ssi0_ce0_e_funcs[] = { 0, };
>>> +static int jz4770_ssi0_ce1_b_funcs[] = { 1, };
>>> +static int jz4770_ssi0_ce1_d_funcs[] = { 1, };
>>> +static int jz4770_ssi0_ce1_e_funcs[] = { 0, };
>>> +static int jz4770_ssi1_dt_b_funcs[] = { 2, };
>>> +static int jz4770_ssi1_dt_d_funcs[] = { 2, };
>>> +static int jz4770_ssi1_dt_e_funcs[] = { 1, };
>>> +static int jz4770_ssi1_dr_b_funcs[] = { 2, };
>>> +static int jz4770_ssi1_dr_d_funcs[] = { 2, };
>>> +static int jz4770_ssi1_dr_e_funcs[] = { 1, };
>>> +static int jz4770_ssi1_clk_b_funcs[] = { 2, };
>>> +static int jz4770_ssi1_clk_d_funcs[] = { 2, };
>>> +static int jz4770_ssi1_clk_e_funcs[] = { 1, };
>>> +static int jz4770_ssi1_gpc_b_funcs[] = { 2, };
>>> +static int jz4770_ssi1_gpc_d_funcs[] = { 2, };
>>> +static int jz4770_ssi1_gpc_e_funcs[] = { 1, };
>>> +static int jz4770_ssi1_ce0_b_funcs[] = { 2, };
>>> +static int jz4770_ssi1_ce0_d_funcs[] = { 2, };
>>> +static int jz4770_ssi1_ce0_e_funcs[] = { 1, };
>>> +static int jz4770_ssi1_ce1_b_funcs[] = { 2, };
>>> +static int jz4770_ssi1_ce1_d_funcs[] = { 2, };
>>> +static int jz4770_ssi1_ce1_e_funcs[] = { 1, };
>>>  static int jz4770_mmc0_1bit_a_funcs[] = { 1, 1, 0, };
>>>  static int jz4770_mmc0_4bit_a_funcs[] = { 1, 1, 1, };
>>>  static int jz4770_mmc0_1bit_e_funcs[] = { 0, 0, 0, };
>>> @@ -763,6 +843,46 @@ static const struct group_desc jz4770_groups[] 
>>> = {
>>>      INGENIC_PIN_GROUP("uart2-hwflow", jz4770_uart2_hwflow),
>>>      INGENIC_PIN_GROUP("uart3-data", jz4770_uart3_data),
>>>      INGENIC_PIN_GROUP("uart3-hwflow", jz4770_uart3_hwflow),
>>> +    INGENIC_PIN_GROUP("ssi0-dt-a", jz4770_ssi0_dt_a),
>>> +    INGENIC_PIN_GROUP("ssi0-dt-b", jz4770_ssi0_dt_b),
>>> +    INGENIC_PIN_GROUP("ssi0-dt-d", jz4770_ssi0_dt_d),
>>> +    INGENIC_PIN_GROUP("ssi0-dt-e", jz4770_ssi0_dt_e),
>>> +    INGENIC_PIN_GROUP("ssi0-dr-a", jz4770_ssi0_dr_a),
>>> +    INGENIC_PIN_GROUP("ssi0-dr-b", jz4770_ssi0_dr_b),
>>> +    INGENIC_PIN_GROUP("ssi0-dr-d", jz4770_ssi0_dr_d),
>>> +    INGENIC_PIN_GROUP("ssi0-dr-e", jz4770_ssi0_dr_e),
>>
>> The common acronyms associated with SPI are MISO / MOSI, I think it 
>> would make sense to use them instead of DR / DT. What do you think?
>
> Just noticed that the X1000 has already SPI pins named DR / DT, so 
> disregard my comment, it's better to use the same name convention 
> across the whole file.
>

If necessary, I can send a patch to replace the dt/dr in X1000 and 
X1830. What is your opinion?

Thanks and best regards!

> So:
> Reviewed-by: Paul Cercueil <paul@crapouillou.net>
>
> Cheers,
> -Paul
>
