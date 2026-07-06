Return-Path: <linux-gpio+bounces-39533-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MxoPCyfwS2pXdQEAu9opvQ
	(envelope-from <linux-gpio+bounces-39533-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 20:12:55 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A85E714591
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 20:12:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=KxMbrcay;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39533-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39533-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B36433278DD1
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jul 2026 16:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 448343F6C4F;
	Mon,  6 Jul 2026 16:05:39 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE3338944D;
	Mon,  6 Jul 2026 16:05:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783353939; cv=none; b=rG12mWQvf9yi+fh8wY3Af9f1kBpexX0hPkcgT+FdzqP9kC6cVr7SRRCuYWCa0Mhjxr1bsAaOppUfuE4gXnwnV0MEQV2OjxgAc3S2vZOzsvRuuNb7rYxNqtJ5vFZvzOhJML6aDtqK6/lLPJsGhrkfsKcCV/lnUP5rpR94/ZMQxfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783353939; c=relaxed/simple;
	bh=dIml/A0VfO+9OIzbeO2WrUGUbJn9cOOad2jYzsULj7A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TiQv9wYuY/0a3f0+nOytJ1e/ly70wTAdUzj1s1hddaaHQrEGvNI1ASnpnQIyjxRz7H1DWRbUByVQVA3bBIzZwfA0EdJyLc3z9zbQ+0lbra8esP3w8/8eqLMN/yz+Ro49LDDg46l55eNB1UOv8fNAJDMgfVhwsVBy5zu0Ko03KJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KxMbrcay; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3397A1F00A3A;
	Mon,  6 Jul 2026 16:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783353937;
	bh=j5n8ja+KSkOU2fLkjSwPTg2xbFjC5d2yzlMgQe8icO4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=KxMbrcaylBUgT9EdsD5fjCITWko5iY74ZC3bsAcqo1IiBV+EqQ28bEbxCGm5/gYjF
	 sEzhl0eBnFteAYTt2blXvqraE9I5wvmktayLfFdOYeeuWns0DtdkTgLcZc5zCrWG3D
	 wb1tw7VSu58afWS/Rtss2bd7RS/A5rnSOIYzvbQA4fTCrjm/kXPKm0tNejlIqn9a3D
	 guDB2bdkKre4MeFWVj3AzO6AO5NutpNrJg7j57motaKKwm7bccR8w4qPyuKSPiHhnv
	 J8H0DCf/Exglv4QjYTZsJ8W95YsJ3exn3/h2QUZf8mEGrltyH1IKKNMobxkDs7kVVM
	 LWoffMVkHUWFQ==
Message-ID: <49883bf8-1c7d-4708-9d38-07767b6b229e@kernel.org>
Date: Mon, 6 Jul 2026 18:05:31 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] dt-binding: ARM: samsung: Add Samsung Exynos8855
To: Alim Akhtar <alim.akhtar@samsung.com>,
 'Ivaylo Ivanov' <ivo.ivanov.ivanov1@gmail.com>, peter.griffin@linaro.org,
 robh@kernel.org, conor+dt@kernel.org, linusw@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 hajun.sung@samsung.com
References: <20260627171228.2687857-1-alim.akhtar@samsung.com>
 <CGME20260627165406epcas5p1be75af2010edfc57cad0f668a8e3568d@epcas5p1.samsung.com>
 <20260627171228.2687857-2-alim.akhtar@samsung.com>
 <4df9f388-2dc7-47b6-afc0-7a0cc6d15ca3@gmail.com>
 <08ba01dd0cf9$cbe0a4b0$63a1ee10$@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <08ba01dd0cf9$cbe0a4b0$63a1ee10$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alim.akhtar@samsung.com,m:ivo.ivanov.ivanov1@gmail.com,m:peter.griffin@linaro.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:linux-samsung-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:hajun.sung@samsung.com,m:ivoivanovivanov1@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[samsung.com,gmail.com,linaro.org,kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-39533-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,samsung.com:email,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7A85E714591

On 06/07/2026 05:44, Alim Akhtar wrote:
> Hi Ivaylo,
> Thanks for your review. 
> 
>> -----Original Message-----
>> From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>> Sent: Monday, July 6, 2026 4:11 AM
>> To: Alim Akhtar <alim.akhtar@samsung.com>; krzk@kernel.org;
>> peter.griffin@linaro.org; robh@kernel.org; conor+dt@kernel.org;
>> linusw@kernel.org
>> Cc: linux-samsung-soc@vger.kernel.org; linux-kernel@vger.kernel.org;
>> devicetree@vger.kernel.org; linux-gpio@vger.kernel.org;
>> hajun.sung@samsung.com
>> Subject: Re: [PATCH v3 1/6] dt-binding: ARM: samsung: Add Samsung
>> Exynos8855
>>
>> On 6/27/26 20:12, Alim Akhtar wrote:
>>> Add Samsung Exynos8855 smdk board to documentation
>>>
>>> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
>>> ---
>>>  .../devicetree/bindings/arm/samsung/samsung-boards.yaml     | 6 ++++++
>>>  1 file changed, 6 insertions(+)
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
>>> b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
>>> index 753b3ba1b607..273464400477 100644
>>> ---
>>> a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
>>> +++ b/Documentation/devicetree/bindings/arm/samsung/samsung-
>> boards.yam
>>> +++ l
>>> @@ -235,6 +235,12 @@ properties:
>>>                - winlink,e850-96                 # WinLink E850-96
>>>            - const: samsung,exynos850
>>>
>>> +      - description: Exynos8855 based boards
>>> +        items:
>>> +          - enum:
>>> +              - samsung,exynos8855-smdk         # Samsung SMDK
>>> +          - const: samsung,exynos8855
>>
>> Is there any particular reason for using "exynos8855" rather than the
>> commercial name - exynos1580? We've already established using the latter
>> naming scheme as a convention (e.g. exynos3830 -> exynos850, exynos9830 ->
>> exynos990) rather than the development model numbers, so I don't think
>> breaking that will help anyone with the already painful model number confusion.
>>
> The reason for using Exynos8855 is that it comes from the chip-id register, which is RO register.
> And in my opinion it has to be chip-id, maintaining two names is confusing (as you also mentioned).
> Yes, there were couple of deviation but let's come back to the "original" convention (which is to use chip-id).
> 
> @ Krzysztof, Peter 
> Any input on this? 

Back in Exynos850 upstreaming, my preference was the chipid value, but I
agreed for marketing name. Marketing names are tricky, because:
1. They change,
2. They might multiply (two or three marketing names for the same die -
common case in Qualcomm),

That's why for Samsung SoCs, I rather prefer chipid value. For
Google/Axis/Tesla the case is different and we should use their naming -
some engineering name for example.



Best regards,
Krzysztof

