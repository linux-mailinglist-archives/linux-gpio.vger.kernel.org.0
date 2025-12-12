Return-Path: <linux-gpio+bounces-29507-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50357CB9767
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Dec 2025 18:32:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 91C7B300CBB7
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Dec 2025 17:31:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7FAB2E9EC9;
	Fri, 12 Dec 2025 17:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SKVU0PHs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2D72E9ECC
	for <linux-gpio@vger.kernel.org>; Fri, 12 Dec 2025 17:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765560668; cv=none; b=D4LnMczQ+jKtJghtD1IJSbhjmCLhVEJ6bzvTjL/i18JrKhI5f4VKSul0Hk0NYC87fMnYezzdxYKTjqBqhN4bfxzmJa8dl6rNBm9JtCC1wSypDt/k2M8A9plD5BlSBH3uS2tTdk6HR5l0pYA1n7GP+lP/NdRuthSxQs8qZ4elDDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765560668; c=relaxed/simple;
	bh=hKit+/0T5gZExjaMYxLiuooY89XVDrrPzVdV8YJ8W1M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IhCUABgnH8RgkMeIcWfDIiuvMgUOgOpUaZLC7iPGUQBSt8GkYkJzSnD/NxoHmwwbgvZ0v9/yFbMjc/QSDiyUE/TVcf69Mg0vBt1dRKBsy2e5L+KJGznBsyGG0cJ0gLG5KNSG1PMBELoeuKYaF7VASMFGxPSrrDAKQ+5jVLMff8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SKVU0PHs; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a07f8dd9cdso4122085ad.1
        for <linux-gpio@vger.kernel.org>; Fri, 12 Dec 2025 09:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765560666; x=1766165466; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=bfaOhU/eGTckWkAOHZE/zAxVwRnQrMOfr2k/Ftj96Z0=;
        b=SKVU0PHsQfADOcqUgiulb5BATbOYkeBXrRs5Od7o4t7JJf53cZ4flhkasg/5qIVlSX
         +3CR29yLMQNmsRKJ8VpdIeI9ZBfjVl7W/4xbRnyy4gogIUEJfSLa5dxcUJGkiK4YNTZP
         /O/RUIL8tuMYQfb5Wkstp0bZddUo9wGAcMQ7ZIxZ98Xx6t3OzUEydBZ6bPL6LvW9fvq/
         R4MhxZ/ZxNL3J7hxNw3F5O5X9aZY5viBcA6ySqOkVdvVIq03fR1pL2jIOhTWXT/MI1CG
         KNRCtF5dbFzoz6ipO8D8w4Fq0DTqLRDhDRLlwlZP/vn0laEB1I8DQyBfyIaPu1KUKg5h
         u3FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765560666; x=1766165466;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bfaOhU/eGTckWkAOHZE/zAxVwRnQrMOfr2k/Ftj96Z0=;
        b=m2zgq/uAOnLPDE5f7t7LkIieEANRlH12QQt8rqQV5WU3BkQZZM8CtHPK5goYl+lMUI
         fMjvoATGO7qoUBfztF+WpWGgEs1QldcqCxCDGKwqHKleIxJoBiecsziVqpSKo3Zry9ki
         VmsYM4qRl2QcTwjCMOrDzFlAKyN1vxAFBJLqhLkwht8nD54lgS5L1t0Igb/4f/FGavta
         X1JTYz66J6O3kz9Atg+aYBOdMwnJlAuzLsNFn5AWCXAfDc12jd/ITqjl7b3ue5QPu4ct
         zT9yPAb0+wkPbcEE0Jt1JDyQzesy4FdfqVvfRmaNHErEoblDXRZs7mlGs/Gxfgya8Cz2
         Aheg==
X-Forwarded-Encrypted: i=1; AJvYcCW6fRMYrknE7L0sUEfFp93/x8FkEjNVNs8WgdUWeNNHQQRigD1Il+Vvv72ZHXX/AlcOuicax4pVwTcm@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf+hh/FiXyGchlRHaSkFmzqaHnPqkTgVCFSe4nnhk9OdLnAi12
	4sFVgJ0swyoCVx+WLOfMkQAWXH8EzE0dtp03oaxH12l5+jvnES8IGiqE
X-Gm-Gg: AY/fxX6wtAdS/zD1fOh1eipwk9OIfrnjwTsi+vCKPbHu0sPA2w24chobNFB+0gGZWr6
	ncr06WDhkA6jQx4ZaO0lwgdDQQVJ4XnfA7dwzDGQ0aD52wst3eDPza7sOKekqxc0sCxJW5UVjUb
	/BJ5JKuaTLYO139YDjYwiUGQy9iR4M+x8UKxuUGH+qfSIbDy90K+lqMhwlRS7i8an1IhEF6mJmm
	oUhAsyaWglhEUb+j/JKSLFPwX4ve8M19yz9vM52yuNROVcIIt4Hs0oOu07/ilftvUf1am0BYIcJ
	JLHDFtzMr6rBX+ciOVwpib0RIGw1J1pmgc6eZEnA13YRYxhD5K2FjXLKf7NY1L+HJc8lfL5LSSP
	qEKkh5dZAjaCMBlP8pfUKnCNgICu+Ps/29PvdKhIUCbcfgKES3xTtw4HF3pI01p+DH8Ern8E3lr
	H575T4xPU4wF7oJjk/BIxXmqiPpOoToNp4oHutd4DHTlKQ49PWZi/IcGoSez4=
X-Google-Smtp-Source: AGHT+IERii8VwTDBGjEktZiFxNixZNxDB5hsG1gFWNwNX2BO2DNqBUBrmdpc4/vBEItTmIHvzZXz7w==
X-Received: by 2002:a17:902:ef02:b0:2a0:8f6f:1a0d with SMTP id d9443c01a7336-2a08f6f1cf3mr256605ad.61.1765560666113;
        Fri, 12 Dec 2025 09:31:06 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29eea040382sm59851035ad.77.2025.12.12.09.31.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Dec 2025 09:31:05 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d1765251-7787-4224-b8ad-ad16faf55181@roeck-us.net>
Date: Fri, 12 Dec 2025 09:31:04 -0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] hwmon: ltc4283: Add support for the LTC4283 Swap
 Controller
To: =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>, nuno.sa@analog.com,
 linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>
References: <20251204-ltc4283-support-v4-0-db0197fd7984@analog.com>
 <20251204-ltc4283-support-v4-2-db0197fd7984@analog.com>
 <144d50f7-398c-4b10-bd21-a6d0c6c7b4c8@roeck-us.net>
 <67209860ae2ff5626b7eaa50f2dd4b496eaa06d3.camel@gmail.com>
 <ee7b7dcf-7756-4ffc-8a2c-e2cf33aac725@roeck-us.net>
 <f530e0c818048bb3ce5c3505a35c1ef99acdf9f1.camel@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <f530e0c818048bb3ce5c3505a35c1ef99acdf9f1.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/12/25 08:55, Nuno Sá wrote:
> On Fri, 2025-12-12 at 08:46 -0800, Guenter Roeck wrote:
>> On 12/12/25 08:34, Nuno Sá wrote:
>>> On Sat, 2025-12-06 at 10:40 -0800, Guenter Roeck wrote:
>>>> On 12/4/25 08:15, Nuno Sá via B4 Relay wrote:
>>>>> From: Nuno Sá <nuno.sa@analog.com>
>>>>>
>>>>> Support the LTC4283 How Swap Controller. The device features programmable
>>>>> current limit with foldback and independently adjustable inrush current to
>>>>> optimize the MOSFET safe operating area (SOA). The SOA timer limits MOSFET
>>>>> temperature rise for reliable protection against overstresses.
>>>>>
>>>>> An I2C interface and onboard ADC allow monitoring of board current,
>>>>> voltage, power, energy, and fault status.
>>>>>
>>>>> Signed-off-by: Nuno Sá <nuno.sa@analog.com>
>>>>
>>>> I finally found the time to write module test code for the driver.
>>>>
>>>
>>> Thanks!
>>>
>>>> Some early feedback:
>>>>
>>>> - The driver must work with non-devicetree systems and without device
>>>>      property support. Select defaults where necessary.
>>>
>>> I'll double check that... But one thing that already comes to mind is rsense? Rsense
>>
>> Yes.
>>
>>> is the main design choice for a thing like this. Not sure we can decide on a meaningful
>>> default for it? I believe we have the same situation for ltc4282.c
>>>
>>
>> Agreed, but that doesn't make it better (and I don't have a unit test for that chip).
>> Default would be your call. I usually go for 1 mOhm.
>>
>> If you have access to it, can you send me a register dump for LTC4282 ?
> 
> I'm doing home office these days and I'm not sure I brought that chip with me. If I have
> it, I'll do it!
> 

No problem. I'd order an evaluation board, but that costs more than $200 which is a bit
too high for my liking ;-).

Thanks,
Guenter


