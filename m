Return-Path: <linux-gpio+bounces-4999-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D38B895593
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Apr 2024 15:42:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 332EC1C20BAB
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Apr 2024 13:42:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA72085283;
	Tue,  2 Apr 2024 13:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PIN+aeL1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACFB884FA9
	for <linux-gpio@vger.kernel.org>; Tue,  2 Apr 2024 13:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712065267; cv=none; b=S7KR4yc8/qfhcyJBz5oaeisP685dQiN6+c3uFg5Kd8MXCS9Dg1MFvC++iNLsC6NQN1ipztE5yrcbBaI+9MCBe+SWJCJL8pRyODvRWhAnEiLjqAv1VnM67JBabNz1iZvcwtWN6gro0lqWiWrz3SktGl7lZnhLwCtp86tcwCkrPLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712065267; c=relaxed/simple;
	bh=fSmUEcJkMiaEn5CB8sSP3SxvGvNVpxw0TJkE/LxdJVc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TLg/9DADVvml6awIJmvzAvQYPtUCeE++IBVNHo3Xl1ZgSD4i/16h2f8Ou6A9wBcoRbWiFyr546f4CvFHEeyODblvHo71KPahrEdrx04ztbEpXIeXx9Spp/YRe4j/AeehzhjK793NNIROHLHrgTMJCBBxQn2wahjeFyW+9TvxodU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PIN+aeL1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712065264;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c1iNybg/HGgjMFLmB8r7gE55WyymvOpYihwbPUaOsCw=;
	b=PIN+aeL13Lq8EovH9xu6brrmjQu+s0UD32AWZLIKz+jLqIeBGI9qC2pwt15/912B4r3IjR
	wBJF5FcnE93VX8MUhGuVd/UsvlLjNeAGm/fs3l5Vz52lFjfexTBA2CI2gDzLr2uFO+93M2
	OnZeknSH1vU6xOcWubFHxEpF2gznxsU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-680-s8Gx2uBRN0CtsW4XhN9aIA-1; Tue, 02 Apr 2024 09:41:03 -0400
X-MC-Unique: s8Gx2uBRN0CtsW4XhN9aIA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a46bae02169so528323866b.1
        for <linux-gpio@vger.kernel.org>; Tue, 02 Apr 2024 06:41:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712065262; x=1712670062;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c1iNybg/HGgjMFLmB8r7gE55WyymvOpYihwbPUaOsCw=;
        b=P5lzpRwfwaQiKlrNOzpjaKzJZFdEXtvCMu6ymEAF/Xp+2CxbF2eigBU3UQr+zslHrT
         07lBGHjXkWY/Y+xCBOXS/ZAYAXJ9TYPlrnk5L3Al8W1KpgpslTBSEvjOUV3N/VxRkpIM
         u1npCaVwIl2szI5TY7KQ14S7czpYPhZ9Af1xanUoi0vQu3qTlhT5+wT0h7zQK1hqd7Vv
         /lnzkgr+dz3pwTkdHyqW08d2+O3c3uIISU/R1o8d4aQc4SAphDreZ3PnV62KSVOfYoIu
         iqiau9MlUOj4/oAipKS7BWbaabZfjXDDdp+93m866tZSNSpwRCoTEob0dRHMRuCPCUgs
         FcHg==
X-Forwarded-Encrypted: i=1; AJvYcCVk1D46kwFjKNFatiV8a3486SlN8kUhPhrfKC1e1ZOPj5IcnTwvm+LywgzZaW2JECJinrwQIcN7Ui3ZEnnD4bSvhVtiPu7JTKlmaA==
X-Gm-Message-State: AOJu0YyRnVqIt/zD0kX/4v/oMyOjQsgRuWm/tbeUvVYOrpMBhdaD+4c3
	AOltYgS3Jg1nv1tcmHpLdrbpXdpLvQNMXNtWifvGL/dwjPUb9a2zHVc1YOYAYF73bpOJNvM/UhU
	MajSnpD6Y62qBCN67UDg9+LHcDfp6We+88GkoW8t4GIy8H0oxjxhRximof4rNWaRc67A=
X-Received: by 2002:a17:907:9488:b0:a4e:58f0:922d with SMTP id dm8-20020a170907948800b00a4e58f0922dmr7866363ejc.22.1712065262045;
        Tue, 02 Apr 2024 06:41:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKDmFGZIoVsSTi0KlJmjjJyKBZ8ifM82H0Bfvo0aF8XA2+r0tQ3lZ/fAvcHNpyQfvO2WGsMg==
X-Received: by 2002:a17:907:9488:b0:a4e:58f0:922d with SMTP id dm8-20020a170907948800b00a4e58f0922dmr7866344ejc.22.1712065261575;
        Tue, 02 Apr 2024 06:41:01 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id w17-20020a170906185100b00a4e9359fbe8sm259504eje.44.2024.04.02.06.41.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Apr 2024 06:41:01 -0700 (PDT)
Message-ID: <634bbfb6-a5a4-40ae-b89f-5fc50db43d4f@redhat.com>
Date: Tue, 2 Apr 2024 15:41:00 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [6.9 gpiolib regression] gpiolib: triggers: kobject: 'gpiochipX'
 is not, initialized, yet kobject_get() errors
Content-Language: en-US, nl
To: Bartosz Golaszewski <brgl@bgdev.pl>, Hans de Goede <hans@hansg.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 Andy Shevchenko <andy@kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
References: <bdea97a5-93e5-471f-88fc-a3c6ae74970a@hansg.org>
 <CAMRc=MdM0hNf73jVVd7kSchUVVBXmtQqSwmhNXus4TVovBSeHQ@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAMRc=MdM0hNf73jVVd7kSchUVVBXmtQqSwmhNXus4TVovBSeHQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Bartosz,

On 3/29/24 4:16 PM, Bartosz Golaszewski wrote:
> On Fri, 29 Mar 2024 15:11:21 +0100, Hans de Goede <hans@hansg.org> said:
>> Hi All,
>>
>> I've already tried to fix this, so let me just copy and paste my half finished patch
>> to explain the problem.
>>
>> I was planning on submitting this as a RFC patch at least, but there are also some
>> other new issues with 6.9 on this tablet and I'm not sure how this interacts
>> with those issues and I don't have time to work on this any further this weekend.
>>
>> Anyways below is the patch / bug report.
>>
>> I'm wondering if a better fix would be to add a "ready" flag to gdev
>> and may gpiochip_find ignore not yet ready chips (we need them on
>> the list before they are ready to reserve the GPIO numbers) ?
>>
>> Regards,
>>
>> Hans
>>
> 
> Hi Hans!
> 
> Thanks for the report. I hope I'm not being naive here but would the following
> one-liner work?
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index ce94e37bcbee..69f365ccbfd8 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1179,7 +1179,7 @@ struct gpio_device *gpio_device_find(const void *data,
> 
>  		gc = srcu_dereference(gdev->chip, &gdev->srcu);
> 
> -		if (gc && match(gc, data))
> +		if (device_is_registered(&gdev->dev) && gc && match(gc, data))
>  			return gpio_device_get(gdev);
>  	}
> 
> This would make gpio_device_find() ignore any GPIO device that's not yet
> registered on the GPIO bus which is almost the last step of the registration
> process right before creating the sysfs attributes.

Yes that should work and it has the added advantage that it also waits
for things like the irqchip to be setup before gpio_device_find() will
find the gpio-device.

I cannot trigger the race every boot, but I do hit it quite regularly
and with this change I've done 10 successful consecutive boots, so
I believe that this indeed fixes the race.

I've prepared a patch with this fix now which I'll send out shortly.

As for Andy's suggestion I'm not all that familiar with the RCU stuff,
but I think that if we were to go that route then the device_is_registered()
check should be moved up to above the "guard(srcu)(&gdev->srcu);"
line rather then above the "gc = srcu_deref..." line, since in that
case we are not using the gdev->chip pointer at all if we bail ?

Anyways for now I've just gone with your suggested 1 liner.

Regards,

Hans


p.s.

While looking into this I noticed one other possible problem,
unless gpiochip_add_data_with_key() and gpiolib_dev_init() are
guaranteed to never run at the same time then we may end up calling
gpiochip_setup_dev() twice, once from gpiolib_dev_init() and
once from gpiochip_add_data_with_key() when the 2 race.



