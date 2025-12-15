Return-Path: <linux-gpio+bounces-29555-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 69482CBECA3
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Dec 2025 16:57:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E6EC30A894C
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Dec 2025 15:51:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C16C338F45;
	Mon, 15 Dec 2025 14:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dLT6GV62"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDC9338F39
	for <linux-gpio@vger.kernel.org>; Mon, 15 Dec 2025 14:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765807497; cv=none; b=htB8ybhhQhr9TsYGzUJjoNy+O643GWqrkRwwwLqhxw+H1uyJCf1/aOgMUNmnydo+2RcK0dOVwQv1WPMn2qfToyZTa0n8NKq245cDXe74vpkBQPwN75J9m0uUYs7lh1pX0NE5fo+8SuWPO9uMjvWsJdbw6wZ+n7A0vjOa/TIqGcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765807497; c=relaxed/simple;
	bh=KI9QIWcad/B9ZjYeffUF4N7PpYb0fDIpzH9w8RVTAyc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LSTHhPqUdjK2ZE/Yn7nw47rOK5/r8H5hNsSUM1JPx1sdIls8am4SNRngE4UEayLF9zPAXKm+hrOWlDEL1PkgwVBkgt1K41dTSBAtt7uC5/KCsl9dswyvBEsROrXJposza5DlTpt2sPi9jpNi89fbFWyEpV8zj9T6R8hU92IS9Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dLT6GV62; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-29f1bc40b35so49648575ad.2
        for <linux-gpio@vger.kernel.org>; Mon, 15 Dec 2025 06:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765807493; x=1766412293; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=eiURzUZDdB4fxsl1ptJaHGccRecrpuUcKuZLpsQ1g5U=;
        b=dLT6GV62XPJqC3P1M1WXu15g5BNPw68iYdTSehV2oSEyp6eKeByNbqqba77ale8WYw
         zWYXla8p6sE+E1miUzmDn0iFZM2ow1d9QODCNqQTG4RlUOPpsviLjHZ2rLS88SIoJSJN
         AcTiOB0g0x8TBDLl3+hhcIwgpKXTyzLO6yhlafGeMJIzadVStML+JAmrMOmGipdGXDC1
         EN7lM4ce2FQoUOGFFNbEBuW2EOBeEZFv7PG5mjr87P81w8eUOmjUisX3hA/n/GEZLr2m
         fwD2nD2WBaK7WHA44zvVLQ1de0tsW/VrJraTQzK/YYRr+4dZrcfX9H9IWIyr3WFxMuIB
         Seng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765807493; x=1766412293;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eiURzUZDdB4fxsl1ptJaHGccRecrpuUcKuZLpsQ1g5U=;
        b=enpx128sCBnCk86BA57SEY9TDs9V9uIb16+M+tx705DUqvtm0clnAfzCVbUbOPvxqM
         +unT14qyQiWrUt0JacIgZvcJwj6mDhNDj2Apx2L9ZLWR2SmMT92XVfc7MX+JVKPu9JoI
         SYNHBTXgX4qol0A9WowneSWl4pqSf6vsSL49m/+BLDYk4vQEGT50jeb+ITGTb60O1DCK
         +Zf/yEIFh6Kwr+0Ad6iiuAT7y5Nlpu5vaxAkULbd8+qjdD7DXy58oPzQlsljiG44xDsK
         HrQZlXX+9bX43sbK1uarFWUit3Y2yNUZY3vCH1qF5E0jWDtJhZxzcIeHuH8CfaanwVMS
         9RjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUF0JDL/fAC4w1DZk87JOSmoD2cU63tRhjs/XpOmLPJqp8Bc1O9/fy+FwQD6/ZosfgxLrPuEyw6+DEx@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2fo7+id/izyGR9q+Q0EIpSwl+VwrR12IvQbhMGDj6t/eYU+5d
	kDltYBnUqYXuQxR3Om7dwIM+i93/bzcqy3elyl+YTesubpVbbIUZdQDW
X-Gm-Gg: AY/fxX6w9Av8vNczscW41itDJgpS7iSKtH6170yvSbLcl3hU1ritmdJSDCXc8uZGADU
	gvfLx1/83MWHyaLqMFCWU6JZgYa9jl1YU4WaCEssjzHVMG82KBt2vFz88rhMaZaIFz2MWjp7Cvb
	JdqLqhZC/1Xq58PLIkBv+l8ogPBhc0nZuXwELuFoummn8QgHpnu3Q39TB5zZnWuR+fdheWCFhtq
	3c1XwR8sJ40q1ZCia593rIyVA3mVYwK99VAqJgaV532BnRfkp4lFeifjNpVDVOJ0k9RSvs6A680
	P02UvG/yNcimzGOoRgRjqxf3NBYXkMYS8ZmpT0UgY++cXLf391J8Phj2eYwrVoK8pyT/B9JBhHH
	Vk1TCv46RojVqoBP+EOB1H5czjG9g7PdQ7qKvRSs1Mayaxq/59lliJlW24zwdGrRFNsYfDkRQlp
	6zAkxWBCthuD1E8AV+wVa/h3qiFTtFVtdfM/2SHogovErsT/0EnENTmgh819M=
X-Google-Smtp-Source: AGHT+IGRL20LoecJ6pn1jdufZiNAGa9JtUlJUvG+45A3c3rMqwURCEs7Wewuin0iwJX6orhOUQMjxg==
X-Received: by 2002:a17:902:c94a:b0:2a1:deb:c46c with SMTP id d9443c01a7336-2a10debc778mr23305005ad.44.1765807493228;
        Mon, 15 Dec 2025 06:04:53 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29eea06b651sm137028605ad.94.2025.12.15.06.04.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Dec 2025 06:04:52 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <94e647ec-3cd4-4475-b064-064916cf83bd@roeck-us.net>
Date: Mon, 15 Dec 2025 06:04:50 -0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] hwmon: ltc4283: Add support for the LTC4283 Swap
 Controller
To: Tomas Melin <tomas.melin@vaisala.com>, nuno.sa@analog.com,
 linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>
References: <20251204-ltc4283-support-v4-0-db0197fd7984@analog.com>
 <20251204-ltc4283-support-v4-2-db0197fd7984@analog.com>
 <c655d548-85be-4c42-a802-d9342ea90aed@vaisala.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <c655d548-85be-4c42-a802-d9342ea90aed@vaisala.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/15/25 00:20, Tomas Melin wrote:
> Hi,
> 
> On 04/12/2025 18:15, Nuno Sá via B4 Relay wrote:
>> From: Nuno Sá <nuno.sa@analog.com>
>>
>> Support the LTC4283 How Swap Controller. The device features programmable
> 
> I think You mean hot swap controller?
> 
>> current limit with foldback and independently adjustable inrush current to
>> optimize the MOSFET safe operating area (SOA). The SOA timer limits MOSFET
>> temperature rise for reliable protection against overstresses.
>>
>> An I2C interface and onboard ADC allow monitoring of board current,
>> voltage, power, energy, and fault status.
>>
>> Signed-off-by: Nuno Sá <nuno.sa@analog.com>
>> ---
>>   Documentation/hwmon/index.rst   |    1 +
>>   Documentation/hwmon/ltc4283.rst |  266 ++++++
>>   MAINTAINERS                     |    1 +
>>   drivers/hwmon/Kconfig           |   12 +
>>   drivers/hwmon/Makefile          |    1 +
>>   drivers/hwmon/ltc4283.c         | 1719 +++++++++++++++++++++++++++++++++++++++
>>   6 files changed, 2000 insertions(+)
>>
> 
> This is quite a big patch, I wonder would it ease review to try to add a
> minimalistic implementation and after that add new features one by one...
> 

Please don't. I'll end up being the one person who will have to review it,
and those piece by piece driver submissions often end up taking much more time
to review than a single patch because the initial pieces miss the big picture.

Guenter


