Return-Path: <linux-gpio+bounces-24572-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB14B2C92A
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 18:11:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECEA1164C50
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 16:11:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93C582BFC60;
	Tue, 19 Aug 2025 16:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hBzY06zM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EDA2BE7BB;
	Tue, 19 Aug 2025 16:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755619862; cv=none; b=qvVgG3uUSTaWVoqF4CxFYkJ3/FKl6/+tkm7CxQRGjBW6Xrs43yli0cvqgelPu54p5b/wQIydT/fzIra2gkGMjxBjPeySsksZAFWPieExWyGDcIvqbDcuedhbk3hdvDM4412TepoAPIpKIRoh7CV5TarDxXbHRDJINO0zi8z39Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755619862; c=relaxed/simple;
	bh=CqGfthUvazDGvJM0QQ3QsOvZ2cEZy3rEvEPEj5jjdF0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p4S6Rs2tWH4HimWzzeJJlVwfaZwSJqVIwyUXpEkDj1lzp4AgzjL+pdzrxi2v8w3R9UvAqHvtlqIV2d850HNajT2kCY0jsK4rl/B5syZLcVoWBEi9nD8fN95wvTZUsEVo/qaD1In5pKznc2WifBPccWVqb99nSO59SDRuJf4hPAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hBzY06zM; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-76e4fc419a9so3136225b3a.0;
        Tue, 19 Aug 2025 09:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755619860; x=1756224660; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=wy+8e3/s8uRVjBJ5NxneJJqen7m853rG6XspvVnExYQ=;
        b=hBzY06zMA+Z0RjIE+68JnJHXAx27kQcZAB6d0e0y7/ivyIBiP1MZdzZcG8K/79f8F6
         cswF5xkPZHwFy3j9WkOEDIPNWVNdnxfkNXwEy3xRWccKIWJ1cqGGIEw3lsNpBqxtZwQ0
         q9s+TOd6LoQqWOkPX52PNgzLa9zgMpQZ0OA0vkiYltU5YDTrzViBOyUnWfMhVWaGkfqJ
         WelQg5iTrtiDmydVGMjyF6NjosEh8v50/E4MmwQoEbH7TMr6ofurx7aAuKuKdm972jwV
         XAwoa/AaO9iOajRuWKUAZs9VnNrL6t8camIa/BBzk+xH/jeBqd23xWUgcBjSydhP7gmN
         WBnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755619860; x=1756224660;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wy+8e3/s8uRVjBJ5NxneJJqen7m853rG6XspvVnExYQ=;
        b=UZPhJzaNJD4D/oGwV8udjFbnkRq7Hc4jXI1Pu95K7ilUhNXD9a3buy2ujEnsk8t5QX
         905IKqU7n9xPdDNm97WDqI0ocfFxxmQtlQLwbyzIT0HboCmIMZw0n72zugnjGeJJNbPr
         RWfN0myns929ouRofuwt9Zi0gKO3/xxuScWY+xPghLCzqP8KUa5WyfqJ9SAboAnZkcfw
         93dHNzKdGuLBBmTZTGFsukirgZZGOaxv3FjT0IID4oPG7bCQmaoEFnfuL+vmCuxYl3AH
         NpzecagZOI/V3w/B+gFI9qHsQOexwOBPESxD+5QLA9jw0ps4Lqaq7LH6B8LHQcYLX4gT
         L9bg==
X-Forwarded-Encrypted: i=1; AJvYcCVYC+vrYhRctFBIKeqN5negKn28Z/O2d/Yoo+lcNGRyTEIKazREudm/gVZGk4x2P+PbakM190unFwliLw==@vger.kernel.org, AJvYcCVffzkn6BE47JiUeslctRg99WP+BXTICtT5m7qW2vNiCg1fF6JIVq4HKSZA5XXIuXoNX4Pr0zE+9L1V@vger.kernel.org, AJvYcCX1Rn11gcbNSSYXwVGtWf0nfQ1PYGkKPy55NtWzu9v53vwRxMTFfjRAbkF21T5LcNl9n1XTXIkTPmnI@vger.kernel.org, AJvYcCXPl3Be1JT+pN5jezwswami4BtXhYwGI808NWMavHxYBq8c93eKg9gbrd12aGFW5j7QKc8Q29OOadYUVLjb@vger.kernel.org
X-Gm-Message-State: AOJu0YwxVPcz7naAS3Qhofirp0LxY9g01NNxg+SOhnlkJjs3qJWfHIqO
	cxgwdoIcriIiGTQvX/p1P9x9jzQFU5261f8YZ4Ko7IW5QbmkBJny4zmI
X-Gm-Gg: ASbGncuwwR2dEX2MGvDEpnwATXWgI5ieJ6Vc818Q6QCYSiNlQxNCLWifTQtCFsZKkPK
	WMLzwMtIVqKBHhjIeTs2JHewGaNq/leAapvZWJTN5HUnJV9OCNqn+koALzy93mk8ZIxe27d3omy
	iP3Jh1hqMQyfSFYhN540i304ozkm0uOawWg1XXJYVzlr2CqmZYrtft6+97F2U4iAK3L5S43838G
	83BFG0GlGg6NDZcX2srHUvh5jzDIzxS6Tl2+OdEJZFSarfr6Az97pSfV/YNkeAJFIgkd9kU1eSS
	byKArY2WzwojkzHLUmN6WEHhvqvRnuMJQ3XVKd6zMyp9BCpyWVrtihLKNQ+guLC+PA1z1ePcfp8
	AWm/YWrphsmc45lsunsOq3X21CUhyaHVvGUIhm0EIW3UY2cTtTggYv1Q1h9OG7kS9x11A3YA=
X-Google-Smtp-Source: AGHT+IF4z6T99xulfCUoGk3BATm3lx9gvGpPoi9uymmz3g3yXwfvdvOPtjqVJktf4fwD6912dJ+E/w==
X-Received: by 2002:a17:902:f606:b0:240:3915:99ba with SMTP id d9443c01a7336-245e02d501emr42394335ad.5.1755619860014;
        Tue, 19 Aug 2025 09:11:00 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed51aa14sm998065ad.145.2025.08.19.09.10.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 09:10:59 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <5f456224-d26f-4cca-a2f2-31418da287c2@roeck-us.net>
Date: Tue, 19 Aug 2025 09:10:57 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] mfd: Add support for the LTC4283 Hot Swap Controller
To: Linus Walleij <linus.walleij@linaro.org>, nuno.sa@analog.com,
 Jonathan Cameron <jic23@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Bartosz Golaszewski <brgl@bgdev.pl>
References: <20250814-ltc4283-support-v1-0-88b2cef773f2@analog.com>
 <CACRpkdYWNgU8PxVaxDe3F6Cbb15J5cgEV1-kgDooOHdBoXXs3g@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAmgrMyQFCSbODQkACgkQyx8mb86fmYGcWRAA
 oRwrk7V8fULqnGGpBIjp7pvR187Yzx+lhMGUHuM5H56TFEqeVwCMLWB2x1YRolYbY4MEFlQg
 VUFcfeW0OknSr1s6wtrtQm0gdkolM8OcCL9ptTHOg1mmXa4YpW8QJiL0AVtbpE9BroeWGl9v
 2TGILPm9mVp+GmMQgkNeCS7Jonq5f5pDUGumAMguWzMFEg+Imt9wr2YA7aGen7KPSqJeQPpj
 onPKhu7O/KJKkuC50ylxizHzmGx+IUSmOZxN950pZUFvVZH9CwhAAl+NYUtcF5ry/uSYG2U7
 DCvpzqOryJRemKN63qt1bjF6cltsXwxjKOw6CvdjJYA3n6xCWLuJ6yk6CAy1Ukh545NhgBAs
 rGGVkl6TUBi0ixL3EF3RWLa9IMDcHN32r7OBhw6vbul8HqyTFZWY2ksTvlTl+qG3zV6AJuzT
 WdXmbcKN+TdhO5XlxVlbZoCm7ViBj1+PvIFQZCnLAhqSd/DJlhaq8fFXx1dCUPgQDcD+wo65
 qulV/NijfU8bzFfEPgYP/3LP+BSAyFs33y/mdP8kbMxSCjnLEhimQMrSSo/To1Gxp5C97fw5
 3m1CaMILGKCmfI1B8iA8zd8ib7t1Rg0qCwcAnvsM36SkrID32GfFbv873bNskJCHAISK3Xkz
 qo7IYZmjk/IJGbsiGzxUhvicwkgKE9r7a1rOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAmgrMyQFCSbODQkACgkQyx8mb86fmYHlgg/9
 H5JeDmB4jsreE9Bn621wZk7NMzxy9STxiVKSh8Mq4pb+IDu1RU2iLyetCY1TiJlcxnE362kj
 njrfAdqyPteHM+LU59NtEbGwrfcXdQoh4XdMuPA5ADetPLma3YiRa3VsVkLwpnR7ilgwQw6u
 dycEaOxQ7LUXCs0JaGVVP25Z2hMkHBwx6BlW6EZLNgzGI2rswSZ7SKcsBd1IRHVf0miwIFYy
 j/UEfAFNW+tbtKPNn3xZTLs3quQN7GdYLh+J0XxITpBZaFOpwEKV+VS36pSLnNl0T5wm0E/y
 scPJ0OVY7ly5Vm1nnoH4licaU5Y1nSkFR/j2douI5P7Cj687WuNMC6CcFd6j72kRfxklOqXw
 zvy+2NEcXyziiLXp84130yxAKXfluax9sZhhrhKT6VrD45S6N3HxJpXQ/RY/EX35neH2/F7B
 RgSloce2+zWfpELyS1qRkCUTt1tlGV2p+y2BPfXzrHn2vxvbhEn1QpQ6t+85FKN8YEhJEygJ
 F0WaMvQMNrk9UAUziVcUkLU52NS9SXqpVg8vgrO0JKx97IXFPcNh0DWsSj/0Y8HO/RDkGXYn
 FDMj7fZSPKyPQPmEHg+W/KzxSSfdgWIHF2QaQ0b2q1wOSec4Rti52ohmNSY+KNIW/zODhugJ
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CACRpkdYWNgU8PxVaxDe3F6Cbb15J5cgEV1-kgDooOHdBoXXs3g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/19/25 05:36, Linus Walleij wrote:
> On Thu, Aug 14, 2025 at 12:52 PM Nuno Sá via B4 Relay
> <devnull+nuno.sa.analog.com@kernel.org> wrote:
> 
>> The LTC4283 device features programmable current limit with foldback and
>> independently adjustable inrush current to optimize the MOSFET safe
>> operating area (SOA). The SOA timer limits MOSFET temperature rise for
>> reliable protection against overstresses.
>>
>> An I2C interface and onboard ADC allow monitoring of board current, voltage,
>> power, energy, and fault status.
>>
>> It also features 8 pins that can be configured as GPIO devices. But since
>> the main usage for this device is monitoring, the GPIO part is optional
>> while the HWMON is being made as required.
> 
> This main device just screams Industrial I/O, IIO.
> 

Really ? I would have assumed that the sensors on a chip like this are supposed
to be used for hardware monitoring, and that IIO is supposed to be used in cases
where the data itself is the relevant information. What exactly makes a hot swap
controller screaming IIO ? Am I missing something here ?

I am not going to argue about this if IIO wants to extend into hardware monitoring,
I just wonder about the rationale behind it.

Thanks,
Guenter

> (I think it's fine to use an MFD core and split off GPIO to a
> separate driver, and I suggest maybe you merge MFD and
> GPIO ahead of the main driver.)
> 
> Jonathan (Cameron) will have the last word on it but IMO this firmly
> belongs below drivers/iio.
> 
> Perhaps not in one of the existing subdirs there but then it is time to
> be brave and create a new one.
> 
> It will take some time and consideration, but I think it would be better
> for everyone.
> 
> Yours,
> Linus Walleij
> 


