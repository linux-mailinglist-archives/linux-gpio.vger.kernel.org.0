Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89315D289B
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Oct 2019 14:02:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727917AbfJJMCn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Oct 2019 08:02:43 -0400
Received: from mail-sz.amlogic.com ([211.162.65.117]:56402 "EHLO
        mail-sz.amlogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727320AbfJJMCn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Oct 2019 08:02:43 -0400
Received: from [10.28.18.45] (10.28.18.45) by mail-sz.amlogic.com (10.28.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 10 Oct
 2019 20:02:43 +0800
Subject: Re: [PATCH v2 2/3] pinctrl: meson-a1: add pinctrl driver for Meson A1
 Soc
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>
CC:     Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Carlo Caione <carlo@caione.org>,
        Rob Herring <robh+dt@kernel.org>,
        Xingyu Chen <xingyu.chen@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Hanjie Lin <hanjie.lin@amlogic.com>,
        Mark Rutland <mark.rutland@arm.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <1570532999-23302-1-git-send-email-qianggui.song@amlogic.com>
 <1570532999-23302-3-git-send-email-qianggui.song@amlogic.com>
 <cca24aa5-07dc-f2d6-885a-09bc8e20b3b6@baylibre.com>
From:   Qianggui Song <qianggui.song@amlogic.com>
Message-ID: <a41f0685-a42c-b21c-d0be-e0e1c3ae7c8f@amlogic.com>
Date:   Thu, 10 Oct 2019 20:02:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <cca24aa5-07dc-f2d6-885a-09bc8e20b3b6@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.28.18.45]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,Neil

On 2019/10/8 21:07, Neil Armstrong wrote:
> Hi,
> 
> On 08/10/2019 13:09, Qianggui Song wrote:
>> Add pinctrl driver for Meson A1 Soc which share the same register layout of
>> pinmux with previous Meson-G12A, however there is difference for gpio
>> and pin config register in A1.The main difference is that registers before A1
>> are grouped by function while those of A1 are by bank. The new register layout
>> is as below:
>>
>> /* first bank */	      /* addr */
>> - P_PADCTRL_GPIOP_I         base + 0x00 << 2
>> - P_PADCTRL_GPIOP_O         base + 0x01 << 2
>> - P_PADCTRL_GPIOP_OEN       base + 0x02 << 2
>> - P_PADCTRL_GPIOP_PULL_EN   base + 0x03 << 2
>> - P_PADCTRL_GPIOP_PULL_UP   base + 0x04 << 2
>> - P_PADCTRL_GPIOP_DS        base + 0x05 << 2
>>
>> /* second bank */
>> - P_PADCTRL_GPIOB_I         base + 0x10 << 2
>> - P_PADCTRL_GPIOB_O         base + 0x11 << 2
>> - P_PADCTRL_GPIOB_OEN       base + 0x12 << 2
>> - P_PADCTRL_GPIOB_PULL_EN   base + 0x13 << 2
>> - P_PADCTRL_GPIOB_PULL_UP   base + 0x14 << 2
>> - P_PADCTRL_GPIOB_DS        base + 0x15 << 2
>>
>> Each bank contains at least 6 registers to be configured, if one bank has
>> more than 16 gpios, an extra P_PADCTRL_GPIO[X]_DS_EXT is included. Between
>> two adjacent P_PADCTRL_GPIO[X]_I, there is an offset 0x10, that is to say,
>> for third bank, the offsets will be 0x20,0x21,0x22,0x23,0x24,0x25 according
>> to above register layout.For privous chips, registers are grouped
>> according to their functions while registers of A1 are according to bank.
>>
>> Current Meson pinctrl driver can cover such change by using base address of
>> GPIO as that of drive-strength. While simply giving reg_ds = reg_pullen
>> make wrong value to reg_ds for Socs that do not support drive-strength like
>> AXG.To make things simple, add an extra dt parser function for a1 or later chip
>> and remain the old dt parser function for old Socs.
>>
>> Also note that there is no AO bank in A1.
>>
>> Signed-off-by: Qianggui Song <qianggui.song@amlogic.com>
>> ---
>>  drivers/pinctrl/meson/Kconfig            |   6 +
>>  drivers/pinctrl/meson/Makefile           |   1 +
>>  drivers/pinctrl/meson/pinctrl-meson-a1.c | 942 +++++++++++++++++++++++++++++++
>>  drivers/pinctrl/meson/pinctrl-meson.c    |  16 +-
>>  drivers/pinctrl/meson/pinctrl-meson.h    |   5 +
>>  5 files changed, 969 insertions(+), 1 deletion(-)
>>  create mode 100644 drivers/pinctrl/meson/pinctrl-meson-a1.c
>>
> 
> [...]
> 
>> --- a/drivers/pinctrl/meson/pinctrl-meson.c
>> +++ b/drivers/pinctrl/meson/pinctrl-meson.c
>> @@ -695,6 +695,17 @@ static int meson_pinctrl_parse_dt(struct meson_pinctrl *pc,
>>  	return 0;
>>  }
>>  
>> +int meson_pinctrl_parse_dt_extra(struct meson_pinctrl *pc,
>> +				 struct device_node *node)
>> +{
>> +	int ret;
>> +
>> +	ret = meson_pinctrl_parse_dt(pc, node);
>> +	pc->reg_ds = pc->reg_pullen;
>> +
>> +	return ret;
>> +}
>> +
>>  int meson_pinctrl_probe(struct platform_device *pdev)
>>  {
>>  	struct device *dev = &pdev->dev;
>> @@ -708,7 +719,10 @@ int meson_pinctrl_probe(struct platform_device *pdev)
>>  	pc->dev = dev;
>>  	pc->data = (struct meson_pinctrl_data *) of_device_get_match_data(dev);
>>  
>> -	ret = meson_pinctrl_parse_dt(pc, dev->of_node);
>> +	if (pc->data->parse_dt)
>> +		ret = pc->data->parse_dt(pc, dev->of_node);
>> +	else
>> +		ret = meson_pinctrl_parse_dt(pc, dev->of_node);
>>  	if (ret)
>>  		return ret;
>>  
>> diff --git a/drivers/pinctrl/meson/pinctrl-meson.h b/drivers/pinctrl/meson/pinctrl-meson.h
>> index c696f3241a36..ca29efd90aac 100644
>> --- a/drivers/pinctrl/meson/pinctrl-meson.h
>> +++ b/drivers/pinctrl/meson/pinctrl-meson.h
>> @@ -11,6 +11,7 @@
>>  #include <linux/regmap.h>
>>  #include <linux/types.h>
>>  
>> +struct meson_pinctrl;
>>  /**
>>   * struct meson_pmx_group - a pinmux group
>>   *
>> @@ -114,6 +115,7 @@ struct meson_pinctrl_data {
>>  	unsigned int num_banks;
>>  	const struct pinmux_ops *pmx_ops;
>>  	void *pmx_data;
>> +	int (*parse_dt) (struct meson_pinctrl *pc, struct device_node *node);
>>  };
>>  
>>  struct meson_pinctrl {
>> @@ -171,3 +173,6 @@ int meson_pmx_get_groups(struct pinctrl_dev *pcdev,
>>  
>>  /* Common probe function */
>>  int meson_pinctrl_probe(struct platform_device *pdev);
>> +/* Extra dt parser function for register layout grouped by bank */
>> +int meson_pinctrl_parse_dt_extra(struct meson_pinctrl *pc,
>> +				 struct device_node *node);
>>
> 
> I think you should add this parse_dt callback in a separate patch.
> 
> Neil
> 
> .
> 
OK, will do it in the next patch set.
