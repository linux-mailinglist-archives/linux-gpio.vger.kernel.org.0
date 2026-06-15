Return-Path: <linux-gpio+bounces-38424-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2bMuOv9BL2oU9wQAu9opvQ
	(envelope-from <linux-gpio+bounces-38424-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 02:06:23 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFC668291A
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 02:06:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=WFpnXeA5;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38424-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38424-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9526F3006F30
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 00:06:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A9E13BB4A;
	Mon, 15 Jun 2026 00:06:18 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB78727732
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 00:06:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781481977; cv=none; b=lh6qjObfsB6cNSWTsdLvXGvDc5VF0hxzUbT0f9cU/P4V0lrYZpmLWsOXgwa6IBvzstW7gwYT8Eb8c6LW+ZSGhvw/ceVq0zuPO7ixSgOO2EbELkHOwaw/zvP/vR0NQJffxERiNil0kZxrVPFt8vZzqigZc0UGHtzkANuFXhXQfOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781481977; c=relaxed/simple;
	bh=wM1pmd/n2MEMAAgL+lxlk4EYzKHHmRQZ+o9slw24KHk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UsyW+YoSEdDwOccSjibnXL7GwFLhUEIqUrjWmm81nju9xA07a9mQuEO5IXHr4cGLyEOlsYH78eUcjFp9PXQJkfutMeuv0JbjBneTeB7LM0CbFXra8lWBtQqGWSf8A8SNY7pF1aQV7SkXl8WKv0CyoLiIvC3DDYjpfU3IzkLA5iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=WFpnXeA5; arc=none smtp.client-ip=209.85.210.53
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7e6d37b7098so2990200a34.0
        for <linux-gpio@vger.kernel.org>; Sun, 14 Jun 2026 17:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781481975; x=1782086775; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ptr+qeygHzVdWEi2AIpd32uZGos4ZXKkLuroPag1QJM=;
        b=WFpnXeA5JmNyF1Q5c2wMM9nGPzf8+viFdlk3InFmTwqWemb8E1fi0vJY+F2IaikkO/
         SiHsecZ17sqEatMz0895YLGcSp/UOliC74SfhAkLVRnNiScrHvtRFcOUKiJFGltODTM4
         xCnV3Ct6/gRYjKBlFQm0NL0HRngAm0g57OuzK8QafvkVHiPE8aULonGb8HVr5hEZ9g40
         ji8ljQpfvPL/YR4k5+cPv3N1VHRCRDGVIpHjF9jUngPKJkzqWq6ms1VHDQ0k31SSqV+L
         D2v2Tew4hygq29cltzKOlZumQK2Df07jQUN8PU3WkklHBRAB2FeCq7fd5SDmqUcNTmLI
         bnDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781481975; x=1782086775;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ptr+qeygHzVdWEi2AIpd32uZGos4ZXKkLuroPag1QJM=;
        b=Vc+sHfq5y2AGCb98w+S/lUpHwCA/5X9h+X4UdDpH1swC3+wKv8cAYxuLtGfpQymL12
         8qrkR4DV1iUPkU5X5VbeDVxiBgkOUSqrYWpxiL/QlyVJoGnDO0sXDO9jWPQIiwsHo27J
         Qr8Sqfd/tiEHX2b3esoFRiaUBmPPEJR2emOG6rAeoahkQlMFz2by0h7pjemj6qJ0nSRQ
         VIhflvqowman7H6TYbl75XvxliEW5/BkcloZuGuX5WHvyRHnE34cxpno+1I59h5L60we
         lUWEQKmNupKYqJP65anry+IeeThzfzCNX/oYjb2EOwi5eVQnaOEuPFUadHU4cFgmLf3g
         tSPA==
X-Forwarded-Encrypted: i=1; AFNElJ8evTxGcWYOwkUMjIH6Pst/mX8E+LmlzH4zvOauBS431M97Fjr403TxXsHVPYNdwbq+RjjGoRFukqAD@vger.kernel.org
X-Gm-Message-State: AOJu0YwAru2rBr7GkR93l97VVQGjnmm7OB9jzS7zRtSDn+ax6Hr++G80
	q3o3/tVy5KvbC2h8AkRYeJoNeP1naxKOdJ+lq+JlvwbE9HPhz3hUVwl75Sg9WDz2ZsM=
X-Gm-Gg: Acq92OF8Fsd9cglblVR57U11XOGIOJ/MGLcZjMCZt1Y05eM9wSeyJ3yNF/JFV7/ggz3
	jdyJmOd6UIoGbxIE9ypIm51AsB8Z4tyosK+EajgAvYiTMHHqoRA1YAwwFkI6K8tjWCx9sx85Vl0
	ifO8rVKzC3zOED0CQk5QjN00fqpDbeuJoWx6n1ZTSeTz43hYauVVN81lNWKefWVlI6K9PcVwy2h
	qLcWMdauCBQBZX22BuVK/Ix2By3OJf9eg2T88yanHZtopA5BzORDEj70xflSkdSvnu1U4QjKDKW
	duHohIhL+ZLTTnVg04TGFUrmeXnmfcSmq7ufoVMDZTyzu2wB90dZ1jZIxlDadQj9YHBvLzCyHSj
	Vjwds7dzRZ57IR8L63DAmYhwchC9P7Xjoe4xXjlYTUZxco5XHkPJzYLMaBwgE5UlNeQEgJyLNju
	KpLBR9EsRwuvyxBEu3HC2X1e/B4IprRF+4bQZ9lIGacBkyvM61eUPGn/Etu5FF50RJf47V1Ff7y
	g==
X-Received: by 2002:a05:6830:6413:b0:7e7:7de:ca8a with SMTP id 46e09a7af769-7e784885b4dmr8823375a34.22.1781481974833;
        Sun, 14 Jun 2026 17:06:14 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:38f2:457e:e670:19c7? ([2600:8803:e7e4:500:38f2:457e:e670:19c7])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e79f5a1b22sm2723806a34.2.2026.06.14.17.06.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2026 17:06:14 -0700 (PDT)
Message-ID: <4fb4f7c8-0a26-4d92-a3d6-ffde82ab4df3@baylibre.com>
Date: Sun, 14 Jun 2026 19:06:13 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: iio: adc: Add TI ADS126x ADC family
To: Kurt Borja <kuurtb@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20260612-ads126x-v1-0-894c788d03ed@gmail.com>
 <20260612-ads126x-v1-1-894c788d03ed@gmail.com>
 <20260613-loyal-azure-goldfish-cf6d54@quoll>
 <DJ92JT0CPSXJ.1113K3KLSRHH4@gmail.com>
 <f13b9c55-770e-454c-9bfb-5847ff17813b@baylibre.com>
 <DJ93WSYC3HTT.3NXQW390CLQ82@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <DJ93WSYC3HTT.3NXQW390CLQ82@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kuurtb@gmail.com,m:krzk@kernel.org,m:jic23@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:nuno.sa@analog.com,m:andy@kernel.org,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	DMARC_NA(0.00)[baylibre.com];
	FORGED_SENDER(0.00)[dlechner@baylibre.com,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-38424-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,baylibre.com:dkim,baylibre.com:mid,baylibre.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5BFC668291A

On 6/14/26 4:57 PM, Kurt Borja wrote:
> On Sun Jun 14, 2026 at 4:37 PM -05, David Lechner wrote:
>> On 6/14/26 3:53 PM, Kurt Borja wrote:
>>
>> ...
>>
>>>> Not a separate device node. Fold into the parent... or explain in
>>>> commit msg. You have entire commit msg to explain odd things.
>>>>
>>>> In that binding description you call it "independent", so it should have
>>>> its own SPI chip select? Why "independent" and part of this binding?
>>>> Maybe not independent, so basically part of this device?
>>>
>>> It's independent in the sense that it is a proper subdevice on the same
>>> chip. It shares the serial interface but operates completely in
>>> parallel.
>>>
>>> I decided to add a subnode because other devices might request their
>>> io-channels and most importantly a different voltage reference might be
>>> connected to it.
>>>
>>> I'll clarify this in the commmit message on the next version. Although
>>> after seeing this submitted bindings [1], I wonder if it's a better
>>> approach to do something like
>>>
>>> 	spi@0 {
>>> 		mydevice@0 {
>>> 			...
>>> 			adc@0 { ... };
>>> 			adc@1 { ... };
>>> 		};
>>> 	};
>>>
>>> Any thoughts?
>>
>> I don't see how this relates to the linked patch at all. The linked
>> patch looks just like a normal DAC binding.
> 
> Ah, wrong link. This is the correct one [1]. The suggestion just at the
> end.
> 
>>
>> What is the point of the 2nd ADC in this chip? Is it just to be able
>> to do simultaneous sampling of two different measurements at the same
>> time? We have other simultaneous sampling ADC chips and just model them
>> as a single device.
> 
> It does simultaneous sampling of the same channel, as well as different
> channels. Also the secondary ADC is only 24 bit instead of 32 bit, has a
> different noise profile and has a different PGA configuration (goes up
> to 128 gain, instead of 32).
> 
> Taken from the datasheet (Section 9.3.15):
> 
> 	Use ADC2 to perform main channel (ADC1) cross-checking
> 	measurements (for example, diagnostics purposes and redundant
> 	channel measurements), system background measurements, or
> 	temperature compensation of the primary sensor (such as
> 	thermocouple cold junction compensation). Using data rates of
> 	10, 100, and 400 SPS for both ADCs, ADC2 performs virtual
> 	parallel conversions with ADC1 on the same input channel.
> 

Ah, that is the kind of info I was looking for.

>>
>> Since everything can be muxed to either ADC at runtime, I don't see
>> any reason the devicetree should care about it. Forcing certain pins
>> to be assigned to a certain ADC seems overly restrictive.
>>
>> And unless you have an application that specifically needs it, I
>> wouldn't bother trying to implement the 2nd ADC in the IIO driver.
>> I didn't see any hints in the datasheet as to when it would actually
>> make sense to use this 2nd ADC. My first thought is that it might
>> make sense to use the 2nd ADC for a 2nd buffer so that you can do
>> 2 buffered reads at the same time. But without knowing why this chip
>> was designed this way, I don't know if that is the right idea or not.
> 
> I myself don't have an application for this feature. But I don't see why
> not adding support for this feature, given that I already implemented a
> driver (Patch 5) and is capable, as you said, of 2 buffered reads at the
> same time.
> 
> I do believe I have to explain all this better in commit messages
> though.

I still think we don't need anything special in the devicetree
though. Other than #io-channels-cells = <2>; where the 2nd cell
would be which ADC the channel is routed through when the consumer
reads it.

Otherwise, we would just have to duplicate all channels exactly
in both the adc@0 and adc@1 node (otherwise we would just be
making artificial limitations).

> 
>>
>>
>>> Ack to the rest of comments.
>>>
>>> [1] https://lore.kernel.org/linux-iio/20260519-ad5529r-driver-v3-1-267c0731aa68@analog.com/
>>>
> 
> [1] https://lore.kernel.org/linux-iio/25mh6grzh7zh3b4uytcqnusyv5zjuf6ia4if3ce3oqzqz56ehi@le72iqv7ye3d/
> 


