Return-Path: <linux-gpio+bounces-28103-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BF3C355A9
	for <lists+linux-gpio@lfdr.de>; Wed, 05 Nov 2025 12:28:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09F08565E6B
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Nov 2025 11:22:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EA4330F95C;
	Wed,  5 Nov 2025 11:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ugo+/H9y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5579030E0D2
	for <linux-gpio@vger.kernel.org>; Wed,  5 Nov 2025 11:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762341767; cv=none; b=SrjdwHYPh/OZq3LkZ99s72SCuTcT9M/w4BFnoQ+tjm76CQf9sPceazsp/u+3UUHuKBTorcudNwZvM96nb/+Yb3hZPcOReXDzHnVrKbN7nL0HygIkqhQ5vxt2S/0yuFRXdklIwQ2KdItHdiB7HUHmGMyuAeHKoqZf51YtGDSRMKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762341767; c=relaxed/simple;
	bh=Ii9b2rpzXiRDukDeUtY2WS5XvNAk5U97MkCbAXQdp7s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OqEPXp0i1MvFl2dM0mSaj6XajqONjw9bQ32EOrVmo+KAGr52PvO/ZZsKUs29QWAodFeXqPUl4GQGmm7o1+ZnQSOBspH/Afb6UnVjsuEBtGbBj6Zi94+c+R2wGPDFZyRDxxg+zJxSt1J+vdwrjEhpQy6tm0087keqTA/3tA5LfD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ugo+/H9y; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-37a3340391cso32413861fa.3
        for <linux-gpio@vger.kernel.org>; Wed, 05 Nov 2025 03:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762341762; x=1762946562; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lgjq5frjKtchDAt0hCN8TCDb53mEX1KChcG+cIgj+As=;
        b=Ugo+/H9y30ONhr7fDfdxbpsqWR3tRjLh+BuyplYG+qinlo2qxVVE4FuU4lqg9t8UmP
         fVDVTXoFX4dBwApTOCOGf3JNHagxzSd5IcYye46YRifeue4oQvK+rCDY6250s2aOUHg5
         fWNdaQqGIKnqGL+6iwoCI4B1KwMjvSghMySRVbLo/w8XC1vtrbeE+e8rvaXdbSppm6Pu
         jwzcMBE7OMaVCmpZm+PQVU/4EMvbFWk7ZoQe404b7k5sOktFJtHcSqzL3FIgWmRkzwO0
         dAicFKMGSMh+zzlQdFh553R+WyaxAPatOLu++DAI9JeRl9GL5PnvoTJduTUCYgVMQAlm
         q8Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762341762; x=1762946562;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lgjq5frjKtchDAt0hCN8TCDb53mEX1KChcG+cIgj+As=;
        b=GhJoTrX7gan/K+lzGPKAxdnQi4jAWV9iRT2tAKBM4GUSf4gFe8+YRecdqX0vigrDo+
         +ltoNqo+T55D+T5zv80SEKnDwnz7MRSEbUbHD+i/cknlbgR3F1eUcdvTKdiQ67gw9idL
         z4OkU6uI/qnRrNItVsIZ4fk3hIS7WY2Ns26ze4+tACPg4fEAV0Uku72fGK+78OOmImpF
         lxKXvw0TuIgsshQ39aSm3+ESpwjVTqwQcRyQn2SCfQ95x2gjwYmDBwb2nDj+T5SaGOdc
         9bQK2zZxVOeiq/enCJQsyME8XNZe+R+MLztponJa+zTOYArIjYTlAzEk93THTkY0s+66
         6OWA==
X-Forwarded-Encrypted: i=1; AJvYcCXdp5cVYocGeP39zAxwMCuxu6yzdpkK7pcZjeSwXqIKKAWOxGDWW9bzGQAOII9V7/kv5Z0EFRmWwdkV@vger.kernel.org
X-Gm-Message-State: AOJu0YzQHXa3a8poauoAx6Tbt/1P6DGN8T5aOCsuuWu7mvZb3t66YcHZ
	CyRnBrUzRDiHtUeqiFqvp5YCsS3aNWl4OFvcuxzeJteUGwNkBj0ShrTL
X-Gm-Gg: ASbGncud6WiJrHauX8GLFUqm0sDRh0OedL6bRhPn/LyDNRgnyfBLYQogLgkgrFU+QPr
	mNH22xTsmPtQcNLiZUEY0zb3hTxnewMb/vCZTHnhgLnwyWYRnONvlVpkzgixBo9eRFbBzV9RL/e
	CayOjP88zjno/43annvBqN/4OO2EckTI2kVUFKCairc/GNRL98d7gwN8mNihos92BnKPTA39avE
	2FNxdLtbsJ336nS0jJP89Su3kGI+OQX56uIuG4TW0DuPn7zBbvsYASMtFCAzmgTm+HxRiQE4Jbi
	1bZQlPrcM43DoCr7CG0CcdynWe8qIUl08qjJ8SwLK3DZUBfvFX68Pw9hKLxHqrf3nmjmelddDtV
	nbTUw3AuQlQb72bRPOgXsFGGPi1sRY0hodQWAkqA7Nru6vOXBVaMfvrxQZG0oYrydz4yqFrun5R
	T8Y2ndb9W+1RQquxAQPwdSUFvAnfvGNMPNc+34H8+IbboqzYWTErOI/XRpdg==
X-Google-Smtp-Source: AGHT+IHpvSjuUZgOT3CU6iwhd3QH+qr/blJkYgQLVxgzQhufOUjboKrykT4Eu5lvIJTa8VYLu1Svkg==
X-Received: by 2002:a05:651c:4006:b0:37a:3b04:1a1b with SMTP id 38308e7fff4ca-37a513e604fmr6509411fa.12.1762341762189;
        Wed, 05 Nov 2025 03:22:42 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37a415c8070sm14290231fa.28.2025.11.05.03.22.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 03:22:41 -0800 (PST)
Message-ID: <1aedf1a8-ddff-47fd-8afb-dd60dc42e12b@gmail.com>
Date: Wed, 5 Nov 2025 13:22:40 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/16] dt-bindings: regulator: ROHM BD72720
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Matti Vaittinen <matti.vaittinen@linux.dev>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Sebastian Reichel
 <sre@kernel.org>, Andreas Kemnade <andreas@kemnade.info>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Stephen Boyd <sboyd@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-gpio@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-leds@vger.kernel.org,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-rtc@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
References: <cover.1762327887.git.mazziesaccount@gmail.com>
 <48fe6e2642db4484640b173cd71be1b245929122.1762327887.git.mazziesaccount@gmail.com>
 <176233320981.143013.4115240062372455834.robh@kernel.org>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <176233320981.143013.4115240062372455834.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/11/2025 11:00, Rob Herring (Arm) wrote:
> 
> On Wed, 05 Nov 2025 09:35:59 +0200, Matti Vaittinen wrote:
>> From: Matti Vaittinen <mazziesaccount@gmail.com>
>>
>> The ROHM BD72720 is a new PMIC with 10 BUCk and 11 LDO regulators.
>>
>> The BD72720 is designed to support using the BUCK10 as a supply for
>> the LDOs 1 to 4. When the BUCK10 is used for this, it can be set to a
>> LDON_HEAD mode. In this mode, the BUCK10 voltage can't be controlled by
>> software, but the voltage is adjusted by PMIC to match the LDO1 .. LDO4
>> voltages with a given offset. Offset can be 50mV .. 300mV and is
>> changeable at 50mV steps.
>>
>> Add 'ldon-head-microvolt' property to denote a board which is designed
>> to utilize the LDON_HEAD mode.
>>
>> All other properties are already existing.
>>
>> Add dt-binding doc for ROHM BD72720 regulators to make it usable.
>>
>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>>
>> ---
>> Revision history:
>>   v2 => v3:
>>   - drop unnecessary descriptions
>>   - use microvolts for the 'ldon-head' dt-property
>>
>>   RFCv1 => v2:
>>   - No changes
>> ---
>>   .../regulator/rohm,bd72720-regulator.yaml     | 149 ++++++++++++++++++
>>   1 file changed, 149 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/regulator/rohm,bd72720-regulator.yaml
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/regulator/rohm,bd72720-regulator.yaml: patternProperties:^buck[1-10]$:properties:rohm,ldon-head-microvolt: '$ref' should not be valid under {'const': '$ref'}
> 	hint: Standard unit suffix properties don't need a type $ref
> 	from schema $id: http://devicetree.org/meta-schemas/core.yaml

Nice! I'm not sure if anyone has said it but these bots are helpful :) I 
forgot the type to ldon-head when switching from -millivolt to 
-microvolt. I'll address this for the next version.

> doc reference errors (make refcheckdocs):

Thanks for including the make -command to the mail! I didn't even know 
about 'refcheckdocs' target.

> Warning: Documentation/devicetree/bindings/regulator/rohm,bd72720-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/rohm,bd72720-pmic.yaml
> Documentation/devicetree/bindings/regulator/rohm,bd72720-regulator.yaml: Documentation/devicetree/bindings/mfd/rohm,bd72720-pmic.yaml

Hmm. I suppose this is because the MFD binding is added only later in 
the series(?) I suppose we can't help it because the MFD binding 
references the regulator binding as well. So, this is kind of a chicken 
and egg problem?

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

