Return-Path: <linux-gpio+bounces-15468-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 453EDA2AC9D
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 16:38:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D86963A2FC2
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 15:37:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFD76225A30;
	Thu,  6 Feb 2025 15:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mv0SQezA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC80B1624C2;
	Thu,  6 Feb 2025 15:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738856278; cv=none; b=FLSkmOMA+6Ao8tQ3WF9/HqBARsFRQtaaY+9LKveik2xjKBh+krVZbjEm81raEDB4E8R1MCfiFniLE2wIBHH5p0ZYAkQOsOk/5djX6uKO1Kece0GS9MV5rfq/OBvb1KfJGXUxtq5f1bHZd2jtNXfxjXD/R42LkmDEIe1cIuXX9vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738856278; c=relaxed/simple;
	bh=ZlzDWmhB7UIdqvn9ZA3N4/Cp//44ZgbIgvl9u6GBTSw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hPVuupL5TWDSgocid7ZYElyJtA0dZlaDRt+7WATS7gbI1pMycLvu4UjX/f8rB6OoSOI6xMgqvu7VLERbVkd/Gj99VdLPMRSmtVZU1qWSRz8GSF8Yw8iJVJB5E0LoaceLOjhsLHWlJKLP0ur9p9D0rpFuRowrYoJv+WUmC6CZG/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mv0SQezA; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-38633b5dbcfso1077534f8f.2;
        Thu, 06 Feb 2025 07:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738856275; x=1739461075; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jEzCsc/q3svFkwQlOP5jPW9KfsGihf2HptC6MSm8Zw8=;
        b=Mv0SQezAljSzDTXu4u4cmxroalFl3GXAAeFKfyIqPNn3mkkcd7yMKylhFVr6wrjfWT
         E58bPFl6ifHLPsXQ0c4u5lPMhRRguPNwLgZe4HWSBJlbvzTQDzp+f7jGaVw6zannFijT
         wzv0bkTUeQdV4NNa+X5XAn4Cn4F2hWyHRLwTpVes1Z64jzSLVpAZ+gN/wO414n/PgeH+
         P3jjxjDKPpqfy8xulX1wDg2e+/8U8r/3iMgv6Lw3UfUv9TRyOWpKkSXfMJ5IeMl/6SKp
         7hjhvrOxHV9yrUflLqGlvYVWA+LvVJinSxFNIXOPoR30UuWqkVkBXibW9lYrYAwHU2hd
         kB2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738856275; x=1739461075;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jEzCsc/q3svFkwQlOP5jPW9KfsGihf2HptC6MSm8Zw8=;
        b=Chkkk30bssbXQmW5UUAUMzdaFYnO8jxypap17a5TtxooL0sSHztm/iEKGXnGoLsAZt
         491GfV+kcRFnxLlfPgqDI5TnpjJvrns+6DtQpyN23Kr3oTnCxkudZna++IIzcjC1QZED
         vjagv6gIJrTt3TE0No5tUzvcU8bhCLzuSrm8jlQJgZsepWLm3/xkfUnYRouaIZCX6HjR
         QfxbDRfbGhUYvlMA65v2J8zIEfmcqwH5cXT3xy4BqErfyPIEm+nAdaalMUe7yjYV3L5z
         yKEzqG2SzHcq5aAQmMjCbxlg0F5ZlJh4aHGNovkrgX1iqAeisAD4kYJum5QlSFgFk20m
         U0HQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSHbG/BK83yFyWr3SzEfD+JwMjSiuYIsLSFp8ltTvJ//mof/gUr3Ib3ifkhjqu9d/4+lLV+UybodQj8bwx@vger.kernel.org, AJvYcCVykrwdB5bxB24Fi6XzBVqq+0EKFgHtOulxvResFtNYrIYbfgf9I4Xd8+P1WMxDnMmceX7tQhdqTzLi@vger.kernel.org
X-Gm-Message-State: AOJu0Yy49IuxvybEbpFxozifQI5SBlRnNiSaK0i+432BMEoiZfAViiJC
	r0P8CKC+Lmfe64nNgnwai8OedX58+d1UXwT0r0LAwP2OERSlBfla
X-Gm-Gg: ASbGnctYTWROFHO13x9avT7bA4uGrOxaj6ZPyzUbG7+n3ehcbAAcJo3R3SaFKCoN1V1
	5Ri6j4+Al35zLXiZI/P3vtLmMaonKjihtJ/sofU9XdDKPPr04FqAYuHMOuDrrclRYrxdfEmFHxm
	qTq3Kbjs1FOUG3YwBGKsLZ9ClRgANICr0zUkPAiRDdZcAPSNy4am7boXJT+ipBy8AZ8n+3Ww9DW
	L1moaDTn59FKYSEWGvB04Jdl1HX6HTFMYl7D0ELXNyVbzhwWGIJF4tKOYyB4Z3KiM+MGtxIn0zw
	lMF5UnJT4xTQ1avpfILbZcVaRa7gVMHiTUAPNimdmuE8nVTRM/w1mltugzsE
X-Google-Smtp-Source: AGHT+IHXKfLaVddaZ9De9vD/kKyUtDaf5GMgLO3NiS4kYqU17vHau1zvLc+wrE4ONfty4SCGtsNyqw==
X-Received: by 2002:a05:6000:144f:b0:38a:88ac:ed14 with SMTP id ffacd0b85a97d-38db489322dmr7061870f8f.19.1738856274668;
        Thu, 06 Feb 2025 07:37:54 -0800 (PST)
Received: from [192.168.50.244] (83.8.206.8.ipv4.supernova.orange.pl. [83.8.206.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab772f84383sm116408566b.50.2025.02.06.07.37.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 07:37:54 -0800 (PST)
Message-ID: <981d534a-a439-40c2-bd24-2e518846580e@gmail.com>
Date: Thu, 6 Feb 2025 16:37:52 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] gpio: bcm-kona: Various GPIO fixups
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Ray Jui <rjui@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Markus Mayer
 <markus.mayer@linaro.org>, Tim Kryger <tim.kryger@linaro.org>,
 Matt Porter <matt.porter@linaro.org>, Markus Mayer <mmayer@broadcom.com>,
 Christian Daudt <csd@broadcom.com>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20250130-kona-gpio-fixes-v1-0-dd61e0c0a9e7@gmail.com>
 <CACRpkdYVeHKzH7dgXfqFSDCvxBe04FJVDx5LGR9G7Og13bpDNQ@mail.gmail.com>
Content-Language: en-US
From: Artur Weber <aweber.kernel@gmail.com>
In-Reply-To: <CACRpkdYVeHKzH7dgXfqFSDCvxBe04FJVDx5LGR9G7Og13bpDNQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6.02.2025 10:34, Linus Walleij wrote:
> Hi Artur,
> 
> On Thu, Jan 30, 2025 at 6:10 PM Artur Weber <aweber.kernel@gmail.com> wrote:
> 
>> Fixes two issues that were preventing GPIO from working correctly:
>>
>> - Lock/unlock functions tried to write the wrong bit to the unlock
>>    registers for GPIOs with numbers larger than 32
>>
>> - GPIOs only initialized as IRQs did not unlock the configuration
>>    registers, causing IRQ-related configuration (e.g. setting the IRQ
>>    type) to fail.
>>
>> Also includes a minor fix to add a missing newline to an error message.
>>
>> Tested on a Samsung Galaxy Grand Neo (baffinlite rev02) with a BCM23550
>> (DTS not yet in mainline).
>>
>> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> 
> Looks good to me, do you want to resend the patches picking up the
> Acks or do you want me to apply as-is?

I'll send a v2 in a second with the style fixes suggested by Markus[1].
After that, it should be good to go.

> Should this go in as urgent fixes (-rcN) or as nonurgent?
> 
> The DTS not being mainline suggests nonurgent but are there
> other systems suffering?

Non-urgent is fine. AFAICT the only upstream-supported Broadcom Kona
devices at the moment are old Broadcom dev boards; while they
technically are also affected by the bug, I doubt anyone's actively
using them. As for the devices I'm testing with, there's still quite
a few fixups I plan to make before I consider them ready to upstream.

Best regards
Artur

[1] https://lore.kernel.org/lkml/CAGt4E5sqd_Aojk+boD5K5EiRfOsiU+jYY5EV0DP6TFut291HnQ@mail.gmail.com/

