Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54C43E1A8B
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2019 14:34:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733214AbfJWMdf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Oct 2019 08:33:35 -0400
Received: from mail-sz.amlogic.com ([211.162.65.117]:16838 "EHLO
        mail-sz.amlogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389633AbfJWMde (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Oct 2019 08:33:34 -0400
Received: from [10.28.18.45] (10.28.18.45) by mail-sz.amlogic.com (10.28.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Wed, 23 Oct
 2019 20:33:42 +0800
Subject: Re: [PATCH v3 2/4] pinctrl: meson: add a new dt parse callback for
 Meson-A series SoCs
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>
CC:     Neil Armstrong <narmstrong@baylibre.com>,
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
References: <1571050492-6598-1-git-send-email-qianggui.song@amlogic.com>
 <1571050492-6598-3-git-send-email-qianggui.song@amlogic.com>
 <1j4kzzvnrr.fsf@starbuckisacylon.baylibre.com>
From:   Qianggui Song <qianggui.song@amlogic.com>
Message-ID: <4e4aa76e-d315-2b99-91f4-6667eb5221e7@amlogic.com>
Date:   Wed, 23 Oct 2019 20:33:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1j4kzzvnrr.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.28.18.45]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 2019/10/23 17:01, Jerome Brunet wrote:
> 
> On Mon 14 Oct 2019 at 12:54, Qianggui Song <qianggui.song@amlogic.com> wrote:
> 
>> Meson A1 Soc share the same register layout of pinmux with previous
>> Meson-G12A, however there is difference for gpio and pin config register
>> in A1. The main difference is that registers before A1 are grouped by
>> function while those of A1 are by bank. The new register layout is as
>> below:
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
>> Each bank contains at least 6 registers to be configured, if one bank
>> has more than 16 gpios, an extra P_PADCTRL_GPIO[X]_DS_EXT is included.
>> Between two adjacent P_PADCTRL_GPIO[X]_I, there is an offset 0x10, that
>> is to say, for third bank, the offsets will be 0x20,0x21,0x22,0x23,0x24
>> ,0x25 according to above register layout. For previous chips, registers
>> are grouped according to their functions while registers of A1 are
>> according to bank.
>>
>> Current Meson pinctrl driver can cover such change by using base address
>> of GPIO as that of drive-strength.While simply giving reg_ds = reg_pullen
>> make wrong value to reg_ds for Socs that do not support drive-strength
>> like AXG.To make things simple, add an extra dt parser function for
>> a1 or later chip and remain the old dt parser function for old Socs.
>>
>> Signed-off-by: Qianggui Song <qianggui.song@amlogic.com>
>> ---
>>  drivers/pinctrl/meson/pinctrl-meson.c | 16 +++++++++++++++-
>>  drivers/pinctrl/meson/pinctrl-meson.h |  7 +++++++
>>  2 files changed, 22 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
>> index 8bba9d053d9f..e8f6298fc96a 100644
>> --- a/drivers/pinctrl/meson/pinctrl-meson.c
>> +++ b/drivers/pinctrl/meson/pinctrl-meson.c
>> @@ -695,6 +695,17 @@ static int meson_pinctrl_parse_dt(struct meson_pinctrl *pc,
>>  	return 0;
>>  }
>>  
>> +int meson_pinctrl_parse_dt_extra(struct meson_pinctrl *pc,
>> +				 struct device_node *node)
> 
> This function is the fixup for the a1 family, AFAICT.
> It should be named as such and it belong in pinctrl-meson-a1.c
> 
> Every controller performing fixups should have their function as well:
>  (1) AO of gxbb, gxl and axg 
>  (2) AO of g12 and sm
> 
OK, Will try to move this function to pinctrl-meson-a1.c. That should be
better than rewriting parse function for each chips EE/AO alone.
>> +{
>> +	int ret;
>> +
>> +	ret = meson_pinctrl_parse_dt(pc, node);
> 
> As said in previous review,  meson_pinctrl_parse_dt() should be called
> for every SoC to parse the *available* regions.
> 
> The fixup, if necessary, will be done by providing a callback
> 
> IOW, please:
>  * rework meson_pinctrl_parse_dt() to only parse the avaialble region
>  * don't call meson_pinctrl_parse_dt() from the extra function
>  * provided the extra function for the AO controllers of the other SoCs
> 
That means I need to move not only ao fixup but ds to extra function for
old chips do not support this.But it will touch other Socs, should I do
this in A1 pinctrl patchset? or do this rework in another patchset.
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
> 
> 
> 
>>  		return ret;
>>  
>> diff --git a/drivers/pinctrl/meson/pinctrl-meson.h b/drivers/pinctrl/meson/pinctrl-meson.h
>> index c696f3241a36..0cd6a869cae3 100644
>> --- a/drivers/pinctrl/meson/pinctrl-meson.h
>> +++ b/drivers/pinctrl/meson/pinctrl-meson.h
>> @@ -11,6 +11,8 @@
>>  #include <linux/regmap.h>
>>  #include <linux/types.h>
>>  
>> +struct meson_pinctrl;
>> +
>>  /**
>>   * struct meson_pmx_group - a pinmux group
>>   *
>> @@ -114,6 +116,7 @@ struct meson_pinctrl_data {
>>  	unsigned int num_banks;
>>  	const struct pinmux_ops *pmx_ops;
>>  	void *pmx_data;
>> +	int (*parse_dt)(struct meson_pinctrl *pc, struct device_node *node);
>>  };
>>  
>>  struct meson_pinctrl {
>> @@ -171,3 +174,7 @@ int meson_pmx_get_groups(struct pinctrl_dev *pcdev,
>>  
>>  /* Common probe function */
>>  int meson_pinctrl_probe(struct platform_device *pdev);
>> +
>> +/* Extra dt parse function for register layout grouped by bank */
>> +int meson_pinctrl_parse_dt_extra(struct meson_pinctrl *pc,
>> +				 struct device_node *node);
> 
> .
> 
