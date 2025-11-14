Return-Path: <linux-gpio+bounces-28471-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AB0C5C256
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 10:05:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 252223AD993
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 09:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F09F3054DB;
	Fri, 14 Nov 2025 09:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VRyHedUR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1720C304BB4
	for <linux-gpio@vger.kernel.org>; Fri, 14 Nov 2025 09:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763111075; cv=none; b=Yh2eyeYSagtIZ6fiTVhwHJESMuxZ1hivMF4X1OI2NVJloFyybpkk0qXb781Gn6JuhIiY13KYMFPRXf10MaQk4d/BbWxvpeN/JqF8Y7aNhNth+6fyLSl/fKwBK5nKY66Y/ZlhK8ySZdBawTwLsLBDaKvVWL3Kp7h8vyePK8UYbf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763111075; c=relaxed/simple;
	bh=0TEm7iRCHjxnOslZB50ja14A360VHxBjrAw5MtbVg4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MR61xAyiZRVXc02xChjZLsuqbOU7oXC8Qn34lcDvpOBvEoQVZJ0Go/0v9gR0GuQqHWPWLeiMkxAogxXT5ONSEJFlJX3eZ9ZyS/G+YDQ1bLT/xD+3/rDBDp1I6OX899BjYfDdjGodJMxTR6stkVhITqHheFQkU+rID3LUmPcnU1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VRyHedUR; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-37b95f87d64so12131691fa.2
        for <linux-gpio@vger.kernel.org>; Fri, 14 Nov 2025 01:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763111070; x=1763715870; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eyGXFrfPOvtO9Z4s8XQ0ch6UyF0uTEn2G/XOy3LSwzA=;
        b=VRyHedUReEEON2xYd87WuLqJfD1noLS/ndv5UrVlMiwt4AvPh301/msGwg3YAfz0NK
         YD13TyYHFEGdhF+5LIO+mQG9Tyu/olXSrJrogNVSienDMHGnhETw0TerCFiLjUNbtdSN
         b2KuZnS/MEw5h1jDPYrtK3hTXlGXAvWxnhvxvZ/bZshcWh2279+HMLOGna+Y5GEV8lPm
         MG8G1pzJsYP6py5eaIA1WVqC+WoYcku5GLY9qpVnCTnQpRRocLijXlcMvTJ/vqGmLHV/
         lNrKrdCC2Wa58fVEXVPdN417hEOZFXG5JpD9cSwnpoUsZ9Jb3STOsMywbKG0ccu742fw
         YCOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763111070; x=1763715870;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eyGXFrfPOvtO9Z4s8XQ0ch6UyF0uTEn2G/XOy3LSwzA=;
        b=PbpqqzgCsMFVHscubnbtkCywQvZEv/hAqWXAA7osTexZRLwDWakklyeaoqqcdtySNE
         Zuwos3G7XH5B1lmI7ia9jZgEhLDJnvAFZH0QifragDNd2qV1XIzmoWNxfqF+GeMasXDt
         ZS8t+kk1XTtVng431qz3EzsG8Gzyf2FVYqx/1jFwMkd4NdMNv5oGWUZtYCEHHh47wHkO
         aSdgwA5V0tKIbwKmXXG44q8BCwQEjtKQPKqcR2gTYnJxTDfVHlCb9Is1avy83NLW/xtD
         beGUp35glrWUMNHXCtS4ID+CnhWGG06iMD+EN9SfUGlQ5Mio2PPsBT+Z/rU/9986SYT5
         4nJA==
X-Forwarded-Encrypted: i=1; AJvYcCX1GiVP4cfIzjt9Gyii9Cekm715SZLFBmGVEN/isoHETDEMcssMUeeGGrVXxSo/PMnBGdTu0fBGgU+Q@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/458sdIEBrxWTlka0/vF/5bP+9ug0u3yrpBR1WAuIzDXTv1Cl
	8dVdqgAA3jeKRkctm7SRLKVjXDTXINtzGr8v2dg7jG6z0E1tZaBXvqBr
X-Gm-Gg: ASbGncv9+Us6IkSO7svpq87m47BF+Im0e2Cog+T+mTbEsVWhu/oFqfBvYCDsOcILVbJ
	dpjSD7EMJcoCLgBRcFwMYgodcyhP8jb07t/2CyFBhcDtmSmJVK+C9X/2Mz07llNXWJgdZrIapfj
	7d9HzdJyHrM6t8/rQH0/jv1Vs3O/LZB+Ou6jGDoLE1GzyjHm+h4TdaO3rOkmo89YNn50C7wJwtc
	2lrBXnV9r7187mWArSfJCygjAUODIUkLX0En0pDmONkSht+TnXC6BY6j8d6fq5Oyng9RpwsFtzv
	esbSbFobhKedbH89rQsQDBlMTrNlEWhYZFWVzmx1d/t0+k4+Sw/sWKSv1+KwRtUhmTa0NCEugjS
	lFJNwWGQ3o6rA+IMwS6cG/I9Dy9PXhD2A2V4eMC8oi62knWhWiLuLXwa4xeSVr4UiWijSuUpqRP
	0fWYCZhXMV8y81EyiHRlYQmk96DPU3HGvwhNj0jKWyUwWx5Mfvo71W8+98Cg==
X-Google-Smtp-Source: AGHT+IFr4MNcx4dsYyHl+PkDpXtMSjAYMNDIYKiKLMNKzXGQD8YnOzZnKnzRzUK+LYDxWhp7vqal/A==
X-Received: by 2002:a2e:b4a6:0:b0:37b:a664:acde with SMTP id 38308e7fff4ca-37babd29d4emr4429431fa.32.1763111069883;
        Fri, 14 Nov 2025 01:04:29 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37b9ce080d9sm9121361fa.3.2025.11.14.01.04.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 01:04:29 -0800 (PST)
Message-ID: <ee36d7d1-ef47-4a35-9aff-baa6ed32105a@gmail.com>
Date: Fri, 14 Nov 2025 11:04:27 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/16] dt-bindings: power: supply: BD72720 managed
 battery
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Matti Vaittinen <matti.vaittinen@linux.dev>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Mark Brown
 <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 linux-kernel@vger.kernel.org, Sebastian Reichel <sre@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 linux-leds@vger.kernel.org, Pavel Machek <pavel@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-gpio@vger.kernel.org,
 linux-pm@vger.kernel.org, Andreas Kemnade <andreas@kemnade.info>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-rtc@vger.kernel.org, Lee Jones <lee@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>
References: <cover.1763022807.git.mazziesaccount@gmail.com>
 <ac5a4e992e4fb9c7bffb1e641a7cd61f74af4cba.1763022807.git.mazziesaccount@gmail.com>
 <176303119683.3716572.16868393928566655866.robh@kernel.org>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <176303119683.3716572.16868393928566655866.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/11/2025 12:53, Rob Herring (Arm) wrote:
> 
> On Thu, 13 Nov 2025 10:52:19 +0200, Matti Vaittinen wrote:
>> From: Matti Vaittinen <mazziesaccount@gmail.com>
>>
>> The BD72720 PMIC has a battery charger + coulomb counter block. These
>> can be used to manage charging of a lithium-ion battery and to do fuel
>> gauging.
>>
>> ROHM has developed a so called "zero-correction" -algorithm to improve
>> the fuel-gauging accuracy close to the point where battery is depleted.
>> This relies on battery specific "VDR" tables, which are measured from
>> the battery, and which describe the voltage drop rate. More thorough
>> explanation about the "zero correction" and "VDR" parameters is here:
>> https://lore.kernel.org/all/676253b9-ff69-7891-1f26-a8b5bb5a421b@fi.rohmeurope.com/
>>
>> Document the VDR zero-correction specific battery properties used by the
>> BD72720 and some other ROHM chargers.
>>
>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>>
>> ---
>> NOTE:
>> Linus' rb-tag holds only if there's no further comments from Rob.
>>
>> Revision history:
>>   v3 =>:
>>   - No changes
>>
>>   v2 => v3:
>>   - Constrain VDR threshold voltage to 48V
>>   - Use standard '-bp' -suffix for the rohm,volt-drop-soc
>>
>>   RFCv1 => v2:
>>   - Add units to rohm,volt-drop-soc (tenths of %)
>>   - Give real temperatures matching the VDR tables, instead of vague
>>     'high', 'normal', 'low', 'very low'. (Add table of temperatures and
>>     use number matching the right temperature index in the VDR table name).
>>   - Fix typoed 'algorithm' in commit message.
>>
>> The parameters are describing the battery voltage drop rates - so they
>> are properties of the battery, not the charger. Thus they do not belong
>> in the charger node.
>>

// snip

> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/power/supply/rohm,vdr-battery.example.dtb: battery (simple-battery): 'degrade-cycle-microamp-hours', 'rohm,volt-drop-0-microvolt', 'rohm,volt-drop-1-microvolt', 'rohm,volt-drop-2-microvolt', 'rohm,volt-drop-3-temp-microvolt', 'rohm,volt-drop-soc-bp', 'rohm,volt-drop-temperatures-millicelsius', 'rohm,voltage-vdr-thresh-microvolt' do not match any of the regexes: '^ocv-capacity-table-[0-9]+$', '^pinctrl-[0-9]+$'
> 	from schema $id: http://devicetree.org/schemas/power/supply/battery.yaml
> 

Odd. I am pretty sure I didn't see this when I ran the make 
dt_binding_check. Not 100% sure what happened there. I get this error 
now though when including all the bindings to the check.

Do I get this right - these errors result from the properties used in 
example not being included in the battery.yaml? So, this means that the 
check is done based on the binding (battery.yaml) where the compatible 
(simple-battery) is defined - not based on the properties which are 
present in this file where the example resides, (and which references 
the battery.yaml)?

...

Oh... Now that I wrote it I feel like an idiot.

This approach couldn't work for the validation, right? Let's assume I 
had a VDR battery, and I added a static-battery -node for it. Running 
the validation would pick the battery.yaml based on the compatible (just 
as it does here), and be completely unaware of this vdr-battery.yaml. I 
have no idea why I thought this would work. Probably because I only 
thought this from the documentation POV.

So, as far as I understand, the only viable options are expanding the 
existing battery.yaml with these properties (which I hoped to avoid, see 
below)

 >> The right place for them is the battery node, which is described by the
 >> generic "battery.yaml". I was not comfortable with adding these
 >> properties to the generic battery.yaml because they are:
 >>    - Meaningful only for those charger drivers which have the VDR
 >>      algorithm implemented. (And even though the algorithm is not 
charger
 >>      specific, AFAICS, it is currently only used by some ROHM PMIC
 >>      drivers).
 >>    - Technique of measuring the VDR tables for a battery is not widely
 >>      known. AFAICS, only folks at ROHM are measuring those for some
 >>      customer products. We do have those tables available for some 
of the
 >>      products though (Kobo?).

or, to add new compatible for the "vdr-battery".
AFAICS, adding new compatible would require us to wither duplicate the 
used properties from battery.yaml here (as battery.yaml mandates the 
"simple-battery" - compatible) - or to split the battery.yaml in two 
files, one containing the generic properties, other containing the 
"simple-battery" -compatible and referencing the generic one. Then the 
"vdr-battery" could also reference the generic one.

Any suggestions for the next path to follow?

Oh, and sorry for asking to review something which is obviously not 
working approach. I should've understood this from the beginning.

Yours,
	-- Matti

---
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

