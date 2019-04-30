Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54712F12D
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Apr 2019 09:20:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726145AbfD3HUn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Apr 2019 03:20:43 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:46288 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725790AbfD3HUn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Apr 2019 03:20:43 -0400
Received: by mail-wr1-f68.google.com with SMTP id t17so19642381wrw.13
        for <linux-gpio@vger.kernel.org>; Tue, 30 Apr 2019 00:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=aRa1oMl7BPfIcrrXKKTsMjiZdy+/hmccN7h1VJVS7gQ=;
        b=mjghxqf1jTRJExGxXH1YTBoaKblBiSB5Yj0LSpkqfIB1i7A91LZ3Lbjnbd1n6S8IZw
         tZM1uSIW0EXgWawRWk3aipWYDj7bccS4pwIZ21IaLcntc3x5hJs9MhOX+KPO8Ly2mUJE
         XxszTn5MTyy02NxoXBbuUX3tz6drqfarXo3CmkUPdRn+9qe7DEtHkppzIUFUbBNKLkWc
         +80d8MsoqUuT9cIzLSnS/e9ki7allkkaTa0+awabMh4BPqtTn4UtuqWB+b1U8qLiauyM
         usVApgWmnoDsoBf9WJIkK3hctU1fMH4pg80NhUoFUSBwtN1x/SABUZkkYjg9rfKIW+N9
         0DKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=aRa1oMl7BPfIcrrXKKTsMjiZdy+/hmccN7h1VJVS7gQ=;
        b=LyNe+37b8tRvyLA0YWUXxABtN2fbvBJTT9DbFUxXyFzIax3bzp7iCSahR4uOj5fW7Q
         kA+i5sEbNLZ+JJbks1iFQdzd9i/4HkgBafDh4Wq+mXFQVfc+p5jl3sZkI4xeV1+XUJff
         yeYNdO0dbX+40H5+f9u166eD33w/8gWMIg2sPvbCvvrBy81aF1WrLilJFmPyDsi/nQnc
         2YxT77XZ2DYdI4gKQOBNIyYZVFmi+4f6D/VaMt2rJvcOZJSxY2kb4uzpiWPU9ct6oXzp
         gxrgPrWdbHC93A+cZBBywNmbbHD6u35oGGboHLqR12CWTbRWE5a10HuwiYaRUsRyShcl
         Dswg==
X-Gm-Message-State: APjAAAVdu6IIVgRbV4/7/MMf3JsxbyTIjFI3LpBvMuMjPEDhE8NI77q0
        IWhyjCdEp3dCwcfzz59q/ZchGQ==
X-Google-Smtp-Source: APXvYqzlHtzPwgu4LI5CtelmSBOfpRajm8GU9mPuq6zH7UNMGGY/g/MFTZ3BfqSqOBx/MWgY+CF2/A==
X-Received: by 2002:a5d:5343:: with SMTP id t3mr7044738wrv.262.1556608840847;
        Tue, 30 Apr 2019 00:20:40 -0700 (PDT)
Received: from ?IPv6:2a01:cb1d:379:8b00:1910:6694:7019:d3a? ([2a01:cb1d:379:8b00:1910:6694:7019:d3a])
        by smtp.gmail.com with ESMTPSA id d11sm1364218wmb.39.2019.04.30.00.20.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Apr 2019 00:20:40 -0700 (PDT)
Subject: Re: [PATCH v2 4/4] pinctrl: meson: add support of drive-strength-uA
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        khilman@baylibre.com, linux-gpio@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20190418124758.24022-1-glaroque@baylibre.com>
 <20190418124758.24022-5-glaroque@baylibre.com>
 <CAFBinCDNz1txJ7_aQU8MwjpeVFC6BgyG_gkg-jJRnnerSjbP9A@mail.gmail.com>
From:   guillaume La Roque <glaroque@baylibre.com>
Message-ID: <163fa4df-1017-d230-b264-51ea71236df9@baylibre.com>
Date:   Tue, 30 Apr 2019 09:20:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAFBinCDNz1txJ7_aQU8MwjpeVFC6BgyG_gkg-jJRnnerSjbP9A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Martin,


thanks for your feedback.


On 4/27/19 9:44 PM, Martin Blumenstingl wrote:
> Hi Guillaume,
>
> On Thu, Apr 18, 2019 at 2:48 PM Guillaume La Roque
> <glaroque@baylibre.com> wrote:
>> drive-strength-uA is a new feature needed for G12A SoC.
>> the default DS setting after boot is usually 500uA and it is not enough for
>> many functions. We need to be able to set the drive strength to reliably
>> enable things like MMC, I2C, etc ...
>>
>> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> I gave this a go on Meson8m2 (meaning I applied all four patches from
> this series and booted the result on my board):
> [Meson8m2 doesn't support drive strength and still boots without any
> crashes or obvious regressions]
> Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>
>> ---
>>  drivers/pinctrl/meson/pinctrl-meson-g12a.c |  36 ++---
>>  drivers/pinctrl/meson/pinctrl-meson.c      | 166 ++++++++++++++++-----
>>  drivers/pinctrl/meson/pinctrl-meson.h      |  20 ++-
> personally I would have split this into two separate patches:
> - one for the generic pinctrl-meson part which adds drive-strength-uA support
> - another patch for enabling this on G12A
>
> if nobody else wants you to split this then it's fine for me as well


why not if i send new series i will do.


>
>>  3 files changed, 163 insertions(+), 59 deletions(-)
>>
>> diff --git a/drivers/pinctrl/meson/pinctrl-meson-g12a.c b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
>> index d494492e98e9..3475cd7bd2af 100644
>> --- a/drivers/pinctrl/meson/pinctrl-meson-g12a.c
>> +++ b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
>> @@ -1304,28 +1304,28 @@ static struct meson_pmx_func meson_g12a_aobus_functions[] = {
>>  };
>>
>>  static struct meson_bank meson_g12a_periphs_banks[] = {
>> -       /* name  first  last  irq  pullen  pull  dir  out  in */
>> -       BANK("Z",    GPIOZ_0,    GPIOZ_15, 12, 27,
>> -            4,  0,  4,  0,  12,  0,  13, 0,  14, 0),
>> -       BANK("H",    GPIOH_0,    GPIOH_8, 28, 36,
>> -            3,  0,  3,  0,  9,  0,  10,  0,  11,  0),
>> -       BANK("BOOT", BOOT_0,     BOOT_15,  37, 52,
>> -            0,  0,  0,  0,  0, 0,  1, 0,  2, 0),
>> -       BANK("C",    GPIOC_0,    GPIOC_7,  53, 60,
>> -            1,  0,  1,  0,  3, 0,  4, 0,  5, 0),
>> -       BANK("A",    GPIOA_0,    GPIOA_15,  61, 76,
>> -            5,  0,  5,  0,  16,  0,  17,  0,  18,  0),
>> -       BANK("X",    GPIOX_0,    GPIOX_19,   77, 96,
>> -            2,  0,  2,  0,  6,  0,  7,  0,  8,  0),
>> +       /* name  first  last  irq  pullen  pull  dir  out  in  ds */
>> +       BANK_DS("Z",    GPIOZ_0,    GPIOZ_15, 12, 27,
>> +               4,  0,  4,  0,  12,  0,  13, 0,  14, 0, 5, 0),
>> +       BANK_DS("H",    GPIOH_0,    GPIOH_8, 28, 36,
>> +               3,  0,  3,  0,  9,  0,  10,  0,  11,  0, 4, 0),
>> +       BANK_DS("BOOT", BOOT_0,     BOOT_15,  37, 52,
>> +               0,  0,  0,  0,  0, 0,  1, 0,  2, 0, 0, 0),
>> +       BANK_DS("C",    GPIOC_0,    GPIOC_7,  53, 60,
>> +               1,  0,  1,  0,  3, 0,  4, 0,  5, 0, 1, 0),
>> +       BANK_DS("A",    GPIOA_0,    GPIOA_15,  61, 76,
>> +               5,  0,  5,  0,  16,  0,  17,  0,  18,  0, 6, 0),
>> +       BANK_DS("X",    GPIOX_0,    GPIOX_19,   77, 96,
>> +               2,  0,  2,  0,  6,  0,  7,  0,  8,  0, 2, 0),
>>  };
>>
>>  static struct meson_bank meson_g12a_aobus_banks[] = {
>> -       /* name  first  last  irq  pullen  pull  dir  out  in  */
>> -       BANK("AO",   GPIOAO_0,  GPIOAO_11,  0, 11,
>> -            3,  0,  2, 0,  0,  0,  4, 0,  1,  0),
>> +       /* name  first  last  irq  pullen  pull  dir  out  in  ds */
>> +       BANK_DS("AO", GPIOAO_0, GPIOAO_11, 0, 11, 3, 0, 2, 0, 0, 0, 4, 0, 1, 0,
>> +               0, 0),
>>         /* GPIOE actually located in the AO bank */
>> -       BANK("E",   GPIOE_0,  GPIOE_2,   97, 99,
>> -            3,  16,  2, 16,  0,  16,  4, 16,  1,  16),
>> +       BANK_DS("E", GPIOE_0, GPIOE_2, 97, 99, 3, 16, 2, 16, 0, 16, 4, 16, 1,
>> +               16, 1, 0),
>>  };
> these definitions are really hard to read, but it's been like this
> even before your patch
>
>>  static struct meson_pmx_bank meson_g12a_periphs_pmx_banks[] = {
>> diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
>> index 96a4a72708e4..5108e5aa6514 100644
>> --- a/drivers/pinctrl/meson/pinctrl-meson.c
>> +++ b/drivers/pinctrl/meson/pinctrl-meson.c
>> @@ -174,62 +174,106 @@ int meson_pmx_get_groups(struct pinctrl_dev *pcdev, unsigned selector,
>>         return 0;
>>  }
>>
>> -static int meson_pinconf_set(struct pinctrl_dev *pcdev, unsigned int pin,
>> -                            unsigned long *configs, unsigned num_configs)
>> +static int meson_pinconf_set_bias(struct meson_pinctrl *pc, unsigned int pin,
>> +                                 enum pin_config_param conf)
> can you please confirm that I understood the purpose of this correctly:
> I think you introduce this to make setting the bias consistent with
> how you set the drive-strength.
> if so then it would be great to have a separate patch which describes
> that it's only a code-style change and a functional no-op


you  are right, i will separate this changes.


>
> additionally the function arguments are not consistent with
> meson_pinconf_get_drive_strength():
> - here you pass the pinctrl subsystem specific parameters (enum
> pin_config_param conf)
> - in meson_pinconf_get_drive_strength the conversion for pinctrl
> subsystem specific values (pinconf_to_config_argument) is part of
> meson_pinconf_set


for param i'm not sure i understand what you want, if you talk about difference between set_bias and set_drive arg , it's difficult to align it.

if it's about diff between get_bias and get_drive i think i can return drive stength value instead of using an u16 arg input param.


> I'm wondering whether two separate functions
> (meson_pinconf_disable_bias and meson_pinconf_enable_bias) would make
> things easier to read. I haven't tried whether this would really make
> things better, so I'd like to hear your opinion on this Guillaume!


no special opinion on this, if you think it's better for understanding i can separate  set_bias function.


>
> [...]
>> +static int meson_pinconf_set_drive_strength(struct meson_pinctrl *pc,
>> +                                           unsigned int pin, u16 arg)
>>  {
>> -       struct meson_pinctrl *pc = pinctrl_dev_get_drvdata(pcdev);
>>         struct meson_bank *bank;
>> -       enum pin_config_param param;
>>         unsigned int reg, bit;
>> -       int i, ret;
>> +       unsigned int ds_val;
>> +       int ret;
>> +
>> +       if (!pc->reg_ds) {
>> +               dev_err(pc->dev, "drive-strength not supported\n");
>> +               return -ENOTSUPP;
> in meson_pinconf_set() we don't complain (with a dev_err) for this case.
> I'm not sure what the best-practice is for the pinctrl subsystem,
> maybe Linus can comment on this
>

this check is to be sure it's possible to set drive stength,

if no register bank is setting in DT but drive-stength properties are setting on pins i need to generate an error

because something is wrong.


>> +       }
>>
>>         ret = meson_get_bank(pc, pin, &bank);
>>         if (ret)
>>                 return ret;
>>
>> +       meson_calc_reg_and_bit(bank, pin, REG_DS, &reg, &bit);
>> +       bit = bit << 1;
>> +
>> +       if (arg <= 500) {
>> +               ds_val = MESON_PINCONF_DRV_500UA;
>> +       } else if (arg <= 2500) {
>> +               ds_val = MESON_PINCONF_DRV_2500UA;
>> +       } else if (arg <= 3000) {
>> +               ds_val = MESON_PINCONF_DRV_3000UA;
>> +       } else if (arg <= 4000) {
>> +               ds_val = MESON_PINCONF_DRV_4000UA;
>> +       } else {
>> +               dev_warn_once(pc->dev,
>> +                             "pin %u: invalid drive-strength : %d , default to 4mA\n",
>> +                             pin, arg);
>> +               ds_val = MESON_PINCONF_DRV_4000UA;
> why not return -EINVAL here? (my assumption is that the pinctrl
> subsystem would like to have -EINVAL instead of drivers doing
> fallbacks if the values are out-of-range, but I'm not 100% sure about
> this)
>
> [...]


i choose to set a default value instead of generating an error,

in this case it's only if you ask a value upper than 4000uA so it's not really a risk to set 4000uA by default.


>> +static int meson_pinconf_get_drive_strength(struct meson_pinctrl *pc,
>> +                                           unsigned int pin, u16 *arg)
>> +{
>> +       struct meson_bank *bank;
>> +       unsigned int reg, bit;
>> +       unsigned int val;
>> +       int ret;
>> +
> do you need to return -ENOTSUPP here if pc->reg_ds is NULL, similar to
> what you already have in meson_pinconf_set_drive_strength()?

depending of linux comment on your feedback on meson_pinconf_set_drive_strength

i will update this part .


>
>
> Regards
> Martin


Regards

Guillaume

