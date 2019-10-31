Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01CDAEAD75
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2019 11:31:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727186AbfJaKb3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 31 Oct 2019 06:31:29 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:50775 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727005AbfJaKbZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Oct 2019 06:31:25 -0400
Received: by mail-wm1-f68.google.com with SMTP id 11so5358127wmk.0
        for <linux-gpio@vger.kernel.org>; Thu, 31 Oct 2019 03:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NlAiN393nCfoZAygvg08JmQmUPznfSWcWyubnTUIKKE=;
        b=FTzhdX6xA9OuelCfgiKsLtlknqLLFGDnkv0Ewxq2ueMPposxkBjtBde1+K6HfGCUPt
         qIYL83dFAJt4Th0bz7plX90V/6hkhi6ob0yugsKsSgKe/ghH4tlSh+SoA1k9Tk54F0Jh
         V8nnC5ExLwC7ZcXv6m5ixQXNUy5M+WMBh4SmeLRarr+P1n5nDUHRCW1o1x5Pq+BcKLf2
         LDhTiUEXX9BfDRntrXDxlZyGXFsI+oRv1L8d94JIGzD3174pXs3lrMWpyAw8qRT6ukOs
         6G0lH4FT698KoWL74vFlbOofb40GvIoZx3r/XaxhbuO9AeGS7l+V/eqF6EPxVn+xokZU
         zqYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NlAiN393nCfoZAygvg08JmQmUPznfSWcWyubnTUIKKE=;
        b=CnBmOALNe+kOPBU5gaip6ylxxIIZ/R3ZLw+dHIp3WIDZeKg4/xZMP/t+bprw0RexH/
         WNLGWeOIcIU9sFE01grD1Rj3O/4g++zBLLNwhi/zu+jkIPUdM3ASL+UO/iD+xJq+OP7i
         Wr7cHzP0jbe64cGJj6GOB1CBWR8JILx5xiBQaZ/AQPJrAMZ07pw4FEL9y2p9wzZLXe0D
         DYHF6bnkx2QDz8R3knJFf4/ONSHDz23zMPL/J54QoAYIji4BIA+p/KmyulAN3+4T+5n5
         fQeV/lRrFEiW89A0/G7Iwem03iFqIT65QWp4iVt1xv1CpugP7O6FBVXKgrHEbJzF+8AL
         a7wA==
X-Gm-Message-State: APjAAAXenqk9i/4FMFbE1qeAK/V40cIGwYaF2tKbgb+Ht7C1bl1elJ8w
        EERoXTJCJBb82iBoFtWrclGx/PkwTTs=
X-Google-Smtp-Source: APXvYqwzIQFibqNdvPGWNk3heHcVRqkP3v0Z/1/+VvfGQ7xyaMJGSMdiwbE3vgpAkeqas6x5ShMlxA==
X-Received: by 2002:a1c:5459:: with SMTP id p25mr4216403wmi.109.1572517881852;
        Thu, 31 Oct 2019 03:31:21 -0700 (PDT)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id d4sm4614799wrc.54.2019.10.31.03.31.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 31 Oct 2019 03:31:20 -0700 (PDT)
Subject: Re: [PATCH v3 09/11] pinctrl: qcom-wcd934x: Add support to wcd934x
 pinctrl driver.
To:     Stephen Boyd <swboyd@chromium.org>, broonie@kernel.org,
        lee.jones@linaro.org, linus.walleij@linaro.org, robh@kernel.org
Cc:     vinod.koul@linaro.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        spapothi@codeaurora.org, bgoswami@codeaurora.org,
        linux-gpio@vger.kernel.org,
        Yeleswarapu Nagaradhesh <nagaradh@codeaurora.org>
References: <20191029112700.14548-1-srinivas.kandagatla@linaro.org>
 <20191029112700.14548-10-srinivas.kandagatla@linaro.org>
 <5db9a34f.1c69fb81.23dfc.7ea5@mx.google.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <85aa859f-9d20-2a13-caba-d4901f18829c@linaro.org>
Date:   Thu, 31 Oct 2019 10:31:19 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5db9a34f.1c69fb81.23dfc.7ea5@mx.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Thanks Stephen for reviewing this patch.

On 30/10/2019 14:50, Stephen Boyd wrote:
> Quoting Srinivas Kandagatla (2019-10-29 04:26:58)
>> From: Yeleswarapu Nagaradhesh <nagaradh@codeaurora.org>
>>
>> This patch adds support to wcd934x pinctrl block found in
>> WCD9340/WC9341 Audio codecs.
>>
>> [Srini: multiple cleanups to the code]
> 
> This goes after the author signoff and before yours. Can you add more
> details too?
I agree, will fix this in next spin.
> 
>> Signed-off-by: Yeleswarapu Nagaradhesh <nagaradh@codeaurora.org>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   drivers/pinctrl/qcom/Kconfig                |   7 +
>>   drivers/pinctrl/qcom/Makefile               |   1 +
>>   drivers/pinctrl/qcom/pinctrl-wcd934x-gpio.c | 365 ++++++++++++++++++++
>>   3 files changed, 373 insertions(+)
>>   create mode 100644 drivers/pinctrl/qcom/pinctrl-wcd934x-gpio.c
>>
>> diff --git a/drivers/pinctrl/qcom/pinctrl-wcd934x-gpio.c b/drivers/pinctrl/qcom/pinctrl-wcd934x-gpio.c
>> new file mode 100644
>> index 000000000000..1aff88d0bcb3
>> --- /dev/null
>> +++ b/drivers/pinctrl/qcom/pinctrl-wcd934x-gpio.c
>> @@ -0,0 +1,365 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +// Copyright (c) 2016-2017, The Linux Foundation. All rights reserved.
>> +// Copyright (c) 2019, Linaro Limited
>> +
>> +#include <linux/module.h>
>> +#include <linux/gpio.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/regmap.h>
>> +#include <linux/slab.h>
>> +#include <linux/of.h>
>> +#include <linux/of_device.h>
>> +#include <linux/of_gpio.h>
>> +
>> +#include "../core.h"
>> +#include "../pinctrl-utils.h"
>> +
>> +#define WCD_REG_DIR_CTL_OFFSET 0x42
>> +#define WCD_REG_VAL_CTL_OFFSET 0x43
>> +#define WCD_GPIO_PULL_UP       1
>> +#define WCD_GPIO_PULL_DOWN     2
>> +#define WCD_GPIO_BIAS_DISABLE  3
>> +#define WCD_GPIO_STRING_LEN    20
>> +#define WCD934X_NPINS          5
>> +
>> +/**
>> + * struct wcd_gpio_pad - keep current GPIO settings
>> + * @offset: offset of gpio.
>> + * @is_valid: Set to false, when GPIO in high Z state.
>> + * @value: value of a pin
>> + * @output_enabled: Set to true if GPIO is output and false if it is input
>> + * @pullup: Constant current which flow through GPIO output buffer.
>> + * @strength: Drive strength of a pin
>> + */
>> +struct wcd_gpio_pad {
>> +       u16  offset;
>> +       bool is_valid;
>> +       bool value;
>> +       bool output_enabled;
>> +       unsigned int pullup;
>> +       unsigned int strength;
>> +};
>> +
>> +struct wcd_gpio_priv {
>> +       struct device *dev;
>> +       struct regmap *map;
>> +       struct pinctrl_dev *ctrl;
>> +       struct gpio_chip chip;
>> +};
>> +
>> +static int wcd_gpio_read(struct wcd_gpio_priv *priv_data,
>> +                        struct wcd_gpio_pad *pad, unsigned int addr)
>> +{
>> +       unsigned int val;
>> +       int ret;
>> +
>> +       ret = regmap_read(priv_data->map, addr, &val);
>> +       if (ret < 0)
>> +               dev_err(priv_data->dev, "%s: read 0x%x failed\n",
>> +                       __func__, addr);
>> +       else
>> +               ret = (val >> pad->offset);
>> +
>> +       return ret;
>> +}
>> +
>> +static int wcd_gpio_write(struct wcd_gpio_priv *priv_data,
>> +                         struct wcd_gpio_pad *pad, unsigned int addr,
>> +                         unsigned int val)
>> +{
>> +       int ret;
>> +
>> +       ret = regmap_update_bits(priv_data->map, addr, (1 << pad->offset),
>> +                                val << pad->offset);
>> +       if (ret < 0)
>> +               dev_err(priv_data->dev, "write 0x%x failed\n", addr);
> 
> Is there value in these error messages? Also, use %#x to get '0x'.

I can add ret in the err message.

I did not knew about "%#x".. nice, I will use this in future!
> 
>> +
>> +       return ret;
>> +}
> [...]
>> +
>> +static int wcd_pinctrl_probe(struct platform_device *pdev)
>> +{
>> +       struct device *dev = &pdev->dev;
>> +       struct pinctrl_pin_desc *pindesc;
>> +       struct pinctrl_desc *pctrldesc;
>> +       struct wcd_gpio_pad *pad, *pads;
>> +       struct wcd_gpio_priv *priv_data;
>> +       u32 npins = WCD934X_NPINS;
>> +       char **name;
>> +       int i;
>> +
>> +       priv_data = devm_kzalloc(dev, sizeof(*priv_data), GFP_KERNEL);
>> +       if (!priv_data)
>> +               return -ENOMEM;
>> +
>> +       priv_data->dev = dev;
>> +       priv_data->map = dev_get_regmap(dev->parent, NULL);
>> +       if (!priv_data->map) {
>> +               dev_err(dev, "%s: failed to get regmap\n", __func__);
>> +               return  -EINVAL;
>> +       }
>> +
>> +       pindesc = devm_kcalloc(dev, npins, sizeof(*pindesc), GFP_KERNEL);
>> +       if (!pindesc)
>> +               return -ENOMEM;
>> +
>> +       pads = devm_kcalloc(dev, npins, sizeof(*pads), GFP_KERNEL);
>> +       if (!pads)
>> +               return -ENOMEM;
> 
> Is it possible to put the pad struct around the pindesc struct? It's
> sort of sad that we have to allocate a chunk of memory twice for the
> pindesc and the pads when we could either use container_of() on the
> pindesc or just point the pindesc driver data member to the container
> structure for the qcom specific bits.
> 

I will give that a go in next version!

>> +
>> +       pctrldesc = devm_kzalloc(dev, sizeof(*pctrldesc), GFP_KERNEL);
>> +       if (!pctrldesc)
>> +               return -ENOMEM;
>> +
>> +       pctrldesc->pctlops = &wcd_pinctrl_ops;
>> +       pctrldesc->confops = &wcd_pinconf_ops;
>> +       pctrldesc->owner = THIS_MODULE;
>> +       pctrldesc->name = dev_name(dev);
>> +       pctrldesc->pins = pindesc;
>> +       pctrldesc->npins = npins;
>> +
>> +       name = devm_kcalloc(dev, npins, sizeof(char *), GFP_KERNEL);
>> +       if (!name)
>> +               return -ENOMEM;
>> +
>> +       for (i = 0; i < npins; i++, pindesc++) {
>> +               name[i] = devm_kzalloc(dev, sizeof(char) * WCD_GPIO_STRING_LEN,
>> +                                      GFP_KERNEL);
>> +               if (!name[i])
>> +                       return -ENOMEM;
>> +
>> +               pad = &pads[i];
>> +               pindesc->drv_data = pad;
>> +               pindesc->number = i;
>> +               snprintf(name[i], (WCD_GPIO_STRING_LEN - 1), "gpio%d", (i+1));
>> +               pindesc->name = name[i];
> 
> Why not use devm_kasprintf()? The 'name' array is also unnecessary?
Am not sure why its not used her, but I can do that change in next version.

> 
>> +               pad->offset = i;
>> +               pad->is_valid  = true;
>> +       }
>> +
>> +       priv_data->chip = wcd_gpio_chip;
>> +       priv_data->chip.parent = dev;
>> +       priv_data->chip.base = -1;
>> +       priv_data->chip.ngpio = npins;
>> +       priv_data->chip.label = dev_name(dev);
>> +       priv_data->chip.of_gpio_n_cells = 2;
>> +       priv_data->chip.can_sleep = false;
>> +       platform_set_drvdata(pdev, priv_data);
>> +
>> +       priv_data->ctrl = devm_pinctrl_register(dev, pctrldesc, priv_data);
>> +       if (IS_ERR(priv_data->ctrl)) {
>> +               dev_err(dev, "%s: failed to register to pinctrl\n", __func__);
>> +               return PTR_ERR(priv_data->ctrl);
>> +       }
>> +
>> +       return gpiochip_add_data(&priv_data->chip, priv_data);
> 
> WHy not use devm_gpiochip_add_data()?

Good idea, will do that in next spin.
> 
>> +}
>> +
>> +static int wcd_pinctrl_remove(struct platform_device *pdev)
>> +{
>> +       struct wcd_gpio_priv *priv_data = platform_get_drvdata(pdev);
>> +
>> +       gpiochip_remove(&priv_data->chip);
>> +
>> +       return 0;
> 
> And drop this function?
> 
>> +}
>> +
>> +static const struct of_device_id wcd_pinctrl_of_match[] = {
>> +       { .compatible = "qcom,wcd9340-pinctrl" },
>> +       { .compatible = "qcom,wcd9341-pinctrl" },
>> +       { },
> 
> Nitpick: Drop the comma on the sentinel.
> 
>> +};
>> +
>> +MODULE_DEVICE_TABLE(of, wcd_pinctrl_of_match);
> 
> Nitpick: Drop the newline between device table and match table.
> 
