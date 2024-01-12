Return-Path: <linux-gpio+bounces-2164-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4BD82C0F1
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jan 2024 14:39:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E164F2863A9
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jan 2024 13:38:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 083D96D1A4;
	Fri, 12 Jan 2024 13:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gadgetoid.com header.i=@gadgetoid.com header.b="CohFd2hC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC865D91A
	for <linux-gpio@vger.kernel.org>; Fri, 12 Jan 2024 13:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gadgetoid.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gadgetoid.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40d6b4e2945so74917525e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 12 Jan 2024 05:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gadgetoid.com; s=google; t=1705066731; x=1705671531; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rZsHV1ORpQLKDLl75hn6/vwNVX7bG67nIs8VIFWd71M=;
        b=CohFd2hCn9xyDHQ1T3IokcYAtvMXmmtFqSt0B0lyXtxMk5eeyG76mn3y5wYBXfRLOr
         NarEiE+w1t65F+Ns0rZIv4ZFW2KpMqA6bGfaF+Mb+a3D8fO9AS5/J8E5h00bfmu7yX+a
         NVwEaUg6guRNPmzfS3koUSwh2AzVKUMph4qgJwQ6p3OnLmnrKvd2aFaQVb9XgQ9LYRyO
         UrplCTT8LPlGNN7PQrcb0ewJiNycg/qGoPHFFvYMh6CIU4al8ClEplquqExngvc9kvZj
         IGbp5ZRySi0if9kSmARbajJVA27uw/XipFI0ryotBd0GpPWhM2beZoiWZYNAxrRY6f4v
         wiyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705066731; x=1705671531;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rZsHV1ORpQLKDLl75hn6/vwNVX7bG67nIs8VIFWd71M=;
        b=txvgEHDxFBMPSU6AucFIfp/SepgFdXerORwDZ/ziU1G1nQudM6aDiIDF9cKUUBC0jf
         z/rnYRy9rrourOBWSt2kaiDiBWU36Mj4f4c+dAPUkrBzdJ1202kbDCRo2ty/uM3OvGLJ
         qTm0bmxml43Jc/hP7t/qIxSR0U2tuG9rio5GAANzU4xH3rdLCwHj0Mb16gkhyEWTjVNM
         j2T6ZMIuV7Ejon3z39nAfTuLBf1Q3E6e65R29GEk9FP0G59UGB624L89lcmVE5dxUwCF
         vsOKrWDZ22n6PAN74HXFLjN+K59Fqx5A48asU0XHBvstcnA8g7hBWIAsb1LeOdKyb8hM
         8rfQ==
X-Gm-Message-State: AOJu0Yyuykk/eJGoBqmg0Cjp/crGvv1YxjV3w2RANWMW4CpU5ALSSogQ
	P/V/ExR+B9HNnbqvj2r5PUEh+wwo63jibw==
X-Google-Smtp-Source: AGHT+IEkyUJnz4e65t5Cc/S29dW82TFSkmIGDR/4UCrZVePlCMdiwFWXcwk/O5XqAPUdXXahmCBDog==
X-Received: by 2002:a05:600c:5490:b0:40e:38c4:15b5 with SMTP id iv16-20020a05600c549000b0040e38c415b5mr512804wmb.49.1705066731556;
        Fri, 12 Jan 2024 05:38:51 -0800 (PST)
Received: from [10.10.1.230] (cpc91242-cmbg18-2-0-cust972.5-4.cable.virginm.net. [82.8.131.205])
        by smtp.gmail.com with ESMTPSA id p21-20020a05600c359500b0040e3488f16dsm5787083wmq.12.2024.01.12.05.38.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jan 2024 05:38:51 -0800 (PST)
Message-ID: <5521796b-d51e-42a3-831a-7fbf75247726@gadgetoid.com>
Date: Fri, 12 Jan 2024 13:38:49 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] pwm: pwm-gpio: New driver
Content-Language: en-GB
To: Nicola Di Lieto <nicola.dilieto@gmail.com>, andy.shevchenko@gmail.com
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-pwm@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, Rob Herring <robh@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
References: <20201209072842.amvpwe37zvfmve3g@pengutronix.de>
 <20201211170432.6113-1-nicola.dilieto@gmail.com>
 <20201211170432.6113-2-nicola.dilieto@gmail.com>
 <20210117130434.663qpp6noujptdyt@pengutronix.de>
 <CACRpkdawMpuznr-XC2uvZm8PvOj-jObpnbz6iptV-Q4OFxjesw@mail.gmail.com>
 <CA+TH9VnrsSQDUfvXk8c+q6Sx2Jc5TCN5XLYCRLtgv55-6voLWg@mail.gmail.com>
 <Y/YPtJK8nVBthCML@surfacebook> <Y/YuJoxkz+o0Omie@einstein.dilieto.eu>
From: Philip Howard <phil@gadgetoid.com>
In-Reply-To: <Y/YuJoxkz+o0Omie@einstein.dilieto.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 22/02/2023 15:00, Nicola Di Lieto wrote:
> Hello Andy
> 
> On Wed, Feb 22, 2023 at 02:51:00PM +0200, andy.shevchenko@gmail.com wrote:
>>
>> Seems not much interest neither from community nor from author. Maybe 
>> later
>> people will look into this?
>>
> 
> It's not lack of interest, but rather lack of time. I should be able to 
> have a look at this sometime the week after next.

I'd love to know if you're still likely to look into this.

As part of the shift away from memory-mapped GPIO and sysfs on Raspberry 
Pi, I have some legacy devices which need PWM on arbitrary pins and no 
canonical solution. As such- I am interested!

> 
> Nicola

