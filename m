Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 700DD14AAB
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2019 15:16:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726276AbfEFNQS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 May 2019 09:16:18 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:39517 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725813AbfEFNQS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 May 2019 09:16:18 -0400
Received: by mail-wr1-f67.google.com with SMTP id v10so4935841wrt.6
        for <linux-gpio@vger.kernel.org>; Mon, 06 May 2019 06:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=18TZi7HJqbevJekNLdT+mAWmUKoRB1YIHNeNsjFsnnc=;
        b=iPGVUMGhPMockxgTbOI3sn8sGlBa1Au4bwwaBydHb4r9RQgcYWeNPiIPX/wNr/t6Xu
         K5ETdNfECor8dne36xxQK5zEU53h0mC27bkEwGynGkyj4TSDk1o0DArcAkHHgTLh3pv+
         VsAhuTollFNu+TLasYGlDMpWPB3R6Iejp14qmc9l1LRA/PVpxdNc1j1P8IUG4W9bUT17
         HTkvBNt53i+GTx/oHLvM7bkSXAaNJcNyRhDRJptPvGlUAUjA3H7NaiBZt/ovblZCw/H5
         K1eDQAbQBRbKOItPSoOyJCeOvZ9yfx8DVQUYCyv4/eLq/gGKaQQznM/R/QsZH3A0nyhG
         n3YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=18TZi7HJqbevJekNLdT+mAWmUKoRB1YIHNeNsjFsnnc=;
        b=TkkMdujYm+WOAnRqRz1Zuig5yjhzxuFapmcZgVHwMYzpRraYxPNuZt0++8xmMyapk1
         A9x9ySKgWvNY22IVesuIoBBV46L/PV5n3JI9qstFzm1/WgpbS4id7dH1kewW8cbiO833
         MeEp9CIhoXoqlriEkPm0ZgJh5wdoFSnzB0nxNehLIwU2U2cGTreHFTj90yFzZX31Qa9y
         Lx+naK+PvxjnXrZ6pcRHiCTwYVCvJSdOc6jdJ2hlgGefa7tGPmHBxW8c1NU9UitxLUn9
         LbolZ1hyX+YSZWSXYaPyjKkk0w86w9ARbTlsUBoTs5ZbsrV0ebBs6KwHE8dqKQV6wy/S
         5OaQ==
X-Gm-Message-State: APjAAAWPiRqZTsT5NFXAOfVawESdF9D1sv1UgK0/TeuHAD1ikpKmJB41
        iqy1sa+/zDcO9u8PktMZdVdWbA==
X-Google-Smtp-Source: APXvYqxoE5FbaJro+4jidLuNg7WX7RQDizwsdFXBCIScA9DW2XwYuNmEmCjZ9giuGYHnVKIR7gSeQQ==
X-Received: by 2002:a5d:65cc:: with SMTP id e12mr4527669wrw.315.1557148576135;
        Mon, 06 May 2019 06:16:16 -0700 (PDT)
Received: from [10.1.4.98] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id k205sm19768122wma.46.2019.05.06.06.16.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 May 2019 06:16:13 -0700 (PDT)
Subject: Re: [PATCH v2 4/4] pinctrl: meson: add support of drive-strength-uA
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        khilman@baylibre.com, linux-gpio@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20190418124758.24022-1-glaroque@baylibre.com>
 <20190418124758.24022-5-glaroque@baylibre.com>
 <CAFBinCDNz1txJ7_aQU8MwjpeVFC6BgyG_gkg-jJRnnerSjbP9A@mail.gmail.com>
 <163fa4df-1017-d230-b264-51ea71236df9@baylibre.com>
 <CAFBinCBemJT5p7F0b3Qy+wwmaW4hTgs0jgKrLVd1ciugCGc48w@mail.gmail.com>
From:   guillaume La Roque <glaroque@baylibre.com>
Message-ID: <d6fdc1aa-8ed2-4b97-ed63-d84a03575356@baylibre.com>
Date:   Mon, 6 May 2019 15:16:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAFBinCBemJT5p7F0b3Qy+wwmaW4hTgs0jgKrLVd1ciugCGc48w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

hi Martin,


On 4/30/19 10:28 PM, Martin Blumenstingl wrote:
> Hi Guillaume,
>
> On Tue, Apr 30, 2019 at 9:20 AM guillaume La Roque
> <glaroque@baylibre.com> wrote:
>> Hi Martin,
>>
>>
>> thanks for your feedback.
>>
>>
>> On 4/27/19 9:44 PM, Martin Blumenstingl wrote:
>>> Hi Guillaume,
>>>
>>> On Thu, Apr 18, 2019 at 2:48 PM Guillaume La Roque
>>> <glaroque@baylibre.com> wrote:
>>>> drive-strength-uA is a new feature needed for G12A SoC.
>>>> the default DS setting after boot is usually 500uA and it is not enough for
>>>> many functions. We need to be able to set the drive strength to reliably
>>>> enable things like MMC, I2C, etc ...
>>>>
>>>> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
>>> I gave this a go on Meson8m2 (meaning I applied all four patches from
>>> this series and booted the result on my board):
>>> [Meson8m2 doesn't support drive strength and still boots without any
>>> crashes or obvious regressions]
>>> Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>>>
>>>> ---
>>>>  drivers/pinctrl/meson/pinctrl-meson-g12a.c |  36 ++---
>>>>  drivers/pinctrl/meson/pinctrl-meson.c      | 166 ++++++++++++++++-----
>>>>  drivers/pinctrl/meson/pinctrl-meson.h      |  20 ++-
>>> personally I would have split this into two separate patches:
>>> - one for the generic pinctrl-meson part which adds drive-strength-uA support
>>> - another patch for enabling this on G12A
>>>
>>> if nobody else wants you to split this then it's fine for me as well
>>
>> why not if i send new series i will do.
> great, thank you
>
> [...]
>>> additionally the function arguments are not consistent with
>>> meson_pinconf_get_drive_strength():
>>> - here you pass the pinctrl subsystem specific parameters (enum
>>> pin_config_param conf)
>>> - in meson_pinconf_get_drive_strength the conversion for pinctrl
>>> subsystem specific values (pinconf_to_config_argument) is part of
>>> meson_pinconf_set
>>
>> for param i'm not sure i understand what you want, if you talk about difference between set_bias and set_drive arg , it's difficult to align it.
>>
>> if it's about diff between get_bias and get_drive i think i can return drive stength value instead of using an u16 arg input param.
> let me use an example to better explain what I mean.
>
> meson_pinconf_set(struct pinctrl_dev *pcdev, unsigned int pin,
> unsigned long *configs, unsigned num_configs)
> -> this uses parameters from the pinctrl subsystem only (struct
> pinctrl_dev, configs/pinconf_to_config_argument)
>
> meson_pinconf_get_pull(struct meson_pinctrl *pc, unsigned int pin)
> meson_pinconf_set_drive_strength(struct meson_pinctrl *pc, unsigned
> int pin, u16 drive_strength_ua)
> -> these use hardware-specific parameters only (struct meson_pinctrl,
> [drive strength in uA])
>
> meson_pinconf_set_bias(struct meson_pinctrl *pc, unsigned int pin,
> enum pin_config_param conf)
> -> this mixes hardware-specific parameters (struct meson_pinctrl) with
> parameters from the pinctrl subsystem (enum pin_config_param conf)


ok i see, it fix in next series.

>
>>> I'm wondering whether two separate functions
>>> (meson_pinconf_disable_bias and meson_pinconf_enable_bias) would make
>>> things easier to read. I haven't tried whether this would really make
>>> things better, so I'd like to hear your opinion on this Guillaume!
>>
>> no special opinion on this, if you think it's better for understanding i can separate  set_bias function.
> this goes with the mixed parameters from my previous comment: if we
> stick to the way these "private" functions are defined the "set bias"
> function parameters should be hardware/driver specific (in other
> words: don't use enum pin_config_param conf)
> so my initial idea was to keep the switch/case for enum
> pin_config_param in meson_pinconf_set and to have these function
> declarations:
> - meson_pinconf_disable_bias(struct meson_pinctrl *pc, unsigned int pin)
> - meson_pinconf_enable_bias(struct meson_pinctrl *pc, unsigned int
> pin, bool pull_up)
>
> and to make it clear: I haven't tested whether this *really* looks
> better when fully implemented.
> let me know what you think - I'm happy with anything that others will
> understand in the end (to make easy to catch potential breakage in a
> code-review ;))


what i would like to say is it ok for me, it's better to review.

i will do one patch for enable/disable bias function, one for adding drive-strength function and one for adding G12A part.


>>> [...]
>>>> +static int meson_pinconf_set_drive_strength(struct meson_pinctrl *pc,
>>>> +                                           unsigned int pin, u16 arg)
>>>>  {
>>>> -       struct meson_pinctrl *pc = pinctrl_dev_get_drvdata(pcdev);
>>>>         struct meson_bank *bank;
>>>> -       enum pin_config_param param;
>>>>         unsigned int reg, bit;
>>>> -       int i, ret;
>>>> +       unsigned int ds_val;
>>>> +       int ret;
>>>> +
>>>> +       if (!pc->reg_ds) {
>>>> +               dev_err(pc->dev, "drive-strength not supported\n");
>>>> +               return -ENOTSUPP;
>>> in meson_pinconf_set() we don't complain (with a dev_err) for this case.
>>> I'm not sure what the best-practice is for the pinctrl subsystem,
>>> maybe Linus can comment on this
>>>
>> this check is to be sure it's possible to set drive stength,
>>
>> if no register bank is setting in DT but drive-stength properties are setting on pins i need to generate an error
>>
>> because something is wrong.
> OK, I see, there are two different use-cases:
> - meson_pinconf_set returns -ENOTSUPP in the "default" case if the
> pin_config_param is not supported but no error message
> - we don't differentiate between SoCs PIN_CONFIG_DRIVE_STRENGTH_UA is
> always delegated from meson_pinconf_set() to
> meson_pinconf_set_drive_strength(). you also return -ENOTSUPP and
> print an error message
>
> what I meant with my original comment is that there are two different
> "-ENOTSUPP" cases but only one prints an error.
> I don't know if there are any rules in the pinctrl subsystem how these
> cases should be implemented, maybe Linus W. can give his feedback on
> this topic.


i just add error message for drive strength because it's an optional feature, people can forget to set register part and just set pin part

so they can see why it's not working.


>>>> +       }
>>>>
>>>>         ret = meson_get_bank(pc, pin, &bank);
>>>>         if (ret)
>>>>                 return ret;
>>>>
>>>> +       meson_calc_reg_and_bit(bank, pin, REG_DS, &reg, &bit);
>>>> +       bit = bit << 1;
>>>> +
>>>> +       if (arg <= 500) {
>>>> +               ds_val = MESON_PINCONF_DRV_500UA;
>>>> +       } else if (arg <= 2500) {
>>>> +               ds_val = MESON_PINCONF_DRV_2500UA;
>>>> +       } else if (arg <= 3000) {
>>>> +               ds_val = MESON_PINCONF_DRV_3000UA;
>>>> +       } else if (arg <= 4000) {
>>>> +               ds_val = MESON_PINCONF_DRV_4000UA;
>>>> +       } else {
>>>> +               dev_warn_once(pc->dev,
>>>> +                             "pin %u: invalid drive-strength : %d , default to 4mA\n",
>>>> +                             pin, arg);
>>>> +               ds_val = MESON_PINCONF_DRV_4000UA;
>>> why not return -EINVAL here? (my assumption is that the pinctrl
>>> subsystem would like to have -EINVAL instead of drivers doing
>>> fallbacks if the values are out-of-range, but I'm not 100% sure about
>>> this)
>>>
>>> [...]
>>
>> i choose to set a default value instead of generating an error,
>>
>> in this case it's only if you ask a value upper than 4000uA so it's not really a risk to set 4000uA by default.
> in that case I'm fine with it if Linus W. is happy as well (I'm not
> sure if there are any rules about "fallback values" in the pinctrl
> subsystem)
>
>>>> +static int meson_pinconf_get_drive_strength(struct meson_pinctrl *pc,
>>>> +                                           unsigned int pin, u16 *arg)
>>>> +{
>>>> +       struct meson_bank *bank;
>>>> +       unsigned int reg, bit;
>>>> +       unsigned int val;
>>>> +       int ret;
>>>> +
>>> do you need to return -ENOTSUPP here if pc->reg_ds is NULL, similar to
>>> what you already have in meson_pinconf_set_drive_strength()?
>> depending of linux comment on your feedback on meson_pinconf_set_drive_strength
> great, thank you!
>
>
> Martin


Guillaume

