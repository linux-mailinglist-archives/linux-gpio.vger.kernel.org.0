Return-Path: <linux-gpio+bounces-26213-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B683B59BAE
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Sep 2025 17:13:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CB471C0249C
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Sep 2025 15:09:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74B8E341670;
	Tue, 16 Sep 2025 15:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Uf9uWLSm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0617834165F
	for <linux-gpio@vger.kernel.org>; Tue, 16 Sep 2025 15:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758035300; cv=none; b=BFpalUPLSGX0RCv7pUSEYUZLcmiDRxFMZ4I6CvjBx/JP/KsaGj7QAO4poaiDRwWpdn8ckVLthCwFcG11Fk4E7oLDJsmJloCI8aeQavNb0C32dg1EDm6BJVoZAMZaztem+dEZdOankhqHNRBTzRc/sfUoGvAiR4YC3ZyWYm9rFzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758035300; c=relaxed/simple;
	bh=yMmIPhxzCHiujCLC93yUulSj03dbgF3K8hp313sB11s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yvgl9hL7dF+rXSpYEBgZZ1ruZhmzzQQ/o+qiEUgHU3qBzwjgVZaU3xhyjJXCEpBufvuPNdBnnhJKVvqmnLcTKz3HowC5bURiHKgvFcWqkHjZdRCNUVLb7Vg+Fbb5yGkT0hMJc/xhzxZijVufcfuRLlRQ3gR9cbYol2tm9fO8Xhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Uf9uWLSm; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-62355a687e6so1212008eaf.1
        for <linux-gpio@vger.kernel.org>; Tue, 16 Sep 2025 08:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1758035297; x=1758640097; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0VyxsRgwzT4WdBEZrPds7tFrERwbS24Tu8hrZOF5hOk=;
        b=Uf9uWLSmKe5L7hqyoMxADwXupTmT/AA9LPc3Vp3GKVRw+vPO8lL6EEe735P06P9IiY
         VfGffOEH9NGKytZZkPBFdeuZoWJzft+9VG93LeJ1QQWb8bsl0792YeMtQXpxRIVm98Ma
         bxMYaXCHI3AGdxdnjWWcfFoD0g4L3A8HaylmGxvXDZCwBQ2RUpgcIqLJrmV99oH5fxAU
         wN8QoGtZywGHpyyiArtDFUUcys6Df3dmmcSDUc160gr/CX2a7pyvV+9MiPOOReM1c8Tr
         pLnWJ3L9tngf5rlah5XwyjOl42kw3hSjbhZYwlQ+gJwZkDGOtWH8eFgoPJQji+qQi1Rk
         h2Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758035297; x=1758640097;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0VyxsRgwzT4WdBEZrPds7tFrERwbS24Tu8hrZOF5hOk=;
        b=Ddk/WSdNk/RL2xPzDBSovZXNv6x6Qi8gjgxy1hyd1fYWgaH7MbZDOsi+K7dfU+rV7m
         bLwCWxaT0GrgE11SW93uC58oeT2BBCxM/o6k6E6EsqNuss7mEvJ0W/obe1keOJDUbGiW
         2URbNuFD5sFlHdUb1NZbeZN17C7Zc5ytpLyQecjTf1EW2/FMWgsJmZDIQiwLISZNSO1s
         RKsSCoAoo20loAweXMiVlMguLtmFeS8koKjBNslBEyVhBlXrRNBcGHW5thefYlYFlvJp
         mXeyNxPv6k0T0b5+rOkN+26RSww6MvYU2OQaKTdkmGpz8qbJv1e/F8Hnjzi2Xyqm2Dje
         8jjw==
X-Forwarded-Encrypted: i=1; AJvYcCUD7oLSHs8TRfpnGLC+DSb8Go8x/smfMiiZMHYYIggMvTWQ1v6KlRorQDfTA0+xnuDjOFB6+Xn+zBV/@vger.kernel.org
X-Gm-Message-State: AOJu0YzWQArLrutvXK3GP1uJl5ZrUBH3m3aomlwcFwSpaP41IgVOcabF
	s7oLBbphuwYBSlffo38cF84Lfe43OUOHsqMzeDWIDBccPKLnAk7nOu8nul7C0vdHcL4=
X-Gm-Gg: ASbGncv+3FFJhvcaUMNKG5B+T+GUPWn8iRFQt6mQdbDi//HPr9kwgTuCUgfunefAkA0
	l2EtmFw1qEjFzNrJaRR3dXof2ZfSA1nf6KfySz2QjTmmAp4jZubTjPbTvovOTAgacyQ+lps9QlK
	gvtIp359CQRZc9j0yRUoFaUGeTrFSxlRDji15/R9cIKDqiTgm7FvWIDp37wxaEU14Pc3Hawj9Po
	aWaSQBRMx//JOx8fwgdO6rkpUxOVha7xU9djN4gyjFpc0vwxBkiExCjJJKSWXQiA+Acjer7c9sv
	CeYHhNP7KElAWFkuX1xpbUF3YmDa7O9qbP3+YdyZYJ+/fybGKcjSEOOPo9O9p3iSd7DopxDA7xq
	DMwtkvbUA6gpjqtj8YKxV9aSZTDD2VldCxLAcCgBxGb0xDthejWatjyri23PJ9y4EGK+EYoge2F
	k=
X-Google-Smtp-Source: AGHT+IFbaLaefbFuTwBnBZB5B64hmkV14poQrqqnj/+jrHHe5Qend6k64W8dMu0a3pnSETsE0eaV5w==
X-Received: by 2002:a05:6808:159b:b0:439:adcd:9e83 with SMTP id 5614622812f47-43b8d8a279emr7619487b6e.21.1758035296903;
        Tue, 16 Sep 2025 08:08:16 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:70a1:e065:6248:ef8b? ([2600:8803:e7e4:1d00:70a1:e065:6248:ef8b])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-43b828d31c0sm3270184b6e.1.2025.09.16.08.08.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 08:08:16 -0700 (PDT)
Message-ID: <6a1b7294-25b4-4363-87d7-2e91c9c1b157@baylibre.com>
Date: Tue, 16 Sep 2025 10:08:14 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] iio: adc: Support ROHM BD79112 ADC/GPIO
To: Matti Vaittinen <mazziesaccount@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <20250915-bd79112-v5-0-a74e011a0560@gmail.com>
 <20250915-bd79112-v5-2-a74e011a0560@gmail.com>
 <aMge0jYwYCiY72Yb@smile.fi.intel.com> <20250915211321.47865d3d@jic23-huawei>
 <c1d21e3c-b0a3-40a5-b693-a38673f8bf53@gmail.com>
 <20250916090206.02f601be@jic23-huawei>
 <14d3dc56-c6cf-464a-9a57-2a7a6afe8af9@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <14d3dc56-c6cf-464a-9a57-2a7a6afe8af9@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 9/16/25 3:14 AM, Matti Vaittinen wrote:
> On 16/09/2025 11:02, Jonathan Cameron wrote:
>> On Tue, 16 Sep 2025 07:52:07 +0300
>> Matti Vaittinen <mazziesaccount@gmail.com> wrote:
>>
>>> On 15/09/2025 23:13, Jonathan Cameron wrote:
>>>> On Mon, 15 Sep 2025 17:12:34 +0300
>>>> Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
>>>>   
>>>>> On Mon, Sep 15, 2025 at 10:12:43AM +0300, Matti Vaittinen wrote:
> 
>>>> --- a/drivers/iio/adc/rohm-bd79112.c
>>>> +++ b/drivers/iio/adc/rohm-bd79112.c
>>>> @@ -454,12 +454,18 @@ static int bd79112_probe(struct spi_device *spi)
>>>>           data->read_xfer[1].rx_buf = &data->read_rx;
>>>>           data->read_xfer[1].len = sizeof(data->read_rx);
>>>>           spi_message_init_with_transfers(&data->read_msg, data->read_xfer, 2);
>>>> -       devm_spi_optimize_message(dev, spi, &data->read_msg);
>>>> +       ret = devm_spi_optimize_message(dev, spi, &data->read_msg);
>>>> +       if (ret < 0)
>>>> +               return dev_err_probe(dev, ret,
>>>> +                                    "Failed to optimize SPI read message\n");
>>>>      
>>>
>>> I am not really sure under what conditions the
>>> devm_spi_optimize_message() could fail. It might be enough to print a
>>> warning and proceed, but I don't think returning is a problem either.
>>
>> No. Don't proceed on an unexpected failure whatever it is.  That's
>> storing up problems that may surface in a weird way later that is much
>> harder to debug.
> 
> Just a generic note, not disagreeing in this case.
> 
> I have had similar discussions before - and I have been on the both sides of the table. Hence, I don't have as strong stance on this as you. On some situations it is better to just try proceeding as aborting the operation brings no sane corrective actions but just reduces a device unusable.
> 
> On the other hand, as you say, usually bailing out loud and early is the best way to pinpoint the problem and get things fixed.
> 
> I still think that logging a warning should be a decent hint for someone doing the debugging.
> 
> Well, as I said, returning here is Ok for me - thanks for taking care of it! :)
> 
> Yours,
>     -- Matti

For devm_spi_optimize_message() specifically, there is no
point to continue after an error. The call of this will
just be deferred until the first SPI transfer and the same
error will happen again. If there is an error, it means there
is a programmer error and the SPI message is malformed
(or could be memory allocation failure). So better to fail
early anyway.

