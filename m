Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 452BF2CAD32
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Dec 2020 21:24:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727771AbgLAUWr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Dec 2020 15:22:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729009AbgLAUWq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Dec 2020 15:22:46 -0500
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D55B5C0613D6
        for <linux-gpio@vger.kernel.org>; Tue,  1 Dec 2020 12:22:00 -0800 (PST)
Received: by mail-io1-xd41.google.com with SMTP id j23so2982620iog.6
        for <linux-gpio@vger.kernel.org>; Tue, 01 Dec 2020 12:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4gs7t9MjEYA5UWOLu3eX1LUX0CiZ69mOlK5lwM97vkI=;
        b=Kit/biOu4sHqQEb5yzcx6x6d+9T6rLZbLjREZOUmKQG21dAFnBUUQtpUEwzhT4eODp
         ifXpgMxqpgHPZLUfGuv+Pj5uTAhYrHz+T/opfsr4VxkoS1dIAncp29x7DrHdDhgvb3wL
         JX8eWxJN9Zl2yu+KHsNfcml9Ae5agzS0GwCgU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4gs7t9MjEYA5UWOLu3eX1LUX0CiZ69mOlK5lwM97vkI=;
        b=Bv4XuO0EnFA8yT0SBNHftHqIJ4GwnJk8jcF309XGr9O4fq7mkSzfINTEYi2dsXDEMr
         Lt6EbPvxvIGQkeHu30F5e4lx7QYi/5gy6Seyrx2j7cisoh28K6jOysIt9hDh5EmpM9oE
         PiZD7YLhGi/sNB6HaPgXmSBcXhSl8t38vcey2bRNv6wfua2uBMYu8odprgeGNpPf6WTK
         8n3qqnU2hMU/Ns7i5Bvq0mQcPQRazrpa4Muybh+iVP4Glq4P4tLASLVPtsbOjwGY0Xtx
         VZpiiFgzeAQEipV40FrR7OY869f4qhx9FkbXw8qG8H3Bj18v0/VMMbGd7AB/AYu9zW+w
         o36g==
X-Gm-Message-State: AOAM533O31FEk2t9pSLPO2XqJT/1eKaJBUpaP1o3BGQdcyQ2bH8ZVRqr
        o3AtR3XVkaU9xntioS9tNP7hjw==
X-Google-Smtp-Source: ABdhPJwgfKTuzX231iuOFh3HM2J+8+V8c7Ho5xKvWB5EHAHLg8Ugj3Bns3j9Y2oGfqRLOQK11r1igg==
X-Received: by 2002:a5d:9049:: with SMTP id v9mr3846181ioq.199.1606854120097;
        Tue, 01 Dec 2020 12:22:00 -0800 (PST)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id d5sm322949ios.25.2020.12.01.12.21.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Dec 2020 12:21:59 -0800 (PST)
Subject: Re: [PATCH v5 2/2] pinctrl: qcom: Add sm8250 lpass lpi pinctrl driver
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linus.walleij@linaro.org, bjorn.andersson@linaro.org
Cc:     robh+dt@kernel.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201201142830.13152-1-srinivas.kandagatla@linaro.org>
 <20201201142830.13152-3-srinivas.kandagatla@linaro.org>
From:   Alex Elder <elder@ieee.org>
Message-ID: <bf18cc63-77b2-7929-625a-1ea3d108916e@ieee.org>
Date:   Tue, 1 Dec 2020 14:21:58 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201201142830.13152-3-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 12/1/20 8:28 AM, Srinivas Kandagatla wrote:
> Add initial pinctrl driver to support pin configuration for
> LPASS (Low Power Audio SubSystem) LPI (Low Power Island) pinctrl
> on SM8250.
> 
> This IP is an additional pin control block for Audio Pins on top the
> existing SoC Top level pin-controller.
> Hardware setup looks like:
> 
> TLMM GPIO[146 - 159] --> LPASS LPI GPIO [0 - 13]
> 
> This pin controller has some similarities compared to Top level
> msm SoC Pin controller like 'each pin belongs to a single group'
> and so on. However this one is intended to control only audio
> pins in particular, which can not be configured/touched by the
> Top level SoC pin controller except setting them as gpios.
> Apart from this, slew rate is also available in this block for
> certain pins which are connected to SLIMbus or SoundWire Bus.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Bjorn called my attention to a comment he made on this patch.
I'm not giving it a full review right now, but I have a
general suggestion below.

> ---
>   drivers/pinctrl/qcom/Kconfig             |   8 +
>   drivers/pinctrl/qcom/Makefile            |   1 +
>   drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 727 +++++++++++++++++++++++
>   3 files changed, 736 insertions(+)
>   create mode 100644 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> 
> diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
> index 5fe7b8aaf69d..d3e4e89c2810 100644
> --- a/drivers/pinctrl/qcom/Kconfig
> +++ b/drivers/pinctrl/qcom/Kconfig
> @@ -236,4 +236,12 @@ config PINCTRL_SM8250
>   	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
>   	  Technologies Inc SM8250 platform.
>   
> +config PINCTRL_LPASS_LPI
> +	tristate "Qualcomm Technologies Inc LPASS LPI pin controller driver"
> +	depends on GPIOLIB
> +	help
> +	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
> +	  Qualcomm Technologies Inc LPASS (Low Power Audio SubSystem) LPI
> +	  (Low Power Island) found on the Qualcomm Technologies Inc SoCs.
> +
>   endif
> diff --git a/drivers/pinctrl/qcom/Makefile b/drivers/pinctrl/qcom/Makefile
> index 9e3d9c91a444..c8520155fb1b 100644
> --- a/drivers/pinctrl/qcom/Makefile
> +++ b/drivers/pinctrl/qcom/Makefile
> @@ -28,3 +28,4 @@ obj-$(CONFIG_PINCTRL_SDM660)   += pinctrl-sdm660.o
>   obj-$(CONFIG_PINCTRL_SDM845) += pinctrl-sdm845.o
>   obj-$(CONFIG_PINCTRL_SM8150) += pinctrl-sm8150.o
>   obj-$(CONFIG_PINCTRL_SM8250) += pinctrl-sm8250.o
> +obj-$(CONFIG_PINCTRL_LPASS_LPI) += pinctrl-lpass-lpi.o
> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> new file mode 100644
> index 000000000000..96c63a33fc99
> --- /dev/null
> +++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> @@ -0,0 +1,727 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2016-2019, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2020 Linaro Ltd.
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/of.h>
> +#include <linux/pinctrl/pinconf-generic.h>
> +#include <linux/pinctrl/pinconf.h>
> +#include <linux/pinctrl/pinmux.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/types.h>
> +#include "../core.h"
> +#include "../pinctrl-utils.h"
> +
> +#define LPI_GPIO_CFG_REG		0x00
> +#define LPI_GPIO_VALUE_REG		0x04
> +#define LPI_SLEW_RATE_CTL_REG		0xa000
> +#define LPI_SLEW_RATE_MAX		0x03
> +#define LPI_SLEW_BITS_SIZE		0x02
> +#define LPI_GPIO_PULL_SHIFT		0x0
> +#define LPI_GPIO_PULL_MASK		GENMASK(1, 0)

. . .

If you have a mask like this, you do not need the shift.
The mask alone encodes both the position and the width
of the field you are describing.  It is better to use
just the one (mask) value and avoid even the possibility
of the mask and shift being inconsistent.  You halve the
number of symbols you need to describe fields too.

For the macros and functions in <linux/bitfield.h> the
mask values must be constant at compile time, but you
have that here.

For the LPI_GPIO_PULL, you use it below this way:
     pull = (ctl_reg & LPI_GPIO_PULL_MASK) >> LPI_GPIO_PULL_SHIFT;
Instead, use:
     pull = u32_get_bits(ctl_reg, LPI_GPIO_PULL_MASK);

I see you're using u32_replace_bits(), and what I see
looks good.  But you can use u32_encode_bits() as well.
For example, instead of:
     lpi_gpio_write(pctrl, group, LPI_GPIO_VALUE_REG,
                    value << LPI_GPIO_DIR_SHIFT);
Use:
     val = u32_encode_bits(value ? 1 : 0, LPI_GPIO_DIR_MASK);
     lpi_gpio_write(pctrl, group, LPI_GPIO_VALUE_REG, val);
(This one-bit mask might not be a great example.)

In addition to getting rid of extra symbols, using these
functions typically results in simpler-looking code.

					-Alex
