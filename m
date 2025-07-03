Return-Path: <linux-gpio+bounces-22738-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CB3AF7833
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 16:47:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B69C15689C9
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 14:47:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 375A72EE978;
	Thu,  3 Jul 2025 14:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a+sUUeut"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E842E7F07;
	Thu,  3 Jul 2025 14:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751554017; cv=none; b=tzJnpolx4kr8dYXLJxv9vVE0XB82bT2A+2xKulOOZD84Fre0P27CwVhZoqzppQeN8XsYyjSYk95pvYHBylBQqp5EVF+SfC7Pwc8aodWwrYww7XNvuFotM/hjY9XYEJVaFGbArmW7XVT0QGFyqZwiDi/kgp5gl+nFKNjH9HQzniQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751554017; c=relaxed/simple;
	bh=lN5s32Jbcs7WNkSmhy7bYvtYTmkxdABMhyRkzs0DgUQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iEslgP8/YgAO2ux7DxmnWa8i6f+XD4XKHySAsR6vTU/Mcj0OhqQeRo98dCkBpxIxDAdGtj2Pac7Mr5N6/fqkDJEQMovV7W/2hxuUw4vk/nIYgkASNNiWpDu/XyyOAHMqGvfcGEMlzyFPsit0zMnrEyc8IMAAiu8axzkiVDTxCiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a+sUUeut; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-60789b450ceso10743965a12.2;
        Thu, 03 Jul 2025 07:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751554013; x=1752158813; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1vG5loofJoHI/2oT8MQ0obd1zMTsI6DHFF+BLI2gKVY=;
        b=a+sUUeutEhHjW6FY/Ru5O6nVJf87XPWxn6aTyH5qdgE91zLdVdhV3OtVKlZbounLvW
         w1LnTtpDBBPrGVOH5sg7CEQYqrSxbv5B+hJJkeaD15etdL15IYD9dM/dgIvrgvxw7pYn
         XVKgXS7MsWikh1GKaEMxSVG6dE4Kb/wYJoIDVyLirW0ig6nxMSFJ6xVkBq1Fci/BU7wq
         MMHb5TL5FgeRFNZGVVqrkhsV0NoPRMENUnwFxK0gggaBPRw1ncXl53jz4a5oYZqFMOt4
         2yKfS4lWU62ZEPj5UpGkCqy2NxvyJg7P9jPS5wPROXe8gdqoHk7NeQvTUg6Lolsjv8Ah
         fEcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751554013; x=1752158813;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1vG5loofJoHI/2oT8MQ0obd1zMTsI6DHFF+BLI2gKVY=;
        b=igFP119sQH1nhz4xlA6XtYmZZKBytwMx1CJlaz58dfcgGWdqdRBRRSt92T8jID07Bu
         ISeai9+Rkxg8CBNXmftJm0tbGDTPzIw1Uw4oI4WqVREACHlZPjlm8apyNUtoGtrshgbU
         2nFr/p7oVMthbtjVIs/H5Fyu8DZGqCPRtTyusN+PwdrUcn3Ay7T7Sc4fgceMMBBZx3AY
         M6lleHdQrEwMNqA7guhs6xrLE4Mat09P9aZVECrF6aiihAb1o82S1KeTyO++rcmCWUir
         3z3e6FtXCM8HYLwO5fb+rJdqP9SxX4h1RJWG5Fvr7ewu0sxMcr9NOyNrT31iw5rbJX1j
         z6JQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1jG86jY5gx73KTX60qlFq0L9Oe5KoLJdI2rRvXclcYL0nZutAkkA4YOGaPuto+/50ssOPzp3AnoNy@vger.kernel.org, AJvYcCWZKPG3OWEpCKXsX98HnYz3HwGQxjEmg7Z7ZkNdGYoadcNHi42N2LoLIXh65D6sfTYKmGv/HZzhq95h26VD@vger.kernel.org, AJvYcCXn2cqoi6OcolgW2qmlzgzKaq3pPq9nsCErnzxgBCDaqeOEHe5l3T+j2DpTD2Fg2qVr9bJ0ktWuvEKEVg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yze+9Bl2AfYCkL4mxgvqRNe6/sW55Y++IS4gydYENKhXLUeaTq8
	k1o0W/fYfOfA0o5UzNLTIheU7u9sB/xINelIqNMnqUQM3gFrUsvkHztj
X-Gm-Gg: ASbGnct+2Sxepa85v9ih4cjvy/ftPdOMjQ+5CncKV9ugDopIk3F1OvVhu/7wOw92D6o
	79nTbEyCR0l24+FQ+hI+0GlsWHtSgPveB0GsWpHtMysiTSuz+NEGd2lXyyAbJxP84o1DHJ4kP6i
	S6NOGGxmpzPPj/PO1rpiTcW1nMGA2pwbCWB+Unn7YOnHIQm763wybp6VP7eUCtDcHhpdeZrFT52
	QuwkbakZY81fOguio/98mksj90Xmgf5ra3Aisxj5/4d5uPEHvTL+iqgdBk0YX1VMERScWMbWz87
	3+3LDB2Pl2NzVQkrt1h8p31IAhELd2pKTrXeZkFNKLz8RSEjXseMteUC2iWcXqrPEdteMLytt7z
	d9sg=
X-Google-Smtp-Source: AGHT+IG3d3NfRg9+cPD1+4PBfyGx8gRVD7/AozdqjiToYMztJLCFly4TfxgJoNGqYews3daJwQLNLg==
X-Received: by 2002:a05:6402:35d3:b0:608:155c:bf81 with SMTP id 4fb4d7f45d1cf-60e6ce24caemr3706836a12.31.1751554012933;
        Thu, 03 Jul 2025 07:46:52 -0700 (PDT)
Received: from [192.168.0.100] ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c828bb5b2sm10745485a12.4.2025.07.03.07.46.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 07:46:52 -0700 (PDT)
Message-ID: <cbf8d7bd-24a4-4dc1-8d9f-bbc4bee45d8d@gmail.com>
Date: Thu, 3 Jul 2025 17:46:47 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/24] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
To: Julien Massot <julien.massot@collabora.com>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org
References: <20250702132104.1537926-1-demonsingur@gmail.com>
 <5e1b26637706f6eac92acbbb3d5a7dafa0c2c232.camel@collabora.com>
 <d4052ab3-9cd1-45e8-81b0-b6512822e646@gmail.com>
 <c661e7f3faec269f73d6240fbe7b84e3bc97157a.camel@collabora.com>
From: Cosmin Tanislav <demonsingur@gmail.com>
Content-Language: en-US
In-Reply-To: <c661e7f3faec269f73d6240fbe7b84e3bc97157a.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 7/3/25 4:54 PM, Julien Massot wrote:
> On Thu, 2025-07-03 at 15:17 +0300, Cosmin Tanislav wrote:
>>
>>
>> On 7/3/25 3:07 PM, Julien Massot wrote:
>>> Hi Cosmin,
>>>
>>> On Wed, 2025-07-02 at 16:20 +0300, Cosmin Tanislav wrote:
>>>> This series adds new drivers for multiple Maxim GMSL2 and GMSL3 devices,
>>>> replacing the few GMSL2 drivers already in upstream, and introducing a
>>>> common framework that can be used to implement such GMSL chips, which
>>>> avoids code duplication while also adding support for previously
>>>> unsupported features.
>>>>
>>>> While the normally acceptable and polite way would be to extend the
>>>> current mainline drivers, the choice was made here to add a totally new
>>>> set of drivers. The current drivers support only a small subset of the
>>>> possible features, and only a few devices, so the end result after
>>>> extending them would in any case be essentially fully rewritten, new
>>>> drivers.
>>>>
>>> Thanks for your work,
>>> The common framework will help a lot to drive new GMSL chips, and most of the
>>> features are covered.
>>>
>>>> This series depends on support for internal pads, for which a patch has
>>>> been added.
>>>>
>>>> The previous version is at:
>>>> https://lore.kernel.org/lkml/20250618095858.2145209-1-demonsingur@gmail.com
>>>>
>>>> The following deserializers are supported:
>>>>    * MAX96712 (already exists in staging)
>>>>    * MAX96714 (already exists)
>>>>    * MAX96714F (already exists)
>>>>    * MAX96714R (GMSL2)
>>>>    * MAX96716 (GMSL2)
>>>>    * MAX96724 (already exists as part of existing MAX96712 driver)
>>>>    * MAX96724F (GMSL2)
>>>>    * MAX96724R (GMSL2)
>>>>    * MAX9296A (GMSL2)
>>>>    * MAX96792A (GMSL3)
>>>>
>>>> The following serializers are supported:
>>>>    * MAX96717 (already exists)
>>>>    * MAX9295A (GMSL2)
>>>>    * MAX96793 (GMSL3)
>>>>
>>>> Known backward compatibility breakages:
>>>>    * No default routing. Default routing has been intentionally ommitted
>>>>      as the devices support quite complex routing and it would be
>>>>      unfeasible to provide sane defaults for multi-link deserialziers.
>>>>      It is expected that userspace programs would set appropritate
>>>>      routing.
>>>>
>>> This part is the most annoying one: at the moment, there is no way to set the routing except by
>>> manually enabling a boolean within the kernel source.
>>> You can't guess what routing the user really wants, but please at least provide a default
>>> routing
>>> table that allows using your drivers — for example, the device's default routing.
>>>
>>
>> It's a very delicate issue... I'll try to see if I can do that.
>> It would be great if we could enable the streams API globally since it's
>> been merged since Jan 15 2023. It's been over two years.
>>
>>
>> Thanks,
>>
>>>
>>>
>>>> The following list enumerates new features that are supported by the
>>>> common framework and their respective chip-specific drivers:
>>>>    * Full Streams API support. Most deserializers have support for more
>>>>      than one link, and more than one PHY. Streams support allows
>>>>      configuration of routing between these links and PHYs.
>>>>
>>>>    * .get_frame_desc() support. Both the serializers and deserializers
>>>>      implement this to query and provide frame descriptor data. This is
>>>>      used in features explained in-depth below.
>>>
>>> So are almost all the sensor drivers incompatible?
>>>
>>
>> Yes, sensor drivers need to have .get_frame_desc() implemented... It's
>> not a huge feat and it's the only way this type of bridge could work
>> properly.
>>
>> Alternatively, we could add a fallback that bases its decision on the
>> stream format, but I'd prefer if we didn't and we would just implement
>> .get_frame_desc(). After this series is merged I can submit my patches
>> for imx219.
> There is already one pending on the mailing list
> "media: i2c: imx219: Report streams using frame descriptors"
> I guess it's fine if we require the sensor to implement this function.
> 
> But I had to do it for vgxy61.
> 
> Btw I tested:
> TI AM62x + max96716 + 1 x max96717f + stvg5661 (tunnel mode)
> With special lanes mapping and polarities.
> 
> And I had to:
> 
> - Apply pending patches for j721e to support the enable_stream API instead of s_stream
> - Enable the experimental v4l2_subdev_enable_streams_api
> - Add get_frame_desc to the sensor driver

Did it work without issues with those changes?

If that's the case then I think all I can do to make it is easier is to
add default routing. I'm not a fan of each driver having its own
get_frame_desc() fallback, especially when it's a very small change to
do to the sensor drivers.


