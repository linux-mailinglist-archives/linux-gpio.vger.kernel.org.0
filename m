Return-Path: <linux-gpio+bounces-24401-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8ADB27135
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Aug 2025 23:57:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F36A81CC580B
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Aug 2025 21:58:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ED6727E7E1;
	Thu, 14 Aug 2025 21:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KtLa9d4T"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDA827A906;
	Thu, 14 Aug 2025 21:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755208670; cv=none; b=hkp0/5fkAPs1RgEkgIs4J4mnQsR3lo2vALVbiYwKRZh2+tGUUsFwmmmD9Rl5NkKVTf3+d8zitMkmUeQoG1IttfMGGtuEkDSkD2TXCt3v+45OJh8pJ1Vn6IyynYY7o9s2tQ6ANlchNVSkfWgurijwpmEKYp4zC+q2Vepgffrs0FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755208670; c=relaxed/simple;
	bh=phTmtLnitkYoKb7e9mmq3wY9lab3Q91A3Zw7SqrABW4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=abcWex/Do3yreQatIB80PAFdB1cUik2s5gP4Qe0NPDIOpP/o7mGO8HjVCZcLUTNY+wptkeZWDrzKURaVADo0MewqpLGGrd81sdx0ajx1D+IkyhFg2Ir3Z/Koo5JOGA7/7T7TPNo5tvd7e2gEAlEjW1KJO6EfMqUVY4ACdYiruZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KtLa9d4T; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2445818eb6eso11713995ad.2;
        Thu, 14 Aug 2025 14:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755208667; x=1755813467; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=kos1oUdwYiSG5kDlhf65p6HACEPyP9Px5b0hUrNNiIU=;
        b=KtLa9d4TMP+aHoG62B9kOVF/EsjMQpDXfq/ne77gQv0X6xatapihMFjp7QNsrWNzCP
         DhtSaJDfD4JwN7FuiY2EhNkDSnB6GPUGdJXBvt1/lXwtyRWIlF0qORnoUJ+2m4SpWFcH
         GVMv9DZPc/rD6Fx5kXiB9DMy2HZ99t3B5PvZCY/rzBaJPWBuPciVp1pMFuBpKIcKJuAZ
         V9z11WT0qeFAPDQwz7zRaA98oCTN5w/lWf/2eNRvl6r17T2Fb8yv1vYj/g5da/G4eFBZ
         IzR+7owXs0ZVhCUnMcOsJtxzbmDHqXU2PqK+JCCI/cuSFvpRurE21p9BvnkgmAouE0lC
         f9mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755208667; x=1755813467;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kos1oUdwYiSG5kDlhf65p6HACEPyP9Px5b0hUrNNiIU=;
        b=VdOL7dnhcA9U2X1LbwYWJnEonflOYQwBdVCtIccFmJKxRnDz7LoZ/6fLaOAjtHp/jW
         mECF6eXc4N3yl+lntMugMYCxQNtKFbmx0vD2q9B4GPL0wFrxhSGiTXV+Vb0Mq7SqThjS
         uaDzp17Uh7Sbwp6d3s/JojedPSdnp+lo9i/mLUt3VudQRi7qGDBw4jvWYCZAGFihMLSz
         OtdF2lDu/s6ijb8nSYm47/y4xjDQtO9/oilxXtSEksqI/7A0vB89NGmYX9BVtQKGhanK
         AqzEatyN6sTUV0Bj4SpKZjlfFpHvDpPDcxBkZlJeFOJ6gxqj3600xQ23l6hxWKBw2R+V
         Kvxg==
X-Forwarded-Encrypted: i=1; AJvYcCUQh4f/mazNHylPX7CiD5HclFYNbg1tzFZMUkhWrqGocROKclgFSIfQWS8ZkbbB6FMIfRiVPUxI9F7T1g==@vger.kernel.org, AJvYcCUXootFCr85A+43ND8x93GioAYa190jfgRA6C8DFX1lc6f4EFMN+431/NU9nPTQVWYjw5SQNFkvMvKD@vger.kernel.org, AJvYcCW1H0X+89fIydXiv4bbQLRyLkQZQLRQN80jmNRfF1FOK+Bcd/d+WAV8e9XrZDt9l2FCGvYrOs+dI4qWv08=@vger.kernel.org, AJvYcCX4YIKbzddZd3mDdX159yGON5xkhdAH7QSyFpmbgmaCwgzrD6XNVEGoqjOA6ISkPPeO8IILgOy2zo3u@vger.kernel.org, AJvYcCXKyHtaTQbjt6cPvDgQaHTIoEKlu/mU5gtnhZeeXPgjXg5TSLkUSHUeVY5cDM8WbESgZjt5Plu4tdDT8sLk@vger.kernel.org
X-Gm-Message-State: AOJu0YxQhboTnamnPlCqptr7bG+RZSNOg+FJ699stw1sDWiog4Fsaoai
	N/KmeqAKHHNUmspU6yhuDihj6YPTOLoN6BcDPi3sUmsDF7qN0yyG8z7u
X-Gm-Gg: ASbGncuj73saiVpxdwHJFp/2g3ZDppPzo23PW25BF41q20SNahdulSwz8w21wkb1h+G
	WB40IiKLX+5qEv8d6gBxYyGnRLKUOdJpzFmmCSqxvfNqAIWZJ6rSf3WqRunrYsmFvtksaY/idpk
	grC58Lavq/vQyiAJzPIy30ITOj6dOlGf9b2IvOYXz8hDCobH1A6QJRYKHh+9yL4Gr6dISxI4v3h
	fC6fsIg4X/6J2fgb9ONH/tgq+r+wHJUr4qbvQo/WY2I8M9J9Iksx9O5osnm3px75BleuY+dRM3d
	AxLBMwWEXq1sU8vKLaOYVuQ/RD8w0wXktEloTvJnPfkrenh+ZRtEp2JAE9skHrk7JJeAHfvFf2s
	KsbmM+IfbaYQS0bT6OPccMiYzg6Lo2bLywH1auCepvzjjtXm5us8AcxIYWZS1up6foNpWxhitif
	t9tmUP4A==
X-Google-Smtp-Source: AGHT+IEYUHMApV5JfmnOWPdP8c2DD9jwTO2Qxy5fP1z+RL7TXl8hA7llNkD3+mVdeLsUyYl2HUyWqQ==
X-Received: by 2002:a17:902:ec90:b0:234:f4da:7ecf with SMTP id d9443c01a7336-244584af7d8mr72000625ad.8.1755208667388;
        Thu, 14 Aug 2025 14:57:47 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24300f8c998sm77187675ad.134.2025.08.14.14.57.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 14:57:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <de899dde-c0cf-477d-8240-50fbdcbe736a@roeck-us.net>
Date: Thu, 14 Aug 2025 14:57:44 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] mfd: Add support for the LTC4283 Hot Swap Controller
To: =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>
Cc: nuno.sa@analog.com, linux-hwmon@vger.kernel.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>
References: <20250814-ltc4283-support-v1-0-88b2cef773f2@analog.com>
 <5713bb5b-3301-46bc-b30a-d2e4c58d1036@roeck-us.net>
 <2svr42ee7akwxwj5nizwe4a4hqdk4rslv7ivxraqg3jy6m3mxz@lfpn2nx4jdmm>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <2svr42ee7akwxwj5nizwe4a4hqdk4rslv7ivxraqg3jy6m3mxz@lfpn2nx4jdmm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/14/25 07:15, Nuno Sá wrote:
> On Thu, Aug 14, 2025 at 05:54:26AM -0700, Guenter Roeck wrote:
>> On 8/14/25 03:52, Nuno Sá via B4 Relay wrote:
>>> The LTC4283 device features programmable current limit with foldback and
>>> independently adjustable inrush current to optimize the MOSFET safe
>>> operating area (SOA). The SOA timer limits MOSFET temperature rise for
>>> reliable protection against overstresses.
>>>
>>> An I2C interface and onboard ADC allow monitoring of board current, voltage,
>>> power, energy, and fault status.
>>>
>>> It also features 8 pins that can be configured as GPIO devices. But since
>>> the main usage for this device is monitoring, the GPIO part is optional
>>> while the HWMON is being made as required.
>>>
>>> Also to note that the device has some similarities with the already
>>> supported ltc4282 hwmon driver but it is different enough to be in it's own
>>> driver (apart from being added as MFD). The register map is also fairly
>>> different.
>>>
>>> Last time (for the ltc4282) I tried to add the gpio bits directly in the
>>> hwmon driver but Guenter did not really liked it and so this time I'm doing
>>> it as MFD.
>>>
>> Nowadays I suggest that people use auxiliary drivers in such situations.
> 
> I see. But do you have any issue with it being MFD?
> 

I only object to squeezing non-hwmon code into hwmon drivers, especially since
a relatively low-overhead alternative is now available. I would not want to
implement a driver such as this one as set of mfd drivers myself, but I won't
object to it either.

Guenter


