Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 353FA1F47A6
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2020 22:01:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732426AbgFIUBL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Jun 2020 16:01:11 -0400
Received: from smtp04.smtpout.orange.fr ([80.12.242.126]:51666 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725926AbgFIUBK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Jun 2020 16:01:10 -0400
Received: from [192.168.42.210] ([93.23.15.116])
        by mwinf5d07 with ME
        id p8132200H2WEZud03814Fy; Tue, 09 Jun 2020 22:01:06 +0200
X-ME-Helo: [192.168.42.210]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 09 Jun 2020 22:01:06 +0200
X-ME-IP: 93.23.15.116
Subject: Re: [PATCH] Revert "pinctrl: freescale: imx: Use 'devm_of_iomap()' to
 avoid a resource leak in case of error in 'imx_pinctrl_probe()'"
To:     Aisheng Dong <aisheng.dong@nxp.com>,
        BOUGH CHEN <haibo.chen@nxp.com>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "stefan@agner.ch" <stefan@agner.ch>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Cc:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
References: <1591610401-12590-1-git-send-email-haibo.chen@nxp.com>
 <AM6PR04MB496691DDA4447CD5624EE6E680850@AM6PR04MB4966.eurprd04.prod.outlook.com>
From:   Marion & Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <6ee2a87d-b50b-7911-96ee-82049e1081e6@wanadoo.fr>
Date:   Tue, 9 Jun 2020 22:01:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <AM6PR04MB496691DDA4447CD5624EE6E680850@AM6PR04MB4966.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Le 08/06/2020 à 16:06, Aisheng Dong a écrit :
>> From: haibo.chen@nxp.com <haibo.chen@nxp.com>
>> Sent: Monday, June 8, 2020 6:00 PM
>>
>> This patch block system booting, find on imx7d-sdb board.
>>  From the dts we can see, iomux and iomux_lpsr share the memory region
>> [0x30330000-0x3033ffff], so will trigger the following issue:
>>
>> [    0.179561] imx7d-pinctrl 302c0000.iomuxc-lpsr: initialized IMX pinctrl
>> driver
>> [    0.191742] imx7d-pinctrl 30330000.pinctrl: can't request region for
>> resource [mem 0x30330000-0x3033ffff]
>> [    0.191842] imx7d-pinctrl: probe of 30330000.pinctrl failed with error -16
>>
>> This reverts commit ba403242615c2c99e27af7984b1650771a2cc2c9.
> Better add your sign-off.
> Otherwise:
> Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>

You can also add a "Apologies-From:" tag with my name :).
Sorry for this bogus patch.

CJ


> Maybe you or Christophe could resubmit another proper fix for the original issue.
>
> Regards
> Aisheng
>
>> ---
>>   drivers/pinctrl/freescale/pinctrl-imx.c | 7 +++----
>>   1 file changed, 3 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c
>> b/drivers/pinctrl/freescale/pinctrl-imx.c
>> index cb7e0f08d2cf..1f81569c7ae3 100644
>> --- a/drivers/pinctrl/freescale/pinctrl-imx.c
>> +++ b/drivers/pinctrl/freescale/pinctrl-imx.c
>> @@ -824,13 +824,12 @@ int imx_pinctrl_probe(struct platform_device *pdev,
>>   				return -EINVAL;
>>   			}
>>
>> -			ipctl->input_sel_base = devm_of_iomap(&pdev->dev, np,
>> -							      0, NULL);
>> +			ipctl->input_sel_base = of_iomap(np, 0);
>>   			of_node_put(np);
>> -			if (IS_ERR(ipctl->input_sel_base)) {
>> +			if (!ipctl->input_sel_base) {
>>   				dev_err(&pdev->dev,
>>   					"iomuxc input select base address not found\n");
>> -				return PTR_ERR(ipctl->input_sel_base);
>> +				return -ENOMEM;
>>   			}
>>   		}
>>   	}
>> --
>> 2.17.1
