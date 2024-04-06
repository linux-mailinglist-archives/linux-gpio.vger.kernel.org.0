Return-Path: <linux-gpio+bounces-5141-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AA389AB48
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Apr 2024 16:10:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C8AF2822E2
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Apr 2024 14:10:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D3E1376E4;
	Sat,  6 Apr 2024 14:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FCTPSgLk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0033838F
	for <linux-gpio@vger.kernel.org>; Sat,  6 Apr 2024 14:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712412599; cv=none; b=ZNkdL5FAjvBcFdlAV4jGd2UTwa+gXAqvZO2zqeqpl0+cqodhVFvDvbbJ0vQR6s5qIEVQ28T9SM+gPPmKcdwnztb97nfumc+e5m566appdnZd1y1KUETEX/9Zuyv097nogyo3RE+IGBj0+Z+Vt3zAOl7s+WyQxfhm9m57GVcOnFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712412599; c=relaxed/simple;
	bh=5Pihc9NdGBvBPYnqqPPipWgKZ7XV9uPinyL/+/vwTwk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hMDVGi8zkekwSb4oWodngxmttpwf4B7pW5vIS0ypD3yVOHT1E8ejNNVZuBPmhjq30GXCPy3IMqN+oLgSb+SHFNpxejn3zgVBzGojHqKAcAL/1b/VDfpKmjcXplQbtEs+Ga1OT32kSbTCRUTDt+M0A+3XyqvtqQzPH3WJu41Kb40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FCTPSgLk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712412596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yReLHHVbshm2DVEk6YMG372Ltd6k8TP0m98y+dq54Oo=;
	b=FCTPSgLkdt1Wst9tZxe1TMa0g/CgrhM5gwKQyLRrlIHS4zkLj8jtDqD3S/CzB0I7voQuiW
	d9Pym69q6irFzznCvsUC/45zVPBfB99aQ60MOjMbONIb9MDuAeRU/+kCeRrltmGQgQVeiz
	LDlvUizaxCMv3U2e/ksQiyYTBty23pI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-d8f8YmrYOb6WVcacNolJ0Q-1; Sat, 06 Apr 2024 10:09:54 -0400
X-MC-Unique: d8f8YmrYOb6WVcacNolJ0Q-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a51c122720bso14575366b.2
        for <linux-gpio@vger.kernel.org>; Sat, 06 Apr 2024 07:09:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712412593; x=1713017393;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yReLHHVbshm2DVEk6YMG372Ltd6k8TP0m98y+dq54Oo=;
        b=KuGF7keTsOW+pOc+mOmyClPB3+kTxeg/jYUEGlVH0I9XCMKuXB+Z3yi9gtsP6T3Crs
         9y0nQxE4aouD1SDTlbBQvEqGSBz1/Uop1zrq0/Bu44HZ3n6y85fVgr7+6z5FKdP401vn
         7o35gQZHb4anicnh0S6nBH52NGj5+iYyuRjXWBIgDNSxspxzUSO1CAHwNuEKvC48G28B
         qckQ99ENI+uNGpi/bPtNF1JyTgu75IIX1IyCz/+EHzFh2JFwb9y1uu44OsZmKHaCbymm
         yrfRDc9OBd54AmdB/Ei4mqnWBofC8fOWI7umqe/bEhb9Yc7KSoY6t9WZAFel8zAFHNZE
         KcyQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6sqUNewQqs1d99Ytoh/joVyWlIpK0KDuVocXINcQS6xNDan5GilHqiMg9D9GxWoNH53HefYu0KfePuzL6CbgDF1rW/jw1k7wHuw==
X-Gm-Message-State: AOJu0YymcT46MfZHA5K6CjbR8taKab7s3hyeWouMirgLyk6gHy/JPq5+
	ZRgjLs7AzD/zOYdNBcwENB0Uo/y0hq+GIFTql0h8prHYvwgWQMEUbUwiHP2AWL8VooMnykTtNqO
	BcMvppKRc1KwmF5sW8QaWXsACTeGxyTxshEyt3Nd8GB1PJaubx8NySyhEIPw=
X-Received: by 2002:a17:906:81ca:b0:a47:2087:c26f with SMTP id e10-20020a17090681ca00b00a472087c26fmr2682307ejx.73.1712412593300;
        Sat, 06 Apr 2024 07:09:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOucjPQQKrjT1VGeapoeItfJWLDIyZQh+99z4/OT74M/ChZpJLZVGY+p5m+fXBSoT4KypTPA==
X-Received: by 2002:a17:906:81ca:b0:a47:2087:c26f with SMTP id e10-20020a17090681ca00b00a472087c26fmr2682296ejx.73.1712412592974;
        Sat, 06 Apr 2024 07:09:52 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id lg11-20020a170906f88b00b00a4e2db8ffdcsm2023928ejb.111.2024.04.06.07.09.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Apr 2024 07:09:52 -0700 (PDT)
Message-ID: <33c6286a-0362-4e38-aa80-5e845b1b8fe9@redhat.com>
Date: Sat, 6 Apr 2024 16:09:51 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] pinctrl: baytrail: Fix selecting gpio pinctrl state
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 linux-gpio@vger.kernel.org
References: <20240406123506.12078-1-hdegoede@redhat.com>
 <CAHp75VdmtmV4eEdohrbg9zqbG=mSMJhN2FV9AHWojtQe+hSPBg@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VdmtmV4eEdohrbg9zqbG=mSMJhN2FV9AHWojtQe+hSPBg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 4/6/24 3:52 PM, Andy Shevchenko wrote:
> On Sat, Apr 6, 2024 at 3:37 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> For all the "score" pin-groups all the intel_pingroup-s to select
>> the non GPIO function are re-used for byt_score_gpio_groups[].
>>
>> But this is incorrect since a pin-group includes the mode setting,
>> which for the non GPIO functions generally is 1, where as to select
>> the GPIO function mode must be set to 0.
>>
>> So the GPIO function needs separate intel_pingroup-s with their own mode
>> value of 0.
>>
>> Add foo_gpio entries for each function to byt_score_groups[] and make all
>> the byt_score_gpio_groups[] entries point to these instead to fix this.
>>
>> The "sus" pin-groups got this correct until commit 2f46d7f7e959 ("pinctrl:
>> baytrail: Add pinconf group + function for the pmu_clk") added support for
>> the pmu_clk pins following the broken "score" model.
>>
>> Add pmu_clk?_grp_gpio entries to byt_sus_groups[] and point to those
>> in byt_sus_gpio_groups[] to fix this.
> 
> I'm wondering if it's possible to add some code to imply all these. I
> mean to have a comparator to the _gpio in the naming and generate them
> at runtime and add. In this case if we add / modify the original one
> the rest (for _gpio cases) will be done automatically.

Yes some better solution for this would be nice but I don't have time
to work on this, so I suggest to just move forward with this fix for now.

Regards,

Hans



