Return-Path: <linux-gpio+bounces-18906-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0CEA8AF0A
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 06:30:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F650440FD5
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 04:30:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE7FB228CB5;
	Wed, 16 Apr 2025 04:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B/wr2a9f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DB24A1A;
	Wed, 16 Apr 2025 04:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744777846; cv=none; b=FfpOM1VTW8ev8Dg+FU/Xo+aWcvcnaik+GPChI6WWYQDbUEhWVuX5AEai2trfmh5As0S7k82W+LTmoNbs0548d5DlpuU+diBRzq+myqBQj75t2CLQ64S6nThkXw7fAwglgnmOUf9sDFfgkqF1TK5OiBWlH+h4HSUBlVYIKhOBel0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744777846; c=relaxed/simple;
	bh=uOh12k+pbclJG930++tjw/iAxxgPaj1yijdqn+OZEQ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rm9rk2Uf5/JXPO6dnosZEaXaP92Oj6mocWBicV+6k+XclZURd9jtrLvoQu8+qjAHRCGMHymIVf/8XZVI2lgCOpo9nR/4pHvYtwoGEYCjx/KDY90eOEscpp+pZfWCYKVN7Nm4TCBrB6Tociq7SwT1JVJZgJK87BPJwZtkL7AdaDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B/wr2a9f; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-72d3b48d2ffso6037273b3a.2;
        Tue, 15 Apr 2025 21:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744777841; x=1745382641; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=qRoguU9eCrJJ6U2/GkGsTidT1lGOYx4y4ZTgEkTcCfc=;
        b=B/wr2a9fJFg+uj9eDtJU1ZcDmay3zDtV9OZ+IeAIIkBPK1fLuBjODFYsAjCENex+Fw
         yL9oTGW+4uFz4FT0CEL+Vs5uQhrJPUjb4Nhsm9/lkJErC3M42+ss/uY0Ynu9fQNlPf5Q
         vGSvRK38ttqbDmXEm/yEcB33fp9GCOFFc9SmN14q1kKJXAnqhBcOfxQTf2nj6NT2Jpqm
         qapoHV3d+w/llzMNPMsm4NV8zu9JGiDVlKoJCn+EURihKqZu4EikIsH2ueEMgSIP8eGN
         ognD0iTGPgX/UHzMOSxWH11BbN8nP5xr4iu+rp9UXCkeRQn7nAT3PJaiK4l5thitUeVJ
         LKFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744777841; x=1745382641;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qRoguU9eCrJJ6U2/GkGsTidT1lGOYx4y4ZTgEkTcCfc=;
        b=c2X4Li375haPW8nkKto/+ZJZUKN+lEItEEvGdr/BZt3ZuWhSI3frYXhd9BCFpuoOIQ
         DvMIEG3fR1PhCyjY1jOZyITZOPmm+y3z1K9t6kN3c5IMih6zJjtn+0du7oibdtZI3aEY
         Ed21eNoPHgPPlB6KoXZxmZBYd1q/iTDaK2I72pd8Y9F3d0ZwGwL3ynk/y5OlzbpEqpZK
         VzKYSnrV29vDUmg7GC498xB04ndR1zFAKMjel37fhmpLwRxa7lR1V+6zf/ETPP+XQZul
         YYXksfpWp/7Vy8knSsrX9rf5WLDtvC+jVpzpt1LKUvfJMKxMvsicxqNrjzM0GT4maDSC
         eRHA==
X-Forwarded-Encrypted: i=1; AJvYcCUQZGrGQE579IFN00IYn0mVokonsmedAGU96UDSCEGMyLjdDN+c+xjkSTJGN9yAf76Q630cv74yOsjaFn5UCGcEl3iZKg==@vger.kernel.org, AJvYcCV4/r2KSn4pZjKo0fkswmHFeuIMUVTQEnTnDQkyJbf5N57pE/gzqymZoKNorji7RnbSI/jVpeOtHH04+MMrq+0=@vger.kernel.org, AJvYcCXQum6dZg6lVZh6ii3al8TCuX6WAq64VoloOwO7kzE/No9VisH/DdvDIdqqRuRtPwe047xuuuJzT6Jv@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4d4BGqQNh4MPsnY4PhzTW0wt0XMjHOOUWthZekyDv83A5WdIY
	WADrrEz+30YRsfB/BnXcaWBJD75I4fY7k/zE3h7JtP/p5aVG/o9aMkfTfA==
X-Gm-Gg: ASbGnctf9PUnpzPUtdciKxqyU+/INSZSCpjKwm0N9Doi8T4rXgIr9kQXs+8oKGOpNBH
	FvFU5Jtkfxa6x+W8FgeYev3X99lvobi4dlikQXAfEmSifnA93pXRmP49sFeA9x/EHKoD9OcJqxx
	6L01VRULkRfydDY5SVwA4v/X+oRogBfCmIdgup5UAszjciRs8rdLCIMxBItmf1mlN24B0GlACk4
	6RntwDKgM/iOtd2FEzdDRcnmsDVz1d5vf8FaQE5gcaqcciZnciW7b19lD3b6zyIT9y22FaUIy3y
	S15hfvG4s4U2a+w2c3RhKIVuAz0OGmImALeJ5pyGe7T06z0iceRe3HnZFbRPxjn5dcOzmMoxWLB
	aq2n+YsXT3W+kYjP+pbRBWj+x
X-Google-Smtp-Source: AGHT+IGgkaUpcsgXmXbrOTGfCOncKgfK62D8va4nz51e3DE81VXtlADejrOdhsIpDkrisV68gkrb3A==
X-Received: by 2002:a05:6a00:1ad3:b0:72d:3b2e:fef9 with SMTP id d2e1a72fcca58-73c267eccf0mr579314b3a.20.1744777840665;
        Tue, 15 Apr 2025 21:30:40 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c78a8sm9440851b3a.70.2025.04.15.21.30.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 21:30:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <79e085e1-23a0-4db1-93b6-fcebbc4b31d1@roeck-us.net>
Date: Tue, 15 Apr 2025 21:30:38 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] platform/x86: portwell-ec: Add GPIO and WDT driver for
 Portwell EC
To: Yen-Chi Huang <jesse.huang@portwell.com.tw>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, linus.walleij@linaro.org, brgl@bgdev.pl,
 wim@linux-watchdog.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
 jay.chen@canonical.com
References: <3096e0c7-f215-4a51-9a84-b2b64514ffd6@portwell.com.tw>
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
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAlVcphcFCRmg06EACgkQyx8mb86fmYFg0RAA
 nzXJzuPkLJaOmSIzPAqqnutACchT/meCOgMEpS5oLf6xn5ySZkl23OxuhpMZTVX+49c9pvBx
 hpvl5bCWFu5qC1jC2eWRYU+aZZE4sxMaAGeWenQJsiG9lP8wkfCJP3ockNu0ZXXAXwIbY1O1
 c+l11zQkZw89zNgWgKobKzrDMBFOYtAh0pAInZ9TSn7oA4Ctejouo5wUugmk8MrDtUVXmEA9
 7f9fgKYSwl/H7dfKKsS1bDOpyJlqhEAH94BHJdK/b1tzwJCFAXFhMlmlbYEk8kWjcxQgDWMu
 GAthQzSuAyhqyZwFcOlMCNbAcTSQawSo3B9yM9mHJne5RrAbVz4TWLnEaX8gA5xK3uCNCeyI
 sqYuzA4OzcMwnnTASvzsGZoYHTFP3DQwf2nzxD6yBGCfwNGIYfS0i8YN8XcBgEcDFMWpOQhT
 Pu3HeztMnF3HXrc0t7e5rDW9zCh3k2PA6D2NV4fews9KDFhLlTfCVzf0PS1dRVVWM+4jVl6l
 HRIAgWp+2/f8dx5vPc4Ycp4IsZN0l1h9uT7qm1KTwz+sSl1zOqKD/BpfGNZfLRRxrXthvvY8
 BltcuZ4+PGFTcRkMytUbMDFMF9Cjd2W9dXD35PEtvj8wnEyzIos8bbgtLrGTv/SYhmPpahJA
 l8hPhYvmAvpOmusUUyB30StsHIU2LLccUPPOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAlVcpi8FCRmg08MACgkQyx8mb86fmYHNRQ/+
 J0OZsBYP4leJvQF8lx9zif+v4ZY/6C9tTcUv/KNAE5leyrD4IKbnV4PnbrVhjq861it/zRQW
 cFpWQszZyWRwNPWUUz7ejmm9lAwPbr8xWT4qMSA43VKQ7ZCeTQJ4TC8kjqtcbw41SjkjrcTG
 wF52zFO4bOWyovVAPncvV9eGA/vtnd3xEZXQiSt91kBSqK28yjxAqK/c3G6i7IX2rg6pzgqh
 hiH3/1qM2M/LSuqAv0Rwrt/k+pZXE+B4Ud42hwmMr0TfhNxG+X7YKvjKC+SjPjqp0CaztQ0H
 nsDLSLElVROxCd9m8CAUuHplgmR3seYCOrT4jriMFBtKNPtj2EE4DNV4s7k0Zy+6iRQ8G8ng
 QjsSqYJx8iAR8JRB7Gm2rQOMv8lSRdjva++GT0VLXtHULdlzg8VjDnFZ3lfz5PWEOeIMk7Rj
 trjv82EZtrhLuLjHRCaG50OOm0hwPSk1J64R8O3HjSLdertmw7eyAYOo4RuWJguYMg5DRnBk
 WkRwrSuCn7UG+qVWZeKEsFKFOkynOs3pVbcbq1pxbhk3TRWCGRU5JolI4ohy/7JV1TVbjiDI
 HP/aVnm6NC8of26P40Pg8EdAhajZnHHjA7FrJXsy3cyIGqvg9os4rNkUWmrCfLLsZDHD8FnU
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <3096e0c7-f215-4a51-9a84-b2b64514ffd6@portwell.com.tw>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/15/25 21:10, Yen-Chi Huang wrote:
> Adds a driver for the ITE Embedded Controller (EC) on Portwell boards.
> It integrates with the Linux GPIO and watchdog subsystems to provide:
> 
> - Control/monitoring of up to 8 EC GPIO pins.
> - Hardware watchdog timer with 1-255 second timeouts.
> 
> The driver communicates with the EC via I/O port 0xe300 and identifies
> the hardware by the "PWG" firmware signature. This enables enhanced
> system management for Portwell embedded/industrial platforms.
> 
> Signed-off-by: Yen-Chi Huang <jesse.huang@portwell.com.tw>
> ---
> V3->V4:
>    - Added select WATCHDOG_CORE in Kconfig
>    - Removed redundant retry logic from pwec_wdt_trigger()
>    - Added pwec_wdt_write_timeout() helper
>    - Handled second wraparound when reading min/sec in get_timeleft()
>    - Reworked DMI check and force parameter logic
>    - Fixed error handling for GPIO and platform device registration
>    - Fixed typos, log messages, and formatting issues
>    
> V2->V3:
>    - Reworked based on review from Bartosz Golaszewski
>    - Changed to use platform_driver and platform_device
>    - Updated GPIO to use .set_rv() instead of .set()
>    - Used devm_ helpers for request_region, GPIO and watchdog registration
> 
> V1->V2:
>    - Addressed review comments from Ilpo Jarvinen
>    - Add DMI system check to avoid running on unsupported platforms
>    - Add 'force' module parameter to override DMI matching
>    - Use request_region() to claim I/O port access
>    - Extend WDT timeout handling to use both minute and second registers
>    - Increase WDT max timeout from 255s to 15300s
>    - Use named defines for WDT enable/disable
>    - Remove dummy pr_info() messages
>    - Fix several coding style issues (comments, alignment, spacing)
> 
> ---
>   MAINTAINERS                        |   6 +
>   drivers/platform/x86/Kconfig       |  15 ++
>   drivers/platform/x86/Makefile      |   3 +
>   drivers/platform/x86/portwell-ec.c | 298 +++++++++++++++++++++++++++++
>   4 files changed, 322 insertions(+)
>   create mode 100644 drivers/platform/x86/portwell-ec.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d5dfb9186962..c52f819786dc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19132,6 +19132,12 @@ F:	kernel/time/itimer.c
>   F:	kernel/time/posix-*
>   F:	kernel/time/namespace.c
>   
> +PORTWELL EC DRIVER
> +M:	Yen-Chi Huang <jesse.huang@portwell.com.tw>
> +L:	platform-driver-x86@vger.kernel.org
> +S:	Maintained
> +F:	drivers/platform/x86/portwell-ec.c
> +
>   POWER MANAGEMENT CORE
>   M:	"Rafael J. Wysocki" <rafael@kernel.org>
>   L:	linux-pm@vger.kernel.org
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 43407e76476b..3ceeb70897eb 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -779,6 +779,21 @@ config PCENGINES_APU2
>   	  To compile this driver as a module, choose M here: the module
>   	  will be called pcengines-apuv2.
>   
> +config PORTWELL_EC
> +	tristate "Portwell Embedded Controller driver"
> +	depends on X86 && HAS_IOPORT && WATCHDOG && GPIOLIB
> +	select WATCHDOG_CORE
> +	help
> +	  This driver provides support for the GPIO pins and watchdog timer
> +	  embedded in Portwell's EC.
> +
> +	  Theoretically, this driver should work on multiple Portwell platforms,
> +	  but it has only been tested on the Portwell NANO-6064 board.
> +	  If you encounter any issues on other boards, please report them.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called portwell-ec.
> +
>   config BARCO_P50_GPIO
>   	tristate "Barco P50 GPIO driver for identify LED/button"
>   	depends on GPIOLIB
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index 650dfbebb6c8..83dd82e04457 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -92,6 +92,9 @@ obj-$(CONFIG_XO1_RFKILL)	+= xo1-rfkill.o
>   # PC Engines
>   obj-$(CONFIG_PCENGINES_APU2)	+= pcengines-apuv2.o
>   
> +# Portwell
> +obj-$(CONFIG_PORTWELL_EC)	+= portwell-ec.o
> +
>   # Barco
>   obj-$(CONFIG_BARCO_P50_GPIO)	+= barco-p50-gpio.o
>   
> diff --git a/drivers/platform/x86/portwell-ec.c b/drivers/platform/x86/portwell-ec.c
> new file mode 100644
> index 000000000000..a16dcd96eab2
> --- /dev/null
> +++ b/drivers/platform/x86/portwell-ec.c
> @@ -0,0 +1,298 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * portwell-ec.c: Portwell embedded controller driver.
> + *
> + * Tested on:
> + *  - Portwell NANO-6064
> + *
> + * This driver provides support for GPIO and Watchdog Timer
> + * functionalities of the Portwell boards with ITE embedded controller (EC).
> + * The EC is accessed through I/O ports and provides:
> + *  - 8 GPIO pins for control and monitoring
> + *  - Hardware watchdog with 1-15300 second timeout range
> + *
> + * It integrates with the Linux GPIO and Watchdog subsystems, allowing
> + * userspace interaction with EC GPIO pins and watchdog control,
> + * ensuring system stability and configurability.
> + *
> + * (C) Copyright 2025 Portwell, Inc.
> + * Author: Yen-Chi Huang (jesse.huang@portwell.com.tw)
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/acpi.h>
> +#include <linux/bitfield.h>
> +#include <linux/dmi.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/init.h>
> +#include <linux/io.h>
> +#include <linux/ioport.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/sizes.h>
> +#include <linux/string.h>
> +#include <linux/watchdog.h>
> +
> +#define PORTWELL_EC_IOSPACE              0xe300
> +#define PORTWELL_EC_IOSPACE_LEN          SZ_256
> +
> +#define PORTWELL_GPIO_PINS               8
> +#define PORTWELL_GPIO_DIR_REG            0x2b
> +#define PORTWELL_GPIO_VAL_REG            0x2c
> +
> +#define PORTWELL_WDT_EC_CONFIG_ADDR      0x06
> +#define PORTWELL_WDT_CONFIG_ENABLE       0x1
> +#define PORTWELL_WDT_CONFIG_DISABLE      0x0
> +#define PORTWELL_WDT_EC_COUNT_MIN_ADDR   0x07
> +#define PORTWELL_WDT_EC_COUNT_SEC_ADDR   0x08
> +#define PORTWELL_WDT_EC_MAX_COUNT_SECOND (255 * 60)
> +
> +#define PORTWELL_EC_FW_VENDOR_ADDRESS    0x4d
> +#define PORTWELL_EC_FW_VENDOR_LENGTH     3
> +#define PORTWELL_EC_FW_VENDOR_NAME       "PWG"
> +
> +static bool force;
> +module_param(force, bool, 0444);
> +MODULE_PARM_DESC(force, "Force loading EC driver without checking DMI boardname");
> +
> +static const struct dmi_system_id pwec_dmi_table[] = {
> +	{
> +		.ident = "NANO-6064 series",
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_NAME, "NANO-6064"),
> +		},
> +	},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(dmi, pwec_dmi_table);
> +
> +/* Functions for access EC via IOSPACE */
> +
> +static void pwec_write(u8 index, u8 data)
> +{
> +	outb(data, PORTWELL_EC_IOSPACE + index);
> +}
> +
> +static u8 pwec_read(u8 address)
> +{
> +	return inb(PORTWELL_EC_IOSPACE + address);
> +}
> +
> +/* GPIO functions */
> +
> +static int pwec_gpio_get(struct gpio_chip *chip, unsigned int offset)
> +{
> +	return (pwec_read(PORTWELL_GPIO_VAL_REG) & (1 << offset)) ? 1 : 0;
> +}
> +
> +static int pwec_gpio_set_rv(struct gpio_chip *chip, unsigned int offset, int val)
> +{
> +	u8 tmp = pwec_read(PORTWELL_GPIO_VAL_REG);
> +
> +	if (val)
> +		tmp |= (1 << offset);
> +	else
> +		tmp &= ~(1 << offset);
> +	pwec_write(PORTWELL_GPIO_VAL_REG, tmp);
> +
> +	return 0;
> +}
> +
> +static int pwec_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
> +{
> +	u8 direction = pwec_read(PORTWELL_GPIO_DIR_REG) & (1 << offset);
> +
> +	if (direction)
> +		return GPIO_LINE_DIRECTION_IN;
> +	else
> +		return GPIO_LINE_DIRECTION_OUT;

Just a side note, you'll get a static analyzer warning telling you
that else after return is not necessary.

> +}
> +
> +/*
> + * Changing direction causes issues on some boards,
> + * so direction_input and direction_output are disabled for now.
> + */
> +
> +static int pwec_gpio_direction_input(struct gpio_chip *gc, unsigned int offset)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static int pwec_gpio_direction_output(struct gpio_chip *gc, unsigned int offset, int value)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static struct gpio_chip pwec_gpio_chip = {
> +	.label = "portwell-ec-gpio",
> +	.get_direction = pwec_gpio_get_direction,
> +	.direction_input = pwec_gpio_direction_input,
> +	.direction_output = pwec_gpio_direction_output,
> +	.get = pwec_gpio_get,
> +	.set_rv = pwec_gpio_set_rv,
> +	.base = -1,
> +	.ngpio = PORTWELL_GPIO_PINS,
> +};
> +
> +/* Watchdog functions */
> +
> +static void pwec_wdt_write_timeout(unsigned int timeout)
> +{
> +	pwec_write(PORTWELL_WDT_EC_COUNT_MIN_ADDR, timeout / 60);
> +	pwec_write(PORTWELL_WDT_EC_COUNT_SEC_ADDR, timeout % 60);
> +}
> +
> +static int pwec_wdt_trigger(struct watchdog_device *wdd)
> +{
> +	pwec_wdt_write_timeout(wdd->timeout);
> +	pwec_write(PORTWELL_WDT_EC_CONFIG_ADDR, PORTWELL_WDT_CONFIG_ENABLE);
> +
> +	return 0;
> +}
> +
> +static int pwec_wdt_start(struct watchdog_device *wdd)
> +{
> +	return pwec_wdt_trigger(wdd);
> +}
> +
> +static int pwec_wdt_stop(struct watchdog_device *wdd)
> +{
> +	pwec_write(PORTWELL_WDT_EC_CONFIG_ADDR, PORTWELL_WDT_CONFIG_DISABLE);
> +	return 0;
> +}
> +
> +static int pwec_wdt_set_timeout(struct watchdog_device *wdd, unsigned int timeout)
> +{
> +	if (timeout == 0 || timeout > PORTWELL_WDT_EC_MAX_COUNT_SECOND)
> +		return -EINVAL;
> +

Below:

 > +	.min_timeout = 1,
 > +	.max_timeout = PORTWELL_WDT_EC_MAX_COUNT_SECOND,

This means the watchdog core validates the range. Why check it again here ?

> +	wdd->timeout = timeout;
> +	pwec_wdt_write_timeout(wdd->timeout);
> +
> +	return 0;
> +}
> +
> +/* Ensure consistent min/sec read in case of second rollover. */
> +static unsigned int pwec_wdt_get_timeleft(struct watchdog_device *wdd)
> +{
> +	u8 min, sec1, sec2;
> +
> +	sec1 = pwec_read(PORTWELL_WDT_EC_COUNT_SEC_ADDR);
> +	min = pwec_read(PORTWELL_WDT_EC_COUNT_MIN_ADDR);
> +	sec2 = pwec_read(PORTWELL_WDT_EC_COUNT_SEC_ADDR);
> +
> +	if (sec2 > sec1) {
> +		min--;
> +		sec1 = sec2;
> +	}
> +
> +	return min * 60 + sec1;
> +}
> +
> +static const struct watchdog_ops pwec_wdt_ops = {
> +	.owner = THIS_MODULE,
> +	.start = pwec_wdt_start,
> +	.stop = pwec_wdt_stop,
> +	.ping = pwec_wdt_trigger,
> +	.set_timeout = pwec_wdt_set_timeout,
> +	.get_timeleft = pwec_wdt_get_timeleft,
> +};
> +
> +static struct watchdog_device ec_wdt_dev = {
> +	.info = &(struct watchdog_info){
> +		.options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE,
> +		.identity = "Portwell EC watchdog",
> +	},
> +	.ops = &pwec_wdt_ops,
> +	.timeout = 60,
> +	.min_timeout = 1,
> +	.max_timeout = PORTWELL_WDT_EC_MAX_COUNT_SECOND,
> +};
> +
> +static int pwec_firmware_vendor_check(void)
> +{
> +	u8 buf[PORTWELL_EC_FW_VENDOR_LENGTH + 1];
> +	u8 i;
> +
> +	for (i = 0; i < PORTWELL_EC_FW_VENDOR_LENGTH; i++)
> +		buf[i] = pwec_read(PORTWELL_EC_FW_VENDOR_ADDRESS + i);
> +	buf[PORTWELL_EC_FW_VENDOR_LENGTH] = '\0';
> +
> +	return (!strcmp(PORTWELL_EC_FW_VENDOR_NAME, buf)) ? 0 : -ENODEV;
> +}
> +
> +static int pwec_probe(struct platform_device *pdev)
> +{
> +	int ret;
> +
> +	if (!devm_request_region(&pdev->dev, PORTWELL_EC_IOSPACE,
> +				PORTWELL_EC_IOSPACE_LEN, dev_name(&pdev->dev))) {
> +		dev_err(&pdev->dev, "I/O region 0xE300-0xE3FF busy\n");

... or failed to allocate memory.

> +		return -EBUSY;
> +	}
> +
> +	ret = pwec_firmware_vendor_check();
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = devm_gpiochip_add_data(&pdev->dev, &pwec_gpio_chip, NULL);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "failed to register Portwell EC GPIO\n");
> +		return ret;
> +	}
> +
> +	ret = devm_watchdog_register_device(&pdev->dev, &ec_wdt_dev);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "failed to register Portwell EC Watchdog\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static struct platform_driver pwec_driver = {
> +	.driver = {
> +		.name = "portwell-ec",
> +	},
> +	.probe = pwec_probe
> +};
> +
> +static struct platform_device *pwec_dev;
> +
> +static int __init pwec_init(void)
> +{
> +	int ret;
> +
> +	if (!dmi_check_system(pwec_dmi_table)) {
> +		if (!force)
> +			return -ENODEV;
> +		pr_warn("force load portwell-ec without DMI check\n");
> +	}
> +
> +	ret = platform_driver_register(&pwec_driver);
> +	if (ret)
> +		return ret;
> +
> +	pwec_dev = platform_device_register_simple("portwell-ec", -1, NULL, 0);
> +	if (IS_ERR(pwec_dev)) {
> +		platform_driver_unregister(&pwec_driver);
> +		return PTR_ERR(pwec_dev);
> +	}
> +
> +	return 0;
> +}
> +
> +static void __exit pwec_exit(void)
> +{
> +	if (pwec_dev)
> +		platform_device_unregister(pwec_dev);
> +	platform_driver_unregister(&pwec_driver);
> +}
> +
> +module_init(pwec_init);
> +module_exit(pwec_exit);
> +
> +MODULE_AUTHOR("Yen-Chi Huang <jesse.huang@portwell.com.tw>");
> +MODULE_DESCRIPTION("Portwell EC Driver");
> +MODULE_LICENSE("GPL");


