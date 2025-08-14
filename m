Return-Path: <linux-gpio+bounces-24391-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDB1B265F2
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Aug 2025 14:54:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96469A21A3D
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Aug 2025 12:54:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 562BA2FDC23;
	Thu, 14 Aug 2025 12:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jXYgdWRs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50022381AF;
	Thu, 14 Aug 2025 12:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755176072; cv=none; b=YtqR6rlqhI8bJQTWrUIa9WLFoqz63lrSv2Uo7hvh+CYKUWvk2/n2mDsHEzGUW9ZMlw/rxifUE9b4QUiG3jIApMcyCmFzu7BzZJLWepNExqaQ0NRfuVkLkqNV8twWYOMGTkWaXLPJAV/O1O8xE6pkiJlQ2OwMlgnyCvGQU8V0z38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755176072; c=relaxed/simple;
	bh=79DYR/FSySnGj58jpR+lKERjmTxA1ps/oCuSO/p5f+A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r0qGYn/Nn/Q9W8Zq3YC7kQ3yZFMqgK9ZxqE3WgX7p9vAq7zcH0ELIiVb9L3JOtQY35RKEaPo9RSXWT9N/VJTBW+xgb+0HSIS4gqIsIliyiLXom8Pw5pAew86YDVgTkqi6OJ0Z3D0VhDoko/lNF1XtyUKR/MLheFDJGisc+7MbT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jXYgdWRs; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-32326789e06so789697a91.1;
        Thu, 14 Aug 2025 05:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755176069; x=1755780869; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=D4vezvD0UN1NBqZx2IO67D3UdQ3PtFrtiqqOS6aavU4=;
        b=jXYgdWRsHavZMmimpEj8fJI6jFQZblbvX79QUK/ml2DhGcbhDUkQuRI+r24momtgW7
         hnei7GN5tbEiu6D/SOqWkTV+C+d1uK2Nh6+OYWrESrZ8gobZi7CRwd+XeoxqiGwNlCSI
         lmJ0GDLcJRB45JjRAh2KX2FWvteT3AGdRNQqjJw/JDhM5K+XP7LCOpD6vlajHtegeWzR
         WF4sC+DUvaLERWu3nv0z+q4Vg3EnClwO5bkaV0P5omKQHpqK5V+fwr3HOB5iZ3Xx9aIC
         SxCzsdYvDvNcvuXeEPRaeZcvAoSyzbzKWxAWVembXQP9N+3GlT38A+OFsQ4zg6H17af8
         FDkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755176069; x=1755780869;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D4vezvD0UN1NBqZx2IO67D3UdQ3PtFrtiqqOS6aavU4=;
        b=h7PtVk2bAWEsq7OCCxmBwOLE3ryHCoZ7LjRFuRumrOO6YajxkfPjgZOc0KHCpNnZ9Q
         S3fl7TMElb68xVfGUwSG/+LjaE6ljJKTOGyCUkMoRkic3H8XlJ2jVq1CNl2HxMhILKXb
         25NvJEIOrgtNv2eO4zhmbgskjER1zRy2biSesS3hUdHzN1T3GXUk7glxV8pUfvdpk3L1
         hL+W8QBB0Vi5r+pEftn1OafSpcgUR6kDpOMEP729W8izXfpULH7+TR1tllNo1f3nk19X
         pyc3q/yb7KJDPmCphK/rsigZHlGMYn5z4tLp63YUxu2rA9jV0rHA7iWv6ak8ketI4N/S
         /lgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDKYXnj7rlq6awbORlVlN/21OkZ9DZYfstj45GVVqIX14s70Tn/VM/TfJ53hSnuTvF4m6Pg3wUdaM0@vger.kernel.org, AJvYcCUPNk2nXD5Ra0ahUnGh8nP/pu9a1io0VHAhXgJxSRlAt37Q0fnEoYyoN3CSCVC7jIeqf4QiSR8ZG7z8mfup@vger.kernel.org, AJvYcCURVMlY2szjIPrgcm59CCvVzc6qgma2F9R1ypdPagU8KV/sl95KKCjVwKRQpAhfnl9hADj4975Gpfws@vger.kernel.org, AJvYcCWVUjdig6neX5Zu7pzUoRZPhWqsKXaiMSr4+CgPJ7+KPHfD8efzUyQmJA5evio8H7WLMuM64GUQoHbP3A==@vger.kernel.org, AJvYcCXqHevt7/S2ED728M5dAmwZKU6PrMbDvC52qJ5FhoOhAwMqgz+4j1zbDlrEWPKZ1CpclUfepfauArUdvqA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4oEHidT0LkC18t4EPtjSNwhjb7CmqNHBxuYz5y9ZbAReVzcJ3
	sGvPJOCd0PyHf4mqZPMjEUu+ms1c7pyEbISz3BeGI0kfXhRDs/EQYhqW
X-Gm-Gg: ASbGncs6zI/4LuQlLxnIaK+AxkO02JpDo6ajxx0bF12oqTgIgVWW1hiM2+95vw+Yict
	Tvy4yWEJo9WH1S8U6BPN4m/Pl1HXBT0htchh6s8de22LvD/KeAyP16RwWXImPgzWMPm2DgbfNTT
	wKKipOB75mO7zmMOqMeUddYDE8WU6otSKctTPX1XceND23rv02HC0pOekN0DX1iJoc6C0D3z5fx
	7z8dWs4u5VpIp2f9+2bXtIdyvqhZmlQrWVzB72ZqWqiFFuew8lkaEKEklq+h0KKmJ4uN8GIqtSM
	U3/8Pt7qNM6NaeUSEW3hjTUEf4nnkH7cCoIcOhIW+z3HbYbMoTH7W1KP2STTxa5siMRUi48UIK8
	FUACvsVKiGhkPqrzUCFd6USVCOOTEt3VoAIiSA2DBeoU6F0v5cwfAWjOEJisulnZG6mELX9a+5V
	ZoPBfrNQ==
X-Google-Smtp-Source: AGHT+IHaHEZK+rsgVhBd79K2isJ1y9YJhHFHW7AHM/ShRsGlfgLw3beSNHxh3Y4Z+Hp+7fbepXvGWA==
X-Received: by 2002:a17:90b:3949:b0:31e:5cc7:133 with SMTP id 98e67ed59e1d1-3232b23a04dmr4361021a91.11.1755176069334;
        Thu, 14 Aug 2025 05:54:29 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32330fc3676sm1840266a91.9.2025.08.14.05.54.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 05:54:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <5713bb5b-3301-46bc-b30a-d2e4c58d1036@roeck-us.net>
Date: Thu, 14 Aug 2025 05:54:26 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] mfd: Add support for the LTC4283 Hot Swap Controller
To: nuno.sa@analog.com, linux-hwmon@vger.kernel.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>
References: <20250814-ltc4283-support-v1-0-88b2cef773f2@analog.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20250814-ltc4283-support-v1-0-88b2cef773f2@analog.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/14/25 03:52, Nuno Sá via B4 Relay wrote:
> The LTC4283 device features programmable current limit with foldback and
> independently adjustable inrush current to optimize the MOSFET safe
> operating area (SOA). The SOA timer limits MOSFET temperature rise for
> reliable protection against overstresses.
> 
> An I2C interface and onboard ADC allow monitoring of board current, voltage,
> power, energy, and fault status.
> 
> It also features 8 pins that can be configured as GPIO devices. But since
> the main usage for this device is monitoring, the GPIO part is optional
> while the HWMON is being made as required.
> 
> Also to note that the device has some similarities with the already
> supported ltc4282 hwmon driver but it is different enough to be in it's own
> driver (apart from being added as MFD). The register map is also fairly
> different.
> 
> Last time (for the ltc4282) I tried to add the gpio bits directly in the
> hwmon driver but Guenter did not really liked it and so this time I'm doing
> it as MFD.
> 
Nowadays I suggest that people use auxiliary drivers in such situations.

Guenter


