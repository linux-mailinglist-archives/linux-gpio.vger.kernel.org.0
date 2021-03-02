Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 447A232AD2F
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Mar 2021 03:15:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383851AbhCBV2U (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Mar 2021 16:28:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244065AbhCBS17 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Mar 2021 13:27:59 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 889C1C06178A;
        Tue,  2 Mar 2021 10:14:04 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id h98so20871558wrh.11;
        Tue, 02 Mar 2021 10:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OQsiKL11fYcXaJFsm+RLF0/6suSpUKjzUrq6zM2xi88=;
        b=NdOzAad9yJ9NcR12Fg14qaJoCAWmIUhXKcGtzU4+EkrE5+CAalpqE2LN+JPfxIiA1u
         Jj2RwhnWpzXnuMEX9/l2eDuFo6UGa2ogxcr5Gr0xSwesKR/+awM1gqoZYtXFDCms0s/n
         2J8iTPTgYqiYqG8e/pwOAZHc++0JA1ZNtZAnsTbumO9jGyq8vFMBA1TT9v6iAk2cG16t
         SaQHpL1NCqYeyXuPyuzSSV4/5BcnU87brl6CA7CrEwxzbk21ejRcnsyqixqAcQbXI+Bb
         BU0A4dtnqLhQb0e7nB7hkWk1nwN9e3lfZAGJdIbdNRIkO+4iY/f7kTh0gbuHYBF/ndLA
         8ltQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OQsiKL11fYcXaJFsm+RLF0/6suSpUKjzUrq6zM2xi88=;
        b=ZSDcXXq8PrepBjnZXcIUrBg5s+Eo3UsB314IezDguYPWSVJCAgJWKLYzVXTvDJ4XZd
         +ds4KYfIUBFeHzfnwNO/cKjzRKlA5v8kaciRbJvvLu9U/O8C7lmtlzN4LUMMJdomKPM8
         KGpoAPpcYBBfHoh8SAXLac+i8tJfcaKxZJcWkFP9oDkpXOKHFS7DizwevVPacPpNvyrO
         TVVyvhIs/B2UxDkTEUg5bV7YSj2BfTStaw7dhBKPZ9joK3E/EAR2hl09z9CJ+ag158cF
         0WdYs2q39tV03AmQwfFYr4onXggLvFMbBPFTN6OOACnVh+bftyJZml/rTmskm3wjuA+K
         cRbA==
X-Gm-Message-State: AOAM530e/ce8WHIEGFo23lEoEQsOAnBieNzipG0sE7ZEWmSMWI4ydI8v
        PSevYViUI1jVycaaw21j4qwH/8HLA67IEg==
X-Google-Smtp-Source: ABdhPJw/AsQ4EXYRp71egjYADSUB611O+tjRohzsLr2WTKraOPpPS+CLjrOHG4JGfHtBPUBzqlixlg==
X-Received: by 2002:a5d:6411:: with SMTP id z17mr21445157wru.119.1614708842815;
        Tue, 02 Mar 2021 10:14:02 -0800 (PST)
Received: from [192.168.1.10] (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id l15sm22644756wru.38.2021.03.02.10.14.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Mar 2021 10:14:02 -0800 (PST)
Subject: Re: [PATCH] gpio: regmap: move struct gpio_regmap definition
To:     Michael Walle <michael@walle.cc>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210302180601.12082-1-noltari@gmail.com>
 <b4a344af55ad238a554c56e31b1b87ed@walle.cc>
From:   =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>
Message-ID: <4af4b519-84eb-3cb4-bb0e-9c5ac6204348@gmail.com>
Date:   Tue, 2 Mar 2021 19:14:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <b4a344af55ad238a554c56e31b1b87ed@walle.cc>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: es-ES
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Michael,

El 02/03/2021 a las 19:10, Michael Walle escribió:
> Hi,
> 
> Am 2021-03-02 19:06, schrieb Álvaro Fernández Rojas:
>> struct gpio_regmap should be declared in gpio/regmap.h.
>> This way other drivers can access the structure data when registering 
>> a gpio
>> regmap controller.
> 
> The intention was really to keep this private to the gpio-regmap
> driver. Why do you need to access to the properties?

I'm trying to add support for bcm63xx pin controllers, and Linus 
suggested that I could use gpio regmap instead of adding duplicated code.
However, I need to access gpio_chip inside gpio_regmap to call 
pinctrl_add_gpio_range() with gpio_chip.base.

> 
> -michael
> 
>> Fixes: ebe363197e52 ("gpio: add a reusable generic gpio_chip using 
>> regmap")
>> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
>> ---
>>  drivers/gpio/gpio-regmap.c  | 20 ------------------
>>  include/linux/gpio/regmap.h | 41 ++++++++++++++++++++++++++++++++++++-
>>  2 files changed, 40 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
>> index 5412cb3b0b2a..23b0a8572f53 100644
>> --- a/drivers/gpio/gpio-regmap.c
>> +++ b/drivers/gpio/gpio-regmap.c
>> @@ -11,26 +11,6 @@
>>  #include <linux/module.h>
>>  #include <linux/regmap.h>
>>
>> -struct gpio_regmap {
>> -    struct device *parent;
>> -    struct regmap *regmap;
>> -    struct gpio_chip gpio_chip;
>> -
>> -    int reg_stride;
>> -    int ngpio_per_reg;
>> -    unsigned int reg_dat_base;
>> -    unsigned int reg_set_base;
>> -    unsigned int reg_clr_base;
>> -    unsigned int reg_dir_in_base;
>> -    unsigned int reg_dir_out_base;
>> -
>> -    int (*reg_mask_xlate)(struct gpio_regmap *gpio, unsigned int base,
>> -                  unsigned int offset, unsigned int *reg,
>> -                  unsigned int *mask);
>> -
>> -    void *driver_data;
>> -};
>> -
>>  static unsigned int gpio_regmap_addr(unsigned int addr)
>>  {
>>      if (addr == GPIO_REGMAP_ADDR_ZERO)
>> diff --git a/include/linux/gpio/regmap.h b/include/linux/gpio/regmap.h
>> index ad76f3d0a6ba..ce2fc6e9b62b 100644
>> --- a/include/linux/gpio/regmap.h
>> +++ b/include/linux/gpio/regmap.h
>> @@ -4,13 +4,52 @@
>>  #define _LINUX_GPIO_REGMAP_H
>>
>>  struct device;
>> -struct gpio_regmap;
>>  struct irq_domain;
>>  struct regmap;
>>
>>  #define GPIO_REGMAP_ADDR_ZERO ((unsigned int)(-1))
>>  #define GPIO_REGMAP_ADDR(addr) ((addr) ? : GPIO_REGMAP_ADDR_ZERO)
>>
>> +/**
>> + * struct gpio_regmap - GPIO regmap controller
>> + * @parent:        The parent device
>> + * @regmap:        The regmap used to access the registers
>> + *            given, the name of the device is used
>> + * @gpio_chip:        GPIO chip controller
>> + * @ngpio_per_reg:    Number of GPIOs per register
>> + * @reg_stride:        (Optional) May be set if the registers (of the
>> + *            same type, dat, set, etc) are not consecutive.
>> + * @reg_dat_base:    (Optional) (in) register base address
>> + * @reg_set_base:    (Optional) set register base address
>> + * @reg_clr_base:    (Optional) clear register base address
>> + * @reg_dir_in_base:    (Optional) in setting register base address
>> + * @reg_dir_out_base:    (Optional) out setting register base address
>> + * @reg_mask_xlate:     (Optional) Translates base address and GPIO
>> + *            offset to a register/bitmask pair. If not
>> + *            given the default gpio_regmap_simple_xlate()
>> + *            is used.
>> + * @driver_data:    (Optional) driver-private data
>> + */
>> +struct gpio_regmap {
>> +    struct device *parent;
>> +    struct regmap *regmap;
>> +    struct gpio_chip gpio_chip;
>> +
>> +    int reg_stride;
>> +    int ngpio_per_reg;
>> +    unsigned int reg_dat_base;
>> +    unsigned int reg_set_base;
>> +    unsigned int reg_clr_base;
>> +    unsigned int reg_dir_in_base;
>> +    unsigned int reg_dir_out_base;
>> +
>> +    int (*reg_mask_xlate)(struct gpio_regmap *gpio, unsigned int base,
>> +                  unsigned int offset, unsigned int *reg,
>> +                  unsigned int *mask);
>> +
>> +    void *driver_data;
>> +};
>> +
>>  /**
>>   * struct gpio_regmap_config - Description of a generic regmap 
>> gpio_chip.
>>   * @parent:        The parent device

Best regards,
Álvaro.
