Return-Path: <linux-gpio+bounces-7329-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C49A902758
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2024 18:59:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D2EB1C20FA1
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2024 16:59:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D5741474AD;
	Mon, 10 Jun 2024 16:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="coekRUGy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2391EA8F
	for <linux-gpio@vger.kernel.org>; Mon, 10 Jun 2024 16:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718038754; cv=none; b=FBJfUGuBfVQk3L3MiVLSBYIgQFI/ygpMJT9dKPaV8B98fF58CKh54RlMBzBHKmjA9Nwk4vAwRxVDafxut6YwW4V2f/SqTxCWKIyYtxC51HWL2LmRCz50M6al2cb2mRybogib5OfyX7dNuB5DrnRRVPUZxQ9eXc96r7T7G78BNqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718038754; c=relaxed/simple;
	bh=l90dOxP0UjRDbMI8RAA7HmW05i5eREmoM0QaokN/SLg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AgqZaOcqzXIorGrL0+Qu9RqX/VVHZiW5IWQY5eCsl3O1CIuBrYk2KB+Qjb6OpLC3Ee8FxT38iVLdxkDT/oZ8+HMagfNVJQQIRidzSR7kbbG7zsQejOAMaHc9OrYRSKUhhH216Xfpr2Jk3dJJ1LvKY49PEQNUvY0+kW/7WqCgldk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=coekRUGy; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: sai.krishna.potthuri@amd.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1718038750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fdhovgqT7zjoOedUP7hNDAxwuKT33nzYsDI2SddjkRk=;
	b=coekRUGyb9Y7ezSuJt1zIu+Ti/tusFcIA1RITV+M48P46CbeYbTz5p1uGp3/KiYPQ5lcuR
	sj7m+gJXWjWLQ9fR0VYHkAczIQRwGkyOJE/SYFUgD1zqngwV6wm/Nl1Q2xIzR+NOkK/c/3
	NUBKbBMhw6wgpEtnuS3nKncuNlWmwYc=
X-Envelope-To: linus.walleij@linaro.org
X-Envelope-To: michal.simek@amd.com
X-Envelope-To: linux-gpio@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: andy.shevchenko@gmail.com
X-Envelope-To: linux-arm-kernel@lists.infradead.org
X-Envelope-To: srinivas.goud@amd.com
Message-ID: <d9e9eefa-191c-460f-aae1-3b328043c1e6@linux.dev>
Date: Mon, 10 Jun 2024 12:59:06 -0400
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/2] pinctrl: zynqmp: Support muxing individual pins
To: "Potthuri, Sai Krishna" <sai.krishna.potthuri@amd.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 "Simek, Michal" <michal.simek@amd.com>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "Goud, Srinivas" <srinivas.goud@amd.com>
References: <20240520150424.2531458-1-sean.anderson@linux.dev>
 <20240520150424.2531458-3-sean.anderson@linux.dev>
 <BY5PR12MB4258AB37A4D6CC28E69DDE51DBC62@BY5PR12MB4258.namprd12.prod.outlook.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <BY5PR12MB4258AB37A4D6CC28E69DDE51DBC62@BY5PR12MB4258.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Hi Sai Krishna,

On 6/10/24 08:16, Potthuri, Sai Krishna wrote:
> Hi Sean,
> 
>> -----Original Message-----
>> From: Sean Anderson <sean.anderson@linux.dev>
>> Sent: Monday, May 20, 2024 8:34 PM
>> To: Linus Walleij <linus.walleij@linaro.org>; Simek, Michal
>> <michal.simek@amd.com>; linux-gpio@vger.kernel.org
>> Cc: Potthuri, Sai Krishna <sai.krishna.potthuri@amd.com>; linux-
>> kernel@vger.kernel.org; Andy Shevchenko <andy.shevchenko@gmail.com>;
>> linux-arm-kernel@lists.infradead.org; Sean Anderson
>> <sean.anderson@linux.dev>
>> Subject: [PATCH v2 2/2] pinctrl: zynqmp: Support muxing individual pins
>> 
>> While muxing groups of pins at once can be convenient for large interfaces,
>> it can also be rigid. This is because the group is set to all pins which support
>> a particular function, even though not all pins may be used. For example,
>> the sdhci0 function may be used with a 8-bit eMMC, 4-bit SD card, or even a
>> 1-bit SD card. In these cases, the extra pins may be repurposed for other
>> uses, but this is not currently allowed.
>> 
>> There is not too much point in pin "groups" when there are not actual pin
>> groups at the hardware level. The pins can all be muxed individually, so
>> there's no point in adding artificial groups on top.
>> Just mux the pins like the hardware allows.
>> 
>> To this effect, add a new group for each pin which can be muxed. These
>> groups are part of each function the pin can be muxed to. We treat group
>> selectors beyond the number of groups as "pin" groups. To set this up, we
>> initialize groups before functions, and then create a bitmap of used pins for
>> each function. These used pins are appended to the function's list of
>> groups.
>> 
>> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
>> ---
>> 
>> Changes in v2:
>> - Use __set_bit instead of set_bit
>> - Use size_add when calculating the number of kcalloc members
>> - Expand commit message with some more motivation
>> 
>>  drivers/pinctrl/pinctrl-zynqmp.c | 61 ++++++++++++++++++++++----------
>>  1 file changed, 43 insertions(+), 18 deletions(-)
>> 
>> diff --git a/drivers/pinctrl/pinctrl-zynqmp.c b/drivers/pinctrl/pinctrl-
>> zynqmp.c
>> index 5c46b7d7ebcb..7cc1e43fb07c 100644
>> --- a/drivers/pinctrl/pinctrl-zynqmp.c
>> +++ b/drivers/pinctrl/pinctrl-zynqmp.c
>> @@ -10,6 +10,7 @@
>> 
>>  #include <dt-bindings/pinctrl/pinctrl-zynqmp.h>
>> 
>> +#include <linux/bitmap.h>
>>  #include <linux/init.h>
>>  #include <linux/module.h>
>>  #include <linux/of_address.h>
>> @@ -97,7 +98,7 @@ static int zynqmp_pctrl_get_groups_count(struct
>> pinctrl_dev *pctldev)  {
>>  	struct zynqmp_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
>> 
>> -	return pctrl->ngroups;
>> +	return pctrl->ngroups + zynqmp_desc.npins;
>>  }
>> 
>>  static const char *zynqmp_pctrl_get_group_name(struct pinctrl_dev
>> *pctldev, @@ -105,7 +106,10 @@ static const char
>> *zynqmp_pctrl_get_group_name(struct pinctrl_dev *pctldev,  {
>>  	struct zynqmp_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
>> 
>> -	return pctrl->groups[selector].name;
>> +	if (selector < pctrl->ngroups)
>> +		return pctrl->groups[selector].name;
>> +
>> +	return zynqmp_desc.pins[selector - pctrl->ngroups].name;
>>  }
>> 
>>  static int zynqmp_pctrl_get_group_pins(struct pinctrl_dev *pctldev, @@ -
>> 115,8 +119,13 @@ static int zynqmp_pctrl_get_group_pins(struct
>> pinctrl_dev *pctldev,  {
>>  	struct zynqmp_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
>> 
>> -	*pins = pctrl->groups[selector].pins;
>> -	*npins = pctrl->groups[selector].npins;
>> +	if (selector < pctrl->ngroups) {
>> +		*pins = pctrl->groups[selector].pins;
>> +		*npins = pctrl->groups[selector].npins;
>> +	} else {
>> +		*pins = &zynqmp_desc.pins[selector - pctrl-
>> >ngroups].number;
>> +		*npins = 1;
>> +	}
>> 
>>  	return 0;
>>  }
>> @@ -560,10 +569,12 @@ static int
>> zynqmp_pinctrl_prepare_func_groups(struct device *dev, u32 fid,  {
>>  	u16 resp[NUM_GROUPS_PER_RESP] = {0};
>>  	const char **fgroups;
>> -	int ret, index, i;
>> +	int ret, index, i, pin;
>> +	unsigned int npins;
>> +	unsigned long *used_pins __free(bitmap) =
>> +		bitmap_zalloc(zynqmp_desc.npins, GFP_KERNEL);
>> 
>> -	fgroups = devm_kcalloc(dev, func->ngroups, sizeof(*fgroups),
>> GFP_KERNEL);
>> -	if (!fgroups)
>> +	if (!used_pins)
>>  		return -ENOMEM;
>> 
>>  	for (index = 0; index < func->ngroups; index +=
>> NUM_GROUPS_PER_RESP) { @@ -578,23 +589,37 @@ static int
>> zynqmp_pinctrl_prepare_func_groups(struct device *dev, u32 fid,
>>  			if (resp[i] == RESERVED_GROUP)
>>  				continue;
>> 
>> -			fgroups[index + i] = devm_kasprintf(dev,
>> GFP_KERNEL,
>> -							    "%s_%d_grp",
>> -							    func->name,
>> -							    index + i);
>> -			if (!fgroups[index + i])
>> -				return -ENOMEM;
>> -
>>  			groups[resp[i]].name = devm_kasprintf(dev,
>> GFP_KERNEL,
>>  							      "%s_%d_grp",
>>  							      func->name,
>>  							      index + i);
>>  			if (!groups[resp[i]].name)
>>  				return -ENOMEM;
>> +
>> +			for (pin = 0; pin < groups[resp[i]].npins; pin++)
>> +				__set_bit(groups[resp[i]].pins[pin],
>> used_pins);
>>  		}
>>  	}
>>  done:
>> +	npins = bitmap_weight(used_pins, zynqmp_desc.npins);
>> +	fgroups = devm_kcalloc(dev, size_add(func->ngroups, npins),
>> +			       sizeof(*fgroups), GFP_KERNEL);
>> +	if (!fgroups)
>> +		return -ENOMEM;
>> +
>> +	for (i = 0; i < func->ngroups; i++) {
>> +		fgroups[i] = devm_kasprintf(dev, GFP_KERNEL, "%s_%d_grp",
>> +					    func->name, i);
>> +		if (!fgroups[i])
>> +			return -ENOMEM;
>> +	}
>> +
>> +	pin = 0;
>> +	for_each_set_bit(pin, used_pins, zynqmp_desc.npins)
>> +		fgroups[i++] = zynqmp_desc.pins[pin].name;
>> +
>>  	func->groups = fgroups;
>> +	func->ngroups += npins;
>> 
>>  	return 0;
>>  }
>> @@ -772,6 +797,10 @@ static int
>> zynqmp_pinctrl_prepare_function_info(struct device *dev,
>>  	if (!groups)
>>  		return -ENOMEM;
>> 
>> +	ret = zynqmp_pinctrl_prepare_group_pins(dev, groups, pctrl-
>> >ngroups);
>> +	if (ret)
>> +		return ret;
>> +
>>  	for (i = 0; i < pctrl->nfuncs; i++) {
>>  		ret = zynqmp_pinctrl_prepare_func_groups(dev, i, &funcs[i],
>>  							 groups);
>> @@ -779,10 +808,6 @@ static int
>> zynqmp_pinctrl_prepare_function_info(struct device *dev,
>>  			return ret;
>>  	}
>> 
>> -	ret = zynqmp_pinctrl_prepare_group_pins(dev, groups, pctrl-
>> >ngroups);
>> -	if (ret)
>> -		return ret;
>> -
>>  	pctrl->funcs = funcs;
>>  	pctrl->groups = groups;
>> 
> While testing this patch, observed that some more changes required in the 
> other functions like set_mux, pin_config_group_set. Pasted the diff below.

Thanks for catching this. I will incorporate these changes into v3.

> diff --git a/drivers/pinctrl/pinctrl-zynqmp.c b/drivers/pinctrl/pinctrl-zynqmp.c
> index 636e56f7cd92..c82074819be3 100644
> --- a/drivers/pinctrl/pinctrl-zynqmp.c
> +++ b/drivers/pinctrl/pinctrl-zynqmp.c
> @@ -206,12 +206,18 @@ static int zynqmp_pinmux_set_mux(struct pinctrl_dev *pctldev,
>                                  unsigned int function,
>                                  unsigned int group)
>  {
> -       struct zynqmp_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
> -       const struct zynqmp_pctrl_group *pgrp = &pctrl->groups[group];
> +       const unsigned *pins;
> +       unsigned npins;
>         int ret, i;
>  
> -       for (i = 0; i < pgrp->npins; i++) {
> -               unsigned int pin = pgrp->pins[i];
> +       ret = zynqmp_pctrl_get_group_pins(pctldev, group, &pins, &npins);
> +       if (ret) {

This function cannot fail, so we don't need to check the return.

> +               dev_err(pctldev->dev, "Get group pins failed for group %u\n", group);
> +               return ret;
> +       }
> +
> +       for (i = 0; i < npins; i++) {
> +               unsigned int pin = pins[i];
>  
>                 ret = zynqmp_pm_pinctrl_set_function(pin, function);
>                 if (ret) {
> @@ -476,13 +482,18 @@ static int zynqmp_pinconf_group_set(struct pinctrl_dev *pctldev,
>                                     unsigned long *configs,
>                                     unsigned int num_configs)
>  {
> -       int i, ret;
> -       struct zynqmp_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
> -       const struct zynqmp_pctrl_group *pgrp = &pctrl->groups[selector];
> -
> -       for (i = 0; i < pgrp->npins; i++) {
> -               ret = zynqmp_pinconf_cfg_set(pctldev, pgrp->pins[i], configs,
> -                                            num_configs);
> +       const unsigned *pins;
> +        unsigned npins;
> +        int i, ret;
> +
> +        ret = zynqmp_pctrl_get_group_pins(pctldev, selector, &pins, &npins);
> +        if (ret) {

ditto

> +                dev_err(pctldev->dev, "Get group pins failed for group %u\n", selector);
> +                return ret;
> +        }
> +
> +       for (i = 0; i < npins; i++) {
> +               ret = zynqmp_pinconf_cfg_set(pctldev, pins[i], configs, num_configs);
>                 if (ret)
>                         return ret;
>         }
> 
> Regards
> Sai Krishna

--Sean

