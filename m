Return-Path: <linux-gpio+bounces-25696-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0400DB467FC
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Sep 2025 03:25:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E7517189AD53
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Sep 2025 01:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE54518FC92;
	Sat,  6 Sep 2025 01:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YHd7nLT/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7763C3594A;
	Sat,  6 Sep 2025 01:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757121891; cv=none; b=ExCkVBB89axfA1fMTWuD+zIN3WylOpaKYiIsc678aT3YNDYn35ESspDWHm7iSidXBX3F3clGCYyJ00x+WBh0sE50KF/F9wr14CSu/HYBJnVKDQgl8YoL6DtXQdQxMcnfECIebHrzQLj8BasUrswl/DmA0IvT3u0B3ui3lR/QtRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757121891; c=relaxed/simple;
	bh=aaWr280PABz1r+flXirE3qOc+6KlzEbMvbAgk80KppQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DDB8XQgYCghEaOZVGZ6Eweyj+Tkdk7lNe88SFQJW7m+L1Cm596fMfGoI8IV+hrk4Hovt4USiqCOn3msrFLGpI0k7mnYzPiYDKLgTbUOepQkDIhN6YVe7B10HhBE5lPklMl4AmzJ+110VjCCls1doZYMAJ88ubxgHNNbAMlJCxMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YHd7nLT/; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-24b2de2e427so20204535ad.2;
        Fri, 05 Sep 2025 18:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757121887; x=1757726687; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=xWmCvWsytcTjtEJ9lqttB0CWF0TqT9m3n46WcH67fno=;
        b=YHd7nLT/GaK/zZ5K+3xl+gHUgPXFqXURESkTJOD5yebxQxNTEuCVdNoOR/UIN6w7Dy
         8B4nkB+fBYG+QOycF/2FfuF1MpEuaoB9j5IXT+x+/COI3aiDVmpr5ihBfWaWG3S6h2pG
         cCaOBzO3ARJthhSsrmPeSdAggIGM3pWnkSgzXd5e9jJhbLhgG0oFm/Z2Z29qMVHx7FJa
         Oy3ZUhMKGz5RDW0cGDbhFSnBqIxyPU0dL2qIrOKNoFWzBbCD8RKWr6Xekh9STG5orTLE
         eU9jbYAUgDK3/nC9mxtLjdlnb0KogREQeJccmnCWPhxZo6ahMTwziJLp74HtsQJwuNUn
         7Z6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757121887; x=1757726687;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xWmCvWsytcTjtEJ9lqttB0CWF0TqT9m3n46WcH67fno=;
        b=V/4nif+15+ROy9UM0t5HiS+5yn8emnkVa6XSWi/Yp/j6fdi1P/MKM9+QWDFG+fpynV
         iegwvMx6uEMBC4iRWFD9q2bdaRSfAEp+n0NVqP3kCkLuIa2KTLY0kaVnlUqlr9ZoATI6
         eKoMLRXxItkhY1xxguNX0P9Dk6nLhjU+pVi+7FXJZDmVep4LW42BFtqdf6dYPAZLCJYo
         3XCxd9bi7xupFMyW4teI1S5Mh8WiCht8oem5tTG/ih0pS0UHELMOgTyiSJdD24UCTHQB
         mxpn6vH1RtRz7YITOylGerlzLJ5yu4B+veLfOE/PpM96DT8DaNVlEbcub72cU+qfBVQL
         0g6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUhFqM2oBi7ngE8yVZQZ/fpGXzvYnfD8igwGwuIyUU1H3K57EzZgh7po4iHA7pMyeLDB3zcODfk+laO@vger.kernel.org, AJvYcCUnqQcHoVpUa48iVAWN4Lukb5mk0H4tep9GjzNXl9FziDI+T8ujEzl1v16uicoqKWMXu36IlqvmMADn@vger.kernel.org, AJvYcCWntmS+fk89FgmqNsnAY1M+mpceszIF7UiPG0QH+VtkIJxa38Rt7s0TJiDaI+M0Rh47jDOw1nqofU5+Wpc=@vger.kernel.org, AJvYcCWxHddLh/plqeD1AaAcKTkIBXFooXQk+3gVnDwJX+rw8JHv/ACcJ9AN6f65RZ64YhYADXP+VoceEOLjbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YybVnxn4e+9Ducty3LegXPO3fDyd0jabaR6vZ/TvZVYLIwDThgN
	p5Q8WLF1//6E88eiVw0OawKLCQtx+C6SPJlo/EupZgjZs6rua+Di3PJc
X-Gm-Gg: ASbGncsYZi5GwsobDM0hISd7ea14Zm6E80N9OTum89TS7rGuLHly9zTqZNqBQftmmMr
	6m+I+NpyRz496ar5cy0FojV72pQrSub9kP11PJczy7HLuJYTCdA91Z8OyMjzBppOCfkiK8nSBeS
	ASr7vM3AGZY4W+Z3aM2+MNMI3x1ixS3BX9Z+6onzpLZD85ZPgHg2HdQ1V3kZgj1XSY1W35mjyK4
	QTdZp7sNbEbNZhkCJud0z9nixsaGc/1FxwjOVPm5m+etd3qZy5dEcvlL36b7IH58H++1gfd0Xik
	pWMaWwxKLG9XavSZOQFlXcotKZTOIBZAQeJM+2g5A15eyqSwxixyx8Xxto6Jl2oflcWYuZFMhgQ
	/hsLjG0Lc/lHn2nbrM5NNzcfJB36g2PBv9UrQKdsTEEuhjisASZaQoqtxLVGjo3L643QgrVU=
X-Google-Smtp-Source: AGHT+IHAz5DSIqQfwzE9IPtl8KmYjfb1aq2VexNtxNm/3nYm+E+0FiTcnzG1ss9BtpM+UpF6G7mCNg==
X-Received: by 2002:a17:903:4b03:b0:250:ea89:9e0f with SMTP id d9443c01a7336-25172483c20mr7859065ad.46.1757121886214;
        Fri, 05 Sep 2025 18:24:46 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24c8945d8d4sm86845185ad.127.2025.09.05.18.24.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 18:24:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <742fe9b5-bc53-45f2-a5f1-d086a0c9dd1c@roeck-us.net>
Date: Fri, 5 Sep 2025 18:24:44 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] hwmon: ltc4283: Add support for the LTC4283 Swap
 Controller
To: nuno.sa@analog.com, linux-hwmon@vger.kernel.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>
References: <20250903-ltc4283-support-v2-0-6bce091510bf@analog.com>
 <20250903-ltc4283-support-v2-2-6bce091510bf@analog.com>
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
In-Reply-To: <20250903-ltc4283-support-v2-2-6bce091510bf@analog.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/3/25 03:05, Nuno Sá via B4 Relay wrote:
> From: Nuno Sá <nuno.sa@analog.com>
> 
> Support the LTC4283 How Swap Controller. The device features programmable
> current limit with foldback and independently adjustable inrush current to
> optimize the MOSFET safe operating area (SOA). The SOA timer limits MOSFET
> temperature rise for reliable protection against overstresses.
> 
> An I2C interface and onboard ADC allow monitoring of board current,
> voltage, power, energy, and fault status.
> 

Some initial feedback. I'll have to spend much more time on this.
The calculations are not easy to understand.

Also, please send me a register map (generated with i2cdump).
I'll want to run unit test code to ensure that there are no obvious
problems with the code.

Thanks,
Guenter

> Signed-off-by: Nuno Sá <nuno.sa@analog.com>
> ---
>   Documentation/hwmon/ltc4283.rst |  266 ++++++

Add to index.

>   MAINTAINERS                     |    1 +
>   drivers/hwmon/Kconfig           |   12 +
>   drivers/hwmon/Makefile          |    1 +
>   drivers/hwmon/ltc4283.c         | 1748 +++++++++++++++++++++++++++++++++++++++
>   5 files changed, 2028 insertions(+)
> 
> diff --git a/Documentation/hwmon/ltc4283.rst b/Documentation/hwmon/ltc4283.rst
> new file mode 100644
> index 0000000000000000000000000000000000000000..0a8d72904122660360a33150d5046fe493b1c3d8
> --- /dev/null
> +++ b/Documentation/hwmon/ltc4283.rst
> @@ -0,0 +1,266 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +
> +Kernel drivers ltc4283
> +==========================================
> +
> +Supported chips:
> +
> +  * Analog Devices LTC4283
> +
> +    Prefix: 'ltc4283'
> +
> +    Addresses scanned: - I2C 0x10 - 0x17 (7-bit)
> +    Addresses scanned: - I2C 0x20 - 0x2E (8-bit)
> +
> +    Datasheet:
> +
> +        https://www.analog.com/media/en/technical-documentation/data-sheets/ltc4283.pdf
> +
> +Author: Nuno Sá <nuno.sa@analog.com>
> +
> +Description
> +___________
> +
> +The LTC4283 negative voltage hot swap controller drives an external N-channel
> +MOSFET to allow a board to be safely inserted and removed from a live backplane.
> +The device features programmable current limit with foldback and independently
> +adjustable inrush current to optimize the MOSFET safe operating area (SOA). The
> +SOA timer limits MOSFET temperature rise for reliable protection against
> +overstresses. An I2C interface and onboard gear-shift ADC allow monitoring of
> +board current, voltage, power, energy, and fault status.  Additional features
> +respond to input UV/OV, interrupt the host when a fault has occurred, notify
> +when output power is good, detect insertion of a board, turn off the MOSFET
> +if an external supply monitor fails to indicate power good within a timeout
> +period, and auto-reboot after a programmable delay following a host commanded
> +turn-off.
> +
> +Sysfs entries
> +_____________
> +
> +The following attributes are supported. Limits are read-write and all the other
> +attributes are read-only. Note that the VADIOx channels might not be available
> +if the ADIO pins are used as GPIOs (naturally also affects the respective
> +differential channels).
> +
> +======================= ==========================================
> +in0_lcrit_alarm         Critical Undervoltage alarm
> +in0_crit_alarm          Critical Overvoltage alarm
> +in0_label		Channel label (VIN)
> +
> +in1_input		Output voltage (mV).
> +in1_min			Undervoltage threshold
> +in1_max			Overvoltage threshold
> +in1_lowest		Lowest measured voltage
> +in1_highest		Highest measured voltage
> +in1_reset_history	Write 1 to reset history.
> +in1_min_alarm		Undervoltage alarm
> +in1_max_alarm		Overvoltage alarm
> +in1_label		Channel label (VPWR)
> +
> +in2_input		Output voltage (mV).
> +in2_min			Undervoltage threshold
> +in2_max			Overvoltage threshold
> +in2_lowest		Lowest measured voltage
> +in2_highest		Highest measured voltage
> +in2_reset_history	Write 1 to reset history.
> +in2_min_alarm		Undervoltage alarm
> +in2_max_alarm		Overvoltage alarm
> +in2_enable		Enable/Disable monitoring.
> +in2_label		Channel label (VADI1)
> +
> +in3_input		Output voltage (mV).
> +in3_min			Undervoltage threshold
> +in3_max			Overvoltage threshold
> +in3_lowest		Lowest measured voltage
> +in3_highest		Highest measured voltage
> +in3_reset_history	Write 1 to reset history.
> +in3_min_alarm		Undervoltage alarm
> +in3_max_alarm		Overvoltage alarm
> +in3_enable		Enable/Disable monitoring.
> +in3_label		Channel label (VADI2)
> +
> +in4_input		Output voltage (mV).
> +in4_min			Undervoltage threshold
> +in4_max			Overvoltage threshold
> +in4_lowest		Lowest measured voltage
> +in4_highest		Highest measured voltage
> +in4_reset_history	Write 1 to reset history.
> +in4_min_alarm		Undervoltage alarm
> +in4_max_alarm		Overvoltage alarm
> +in4_enable		Enable/Disable monitoring.
> +in4_label		Channel label (VADI3)
> +
> +in5_input		Output voltage (mV).
> +in5_min			Undervoltage threshold
> +in5_max			Overvoltage threshold
> +in5_lowest		Lowest measured voltage
> +in5_highest		Highest measured voltage
> +in5_reset_history	Write 1 to reset history.
> +in5_min_alarm		Undervoltage alarm
> +in5_max_alarm		Overvoltage alarm
> +in5_enable		Enable/Disable monitoring.
> +in5_label		Channel label (VADI4)
> +
> +in6_input		Output voltage (mV).
> +in6_min			Undervoltage threshold
> +in6_max			Overvoltage threshold
> +in6_lowest		Lowest measured voltage
> +in6_highest		Highest measured voltage
> +in6_reset_history	Write 1 to reset history.
> +in6_min_alarm		Undervoltage alarm
> +in6_max_alarm		Overvoltage alarm
> +in6_enable		Enable/Disable monitoring.
> +in6_label		Channel label (VADIO1)
> +
> +in7_input		Output voltage (mV).
> +in7_min			Undervoltage threshold
> +in7_max			Overvoltage threshold
> +in7_lowest		Lowest measured voltage
> +in7_highest		Highest measured voltage
> +in7_reset_history	Write 1 to reset history.
> +in7_min_alarm		Undervoltage alarm
> +in7_max_alarm		Overvoltage alarm
> +in7_enable		Enable/Disable monitoring.
> +in7_label		Channel label (VADIO2)
> +
> +in8_input		Output voltage (mV).
> +in8_min			Undervoltage threshold
> +in8_max			Overvoltage threshold
> +in8_lowest		Lowest measured voltage
> +in8_highest		Highest measured voltage
> +in8_reset_history	Write 1 to reset history.
> +in8_min_alarm		Undervoltage alarm
> +in8_max_alarm		Overvoltage alarm
> +in8_enable		Enable/Disable monitoring.
> +in8_label		Channel label (VADIO3)
> +
> +in9_input		Output voltage (mV).
> +in9_min			Undervoltage threshold
> +in9_max			Overvoltage threshold
> +in9_lowest		Lowest measured voltage
> +in9_highest		Highest measured voltage
> +in9_reset_history	Write 1 to reset history.
> +in9_min_alarm		Undervoltage alarm
> +in9_max_alarm		Overvoltage alarm
> +in9_enable		Enable/Disable monitoring.
> +in9_label		Channel label (VADIO4)
> +
> +in10_input		Output voltage (mV).
> +in10_min		Undervoltage threshold
> +in10_max		Overvoltage threshold
> +in10_lowest		Lowest measured voltage
> +in10_highest		Highest measured voltage
> +in10_reset_history	Write 1 to reset history.
> +in10_min_alarm		Undervoltage alarm
> +in10_max_alarm		Overvoltage alarm
> +in10_enable		Enable/Disable monitoring.
> +in10_label		Channel label (DRNS)
> +
> +in11_input		Output voltage (mV).
> +in11_min		Undervoltage threshold
> +in11_max		Overvoltage threshold
> +in11_lowest		Lowest measured voltage
> +in11_highest		Highest measured voltage
> +in11_reset_history	Write 1 to reset history.
> +			Also clears fet bad and short fault logs.
> +in11_min_alarm		Undervoltage alarm
> +in11_max_alarm		Overvoltage alarm
> +in11_enable		Enable/Disable monitoring
> +in11_fault		Failure in the MOSFET. Either bad or shorted FET.
> +in11_label		Channel label (DRAIN)
> +
> +in12_input		Output voltage (mV).
> +in12_min		Undervoltage threshold
> +in12_max		Overvoltage threshold
> +in12_lowest		Lowest measured voltage
> +in12_highest		Highest measured voltage
> +in12_reset_history	Write 1 to reset history.
> +in12_min_alarm		Undervoltage alarm
> +in12_max_alarm		Overvoltage alarm
> +in12_enable		Enable/Disable monitoring.
> +in12_label		Channel label (ADIN2-ADIN1)
> +
> +in13_input		Output voltage (mV).
> +in13_min		Undervoltage threshold
> +in13_max		Overvoltage threshold
> +in13_lowest		Lowest measured voltage
> +in13_highest		Highest measured voltage
> +in13_reset_history	Write 1 to reset history.
> +in13_min_alarm		Undervoltage alarm
> +in13_max_alarm		Overvoltage alarm
> +in13_enable		Enable/Disable monitoring.
> +in13_label		Channel label (ADIN4-ADIN3)
> +
> +in14_input		Output voltage (mV).
> +in14_min		Undervoltage threshold
> +in14_max		Overvoltage threshold
> +in14_lowest		Lowest measured voltage
> +in14_highest		Highest measured voltage
> +in14_reset_history	Write 1 to reset history.
> +in14_min_alarm		Undervoltage alarm
> +in14_max_alarm		Overvoltage alarm
> +in14_enable		Enable/Disable monitoring.
> +in14_label		Channel label (ADIO2-ADIO1)
> +
> +in15_input		Output voltage (mV).
> +in15_min		Undervoltage threshold
> +in15_max		Overvoltage threshold
> +in15_lowest		Lowest measured voltage
> +in15_highest		Highest measured voltage
> +in15_reset_history	Write 1 to reset history.
> +in15_min_alarm		Undervoltage alarm
> +in15_max_alarm		Overvoltage alarm
> +in15_enable		Enable/Disable monitoring.
> +in15_label		Channel label (ADIO4-ADIO3)
> +
> +curr1_input		Sense current (mA)
> +curr1_min		Undercurrent threshold
> +curr1_max		Overcurrent threshold
> +curr1_lowest		Lowest measured current
> +curr1_highest		Highest measured current
> +curr1_reset_history	Write 1 to reset curr1 history.
> +			Also clears overcurrent fault logs.
> +curr1_min_alarm		Undercurrent alarm
> +curr1_max_alarm		Overcurrent alarm
> +curr1_crit_alarm        Critical Overcurrent alarm
> +curr1_label		Channel label (ISENSE)
> +
> +power1_input		Power (in uW)
> +power1_min		Low power threshold
> +power1_max		High power threshold
> +power1_input_lowest	Historical minimum power use
> +power1_input_highest	Historical maximum power use
> +power1_reset_history	Write 1 to reset power1 history.
> +			Also clears power fault logs.
> +power1_min_alarm	Low power alarm
> +power1_max_alarm	High power alarm
> +power1_label		Channel label (Power)
> +
> +energy1_input		Measured energy over time (in microJoule)
> +energy1_enable		Enable/Disable Energy accumulation
> +
> +DebugFs entries
> +_______________
> +
> +The chip also has a fault log register where failures can be logged. Hence,
> +as these are logging events, we give access to them in debugfs. Note that
> +even if some failure is detected in these logs, it does necessarily mean
> +that the failure is still present. As mentioned in the proper Sysfs entries,
> +these logs can be cleared by writing in the proper reset_history attribute.
> +
> +.. warning:: The debugfs interface is subject to change without notice
> +             and is only available when the kernel is compiled with
> +             ``CONFIG_DEBUG_FS`` defined.
> +
> +``/sys/kernel/debug/i2c/i2c-[X]/[X]-addr/``
> +contains the following attributes:
> +
> +=======================		==========================================
> +power1_failed_fault_log		Set to 1 by a power1 fault occurring.
> +power1_good_input_fault_log	Set to 1 by a power1 good input fault occurring at PGIO3.
> +in11_fet_short_fault_log	Set to 1 when a FET-short fault occurs.
> +in11_fet_bad_fault_log		Set to 1 when a FET-BAD fault occurs.
> +in0_lcrit_fault_log		Set to 1 by a VIN undervoltage fault occurring.
> +in0_crit_fault_log		Set to 1 by a VIN overvoltage fault occurring.
> +curr1_crit_fault_log		Set to 1 by an overcurrent fault occurring.

We do have crit and lcrit alarms as standard attributes. Your call,
but I would suggest to use them.

> +======================= 	==========================================
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 23a337246b99060161c620388c73829d9b98729d..10f7869bc8d91a093d841b9e4229566b08f0eec0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14505,6 +14505,7 @@ M:	Nuno Sá <nuno.sa@analog.com>
>   L:	linux-hwmon@vger.kernel.org
>   S:	Supported
>   F:	Documentation/devicetree/bindings/hwmon/adi,ltc4283.yaml
> +F:	drivers/hwmon/ltc4283.c
>   
>   LTC4286 HARDWARE MONITOR DRIVER
>   M:	Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 9d28fcf7cd2a6f9e2f54694a717bd85ff4047b46..948b2555dd3331fbb258e39b20913fad1f09da3b 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1157,6 +1157,18 @@ config SENSORS_LTC4282
>   	  This driver can also be built as a module. If so, the module will
>   	  be called ltc4282.
>   
> +config SENSORS_LTC4283
> +	tristate "Analog Devices LTC4283"
> +	depends on I2C
> +	select REGMAP_I2C
> +	select AUXILIARY_BUS
> +	help
> +	  If you say yes here you get support for Analog Devices LTC4283
> +	  Negative Voltage Hot Swap Controller I2C interface.
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called ltc4283.
> +
>   config SENSORS_LTQ_CPUTEMP
>   	bool "Lantiq cpu temperature sensor driver"
>   	depends on SOC_XWAY
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index cd8bc4752b4dbf015c6eb46157626f4e8f87dfae..ab93ea83d7a7d05eac3ba40851fda31eb1e1735f 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -146,6 +146,7 @@ obj-$(CONFIG_SENSORS_LTC4245)	+= ltc4245.o
>   obj-$(CONFIG_SENSORS_LTC4260)	+= ltc4260.o
>   obj-$(CONFIG_SENSORS_LTC4261)	+= ltc4261.o
>   obj-$(CONFIG_SENSORS_LTC4282)	+= ltc4282.o
> +obj-$(CONFIG_SENSORS_LTC4283)	+= ltc4283.o
>   obj-$(CONFIG_SENSORS_LTQ_CPUTEMP) += ltq-cputemp.o
>   obj-$(CONFIG_SENSORS_MAX1111)	+= max1111.o
>   obj-$(CONFIG_SENSORS_MAX127)	+= max127.o
> diff --git a/drivers/hwmon/ltc4283.c b/drivers/hwmon/ltc4283.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..0b41291836fcecf612ee9a1d165ba8ef7a8425d6
> --- /dev/null
> +++ b/drivers/hwmon/ltc4283.c
> @@ -0,0 +1,1748 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Analog Devices LTC4283 I2C Negative Voltage Hot Swap Controller (HWMON)
> + *
> + * Copyright 2025 Analog Devices Inc.
> + */
> +#include <linux/auxiliary_bus.h>
> +#include <linux/bitfield.h>
> +#include <linux/bitmap.h>
> +#include <linux/bitops.h>
> +#include <linux/bits.h>
> +#include <linux/cleanup.h>
> +#include <linux/debugfs.h>
> +#include <linux/device.h>
> +#include <linux/device/devres.h>
> +#include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>
> +#include <linux/i2c.h>
> +#include <linux/math.h>
> +#include <linux/math64.h>
> +#include <linux/minmax.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/overflow.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +#include <linux/units.h>
> +
> +#define LTC4283_SYSTEM_STATUS		0x00
> +#define LTC4283_FAULT_STATUS		0x03
> +#define   LTC4283_OV_MASK		BIT(0)
> +#define   LTC4283_UV_MASK		BIT(1)
> +#define   LTC4283_OC_MASK		BIT(2)
> +#define   LTC4283_FET_BAD_MASK		BIT(3)
> +#define   LTC4283_FET_SHORT_MASK	BIT(6)
> +#define LTC4283_FAULT_LOG		0x04
> +#define   LTC4283_OV_FAULT_MASK		BIT(0)
> +#define   LTC4283_UV_FAULT_MASK		BIT(1)
> +#define   LTC4283_OC_FAULT_MASK		BIT(2)
> +#define   LTC4283_FET_BAD_FAULT_MASK	BIT(3)
> +#define   LTC4283_PGI_FAULT_MASK	BIT(4)
> +#define   LTC4283_PWR_FAIL_FAULT_MASK	BIT(5)
> +#define   LTC4283_FET_SHORT_FAULT_MASK	BIT(6)
> +#define LTC4283_ADC_ALM_LOG_1		0x05
> +#define   LTC4283_POWER_LOW_ALM		BIT(0)
> +#define   LTC4283_POWER_HIGH_ALM	BIT(1)
> +#define   LTC4283_SENSE_LOW_ALM		BIT(4)
> +#define   LTC4283_SENSE_HIGH_ALM	BIT(5)
> +#define LTC4283_ADC_ALM_LOG_2		0x06
> +#define LTC4283_ADC_ALM_LOG_3		0x07
> +#define LTC4283_ADC_ALM_LOG_4		0x08
> +#define LTC4283_ADC_ALM_LOG_5		0x09
> +#define LTC4283_CONTROL_1		0x0a
> +#define   LTC4283_PIGIO2_ACLB_MASK	BIT(2)
> +#define   LTC4283_PWRGD_RST_CTRL_MASK	BIT(3)
> +#define   LTC4283_FET_BAD_OFF_MASK	BIT(4)
> +#define   LTC4283_THERM_TMR_MASK	BIT(5)
> +#define   LTC4283_DVDT_MASK		BIT(6)
> +#define LTC4283_CONTROL_2		0x0b
> +#define   LTC4283_OV_RETRY_MASK		BIT(0)
> +#define   LTC4283_UV_RETRY_MASK		BIT(1)
> +#define   LTC4283_OC_RETRY_MASK		GENMASK(3, 2)
> +#define   LTC4283_FET_BAD_RETRY_MASK	GENMASK(5, 4)
> +#define   LTC4283_EXT_FAULT_RETRY_MASK	BIT(7)
> +#define LTC4283_RESERVED_OC		0x0c
> +#define LTC4283_CONFIG_1		0x0d
> +#define   LTC4283_FB_MASK		GENMASK(3, 2)
> +#define   LTC4283_ILIM_MASK		GENMASK(7, 4)
> +#define LTC4283_CONFIG_2		0x0e
> +#define   LTC4283_COOLING_DL_MASK	GENMASK(3, 1)
> +#define   LTC4283_FTBD_DL_MASK		GENMASK(5, 4)
> +#define LTC4283_CONFIG_3		0x0f
> +#define   LTC4283_VPWR_DRNS_MASK	BIT(6)
> +#define   LTC4283_EXTFLT_TURN_OFF_MASK	BIT(7)
> +#define LTC4283_PGIO_CONFIG		0x10
> +#define   LTC4283_PGIO1_CFG_MASK	GENMASK(1, 0)
> +#define   LTC4283_PGIO2_CFG_MASK	GENMASK(3, 2)
> +#define   LTC4283_PGIO3_CFG_MASK	GENMASK(5, 4)
> +#define   LTC4283_PGIO4_CFG_MASK	GENMASK(7, 6)
> +#define LTC4283_PGIO_CONFIG_2		0x11
> +#define   LTC4283_ADC_MASK		GENMASK(2, 0)
> +#define LTC4283_ADC_SELECT(c)		(0x13 + (c) / 8)
> +#define   LTC4283_ADC_SELECT_MASK(c)	BIT((c) % 8)
> +#define LTC4283_SENSE_MIN_TH		0x1b
> +#define LTC4283_SENSE_MAX_TH		0x1c
> +#define LTC4283_VPWR_MIN_TH		0x1d
> +#define LTC4283_VPWR_MAX_TH		0x1e
> +#define LTC4283_POWER_MIN_TH		0x1f
> +#define LTC4283_POWER_MAX_TH		0x20
> +#define LTC4283_ADC_2_MIN_TH(c)		(0x21 + (c) * 2)
> +#define LTC4283_ADC_2_MAX_TH(c)		(0x22 + (c) * 2)
> +#define LTC4283_ADC_2_MIN_TH_DIFF(c)	(0x39 + (c) * 2)
> +#define LTC4283_ADC_2_MAX_TH_DIFF(c)	(0x3a + (c) * 2)
> +#define LTC4283_SENSE			0x41
> +#define LTC4283_SENSE_MIN		0x42
> +#define LTC4283_SENSE_MAX		0x43
> +#define LTC4283_VPWR			0x44
> +#define LTC4283_VPWR_MIN		0x45
> +#define LTC4283_VPWR_MAX		0x46
> +#define LTC4283_POWER			0x47
> +#define LTC4283_POWER_MIN		0x48
> +#define LTC4283_POWER_MAX		0x49
> +/* get channels from ADC 2 */
> +#define LTC4283_ADC_2(c)		(0x4a + (c) * 3)
> +#define LTC4283_ADC_2_MIN(c)		(0x4b + (c) * 3)
> +#define LTC4283_ADC_2_MAX(c)		(0x4c + (c) * 3)
> +#define LTC4283_ADC_2_DIFF(c)		(0x6e + (c) * 3)
> +#define LTC4283_ADC_2_MIN_DIFF(c)	(0x6f + (c) * 3)
> +#define LTC4283_ADC_2_MAX_DIFF(c)	(0x70 + (c) * 3)
> +#define LTC4283_ENERGY			0x7a
> +#define LTC4283_METER_CONTROL		0x84
> +#define   LTC4283_INTEGRATE_I_MASK	BIT(0)
> +#define   LTC4283_METER_HALT_MASK	BIT(6)
> +#define LTC4283_RESERVED_86		0x86
> +#define LTC4283_RESERVED_8F		0x8F
> +#define LTC4283_FAULT_LOG_CTRL		0x90
> +#define   LTC4283_FAULT_LOG_EN_MASK	BIT(7)
> +#define LTC4283_RESERVED_91		0x91
> +#define LTC4283_RESERVED_A1		0xA1
> +#define LTC4283_RESERVED_A3		0xA3
> +#define LTC4283_RESERVED_AC		0xAC
> +#define LTC4283_POWER_PLAY_MSB		0xE7
> +#define LTC4283_POWER_PLAY_LSB		0xE8
> +#define LTC4283_RESERVED_F1		0xF1
> +#define LTC4283_RESERVED_FF		0xFF
> +
> +/* also applies for differential channels */
> +#define LTC4283_ADC1_FS_uV		32768
> +#define LTC4283_ADC2_FS_mV		2048
> +#define LTC4283_TCONV_uS		64103
> +#define LTC4283_VILIM_MIN_uV		15000
> +#define LTC4283_VILIM_MAX_uV		30000
> +#define LTC4283_VILIM_RANGE	\
> +	(LTC4283_VILIM_MAX_uV - LTC4283_VILIM_MIN_uV + 1)
> +
> +#define LTC4283_PGIO_FUNC_GPIO		2
> +#define LTC4283_PGIO2_FUNC_ACLB		3
> +
> +/* voltage channels */
> +enum {
> +	LTC4283_CHAN_VIN,
> +	LTC4283_CHAN_VPWR,
> +	LTC4283_CHAN_ADI_1,
> +	LTC4283_CHAN_ADI_2,
> +	LTC4283_CHAN_ADI_3,
> +	LTC4283_CHAN_ADI_4,
> +	LTC4283_CHAN_ADIO_1,
> +	LTC4283_CHAN_ADIO_2,
> +	LTC4283_CHAN_ADIO_3,
> +	LTC4283_CHAN_ADIO_4,
> +	LTC4283_CHAN_DRNS,
> +	LTC4283_CHAN_DRAIN,
> +	/* differential channels */
> +	LTC4283_CHAN_ADIN12,
> +	LTC4283_CHAN_ADIN34,
> +	LTC4283_CHAN_ADIO12,
> +	LTC4283_CHAN_ADIO34,
> +	LTC4283_CHAN_MAX
> +};
> +
> +struct ltc4283_hwmon {
> +	struct regmap *map;
> +
> +	unsigned long gpio_mask;
> +	/* lock to protect concurrent device accesses and shared data */
> +	struct mutex lock;
> +	unsigned long ch_enable_mask;
> +	/* in microwatt */
> +	long power_max;
> +	/* in millivolt */
> +	u32 vsense_max;
> +	/* in tenths of microohm*/
> +	u32 rsense;
> +	bool energy_en;
> +	bool ext_fault;
> +};
> +
> +static int ltc4283_read_voltage_word(const struct ltc4283_hwmon *st,
> +				     u32 reg, u32 fs, long *val)

It might be valuable to explain what "fs" stands for. More on that below.

> +{
> +	__be16 in;
> +	int ret;
> +
> +	ret = regmap_bulk_read(st->map, reg, &in, sizeof(in));
> +	if (ret)
> +		return ret;
> +
> +	*val = DIV_ROUND_CLOSEST(be16_to_cpu(in) * fs, BIT(16));

For example, if fs is the ADC resolution (LSB), and the return value
from this function is supposed to be normalized to uV, I would expect
the function to return 2,048 if fs=2,048 and the register reads 1.
But that value is divided by 65,536. Which I really don't understand.

Ultimately, each call to ltc4283_read_voltage_word() drops
a number of bits from the ADC value. It either drops 5 bit (ls=2,048)
or 1 bit (ls=32,768). That just seems odd.

What am I missing ?

> +	return 0;
> +}
> +
> +static int ltc4283_read_voltage_byte(const struct ltc4283_hwmon *st,
> +				     u32 reg, u32 fs, long *val)
> +{
> +	int ret;
> +	u32 in;
> +
> +	ret = regmap_read(st->map, reg, &in);
> +	if (ret)
> +		return ret;
> +
> +	*val = DIV_ROUND_CLOSEST(in * fs, BIT(8));
> +	return 0;
> +}
> +
> +static u32 ltc4283_in_reg(u32 attr, u32 channel)
> +{
> +	switch (attr) {
> +	case hwmon_in_input:
> +		if (channel == LTC4283_CHAN_VPWR)
> +			return LTC4283_VPWR;
> +		if (channel >= LTC4283_CHAN_ADI_1 && channel <= LTC4283_CHAN_DRAIN)
> +			return LTC4283_ADC_2(channel - LTC4283_CHAN_ADI_1);
> +		return LTC4283_ADC_2_DIFF(channel - LTC4283_CHAN_ADIN12);
> +	case hwmon_in_highest:
> +		if (channel == LTC4283_CHAN_VPWR)
> +			return LTC4283_VPWR_MAX;
> +		if (channel >= LTC4283_CHAN_ADI_1 && channel <= LTC4283_CHAN_DRAIN)
> +			return LTC4283_ADC_2_MAX(channel - LTC4283_CHAN_ADI_1);
> +		return LTC4283_ADC_2_MAX_DIFF(channel - LTC4283_CHAN_ADIN12);
> +	case hwmon_in_lowest:
> +		if (channel == LTC4283_CHAN_VPWR)
> +			return LTC4283_VPWR_MIN;
> +		if (channel >= LTC4283_CHAN_ADI_1 && channel <= LTC4283_CHAN_DRAIN)
> +			return LTC4283_ADC_2_MIN(channel - LTC4283_CHAN_ADI_1);
> +		return LTC4283_ADC_2_MIN_DIFF(channel - LTC4283_CHAN_ADIN12);
> +	case hwmon_in_max:
> +		if (channel == LTC4283_CHAN_VPWR)
> +			return LTC4283_VPWR_MAX_TH;
> +		if (channel >= LTC4283_CHAN_ADI_1 && channel <= LTC4283_CHAN_DRAIN)
> +			return LTC4283_ADC_2_MAX_TH(channel - LTC4283_CHAN_ADI_1);
> +		return LTC4283_ADC_2_MAX_TH_DIFF(channel - LTC4283_CHAN_ADIN12);
> +	default:
> +		if (channel == LTC4283_CHAN_VPWR)
> +			return LTC4283_VPWR_MIN_TH;
> +		if (channel >= LTC4283_CHAN_ADI_1 && channel <= LTC4283_CHAN_DRAIN)
> +			return LTC4283_ADC_2_MIN_TH(channel - LTC4283_CHAN_ADI_1);
> +		return LTC4283_ADC_2_MIN_TH_DIFF(channel - LTC4283_CHAN_ADIN12);
> +	}
> +}
> +
> +static int ltc4283_read_in_vals(const struct ltc4283_hwmon *st,
> +				u32 attr, u32 channel, long *val)
> +{
> +	u32 reg = ltc4283_in_reg(attr, channel);
> +	int ret;
> +
> +	if (channel < LTC4283_CHAN_ADIN12) {
> +		if (attr != hwmon_in_max && attr != hwmon_in_min)
> +			return ltc4283_read_voltage_word(st, reg,
> +							 LTC4283_ADC2_FS_mV,
> +							 val);
> +
> +		return ltc4283_read_voltage_byte(st, reg,
> +						 LTC4283_ADC2_FS_mV, val);
> +	}
> +
> +	if (attr != hwmon_in_max && attr != hwmon_in_min)
> +		ret = ltc4283_read_voltage_word(st, reg,
> +						LTC4283_ADC1_FS_uV, val);
> +	else
> +		ret = ltc4283_read_voltage_byte(st, reg,
> +						LTC4283_ADC1_FS_uV, val);
> +	if (ret)
> +		return ret;
> +
> +	*val = DIV_ROUND_CLOSEST(*val, MILLI);

So the value returned from ltc4283_read_voltage_word() is in micro-Volt ?
I guess I must be missing something, because the datasheet seems to suggest
that the minimum ADC resolution is 1uV, but ltc4283_read_voltage_word()
does a divide/multiply operation, and the divisor is always larger than
the multiplier (LTC4283_ADC1_FS_uV=32768 which is divided by 65,536).
That means the maximum returned value from
	ret = ltc4283_read_voltage_word(st, reg,
					LTC4283_ADC1_FS_uV, val);
is 65,535 * 32768 / 65,536 = 32767 and that is divided again here by 1,000.
So the maximum reported value (in mV) would be 33mV. Is that as intended ?

> +	return 0;
> +}
> +
> +static int ltc4283_read_alarm(struct ltc4283_hwmon *st, u32 reg,
> +			      u32 mask, long *val)
> +{
> +	u32 alarm;
> +	int ret;
> +
> +	guard(mutex)(&st->lock);
> +	ret = regmap_read(st->map, reg, &alarm);
> +	if (ret)
> +		return ret;
> +
> +	*val = !!(alarm & mask);
> +
> +	/* If not status/fault logs, clear the alarm after reading it. */
> +	if (reg != LTC4283_FAULT_STATUS && reg != LTC4283_FAULT_LOG)
> +		return regmap_clear_bits(st->map, reg, mask);
> +
> +	return 0;
> +}
> +
> +static int ltc4283_read_in_alarm(struct ltc4283_hwmon *st, u32 channel,
> +				 bool max_alm, long *val)
> +{
> +	if (channel == LTC4283_VPWR)
> +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_1,
> +					  BIT(2 + max_alm), val);
> +
> +	if (channel >= LTC4283_CHAN_ADI_1 && channel <= LTC4283_CHAN_ADI_4) {
> +		u32 bit = (channel - LTC4283_CHAN_ADI_1) * 2;
> +		/*
> +		 * Lower channels go to higher bits. We also want to go +1 down
> +		 * in the min_alarm case.
> +		 */
> +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_2,
> +					  BIT(7 - bit - !max_alm), val);
> +	}
> +
> +	if (channel >= LTC4283_CHAN_ADIO_1 && channel <= LTC4283_CHAN_ADIO_4) {
> +		u32 bit = (channel - LTC4283_CHAN_ADIO_1) * 2;
> +
> +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_3,
> +					  BIT(7 - bit - !max_alm), val);
> +	}
> +
> +	if (channel >= LTC4283_CHAN_ADIN12 && channel <= LTC4283_CHAN_ADIN34) {
> +		u32 bit = (channel - LTC4283_CHAN_ADIN12) * 2;
> +
> +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_5,
> +					  BIT(7 - bit - !max_alm), val);
> +	}
> +
> +	if (channel == LTC4283_CHAN_DRNS)
> +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_4,
> +					  BIT(6 + max_alm), val);
> +
> +	return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_4, BIT(4 + max_alm),
> +				  val);
> +}
> +
> +static int ltc4283_read_in(struct ltc4283_hwmon *st, u32 attr, u32 channel,
> +			   long *val)
> +{
> +	int ret = 0;
> +
> +	switch (attr) {
> +	case hwmon_in_input:
> +		scoped_guard(mutex, &st->lock) {
> +			if (!test_bit(channel, &st->ch_enable_mask))
> +				return -ENODATA;
> +
> +			ret = ltc4283_read_in_vals(st, attr, channel, val);
> +		}
> +		return ret;
> +	case hwmon_in_highest:
> +	case hwmon_in_lowest:
> +	case hwmon_in_max:
> +	case hwmon_in_min:
> +		return ltc4283_read_in_vals(st, attr, channel, val);
> +	case hwmon_in_max_alarm:
> +		return ltc4283_read_in_alarm(st, channel, true, val);
> +	case hwmon_in_min_alarm:
> +		return ltc4283_read_in_alarm(st, channel, false, val);
> +	case hwmon_in_crit_alarm:
> +		return ltc4283_read_alarm(st, LTC4283_FAULT_STATUS,
> +					  LTC4283_OV_MASK, val);
> +	case hwmon_in_lcrit_alarm:
> +		return ltc4283_read_alarm(st, LTC4283_FAULT_STATUS,
> +					  LTC4283_UV_MASK, val);
> +	case hwmon_in_fault:
> +		/*
> +		 * We report failure if we detect either a fer_bad or a
> +		 * fet_short in the status register.
> +		 */
> +		return ltc4283_read_alarm(st, LTC4283_FAULT_STATUS,
> +					  LTC4283_FET_BAD_MASK | LTC4283_FET_SHORT_MASK, val);
> +	case hwmon_in_enable:
> +		scoped_guard(mutex, &st->lock) {
> +			*val = test_bit(channel, &st->ch_enable_mask);
> +		}

I don't think that guard adds any value. The returned value is 0 or 1 either
way, and it may change almost at the same time from another thread. The caller
still won't know its _current_ value when it gets the data.

> +
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +	return 0;
> +}
> +
> +static int ltc4283_read_current_word(const struct ltc4283_hwmon *st, u32 reg,
> +				     long *val)
> +{
> +	u64 temp = (u64)LTC4283_ADC1_FS_uV * DECA * MILLI;
> +	__be16 curr;
> +	int ret;
> +
> +	ret = regmap_bulk_read(st->map, reg, &curr, sizeof(curr));
> +	if (ret)
> +		return ret;
> +
> +	*val = DIV64_U64_ROUND_CLOSEST(be16_to_cpu(curr) * temp,
> +				       BIT_ULL(16) * st->rsense);
> +
> +	return 0;
> +}
> +
> +static int ltc4283_read_current_byte(const struct ltc4283_hwmon *st, u32 reg,
> +				     long *val)
> +{
> +	u64 temp = (u64)LTC4283_ADC1_FS_uV * DECA * MILLI;
> +	u32 curr;
> +	int ret;
> +
> +	ret = regmap_read(st->map, reg, &curr);
> +	if (ret)
> +		return ret;
> +
> +	*val = DIV_ROUND_CLOSEST_ULL(curr * temp, BIT(8) * st->rsense);
> +	return 0;
> +}
> +
> +static int ltc4283_read_curr(struct ltc4283_hwmon *st, u32 attr, long *val)
> +{
> +	switch (attr) {
> +	case hwmon_curr_input:
> +		return ltc4283_read_current_word(st, LTC4283_SENSE, val);
> +	case hwmon_curr_highest:
> +		return ltc4283_read_current_word(st, LTC4283_SENSE_MAX, val);
> +	case hwmon_curr_lowest:
> +		return ltc4283_read_current_word(st, LTC4283_SENSE_MIN, val);
> +	case hwmon_curr_max:
> +		return ltc4283_read_current_byte(st, LTC4283_SENSE_MAX_TH, val);
> +	case hwmon_curr_min:
> +		return ltc4283_read_current_byte(st, LTC4283_SENSE_MIN_TH, val);
> +	case hwmon_curr_max_alarm:
> +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_1,
> +					  LTC4283_SENSE_HIGH_ALM, val);
> +	case hwmon_curr_min_alarm:
> +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_1,
> +					  LTC4283_SENSE_LOW_ALM, val);
> +	case hwmon_curr_crit_alarm:
> +		return ltc4283_read_alarm(st, LTC4283_FAULT_STATUS,
> +					  LTC4283_OC_MASK, val);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int ltc4283_read_power_word(const struct ltc4283_hwmon *st,
> +				   u32 reg, long *val)
> +{
> +	u64 temp = (u64)LTC4283_ADC1_FS_uV * LTC4283_ADC2_FS_mV * DECA * MILLI;
> +	__be16 raw;
> +	int ret;
> +
> +	ret = regmap_bulk_read(st->map, reg, &raw, sizeof(raw));
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Power is given by:
> +	 *     P = CODE(16b) * 32.768mV * 2.048V / (2^16 * Rsense)
> +	 */
> +	*val = DIV64_U64_ROUND_CLOSEST(temp * be16_to_cpu(raw),
> +				       BIT_ULL(16) * st->rsense);
> +
> +	return 0;
> +}
> +
> +static int ltc4283_read_power_byte(const struct ltc4283_hwmon *st,
> +				   u32 reg, long *val)
> +{
> +	u64 temp = (u64)LTC4283_ADC1_FS_uV * LTC4283_ADC2_FS_mV * DECA * MILLI;
> +	u32 power;
> +	int ret;
> +
> +	ret = regmap_read(st->map, reg, &power);
> +	if (ret)
> +		return ret;
> +
> +	*val = DIV_ROUND_CLOSEST_ULL(power * temp, BIT(8) * st->rsense);
> +
> +	return 0;
> +}
> +
> +static int ltc4283_read_power(struct ltc4283_hwmon *st, u32 attr, long *val)
> +{
> +	switch (attr) {
> +	case hwmon_power_input:
> +		return ltc4283_read_power_word(st, LTC4283_POWER, val);
> +	case hwmon_power_input_highest:
> +		return ltc4283_read_power_word(st, LTC4283_POWER_MAX, val);
> +	case hwmon_power_input_lowest:
> +		return ltc4283_read_power_word(st, LTC4283_POWER_MIN, val);
> +	case hwmon_power_max_alarm:
> +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_1,
> +					  LTC4283_POWER_HIGH_ALM, val);
> +	case hwmon_power_min_alarm:
> +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_1,
> +					  LTC4283_POWER_LOW_ALM, val);
> +	case hwmon_power_max:
> +		return ltc4283_read_power_byte(st, LTC4283_POWER_MAX_TH, val);
> +	case hwmon_power_min:
> +		return ltc4283_read_power_byte(st, LTC4283_POWER_MIN_TH, val);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int ltc4283_read(struct device *dev, enum hwmon_sensor_types type,
> +			u32 attr, int channel, long *val)
> +{
> +	struct ltc4283_hwmon *st = dev_get_drvdata(dev);
> +
> +	switch (type) {
> +	case hwmon_in:
> +		return ltc4283_read_in(st, attr, channel, val);
> +	case hwmon_curr:
> +		return ltc4283_read_curr(st, attr, val);
> +	case hwmon_power:
> +		return ltc4283_read_power(st, attr, val);
> +	case hwmon_energy:
> +		scoped_guard(mutex, &st->lock) {
> +			*val = st->energy_en;
> +		}
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int ltc4282_write_power_byte(const struct ltc4283_hwmon *st, u32 reg,
> +				    long val)
> +{
> +	u64 temp = (u64)LTC4283_ADC1_FS_uV * LTC4283_ADC2_FS_mV * DECA * MILLI;
> +	u32 __raw;
> +
> +	if (val > st->power_max)
> +		val = st->power_max;
> +
> +	__raw = DIV64_U64_ROUND_CLOSEST(val * BIT_ULL(8) * st->rsense, temp);
> +
> +	return regmap_write(st->map, reg, __raw);
> +}
> +
> +static int ltc4283_write_power_word(const struct ltc4283_hwmon *st,
> +				    u32 reg, long val)
> +{
> +	u64 temp = st->rsense * BIT_ULL(16), temp_2;
> +	__be16 __raw;
> +	u16 code;
> +
> +	if (check_mul_overflow(val, temp, &temp_2)) {
> +		temp = DIV_ROUND_CLOSEST_ULL(temp, DECA * MILLI);
> +		code = DIV_ROUND_CLOSEST_ULL(temp * val, LTC4283_ADC1_FS_uV * LTC4283_ADC2_FS_mV);
> +	} else {
> +		temp = (u64)LTC4283_ADC1_FS_uV * LTC4283_ADC2_FS_mV * DECA * MILLI;
> +		code = DIV64_U64_ROUND_CLOSEST(temp_2, temp);
> +	}
> +
> +	__raw = cpu_to_be16(code);
> +	return regmap_bulk_write(st->map, reg, &__raw, sizeof(__raw));
> +}
> +
> +static int ltc4283_reset_power_hist(struct ltc4283_hwmon *st)
> +{
> +	int ret;
> +
> +	guard(mutex)(&st->lock);
> +
> +	ret = ltc4283_write_power_word(st, LTC4283_POWER_MIN, st->power_max);
> +	if (ret)
> +		return ret;
> +
> +	ret = ltc4283_write_power_word(st, LTC4283_POWER_MAX, 0);
> +	if (ret)
> +		return ret;
> +
> +	/* Clear possible power faults. */
> +	return regmap_clear_bits(st->map, LTC4283_FAULT_LOG,
> +				 LTC4283_PWR_FAIL_FAULT_MASK | LTC4283_PGI_FAULT_MASK);
> +}
> +
> +static int ltc4283_write_power(struct ltc4283_hwmon *st, u32 attr, long val)
> +{
> +	switch (attr) {
> +	case hwmon_power_max:
> +		return ltc4282_write_power_byte(st, LTC4283_POWER_MAX_TH, val);
> +	case hwmon_power_min:
> +		return ltc4282_write_power_byte(st, LTC4283_POWER_MIN_TH, val);
> +	case hwmon_power_reset_history:
> +		return ltc4283_reset_power_hist(st);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int __ltc4283_write_in_history(struct ltc4283_hwmon *st,
> +				      u32 reg, long lowest, u32 fs)
> +{
> +	__be16 __raw;
> +	u16 tmp;
> +	int ret;
> +
> +	tmp = DIV_ROUND_CLOSEST(BIT(16) * lowest, fs);
> +	if (tmp == BIT(16))
> +		tmp = U16_MAX;

As pointed out by 0-day, the if statement is always false.

Anyway, this needs explanation. The idea behing history reset functions
is to reset the history to 0. This code sets the history to some value.
And it doesn't do what the documentation claims it would do (write 1
to reset history)

What is the purpose of doing this ?

> +
> +	__raw = cpu_to_be16(tmp);
> +
> +	ret = regmap_bulk_write(st->map, reg, &__raw, sizeof(__raw));
> +	if (ret)
> +		return ret;
> +
> +	tmp = 0;
> +	return regmap_bulk_write(st->map, reg + 1,  &tmp, sizeof(tmp));
> +}
> +
> +static int ltc4283_write_in_history(struct ltc4283_hwmon *st,
> +				    u32 reg, long lowest, u32 fs)
> +{
> +	guard(mutex)(&st->lock);
> +	return __ltc4283_write_in_history(st, reg, lowest, fs);
> +}
> +
> +static int ltc4283_write_in_byte(const struct ltc4283_hwmon *st,
> +				 u32 reg, u32 fs, long val)
> +{
> +	u32 __raw;
> +
> +	val = clamp_val(val, 0, fs);
> +	__raw = DIV_ROUND_CLOSEST(val * BIT(8), fs);
> +
> +	return regmap_write(st->map, reg, __raw);
> +}
> +
> +static int ltc4283_reset_in_hist(struct ltc4283_hwmon *st, u32 channel)
> +{
> +	u32 reg, fs;
> +	int ret;
> +
> +	if (channel == LTC4283_CHAN_VPWR)
> +		return ltc4283_write_in_history(st, LTC4283_VPWR_MIN,
> +						LTC4283_ADC2_FS_mV,
> +						LTC4283_ADC2_FS_mV);
> +
> +	if (channel >= LTC4283_CHAN_ADI_1 && channel <= LTC4283_CHAN_DRAIN) {
> +		fs = LTC4283_ADC2_FS_mV;
> +		reg = LTC4283_ADC_2_MIN(channel - LTC4283_CHAN_ADI_1);
> +	} else {
> +		fs = LTC4283_ADC1_FS_uV;
> +		reg = LTC4283_ADC_2_MIN_DIFF(channel - LTC4283_CHAN_ADIN12);
> +	}
> +
> +	guard(mutex)(&st->lock);
> +	ret = __ltc4283_write_in_history(st, reg, fs, fs);
> +	if (ret)
> +		return ret;
> +	if (channel != LTC4283_CHAN_DRAIN)
> +		return 0;
> +
> +	/* Then, let's also clear possible fet faults. */

Please document this.

> +	return regmap_clear_bits(st->map, LTC4283_FAULT_LOG,
> +				 LTC4283_FET_BAD_FAULT_MASK | LTC4283_FET_SHORT_FAULT_MASK);
> +}
> +
> +static int ltc4283_write_in_en(struct ltc4283_hwmon *st, u32 channel, bool en)
> +{
> +	unsigned int bit, adc_idx = channel - LTC4283_CHAN_ADI_1;
> +	unsigned int reg = LTC4283_ADC_SELECT(adc_idx);
> +	int ret;
> +
> +	bit = LTC4283_ADC_SELECT_MASK(adc_idx);
> +	if (channel > LTC4283_CHAN_DRAIN)
> +		/* Account for two reserved fields after DRAIN. */
> +		bit <<= 2;
> +
> +	guard(mutex)(&st->lock);
> +	if (en)
> +		ret = regmap_set_bits(st->map, reg, bit);
> +	else
> +		ret = regmap_clear_bits(st->map, reg, bit);
> +	if (ret)
> +		return ret;
> +
> +	__assign_bit(channel, &st->ch_enable_mask, en);
> +	return 0;
> +}
> +
> +static int ltc4283_write_minmax(struct ltc4283_hwmon *st, long val,
> +				u32 channel, bool is_max)
> +{
> +	u32 reg;
> +
> +	if (channel == LTC4283_CHAN_VPWR) {
> +		if (is_max)
> +			return ltc4283_write_in_byte(st, LTC4283_VPWR_MAX_TH,
> +						     LTC4283_ADC2_FS_mV, val);
> +
> +		return ltc4283_write_in_byte(st, LTC4283_VPWR_MIN_TH,
> +					     LTC4283_ADC2_FS_mV, val);
> +	}
> +
> +	if (channel >= LTC4283_CHAN_ADI_1 && channel <= LTC4283_CHAN_DRAIN) {
> +		if (is_max) {
> +			reg = LTC4283_ADC_2_MAX_TH(channel - LTC4283_CHAN_ADI_1);
> +			return ltc4283_write_in_byte(st, reg,
> +						     LTC4283_ADC2_FS_mV, val);
> +		}
> +
> +		reg = LTC4283_ADC_2_MIN_TH(channel - LTC4283_CHAN_ADI_1);
> +		return ltc4283_write_in_byte(st, reg, LTC4283_ADC2_FS_mV, val);
> +	}
> +
> +	if (is_max) {
> +		reg = LTC4283_ADC_2_MAX_TH_DIFF(channel - LTC4283_CHAN_ADIN12);
> +		return ltc4283_write_in_byte(st, reg, LTC4283_ADC1_FS_uV,
> +					     val * MILLI);
> +	}
> +
> +	reg = LTC4283_ADC_2_MIN_TH_DIFF(channel - LTC4283_CHAN_ADIN12);
> +	return ltc4283_write_in_byte(st, reg, LTC4283_ADC1_FS_uV, val * MILLI);
> +}
> +
> +static int ltc4283_write_in(struct ltc4283_hwmon *st, u32 attr, long val,
> +			    int channel)
> +{
> +	switch (attr) {
> +	case hwmon_in_max:
> +		return ltc4283_write_minmax(st, val, channel, true);
> +	case hwmon_in_min:
> +		return ltc4283_write_minmax(st, val, channel, false);
> +	case hwmon_in_reset_history:
> +		return ltc4283_reset_in_hist(st, channel);
> +	case hwmon_in_enable:
> +		return ltc4283_write_in_en(st, channel, !!val);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int ltc4283_write_curr_byte(const struct ltc4283_hwmon *st,
> +				   u32 reg, long val)
> +{
> +	u32 temp = LTC4283_ADC1_FS_uV * DECA * MILLI;
> +	u32 reg_val;
> +
> +	reg_val = DIV_ROUND_CLOSEST_ULL(val * BIT_ULL(8) * st->rsense, temp);
> +	return regmap_write(st->map, reg, reg_val);
> +}
> +
> +static int ltc4283_write_curr_history(struct ltc4283_hwmon *st)
> +{
> +	int ret;
> +
> +	guard(mutex)(&st->lock);
> +
> +	ret = __ltc4283_write_in_history(st, LTC4283_SENSE_MIN, st->vsense_max,
> +					 LTC4283_ADC1_FS_uV);
> +	if (ret)
> +		return ret;
> +
> +	/* Now, let's also clear possible overcurrent logs. */
> +	return regmap_clear_bits(st->map, LTC4283_FAULT_LOG,
> +				 LTC4283_OC_FAULT_MASK);
> +}
> +
> +static int ltc4283_write_curr(struct ltc4283_hwmon *st, u32 attr, long val)
> +{
> +	switch (attr) {
> +	case hwmon_curr_max:
> +		return ltc4283_write_curr_byte(st, LTC4283_SENSE_MAX_TH, val);
> +	case hwmon_curr_min:
> +		return ltc4283_write_curr_byte(st, LTC4283_SENSE_MIN_TH, val);
> +	case hwmon_curr_reset_history:
> +		return ltc4283_write_curr_history(st);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int ltc4283_energy_enable_set(struct ltc4283_hwmon *st, long val)
> +{
> +	int ret;
> +
> +	guard(mutex)(&st->lock);
> +
> +	/* Setting the bit halts the meter. */
> +	val = !!val;
> +	ret = regmap_update_bits(st->map, LTC4283_METER_CONTROL,
> +				 LTC4283_METER_HALT_MASK,
> +				 FIELD_PREP(LTC4283_METER_HALT_MASK, !val));
> +	if (ret)
> +		return ret;
> +
> +	st->energy_en = val;
> +
> +	return 0;
> +}
> +
> +static int ltc4283_write(struct device *dev, enum hwmon_sensor_types type,
> +			 u32 attr, int channel, long val)
> +{
> +	struct ltc4283_hwmon *st = dev_get_drvdata(dev);
> +
> +	switch (type) {
> +	case hwmon_power:
> +		return ltc4283_write_power(st, attr, val);
> +	case hwmon_in:
> +		return ltc4283_write_in(st, attr, val, channel);
> +	case hwmon_curr:
> +		return ltc4283_write_curr(st, attr, val);
> +	case hwmon_energy:
> +		return ltc4283_energy_enable_set(st, val);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static umode_t ltc4283_in_is_visible(const struct ltc4283_hwmon *st,
> +				     u32 attr, int channel)
> +{
> +	/* If ADIO is set as a GPIO, don´t make it visible. */
> +	if (channel >= LTC4283_CHAN_ADIO_1 && channel <= LTC4283_CHAN_ADIO_4) {
> +		/* ADIOX pins come at index 0 in the gpio mask. */
> +		channel -= LTC4283_CHAN_ADIO_1;
> +		if (test_bit(channel, &st->gpio_mask))
> +			return 0;
> +	}
> +
> +	/* Also take care of differential channels. */
> +	if (channel >= LTC4283_CHAN_ADIO12 && channel <= LTC4283_CHAN_ADIO34) {
> +		channel -= LTC4283_CHAN_ADIO12;
> +		/* If one channel in the pair is used, make it invisible. */
> +		if (test_bit(channel * 2, &st->gpio_mask) ||
> +		    test_bit(channel * 2 + 1, &st->gpio_mask))
> +			return 0;
> +	}
> +
> +	switch (attr) {
> +	case hwmon_in_input:
> +	case hwmon_in_highest:
> +	case hwmon_in_lowest:
> +	case hwmon_in_max_alarm:
> +	case hwmon_in_min_alarm:
> +	case hwmon_in_label:
> +	case hwmon_in_lcrit_alarm:
> +	case hwmon_in_crit_alarm:
> +	case hwmon_in_fault:
> +		return 0444;
> +	case hwmon_in_max:
> +	case hwmon_in_min:
> +	case hwmon_in_enable:
> +	case hwmon_in_reset_history:
> +		return 0644;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static umode_t ltc4283_curr_is_visible(u32 attr)
> +{
> +	switch (attr) {
> +	case hwmon_curr_input:
> +	case hwmon_curr_highest:
> +	case hwmon_curr_lowest:
> +	case hwmon_curr_max_alarm:
> +	case hwmon_curr_min_alarm:
> +	case hwmon_curr_crit_alarm:
> +	case hwmon_curr_label:
> +		return 0444;
> +	case hwmon_curr_max:
> +	case hwmon_curr_min:
> +	case hwmon_curr_reset_history:
> +		return 0644;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static umode_t ltc4283_power_is_visible(u32 attr)
> +{
> +	switch (attr) {
> +	case hwmon_power_input:
> +	case hwmon_power_input_highest:
> +	case hwmon_power_input_lowest:
> +	case hwmon_power_label:
> +	case hwmon_power_max_alarm:
> +	case hwmon_power_min_alarm:
> +		return 0444;
> +	case hwmon_power_max:
> +	case hwmon_power_min:
> +	case hwmon_power_reset_history:
> +		return 0644;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static umode_t ltc4283_is_visible(const void *data,
> +				  enum hwmon_sensor_types type,
> +				  u32 attr, int channel)
> +{
> +	switch (type) {
> +	case hwmon_in:
> +		return ltc4283_in_is_visible(data, attr, channel);
> +	case hwmon_curr:
> +		return ltc4283_curr_is_visible(attr);
> +	case hwmon_power:
> +		return ltc4283_power_is_visible(attr);
> +	case hwmon_energy:
> +		/* hwmon_energy_enable */
> +		return 0644;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static const char * const ltc4283_in_strs[] = {
> +	"VIN", "VPWR", "VADI1", "VADI2", "VADI3", "VADI4", "VADIO1", "VADIO2",
> +	"VADIO3", "VADIO4", "DRNS", "DRAIN", "ADIN2-ADIN1", "ADIN4-ADIN3",
> +	"ADIO2-ADIO1", "ADIO4-ADIO3"
> +};
> +
> +static int ltc4283_read_labels(struct device *dev,
> +			       enum hwmon_sensor_types type,
> +			       u32 attr, int channel, const char **str)
> +{
> +	switch (type) {
> +	case hwmon_in:
> +		*str = ltc4283_in_strs[channel];
> +		return 0;
> +	case hwmon_curr:
> +		*str = "ISENSE";
> +		return 0;
> +	case hwmon_power:
> +		*str = "Power";
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static ssize_t ltc4283_energy_show(struct device *dev,
> +				   struct device_attribute *da, char *buf)
> +{
> +	u64 temp = LTC4283_ADC1_FS_uV * LTC4283_ADC2_FS_mV, energy, temp_2;
> +	struct ltc4283_hwmon *st = dev_get_drvdata(dev);
> +	__be64 raw;
> +	int ret;
> +
> +	guard(mutex)(&st->lock);
> +	if (!st->energy_en)
> +		return -ENODATA;
> +
> +	ret = regmap_bulk_read(st->map, LTC4283_ENERGY, &raw, sizeof(raw));
> +	if (ret)
> +		return ret;
> +
> +	energy =  be64_to_cpu(raw) >> 16;
> +
> +	/*
> +	 * The formula for energy is given by:
> +	 *	E = CODE(48b) * 32.768mV * 2.048V * Tconv / 2^24 * Rsense
> +	 *
> +	 * As Rsense can have tenths of micro-ohm resolution, we need to
> +	 * multiply by DECA to get microjoule.
> +	 */
> +	if (check_mul_overflow(temp * LTC4283_TCONV_uS, energy, &temp_2)) {
> +		/*
> +		 * We multiply again by 1000 to make sure that we don't get 0
> +		 * in the following division which could happen for big rsense
> +		 * values. OTOH, we then divide energy first by 1000 so that
> +		 * we do not overflow u64 again for very small rsense values.
> +		 * We add 100 factor for proper conversion to microjoule.
> +		 */
> +		temp_2 = DIV64_U64_ROUND_CLOSEST(temp * LTC4283_TCONV_uS * MILLI,
> +						 BIT_ULL(24) * st->rsense);
> +		energy = DIV_ROUND_CLOSEST_ULL(energy, MILLI * CENTI) * temp_2;
> +	} else {
> +		/* Put rsense back into nanoohm so we get microjoule. */
> +		energy = DIV64_U64_ROUND_CLOSEST(temp_2, BIT_ULL(24) * st->rsense * CENTI);
> +	}
> +
> +	return sysfs_emit(buf, "%llu\n", energy);
> +}

I just submitted a patch for the hwmon core which adds support for a 64-bit
energy attribute. See
https://patchwork.kernel.org/project/linux-hwmon/patch/20250905204159.2618403-12-linux@roeck-us.net/

I'll make it available in hwmon-next. Please use it.

> +
> +/*
> + * Set max limits for ISENSE and Power as that depends on the max voltage on
> + * rsense that is defined in ILIM_ADJUST. This is specially important for power
> + * because for some rsense and vfsout values, if we allow the default raw 255
> + * value, that would overflow long in 32bit archs when reading back the max
> + * power limit.
> + */
> +static int ltc4283_set_max_limits(struct ltc4283_hwmon *st, struct device *dev)
> +{
> +	u32 temp = st->vsense_max * DECA * MICRO;
> +	int ret;
> +
> +	ret = ltc4283_write_in_byte(st, LTC4283_SENSE_MAX_TH, LTC4283_ADC1_FS_uV,
> +				    st->vsense_max * MILLI);
> +	if (ret)
> +		return ret;
> +
> +	/* Power is given by ISENSE * Vout. */
> +	st->power_max = DIV_ROUND_CLOSEST(temp, st->rsense) * LTC4283_ADC2_FS_mV;
> +	return ltc4282_write_power_byte(st, LTC4283_POWER_MAX_TH, st->power_max);
> +}
> +
> +static int ltc4283_parse_array_prop(const struct ltc4283_hwmon *st,
> +				    struct device *dev, const char *prop,
> +				    const u32 *vals, u32 n_vals)
> +{
> +	u32 prop_val;
> +	int ret;
> +	u32 i;
> +
> +	ret = device_property_read_u32(dev, prop, &prop_val);
> +	if (ret)
> +		return n_vals;
> +
> +	for (i = 0; i < n_vals; i++) {
> +		if (prop_val != vals[i])
> +			continue;
> +
> +		return i;
> +	}
> +
> +	return dev_err_probe(dev, -EINVAL,
> +			     "Invalid %s property value %u, expected one of: %*ph\n",
> +			     prop, prop_val, n_vals, vals);
> +}
> +
> +static int ltc4283_get_defaults(struct ltc4283_hwmon *st)
> +{
> +	u32 reg_val, ilm_adjust, c;
> +	int ret;
> +
> +	ret = regmap_read(st->map, LTC4283_METER_CONTROL, &reg_val);
> +	if (ret)
> +		return ret;
> +
> +	st->energy_en = !FIELD_GET(LTC4283_METER_HALT_MASK, reg_val);
> +
> +	ret = regmap_read(st->map, LTC4283_CONFIG_1, &reg_val);
> +	if (ret)
> +		return ret;
> +
> +	ilm_adjust = FIELD_GET(LTC4283_ILIM_MASK, reg_val);
> +	st->vsense_max = LTC4283_VILIM_MIN_uV / MILLI + ilm_adjust;
> +
> +	/* VPWR and VIN are always enabled */
> +	__set_bit(LTC4283_CHAN_VIN, &st->ch_enable_mask);
> +	__set_bit(LTC4283_CHAN_VPWR, &st->ch_enable_mask);
> +	for (c = LTC4283_CHAN_ADI_1; c < LTC4283_CHAN_MAX; c++) {
> +		u32 chan = c - LTC4283_CHAN_ADI_1, bit;
> +
> +		ret = regmap_read(st->map, LTC4283_ADC_SELECT(chan), &reg_val);
> +		if (ret)
> +			return ret;
> +
> +		bit = LTC4283_ADC_SELECT_MASK(chan);
> +		if (c > LTC4283_CHAN_DRAIN)
> +			/* account for two reserved fields after DRAIN */
> +			bit <<= 2;
> +
> +		if (!(bit & reg_val))
> +			continue;
> +
> +		__set_bit(c, &st->ch_enable_mask);
> +	}
> +
> +	return 0;
> +}
> +
> +static const char * const ltc4283_pgio1_funcs[] = {
> +	"inverted_power_good", "power_good", "gpio"
> +};
> +
> +static const char * const ltc4283_pgio2_funcs[] = {
> +	 "inverted_power_good", "power_good", "gpio", "active_current_limiting"
> +};
> +
> +static const char * const ltc4283_pgio3_funcs[] = {
> +	"inverted_power_good_input", "power_good_input", "gpio"
> +};
> +
> +static const char * const ltc4283_pgio4_funcs[] = {
> +	"inverted_external_fault", "external_fault", "gpio"
> +};
> +
> +enum {
> +	LTC4283_PIN_ADIO1,
> +	LTC4283_PIN_ADIO2,
> +	LTC4283_PIN_ADIO3,
> +	LTC4283_PIN_ADIO4,
> +	LTC4283_PIN_PGIO1,
> +	LTC4283_PIN_PGIO2,
> +	LTC4283_PIN_PGIO3,
> +	LTC4283_PIN_PGIO4,
> +};
> +
> +static int ltc4283_pgio_config(struct ltc4283_hwmon *st, struct device *dev)
> +{
> +	int ret, func;
> +
> +	func = device_property_match_property_string(dev, "adi,pgio1-func",
> +						     ltc4283_pgio1_funcs,
> +						     ARRAY_SIZE(ltc4283_pgio1_funcs));
> +	if (func < 0 && func != -EINVAL)
> +		return dev_err_probe(dev, func,
> +				     "Invalid adi,pgio1-func property\n");
> +	if (func >= 0) {
> +		if (func == LTC4283_PGIO_FUNC_GPIO) {
> +			__set_bit(LTC4283_PIN_PGIO1, &st->gpio_mask);
> +			/* If GPIO, default to an input pin. */
> +			func++;
> +		}
> +
> +		ret = regmap_update_bits(st->map, LTC4283_PGIO_CONFIG,
> +					 LTC4283_PGIO1_CFG_MASK,
> +					 FIELD_PREP(LTC4283_PGIO1_CFG_MASK, func));
> +		if (ret)
> +			return ret;
> +	}
> +
> +	func = device_property_match_property_string(dev, "adi,pgio2-func",
> +						     ltc4283_pgio2_funcs,
> +						     ARRAY_SIZE(ltc4283_pgio2_funcs));
> +
> +	if (func < 0 && func != -EINVAL)
> +		return dev_err_probe(dev, func,
> +				     "Invalid adi,pgio2-func property\n");
> +	if (func >= 0) {
> +		if (func != LTC4283_PGIO2_FUNC_ACLB) {
> +			if (func == LTC4283_PGIO_FUNC_GPIO)  {
> +				__set_bit(LTC4283_PIN_PGIO2, &st->gpio_mask);
> +				func++;
> +			}
> +
> +			ret = regmap_update_bits(st->map, LTC4283_PGIO_CONFIG,
> +						 LTC4283_PGIO2_CFG_MASK,
> +						 FIELD_PREP(LTC4283_PGIO2_CFG_MASK, func));
> +		} else {
> +			ret = regmap_set_bits(st->map, LTC4283_CONTROL_1,
> +					      LTC4283_PIGIO2_ACLB_MASK);
> +		}
> +
> +		if (ret)
> +			return ret;
> +	}
> +
> +	func = device_property_match_property_string(dev, "adi,pgio3-func",
> +						     ltc4283_pgio3_funcs,
> +						     ARRAY_SIZE(ltc4283_pgio3_funcs));
> +
> +	if (func < 0 && func != -EINVAL)
> +		return dev_err_probe(dev, func,
> +				     "Invalid adi,pgio3-func property\n");
> +	if (func >= 0) {
> +		if (func == LTC4283_PGIO_FUNC_GPIO) {
> +			__set_bit(LTC4283_PIN_PGIO3, &st->gpio_mask);
> +			func++;
> +		}
> +
> +		ret = regmap_update_bits(st->map, LTC4283_PGIO_CONFIG,
> +					 LTC4283_PGIO3_CFG_MASK,
> +					 FIELD_PREP(LTC4283_PGIO3_CFG_MASK, func));
> +		if (ret)
> +			return ret;
> +	}
> +
> +	func = device_property_match_property_string(dev, "adi,pgio4-func",
> +						     ltc4283_pgio4_funcs,
> +						     ARRAY_SIZE(ltc4283_pgio4_funcs));
> +
> +	if (func < 0 && func != -EINVAL)
> +		return dev_err_probe(dev, func,
> +				     "Invalid adi,pgio4-func property\n");
> +	if (func >= 0) {
> +		if (func == LTC4283_PGIO_FUNC_GPIO) {
> +			__set_bit(LTC4283_PIN_PGIO4, &st->gpio_mask);
> +			func++;
> +		} else {
> +			st->ext_fault = true;
> +		}
> +
> +		ret = regmap_update_bits(st->map, LTC4283_PGIO_CONFIG,
> +					 LTC4283_PGIO4_CFG_MASK,
> +					 FIELD_PREP(LTC4283_PGIO4_CFG_MASK, func));
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int ltc4283_adio_config(struct ltc4283_hwmon *st, struct device *dev,
> +			       const char *prop, u32 pin)
> +{
> +	u32 adc_idx;
> +	int ret;
> +
> +	if (!device_property_read_bool(dev, prop))
> +		return 0;
> +
> +	adc_idx = LTC4283_CHAN_ADIO_1 - LTC4283_CHAN_ADI_1 + pin;
> +	ret = regmap_clear_bits(st->map, LTC4283_ADC_SELECT(adc_idx),
> +				LTC4283_ADC_SELECT_MASK(adc_idx));
> +	if (ret)
> +		return ret;
> +
> +	__set_bit(pin, &st->gpio_mask);
> +	return 0;
> +}
> +
> +static int ltc4283_pin_config(struct ltc4283_hwmon *st, struct device *dev)
> +{
> +	int ret;
> +
> +	ret = ltc4283_pgio_config(st, dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = ltc4283_adio_config(st, dev, "adi,gpio-on-adio1", LTC4283_PIN_ADIO1);
> +	if (ret)
> +		return ret;
> +
> +	ret = ltc4283_adio_config(st, dev, "adi,gpio-on-adio2", LTC4283_PIN_ADIO2);
> +	if (ret)
> +		return ret;
> +
> +	ret = ltc4283_adio_config(st, dev, "adi,gpio-on-adio3", LTC4283_PIN_ADIO3);
> +	if (ret)
> +		return ret;
> +
> +	return ltc4283_adio_config(st, dev, "adi,gpio-on-adio4", LTC4283_PIN_ADIO4);
> +}
> +
> +static const char * const ltc4283_oc_fet_retry[] = {
> +	"latch-off", "1", "7", "unlimited"
> +};
> +
> +static const u32 ltc4283_fb_factor[] = {
> +	100, 50, 20, 10
> +};
> +
> +static const u32 ltc4283_cooling_dl[] = {
> +	512, 1002, 2005, 4100, 8190, 16400, 32800, 65600
> +};
> +
> +static const u32 ltc4283_fet_bad_delay[] = {
> +	256, 512, 1002, 2005
> +};
> +
> +static int ltc4283_setup(struct ltc4283_hwmon *st, struct device *dev)
> +{
> +	int ret;
> +
> +	/* The part has an eeprom so let's get the needed defaults from it */
> +	ret = ltc4283_get_defaults(st);
> +	if (ret)
> +		return ret;
> +
> +	ret = device_property_read_u32(dev, "adi,rsense-nano-ohms",
> +				       &st->rsense);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Failed to read adi,rsense-nano-ohms\n");
> +	if (st->rsense < CENTI)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "adi,rsense-nano-ohms too small (< %lu)\n",
> +				     CENTI);
> +
> +	/*
> +	 * The resolution for rsense is tenths of micro (eg: 62.5 uOhm) which
> +	 * means we need nano in the bindings. However, to make things easier to
> +	 * handle (with respect to overflows) we divide it by 100 as we don't
> +	 * really need the last two digits.
> +	 */
> +	st->rsense /= CENTI;
> +
> +	ret = device_property_read_u32(dev, "adi,current-limit-sense-microvolt",
> +				       &st->vsense_max);
> +	if (!ret) {
> +		u32 reg_val;
> +
> +		if (!in_range(st->vsense_max, LTC4283_VILIM_MIN_uV,
> +			      LTC4283_VILIM_RANGE)) {
> +			return dev_err_probe(dev, -EINVAL,
> +					     "adi,current-limit-sense-microvolt (%u) out of range [%u %u]\n",
> +					     st->vsense_max, LTC4283_VILIM_MIN_uV,
> +					     LTC4283_VILIM_MAX_uV);
> +		}
> +
> +		st->vsense_max /= MILLI;
> +		reg_val = FIELD_PREP(LTC4283_ILIM_MASK,
> +				     st->vsense_max - LTC4283_VILIM_MIN_uV / MILLI);
> +		ret = regmap_update_bits(st->map, LTC4283_CONFIG_1,
> +					 LTC4283_ILIM_MASK, reg_val);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = ltc4283_parse_array_prop(st, dev, "adi,current-limit-foldback-factor",
> +				       ltc4283_fb_factor, ARRAY_SIZE(ltc4283_fb_factor));
> +	if (ret < 0)
> +		return ret;
> +	if (ret < ARRAY_SIZE(ltc4283_fb_factor)) {
> +		ret = regmap_update_bits(st->map, LTC4283_CONFIG_1, LTC4283_FB_MASK,
> +					 FIELD_PREP(LTC4283_FB_MASK, ret));
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = ltc4283_parse_array_prop(st, dev, "adi,cooling-delay-ms",
> +				       ltc4283_cooling_dl, ARRAY_SIZE(ltc4283_cooling_dl));
> +	if (ret < 0)
> +		return ret;
> +	if (ret < ARRAY_SIZE(ltc4283_cooling_dl)) {
> +		ret = regmap_update_bits(st->map, LTC4283_CONFIG_2, LTC4283_COOLING_DL_MASK,
> +					 FIELD_PREP(LTC4283_COOLING_DL_MASK, ret));
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = ltc4283_parse_array_prop(st, dev, "adi,fet-bad-timer-delay-ms",
> +				       ltc4283_fet_bad_delay, ARRAY_SIZE(ltc4283_fet_bad_delay));
> +	if (ret < 0)
> +		return ret;
> +	if (ret < ARRAY_SIZE(ltc4283_fet_bad_delay)) {
> +		ret = regmap_update_bits(st->map, LTC4283_CONFIG_2, LTC4283_FTBD_DL_MASK,
> +					 FIELD_PREP(LTC4283_FTBD_DL_MASK, ret));
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = ltc4283_set_max_limits(st, dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = ltc4283_pin_config(st, dev);
> +	if (ret)
> +		return ret;
> +
> +	if (device_property_read_bool(dev, "adi,power-good-reset-on-fet")) {
> +		ret = regmap_clear_bits(st->map, LTC4283_CONTROL_1,
> +					LTC4283_PWRGD_RST_CTRL_MASK);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (device_property_read_bool(dev, "adi,fet-turn-off-disable")) {
> +		ret = regmap_clear_bits(st->map, LTC4283_CONTROL_1,
> +					LTC4283_FET_BAD_OFF_MASK);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (device_property_read_bool(dev, "adi,tmr-pull-down-disable")) {
> +		ret = regmap_set_bits(st->map, LTC4283_CONTROL_1,
> +				      LTC4283_THERM_TMR_MASK);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (device_property_read_bool(dev, "adi,dvdt-inrush-control-disable")) {
> +		ret = regmap_clear_bits(st->map, LTC4283_CONTROL_1,
> +					LTC4283_DVDT_MASK);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (device_property_read_bool(dev, "adi,undervoltage-retry-disable")) {
> +		ret = regmap_clear_bits(st->map, LTC4283_CONTROL_2,
> +					LTC4283_UV_RETRY_MASK);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (device_property_read_bool(dev, "adi,overvoltage-retry-disable")) {
> +		ret = regmap_clear_bits(st->map, LTC4283_CONTROL_2,
> +					LTC4283_OV_RETRY_MASK);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (device_property_read_bool(dev, "adi,external-fault-retry-enable")) {
> +		if (!st->ext_fault)
> +			return dev_err_probe(dev, -EINVAL,
> +					     "adi,external-fault-retry-enable set but PGIO4 not configured\n");
> +		ret = regmap_set_bits(st->map, LTC4283_CONTROL_2,
> +				      LTC4283_EXT_FAULT_RETRY_MASK);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (device_property_read_bool(dev, "adi,fault-log-enable")) {
> +		ret = regmap_set_bits(st->map, LTC4283_FAULT_LOG_CTRL,
> +				      LTC4283_FAULT_LOG_EN_MASK);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = device_property_match_property_string(dev, "adi,overcurrent-retries",
> +						    ltc4283_oc_fet_retry,
> +						    ARRAY_SIZE(ltc4283_oc_fet_retry));
> +	/* We still want to catch when an invalid string is given. */
> +	if (ret != -EINVAL)
> +		return dev_err_probe(dev, ret,
> +				     "adi,overcurrent-retries invalid value\n");
> +	if (ret >= 0) {
> +		ret = regmap_update_bits(st->map, LTC4283_CONTROL_2,
> +					 LTC4283_OC_RETRY_MASK,
> +					 FIELD_PREP(LTC4283_OC_RETRY_MASK, ret));
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = device_property_match_property_string(dev, "adi,fet-bad-retries",
> +						    ltc4283_oc_fet_retry,
> +						    ARRAY_SIZE(ltc4283_oc_fet_retry));
> +	if (ret != -EINVAL)
> +		return dev_err_probe(dev, ret,
> +				     "adi,fet-bad-retries invalid value\n");
> +	if (ret >= 0) {
> +		ret = regmap_update_bits(st->map, LTC4283_CONTROL_2,
> +					 LTC4283_FET_BAD_RETRY_MASK,
> +					 FIELD_PREP(LTC4283_FET_BAD_RETRY_MASK, ret));
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (device_property_read_bool(dev, "adi,external-fault-fet-off-enable")) {
> +		if (!st->ext_fault)
> +			return dev_err_probe(dev, -EINVAL,
> +					     "adi,external-fault-fet-off-enable set but PGIO4 not configured\n");
> +		ret = regmap_set_bits(st->map, LTC4283_CONFIG_3,
> +				      LTC4283_EXTFLT_TURN_OFF_MASK);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (device_property_read_bool(dev, "adi,vpower-drns-enable")) {
> +		u32 drns_chan = LTC4283_CHAN_DRNS - LTC4283_CHAN_ADI_1;
> +
> +		ret = regmap_set_bits(st->map, LTC4283_CONFIG_3,
> +				      LTC4283_VPWR_DRNS_MASK);
> +		if (ret)
> +			return ret;
> +
> +		/*
> +		 * Then, let's by default disable the DRNS channel from the ADC2
> +		 * as this is already being monitored by the VPWR channel. One
> +		 * can still enable it later on if needed.
> +		 */
> +		ret = regmap_clear_bits(st->map, LTC4283_ADC_SELECT(drns_chan),
> +					LTC4283_ADC_SELECT_MASK(drns_chan));
> +		if (ret)
> +			return ret;
> +
> +		__clear_bit(LTC4283_CHAN_DRNS, &st->ch_enable_mask);
> +	}
> +
> +	/* Make sure the ADC has 12bit resolution since we're assuming that. */
> +	ret = regmap_update_bits(st->map, LTC4283_PGIO_CONFIG_2,
> +				 LTC4283_ADC_MASK,
> +				 FIELD_PREP(LTC4283_ADC_MASK, 3));
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Make sure we are integrating power as we only support reporting
> +	 * consumed energy.
> +	 */
> +	return regmap_clear_bits(st->map, LTC4283_METER_CONTROL,
> +				 LTC4283_INTEGRATE_I_MASK);
> +}
> +
> +static const struct hwmon_channel_info * const ltc4283_info[] = {
> +	HWMON_CHANNEL_INFO(in,
> +			   HWMON_I_LCRIT_ALARM | HWMON_I_CRIT_ALARM |
> +			   HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST |
> +			   HWMON_I_MAX | HWMON_I_MIN | HWMON_I_MIN_ALARM |
> +			   HWMON_I_MAX_ALARM | HWMON_I_RESET_HISTORY |
> +			   HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST |
> +			   HWMON_I_MAX | HWMON_I_MIN | HWMON_I_MIN_ALARM |
> +			   HWMON_I_RESET_HISTORY | HWMON_I_MAX_ALARM |
> +			   HWMON_I_ENABLE | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST |
> +			   HWMON_I_MAX | HWMON_I_MIN | HWMON_I_MIN_ALARM |
> +			   HWMON_I_RESET_HISTORY | HWMON_I_MAX_ALARM |
> +			   HWMON_I_ENABLE | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST |
> +			   HWMON_I_MAX | HWMON_I_MIN | HWMON_I_MIN_ALARM |
> +			   HWMON_I_RESET_HISTORY | HWMON_I_MAX_ALARM |
> +			   HWMON_I_ENABLE | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST |
> +			   HWMON_I_MAX | HWMON_I_MIN | HWMON_I_MIN_ALARM |
> +			   HWMON_I_RESET_HISTORY | HWMON_I_MAX_ALARM |
> +			   HWMON_I_ENABLE | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST |
> +			   HWMON_I_MAX | HWMON_I_MIN | HWMON_I_MIN_ALARM |
> +			   HWMON_I_RESET_HISTORY | HWMON_I_MAX_ALARM |
> +			   HWMON_I_ENABLE | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST |
> +			   HWMON_I_MAX | HWMON_I_MIN | HWMON_I_MIN_ALARM |
> +			   HWMON_I_RESET_HISTORY | HWMON_I_MAX_ALARM |
> +			   HWMON_I_ENABLE | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST |
> +			   HWMON_I_MAX | HWMON_I_MIN | HWMON_I_MIN_ALARM |
> +			   HWMON_I_RESET_HISTORY | HWMON_I_MAX_ALARM |
> +			   HWMON_I_ENABLE | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST |
> +			   HWMON_I_MAX | HWMON_I_MIN | HWMON_I_MIN_ALARM |
> +			   HWMON_I_RESET_HISTORY | HWMON_I_MAX_ALARM |
> +			   HWMON_I_ENABLE | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST |
> +			   HWMON_I_MAX | HWMON_I_MIN | HWMON_I_MIN_ALARM |
> +			   HWMON_I_RESET_HISTORY | HWMON_I_MAX_ALARM |
> +			   HWMON_I_ENABLE | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST |
> +			   HWMON_I_MAX | HWMON_I_MIN | HWMON_I_MIN_ALARM |
> +			   HWMON_I_RESET_HISTORY | HWMON_I_MAX_ALARM |
> +			   HWMON_I_FAULT | HWMON_I_ENABLE | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST |
> +			   HWMON_I_MAX | HWMON_I_MIN | HWMON_I_MIN_ALARM |
> +			   HWMON_I_RESET_HISTORY | HWMON_I_MAX_ALARM |
> +			   HWMON_I_ENABLE | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST |
> +			   HWMON_I_MAX | HWMON_I_MIN | HWMON_I_MIN_ALARM |
> +			   HWMON_I_RESET_HISTORY | HWMON_I_MAX_ALARM |
> +			   HWMON_I_ENABLE | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST |
> +			   HWMON_I_MAX | HWMON_I_MIN | HWMON_I_MIN_ALARM |
> +			   HWMON_I_RESET_HISTORY | HWMON_I_MAX_ALARM |
> +			   HWMON_I_ENABLE | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST |
> +			   HWMON_I_MAX | HWMON_I_MIN | HWMON_I_MIN_ALARM |
> +			   HWMON_I_RESET_HISTORY | HWMON_I_MAX_ALARM |
> +			   HWMON_I_ENABLE | HWMON_I_LABEL),
> +	HWMON_CHANNEL_INFO(curr,
> +			   HWMON_C_INPUT | HWMON_C_LOWEST | HWMON_C_HIGHEST |
> +			   HWMON_C_MAX | HWMON_C_MIN | HWMON_C_MIN_ALARM |
> +			   HWMON_C_MAX_ALARM | HWMON_C_CRIT_ALARM |
> +			   HWMON_C_RESET_HISTORY | HWMON_C_LABEL),
> +	HWMON_CHANNEL_INFO(power,
> +			   HWMON_P_INPUT | HWMON_P_INPUT_LOWEST |
> +			   HWMON_P_INPUT_HIGHEST | HWMON_P_MAX | HWMON_P_MIN |
> +			   HWMON_P_MAX_ALARM | HWMON_P_MIN_ALARM |
> +			   HWMON_P_RESET_HISTORY | HWMON_P_LABEL),
> +	HWMON_CHANNEL_INFO(energy,
> +			   HWMON_E_ENABLE | HWMON_E_LABEL),
> +	NULL
> +};
> +
> +static const struct hwmon_ops ltc4283_ops = {
> +	.read = ltc4283_read,
> +	.write = ltc4283_write,
> +	.is_visible = ltc4283_is_visible,
> +	.read_string = ltc4283_read_labels,
> +};
> +
> +static const struct hwmon_chip_info ltc4283_chip_info = {
> +	.ops = &ltc4283_ops,
> +	.info = ltc4283_info,
> +};
> +
> +/* energy attributes are 6bytes wide so we need u64 */
> +static SENSOR_DEVICE_ATTR_RO(energy1_input, ltc4283_energy, 0);
> +
> +static struct attribute *ltc4283_attrs[] = {
> +	&sensor_dev_attr_energy1_input.dev_attr.attr,
> +	NULL
> +};
> +ATTRIBUTE_GROUPS(ltc4283);
> +
> +static int ltc4283_show_fault_log(void *arg, u64 *val, u32 mask)
> +{
> +	struct ltc4283_hwmon *st = arg;
> +	long alarm;
> +	int ret;
> +
> +	ret = ltc4283_read_alarm(st, LTC4283_FAULT_LOG, mask, &alarm);
> +	if (ret)
> +		return ret;
> +
> +	*val = alarm;
> +
> +	return 0;
> +}
> +
> +static int ltc4283_show_in0_lcrit_fault_log(void *arg, u64 *val)
> +{
> +	return ltc4283_show_fault_log(arg, val, LTC4283_UV_FAULT_MASK);
> +}
> +DEFINE_DEBUGFS_ATTRIBUTE(ltc4283_in0_lcrit_fault_log,
> +			 ltc4283_show_in0_lcrit_fault_log, NULL, "%llu\n");
> +
> +static int ltc4283_show_in0_crit_fault_log(void *arg, u64 *val)
> +{
> +	return ltc4283_show_fault_log(arg, val, LTC4283_OV_FAULT_MASK);
> +}
> +DEFINE_DEBUGFS_ATTRIBUTE(ltc4283_in0_crit_fault_log,
> +			 ltc4283_show_in0_crit_fault_log, NULL, "%llu\n");
> +
> +static int ltc4283_show_fet_bad_fault_log(void *arg, u64 *val)
> +{
> +	return ltc4283_show_fault_log(arg, val, LTC4283_FET_BAD_FAULT_MASK);
> +}
> +DEFINE_DEBUGFS_ATTRIBUTE(ltc4283_fet_bad_fault_log,
> +			 ltc4283_show_fet_bad_fault_log, NULL, "%llu\n");
> +
> +static int ltc4283_show_fet_short_fault_log(void *arg, u64 *val)
> +{
> +	return ltc4283_show_fault_log(arg, val, LTC4283_FET_SHORT_FAULT_MASK);
> +}
> +DEFINE_DEBUGFS_ATTRIBUTE(ltc4283_fet_short_fault_log,
> +			 ltc4283_show_fet_short_fault_log, NULL, "%llu\n");
> +
> +static int ltc4283_show_curr1_crit_fault_log(void *arg, u64 *val)
> +{
> +	return ltc4283_show_fault_log(arg, val, LTC4283_OC_FAULT_MASK);
> +}
> +DEFINE_DEBUGFS_ATTRIBUTE(ltc4283_curr1_crit_fault_log,
> +			 ltc4283_show_curr1_crit_fault_log, NULL, "%llu\n");
> +
> +static int ltc4283_show_power1_failed_fault_log(void *arg, u64 *val)
> +{
> +	return ltc4283_show_fault_log(arg, val, LTC4283_PWR_FAIL_FAULT_MASK);
> +}
> +DEFINE_DEBUGFS_ATTRIBUTE(ltc4283_power1_failed_fault_log,
> +			 ltc4283_show_power1_failed_fault_log, NULL, "%llu\n");
> +
> +static int ltc4283_show_power1_good_input_fault_log(void *arg, u64 *val)
> +{
> +	return ltc4283_show_fault_log(arg, val, LTC4283_PGI_FAULT_MASK);
> +}
> +DEFINE_DEBUGFS_ATTRIBUTE(ltc4283_power1_good_input_fault_log,
> +			 ltc4283_show_power1_good_input_fault_log, NULL, "%llu\n");
> +
> +static void ltc4283_debugfs_init(struct ltc4283_hwmon *st, struct i2c_client *i2c)
> +{
> +	debugfs_create_file_unsafe("in0_crit_fault_log", 0400, i2c->debugfs, st,
> +				   &ltc4283_in0_crit_fault_log);
> +	debugfs_create_file_unsafe("in0_lcrit_fault_log", 0400, i2c->debugfs, st,
> +				   &ltc4283_in0_lcrit_fault_log);
> +	debugfs_create_file_unsafe("in0_fet_bad_fault_log", 0400, i2c->debugfs, st,
> +				   &ltc4283_fet_bad_fault_log);
> +	debugfs_create_file_unsafe("in0_fet_short_fault_log", 0400, i2c->debugfs, st,
> +				   &ltc4283_fet_short_fault_log);
> +	debugfs_create_file_unsafe("curr1_crit_fault_log", 0400, i2c->debugfs, st,
> +				   &ltc4283_curr1_crit_fault_log);
> +	debugfs_create_file_unsafe("power1_failed_fault_log", 0400, i2c->debugfs, st,
> +				   &ltc4283_power1_failed_fault_log);
> +	debugfs_create_file_unsafe("power1_good_input_fault_log", 0400, i2c->debugfs,
> +				   st, &ltc4283_power1_good_input_fault_log);
> +}
> +
> +static bool ltc4283_writable_reg(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	case LTC4283_SYSTEM_STATUS ... LTC4283_FAULT_STATUS:
> +		return false;
> +	case LTC4283_RESERVED_OC:
> +		return false;
> +	case LTC4283_RESERVED_86 ... LTC4283_RESERVED_8F:
> +		return false;
> +	case LTC4283_RESERVED_91 ... LTC4283_RESERVED_A1:
> +		return false;
> +	case LTC4283_RESERVED_A3:
> +		return false;
> +	case LTC4283_RESERVED_AC:
> +		return false;
> +	case LTC4283_POWER_PLAY_MSB ... LTC4283_POWER_PLAY_LSB:
> +		return false;
> +	case LTC4283_RESERVED_F1 ... LTC4283_RESERVED_FF:
> +		return false;
> +	default:
> +		return true;
> +	}
> +}
> +
> +static const struct regmap_config ltc4283_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = 0xff,
> +	.writeable_reg = ltc4283_writable_reg,
> +};
> +
> +static int ltc4283_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev, *hwmon;
> +	struct auxiliary_device *adev;
> +	struct ltc4283_hwmon *st;
> +	int ret;
> +
> +	st = devm_kzalloc(dev, sizeof(*st), GFP_KERNEL);
> +	if (!st)
> +		return -ENOMEM;
> +
> +	st->map = devm_regmap_init_i2c(client, &ltc4283_regmap_config);
> +	if (IS_ERR(st->map))
> +		return dev_err_probe(dev, PTR_ERR(st->map),
> +				     "Failed to create regmap\n");
> +
> +	ret = ltc4283_setup(st, dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_mutex_init(dev, &st->lock);
> +	if (ret)
> +		return ret;
> +
> +	hwmon = devm_hwmon_device_register_with_info(dev, "ltc4283", st,
> +						     &ltc4283_chip_info,
> +						     ltc4283_groups);
> +
> +	if (IS_ERR(hwmon))
> +		return PTR_ERR(hwmon);
> +
> +	ltc4283_debugfs_init(st, client);
> +
> +	if (!st->gpio_mask)
> +		return 0;
> +
> +	adev = devm_auxiliary_device_create(dev, "gpio", &st->gpio_mask);
> +	if (!adev)
> +		return dev_err_probe(dev, -ENODEV, "Failed to add GPIO device\n");
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id ltc4283_of_match[] = {
> +	{ .compatible = "adi,ltc4283" },
> +	{ }
> +};
> +
> +static const struct i2c_device_id ltc4283_i2c_id[] = {
> +	{ "ltc4283" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, ltc4283_i2c_id);
> +
> +static struct i2c_driver ltc4283_driver = {
> +	.driver	= {
> +		.name = "ltc4283",
> +		.of_match_table = ltc4283_of_match,
> +	},
> +	.probe = ltc4283_probe,
> +	.id_table = ltc4283_i2c_id,
> +};
> +module_i2c_driver(ltc4283_driver);
> +
> +MODULE_AUTHOR("Nuno Sá <nuno.sa@analog.com>");
> +MODULE_DESCRIPTION("LTC4283 How Swap Controller driver");
> +MODULE_LICENSE("GPL");
> 


