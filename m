Return-Path: <linux-gpio+bounces-9764-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D4196B583
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 10:52:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F036E283F28
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 08:52:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B96CA19EEA8;
	Wed,  4 Sep 2024 08:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bxawwqeq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D991CCB32;
	Wed,  4 Sep 2024 08:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725439894; cv=none; b=soRDu1adQ1etGBkmO+25Ic9+x0TA74P7uvYNSuazbeDJ3CEWmlnqAPYS26Q4G0yeSCS+CbzwxQ9C7dH7FzBsgyB6qPgd1VU7s68dmi8rosRGBKfaQbtAiyo7xmYO2EgcVuQ1BAGAFlo54/jMP8QrxSJhh/TmCoNsfvV1NSIpNOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725439894; c=relaxed/simple;
	bh=l6k4ZZDHG17XCWV3RMNeHJ8RC8jvWgDv+kr4ylz6/Vc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iIFparMbvRSKxXVnaiVPJEN4JOZb4G1F0ojr/fiowo9iV4H4DvtAgpv3KKyBX4/fHyzSf42r4x+2A2ba/YEvl43StcgkdYqFTUDriD4Em3WZU6bq841n1GGSAI9ormu995o7OCvYs2BFjJADU/JjF5fHdxvYCu5mXs7aqduJiOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bxawwqeq; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5c3c30e6649so389717a12.2;
        Wed, 04 Sep 2024 01:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725439890; x=1726044690; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pjSfZIVIYx3mWrgDy979Q/5yLOwgwEUEWvDMHq+6ris=;
        b=BxawwqeqlLeuiDqxMo4IGU8h6FUGzcChugFRbKJLIKPHXUTyEafWifw2fnMstAB9Gv
         xXLSyTTYK+mNTlnn7PAYGc9iQ9vINvpHJ2O2HT9hxdZkVwZX7u7rw7tE6h2E4wx/yMzs
         VQqxZxmQ3O3FvnQKKOAy6dzJ/iB8t6tUPHmZbulJ8cIX8Ums7B3pblxFsvDSIsXLotgs
         rWrY7g/YeaALN17PnXjSlK3iCtGVhqy1lVrttjWTHcfqg+4VagetUGwHp2C5wxXmNJNm
         gj6htTUJqbTs7+I/diraZ2auYgp6awVe//uM2NpJI9l1rWitMCBlnznlCCcDAwqmSJll
         3NVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725439890; x=1726044690;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pjSfZIVIYx3mWrgDy979Q/5yLOwgwEUEWvDMHq+6ris=;
        b=dNgad7uMZTAt/CMWGmzcVTxajTuzbRTzE7sqKz3BKUed1pcja0cDRBvwuH+k64hrvp
         Um66YEITzPArYHmc8rEDKsXgbA7exGmDk4hx3CMqam8plUE2va3kN8kCEwrSF/3++FL6
         0n/4g1pV9cY5RKNTXomCkMocnrUAdpHY1NuhX1selCalGkGQrq5ih2lm5Ikqr5+sqehD
         2DwEwdLNhYLVR39VdUiFwxNnD72sA26emoIWRmM3ASN3fkxdRXXmUTY7TUqNnSiNEXwC
         Sj19uWBKx0j9BBAz+H1djv8FrdphkTk4zDjkT5lBodHUJt4B6JbpDY9A//xgCEOZNcIw
         ZqUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOPJW1dMpMG7/XiYi7Z5CCvrwuYHwnEdjPSbBNFAtn4mUAELyNY0C+ZIXAmrGEDNbk3sYO1bmpKLLj/mifKah+cFw=@vger.kernel.org, AJvYcCV/6EkNcyY6oMJZObpevSFjCaI4bgtH30VSEFVQl2gEJ8zJhmMyPQQHeLtNKfh/zlhirIV4W9RPy3j6e6Yy@vger.kernel.org, AJvYcCW/V0dxOOdHm12znBi72IM95DBQF/Yr8d8R9X6zS/zyPSqOeFpNhvhs3vGAJQRd8xgJvknWiZxeVVed@vger.kernel.org, AJvYcCXfofQapctivTT5d9AD173iOLU42dYzp8gZWW1qg8WdZLyvQZO7hyl1VDXkDnnY9gkX490F1yknfYiPIA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNCOm04+TM13phxcuZR5qQKPf86RIOUbsI+WY7xsMSgk/w7qnw
	E/WEfwJdMBXBZ6gvgSgDoL0WXNXqJ/dKiax1pLCwPbBTZowAqu3J
X-Google-Smtp-Source: AGHT+IEkc55O2h/8A8LpqWfW55H6hB3DeRK19MG2i7NInrna4ttxdG2VBQ0JlJ9+dUdQdxJQp6XYug==
X-Received: by 2002:a05:6402:2104:b0:5be:d7d8:49ac with SMTP id 4fb4d7f45d1cf-5c24235ceb5mr9750673a12.11.1725439889275;
        Wed, 04 Sep 2024 01:51:29 -0700 (PDT)
Received: from [192.168.1.106] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c226c6a3c2sm7341231a12.9.2024.09.04.01.51.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 01:51:28 -0700 (PDT)
Message-ID: <532dab9f-a002-5b12-5faf-b50331e12658@gmail.com>
Date: Wed, 4 Sep 2024 11:51:27 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 05/10] pinctrl: samsung: Add exynos8895 SoC pinctrl
 configuration
Content-Language: en-US
To: Sam Protsenko <semen.protsenko@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240903124429.107076-1-ivo.ivanov.ivanov1@gmail.com>
 <20240903124429.107076-6-ivo.ivanov.ivanov1@gmail.com>
 <CAPLW+4ns=6eO=S4Cz70aBSyVO8CJ5=ixmKL38dZDjD3UgO98ZA@mail.gmail.com>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <CAPLW+4ns=6eO=S4Cz70aBSyVO8CJ5=ixmKL38dZDjD3UgO98ZA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 9/4/24 00:20, Sam Protsenko wrote:
> On Tue, Sep 3, 2024 at 7:46 AM Ivaylo Ivanov
> <ivo.ivanov.ivanov1@gmail.com> wrote:
>> Add support for the pin-controller found on the Exynos8895 SoC
>> used in Samsung Galaxy S8 and S8 Plus phones.
>>
>> It has a newly applied pinctrl register layer for FSYS0 with a
>> different bank type offset that consists of the following bit
>> fields:
>>
>> CON: 4, DAT: 1, PUD: 2, DRV: 3, CONPDN: 2, PUDPDN: 2
>>
>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>> ---
> Other than minor comments below, LGTM:
>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

Thanks for the review! Will fix the issues in the following series.


Sincerely,

Ivaylo

>>  .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 137 ++++++++++++++++++
>>  drivers/pinctrl/samsung/pinctrl-exynos.h      |  10 ++
>>  drivers/pinctrl/samsung/pinctrl-samsung.c     |   2 +
>>  drivers/pinctrl/samsung/pinctrl-samsung.h     |   1 +
>>  4 files changed, 150 insertions(+)
>>
>> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
>> index 5480e0884..0d5d14cf0 100644
>> --- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
>> +++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
>> @@ -58,6 +58,15 @@ static const struct samsung_pin_bank_type exynos850_bank_type_alive = {
>>         .reg_offset = { 0x00, 0x04, 0x08, 0x0c, },
>>  };
>>
>> +/*
>> + * Bank type for non-alive type. Bit fields:
>> + * CON: 4, DAT: 1, PUD: 2, DRV: 3, CONPDN: 2, PUDPDN: 2
>> + */
>> +static const struct samsung_pin_bank_type exynos8895_bank_type_off  = {
>> +       .fld_width = { 4, 1, 2, 3, 2, 2, },
>> +       .reg_offset = { 0x00, 0x04, 0x08, 0x0c, 0x10, 0x14, },
>> +};
>> +
>>  /* Pad retention control code for accessing PMU regmap */
>>  static atomic_t exynos_shared_retention_refcnt;
>>
>> @@ -866,6 +875,134 @@ const struct samsung_pinctrl_of_match_data exynosautov920_of_data __initconst =
>>         .num_ctrl       = ARRAY_SIZE(exynosautov920_pin_ctrl),
>>  };
>>
>> +/* pin banks of exynos8895 pin-controller 0 (ALIVE) */
>> +static const struct samsung_pin_bank_data exynos8895_pin_banks0[] __initconst = {
>> +       EXYNOS_PIN_BANK_EINTW(8, 0x020, "gpa0", 0x00),
>> +       EXYNOS_PIN_BANK_EINTW(8, 0x040, "gpa1", 0x04),
>> +       EXYNOS_PIN_BANK_EINTW(8, 0x060, "gpa2", 0x08),
>> +       EXYNOS_PIN_BANK_EINTW(8, 0x080, "gpa3", 0x0c),
>> +       EXYNOS_PIN_BANK_EINTW(7, 0x0A0, "gpa4", 0x24),
>> +};
>> +
>> +/* pin banks of exynos8895 pin-controller 1 (ABOX) */
>> +static const struct samsung_pin_bank_data exynos8895_pin_banks1[] __initconst = {
>> +       EXYNOS_PIN_BANK_EINTG(8, 0x000, "gph0", 0x00),
>> +       EXYNOS_PIN_BANK_EINTG(7, 0x020, "gph1", 0x04),
>> +       EXYNOS_PIN_BANK_EINTG(4, 0x040, "gph3", 0x08),
>> +};
>> +
>> +/* pin banks of exynos8895 pin-controller 2 (VTS) */
>> +static const struct samsung_pin_bank_data exynos8895_pin_banks2[] __initconst = {
>> +       EXYNOS_PIN_BANK_EINTG(3, 0x000, "gph2", 0x00),
>> +};
>> +
>> +/* pin banks of exynos8895 pin-controller 3 (FSYS0) */
>> +static const struct samsung_pin_bank_data exynos8895_pin_banks3[] __initconst = {
>> +       EXYNOS8895_PIN_BANK_EINTG(3, 0x000, "gpi0", 0x00),
>> +       EXYNOS8895_PIN_BANK_EINTG(8, 0x020, "gpi1", 0x04),
>> +};
>> +
>> +/* pin banks of exynos8895 pin-controller 4 (FSYS1) */
>> +static const struct samsung_pin_bank_data exynos8895_pin_banks4[] __initconst = {
>> +       EXYNOS_PIN_BANK_EINTG(8, 0x000, "gpj1", 0x00),
>> +       EXYNOS_PIN_BANK_EINTG(7, 0x020, "gpj0", 0x04),
>> +};
>> +
>> +/* pin banks of exynos8895 pin-controller 5 (BUSC) */
>> +static const struct samsung_pin_bank_data exynos8895_pin_banks5[] __initconst = {
>> +       EXYNOS_PIN_BANK_EINTG(2, 0x000, "gpb2", 0x00),
>> +};
>> +
>> +/* pin banks of exynos8895 pin-controller 6 (PERIC0) */
>> +static const struct samsung_pin_bank_data exynos8895_pin_banks6[] __initconst = {
>> +       EXYNOS_PIN_BANK_EINTG(8, 0x000, "gpd0", 0x00),
>> +       EXYNOS_PIN_BANK_EINTG(8, 0x020, "gpd1", 0x04),
>> +       EXYNOS_PIN_BANK_EINTG(4, 0x040, "gpd2", 0x08),
>> +       EXYNOS_PIN_BANK_EINTG(5, 0x060, "gpd3", 0x0C),
> Here and below: please use lower-case letters for hex values. So 0x0C
> -> 0x0c, etc.
>
>> +       EXYNOS_PIN_BANK_EINTG(4, 0x080, "gpb1", 0x10),
>> +       EXYNOS_PIN_BANK_EINTG(8, 0x0A0, "gpe7", 0x14),
>> +       EXYNOS_PIN_BANK_EINTG(8, 0x0C0, "gpf1", 0x18),
>> +};
>> +
>> +/* pin banks of exynos8895 pin-controller 7 (PERIC1) */
>> +static const struct samsung_pin_bank_data exynos8895_pin_banks7[] __initconst = {
>> +       EXYNOS_PIN_BANK_EINTG(3, 0x000, "gpb0", 0x00),
>> +       EXYNOS_PIN_BANK_EINTG(5, 0x020, "gpc0", 0x04),
>> +       EXYNOS_PIN_BANK_EINTG(5, 0x040, "gpc1", 0x08),
>> +       EXYNOS_PIN_BANK_EINTG(8, 0x060, "gpc2", 0x0C),
>> +       EXYNOS_PIN_BANK_EINTG(8, 0x080, "gpc3", 0x10),
>> +       EXYNOS_PIN_BANK_EINTG(4, 0x0A0, "gpk0", 0x14),
>> +       EXYNOS_PIN_BANK_EINTG(8, 0x0C0, "gpe5", 0x18),
>> +       EXYNOS_PIN_BANK_EINTG(8, 0x0e0, "gpe6", 0x1C),
>> +       EXYNOS_PIN_BANK_EINTG(8, 0x100, "gpe2", 0x20),
>> +       EXYNOS_PIN_BANK_EINTG(8, 0x120, "gpe3", 0x24),
>> +       EXYNOS_PIN_BANK_EINTG(8, 0x140, "gpe4", 0x28),
>> +       EXYNOS_PIN_BANK_EINTG(4, 0x160, "gpf0", 0x2C),
>> +       EXYNOS_PIN_BANK_EINTG(8, 0x180, "gpe1", 0x30),
>> +       EXYNOS_PIN_BANK_EINTG(2, 0x1A0, "gpg0", 0x34),
>> +};
>> +
>> +static const struct samsung_pin_ctrl exynos8895_pin_ctrl[] __initconst = {
>> +       {
>> +               /* pin-controller instance 0 Alive data */
> Wouldn't it be better to capitalize it, i.e. Alive -> ALIVE?
Yeah that'd be better.
>> +               .pin_banks      = exynos8895_pin_banks0,
>> +               .nr_banks       = ARRAY_SIZE(exynos8895_pin_banks0),
>> +               .eint_gpio_init = exynos_eint_gpio_init,
>> +               .eint_wkup_init = exynos_eint_wkup_init,
>> +               .suspend        = exynos_pinctrl_suspend,
>> +               .resume         = exynos_pinctrl_resume,
>> +       }, {
>> +               /* pin-controller instance 1 ABOX data */
>> +               .pin_banks      = exynos8895_pin_banks1,
>> +               .nr_banks       = ARRAY_SIZE(exynos8895_pin_banks1),
>> +       }, {
>> +               /* pin-controller instance 2 VTS data */
>> +               .pin_banks      = exynos8895_pin_banks2,
>> +               .nr_banks       = ARRAY_SIZE(exynos8895_pin_banks2),
>> +               .eint_gpio_init = exynos_eint_gpio_init,
>> +       }, {
>> +               /* pin-controller instance 3 FSYS0 data */
>> +               .pin_banks      = exynos8895_pin_banks3,
>> +               .nr_banks       = ARRAY_SIZE(exynos8895_pin_banks3),
>> +               .eint_gpio_init = exynos_eint_gpio_init,
>> +               .suspend        = exynos_pinctrl_suspend,
>> +               .resume         = exynos_pinctrl_resume,
>> +       }, {
>> +               /* pin-controller instance 4 FSYS1 data */
>> +               .pin_banks      = exynos8895_pin_banks4,
>> +               .nr_banks       = ARRAY_SIZE(exynos8895_pin_banks4),
>> +               .eint_gpio_init = exynos_eint_gpio_init,
>> +               .suspend        = exynos_pinctrl_suspend,
>> +               .resume         = exynos_pinctrl_resume,
>> +       }, {
>> +               /* pin-controller instance 5 BUSC data */
>> +               .pin_banks      = exynos8895_pin_banks5,
>> +               .nr_banks       = ARRAY_SIZE(exynos8895_pin_banks5),
>> +               .eint_gpio_init = exynos_eint_gpio_init,
>> +               .suspend        = exynos_pinctrl_suspend,
>> +               .resume         = exynos_pinctrl_resume,
>> +       }, {
>> +               /* pin-controller instance 6 PERIC0 data */
>> +               .pin_banks      = exynos8895_pin_banks6,
>> +               .nr_banks       = ARRAY_SIZE(exynos8895_pin_banks6),
>> +               .eint_gpio_init = exynos_eint_gpio_init,
>> +               .suspend        = exynos_pinctrl_suspend,
>> +               .resume         = exynos_pinctrl_resume,
>> +       }, {
>> +               /* pin-controller instance 7 PERIC1 data */
>> +               .pin_banks      = exynos8895_pin_banks7,
>> +               .nr_banks       = ARRAY_SIZE(exynos8895_pin_banks7),
>> +               .eint_gpio_init = exynos_eint_gpio_init,
>> +               .suspend        = exynos_pinctrl_suspend,
>> +               .resume         = exynos_pinctrl_resume,
>> +       },
>> +};
>> +
>> +const struct samsung_pinctrl_of_match_data exynos8895_of_data __initconst = {
>> +       .ctrl           = exynos8895_pin_ctrl,
>> +       .num_ctrl       = ARRAY_SIZE(exynos8895_pin_ctrl),
>> +};
>> +
>>  /*
>>   * Pinctrl driver data for Tesla FSD SoC. FSD SoC includes three
>>   * gpio/pin-mux/pinconfig controllers.
>> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl/samsung/pinctrl-exynos.h
>> index 305cb1d31..7b7ff7ffe 100644
>> --- a/drivers/pinctrl/samsung/pinctrl-exynos.h
>> +++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
>> @@ -141,6 +141,16 @@
>>                 .name           = id                            \
>>         }
>>
>> +#define EXYNOS8895_PIN_BANK_EINTG(pins, reg, id, offs)         \
>> +       {                                                       \
>> +               .type           = &exynos8895_bank_type_off,    \
>> +               .pctl_offset    = reg,                          \
>> +               .nr_pins        = pins,                         \
>> +               .eint_type      = EINT_TYPE_GPIO,               \
>> +               .eint_offset    = offs,                         \
>> +               .name           = id                            \
>> +       }
>> +
>>  #define EXYNOSV920_PIN_BANK_EINTG(pins, reg, id, con_offs, mask_offs, pend_offs)       \
>>         {                                                       \
>>                 .type                   = &exynos850_bank_type_off,     \
>> diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
>> index 623df65a5..ea3214897 100644
>> --- a/drivers/pinctrl/samsung/pinctrl-samsung.c
>> +++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
>> @@ -1409,6 +1409,8 @@ static const struct of_device_id samsung_pinctrl_dt_match[] = {
>>                 .data = &exynos7885_of_data },
>>         { .compatible = "samsung,exynos850-pinctrl",
>>                 .data = &exynos850_of_data },
>> +       { .compatible = "samsung,exynos8895-pinctrl",
>> +               .data = &exynos8895_of_data },
>>         { .compatible = "samsung,exynosautov9-pinctrl",
>>                 .data = &exynosautov9_of_data },
>>         { .compatible = "samsung,exynosautov920-pinctrl",
>> diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
>> index d50ba6f07..f18877f2f 100644
>> --- a/drivers/pinctrl/samsung/pinctrl-samsung.h
>> +++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
>> @@ -363,6 +363,7 @@ extern const struct samsung_pinctrl_of_match_data exynos5433_of_data;
>>  extern const struct samsung_pinctrl_of_match_data exynos7_of_data;
>>  extern const struct samsung_pinctrl_of_match_data exynos7885_of_data;
>>  extern const struct samsung_pinctrl_of_match_data exynos850_of_data;
>> +extern const struct samsung_pinctrl_of_match_data exynos8895_of_data;
>>  extern const struct samsung_pinctrl_of_match_data exynosautov9_of_data;
>>  extern const struct samsung_pinctrl_of_match_data exynosautov920_of_data;
>>  extern const struct samsung_pinctrl_of_match_data fsd_of_data;
>> --
>> 2.34.1
>>
>>

