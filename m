Return-Path: <linux-gpio+bounces-38819-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hbVUHQBmOWqnrgcAu9opvQ
	(envelope-from <linux-gpio+bounces-38819-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 18:42:40 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 131A46B136D
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 18:42:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=XkfXOoDo;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38819-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38819-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5BD613023AD4
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 16:42:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3829F33B6FC;
	Mon, 22 Jun 2026 16:42:35 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209372BCF4C
	for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2026 16:42:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782146555; cv=none; b=A/Cp5YAuFAXkjqFB3xigVEt9aMROEvvGNeeUhH3L/zoZTM2yr/Az6uQYpvavSnxdsquWG09kF/pxJD/D9ImQYGMr+DYBqhJkx+B6tNVBkFHisyHXRq3cYAkSApi02s9KNJq5zrhYwzDBiPOn2xPSUKRuAvomozuGLufZQ7Mywfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782146555; c=relaxed/simple;
	bh=J6WjMdiSmsSd4l6O9aOiDfddho9ZkXNG7JRLQmJEDtM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dwBZHSS1HZgePcqFTS+wHx1+R3hoYr+YpRiwBmduiyg/CpbDVsDcS8PegPSrtgGL/M3Jg1CQtyuZZlgWuH/jHJVr0LL0YssEwYnrcpAQ2K6stMakYOm2a/r41/27ju+gRfhNKFfrnDqr8MF5mjAO9sIYPxLGLMvU1BwDqRhPaVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=XkfXOoDo; arc=none smtp.client-ip=209.85.210.45
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7e93d1dd156so1101647a34.0
        for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2026 09:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782146552; x=1782751352; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CxdyTp9jzcdAMNgLpztr1n4tuC5ymiq5XeXtaFtDt5o=;
        b=XkfXOoDoIeHeOYHz5SunNd3ooJzqJMDsD296/xrp4hTwsH2opgLKzXGzdLl1AOlJTC
         6o/pq5jpRmblqhyeVj/Q3yG+xWB55IBklzNh/1fjf9SRODUFE4pjLECBNeM6VMFM36FT
         E963Wu1n5tkO7JL4ReUF87s8Z2mm4OfhqGdW8xQD/w2x1Ok0QgknZu2FzITuZhDJ3PEP
         LHSs4PveSeZkJFgh+nnlUTBFCkoSdTYHxDZuhdSCa3+YpIOodQ+E05VHhi3Ze7kNkUBk
         U17yNPTfRLDsjJJLU8Xr7FNnfSDWG88Q4NHl4y/+Lzvx67jD1013fDT1aWe/U3jARBDv
         +7Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782146552; x=1782751352;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CxdyTp9jzcdAMNgLpztr1n4tuC5ymiq5XeXtaFtDt5o=;
        b=Pj+jbH2mgQkuotZbgxaDhjn4Ulv0YwV64fs0Fe6pT2etuwRpqAMs8pK6GgpJ0IBeEg
         inMGQ5L4t4caT4Dd/1CK+uok5chqRkSE6XtrpQAkGXX8Nbuc7WdNVIo2khU6vYSWqDaC
         osqRnbjTWDgCH4UuPinY/L5fb5OJIA9bIrTIHe0qHoQL6OQibjf/Ukuv7FCZeS44Pkwi
         c7QMaMquySuFGq1prJ4W8OD1QbdJbZgxWywgRYSVFku1IcdeGR2UvLcPqZy3xfcUFD2D
         N4op8uWXQhKYMSRvd4TeUCP3+G21NEEOfCWWUnB0/IOZCNuaqwDFyzyo6EGX/klBXbc9
         6tTw==
X-Forwarded-Encrypted: i=1; AFNElJ+0vUkf6/jEnkrk9lSDEvbDmsOce5Qi4dHfHZpKxPxa+P/WvzRrOlRqTAt3Qx+YWLV2655HKeqwqCh3@vger.kernel.org
X-Gm-Message-State: AOJu0YwY9SHFM9J5VwOHnoq/pbaNXkc2mfrQeBUzoCP20+pV0haZEzr1
	jzn4SF1DelRHKy2vZfVmb5YZ53Pa/zs3O8y/dOEMsWYc8O18PEKCYo6LPquUP4YjNAU=
X-Gm-Gg: AfdE7cnotVJ515W38CDNmGDJV+i8ZqHlznxbfzRKU6ZmStsCC85TjnMgs0edqQdHz1+
	E5gjh1QElG6YLq9ytgA2uM9EdKNiD2hIPoVOEeY0AaRbb5g7iL3WLwYhzQFIg2efdevV9T/mAsf
	71SdnAsNn30o32vFRhmvQaZvkYWpOuLMqLMRgwTRAEeXj1S/tgFemO8aAvI/Bcf12SzLK4wqHVg
	6NiQq8wRbI1Wm6g6RjgVLPJ5zMJpFA+xNEwruhb6S5A9WF2SM56kUPkuc4krjHCI50FFZNm7UDd
	sPOBNKvXzp4C0QovJcvfQQ48q1YxQxu4xxu6oBep1PVucrlLnUemACNNrAjWL+Lz31fXPbdo8uZ
	5PoDm/+st7dPlZZvnCDiKXX1puQqZT7Ci+aGZXKD+RcNrBos7meclXDB/NHTvDmr7JU1rs4Ut8i
	ymgn8EIqPU6QWkDLfTt+rWUlUDWSPbVsBhpmj7n6Zao8FlNpWwgB11DBL+8ovxk/A=
X-Received: by 2002:a05:6830:718d:b0:7d7:ea9f:c0f9 with SMTP id 46e09a7af769-7e92d37a1efmr11978490a34.0.1782146552063;
        Mon, 22 Jun 2026 09:42:32 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:b69c:5a77:b8fb:a5cf? ([2600:8803:e7e4:500:b69c:5a77:b8fb:a5cf])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9442e98c4sm6502970a34.26.2026.06.22.09.42.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 09:42:31 -0700 (PDT)
Message-ID: <4980824f-070d-4da9-a291-5563aec6dd09@baylibre.com>
Date: Mon, 22 Jun 2026 11:42:30 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] iio: adc: Add ti-ads1262 driver
To: Jonathan Cameron <jic23@kernel.org>, Kurt Borja <kuurtb@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20260612-ads126x-v1-0-894c788d03ed@gmail.com>
 <20260612-ads126x-v1-2-894c788d03ed@gmail.com>
 <20260613-sparkling-naughty-tuna-3e9bf1@quoll>
 <DJ92M0ZMSI2C.2I39LHFRNQS7W@gmail.com>
 <a994993e-7459-48a2-a8d7-823c1b0c9545@kernel.org>
 <20260621153318.4a723e3b@jic23-huawei> <DJF5ATR2RPDJ.3LSN8DY58E6RO@gmail.com>
 <20260622104728.039a5ea2@jic23-huawei>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260622104728.039a5ea2@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jic23@kernel.org,m:kuurtb@gmail.com,m:krzk@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:nuno.sa@analog.com,m:andy@kernel.org,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	DMARC_NA(0.00)[baylibre.com];
	FORGED_SENDER(0.00)[dlechner@baylibre.com,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-38819-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlechner@baylibre.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 131A46B136D

On 6/22/26 4:47 AM, Jonathan Cameron wrote:
> On Sun, 21 Jun 2026 19:18:33 -0500
> "Kurt Borja" <kuurtb@gmail.com> wrote:
> 
>> On Sun Jun 21, 2026 at 9:33 AM -05, Jonathan Cameron wrote:
>>> On Mon, 15 Jun 2026 06:30:28 +0200
>>> Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>  
>>>> On 14/06/2026 22:56, Kurt Borja wrote:  
>>>>> On Sat Jun 13, 2026 at 1:59 PM -05, Krzysztof Kozlowski wrote:
>>>>>
>>>>> [...]
>>>>>     
>>>>>> Functions used by probe() should be before probe(), not somewhere in the
>>>>>> middle of the code. IOW, entire probe is together.    
>>>>>
>>>>> I they all are, it's just that regmap stuff takes a huge chunk. I'll
>>>>> check how to reorganize.
>>>>>
>>>>> [...]
>>>>>     
>>>>>>> +static const struct of_device_id ads1262_of_match[] = {
>>>>>>> +	{ .compatible = "ti,ads1262" },
>>>>>>> +	{ .compatible = "ti,ads1263" },    
>>>>>>
>>>>>> So devices are fully compatible? Then it should be expressed in the
>>>>>> binding and drop one entry here.    
>>>>>
>>>>> Not fully compatible as Jonathan said. One is a subset of the other.    
>>>>
>>>> This is THE meaning of compatible!  
>>>
>>> This one I'm in agreement with. It is a strict subset, so should be
>>> using a fallback.  If the fallback is used, you just get support of the
>>> stuff in the simpler chip (or if you can override it with a chip ID
>>> you might still 'upgrade' to the more complex driver support).
>>> If you do end up with properties that only apply to 'new' parts of
>>> the more complex chip then they should be verified as part of the
>>> binding (assuming you can do that without the verifier complaining
>>> - I haven't checked!)  
>>
>> In v1 I had the "adc" subnode which was specific to ADS1263. Then I
>> agreed to drop the subnode but I'm having second thoughts...
>>
>> If we dropped it, then we would still have some specific stuff.
>> #io-channel-cells would be "const: 2" in ADS1263 chips. Also ADS1263's
>> channels would have an extra ti,vref-adc2 prop, for ADC2 voltage
>> reference selection. I should maybe also add a vref-adc2-supply.
>>
>> Maybe it's better to keep the subnode or, again, go for something like:
>>
>>     spi {
>>         multi-adc@0 {
>>             adc@0 {
>>                 ...
>>                 vref-suppy = <&adc1-vref>;
>>
>>                 channel@0 {
>>                     ...
>>                     reference-source = <ADS1262_VREF_AIN0_AIN1>;
>>                 };
>>             };
>>             adc@1 {
>>                 ...
>>                 vref-suppy = <&adc2-vref>;
>>
>>                 channel@0 {
>>                     ...
>>                     reference-source = <ADS1262_VREF_AIN2_AIN3>;
>>                 };
>>             };
>>         };
>>     };
>>
>> In this case we would have to kinda duplicate channel description, but I
>> don't think it's that bad.
>>
>> Jonathan, Krzysztof, David, thoughts?
>>
>> IMO the ADC2 specific voltage reference stuff is a strong argument for a
>> subnode or the above solution.
> 
> Given you end up with channel specific stuff that differs I think it probably
> makes sense - though I do wonder a bit if that is real.  What's the use case
> for using a different reference for the monitoring / debug than the main one?
> I could imagine some dynamic use where you want to sanity check against
> a wider reference range, but maybe that needs userspace control rather than
> in here?  


I think is is going to mostly be the same, so could be simpler to just
add extra channel properties on an as-needed basis if things do actually
differ between ADC1 and ADC2 rather than having to define all channels
twice.

This seems pretty similar to the discussion of how to handle e.g. measuring
the same inputs with and without the burn-out current enabled in the
ti,ads112c14 series and I think you have convinced me that we should not
be having a separate channel in the devicetree for that either.

> 
> Jonathan
> 
> 
>>
>>>
>>> The SLF3F discussion is about (to me) less obvious case of not a strict
>>> subset, but rather being detectable parts with different channel related
>>> properties.  In that case the ID match is necessary for anything to work.
>>> Anyhow, that discussion is in a different thread and not really relevant
>>> here.
>>>
>>> Jonathan
>>>  
>>>>
>>>>
>>>> Best regards,
>>>> Krzysztof  
>>
> 


