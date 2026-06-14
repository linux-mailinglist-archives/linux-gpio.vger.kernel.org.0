Return-Path: <linux-gpio+bounces-38421-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zdshNTsfL2of8AQAu9opvQ
	(envelope-from <linux-gpio+bounces-38421-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Jun 2026 23:38:03 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 73607682531
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Jun 2026 23:38:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=jO63LKes;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38421-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38421-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 021CD300809B
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Jun 2026 21:38:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2853335064;
	Sun, 14 Jun 2026 21:37:57 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C3D29D267
	for <linux-gpio@vger.kernel.org>; Sun, 14 Jun 2026 21:37:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781473077; cv=none; b=AahwCJ/pNemWhISjYZ1q4R2okkREleUTMnYeZv8+1bOePQKGaXhaFG7XjlxcX7/KuBVbEt+yjA4r/8WcuKLjPBpRnPiIZTSf1RxoA7h44q7MPPZtv8+i4t03PCHkel6brLnMhe2bQo4O2aNUlAt1AJXIbOJ4Upgs9jINv0QMJ1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781473077; c=relaxed/simple;
	bh=rqVjEsB8Ja5AllVHQhk+TNeJtrSgPDgFNJDJJNdH+pI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZjgYxrlozdIOeVM4ajBGqiElR7qoc9sCk5hec6VfVsCOL5g8t+EC6FDH9nXBaqOfMKnzz6wly+wKseTdHw8vNgrAeAkevfX4p0xaCNQSm5blvIZA1aDVVsx0poFHrhwsfZFRqu1sShXmLMakgVQrzPVmv/g+O4jTcYS0Np7ih30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=jO63LKes; arc=none smtp.client-ip=209.85.210.41
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7e6b5737bb2so2359884a34.1
        for <linux-gpio@vger.kernel.org>; Sun, 14 Jun 2026 14:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781473074; x=1782077874; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RI7FLQXUm1QCovQtRMi/TraZX5ESjWymioAQD6cyMfo=;
        b=jO63LKesEGYubsj6pIBESC4comjIQyLvIUnGIxEPUsoG9DzvH2KchQttWhLK29zSwq
         sjT4jfSSIPZScoXxp1mPSRXYPMyZ82Sxw0AS3cP1IwyIWJsnYkCAKRrwCcu8vcqX3yLj
         Risy1AUdWrqQBuZns2m8ys3cVnwMsxw9c2BlnAz9JUR8111SinZovsB3N9IZKHn0qZrf
         aoCOtW7Jxk/VuIP25w0vOSywBKuoKvo68gNng/ogkIweuwYLHmjemuEwVZ+aUTJtMmws
         Hyne1crD64FAcjmk88NVrpy787+hFDX03/kAd/Aadi+xozp1USwIq1bqz4Zpgwj9wmc1
         xI3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781473074; x=1782077874;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RI7FLQXUm1QCovQtRMi/TraZX5ESjWymioAQD6cyMfo=;
        b=DL+BFW3/C3HVaincfiyW6dZ37zNbHx9K9K2I3rI/rtlZIdXj0sw+IdihsHrc2Twlyu
         /2x2+OGgxH1dHO/1TkbBy1k4tKHha7p3XEkkE0Q2kC+7zgaBWOWymOWUlZr/tM/LUvKC
         zdd5pZyowVvxBYwYgVTJbIDoaj4t+F4a1AJBpqkQYIZVaPL4wVcthNv+iIYVsxxU/BkZ
         7QXkjCiwgZ4mYYHKMw1d9Rx6vrxenUQyTI2Nx474WOonnZu7994Q5w2/UXCnQcW3LqWq
         PP5yg+0IBl6n33dtyqL9kCFj1qoiz4EuTEMmVl0cVjXjTgY0sSzLUZGWooJekQV/lwgl
         kwJQ==
X-Forwarded-Encrypted: i=1; AFNElJ8zQqw8N/lEKXpwxutO+pLjB4jX94KXRWhCLxJEC7ild7PMRXXOtiztP7yfAwH7r85EPGJqxwElPUXs@vger.kernel.org
X-Gm-Message-State: AOJu0YyWQ0KR+HJxyPoJ29/zTShC7EvwtdlTkLTbGfoZY5uIcWuGnfjR
	376ZK5u4Li0RPTOpO9YOs118Z47mne21uL0CrD0j49AYRVHDsCixVWNL2n5EboAE1NE=
X-Gm-Gg: Acq92OHB7pRJATPrxMVfvifjL/wJcObUaZHryASD054rvPmSFLsqYrNczTrofbEirrF
	GZYtX+GuAk2I4mvWXBeuKxg20d3h7IMptrlPqGRgCuSlMkI+NnXkNsCFkpObRhA9xKP3V6sxzo7
	psU1EWjT/wtcOq8pnyjHHYk9lRMgfz5SJftNumXR9g6slxHObAAqkl2A3lftxVEAPCdrf6Shgat
	4mS61KfwklEl8GAfVzYBnACFMTpR3wZgdZS5bhjsv4ORBUOHLb8815Px2UYXaMFjZGaFtBirp0f
	rmrSnnzqvIVefdeseW4MlJxsqscE/ivmfoZ1gHTQHIL9TaeKZYT02b23h68kXzffEQ4DuWJrmAU
	k7w4LmpXRYCZYvuRFZdAuut6Eks7G6GMamH6LQf9QPGP/hMq4OPEgvszEZGqSPYzh+0npdw723n
	9FkFHz/UWZB3Ahg4SaUr1wLRbk+0mkOEMEpG4ehlX/fXiK3FxbLsvh5+8F0L6thdRkIQabWG/Jg
	w==
X-Received: by 2002:a05:6830:3816:b0:7e1:f7e9:327e with SMTP id 46e09a7af769-7e7847c2f0amr8471798a34.22.1781473074385;
        Sun, 14 Jun 2026 14:37:54 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:38f2:457e:e670:19c7? ([2600:8803:e7e4:500:38f2:457e:e670:19c7])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e79f6dfae9sm2470025a34.23.2026.06.14.14.37.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2026 14:37:54 -0700 (PDT)
Message-ID: <f13b9c55-770e-454c-9bfb-5847ff17813b@baylibre.com>
Date: Sun, 14 Jun 2026 16:37:53 -0500
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
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <DJ92JT0CPSXJ.1113K3KLSRHH4@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-38421-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,baylibre.com:dkim,baylibre.com:mid,baylibre.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 73607682531

On 6/14/26 3:53 PM, Kurt Borja wrote:

...

>> Not a separate device node. Fold into the parent... or explain in
>> commit msg. You have entire commit msg to explain odd things.
>>
>> In that binding description you call it "independent", so it should have
>> its own SPI chip select? Why "independent" and part of this binding?
>> Maybe not independent, so basically part of this device?
> 
> It's independent in the sense that it is a proper subdevice on the same
> chip. It shares the serial interface but operates completely in
> parallel.
> 
> I decided to add a subnode because other devices might request their
> io-channels and most importantly a different voltage reference might be
> connected to it.
> 
> I'll clarify this in the commmit message on the next version. Although
> after seeing this submitted bindings [1], I wonder if it's a better
> approach to do something like
> 
> 	spi@0 {
> 		mydevice@0 {
> 			...
> 			adc@0 { ... };
> 			adc@1 { ... };
> 		};
> 	};
> 
> Any thoughts?

I don't see how this relates to the linked patch at all. The linked
patch looks just like a normal DAC binding.

What is the point of the 2nd ADC in this chip? Is it just to be able
to do simultaneous sampling of two different measurements at the same
time? We have other simultaneous sampling ADC chips and just model them
as a single device.

Since everything can be muxed to either ADC at runtime, I don't see
any reason the devicetree should care about it. Forcing certain pins
to be assigned to a certain ADC seems overly restrictive.

And unless you have an application that specifically needs it, I
wouldn't bother trying to implement the 2nd ADC in the IIO driver.
I didn't see any hints in the datasheet as to when it would actually
make sense to use this 2nd ADC. My first thought is that it might
make sense to use the 2nd ADC for a 2nd buffer so that you can do
2 buffered reads at the same time. But without knowing why this chip
was designed this way, I don't know if that is the right idea or not.


> Ack to the rest of comments.
> 
> [1] https://lore.kernel.org/linux-iio/20260519-ad5529r-driver-v3-1-267c0731aa68@analog.com/
> 


