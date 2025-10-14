Return-Path: <linux-gpio+bounces-27082-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DD49DBD946F
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 14:12:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5A78935333A
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 12:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5A2F312822;
	Tue, 14 Oct 2025 12:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nGoHvT9i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214A2312823
	for <linux-gpio@vger.kernel.org>; Tue, 14 Oct 2025 12:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760443924; cv=none; b=m/ejjaOJ3qxc/RoYbvOp3i1t7a3g4Fvc+0aBhni8Ln81Oal/2MwUfVBdiiWJCjymgZ47mu4DjDEgvHAa+ZELwV90mb0WJFSKhkY5fczTBadBIGKP/3HIFBrZzKW+8JP+zkkr8Bk/py3DhBhCy82iBRttHwJU9T64ZfrPFwS0jFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760443924; c=relaxed/simple;
	bh=vv6SCZXUdjxEguAATuwGq3R/PnOOppUOkjoieyZK+QQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bcP8XZpijcaxtxHrCQPsD1pZO9ZTK9Bq+I5REL3T09FzvXFJVNzaWTsap4v0bBEMrhpIZF2nbygMrfXlhR2IozYwMd0gTjc3WUdfGi1emYiqAlBlreD4ni7pOmDpU61Tyh1Rvc/TwBPA2DRZ7aDFuHE9YVeSUjUJh71a0FUBBlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nGoHvT9i; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-36a6a397477so53568091fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 14 Oct 2025 05:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760443919; x=1761048719; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=19UY8Ondjgi9nEDc4X9WWhtcIr4QTybVkR2WGWv5OR0=;
        b=nGoHvT9imkjXZP7O1ZAgzncMDDkL/jFwW2yzfWA4NYcYhYRp71DfzoOyUsa0wn8SyE
         a58ks1YfrrUw3k+vP6yAWeeWlT16lPYRxRV14nQ50VIh1yJScO45ivD2fS/z02tv4XpW
         7VgKLU8p+c4+m9FUY9dbOE1nTZZNd+7Hc1bdMlBUyTi+C7Kb5J70X4T7Vfy0UI/EcXHg
         CA0mt+MBaB6zixHfnk6NEaxqsEkIkvs/y/g2xIYeJ2g3kVqwNZdWq+NS0U1hh91t0PDD
         23cFquPMzol1o/8a7CVYGbslIUM1elKwdlIhtL17DynnP7VC013CwwCHOZg3zrRYnXPw
         r5TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760443919; x=1761048719;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=19UY8Ondjgi9nEDc4X9WWhtcIr4QTybVkR2WGWv5OR0=;
        b=r/SHPh2253Ih4uhDrQ1uapzMVrN9LIVMu94h+BZje5bnipWq9DZGn8n0WWoWdd3pN9
         L1IOuR0+JZWVpvbUbF2wbNtVCUwBY6P7GROtDTOTihPPXE+O16vGnDzhxpzPMyD+lvKg
         GU5vkz7V3Tr6IaTTeTTYpyGGJETaMRetplM/hsQ1KVDvy8UJHob8Q5c0Jb8YEwXseDhS
         rA4iZcg2M7hebNjqb0OANVcF0DHGq8qmVhWQzR4+tlLZr6ny3piEwvhhVVcsUGk4NnxG
         la/BAhVFreiA9e3gpx5AkLhUotuU2kE5yWwYlL0CguFOeEzJGZjb3OZxakfAMGOxUoj2
         0BIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAb7ScRTGTYJ8sVVTQTclhj0tBUSFjMTq/mapWrnhc5LpQir2wyUeJAxow7Ij3zUW3gWZVpEBp5t5o@vger.kernel.org
X-Gm-Message-State: AOJu0YyLRYgNOW1HnozENB82YAPCWtFRtQVSahWGj34fho7z+bAZHWa4
	XrPlSm2Xf85m3+WWVAh7AdLyNJ4tklRq9Zy4wws4FggfQUTnrzB/F+nO
X-Gm-Gg: ASbGnctIVnpUQJ+c5whHU8ZfOGgDYYrOGXMhTyJ29+EEGiLl3TPHFNKQARjI7qzY0Fh
	nJdn6hRMgXf568xjBu8AW/nRIub74QZi8QBZGb//HWFW93GC9rW8jQToFIBK7ErEvhQ14WX85M6
	1fp/qOVGT6L7hm9hLEhkZr95RVu/lTfzfV3Xl6hoUEbrIK6DG/WIYA1TqKk5H+c3zbkVdQXItCh
	T8iNgaKxWqqRngjbcoh0MoaGVgPobJ6renXG0Z48TaTAO+/AHp6klaLjnzESI+zTaooJtZSQatJ
	zhXDavAkNnxQgHOQLkTtdyU4QdlFsyU33JNlZfm8rvpD1fDNSJfcQe3HmOTRXQKCsUCXnJvnvjH
	2/UOJUDo2eGqt2aqHZv38Iylunqgx2t/D6wliDsmNRBagxV4w3YB6fzI0ojsdx5A8eggyDh5ouh
	n031gcKfoSPM9AYF7Lc4VhXyruMUHdMLaqdQ==
X-Google-Smtp-Source: AGHT+IGW8zh9AOgyW7nkUtmNQqz6PJovnO6f6RGpy2I05ufukYy7iqHPI6QQtLY8F4LP884y1HCvzg==
X-Received: by 2002:a2e:be1d:0:b0:373:a537:6a00 with SMTP id 38308e7fff4ca-37609ea4554mr56777981fa.30.1760443919151;
        Tue, 14 Oct 2025 05:11:59 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3762ea3b31bsm39258931fa.47.2025.10.14.05.11.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 05:11:57 -0700 (PDT)
Message-ID: <cac4222e-1f66-40e1-abf8-7d4661d43bbf@gmail.com>
Date: Tue, 14 Oct 2025 15:11:56 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 04/13] dt-bindings: mfd: ROHM BD72720
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Andreas Kemnade <andreas@kemnade.info>,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <cover.1759824376.git.mazziesaccount@gmail.com>
 <fe1f4a0947c864496f4eeec8eef806afcf6094a4.1759824376.git.mazziesaccount@gmail.com>
 <CACRpkdZnoMvYBXN7b6dw+uPs=f1WXr9wX-0VF1c1qd-rq+17LQ@mail.gmail.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <CACRpkdZnoMvYBXN7b6dw+uPs=f1WXr9wX-0VF1c1qd-rq+17LQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 13/10/2025 15:58, Linus Walleij wrote:
> Hi Matti,
> 
> thanks for your patch!

Thank You for taking the time to review of this RFC!

> On Tue, Oct 7, 2025 at 10:33 AM Matti Vaittinen
> <mazziesaccount@gmail.com> wrote:
> 
>> +  rohm,pin-dvs0:
>> +    $ref: /schemas/types.yaml#/definitions/string
>> +    description:
>> +      BD72720 has 4 different OTP options to determine the use of dvs0-pin.
>> +      OTP0 - regulator RUN state control.
>> +      OTP1 - GPI.
>> +      OTP2 - GPO.
>> +      OTP3 - Power sequencer output.
>> +      This property specifies the use of the pin.
>> +    enum:
>> +      - dvs-input
>> +      - gpi
>> +      - gpo
>> +
>> +  rohm,pin-dvs1:
>> +    $ref: /schemas/types.yaml#/definitions/string
>> +    description:
>> +      see rohm,pin-dvs0
>> +    enum:
>> +      - dvs-input
>> +      - gpi
>> +      - gpo
>> +
>> +  rohm,pin-exten0:
>> +    $ref: /schemas/types.yaml#/definitions/string
>> +    description: BD72720 has an OTP option to use exten0-pin for different
>> +      purposes. Set this property accrdingly.
> 
> accordingly?
> 
>> +    const: gpo
>> +
>> +  rohm,pin-exten1:
>> +    $ref: /schemas/types.yaml#/definitions/string
>> +    description: BD72720 has an OTP option to use exten1-pin for different
>> +      purposes. Set this property accrdingly.
> 
> accordingly?
> 
>> +    const: gpo
>> +
>> +  rohm,pin-fault_b:
>> +    $ref: /schemas/types.yaml#/definitions/string
>> +    description: BD72720 has an OTP option to use fault_b-pin for different
>> +      purposes. Set this property accrdingly.
> 
> accordingly?

Gah. Well spotted, thanks!

> 
>> +    const: gpo
> 
> These are a bit idiomatic, not using the actual framework for such
> things (pin control) BUT: they are on the other hand crystal
> clear for an integrator working with this device tree, and only
> four pins so why over-engineer it. I am fine
> with them if the DT people are.

I kind of like to emphasize the fact that this is not really a pin-mux 
in a traditional sense. We can't change the routing after OTP is 
written. As such, it more resembles "wiring" of the signal inside the 
PMIC, and this property is not a control but tells us how the signal is 
wired. But yeah, let's see what others think of it.

Yours,
	-- Matti

