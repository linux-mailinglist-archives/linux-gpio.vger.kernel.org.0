Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53856DEAD5
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Oct 2019 13:25:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728476AbfJULZo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Oct 2019 07:25:44 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:36465 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728458AbfJULZo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Oct 2019 07:25:44 -0400
Received: by mail-wr1-f67.google.com with SMTP id w18so12966858wrt.3
        for <linux-gpio@vger.kernel.org>; Mon, 21 Oct 2019 04:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=IoIwguD84l9TdKOgIJ6k+NaPdGHth76VlXctQ/52GAY=;
        b=xqIxF+9MYXYRVZPdLb01gQWr+VIugeUrnEUZArwU1V5796KikHPXG/7BUjbJwd7gF+
         w/8nq4zoTzaZVWIu+E1v11ZYoz0IZ7sCin6eM+yqVVQsvaIIyCFuD0akeBQ0uRNdlZeQ
         bIEnMYTCF2exPyDpTWHWdrHEoEKvXdos65r+twfdvNwQ11ELrVPgFHVd8LTQoZXK9wkD
         6pC5KnYwnjtjpFkH4QfsECky8N444Q3u42QT+D/hchoyuIYQo3fgQVdRjUTAp28+D2GF
         fQydIK48vCnY/6PE+4Hu8t146LAFeUrg60tfRlkdC9phiNuYYbiiNAr+53NgZgb+Z8+D
         P2Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IoIwguD84l9TdKOgIJ6k+NaPdGHth76VlXctQ/52GAY=;
        b=Tf2HOIVgltiKjJOn/mSpMxA1eVM98akbjMS7aZVUbQ3xl4Uv9F4j6DkQ/g+8+ThV/2
         0ddHWa0L947JKV8jizj6fn5k1Tq608XaDennPxmOVrw7yiO9KXbGnog83zbYc5mm/WrO
         WQ/Q6t4hAWAVPG1XOVkkx8d6+albCBuB/A6fR1XQBmyX5z7pimFmgJJZIoCY2eJW/BuD
         13/FmxSxtGp8S+e8Uy0gcQEJu16j60O3soza+fYBLQpLXk01ddtmtvX76J3Bk0dsA5Gm
         z4/1fnLMnvgnHo/YL84CSUL/RJ5wIC0SJVBFEupRRNqzYG42m83xe42LMpqt92iv1RJ+
         FGFQ==
X-Gm-Message-State: APjAAAWwLRuT5cAMC4Kl7ikKDCop8TD1Kb3fsFiyxalmHq82KQc6ArQP
        b0sZ/XGvmwEez9nCsjNqbeOlHonby2c=
X-Google-Smtp-Source: APXvYqyYjDblvuAXUOiGxRxoOHlR+3MiGcdtPvzyetJP+LpvAsFsDJf8xyDkuzhWJGG5meZW4KEGDg==
X-Received: by 2002:adf:a50b:: with SMTP id i11mr20423440wrb.308.1571657140501;
        Mon, 21 Oct 2019 04:25:40 -0700 (PDT)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id a186sm12614204wmd.3.2019.10.21.04.25.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Oct 2019 04:25:39 -0700 (PDT)
Subject: Re: [PATCH v2 02/11] mfd: wcd934x: add support to wcd9340/wcd9341
 codec
To:     Lee Jones <lee.jones@linaro.org>
Cc:     robh@kernel.org, broonie@kernel.org, linus.walleij@linaro.org,
        vinod.koul@linaro.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        spapothi@codeaurora.org, bgoswami@codeaurora.org,
        linux-gpio@vger.kernel.org
References: <20191018001849.27205-1-srinivas.kandagatla@linaro.org>
 <20191018001849.27205-3-srinivas.kandagatla@linaro.org>
 <20191021104611.GZ4365@dell>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <1af8a875-8f55-6b7e-4204-ecedc1608889@linaro.org>
Date:   Mon, 21 Oct 2019 12:25:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191021104611.GZ4365@dell>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Thanks Lee for taking time to review.

I agree with most of the style related comments, will fix them in next 
version. For others I have replied it inline.

On 21/10/2019 11:46, Lee Jones wrote:
> On Fri, 18 Oct 2019, Srinivas Kandagatla wrote:
> 
>> Qualcomm WCD9340/WCD9341 Codec is a standalone Hi-Fi audio codec IC.
>>
>> This codec has integrated SoundWire controller, pin controller and
>> interrupt controller.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   drivers/mfd/Kconfig                   |   8 +
>>   drivers/mfd/Makefile                  |   1 +
>>   drivers/mfd/wcd934x.c                 | 330 ++++++++++++++++
>>   include/linux/mfd/wcd934x/registers.h | 529 ++++++++++++++++++++++++++
>>   include/linux/mfd/wcd934x/wcd934x.h   |  24 ++
>>   5 files changed, 892 insertions(+)
>>   create mode 100644 drivers/mfd/wcd934x.c
>>   create mode 100644 include/linux/mfd/wcd934x/registers.h
>>   create mode 100644 include/linux/mfd/wcd934x/wcd934x.h
>>
>> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
>> index ae24d3ea68ea..ab09862b5996 100644
>> --- a/drivers/mfd/Kconfig
>> +++ b/drivers/mfd/Kconfig
>> @@ -1967,6 +1967,14 @@ config MFD_STMFX
>>   	  additional drivers must be enabled in order to use the functionality
>>   	  of the device.
>>   

[...]

>> diff --git a/drivers/mfd/wcd934x.c b/drivers/mfd/wcd934x.c
>> new file mode 100644
>> index 000000000000..bb4d2a6c89bc
>> --- /dev/null
>> +++ b/drivers/mfd/wcd934x.c
>> @@ -0,0 +1,330 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +// Copyright (c) 2019, Linaro Limited
>> +
>> +#include <linux/clk.h>
>> +#include <linux/gpio.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/kernel.h>
>> +#include <linux/mfd/core.h>
>> +#include <linux/mfd/wcd934x/registers.h>
>> +#include <linux/mfd/wcd934x/wcd934x.h>
>> +#include <linux/module.h>
>> +#include <linux/of_gpio.h>
>> +#include <linux/of.h>
>> +#include <linux/of_irq.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>> +#include <linux/regulator/consumer.h>
>> +#include <linux/slimbus.h>
>> +

[...]

>> +static int wcd934x_bring_up(struct wcd934x_data *wcd)
>> +{
>> +	struct regmap *rm = wcd->regmap;
> 
> It's much more common to use 'regmap' or 'map'.

Only reason to make it short here is to save some lines!
If you prefer regmap, I will add that in next version!

> 
>> +	u16 id_minor, id_major;
>> +	int ret;
>> +
>> +	ret = regmap_bulk_read(rm, WCD934X_CHIP_TIER_CTRL_CHIP_ID_BYTE0,
>> +			       (u8 *)&id_minor, sizeof(u16));
>> +	if (ret)
>> +		return -EINVAL;
>> +
>> +	ret = regmap_bulk_read(rm, WCD934X_CHIP_TIER_CTRL_CHIP_ID_BYTE2,
>> +			       (u8 *)&id_major, sizeof(u16));
>> +	if (ret)
>> +		return -EINVAL;
>> +
>> +	dev_info(wcd->dev, "wcd934x chip id major 0x%x, minor 0x%x\n",
>> +		 id_major, id_minor);
>> +
>> +	regmap_write(rm, WCD934X_CODEC_RPM_RST_CTL, 0x01);
>> +	regmap_write(rm, WCD934X_SIDO_NEW_VOUT_A_STARTUP, 0x19);
>> +	regmap_write(rm, WCD934X_SIDO_NEW_VOUT_D_STARTUP, 0x15);
>> +	/* Add 1msec delay for VOUT to settle */
>> +	usleep_range(1000, 1100);
>> +	regmap_write(rm, WCD934X_CODEC_RPM_PWR_CDC_DIG_HM_CTL, 0x5);
>> +	regmap_write(rm, WCD934X_CODEC_RPM_PWR_CDC_DIG_HM_CTL, 0x7);
>> +	regmap_write(rm, WCD934X_CODEC_RPM_RST_CTL, 0x3);
>> +	regmap_write(rm, WCD934X_CODEC_RPM_RST_CTL, 0x7);
>> +	regmap_write(rm, WCD934X_CODEC_RPM_PWR_CDC_DIG_HM_CTL, 0x3);
>> +
>> +	return 0;
>> +
> 
> Superfluous '\n'.
> 
>> +}
>> +
>> +static int wcd934x_slim_status(struct slim_device *sdev,
>> +			       enum slim_device_status status)
>> +{
>> +	struct device *dev = &sdev->dev;
>> +	struct wcd934x_data *wcd;
>> +	int ret;
> 
> This is semantically odd!  Why are you doing most of the
> initialisation and bring-up in 'status' and not 'probe'.  Seems
> broken to me.
> 

SLIMBus device will not be in a state to communicate before enumeration 
(at probe), so all the device initialization is done in status callback 
where it is ready for communication.

This is same with SoundWire Bus as well!

>> +	wcd = dev_get_drvdata(dev);
>> +
>> +	switch (status) {
>> +	case SLIM_DEVICE_STATUS_UP:
>> +		wcd->regmap = regmap_init_slimbus(sdev, &wcd934x_regmap_config);
>> +		if (IS_ERR(wcd->regmap)) {
>> +			dev_err(dev, "Error allocating slim regmap\n");
>> +			return PTR_ERR(wcd->regmap);
>> +		}
>> +
>> +		ret = wcd934x_bring_up(wcd);
>> +		if (ret) {
>> +			dev_err(dev, "Error WCD934X bringup: err = %d\n", ret);


[...]

>> +	return 0;
>> +}
>> +
>> +static void wcd934x_slim_remove(struct slim_device *sdev)
>> +{
>> +	struct wcd934x_data *wcd = dev_get_drvdata(&sdev->dev);
> 
> No more clean-up?  Aren't the regulators still enabled?
> Good point, will add missing regulator disable in next version.

>> +	mfd_remove_devices(&sdev->dev);
>> +	kfree(wcd);
>> +}
>> +

[...]

>> +#endif
>> diff --git a/include/linux/mfd/wcd934x/wcd934x.h b/include/linux/mfd/wcd934x/wcd934x.h
>> new file mode 100644
>> index 000000000000..d102e211948c
>> --- /dev/null
>> +++ b/include/linux/mfd/wcd934x/wcd934x.h
>> @@ -0,0 +1,24 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +
>> +#ifndef __WCD934X_H__
>> +#define __WCD934X_H__
>> +#include <linux/clk.h>
>> +#include <linux/regulator/consumer.h>
>> +#include <linux/regmap.h>
>> +#include <linux/slimbus.h>

[...]

>> +struct wcd934x_data {
>> +	int reset_gpio;
>> +	int irq;
> 
> I'd prefer to see the more complex 'struct's at the top.
> 
>> +	struct device *dev;
>> +	struct clk *extclk;
>> +	struct regmap *regmap;
>> +	struct slim_device *sdev;
> 
> You don't need 'sdev' and 'dev'.

slim_device instance (sdev) is required by audio codec driver to 
allocate stream runtime.

> 
>> +	struct regmap_irq_chip_data *irq_data;
>> +	struct regulator_bulk_data supplies[WCD934X_MAX_SUPPLY];
>> +};
>> +
>> +#endif /* __WCD934X_H__ */
>> +
> 
