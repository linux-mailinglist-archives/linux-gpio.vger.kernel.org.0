Return-Path: <linux-gpio+bounces-39491-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QKTXI4lpS2r4QwEAu9opvQ
	(envelope-from <linux-gpio+bounces-39491-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 10:38:33 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E99B70E30F
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 10:38:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=tIER4XnP;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39491-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39491-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 08E51303D940
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jul 2026 07:57:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CA993ED5AE;
	Mon,  6 Jul 2026 07:57:39 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765363191BB
	for <linux-gpio@vger.kernel.org>; Mon,  6 Jul 2026 07:57:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783324659; cv=none; b=PAZTpOOQKj9+OogmEBRXzW+zQz1RtPh/gHJUrPrsXWSkjQq8BeX7Xz8irH0/SKMHHvyFxQ1XOsYlKKxbpgf9Dmo+VzP3dKgOaKblJ2ZOj2drWFTVIvjm8vmzYrRcJEGpNyp+i06qo8Kijgz833C2GkwzSYrnePnDKguRVIDIoYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783324659; c=relaxed/simple;
	bh=9rUAdY1bqdroaIZBNoRnWUT1ZjWTBEwO0TyKfjFIbdw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mZ0RBLb5nRePf7ChqGBTf/zmW8Sz8prc7P1rCnEmVqly9ulazgtyPPOt5e0wExSdgvzSX9lgygH9pEtB04lj3MVcq3nXyry308/RPZ/mDuBpQhst3yWUrIOTO9UWejPBkzW5wlyfYk5Oi+cv5SNe+idA6OFbTWFJQkOdD9E8RUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tIER4XnP; arc=none smtp.client-ip=209.85.128.42
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493c733f15aso27587445e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jul 2026 00:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783324647; x=1783929447; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wPDzWcnE/ifTtdQxRYWVMNosWjNjJ8DQqD5V74MEqYk=;
        b=tIER4XnP4CRpLZw+G8woC/s/tsQ4yLnPO0NYINiXSmFo4IC3mVFzfFo3SOpHFUpKKU
         4OcQOkFJDJ09cBSdNmVw8jtNJ8g3CDOVrglVrYXXeEDi/C2bZjgpqQavHOoaWErbgy5j
         9BLeG8QAPb4i+DtUcgaMZAdMKpkaUsWsVthLZlr0dF5aAbvgwcE/Q2Y7EXlK1NbCNLs9
         kWAv95Lfqm9K0aUWi2VQQSOq165qDeq/sE5MUua7QVU26kYaGv6wlv5emtB5dgs/nz24
         AcTztPUTmyfbC9eeH6twz7uV0LMzpXVtcSvnBdaOAtCH4CxJ3Do+czh7KUKvx7/nXzrH
         ZYow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783324647; x=1783929447;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wPDzWcnE/ifTtdQxRYWVMNosWjNjJ8DQqD5V74MEqYk=;
        b=civIEPd36b+hbXgqG2OX10cJwqoN//URwntTQhs4TWPFuPT7mfmJoG9MDUbLhwiqFr
         ih3/iX/JrwNKWDusU9L/w6JPtw7SLekZyKO2UH2awNQc7datD5R9FX61SHITBJS/WuAt
         2sDoJlpTgkeUoVF9lU2QojOnCI5yvP09vPFHuYY8Ye+yA7MSP5naURmlDKghy8Qd3F3X
         6fvq9ZXydaygkhL+YFzCR/YQXs5XKxbfdVXVvc6jIoixByA/5KnyRhz3fKVZzOeCMXB9
         a1k30VKng/cLyjBPsnL7Sp40g8zpzdSabYH/umQ2BqFnQxxqh+d/TOfaO2/vCXfE4W5/
         j5VA==
X-Forwarded-Encrypted: i=1; AHgh+RqP+ZbvYf4zw+r/cMTo42/RU1/D13o+Lo0X3JyucPGIohmnUc3K3ISKIsqj90X8rgnFSobYvg/XPxcy@vger.kernel.org
X-Gm-Message-State: AOJu0YzlzCHvS0cSt83R3r3h+wjby2COUs0ro8R5yCo2qrMn3GMtTlKj
	msEUAMbZ0qtKnxZJkoxaNHft9a09FhihnCupAKOSzXjUQC0hOPn1x4Gtr+28WHOoV9c=
X-Gm-Gg: AfdE7cn/DA3c4R/uYt+QbvE/ZF1x8w5PzVM/xK/GBcOxIzSvxZdXxWGOuohdncuHm8V
	AWgN+/1D69X98qTXRZEWBahHuErkwTX3QVefc1inUfVPsQcAhvY56SU6eG3k9SfIjZumlCDnFVD
	WEFRZO/8SlMqlIJueHzBfFnRgnL7CzM96SvrKNgX2ZVU6RA4lXse7+5PLw8UY28CBI76+G0o1sj
	Qyvf2JWwfnQkJSXBOyXlC1CVssMI+4QcMjyo8eVJm5RWtXtyIgxTS6LCqQtAyG/sEJ6DhhXoGYr
	bU+zQxnHmmD94gckqOFSc3ZGFzI53f8y4H6WujQbgRIV8Flmb6naycWYubcup74gNyDVq09W9hQ
	bdc1wwc4d3hQrEDRaUI2lb3WIgxotaxp3E2h2ailoJ54vOXfiaagSs6MubgCdqqRdnYbq1AQNQo
	xIt6mMWESkn3BLrzktaUVTpk+mcOGn33iJNMatHwpDD87xqLNlGjp2HrfltmU=
X-Received: by 2002:a05:600c:6087:b0:493:dcad:84ee with SMTP id 5b1f17b1804b1-493dcad864amr16118265e9.0.1783324647312;
        Mon, 06 Jul 2026 00:57:27 -0700 (PDT)
Received: from [192.168.1.107] (87-126-128-216.ip.btc-net.bg. [87.126.128.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cce03fa1sm256320455e9.11.2026.07.06.00.57.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 00:57:26 -0700 (PDT)
Message-ID: <c0e3a874-0d9b-4fc7-bfe9-23ad9d339918@gmail.com>
Date: Mon, 6 Jul 2026 10:57:24 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] dt-binding: ARM: samsung: Add Samsung Exynos8855
To: Alim Akhtar <alim.akhtar@samsung.com>, krzk@kernel.org,
 peter.griffin@linaro.org, robh@kernel.org, conor+dt@kernel.org,
 linusw@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 hajun.sung@samsung.com
References: <20260627171228.2687857-1-alim.akhtar@samsung.com>
 <CGME20260627165406epcas5p1be75af2010edfc57cad0f668a8e3568d@epcas5p1.samsung.com>
 <20260627171228.2687857-2-alim.akhtar@samsung.com>
 <4df9f388-2dc7-47b6-afc0-7a0cc6d15ca3@gmail.com>
 <08ba01dd0cf9$cbe0a4b0$63a1ee10$@samsung.com>
Content-Language: en-US
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <08ba01dd0cf9$cbe0a4b0$63a1ee10$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39491-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alim.akhtar@samsung.com,m:krzk@kernel.org,m:peter.griffin@linaro.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:linux-samsung-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:hajun.sung@samsung.com,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[ivoivanovivanov1@gmail.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ivoivanovivanov1@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,samsung.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5E99B70E30F

On 7/6/26 6:44 AM, Alim Akhtar wrote:
> Hi Ivaylo,
> Thanks for your review. 

No problem :D

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

I see your point but I'm not sure whether exynos-based platforms like tensors
will follow this. Afaik GS101's development name is e9845. So there likely will
still be some deviation.

It's not really a fatal thing, just a nit imo because all bindings will have
to follow that for the upstreamed SoC, so non-revertable. But if maintainers
are okay with this, I'm happy to start using chip-id names for future contributions
too.

Best regards,
Ivaylo

> Yes, there were couple of deviation but let's come back to the "original" convention (which is to use chip-id).
> 
> @ Krzysztof, Peter 
> Any input on this? 
> 
>> Best regards,
>> Ivaylo
>>
>>> +
>>>        - description: Exynos8895 based boards
>>>          items:
>>>            - enum:
> 
> 


