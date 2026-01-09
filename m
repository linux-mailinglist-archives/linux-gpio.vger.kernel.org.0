Return-Path: <linux-gpio+bounces-30358-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D194FD0AA8C
	for <lists+linux-gpio@lfdr.de>; Fri, 09 Jan 2026 15:37:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D02F73008EA2
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jan 2026 14:36:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 569E235FF7B;
	Fri,  9 Jan 2026 14:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UpdAsFKs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FA235FF62
	for <linux-gpio@vger.kernel.org>; Fri,  9 Jan 2026 14:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767969383; cv=none; b=QlP69uH22/PP2z27/aGj++QYM9q5U8MLEKi9UO2b4sEt71ZdNoEwP5V0z0OXE+2hP8wtSRqBWPXL4twbf1+gRe2/22L9ngVXJXcoPIFEtIHAHx+pz/NT68HPCKkctQ3JYCGNOx2cx4PxIy+tnI+fndj79c0LVuu+mLYB9vQwIKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767969383; c=relaxed/simple;
	bh=2NZ4zLF+23YrqqYhFhl62fRIKvmRql6xQnxcTNa/NY4=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ge2sBxc5kP3Zv4hXFLv6Y/dpIRnpIOOe24tcrBXCuaVv7U6eY5E82lg6deV6SeJVmoC8PjaW0UqPcnvYqJawoNPk9Rd9bE55tZxlWmrG09vM/6/zSluDmdOJx8EP7mOf5YwdidfLtjVM1h3I+QeClo8SnFWPr4fsizsfBf/bCOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UpdAsFKs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AEAAC4CEF1
	for <linux-gpio@vger.kernel.org>; Fri,  9 Jan 2026 14:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767969383;
	bh=2NZ4zLF+23YrqqYhFhl62fRIKvmRql6xQnxcTNa/NY4=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=UpdAsFKs+7OQIhIq6/3SG0T+STNAFd7pV8Ng6l54C6bscIrRed2UQ1R2xQ6qcCvQV
	 EFO/Cn4+dSkYVXPTEk5je2+y1ZTPTho0/oqLf+zCVEoD8uUJVDkCpbFegpxXHETmoK
	 yLa8roYHlDahc3ha+Fd4ObbkBwERqnsrktz+l1zihnO75AktOXwK66BWnjd0SFKxlh
	 E2GRt5L/5uMsf021P1UVb7K13ZSjuc1z63neBfm4Usu4gzQWAshVEdtIW650ZwUJQt
	 bfBvd8O4b/TlBbVd8o7gF1vvNkBeGom3M7cznxJzXLHGxCYXSWw7lMX1DqiwwTTGeh
	 Bw9mOyVGEvD5Q==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-382fb275271so27146281fa.0
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jan 2026 06:36:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW6MzyqENSbQz7IAUzyz9JSS2KBExKuUs5bJ2TeY69yoeVwE4aEbwk3TfdGVlEb6rNAewhEkFWZBbCl@vger.kernel.org
X-Gm-Message-State: AOJu0YyBKKLRmlRSI6YY0ToSySlU4bLt5LQtzzxSghw8dcByvZMi20hc
	uTd4Pp5v33Vu+R0iBoB4zLM5jF0gk3fuzSHFy+tBH8Qtqh0kC3CWFe0D2MPL9Hxn2wXqT2tQhls
	tcPI6VH6seBxv8OFUw5tftaQysiut3eRlOqDNs7KewQ==
X-Google-Smtp-Source: AGHT+IGnj2GFhfKOZHI1myjhOoLlYQEiiFg5mvMX+St+uKzfjSqfudZVQ/wbvWJOixUbCexSQON7m0kHa/Z+HjWmAwU=
X-Received: by 2002:a05:651c:198a:b0:383:246a:74eb with SMTP id
 38308e7fff4ca-383246a7a39mr5563731fa.0.1767969382232; Fri, 09 Jan 2026
 06:36:22 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 9 Jan 2026 06:36:21 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 9 Jan 2026 06:36:21 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <DFK46PUEYQFD.1ZE4WO3YCYQJ9@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260109105557.20024-1-bartosz.golaszewski@oss.qualcomm.com> <DFK46PUEYQFD.1ZE4WO3YCYQJ9@kernel.org>
Date: Fri, 9 Jan 2026 06:36:21 -0800
X-Gmail-Original-Message-ID: <CAMRc=Mf_EXVBJzDY_R5Bge3kDdcANkpEqXz3RwgnfWEm4s5c0g@mail.gmail.com>
X-Gm-Features: AQt7F2oFuet8xT6M_-sYa5US2svFmG3t9Sp28ibcDtOJUlZ9NqK6HmoO3Aj7hZY
Message-ID: <CAMRc=Mf_EXVBJzDY_R5Bge3kDdcANkpEqXz3RwgnfWEm4s5c0g@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: remove redundant callback check
To: Michael Walle <mwalle@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 9 Jan 2026 15:05:36 +0100, Michael Walle <mwalle@kernel.org> said:
> Hi,
>
> On Fri Jan 9, 2026 at 11:55 AM CET, Bartosz Golaszewski wrote:
>> The presence of the .get_direction() callback is already checked in
>> gpiochip_get_direction(). Remove the duplicated check which also returns
>> the wrong error code to user-space.
>>
>> Fixes: e623c4303ed1 ("gpiolib: sanitize the return value of gpio_chip::get_direction()")
>> Reported-by: Michael Walle <mwalle@kernel.org>
>> Closes: https://lore.kernel.org/all/DFJAFK3DTBOZ.3G2P3A5IH34GF@kernel.org/
>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>> ---
>>  drivers/gpio/gpiolib.c | 3 ---
>>  1 file changed, 3 deletions(-)
>>
>> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
>> index 0a14085f3871..5eb918da7ea2 100644
>> --- a/drivers/gpio/gpiolib.c
>> +++ b/drivers/gpio/gpiolib.c
>> @@ -468,9 +468,6 @@ int gpiod_get_direction(struct gpio_desc *desc)
>>  	    test_bit(GPIOD_FLAG_IS_OUT, &flags))
>>  		return 0;
>>
>> -	if (!guard.gc->get_direction)
>> -		return -ENOTSUPP;
>> -
>
> Not sure, if that will make it better or worse though.
>
>>  	ret = gpiochip_get_direction(guard.gc, offset);
>
> Because that will then do a WARN_ON(!.get_direction) and will spam
> the kernel log in case of the gpio-shared-proxy. Also the return
> code will change from ENOTSUPP to EOPNOTSUPP.
>

From checkpatch.pl:

--
# ENOTSUPP is not a standard error code and should be avoided in new patches.
# Folks usually mean EOPNOTSUPP (also called ENOTSUP), when they type ENOTSUPP.
--

This can end up propagated to user-space which doesn't know what ENOTSUPP is.
This is why we've already changed the return code to -EOPNOTSUPP before, this
is just a leftover.

I prefer to keep the WARN() because it's very unusual for a GPIO driver to not
implement this callback. Can you confirm you're still seeing the issue with
this patch[1]? If so, let's use [2] as the fix?

Bart

[1] https://lore.kernel.org/all/20260108-gpio-shared-false-positive-v1-1-5dbf8d1b2f7d@oss.qualcomm.com/
[2] https://lore.kernel.org/all/20260109130832.27326-1-bartosz.golaszewski@oss.qualcomm.com/

