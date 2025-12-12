Return-Path: <linux-gpio+bounces-29502-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DAACB9619
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Dec 2025 17:56:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 295FE3020DB7
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Dec 2025 16:56:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E8882FBE17;
	Fri, 12 Dec 2025 16:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CEur7pT6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935C62F99B3
	for <linux-gpio@vger.kernel.org>; Fri, 12 Dec 2025 16:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765558017; cv=none; b=Cg7yoDnNlFzcctiUDPojfzCAksZbAI/vVlVZhkBgKBDcBQUUPdt03u6y+8N0KbLg2/xg0iW2PqX7UROl6AxtUR1odNvLkXjCTQu/lBcDsNqa9UXip0zIZaY6MY+05FPIc6fdYddaP5RnzdWa6kXXvyCLMFdqb9Gc0b64BYWBSpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765558017; c=relaxed/simple;
	bh=miRz/GrsgRy0J9Weo6FmdU+ZyoZnbVl34DzRJukHuwE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sypFbNGBkVQyMgfQxZFewJMqoIYo0h/ZBVRwCOGeh7lBD23xctTBaoC4x9G3WJx6TY9upOoJkuQH6tEJK3CcYgMdYKgfwkAgv8nNlkzybW2QB6dROsMuX6HwaufiwFE9O7H5GkiV03uEhJzFyZ3ZsFGNOZHTOHXlsYzNzttR+pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CEur7pT6; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7d26a7e5639so1530855b3a.1
        for <linux-gpio@vger.kernel.org>; Fri, 12 Dec 2025 08:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765558015; x=1766162815; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=xtV4fauK6DOFkgFV4rVraB1jD3+BL9hGxw37pG/sLMk=;
        b=CEur7pT6/1IdwnukbfDK7MwRCCvGGRfu+utkTtqJsmkAKrSwzvaduxGOZDPS7pK/uc
         tOAEtfP1ticE+D6eckR7GRhs86Zk9QkVpnzPg/X+hEF25NBJgI5KHguRBIkS1sEdjJvy
         JHZ4GbZ7fYQted+ckF/4LRbpR1PZ36cdkQdFbNSGqJH01m/4heiChRpAE4on9C1mNyCs
         TWkKtVGr0z/BCKyplhmyd4/ihpwFV7c9E8TYFmZGh2d00L24vQstlwmqXNMZeatUoPvB
         abTdbpZZ0FPVfqYNlGgYRD675sLn3yB+H/EXpc5E5aI+vjYyjuXhtu2kZ4i8Yf5HXwdH
         oBzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765558015; x=1766162815;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xtV4fauK6DOFkgFV4rVraB1jD3+BL9hGxw37pG/sLMk=;
        b=ZWp9sLNmkUqa+BVa3rAAwWFynINl9bbw+xUY9jh3FrlacqV6VJ6UX/o05IuRIfa2kL
         bgqdTF8psZt7uwEkjruSvffVvZI8UPdBfLENgzN0GWKOCIccrl/yz9yNb0co7K38Ut3x
         a1Cos2dYU6aCbrD9ND8slCR6JLIXZPIuFj0saAaj8vlcwwyGGcH7FjwqaWgc1QThYR8o
         MLqg8uDVRzVE8qmuHk5JAlvAOmsoNhnGNPu3sINknrHwyXUiDG80//cvHfRHBPw6EZ2M
         NymIE0uwXTypz6XdnkRQ0R3SwPqmkyZ+9H6YxERajv22Tan+WabokbQqHxDWRtFIQNB9
         TJ/w==
X-Forwarded-Encrypted: i=1; AJvYcCVrmR+MxSHPpdWaC9PWTQ5hU7AssnvEoCpfMGsvgNxuJ+rT6ogIVSS8EmFsDW9MXOiUtjmPZE0SuWFn@vger.kernel.org
X-Gm-Message-State: AOJu0YzGiKJyM85W+tD9mcFa0tvBMjIiT+9xmt1ttE7Z5RuWf5+0GLgY
	XlUQrKLIBCR8JYLUfYX0A70o2ZahdQ/HkhJOuYOTsNlE/336WKbO2+4+zyCNsw==
X-Gm-Gg: AY/fxX5+JLVLvhwud6p1mAeTNqSUE/hSqpLjJc7byjWKha96uxgMCoTbPNRE/xaHIi2
	YqUsJN02vS4m+IzP3C4CZcksRNb/PhY6Q8a0Nu3hzkEarkMrmUFFLLnhB0QuWK3eKsOe0WA+0NQ
	FJLdu9v0Nf1z8jyCiOLArpOBxV4yy5db/ikALRncxax2XdRi02hUioKFNunoMNSMdOyq3oNNtKc
	ncZNNsdWuEb7il3Uquh6THQjFbB8oRCKigeBqpHFfE8gZxwNTsMPqdg3+DFtBwqTKPnaT3mAA4/
	9gK2Skc9qBzvnDA6foCGtPih2srLYnrwJildVPgkFI6a3yXWC64C8z0IYbroj5CFclzB9O31jvf
	UEk4QsegLk7Sr9RKZaOcz52VFwjp4rZxWFcb9fJ+pjow9grf77eZuhBEjCgzMXHW64bWyrUArRR
	DaGqH5uAOGkTo5YICnyLixTTXdeYP+LHR+yRsGTAqXj2hr6v5ZlZUrjwlD7BI=
X-Google-Smtp-Source: AGHT+IGOf7poD4RLXogFDP+Z/AOQSUyog/G6O5VllngB2Kft5JDAOWIlSg8TdwFDDRPttLbtVLA8eg==
X-Received: by 2002:a05:6a00:4006:b0:7b7:5066:7f9 with SMTP id d2e1a72fcca58-7f66f9f2ccdmr2402041b3a.7.1765558014726;
        Fri, 12 Dec 2025 08:46:54 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f66e12698asm2381975b3a.22.2025.12.12.08.46.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Dec 2025 08:46:54 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ee7b7dcf-7756-4ffc-8a2c-e2cf33aac725@roeck-us.net>
Date: Fri, 12 Dec 2025 08:46:52 -0800
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
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <67209860ae2ff5626b7eaa50f2dd4b496eaa06d3.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/12/25 08:34, Nuno Sá wrote:
> On Sat, 2025-12-06 at 10:40 -0800, Guenter Roeck wrote:
>> On 12/4/25 08:15, Nuno Sá via B4 Relay wrote:
>>> From: Nuno Sá <nuno.sa@analog.com>
>>>
>>> Support the LTC4283 How Swap Controller. The device features programmable
>>> current limit with foldback and independently adjustable inrush current to
>>> optimize the MOSFET safe operating area (SOA). The SOA timer limits MOSFET
>>> temperature rise for reliable protection against overstresses.
>>>
>>> An I2C interface and onboard ADC allow monitoring of board current,
>>> voltage, power, energy, and fault status.
>>>
>>> Signed-off-by: Nuno Sá <nuno.sa@analog.com>
>>
>> I finally found the time to write module test code for the driver.
>>
> 
> Thanks!
> 
>> Some early feedback:
>>
>> - The driver must work with non-devicetree systems and without device
>>     property support. Select defaults where necessary.
> 
> I'll double check that... But one thing that already comes to mind is rsense? Rsense

Yes.

> is the main design choice for a thing like this. Not sure we can decide on a meaningful
> default for it? I believe we have the same situation for ltc4282.c
> 

Agreed, but that doesn't make it better (and I don't have a unit test for that chip).
Default would be your call. I usually go for 1 mOhm.

If you have access to it, can you send me a register dump for LTC4282 ?

>> - Attributes marked as readable in the is_visible function must be readable.
>>     It is not acceptable to return -EOPNOTSUPP. That applies to all
>>     reset_history attributes and maybe to others.
> 
> Hmm that's a mistake. They should be WO and I have the same bug in ltc4282 so I need to
> send a patch.
> 

... which helps explain why I want to be able to run unit tests (which requires defaults).

Thanks,
Guenter


