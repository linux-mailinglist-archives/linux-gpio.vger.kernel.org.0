Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAD0162A121
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Nov 2022 19:10:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232489AbiKOSKo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Nov 2022 13:10:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231334AbiKOSKe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Nov 2022 13:10:34 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A94A31EEE8
        for <linux-gpio@vger.kernel.org>; Tue, 15 Nov 2022 10:10:32 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id v1so25637500wrt.11
        for <linux-gpio@vger.kernel.org>; Tue, 15 Nov 2022 10:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kcMrBGKg5vWerxrt39beI1QcF1S3z5CPT9h09V43rFE=;
        b=zWXDJKZjBbrC2HhYbeK2Wc0N4wQLMxwtNFLgh+ceyF6e/rt9ZaFA72KSdhgYfpJvvh
         d6clxnIH9gULBAZpwdb+ch78EV7t3eEdxUgDrYcsfHFUOOHxbjb5RhKBtZreSLNI4zFR
         8TdzMw/ks6cHyATUXPoqv4L2TLblILXL+lMknQ5ZUuAH8rUxsX64vbVymTRA+NArCRMQ
         fkry+oX0/c9gO2wMDnIR2MhpHpSrzc6ifOUKqUSXW0jKVhWkefCyL6zMH2JtTBjNAKGl
         StdMfDl6/bH+5jC5Yu1WCOYyyx8iaNiw6b6TdCYASIeDx/6EHYal55JTsJACNzE0EZ9A
         XgPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kcMrBGKg5vWerxrt39beI1QcF1S3z5CPT9h09V43rFE=;
        b=nsQziOSRqHR84QS0kWIu2M7BdD8dXYb5IK3JvAx/3KyJpb/lNkKqqJzATTHUY654o0
         O97sAqsmmlEXSs+PZCxg5C2dYS8gGAhX/m3iiUfKrMEJr0z/ds/dHYoJkR39mEcOjDOy
         Yc+G9QRk92Xb2FjOKiB5Gb69ItEO9o7SYKQHrmxuSNY3tOWUtO4SeZIYBSgGWlkToA7z
         uqMA9dpqpLzwA94LvrnHH/QOJna61FR4naCxVLPri6ET3FvTd0Ouhz1oOlAq0FPApCFN
         cALNrECYr58OXxdX+3nuzxG2XX5XC5qNnylgEx8Vrattd5R8M4R7ewH0EBkpqEG8Oa3Y
         CGXg==
X-Gm-Message-State: ANoB5pknthCQXwav3SfTYfIkU+LUDz6aDtKaAsu26iVUqkRg+NRhij65
        tfdDZCO7NAVhhAQdy2f+TEdDAA==
X-Google-Smtp-Source: AA0mqf4hp4bMZHyPmxZBaNYXcfk462WxPOjWALl83xVst6RBDoiDoZP4EtQAOeAramOWgDFksQ/V+w==
X-Received: by 2002:a5d:674a:0:b0:22e:35e3:4427 with SMTP id l10-20020a5d674a000000b0022e35e34427mr11344271wrw.44.1668535831201;
        Tue, 15 Nov 2022 10:10:31 -0800 (PST)
Received: from [192.168.1.166] ([212.228.7.114])
        by smtp.gmail.com with ESMTPSA id b15-20020adff24f000000b002345cb2723esm12882278wrp.17.2022.11.15.10.10.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 10:10:30 -0800 (PST)
Message-ID: <05c60925-e21d-38b4-8788-1322734717e0@linaro.org>
Date:   Tue, 15 Nov 2022 18:10:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH RFC 1/3] pinctrl: add support for acpi PinGroup resource
Content-Language: en-US
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        rafael@kernel.org, linus.walleij@linaro.org
References: <20221110191258.1134378-1-niyas.sait@linaro.org>
 <20221110191258.1134378-2-niyas.sait@linaro.org>
 <Y248EAY7hshSWM7w@black.fi.intel.com>
From:   Niyas Sait <niyas.sait@linaro.org>
In-Reply-To: <Y248EAY7hshSWM7w@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Thanks, Mika for the feedback.

I have addressed most of your comments on V2 of the patch [1]


 >> +/* Get list of acpi pin groups definitions for the controller */
 >
 > Use proper kernel-doc here.
 >
 > Also who is responsible of releasing the thing and how it is done?
 >

I added a new interface in V2 to free the descriptors.
Pinctrl can free the descriptors after processing.

[1] 
https://lore.kernel.org/linux-gpio/20221115175415.650690-1-niyas.sait@linaro.org/T/#t

--
Niyas

On 11/11/2022 12:12, Mika Westerberg wrote:
> On Thu, Nov 10, 2022 at 07:12:56PM +0000, Niyas Sait wrote:
>> pinctrl-acpi parses and decode PinGroup resources for
>> the device and generate list of group descriptor.
>> Descriptors can be used by the pin controller to identify
>> the groups and pins provided in the group.
>>
>> Signed-off-by: Niyas Sait <niyas.sait@linaro.org>
>> ---
>>   drivers/pinctrl/Makefile       |  1 +
>>   drivers/pinctrl/pinctrl-acpi.c | 59 ++++++++++++++++++++++++++++++++++
>>   drivers/pinctrl/pinctrl-acpi.h | 22 +++++++++++++
>>   3 files changed, 82 insertions(+)
>>   create mode 100644 drivers/pinctrl/pinctrl-acpi.c
>>   create mode 100644 drivers/pinctrl/pinctrl-acpi.h
>>
>> diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
>> index e76f5cdc64b0..0b0ec4080942 100644
>> --- a/drivers/pinctrl/Makefile
>> +++ b/drivers/pinctrl/Makefile
>> @@ -8,6 +8,7 @@ obj-$(CONFIG_PINMUX)		+= pinmux.o
>>   obj-$(CONFIG_PINCONF)		+= pinconf.o
>>   obj-$(CONFIG_GENERIC_PINCONF)	+= pinconf-generic.o
>>   obj-$(CONFIG_OF)		+= devicetree.o
>> +obj-$(CONFIG_ACPI)		+= pinctrl-acpi.o
>>   
>>   obj-$(CONFIG_PINCTRL_AMD)	+= pinctrl-amd.o
>>   obj-$(CONFIG_PINCTRL_APPLE_GPIO) += pinctrl-apple-gpio.o
>> diff --git a/drivers/pinctrl/pinctrl-acpi.c b/drivers/pinctrl/pinctrl-acpi.c
>> new file mode 100644
>> index 000000000000..75e59fe22387
>> --- /dev/null
>> +++ b/drivers/pinctrl/pinctrl-acpi.c
>> @@ -0,0 +1,59 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (C) 2022 Linaro Ltd.
>> + */
>> +#include <linux/acpi.h>
>> +#include <linux/errno.h>
>> +#include <linux/gpio/consumer.h>
>> +#include <linux/gpio/driver.h>
>> +#include <linux/gpio/machine.h>
>> +#include <linux/list.h>
>> +
>> +#include "pinctrl-acpi.h"
>> +
>> +static int pinctrl_acpi_populate_group_desc(struct acpi_resource *ares, void *data)
>> +{
>> +	struct acpi_resource_pin_group *ares_pin_group;
>> +	struct pinctrl_acpi_group_desc *desc;
>> +	struct list_head *group_desc_list = data;
>> +
>> +	if (ares->type != ACPI_RESOURCE_TYPE_PIN_GROUP)
>> +		return 1;
>> +
>> +	ares_pin_group = &ares->data.pin_group;
>> +
>> +	desc = kzalloc(sizeof(struct pinctrl_acpi_group_desc), GFP_KERNEL);
>> +	if (!desc)
>> +		return -ENOMEM;
>> +
>> +	desc->name = kstrdup_const(ares_pin_group->resource_label.string_ptr, GFP_KERNEL);
>> +	desc->pins = ares_pin_group->pin_table;
>> +	desc->num_pins = ares_pin_group->pin_table_length;
>> +	desc->vendor_data = ares_pin_group->vendor_data;
>> +	desc->vendor_length = ares_pin_group->vendor_length;
>> +
>> +	INIT_LIST_HEAD(&desc->list);
>> +	list_add(&desc->list, group_desc_list);
>> +
>> +	return 1;
>> +}
>> +
>> +/* Get list of acpi pin groups definitions for the controller */
> 
> Use proper kernel-doc here.
> 
> Also who is responsible of releasing the thing and how it is done?
> 
>> +int pinctrl_acpi_get_pin_groups(struct acpi_device *adev, struct list_head *group_desc_list)
>> +{
>> +	struct list_head res_list;
>> +	int ret;
>> +
>> +	INIT_LIST_HEAD(&res_list);
>> +	INIT_LIST_HEAD(group_desc_list);
>> +
>> +	ret = acpi_dev_get_resources(adev, &res_list,
>> +								 pinctrl_acpi_populate_group_desc,
>> +								 group_desc_list);
> 
> The formatting is wrong here.
> 
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	acpi_dev_free_resource_list(&res_list);
>> +
> 
> Drop the empty line.
> 
>> +	return 0;
>> +}
>> diff --git a/drivers/pinctrl/pinctrl-acpi.h b/drivers/pinctrl/pinctrl-acpi.h
>> new file mode 100644
>> index 000000000000..1a0c751a7594
>> --- /dev/null
>> +++ b/drivers/pinctrl/pinctrl-acpi.h
>> @@ -0,0 +1,22 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (C) 2022 Linaro Ltd.
>> + */
>> +
> 
> kernel-doc here too.
> 
>> +struct pinctrl_acpi_group_desc {
>> +	const char *name;
>> +	short unsigned int *pins;
>> +	unsigned num_pins;
>> +	void *vendor_data;
>> +	unsigned vendor_length;
>> +	struct list_head list;
>> +};
>> +
>> +#ifdef CONFIG_ACPI
>> +int pinctrl_acpi_get_pin_groups(struct acpi_device *adev, struct list_head *group_desc_list);
>> +#else
>> +int pinctrl_acpi_get_pin_groups(struct acpi_device *adev, struct list_head *group_desc_list)
> 
> This needs to be static inline.
> 
>> +{
>> +	return -ENODEV;
> 
> -ENXIO?
> 
>> +}
>> +#endif
>> -- 
>> 2.25.1
