Return-Path: <linux-gpio+bounces-35054-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEZjM2Rv2mn02QgAu9opvQ
	(envelope-from <linux-gpio+bounces-35054-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 17:57:24 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 913713E0BC3
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 17:57:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9F64B308AA0D
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 15:54:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F65D3AA50C;
	Sat, 11 Apr 2026 15:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a5FGLWXb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593BF3A8757
	for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 15:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775922881; cv=none; b=gEKnRkZ8nEMycaTVWMF/LfegsPVkA6pWlzW0bG6D7q+zOdRMjO+N9LrYLzxZVu7Xu+Uzrqn37RjWWUnwZaIqYd0rgoOXoi2Re2c4056dMu6AGf4bPovOTIazu01N5aEnvxj5FSKmi01xvLjDti7La8Hqh7oaIT6dJuKChoIbKYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775922881; c=relaxed/simple;
	bh=vyZ3p4QNZDmYaHVFaAa2c29T/arRXgNKIbADpC/E2RY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=geoc6wlhleBXqtwNEFDM8mvuvE0ydLvko2c8VsuS3/KVAhc8tzuUa0UhsK7Vqb/BgIcnzT7tvIUoR0TYxXvnR6iC3hUKTBGSp4ARp3riaVwSTbqVGDjt1QCCVnpJ0QjMzX57RuhP9CHawIdZh0ABYZIZVpESj7jBbUXH60EVjIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a5FGLWXb; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-35d9749c26dso2792142a91.2
        for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 08:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775922880; x=1776527680; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=KdjVpbQ+mHdJ8uLjb1LbuXKErsPJPIomY1MUk5b01hY=;
        b=a5FGLWXbA+ZrxwwsqjwXzqUXV9wVjVCWmKesO6H8aM5/Ka02nkLd0uxVVl2e7QGmoH
         iQbzHQruqgrqco+l5va1Zhpj3u696v7V1V0+LzmYh4C8RoHrFfOBjBEOm13WndLeFE0K
         z/JYpUHKEeSfMdf5lbt+6YkRP/irSbE+N0Jb/YgVpRs+PWaQ2Wyi93U7hIaGitLaUBxp
         nN+IcubwXJjRGXU0dTmwt7jvngppj2wjLIES1oA3dYS4qivOU20p1HmWoJdRS8LxM98+
         IxRQNG8H/6x+WlrIbyKEez4A4Oh2kJDu8/Iv8EEKB/P8UVqFUc/Dg1Bh0RfNJrZcvGAc
         Mzhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775922880; x=1776527680;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KdjVpbQ+mHdJ8uLjb1LbuXKErsPJPIomY1MUk5b01hY=;
        b=XiY/TWMD/n3cfEai4gCdVPij8h/BsFuCjg1NxR7RWJNcF2RVuejj12upAZXAnr3yRY
         82erZWFRkKItTJUUG640jLcd/enGy5SloT6SSwO+mlT7cJLM5fTnzWhRbZ9/iaytaCS2
         3ZWrY3DXtXwfVxU2WNp8+tDdrCDJgSIhyWhSH1Eo9dY1A4wRb9nL2fsIJIqUcr0fH4IA
         VSdvBWxZsfKtxYjkoPEVPE7Mh2yoDgYV380PjLM80sbu1IVQdKAy5eW/OKPUXqDSc4qx
         VXO7PxQdJ7+fmWKjcGNX9UrJEIL/251zi/ewPxgenMPg2OkfRKZ4mtZKmXpGchbzc5VE
         6vtg==
X-Forwarded-Encrypted: i=1; AFNElJ8OP/6m3z9GrK7m5/qgkaIkQz3rQWPWr+VBLOqsfd3QKOuWbvq91urXz+yi+6c7VUk6+DapRBq/QET/@vger.kernel.org
X-Gm-Message-State: AOJu0Yxrk8jYe4zLsVAEoPOavGAffJkP+nAMJqqjli9XvBfpC3EA+SZV
	W+DweIZyRFbZUjUwGEyeGeD7QqXLTvQUIGKciVZIY2A1iSN47CRjRJVi
X-Gm-Gg: AeBDietehAjEPgzj+WjHBVG3sxqA+6xbgEprbeEjQhaAc4Anq1KAxGHHfjnfTVAzI3Q
	nUTD2Z1KGvwNc/YHdN2eUG3o919P7oCGzmJ4IVDdkLvPCcCfyG99t/qWMMPwvB9vOTloZVEIVgJ
	8IdDMQEC/ep2+deJ8AfcWwSiCyRpwBo21BK5QXbjtAcqsAwKI9BRs8SjTtY/FKmMCBku+4Icw76
	yXKDUIdErzLp1OYyHStIJqYnFuRMHGwofrLsuHpFYqHzyPiF0H50TlZWRzeUViyB4DonZTN0cT1
	PXIoK+7+2KJpR/N0Yw0WqpbUUv03w/dAg6Bs4hYjVNkohiU1aEqxfx9JWBgL5RAUyK2QMrArwv1
	97ORz3S+xEfq26Z79ew3QZBL9aweIRPbMImq98XgVzajdixHtZZv1tyH8oxb4BtJhTEPzZy9ZmI
	qUqG9XS0lX3eerk/gQ6AOOK3pJKuQFSTPaCSj3oZbsw5ulCYNWiQkvJoQexCwLUiVRMzcy//VRO
	MHIlXPOB6A=
X-Received: by 2002:a17:902:9341:b0:2b0:4fb6:85ce with SMTP id d9443c01a7336-2b2d5a45a0bmr58725085ad.21.1775922879656;
        Sat, 11 Apr 2026 08:54:39 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f0a39fsm61293595ad.48.2026.04.11.08.54.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Apr 2026 08:54:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <5b695477-8dc9-49c8-ac0a-51c29604fdbf@roeck-us.net>
Date: Sat, 11 Apr 2026 08:54:37 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/3] hwmon: ltc4283: Add support for the LTC4283 Swap
 Controller
To: =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>, nuno.sa@analog.com,
 linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
References: <20260406-ltc4283-support-v9-0-b66cfc749261@analog.com>
 <20260406-ltc4283-support-v9-2-b66cfc749261@analog.com>
 <29b207c8-10ab-42b4-a1c8-988aacc75154@roeck-us.net>
 <2653dc70f42fd015b88e2744da257f6200603b50.camel@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <2653dc70f42fd015b88e2744da257f6200603b50.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35054-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,analog.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,roeck-us.net:mid,sashiko.dev:url,analog.com:email]
X-Rspamd-Queue-Id: 913713E0BC3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/11/26 05:38, Nuno Sá wrote:
> On Fri, 2026-04-10 at 16:27 -0700, Guenter Roeck wrote:
>> On 4/6/26 07:31, Nuno Sá via B4 Relay wrote:
>>> From: Nuno Sá <nuno.sa@analog.com>
>>>
>>> Support the LTC4283 Hot Swap Controller. The device features programmable
>>> current limit with foldback and independently adjustable inrush current to
>>> optimize the MOSFET safe operating area (SOA). The SOA timer limits MOSFET
>>> temperature rise for reliable protection against overstresses.
>>>
>>> An I2C interface and onboard ADC allow monitoring of board current,
>>> voltage, power, energy, and fault status.
>>>
>>> Signed-off-by: Nuno Sá <nuno.sa@analog.com>
>>
>> The patch still has some issues. Please see
>>
>> https://sashiko.dev/#/patchset/20260406-ltc4283-support-v9-0-b66cfc749261%40analog.com
>>
>> Specifically:
>>
>> - regmap_clear_bits() may not cause problems, but it is not the best
>>     choice either because the register was already read.
>>     It might be better to just write the value to be masked since
>>     both the register value and the mask are known.
> 
> Fair enough.
> 
>>
>> - I can't comment on the energy accuracy lost. That is your call.
>>
> 
> The AI might have a point. Maybe you know better but if I understood correctly,
> mul_u64_u64_div_u64() will handle the multiplication by using 128bits (when
> available) or if not, using clever tricks. And it should also handle overflows.
> 
> So my feeling is that we can simplify all of those check_overflow paths with the
> suggested API.
> 
>> - Clamping before multiplying is indeed wrong.
>>     You'll need to clamp before multiplying (and then possibly
>>     clamp again).
> 
> Yeah, the clamp change was just nonsense from me. What about about
> 
> val = clamp_val((u64)val * MILLI, ...)
> 
> ?
> 

I don't think that will work on systems where sizeof(long) == 64.
I'd suggest to just bite the bullet and clamp against LONG_MAX/MILLI
first.

> 
>> -  %*ph: The AI seems to have a point.
> 
> Indeed!
> 
> FWIW, I was already aware of the AI feedback but I'll just setup things locally and
> run the review before submitting again.
> 

The AI now copies you on new revisions. Please feel free to rely on that
(unless you have tokens to burn, of course ;-). Those AI reviews are cheap
for what they do, but they are expensive in absolute terms.

Thanks,
Guenter


