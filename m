Return-Path: <linux-gpio+bounces-15474-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9380CA2AF50
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 18:48:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 231791617B5
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 17:48:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC911191484;
	Thu,  6 Feb 2025 17:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E1LNjWuf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB376190497;
	Thu,  6 Feb 2025 17:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738864121; cv=none; b=mFJ4wfbTRgIXM4ypgOReiG6tH/z9m+DMdh18v4/kCuT+bTERp+txZ+qMc3H3J4nAGmKbg3Wl7rw4mH9ikuWk3BRMs05pLUKpE2Ajwkiv5F+hk5IrFsE4UAkXfQXWfv4khKWfuhTw7z1kA+tDtSFdfYG114aOkj2hKkIuMnXK7gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738864121; c=relaxed/simple;
	bh=1t3zXBpCdXhEEFu1TFhEr/3WTg7CV454FBaJGsialWQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=J+uzLgYwTzJrcnDzfz6zs3vk7AUaxudlf7GHz/4sW5QVakkLnHIzo3gbzdohowLgWY4EgBhe6iwuWKbQh/d91X90tV1Z2LkcLrB9lxX3TtaVdTiijtlUSQcSwBwFrLQDcRKw5Oyli7lO4pQEyfKjlLPouZfo7P1dDtDgg1DPSB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E1LNjWuf; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ab744d5e567so219197366b.1;
        Thu, 06 Feb 2025 09:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738864118; x=1739468918; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DX2627YI24l2pBBbnjtgt3lAgexHaljl0LuWtEBAE00=;
        b=E1LNjWufsowKqyup/ztOv7Rl21vYO3nBeDaGFRfmEztqYiv3Sp0Kw76hIhHSF6Own9
         xWNY14O7bJN4NvDToMl4x5xTieZ9/Jm3O1eDD6YykUyuZGHXEMyXEQm89iwNemMAJ6vP
         Y57DeZ2BE2hnfT3ApXPmOu1s4imJNaGRjJNVJE1DIVxAA4THI7sso+JsSAzQco2JO/fB
         U3F3jkBnLRw1LuE8IKhJy2mLrm6npqRs/1ByKVbzPdkXfwdnx4zfS5Bsr1JnmnQmzfMr
         PbIpXptDhM3nLcYu1QkUgz25Nmgjgn6p3r00tCGf+40M0BRffeplYEEECLqMhW3PX1a2
         8zjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738864118; x=1739468918;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DX2627YI24l2pBBbnjtgt3lAgexHaljl0LuWtEBAE00=;
        b=ap3GbZzXSrZXN83AFDRMOhH06m9u9rhY8xmVouhRi+EPW4FQuqEqUXoqqjQOIKYTQP
         zCUtPGyyOPHj4gAZKxVMrrmrbzjx8l65BAGFKv/NRZnuNbuOaNXH0vY6pEsRkpEkeGcB
         GMjMJXF9Y0e9SvSJ8c0s0AIWmXgvsPUF7F4VAd/vpOw6O/MBOWoiHFmE/Ya8nD6xQCBo
         I4EUVP8JOcGsoV2sf70WMsO+VNlOYG7QrJnR+0twcDaiaE3Z6GyaCgk2WAMzESYciBw5
         81U0U4/GVyjT4BFYnuVavtYAghzlZrNWCxD5wpMu+6ci0sJkfywTfEH2sWQpvsgQLdUj
         q98A==
X-Forwarded-Encrypted: i=1; AJvYcCVhAYgJO5Sb4C/Ez3Zt3Svb/uOx3mCVFi4SjH0TDRGRsyitZiHpUJXMo7x6sJEFpp3E/n4PTpouMSeS8WF/@vger.kernel.org, AJvYcCXRYDQRZ8XP7ME/U4JmN3HJ+jeDNoZ5Jn7dpR38lXymeZPayHfyoMaA+j8jEU7WrLFtSTkuYsc0XolN@vger.kernel.org
X-Gm-Message-State: AOJu0YwLO4mbosj9G7OZLizOhFdW0+rSEswB49P5vUx9wbkICHhxSV34
	G12QBDcOg3n2mgOemWg56VVwBcCgTFvEoetsOaKTnbwjQWU4vJ0n
X-Gm-Gg: ASbGncsmMY337VI1dsGC/+2xdZcBKEyOmIgwRwIqA7pJmXjDQYZ5Dvkq/FbEgfaLgOd
	eqlL7IFaS27Sz20qVjOwxXfmfT2oKPl0pi4q8okbDZjd5atgtdEajz+yOPm16AKpWUXZlra5TGz
	Gv5DKFF2FIq5t0qzCxdet4YmJbdLQgNQrBdQKgYHCFxE0zYMAVlPGKdbqkNyyvhRjhIsTrZpd/E
	U7qxAMMtwX2XnAQ8ODucqH1pS77otjU41S+UZF1yp+lCrF36k8E2Sw0ZBwFqsN0Bs4dhihIXTP9
	AyXIfSwqOnmm5x3HyHrWQ8GcTpbXxaPt838Mg1ArM/j7BHDuUloDtHGph5fU
X-Google-Smtp-Source: AGHT+IEjb3ESIc4QoSERq3VJk7mxL8fDDwkecLmWkcVMf6V6yV2xjMkNs2d03WF0itTo+ldSq9dkGA==
X-Received: by 2002:a17:907:94c3:b0:ab7:5a5a:4318 with SMTP id a640c23a62f3a-ab76e87adbfmr401085966b.12.1738864117894;
        Thu, 06 Feb 2025 09:48:37 -0800 (PST)
Received: from [192.168.50.244] (83.8.206.8.ipv4.supernova.orange.pl. [83.8.206.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab772f84417sm132736266b.53.2025.02.06.09.48.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 09:48:37 -0800 (PST)
Message-ID: <50371e83-917d-4b0c-af4e-ec1afa7e8c94@gmail.com>
Date: Thu, 6 Feb 2025 18:48:36 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] gpio: bcm-kona: Various GPIO fixups
From: Artur Weber <aweber.kernel@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Ray Jui <rjui@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Markus Mayer
 <markus.mayer@linaro.org>, Tim Kryger <tim.kryger@linaro.org>,
 Matt Porter <matt.porter@linaro.org>, Markus Mayer <mmayer@broadcom.com>,
 Christian Daudt <csd@broadcom.com>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20250130-kona-gpio-fixes-v1-0-dd61e0c0a9e7@gmail.com>
 <CACRpkdYVeHKzH7dgXfqFSDCvxBe04FJVDx5LGR9G7Og13bpDNQ@mail.gmail.com>
 <981d534a-a439-40c2-bd24-2e518846580e@gmail.com>
Content-Language: en-US
In-Reply-To: <981d534a-a439-40c2-bd24-2e518846580e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6.02.2025 16:37, Artur Weber wrote:
> On 6.02.2025 10:34, Linus Walleij wrote:
>> Hi Artur,
>>
>> On Thu, Jan 30, 2025 at 6:10 PM Artur Weber <aweber.kernel@gmail.com> 
>> wrote:
>>
>>> Fixes two issues that were preventing GPIO from working correctly:
>>>
>>> - Lock/unlock functions tried to write the wrong bit to the unlock
>>>    registers for GPIOs with numbers larger than 32
>>>
>>> - GPIOs only initialized as IRQs did not unlock the configuration
>>>    registers, causing IRQ-related configuration (e.g. setting the IRQ
>>>    type) to fail.
>>>
>>> Also includes a minor fix to add a missing newline to an error message.
>>>
>>> Tested on a Samsung Galaxy Grand Neo (baffinlite rev02) with a BCM23550
>>> (DTS not yet in mainline).
>>>
>>> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
>>
>> Looks good to me, do you want to resend the patches picking up the
>> Acks or do you want me to apply as-is?
> 
> I'll send a v2 in a second with the style fixes suggested by Markus[1].
> After that, it should be good to go.
> 
>> Should this go in as urgent fixes (-rcN) or as nonurgent?
>>
>> The DTS not being mainline suggests nonurgent but are there
>> other systems suffering?
> 
> Non-urgent is fine. AFAICT the only upstream-supported Broadcom Kona
> devices at the moment are old Broadcom dev boards; while they
> technically are also affected by the bug, I doubt anyone's actively
> using them. As for the devices I'm testing with, there's still quite
> a few fixups I plan to make before I consider them ready to upstream.
> 
> Best regards
> Artur
> 
> [1] https://lore.kernel.org/lkml/ 
> CAGt4E5sqd_Aojk+boD5K5EiRfOsiU+jYY5EV0DP6TFut291HnQ@mail.gmail.com/

v2 sent: https://lore.kernel.org/lkml/20250206-kona-gpio-fixes-v2-0-409135eab780@gmail.com/T/#t

Best regards
Artur

