Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4214F188D8
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2019 13:23:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726078AbfEILXi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 May 2019 07:23:38 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:44917 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725943AbfEILXi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 May 2019 07:23:38 -0400
Received: by mail-wr1-f67.google.com with SMTP id c5so2478011wrs.11
        for <linux-gpio@vger.kernel.org>; Thu, 09 May 2019 04:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=QbQVmm5kTPfjwTeheDAImVCSFxDl7nBIwz2lP0tNHF0=;
        b=sK17qvKkXDx4s64pSQNjCngs9OQU52XPrp+gxv4lRk3v8d4mOoIZXVq3Vaarimmlrq
         AOD/w2G5QKINRXCfKMncOcuBu/q+Cx7MK8g1DqFrjzhCh5eewnzXQMzfhaV4xNP4bwY3
         WwjWuxkzk5zDCsy28TQg2hOJ76iS5oHwuDZC8ikEPHdBxtDDJaxQ2P0CGB1wq+M7SEdE
         4WskH5xwUQp3d2G+zChI3dgbcQzbaM57PIGQr1CXrzR9huJ/bYOp3pVa0wWdw0scY7ru
         5KI0u1/3rjHfExx162bvTfZxXt2MX6IGmHkQbVg5TUqG7Z2QHOhNvX+rxJ2zYew8k0Ja
         fChg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=QbQVmm5kTPfjwTeheDAImVCSFxDl7nBIwz2lP0tNHF0=;
        b=prqjbgnsDM8wPpEQWMsTlxJWMtqNWAkgWEMgc429geIiMSYBfDQXcRGIEzV53fkKUh
         t7QEEl1NpA5CqZr4YiVrB5Ic4QeMxEx/mfOZkmRsrAEFPJ81Qh0D1qtsXY8AzPbAIsUf
         iNJbe3weULHR7+rRStlwKtFEUyiCR+gjUIJ4tTbBPIb2dooxVsDmL95ukGux2YP6/UzO
         xwJcpwztuvcxWcMTzIIxp59x5puw91d6syfgBCMUe8e8pRBANX8fQzWNjow1gbmLkdWa
         RUt9+EPHOyRYL2PYYdkJSK34jHPUX1unEZtnxTOeT/ozslskh1+Vxbq7ncCjq1mMGKSO
         Lt8Q==
X-Gm-Message-State: APjAAAU+L1aZUsSOorwEUqx8OULGRrzPC2Z9toco0vUbNlux73gfrmOO
        R5G9f6YlXYsVH6YR59K+7RQVhkLpua+POQ==
X-Google-Smtp-Source: APXvYqwjmio7MmarVn6V+z0/UE3KJNGuVdLA7K6Ckein2WdmuT9vo+z7y8Y4Yugc0VmrpR+bH8NFOw==
X-Received: by 2002:a5d:5501:: with SMTP id b1mr2534545wrv.196.1557401016591;
        Thu, 09 May 2019 04:23:36 -0700 (PDT)
Received: from ?IPv6:2a01:cb1d:379:8b00:1910:6694:7019:d3a? ([2a01:cb1d:379:8b00:1910:6694:7019:d3a])
        by smtp.gmail.com with ESMTPSA id p17sm2274853wrg.92.2019.05.09.04.23.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 May 2019 04:23:35 -0700 (PDT)
Subject: Re: [PATCH v3 5/6] pinctrl: meson: add support of
 drive-strength-microamp
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        khilman@baylibre.com, linux-gpio@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20190507115726.23714-1-glaroque@baylibre.com>
 <20190507115726.23714-6-glaroque@baylibre.com>
 <CAFBinCC-wYD1ZJ8Dd6mwd=qAqi8YX0=VacjbEc-bxKrQnZvwDA@mail.gmail.com>
From:   guillaume La Roque <glaroque@baylibre.com>
Message-ID: <4e44984f-eb76-87d1-e458-506bcccf1500@baylibre.com>
Date:   Thu, 9 May 2019 13:23:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAFBinCC-wYD1ZJ8Dd6mwd=qAqi8YX0=VacjbEc-bxKrQnZvwDA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

hi martin,


thanks for review, i will do a new series to remove err log on get_drive_strength

and integrate your comment


On 5/7/19 8:18 PM, Martin Blumenstingl wrote:
> On Tue, May 7, 2019 at 1:57 PM Guillaume La Roque <glaroque@baylibre.com> wrote:
>> drive-strength-microamp is a new feature needed for G12A SoC.
>> the default DS setting after boot is usually 500uA and it is not enough for
>> many functions. We need to be able to set the drive strength to reliably
>> enable things like MMC, I2C, etc ...
>>
>> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> with the comments below addressed:
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>
>> ---
>>  drivers/pinctrl/meson/pinctrl-meson.c | 102 ++++++++++++++++++++++++++
>>  drivers/pinctrl/meson/pinctrl-meson.h |  18 ++++-
>>  2 files changed, 119 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
>> index a216a7537564..3da867c13f47 100644
>> --- a/drivers/pinctrl/meson/pinctrl-meson.c
>> +++ b/drivers/pinctrl/meson/pinctrl-meson.c
>> @@ -219,12 +219,56 @@ static int meson_pinconf_enable_bias(struct meson_pinctrl *pc, unsigned int pin,
>>         return 0;
>>  }
>>
>> +static int meson_pinconf_set_drive_strength(struct meson_pinctrl *pc,
>> +                                           unsigned int pin,
>> +                                           u16 drive_strength_ua)
>> +{
>> +       struct meson_bank *bank;
>> +       unsigned int reg, bit;
>> +       unsigned int ds_val;
> you can move ds_val to the line above
>
> [...]
>> +       if (!pc->reg_ds) {
>> +               dev_err(pc->dev, "drive-strength not supported\n");
> I'm getting this on one of my Meson8m2 boards:
> $ # cat /sys/kernel/debug/pinctrl/c1109880.pinctrl-pinctrl-meson/pinconf-pins
> ...
> [  874.748531] meson8-pinctrl c1109880.pinctrl: drive-strength not supported
> [  874.755278] meson8-pinctrl c1109880.pinctrl: drive-strength not supported
> [  874.762086] meson8-pinctrl c1109880.pinctrl: drive-strength not supported
> Pin config settings per pin
> Format: pin (name): configs
> pin 0 (GPIOX_0): input bias disabled
> pin 1 (GPIOX_1): input bias disabled
> pin 2 (GPIOX_2): input bias disabled
> ...
>
> I believe we are not supposed to complain when getting the
> drive-strength when reg_ds is absent.
> all pre-G12A SoCs don't have reg_ds, so we don't need to error-out in
> that case (because that's perfectly valid)
>
> [...]
>> +static int meson_pinconf_get_drive_strength(struct meson_pinctrl *pc,
>> +                                           unsigned int pin,
>> +                                           u16 *drive_strength_ua)
>> +{
>> +       struct meson_bank *bank;
>> +       unsigned int reg, bit;
>> +       unsigned int val;
>> +       int ret;
>> +
>> +       if (!pc->reg_ds) {
>> +               dev_err(pc->dev, "drive-strength not supported\n");
> based on your previous explanation (that you want to inform the .dts
> author that he's doing something wrong) I'm happy with this error if
> Linus W. doesn't veto this.
>
>
> Regards
> Martin


Guillaume

