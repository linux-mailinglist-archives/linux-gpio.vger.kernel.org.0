Return-Path: <linux-gpio+bounces-39354-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /J3VJ/UgRmrMKQsAu9opvQ
	(envelope-from <linux-gpio+bounces-39354-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Jul 2026 10:27:33 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E78AB6F4C69
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Jul 2026 10:27:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=MApo3wvg;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39354-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39354-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A04C430209C0
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jul 2026 08:25:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD7C9428480;
	Thu,  2 Jul 2026 08:25:42 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07A04279FD
	for <linux-gpio@vger.kernel.org>; Thu,  2 Jul 2026 08:25:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782980742; cv=none; b=fnb7R3fyP7lA66ck9x1Z2oOAMHsaS5P6bW3gasCtDzsLykj8twBP8P/xzu7DYy123YCk1FA+37CEKa82SoTIVYoYcyG2DBR/vyj4qZHZf34WO/2mu2LAbMM0JcITBgJtkygsRW0xJf2a1a2pPnXke1YaRihqi8ZUR68/QNLvg4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782980742; c=relaxed/simple;
	bh=oyQyAaTbOb2+AdT8dOLv81agBfPvE7ELT7uNJbodmmk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UnTjgALKYU1oEbkezcMzxfKjmtmYFWD/PGWbw+yy+ia2aw2TxOoSYCC8rfOtYtyUW5S8R337gmgj+L7TtYDPKvmJPR+rTvbwBQVE1ktFNx5VKf0cI9C+iRWmFfpbcUB8ho2j0rkPWM7ddfq5ABBRJkfXfy0SiEXNcGGzHwkHsGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MApo3wvg; arc=none smtp.client-ip=209.85.167.48
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5aebae2f310so1415166e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 02 Jul 2026 01:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782980735; x=1783585535; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ChabhUaCOXh5EuwzltNfOtEZfxGVEpjiK7fdw1VGpnI=;
        b=MApo3wvgaUvbXXXY6Lo131ONlpQ7ay0wSlwBKpBgQqHxRbUlLhLlu/G2aXHUfycjmu
         dQ3FBF7jj/ywmyedTVtcySq8DURMeo8KkZpuGm801YtwR3/7dOcjOGWq7NPqmnEffM9n
         i5I9hcf0cT6Av/l/czk8ZCk2JMyuVJsYVlzijMfAYVWKPR1aHMZ9q6SetSZHtY8Xo/OI
         hCbChOM6BmRDbVm82nY8IH6n615nDWH65KfUdMxyqUUgWn4b4LENO8xX8mePsUjCfc1j
         J4424qE6sjvomPXGlg6Ya7j+GtJ6ZT+e5oTNN6Svw1/BZ4H5SFC5rki3i6FrX8oqqK59
         PEvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782980735; x=1783585535;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ChabhUaCOXh5EuwzltNfOtEZfxGVEpjiK7fdw1VGpnI=;
        b=cqN87RzEOWPj3XKwMOjN1psMoESG38oO3p8xDkXbA2u6ukoCCb1/KQzNelAK8tB4aU
         nNRQ16gG/ikOppWP031Y6YzLZ25BbTVYgu6N6N8YVTjFLVEqdIpFtfwbZ08bzraDpGrG
         HJIZxx4rZO3CjcG1ysIrA96sXUYH95N1GNhNgVdor2DVaVhwFg3kTtIjc0YbaLS+8h1G
         HAPbNxnXjl3NwaQQQp3bmRKUWTmCUa7UTuCYp3dhBO2K++j4FzJyCtFslYJf7Hxq9Ni8
         bxu/c1Th5Xj9RYekZ+85SZCjGEVS1N5Ww09yO4qW85GpdL+zdjMCwsh0BLdY2m1DqIEx
         rtIw==
X-Forwarded-Encrypted: i=1; AHgh+RqLCqJyZau5UfBc6byrBYiC8t8kYT62h3KSxUGx5BYvFSCuyHQiC/WAf68Eqt8rM889EXVC6eM9ixwS@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3zKil7dfuMcJfUcdvA/QBT3YXj5ukoftUc96RHJ9e8ga/Zin7
	8qLTquTPdDJWSnyJ0oODaA8/zYMPxDKETSnYxj0RYQboXd0n6u2KnU30
X-Gm-Gg: AfdE7cl13IB7sk/Z9Mc84mF8LQ4uHbq0hPq/LvvNM6RWa2U9O0WQImd4n37N+KEzmnB
	kIbhhI9pst6N8V0fvTzute0jz6uahCKxYvatKhB7TwdY9jzpufkQOXxx03lEnuGa3eh39oLpQH6
	cX/kmqbS14V43v5On1rxexn5JfJDduAH3S89EwQRaV5+fZEItEvpLpdVE7+qbx2ZqH2PulyytYt
	KTgKdsN0SxE7bE/SQAnX/CAmS9z25facH/4zKFzgIOdsHxFntics/0T6Eoj7R03re9KPcOY5lxy
	0uHZfVkfEQX/FA5OUgNC9kfu21hz5h+uvCtczwudoeeHR4hMN7YVpCEBaRjP6gII3Nss6mUWD1R
	Lb+7cuEv44aW4RC2ZcDhvRjByKpi79mYw5ye4qqCqnrlJTFOD8uTnqmylpvhlzq/enCAtQOaAj+
	tviB6mkJnH27EFqOpKWYHU+sHZl5AbQrGDw2i3BpyFFYkMPSykfQotSGbPMC5SuDiZlEOoNw==
X-Received: by 2002:a05:6512:b9b:b0:5ae:bcdd:acef with SMTP id 2adb3069b0e04-5aec6794c01mr1090989e87.22.1782980735136;
        Thu, 02 Jul 2026 01:25:35 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aec8991691sm547763e87.2.2026.07.02.01.25.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 01:25:34 -0700 (PDT)
Message-ID: <b4c3af3b-a7ca-445c-8da6-7003cd780efa@gmail.com>
Date: Thu, 2 Jul 2026 11:25:32 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] dt-bindings: mfd: ROHM BD73800 PMIC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Matti Vaittinen <matti.vaittinen@linux.dev>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney@redhat.com>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-rtc@vger.kernel.org
References: <cover.1782909323.git.mazziesaccount@gmail.com>
 <3e700a3fa7872a96257ff25a77670ec05cfd239c.1782909323.git.mazziesaccount@gmail.com>
 <20260702-refreshing-terrific-tarsier-f56ada@quoll>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20260702-refreshing-terrific-tarsier-f56ada@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39354-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:matti.vaittinen@fi.rohmeurope.com,m:matti.vaittinen@linux.dev,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:linusw@kernel.org,m:brgl@kernel.org,m:alexandre.belloni@bootlin.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-rtc@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mazziesaccount@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[fi.rohmeurope.com,linux.dev,kernel.org,gmail.com,baylibre.com,redhat.com,bootlin.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mazziesaccount@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,1.st:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E78AB6F4C69

Hi dee Ho Krzysztof!

Thanks for the review (again)!

On 02/07/2026 11:05, Krzysztof Kozlowski wrote:
> On Wed, Jul 01, 2026 at 03:41:34PM +0300, Matti Vaittinen wrote:
>> +description:
>> +  BD73800GW is a single-chip power management IC for battery-powered
>> +  portable devices. It integrates 8 buck converters, 4 LDOs and a current
>> +  sense amplifier with ADC. Also included is a Real Time Clock (RTC) and a
>> +  32.768 kHz clock gate. Depending on the OTP configuration the BD73800
>> +  may also have interrupt controller and GPIOs.
>> +
>> +  There are also different variants called BD71851 and BD71885 which are
>> +  almost identical from the software point of view.
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - const: rohm,bd73800
>> +
>> +      - items:
>> +          - const: rohm,bd71851
>> +          - const: rohm,bd73800
>> +
>> +      - items:
>> +          - const: rohm,bd71885
> 
> items:
>    - enum:
>        -
>        -
>    - const: rohm,bd73800

I suppose this will mean compatible is one of the enum values AND 
rohm,bd73800 as a fallback, while accepting also the rohm,bd73800 alone. 
(No need to reply, I will test it out). If so, then I'll do this for the 
next version (which is probably out only at August).

> 
>> +          - const: rohm,bd73800
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  # The GPIO1, CLKOUT (GPIO2), FAULT_B and EXTEN_OUT pins can be
>> +  # configured to interrupt pins by OTP.
>> +  interrupt-controller: true
>> +
>> +  "#interrupt-cells":
>> +    const: 1
>> +    description:
>> +      The IRQ number. 0 is GPIO1, 1 CLKOUT (GPIO2), 2 FAULT_B and 3 EXTEN_OUT.
>> +      NOTE, A pin can operate as IRQ source only when the OTP
>> +      configuration for it has been set to GPI.
>> +
>> +  gpio-controller: true
>> +
>> +  "#gpio-cells":
>> +    const: 2
>> +
>> +# The GPIO1, CLKOUT, FAULT_B and EXTEN_OUT pins may be configured for a
> 
> Missing two spaces (indent) before the comment, although this should be
> put into description. I understand it applies to each description - it
> is fine to add to the first one. Descriptions might be used to generate
> user-friendly representation of bindings (PDF). Comments won't, so
> comments are only to explain the binding/schema syntax choices.

This comment sounds like someone is crafting a tool which can convert 
the bindings to human-readable spec? For someone as yaml-illiterate as 
me, this really brings some hope :) Although, I would hope we saw some 
"comment-key" which could be used to mark the comment to be included in 
said human-readable format. Stuffing it in the 1.st description is Ok, 
but still somewhat sub-optimal. Oh well, "Ok" will do - I'll add this to 
the description when re-spinning.

I do appreciate your help and feedback (as always!).

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

