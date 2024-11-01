Return-Path: <linux-gpio+bounces-12449-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0189B8F6F
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 11:41:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 19F041F23B71
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 10:41:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1173719924F;
	Fri,  1 Nov 2024 10:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VWdzsjOF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4FA196D80;
	Fri,  1 Nov 2024 10:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730457485; cv=none; b=j9wsvWaxZ7o4v1gUQ0TDoF3/mphEQ3aQuVtLRDU8uYjINfKug+FGpoCaYZlBZui+0FiWreSmHeduCuzVdyvBWlNjmsg9LloePfk2XoPLd6nHFTqcZ3vQRqcgZbSjeyhBU2muljBsJEIpr91tAISPQgjJYxpQpQkoRZKzFKjza/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730457485; c=relaxed/simple;
	bh=K9Fo9jOhvutMpQfGT6OemRF2zGeJZ8UFy1UgkNMjhi8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n7OPz5h+aDECpfsFw1oscfRZoWg3EfyGTKrS049frVKML3ip2PWBXp/ZSkQMFYLdrAzeClBuKlSQROyzE/65zvfEYMNIizdP9na6CDcPq+YdIrUD+bKCGQEKkPI771MbU/RpPPKAnBav81aDJnbptc7POBTkr3H68r+ObZqRth4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VWdzsjOF; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-720b2d8bcd3so1387934b3a.2;
        Fri, 01 Nov 2024 03:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730457483; x=1731062283; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cp4E9ZoMJbWuoGd6QUijQjB0fFBLDvUuHj1Ros/rrGE=;
        b=VWdzsjOF6aTLJQfOcQkgPF1oVEC+WfWqqYfT5OXWh4RdbgH88WonnEZRYzmWVmkAZz
         ineVmI1t91Z+7jmHa4c4d2uvDp2/eRxP52tpzhVwXeJiRzSdMRrmsn+tTrIVPFhAAWTm
         xPapF8Agu8N8eePzSD16qN3GUk6FeGw356KTYXU+X6aQp6M6ixLzbR/D3yeBjPL+Yiss
         RDqcpmMXpecRarE7pVkjCrOoJrE8+s9AOZrctlmyVKJcGMsqx1GveIKvzS1MgEzqLxs2
         b7sOL4Qo/zD49HrcKvZFbkVhzP10jjHR7lC+dYXtGr0+PkASXBBIIo1hvv98s79A9+05
         ex+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730457483; x=1731062283;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cp4E9ZoMJbWuoGd6QUijQjB0fFBLDvUuHj1Ros/rrGE=;
        b=bRtFZ+2eRVLtXEcwneiavfo/iSYkA0W9RKe8AUIYCpDbycp5xsVF3Aow0cxsbh6nCm
         L7/b6ODAOGH1mHIHTBHNWc6Rcb39D6BgEtMYmO8ofTKTynfwN8Y4IBKfJ6IkbDLvNqXV
         fyM3LLJ18bpenKfxrhksYzxgsRMmMaXchQXyZEJTCGWozTfxDqZl33wwDxF4kCLxTZTd
         qoDIYytrGXn+g4bibA5CDnRIJKhYN4ofkI4ledlQF5r9ktRPee/lI9lXYizgQn3njYTa
         x1aT0c+cD/2PdIObTa3qBBGR8PivvNVIhN6ygnICzmhZeD8CWDObDszuPG2YG7eq0bGB
         g+JA==
X-Forwarded-Encrypted: i=1; AJvYcCVA80Y9iFeusAHskmS1sff+FKQdDuBXIwCsmHLZZuckmVpdPjLvZ/y/ltvVkvvrzWQMTCO+OjOjCE7Qonwv@vger.kernel.org, AJvYcCX1Tu/flFr3CCjtwJC++HxNHdNuI6Y7IiFqFNdrIq2ZoFdVgLethdtfvFm1MMFQAUGnAGYzqk9wEsYQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0tS2/8tJXqOGhH40SjHRb6MsrZx8Qpsruv96q+QXh4lDwMzZt
	MRur+XgZ5nXrOxEBwzSt0VIkwo6tSKItdVXsvZ8bs2joKImybDTG/rAc7ukT
X-Google-Smtp-Source: AGHT+IH87Ar7hihxio7Aa2XPrH4mjhHIrHkQdcFBR+A66+wLfkd4DXrCBCqtaPyGRCN7MxKnL1dHsg==
X-Received: by 2002:a05:6a20:e607:b0:1d9:1a77:3875 with SMTP id adf61e73a8af0-1d9a85358camr27251994637.42.1730457483339;
        Fri, 01 Nov 2024 03:38:03 -0700 (PDT)
Received: from ?IPV6:2409:40f2:1005:5df4:10a1:b095:a33a:42b3? ([2409:40f2:1005:5df4:10a1:b095:a33a:42b3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ee452a995bsm2243578a12.21.2024.11.01.03.38.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Nov 2024 03:38:02 -0700 (PDT)
Message-ID: <f2fc8479-6b45-4fb6-904d-399317d7e74d@gmail.com>
Date: Fri, 1 Nov 2024 16:07:58 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] gpio: fix uninit-value in swnode_find_gpio
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241022194624.34223-1-surajsonawane0215@gmail.com>
 <20241026090642.28633-1-surajsonawane0215@gmail.com>
 <173037839477.7100.6092134366756840133.b4-ty@linaro.org>
Content-Language: en-US
From: Suraj Sonawane <surajsonawane0215@gmail.com>
In-Reply-To: <173037839477.7100.6092134366756840133.b4-ty@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31/10/24 18:09, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> 
> On Sat, 26 Oct 2024 14:36:42 +0530, Suraj Sonawane wrote:
>> Fix an issue detected by the Smatch tool:
>>
>> drivers/gpio/gpiolib-swnode.c:78 swnode_find_gpio() error:
>> uninitialized symbol 'ret'.
>>
>> The issue occurs because the 'ret' variable may be used without
>> initialization if the for_each_gpio_property_name loop does not run.
>> This could lead to returning an undefined value, causing unpredictable
>> behavior.
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/1] gpio: fix uninit-value in swnode_find_gpio
>        commit: a14968aea637bbe38a99e6089944e4ad8e6c49e5
> 
> Best regards,
Thank you for applying this patch.

