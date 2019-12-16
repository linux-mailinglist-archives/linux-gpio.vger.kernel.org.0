Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0790120864
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2019 15:17:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728060AbfLPOQh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Dec 2019 09:16:37 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:41476 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728012AbfLPOQg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Dec 2019 09:16:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1576505793;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iyyJmBM3fDcRwB4obuoYugCBOkwPjR5ZZAf85xRDFJI=;
        b=KCzjse/HcY9/CxSR86Gxk2x8igxsQ8idyv0eHiNL1sVeX0R5d0YNt5xnmF5xWVyAj4G33V
        ivKHzOQVA/TuG9dBPv7AqCIxzTHB34iV+aQPnWoPGtgTzAWvFyA09CBfiD1HnZNClgG0gw
        u2owYo53TulqouoJSLWmxAJLuoEBVLw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-J0tsTYqPOyyGeH768gc_Cg-1; Mon, 16 Dec 2019 09:16:32 -0500
X-MC-Unique: J0tsTYqPOyyGeH768gc_Cg-1
Received: by mail-wr1-f69.google.com with SMTP id l20so3792326wrc.13
        for <linux-gpio@vger.kernel.org>; Mon, 16 Dec 2019 06:16:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iyyJmBM3fDcRwB4obuoYugCBOkwPjR5ZZAf85xRDFJI=;
        b=uPqIgIB8/x6O/OWvHF4hfV6S4sBlI1TYAw8VrnwOqOQbLwxee76RR8tPphEGaRxqre
         XwKFnC29/pBRYpgEqQ8CR93ULoQu/ZasR65Y5zt7aSgWK8g1mX2OZDVwudhRv4DXsNJS
         NxblsSFgXjAqLJYWLgNG8ZS83EnBU2WQD3LTDC0iu/rODBucIWhtlg1/uyaysbsFEt3/
         9W5jIWERVxCXjHMAqSegp7CON+FsFU2XYZdAvO8arUG2tShPSC2ud5ulIbyzjgKmRgqX
         d3gpP315t/NUFnjEOh9XEMVR9EkkpDd7urPUocUY+G7yIYprKxhTmzIP0YSMveen0a87
         hvDA==
X-Gm-Message-State: APjAAAUSHC4Fy3kS2XGKY/A/C7JtDt3SNcGbVV4dfcVGIZp487Ps0hTs
        LCZgzesVuxxMw00b6M60RxLZ5zq3hhJEdjbvoFtZq5SqYJw6OnxNU3EyAv4x1uoYUasFY36ZsHD
        A0eZE9YORbkgWrP92fO8ggg==
X-Received: by 2002:adf:a308:: with SMTP id c8mr29838079wrb.240.1576505790873;
        Mon, 16 Dec 2019 06:16:30 -0800 (PST)
X-Google-Smtp-Source: APXvYqycr8vbMR7LAJzKT/83BL3q03HQov83Lat9afG86+vT2vXdgjwSHLffqAKplmr/V+CoUwBxgw==
X-Received: by 2002:adf:a308:: with SMTP id c8mr29838050wrb.240.1576505790643;
        Mon, 16 Dec 2019 06:16:30 -0800 (PST)
Received: from shalem.localdomain (2001-1c00-0c0c-fe00-7e79-4dac-39d0-9c14.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:7e79:4dac:39d0:9c14])
        by smtp.gmail.com with ESMTPSA id c9sm20297847wmc.47.2019.12.16.06.16.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2019 06:16:30 -0800 (PST)
Subject: Re: [PATCH 4/5] drm/i915/dsi: Move Crystal Cove PMIC panel GPIO
 lookup from mfd to the i915 driver
To:     =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc:     Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20191215163810.52356-1-hdegoede@redhat.com>
 <20191215163810.52356-5-hdegoede@redhat.com>
 <20191216135627.GS1208@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <25e93a0e-3f48-abd4-d2ba-07a4d03f7f7d@redhat.com>
Date:   Mon, 16 Dec 2019 15:16:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191216135627.GS1208@intel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 16-12-2019 14:56, Ville Syrjälä wrote:
> On Sun, Dec 15, 2019 at 05:38:09PM +0100, Hans de Goede wrote:
>> Move the Crystal Cove PMIC panel GPIO lookup-table from
>> drivers/mfd/intel_soc_pmic_core.c to the i915 driver.
>>
>> The moved looked-up table is adding a GPIO lookup to the i915 PCI
>> device and the GPIO subsys allows only one lookup table per device,
>>
>> The intel_soc_pmic_core.c code only adds lookup-table entries for the
>> PMIC panel GPIO (as it deals only with the PMIC), but we also need to be
>> able to access some GPIOs on the SoC itself, which requires entries for
>> these GPIOs in the lookup-table.
>>
>> Since the lookup-table is attached to the i915 PCI device it really
>> should be part of the i915 driver, this will also allow us to extend
>> it with GPIOs from other sources when necessary.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>   drivers/gpu/drm/i915/display/intel_dsi_vbt.c | 23 +++++++++++++++++++-
>>   drivers/mfd/intel_soc_pmic_core.c            | 19 ----------------
>>   2 files changed, 22 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
>> index 027970348b22..847f04eec2a1 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
>> @@ -25,6 +25,7 @@
>>    */
>>   
>>   #include <linux/gpio/consumer.h>
>> +#include <linux/gpio/machine.h>
>>   #include <linux/mfd/intel_soc_pmic.h>
>>   #include <linux/slab.h>
>>   
>> @@ -686,8 +687,18 @@ bool intel_dsi_vbt_init(struct intel_dsi *intel_dsi, u16 panel_id)
>>   
>>   /*
>>    * On some BYT/CHT devs some sequences are incomplete and we need to manually
>> - * control some GPIOs.
>> + * control some GPIOs. We need to add a GPIO lookup table before we get these.
>>    */
>> +static struct gpiod_lookup_table pmic_panel_gpio_table = {
>> +	/* Intel GFX is consumer */
>> +	.dev_id = "0000:00:02.0",
>> +	.table = {
>> +		/* Panel EN/DISABLE */
>> +		GPIO_LOOKUP("gpio_crystalcove", 94, "panel", GPIO_ACTIVE_HIGH),
>> +		{ },
>> +	},
>> +};
> 
> Feels like a failure in abstraction to have these irrelevant details
> exposed on the consumer side. Also slightly concerned that someone
> refactoring things in the pmic driver could now break this without
> realizing it. But if people want it done this way I can live with it.

Note how in the final patch we add another lookup for a GPIO called "panel"
but now on another GPIO controller. Since which GPIO controller has the
"panel" GPIO is specified by a bit in the VBT doing the lookup-table
registering from within the i915 code actually kinda makes sense.

> 
>> +
>>   void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi, bool panel_is_on)
>>   {
>>   	struct drm_device *dev = intel_dsi->base.base.dev;
>> @@ -697,6 +708,8 @@ void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi, bool panel_is_on)
>>   
>>   	if ((IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv)) &&
>>   	    (mipi_config->pwm_blc == PPS_BLC_PMIC)) {
>> +		gpiod_add_lookup_table(&pmic_panel_gpio_table);
>> +
>>   		intel_dsi->gpio_panel = gpiod_get(dev->dev, "panel", flags);
>>   		if (IS_ERR(intel_dsi->gpio_panel)) {
>>   			DRM_ERROR("Failed to own gpio for panel control\n");
>> @@ -707,8 +720,16 @@ void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi, bool panel_is_on)
>>   
>>   void intel_dsi_vbt_gpio_cleanup(struct intel_dsi *intel_dsi)
>>   {
>> +	struct drm_device *dev = intel_dsi->base.base.dev;
>> +	struct drm_i915_private *dev_priv = to_i915(dev);
>> +	struct mipi_config *mipi_config = dev_priv->vbt.dsi.config;
>> +
>>   	if (intel_dsi->gpio_panel) {
>>   		gpiod_put(intel_dsi->gpio_panel);
>>   		intel_dsi->gpio_panel = NULL;
>>   	}
>> +
>> +	if ((IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv)) &&
>> +	    (mipi_config->pwm_blc == PPS_BLC_PMIC))
> 
> Needless parens here as well.

Will fix for v2 (will also the other case).

> Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Thanks.

Regards,

Hans



> 
>> +		gpiod_remove_lookup_table(&pmic_panel_gpio_table);
>>   }
>> diff --git a/drivers/mfd/intel_soc_pmic_core.c b/drivers/mfd/intel_soc_pmic_core.c
>> index 47188df3080d..ddd64f9e3341 100644
>> --- a/drivers/mfd/intel_soc_pmic_core.c
>> +++ b/drivers/mfd/intel_soc_pmic_core.c
>> @@ -9,8 +9,6 @@
>>    */
>>   
>>   #include <linux/acpi.h>
>> -#include <linux/gpio/consumer.h>
>> -#include <linux/gpio/machine.h>
>>   #include <linux/i2c.h>
>>   #include <linux/interrupt.h>
>>   #include <linux/module.h>
>> @@ -25,17 +23,6 @@
>>   #define BYT_CRC_HRV		2
>>   #define CHT_CRC_HRV		3
>>   
>> -/* Lookup table for the Panel Enable/Disable line as GPIO signals */
>> -static struct gpiod_lookup_table panel_gpio_table = {
>> -	/* Intel GFX is consumer */
>> -	.dev_id = "0000:00:02.0",
>> -	.table = {
>> -		/* Panel EN/DISABLE */
>> -		GPIO_LOOKUP("gpio_crystalcove", 94, "panel", GPIO_ACTIVE_HIGH),
>> -		{ },
>> -	},
>> -};
>> -
>>   /* PWM consumed by the Intel GFX */
>>   static struct pwm_lookup crc_pwm_lookup[] = {
>>   	PWM_LOOKUP("crystal_cove_pwm", 0, "0000:00:02.0", "pwm_pmic_backlight", 0, PWM_POLARITY_NORMAL),
>> @@ -96,9 +83,6 @@ static int intel_soc_pmic_i2c_probe(struct i2c_client *i2c,
>>   	if (ret)
>>   		dev_warn(dev, "Can't enable IRQ as wake source: %d\n", ret);
>>   
>> -	/* Add lookup table binding for Panel Control to the GPIO Chip */
>> -	gpiod_add_lookup_table(&panel_gpio_table);
>> -
>>   	/* Add lookup table for crc-pwm */
>>   	pwm_add_table(crc_pwm_lookup, ARRAY_SIZE(crc_pwm_lookup));
>>   
>> @@ -121,9 +105,6 @@ static int intel_soc_pmic_i2c_remove(struct i2c_client *i2c)
>>   
>>   	regmap_del_irq_chip(pmic->irq, pmic->irq_chip_data);
>>   
>> -	/* Remove lookup table for Panel Control from the GPIO Chip */
>> -	gpiod_remove_lookup_table(&panel_gpio_table);
>> -
>>   	/* remove crc-pwm lookup table */
>>   	pwm_remove_table(crc_pwm_lookup, ARRAY_SIZE(crc_pwm_lookup));
>>   
>> -- 
>> 2.23.0
> 

