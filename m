Return-Path: <linux-gpio+bounces-39984-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id o76kCjjqVGpihAAAu9opvQ
	(envelope-from <linux-gpio+bounces-39984-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 15:38:00 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C091874BB28
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 15:37:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="Rh/5+Ni6";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39984-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39984-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D1D65320877F
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 13:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6F7F4252D8;
	Mon, 13 Jul 2026 13:20:52 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04609425CF9
	for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 13:20:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783948852; cv=none; b=jKMvu7K1VhIr+PORth204Jw7KNQ0r/MTYHOlVA9MFZDbdcJD3fMYjClnIwsca2n7XGdDQOcRUaPwRVEyFpjIso+M7WiSJQrxG1KctgHHH2JwYIJH1ZGXnp5yeeWW6vtPgrIwnq6xGDo0EEHDwIp7yxwBhld2GCw/8VgvSkHzXm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783948852; c=relaxed/simple;
	bh=P2vvOyZkL+jf80/fIZMA882X28alDrHZQdeMXmZ2tI4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DgFN6be3TcV3OhoBHCi9yMgeS7gC2Dwc1fjOuJGvggOmGPETX0hrem77akLQY57e78yWbIhe9ZvQ+MbWWmj9YIS3efbeOqLyluqhjau2z5BynLVvxG5uWIFSrkvLDqpMDrG4Zz685fn3RBroWB/Iqb8iAZZQSiisPbbE0JwNpJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rh/5+Ni6; arc=none smtp.client-ip=209.85.214.175
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cad4170e8eso34961315ad.3
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 06:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783948850; x=1784553650; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rleYOhAKH3uUT9lCvkQY+3JSxKjGwklq7TceF0agbqc=;
        b=Rh/5+Ni6Vns1HhiMeozYbV7ilY28hOeMLjcXaOPt1ZPn5IzVoh+6TWWWIOSEg006ZT
         81bhaqI7WfHBIpAMDnVD3SnJcaxarFx14d4rF6DVreOGuu2HZQFyAHBobF2J4NzgTxgo
         uVl0xaocw3WyAXS5zNjrInPd+kTsdOTbPjauAHxuVTBwePwASATh5K671qmI9Ciq6IG6
         dfDCgHmJRr5dkP+2ighEINKz7kar8F+0L/q2xGlkbsHSnpTEFzR2iQcWOHxZo+uM4Zrv
         PO/Qs6yd/6i09mF9U1bS9TQgBGuhFrTd2b00iTEwuk+Xv0NMkAH6kbwjCVj8fLhgDOsL
         6GlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783948850; x=1784553650;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rleYOhAKH3uUT9lCvkQY+3JSxKjGwklq7TceF0agbqc=;
        b=LuzNaMUwpLD7Wx7pPqVob+RVn4DNX86obSO72K1SYkzJDj6sk7baPljBtZiBH045Sw
         B8+zTQ3nDTG+ipJy5FrxQree3WIVdmp9j8EE0j0J904mGwq5HLyGze6m5YoFcUrpOZpV
         YkdB3hiZIhUMDI+3T/WniP8P5jTyjpbLpbWTZvgOxVjye3zVs7Ee5SMr927I92JUSEpd
         bA49oBME5OgbZ/dIpyn9LDUbN1wnLFh/ex/kongDZ9BMijs7YyFn7Q+0sjUvn91A91S7
         eWy2fGr8dlbw4Xo/akkJISVnfhgMx/eD4WsV9WZlsbYuvOiks4EaDcHepewD/b4IJUwu
         VR1A==
X-Forwarded-Encrypted: i=1; AHgh+RrHHM+B9RjHNx9XEn5sP+CMlPKN/fxoN6XeXQz+Nsi7imlGtF+tiKhs4yuiBIUT0QsnBKTN+Pc8gqsi@vger.kernel.org
X-Gm-Message-State: AOJu0YwsxSLmcX6X+Ug79OdQhcEt8PKVQ1JyzMVD7/yR/aIlkT3eGQ7b
	BADEzNkgRca2djgXueiydloh3CICJ3n3AUp4ARBPLYgWLI2NxYZbRk89
X-Gm-Gg: AfdE7cmxgR9AawvJuTeBNuqtUZQcYDiK4/DjogA0IrTvRs8yW4NlHVugG4dIHFZULkC
	Xh5NLpXbQh9MnEVahYWaOPX5gEj79EBwn/Lc9QwA7T7JvdJtqxuqLJKsUiUiKp7Cr/SKWg44I8d
	3VlITV6M5moxjKw/s42OpazEbDEOPEWZEdqLA62sakK99J0ym3UUaPit5IFqXYaFpFZj11WqQ3b
	3yLcWG+aVFFgKBbaDcAH6blUHwQf2gT5tnCgtSCi7+gEir7Sxpyw0QU3Pop3REwGV+mTi4KudfA
	0KOxWRWfVta2UcO6+1bWgKLAud0BkSeDSsr/k/lE/evp5oPNUiw4VBgFzTiFpmDXfJeVV1kvVHT
	jZeFcDUxQAyn6MjLjX32p7pGfTjzuCIWPXfOkgIx5tkwh1XHfcIahMTKjbuYxsTY3+cqpf3hAhZ
	D+/cVgGEqKQDe1Ubi9cNEEFSi9VQGzK5nIaDk0enTlTRSIRoZgqsSNHZC/atAcQ3Rx8Tj3fZJ5
X-Received: by 2002:a17:903:2f90:b0:2c6:8d95:fd6d with SMTP id d9443c01a7336-2ce9eae3af3mr80679435ad.21.1783948850322;
        Mon, 13 Jul 2026 06:20:50 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb76asm102435025ad.12.2026.07.13.06.20.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 06:20:49 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <6fa34460-7753-42cc-b88c-4e5aa58a8e90@roeck-us.net>
Date: Mon, 13 Jul 2026 06:20:48 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 5/6] hwmon: add NXP MC33978/MC34978 driver
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Peter Rosin <peda@axentia.se>,
 kernel@pengutronix.de, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-gpio@vger.kernel.org, David Jander <david@protonic.nl>
References: <20260710101358.2606941-1-o.rempel@pengutronix.de>
 <20260710101358.2606941-6-o.rempel@pengutronix.de>
 <alQS61NF-jIPf9c3@monoceros>
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
In-Reply-To: <alQS61NF-jIPf9c3@monoceros>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39984-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:u.kleine-koenig@baylibre.com,m:o.rempel@pengutronix.de,m:lee@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:peda@axentia.se,m:kernel@pengutronix.de,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:david@protonic.nl,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[linux@roeck-us.net,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	DMARC_NA(0.00)[roeck-us.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,roeck-us.net:from_mime,roeck-us.net:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C091874BB28

On 7/12/26 15:20, Uwe Kleine-König wrote:
> Hallo again,
> 
> On Fri, Jul 10, 2026 at 12:13:54PM +0200, Oleksij Rempel wrote:
>> +#include <linux/mod_devicetable.h>
> 
> As for patch 6/6: Please use the <linux/device-id/*.h> you actually need
> only instead of this catch-all header that I want to get rid of.
> 

This was only introduced in v7.2-rc2. Not all contributor branches
(including my hwmon-next branch, which is based off v7.2-rc1)
are synchronized to that release candidate.

Guenter


