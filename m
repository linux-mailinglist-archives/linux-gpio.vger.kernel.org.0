Return-Path: <linux-gpio+bounces-34484-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UC8iNgHOy2luLwYAu9opvQ
	(envelope-from <linux-gpio+bounces-34484-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 15:37:05 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B0236A5A3
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 15:37:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C5EE73099446
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 13:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A046A33F8AD;
	Tue, 31 Mar 2026 13:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JlqVHIAO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D463321DC
	for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 13:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774963925; cv=none; b=DnQvqBZ0NIiWA5HrggyRKJJ3+TGgsDBcSYQgQ+DP6O3O/kHehJf4iqram5oekfXjPXKEDh2QovjWf1jw2n+VyTEDvhMEqn2BjljywVMkt5C8xNSEaIDDh27Gd4H96W36ZKrFdvhT33dJ0E7NkvitrHaCMlAOVv3kTGBWdjEcWCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774963925; c=relaxed/simple;
	bh=dkwJd/RXway5nEOu9TRrDtfrsVoJlFdieW2eF9hmTPM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g7QPTisgUteJS18h9xpZbQ+PeM2cCaglfR0nL74XeEVXQWPdgiSf/tY3y7FLKxelOF34q+BXyxpaZr8qD2/oY1lkgTNLr0N4vbXV5bk8gEAAV2rHD3ngrgf09s6f9USXHfkoSdsurjFXuRzmTKHdY98BslOpHZMlvbcetUH9eto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JlqVHIAO; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2b258576d8cso11878465ad.0
        for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 06:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774963922; x=1775568722; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=HsQ7tsEX1bMlsKuZvXvkHSxJKbLz0c4rqG2pBfziwfs=;
        b=JlqVHIAObt9W5ugR3cNZsyxGmc8Y/rV6cJy0W4a7ii8mKLS93mWq+d8C+I3kOUp7lm
         aoPLcGSkXSmvIolSoyNN/OQ9mtGciJOvG5h34a4z5hwM1DoCZfiM6R36QkQblS5mynaL
         aev+JkwE1Nv5AebjkSrjubeF73XIjI1ZEo3AvL308oEHKtWcZvgLkv2ZBGoA8GEucbG4
         VLMdCfrIzxpToC3jRF9Gn0nusI55bklA0owpvBnrcL3adt0jek2+E+lCkaRrtfP7674T
         znHyNEl0GDjhFfdEy58XE3FmiPqivu07/m7GnkKWrF+Srje15FmbahsbJaAB3x5RzcgC
         WvRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774963922; x=1775568722;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HsQ7tsEX1bMlsKuZvXvkHSxJKbLz0c4rqG2pBfziwfs=;
        b=YaH+5J7auA6RzYljIg5Lz7ALnia07a3K5mpnhi6gQOXmMsNPOOnY9nK0hsHsNRm30N
         fho/0c7cGzeNfHBVHeg70Y5dwsBpzMo5kSITXRbB+SKXgEL03eLODjyVcRSgHN3ZJ8LB
         LfBu7CllXJIbk21/nCKUF5A3uz1Ap1IDdQLGk4wQbP5Ixh3TqnK5iHBAJ0UgqVm/TDiQ
         aFRB7kYDyvamCPAKUZEVOEP8Sw1mLKNfa4ocl8TSerQY0X+29/S0OSUanPP0jpJalvqB
         3jT9kBlIyAG7oyEwqbBmlH+7bOqL2ikZPnH8qStMH81sq4sclJ+MWRlBWL5N0W4gjVh9
         Ox6g==
X-Forwarded-Encrypted: i=1; AJvYcCV+TDgme0iB/Brcsm+Kt76CeEM2LLWij8/ynmVE88xzAxEx1LolqjTvk4TWcRrbzS1QebUhGibesKQi@vger.kernel.org
X-Gm-Message-State: AOJu0YxR0AleUcL6bcTVLD4iecCqrPhSCkM75RHO2OUWxFKqO3cDNLXk
	zzal2A7nd1TvKL8Us7UzIl4o+aGSjBw0hfZFqo4p+IyY4LD/Kut+l2/1
X-Gm-Gg: ATEYQzy6eXyAOzqeCEUXavzbQTLy6SlyYNVREDKum5r8rUAOzyAqCtlrR52nfofcqty
	uzWFHAe3GD9bjCq1BWH8ZKiy13fPoiChhT0/K6TQw6b1JujKXp5gGDiUfdqdcNRDIpVzCwJWI1F
	W92nq8zKTCf7cjUNAFt7ZE3mr+OBNVMg++W5gLnnN71048374MQ5wEWvtt+veBtVGAkIWgJYnD3
	9uUkRpgRnWTYJtL0SC83yiPsW5gdDLw6OFqC0FHyWIcYuvLSZBSKNknlvIsPtGsglhha23xJMpd
	SsnWYW4mRv0SYtYmoO0VpH/aBhGce8lVpZ5YI07a3iqxxmqa6+2fvizjeeP0Dmx36/dhaaEFL1a
	A9XFecc19C7PYMfnGM77kq2QLeJY1CyOnrsKlkU4OQqWFbsq1cNScEuR/UiH4SO7g/OCjlP1LUW
	AZMv/G5L4n6KSne11kGcOJv+PQivlysV18kuX6fj7DF6W2jDJhH45nEK5wRd2xVs3toYDmGSIk
X-Received: by 2002:a17:902:ef4c:b0:2b0:6b98:59ec with SMTP id d9443c01a7336-2b0cdd3ed8emr167424765ad.34.1774963922192;
        Tue, 31 Mar 2026 06:32:02 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24264292asm117475855ad.4.2026.03.31.06.32.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 06:32:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <32c4c4dc-91db-4286-82e5-1d3269c76a74@roeck-us.net>
Date: Tue, 31 Mar 2026 06:31:59 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/3] hwmon: ltc4283: Add support for the LTC4283 Swap
 Controller
To: =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
References: <20260327-ltc4283-support-v8-0-471de255d728@analog.com>
 <20260327-ltc4283-support-v8-2-471de255d728@analog.com>
 <aco5L_6SZIB2DdpF@nsa> <e0c96f38-6742-4b86-8938-64e4e6063119@roeck-us.net>
 <acuLynb1hRFJRcEf@nsa>
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
In-Reply-To: <acuLynb1hRFJRcEf@nsa>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34484-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[analog.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 83B0236A5A3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/31/26 02:48, Nuno Sá wrote:
> On Mon, Mar 30, 2026 at 08:47:32AM -0700, Guenter Roeck wrote:
>> On 3/30/26 02:28, Nuno Sá wrote:
>>> Hi Guenter, Regarding AI review, I think most of the points were
>>> discussed in previous revisions, but there are two valid.
>>>
>>> On Fri, Mar 27, 2026 at 05:26:15PM +0000, Nuno Sá wrote:
>>>> Support the LTC4283 Hot Swap Controller. The device features programmable
>>>> current limit with foldback and independently adjustable inrush current to
>>>> optimize the MOSFET safe operating area (SOA). The SOA timer limits MOSFET
>>>> temperature rise for reliable protection against overstresses.
>>>>
>>>> An I2C interface and onboard ADC allow monitoring of board current,
>>>> voltage, power, energy, and fault status.
>>>>
>>>> Signed-off-by: Nuno Sá <nuno.sa@analog.com>
>>>> ---
>>>>    Documentation/hwmon/index.rst   |    1 +
>>>>    Documentation/hwmon/ltc4283.rst |  266 ++++++
>>>>    MAINTAINERS                     |    1 +
>>>>    drivers/hwmon/Kconfig           |   12 +
>>>>    drivers/hwmon/Makefile          |    1 +
>>>>    drivers/hwmon/ltc4283.c         | 1796 +++++++++++++++++++++++++++++++++++++++
>>>>    6 files changed, 2077 insertions(+)
>>>>
>>>
>>> ...
>>>
>>>> +static int ltc4283_read_in_alarm(struct ltc4283_hwmon *st, u32 channel,
>>>> +				 bool max_alm, long *val)
>>>> +{
>>>> +	if (channel == LTC4283_VPWR)
>>>> +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_1,
>>>> +					  BIT(2 + max_alm), val);
>>>> +
>>>> +	if (channel >= LTC4283_CHAN_ADI_1 && channel <= LTC4283_CHAN_ADI_4) {
>>>> +		u32 bit = (channel - LTC4283_CHAN_ADI_1) * 2;
>>>> +		/*
>>>> +		 * Lower channels go to higher bits. We also want to go +1 down
>>>> +		 * in the min_alarm case.
>>>> +		 */
>>>> +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_2,
>>>> +					  BIT(7 - bit - !max_alm), val);
>>>> +	}
>>>> +
>>>> +	if (channel >= LTC4283_CHAN_ADIO_1 && channel <= LTC4283_CHAN_ADIO_4) {
>>>> +		u32 bit = (channel - LTC4283_CHAN_ADIO_1) * 2;
>>>> +
>>>> +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_3,
>>>> +					  BIT(7 - bit - !max_alm), val);
>>>> +	}
>>>> +
>>>> +	if (channel >= LTC4283_CHAN_ADIN12 && channel <= LTC4283_CHAN_ADIN34) {
>>>> +		u32 bit = (channel - LTC4283_CHAN_ADIN12) * 2;
>>>> +
>>>> +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_5,
>>>> +					  BIT(7 - bit - !max_alm), val);
>>>> +	}
>>>
>>> "Will this condition handle the ADIO12 and ADIO34 differential channels?
>>> It looks like channels 14 and 15 fall through to the default return intended
>>> for the DRAIN channel. Since reading the alarm implicitly clears the register
>>> bits, could reading these ADIO alarms unintentionally clear actual DRAIN
>>> alarms? Should the upper bound be LTC4283_CHAN_ADIO34?"
>>>
>>> Good catch and should be:
>>>
>>> -       if (channel >= LTC4283_CHAN_ADIN12 && channel <= LTC4283_CHAN_ADIN34) {
>>> +       if (channel >= LTC4283_CHAN_ADIN12 && channel <= LTC4283_CHAN_ADIO34) {
>>>
>>>> +
>>>> +	if (channel == LTC4283_CHAN_DRNS)
>>>> +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_4,
>>>> +					  BIT(6 + max_alm), val);
>>>> +
>>>> +	return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_4, BIT(4 + max_alm),
>>>> +				  val);
>>>> +}
>>>
>>> ...
>>>
>>>> +
>>>> +static int ltc4283_probe(struct i2c_client *client)
>>>> +{
>>>> +	struct device *dev = &client->dev, *hwmon;
>>>> +	struct auxiliary_device *adev;
>>>> +	struct ltc4283_hwmon *st;
>>>> +	int ret;
>>>> +
>>>> +	st = devm_kzalloc(dev, sizeof(*st), GFP_KERNEL);
>>>> +	if (!st)
>>>> +		return -ENOMEM;
>>>> +
>>>> +	if (!i2c_check_functionality(client->adapter,
>>>> +				     I2C_FUNC_SMBUS_BYTE_DATA |
>>>> +				     I2C_FUNC_SMBUS_WORD_DATA |
>>>> +				     I2C_FUNC_SMBUS_READ_I2C_BLOCK))
>>>> +		return -EOPNOTSUPP;
>>>> +
>>>> +	st->client = client;
>>>> +	st->map = devm_regmap_init(dev, &ltc4283_regmap_bus, client,
>>>> +				   &ltc4283_regmap_config);
>>>> +	if (IS_ERR(st->map))
>>>> +		return dev_err_probe(dev, PTR_ERR(st->map),
>>>> +				     "Failed to create regmap\n");
>>>> +
>>>> +	ret = ltc4283_setup(st, dev);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	hwmon = devm_hwmon_device_register_with_info(dev, "ltc4283", st,
>>>> +						     &ltc4283_chip_info, NULL);
>>>> +
>>>> +	if (IS_ERR(hwmon))
>>>> +		return PTR_ERR(hwmon);
>>>> +
>>>> +	ltc4283_debugfs_init(st, client);
>>>> +
>>>> +	if (!st->gpio_mask)
>>>> +		return 0;
>>>> +
>>>> +	adev = devm_auxiliary_device_create(dev, "gpio", &st->gpio_mask);
>>>> +	if (!adev)
>>>> +		return dev_err_probe(dev, -ENODEV, "Failed to add GPIO device\n");
>>>
>>> "Does this allow multiple LTC4283 chips to probe successfully?
>>> Without allocating a unique ID per I2C instance, it seems the first probed
>>> chip takes the generic name. If a second chip is present, it might attempt
>>> to register with the exact same name, resulting in a failure in device_add()
>>> and aborting the probe."
>>>
>>> Also looks valid and I suspect is one of those that a quick look will
>>> find more "offenders". I would purpose:
>>>
>>> -       adev = devm_auxiliary_device_create(dev, "gpio", &st->gpio_mask);
>>> +       adev = __devm_auxiliary_device_create(dev, KBUILD_MODNAME, "gpio",
>>> +                                             &st->gpio_mask, client->addr);
>>>
>>
>> That would still fail if there are multiple chips at the same I2C address
>> on multiple I2C busses. Check drivers/gpu/drm/bridge/ti-sn65dsi86.c which has
>> the same problem.
> 
> I did looked at that one but totally forgot the multiple busses
> scenario.
> 
>>
>>> If there's nothing else and you agree with the above, is this something
>>> you can tweak while applying or should I spin a new version?
>>>
>>
>> Please respin. Also, regarding the other concerns:
>>
>>    Can BIT(8) * st->rsense wrap to zero on 32-bit architectures?
>>    BIT(8) is a 32-bit unsigned long and st->rsense is a u32. If a user sets a
>>    very large sense resistor value via the device tree, the multiplication could
>>    wrap to 0, causing a division-by-zero kernel panic. Should the divisor use
>>    BIT_ULL(8)?
>>
>> Unless I am missing something, this _can_ overflow. Try to provide a sense
>> resistor value of 1677721600. Yes, it is unreasonable to specify such large
>> rsense values, but why not just limit it such that it does not overflow ?
> 
> Yes, that's pretty much my reasoning (regarding the unreasonable
> rsense). I could just make BIT_ULL() and be done with it. I can also
> also cap rsense to a max value but i'm not 100% what that value would
> be. Maybe 1 ohm is already more than reasonable. I can also ask internally. Any
> preference on this one?
> 

I'd suggest to reject large (unreasonable) values. In this case, rejecting rsense
values >= 1677721600 should solve the problem.

>>
>> Also, for the overflow concerns, if you are sure they can not happen, I'll
>> really need to write the unit test code to make sure that this is indeed
>> the case.
>>
> 
> Hmm, for the val * MILLI case, well it should not happen but given it
> depends on user input, better if I clamp it before passing the
> value to ltc4283_write_in_byte(). Yes, we clamp again inside the
> write_bytes() API but not a big deal.
> 
> For the st->power_max is again one of those cases where the values would
> not make sense (I think - the combination of vsense_max and rsense). Just looking
> at the code, it can overflow but this one I'm not really sure how we could handle it.
> Maybe clamp power_max to U8_MAX and have a warning message in ltc4283_read_power_byte() if
> we overflow long in which case we need a power64 attr?
> 
> But even clamping does not make much sense here. The power limit register
> is 8 bits, so if our design (rsense + vsense_max) overflows that,
> there's nothing we can do other that erroring out.
> 

Again, why not just reject unreasonable values such that calculations
can not overflow ?

In other drivers, the common approach is to reject unreeasonable values if
provided through devicetree and to clamp them if provided through sysfs.
I don't see why that would not work here.

Thanks,
Guenter


