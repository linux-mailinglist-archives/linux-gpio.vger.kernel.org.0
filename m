Return-Path: <linux-gpio+bounces-5864-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E448B2790
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Apr 2024 19:26:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F386D1C217FE
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Apr 2024 17:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52D0514E2F8;
	Thu, 25 Apr 2024 17:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f73AH+Uv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B12C14E2DF
	for <linux-gpio@vger.kernel.org>; Thu, 25 Apr 2024 17:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714065990; cv=none; b=mX3psPyGI4hQb/8AbCZnKZ006ZMiLDfSeyzNSY8co9u6XJND+GwSHacdjPnH/HdU+41UOuZ44GHBpHoQq3pwebphCdNrW1INA0adHDwWX/TMb6V04ulQrUSd1WlSxtzL+y68B9Pz8XwIVFFhWLj/YblZuwG098IkCyKIT7RSfKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714065990; c=relaxed/simple;
	bh=Po1ljQ7eoWzq/WDxwP6FdJhliggBW98Ff7CLurYurCA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mk0aimOucQEg36ef9jNDG3zyZDlMJQVCN/IZE4Bqj3+6so11V09VTLJtgKae8aLv19ByPYcxyxMyGSd1cecVG/NO0VWfFuQJHhAm0fA7RdOA+sfBLrGXJC/JbEg3CYjNNfUzGwFrkziLJ2uJ77yFdsao0qG2Iu8UP8eTtSVcCs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f73AH+Uv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714065987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I/w6o0gJnQBhi5RHHs3mWoMd83fjHst48Us5ZNZk3kM=;
	b=f73AH+UvLm4VFJMZe0Cj11UXTz3s56EyQB/+TApTBUJNm7MbELbdIv9wLEEJ6hYAYvVBol
	RwD4DdYpC62RglXVBV1qXUbe2uRVMreLey6a99Ud+s58cKO4m0mP9iTA2mmAFG4JiFfJLa
	Wn66J41Lq67AJ/UfBbu+nF+DBosU6aI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-jdhW7FKVM0uLbEBD8Ean5g-1; Thu, 25 Apr 2024 13:26:25 -0400
X-MC-Unique: jdhW7FKVM0uLbEBD8Ean5g-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a5190b1453fso74531866b.2
        for <linux-gpio@vger.kernel.org>; Thu, 25 Apr 2024 10:26:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714065984; x=1714670784;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I/w6o0gJnQBhi5RHHs3mWoMd83fjHst48Us5ZNZk3kM=;
        b=lsa4sMPNlt7iE1hjRLnImd9u0UGxVHwXeLoI+nyAe+BYHrYK3zvKjRUAyEcasgWy4p
         YGrIgk7KmpsTE1pgrddhSyiOQApk8IZkBZ03dMt2Xd34sAlbrb/t+JvaDBvsw0Sbcrbj
         inLs3IENs3MnnMrKmfW13AxtSuJQ+VcIK74aVsBcxccJN7jZCyHlNMoDXqtAwMvE91Ny
         DQYAqzLDQNiJuJiizyJpAXUJ51aY4LO6kGDL7WB/h/xrWZxpR4x+mAWOql7nzXihh63f
         FEKmkhhzbTcQWdSSWP1IDK8IG7Gho+uAuToYz2QJxAztp20mgkUd4JhDJ8kN+3/iYb0V
         r82Q==
X-Forwarded-Encrypted: i=1; AJvYcCV8EHT6CfLezs8jFbANN93qiGkaUhUZN9Y4f0jdKeNVg7ubwwb79C0j9RzBwnDIGyGy8Udnm/q50UiY/vCUOazbIiqFNOdfX9SqHA==
X-Gm-Message-State: AOJu0YyaR8P5gZJz43AVjm+IQrPdn0HHNyoEL12bo8h3BzfetwDrOiiZ
	i7XB7fZI+XOy2+hXH4AIHL6D9dB4MN4l57RQRdp2voK+3xxR5ULPr7TKn5yHz+UVlYBr7ZXdAtS
	VOSHYKHQmUYYu6arHxQFT7YDctER9+5p4kRfLEcgCj8+LUpZ8coWUA/C7Ejw=
X-Received: by 2002:a17:906:2b86:b0:a55:3f2f:4b40 with SMTP id m6-20020a1709062b8600b00a553f2f4b40mr231108ejg.68.1714065984561;
        Thu, 25 Apr 2024 10:26:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEweaKuz3eMwWJrng0edjEF9B1AvNbWdzDA8QCL2mjjgLRa4aJ38bLsqghjMCXy4lRNldi1Pw==
X-Received: by 2002:a17:906:2b86:b0:a55:3f2f:4b40 with SMTP id m6-20020a1709062b8600b00a553f2f4b40mr231087ejg.68.1714065984195;
        Thu, 25 Apr 2024 10:26:24 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a4-20020a1709062b0400b00a58bf7c8de8sm472026ejg.201.2024.04.25.10.26.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Apr 2024 10:26:23 -0700 (PDT)
Message-ID: <5ff49965-1e8b-409c-8110-1782143c908c@redhat.com>
Date: Thu, 25 Apr 2024 19:26:22 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] mmc: sdhci-acpi: Add some DMI quirks to fix
 various issues on Bay Trail devices
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>, Andy Shevchenko
 <andy@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20240410191639.526324-1-hdegoede@redhat.com>
 <CAPDyKFrkPm=JEaiwTcVdqtG0hePEu-D76ec89nzFiF2MxYOwgw@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAPDyKFrkPm=JEaiwTcVdqtG0hePEu-D76ec89nzFiF2MxYOwgw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4/25/24 6:21 PM, Ulf Hansson wrote:
> On Wed, 10 Apr 2024 at 21:16, Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi All,
>>
>> Here is v3 of my series adding DMI quirks to fix various issues on Intel
>> Bay Trail tablets.
>>
>> Changes in v3:
>> - Replace "mmc: sdhci-acpi: Disable UHS/1.8V modes on Lenovo Yoga
>>   Tablet 2 series sdcard slot" with a new patch from Adrian which
>>   actually fixes these modes:
>>   "[PATCH v3 2/6] mmc: sdhci: Add support for "Tuning Error" interrupts"
>>
>>   Note this is missing a Signed-off-by from Adrian since this started out
>>   as a quick test patch from Adrian.
>>   Adrian, can you provide your S-o-b for this patch?
>>
>> Changes in v2:
>> - Address a few small remarks from Andy and adds Andy's Reviewed-by
>>   to the patches
>>
>> Regards,
>>
>> Hans
>>
>>
>> Adrian Hunter (1):
>>   mmc: sdhci: Add support for "Tuning Error" interrupts
>>
>> Hans de Goede (5):
>>   mmc: core: Add mmc_gpiod_set_cd_config() function
>>   mmc: sdhci-acpi: Sort DMI quirks alphabetically
>>   mmc: sdhci-acpi: Fix Lenovo Yoga Tablet 2 Pro 1380 sdcard slot not
>>     working
>>   mmc: sdhci-acpi: Disable write protect detection on Toshiba WT10-A
>>   mmc: sdhci-acpi: Add quirk to enable pull-up on the card-detect GPIO
>>     on Asus T100TA
>>
>>  drivers/mmc/core/slot-gpio.c  | 20 ++++++++++++
>>  drivers/mmc/host/sdhci-acpi.c | 61 +++++++++++++++++++++++++++++++----
>>  drivers/mmc/host/sdhci.c      | 10 ++++--
>>  drivers/mmc/host/sdhci.h      |  3 +-
>>  include/linux/mmc/slot-gpio.h |  1 +
>>  5 files changed, 86 insertions(+), 9 deletions(-)
>>
> 
> The series applied for next, thanks!
> 
> I assume some/all these patches may deserve to get backported to
> stable kernels, but it looks like that may be better for you to manage
> by yourself!?

From my pov the entire series is suitable for stable, so if you can mark
them all for stable that would be great.

Regards,

Hans



