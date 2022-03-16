Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDEF44DB55C
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Mar 2022 16:53:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237471AbiCPPyZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Mar 2022 11:54:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240847AbiCPPyW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Mar 2022 11:54:22 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D35D17E0D;
        Wed, 16 Mar 2022 08:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1647445987; x=1678981987;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ytX2SFvM53HE0N3pYke/nVlK3T7iEr7di47zL9BakSQ=;
  b=ntSXzeCrFQlF+fNsrIQBnsllg3kABjFx14Wg3lqY9hom/5qFEefcQulu
   q8hvcipD68+0UsLrCAF0SG7TLIZoVoD/zx249jdQtRHQjqPYuRcIgUfbO
   K4uWtjpPBWJoSKlMlwbiE4a175BNx444QFAI7PbPkI0I/2Jcd9CC177Uy
   E=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 16 Mar 2022 08:53:06 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2022 08:53:06 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 16 Mar 2022 08:53:05 -0700
Received: from [10.216.40.72] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 16 Mar
 2022 08:52:59 -0700
Message-ID: <0b68bc4c-62e3-d40f-3114-0c6864c01f1a@quicinc.com>
Date:   Wed, 16 Mar 2022 21:22:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v11 4/7] pinctrl: qcom: Update lpi pin group custiom
 functions with framework generic functions
Content-Language: en-US
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     <agross@kernel.org>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
        <robh+dt@kernel.org>, <quic_plai@quicinc.com>,
        <bgoswami@codeaurora.org>, <perex@perex.cz>, <tiwai@suse.com>,
        <srinivas.kandagatla@linaro.org>, <rohitkr@codeaurora.org>,
        <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <swboyd@chromium.org>, <judyhsiao@chromium.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>,
        Venkata Prasad Potturu <quic_potturu@quicinc.com>
References: <1647359413-31662-1-git-send-email-quic_srivasam@quicinc.com>
 <1647359413-31662-5-git-send-email-quic_srivasam@quicinc.com>
 <YjDCs9AEJTJNIawj@builder.lan>
From:   Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Organization: Qualcomm
In-Reply-To: <YjDCs9AEJTJNIawj@builder.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 3/15/2022 10:15 PM, Bjorn Andersson wrote:
Thanks for your time Bjorn!!!
> On Tue 15 Mar 10:50 CDT 2022, Srinivasa Rao Mandadapu wrote:
>
>> Update custom pin group structure members with framework generic group_desc structure
>> and replace the driver's custom pinctrl_ops with framework provided generic pin control
>> group functions to avoid redundant code written in lpass lpi driver.
>>
>> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
>> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
>> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
>> ---
>>   drivers/pinctrl/qcom/Kconfig             |  1 +
>>   drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 98 +++++++++++++++-----------------
>>   2 files changed, 48 insertions(+), 51 deletions(-)
>>
>> diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
>> index ca6f68a..31c4aa6 100644
>> --- a/drivers/pinctrl/qcom/Kconfig
>> +++ b/drivers/pinctrl/qcom/Kconfig
>> @@ -351,6 +351,7 @@ config PINCTRL_LPASS_LPI
>>   	select PINMUX
>>   	select PINCONF
>>   	select GENERIC_PINCONF
>> +	select GENERIC_PINCTRL_GROUPS
>>   	depends on GPIOLIB
>>   	help
>>   	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
>> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>> index 3c15f80..5e27a38 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>> +++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>> @@ -51,11 +51,11 @@
>>   
>>   #define LPI_PINGROUP(id, soff, f1, f2, f3, f4)		\
>>   	{						\
>> -		.name = "gpio" #id,			\
>> -		.pins = gpio##id##_pins,		\
>> +		.group.name = "gpio" #id,			\
>> +		.group.pins = gpio##id##_pins,		\
>>   		.pin = id,				\
>>   		.slew_offset = soff,			\
>> -		.npins = ARRAY_SIZE(gpio##id##_pins),	\
>> +		.group.num_pins = ARRAY_SIZE(gpio##id##_pins),	\
>>   		.funcs = (int[]){			\
>>   			LPI_MUX_gpio,			\
>>   			LPI_MUX_##f1,			\
>> @@ -67,9 +67,7 @@
>>   	}
>>   
>>   struct lpi_pingroup {
>> -	const char *name;
>> -	const unsigned int *pins;
>> -	unsigned int npins;
>> +	struct group_desc group;
>>   	unsigned int pin;
>>   	/* Bit offset in slew register for SoundWire pins only */
>>   	int slew_offset;
>> @@ -150,20 +148,20 @@ enum sm8250_lpi_functions {
>>   	LPI_MUX__,
>>   };
>>   
>> -static const unsigned int gpio0_pins[] = { 0 };
>> -static const unsigned int gpio1_pins[] = { 1 };
>> -static const unsigned int gpio2_pins[] = { 2 };
>> -static const unsigned int gpio3_pins[] = { 3 };
>> -static const unsigned int gpio4_pins[] = { 4 };
>> -static const unsigned int gpio5_pins[] = { 5 };
>> -static const unsigned int gpio6_pins[] = { 6 };
>> -static const unsigned int gpio7_pins[] = { 7 };
>> -static const unsigned int gpio8_pins[] = { 8 };
>> -static const unsigned int gpio9_pins[] = { 9 };
>> -static const unsigned int gpio10_pins[] = { 10 };
>> -static const unsigned int gpio11_pins[] = { 11 };
>> -static const unsigned int gpio12_pins[] = { 12 };
>> -static const unsigned int gpio13_pins[] = { 13 };
>> +static int gpio0_pins[] = { 0 };
>> +static int gpio1_pins[] = { 1 };
>> +static int gpio2_pins[] = { 2 };
>> +static int gpio3_pins[] = { 3 };
>> +static int gpio4_pins[] = { 4 };
>> +static int gpio5_pins[] = { 5 };
>> +static int gpio6_pins[] = { 6 };
>> +static int gpio7_pins[] = { 7 };
>> +static int gpio8_pins[] = { 8 };
>> +static int gpio9_pins[] = { 9 };
>> +static int gpio10_pins[] = { 10 };
>> +static int gpio11_pins[] = { 11 };
>> +static int gpio12_pins[] = { 12 };
>> +static int gpio13_pins[] = { 13 };
>>   static const char * const swr_tx_clk_groups[] = { "gpio0" };
>>   static const char * const swr_tx_data_groups[] = { "gpio1", "gpio2", "gpio5" };
>>   static const char * const swr_rx_clk_groups[] = { "gpio3" };
>> @@ -250,38 +248,10 @@ static int lpi_gpio_write(struct lpi_pinctrl *state, unsigned int pin,
>>   	return 0;
>>   }
>>   
>> -static int lpi_gpio_get_groups_count(struct pinctrl_dev *pctldev)
>> -{
>> -	struct lpi_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
>> -
>> -	return pctrl->data->ngroups;
>> -}
>> -
>> -static const char *lpi_gpio_get_group_name(struct pinctrl_dev *pctldev,
>> -					   unsigned int group)
>> -{
>> -	struct lpi_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
>> -
>> -	return pctrl->data->groups[group].name;
>> -}
>> -
>> -static int lpi_gpio_get_group_pins(struct pinctrl_dev *pctldev,
>> -				   unsigned int group,
>> -				   const unsigned int **pins,
>> -				   unsigned int *num_pins)
>> -{
>> -	struct lpi_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
>> -
>> -	*pins = pctrl->data->groups[group].pins;
>> -	*num_pins = pctrl->data->groups[group].npins;
>> -
>> -	return 0;
>> -}
>> -
>>   static const struct pinctrl_ops lpi_gpio_pinctrl_ops = {
>> -	.get_groups_count	= lpi_gpio_get_groups_count,
>> -	.get_group_name		= lpi_gpio_get_group_name,
>> -	.get_group_pins		= lpi_gpio_get_group_pins,
>> +	.get_groups_count	= pinctrl_generic_get_group_count,
>> +	.get_group_name		= pinctrl_generic_get_group_name,
>> +	.get_group_pins		= pinctrl_generic_get_group_pins,
>>   	.dt_node_to_map		= pinconf_generic_dt_node_to_map_group,
>>   	.dt_free_map		= pinctrl_utils_free_map,
>>   };
>> @@ -582,6 +552,28 @@ static const struct gpio_chip lpi_gpio_template = {
>>   	.dbg_show		= lpi_gpio_dbg_show,
>>   };
>>   
>> +static int lpi_build_pin_desc_groups(struct lpi_pinctrl *pctrl)
>> +{
>> +	struct group_desc *lpi_groups;
>> +	int i;
>> +
>> +	lpi_groups = devm_kcalloc(pctrl->dev, pctrl->data->npins,
>> +					 sizeof(*lpi_groups), GFP_KERNEL);
>> +	if (!lpi_groups)
>> +		return -ENOMEM;
>> +
>> +	for (i = 0; i < pctrl->data->npins; i++) {
>> +		const struct pinctrl_pin_desc *pin_info = pctrl->desc.pins + i;
>> +		struct group_desc *group = lpi_groups + i;
>> +
>> +		group->name = pin_info->name;
>> +		group->pins = (int *)&pin_info->number;
>> +		pinctrl_generic_add_group(pctrl->ctrl, group->name, group->pins, 1, NULL);
> I've not used this generic interface before, but I believe you need to
> pair your add with pinctrl_generic_remove_group(), both in error paths
> and driver remove.
Okay. Will add pinctrl_generic_remove_group() accordingly.
>
> Makes me wonder about the usefulness of this, as you will end up with
> a bit more code than you remove and you have the additional heap
> allocation. Feels like I'm missing something...
Here Heap allocation can be avoided.  will do accordingly and re post.
>
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   static int lpi_pinctrl_probe(struct platform_device *pdev)
>>   {
>>   	const struct lpi_pinctrl_variant_data *data;
>> @@ -647,6 +639,10 @@ static int lpi_pinctrl_probe(struct platform_device *pdev)
>>   		goto err_pinctrl;
>>   	}
>>   
>> +	ret = lpi_build_pin_desc_groups(pctrl);
>> +	if (ret)
>> +		return ret;
> A few lines up the code does error handling by goto err_pinctrl, you
> should do the same.
Okay. will update accordingly.
>
> Regards,
> Bjorn
>
>> +
>>   	ret = devm_gpiochip_add_data(dev, &pctrl->chip, pctrl);
>>   	if (ret) {
>>   		dev_err(pctrl->dev, "can't add gpio chip\n");
>> -- 
>> 2.7.4
>>
