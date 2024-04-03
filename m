Return-Path: <linux-gpio+bounces-5039-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 19862896883
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Apr 2024 10:26:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3E8728824B
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Apr 2024 08:26:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C315B74427;
	Wed,  3 Apr 2024 08:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BctgGHOJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B5E6E2BE
	for <linux-gpio@vger.kernel.org>; Wed,  3 Apr 2024 08:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712132270; cv=none; b=S4LJVMjyHJOHoWO3w1Hj0HJmdBwstCrYWrGMhmwPUBnfs/XQJ0hsvVN+HvzO43Zx5VgJCsYPoqWVQ78kDT6QttO31ZzbUp7USlQx2rzuY4goMbJyC0ZwA1LE+VKqpoDmGYJjOtynQXEjxS95P25BMWoCoMkEVcQLVYfAtIWbYik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712132270; c=relaxed/simple;
	bh=WZVLpsgEZyMee2esS1uHXrzyFJR0vhK0SpAjmX1pzA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EsAA1uClTnDbNkEcfkfXcRnuY3olO0u7RL+0T4Mi654KKIt6J6iap1XRwkf4hbb0ZvTPrxpw9XNJAH6kAom/gyDrXPZo2QVuwOsOyHKCVM7S254EYWDobzbTLOoWJKg2SrrZkliOdwjdIUjvE7HvQrsqHgB5aG+wx6nu2OwBlco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BctgGHOJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712132268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SdMK7f7rQBNlLOVVhFtlCqSnYbgxL7W9IIMpIkzT6qw=;
	b=BctgGHOJcF7g0eg+9hGKoBwnM2BQM3R/JcSKVygdprnFi6C+xkZ0ciWotYFZ+Uo2QE1Pbh
	FCn2dWfJ0VfXCBNB9NTOpz2P3CtFH2npGBCooQOx3Du8WFUiHirGB+DtWYCWOV3FGBVb/k
	6MhJDPBfHw5VdeYFuOrCqkSiuBAe07s=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-297-tD8xATiWNVGIeuq5CwX_ww-1; Wed, 03 Apr 2024 04:17:45 -0400
X-MC-Unique: tD8xATiWNVGIeuq5CwX_ww-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a4e05cee8faso242035966b.1
        for <linux-gpio@vger.kernel.org>; Wed, 03 Apr 2024 01:17:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712132264; x=1712737064;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SdMK7f7rQBNlLOVVhFtlCqSnYbgxL7W9IIMpIkzT6qw=;
        b=TXey79+LNynZXNdQkD+3QYIz4rUl95GIsXB5xUIP2UqkBO6hmJWuYklT4jeRgTqyFL
         QFh0qoEzFOKkBnegpEIoaFv96RiHcirabyff216bU7ZYDCIBDmW8ZLfWzTGyt2fFZ0Gz
         OxNhSc6DkYbubMF34Di16pdeq3mKS/6oZgrVXvGlDD/IZhOY5VyDRR8011h3mYIu4l1L
         Xy9jygIVYwb3ux/cgsdCbQhDeYXWbnIbrr6ZY//bosjzzEeVtcnUjIENoecZH9nid1Af
         wNxEg7Jwi+KHX89uc4T/VjJPs/2TepEf6/qSh8u7M5qrWy0DNT+W+RKIzhZk7gNwX5GG
         w8mg==
X-Forwarded-Encrypted: i=1; AJvYcCVPOHWW4OAVUR1Mz4fLnUgTTseboY/WcCm6Gul8tinF4mpIRskY8trmHgImRjcTiCvcoHxzkq7f4xYEw98eJd2g8bj0TXdRbWBItw==
X-Gm-Message-State: AOJu0YyFfMI238Mn1hHLg+386oAPM8XRVyUPmgcsRslph2G9PvDodEH/
	QXJabJL2ZWWMarrcEs3ApDjnVlHTktCQsgOkYSNt21qGA/aQyXG9uA1ZtSdc9nAFsCkbqNzc5bY
	dlFTdw02Ck7ux29p4PlEv1DUemLcmWTaoxTZFzcFMDYsNCux6EK8F6Jq/C6E=
X-Received: by 2002:a17:906:470c:b0:a4e:6957:de24 with SMTP id y12-20020a170906470c00b00a4e6957de24mr1303532ejq.37.1712132264454;
        Wed, 03 Apr 2024 01:17:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9W+msJ9cw1PLqVvsdlsPE3wNn+yIqe/WBgeUUUFOwvy3JKmF6zlJAQklGl8EXuEy+A1yZ1Q==
X-Received: by 2002:a17:906:470c:b0:a4e:6957:de24 with SMTP id y12-20020a170906470c00b00a4e6957de24mr1303520ejq.37.1712132264063;
        Wed, 03 Apr 2024 01:17:44 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id n10-20020a170906118a00b00a461d2a3374sm7470177eja.47.2024.04.03.01.17.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Apr 2024 01:17:43 -0700 (PDT)
Message-ID: <0303f5f6-05f8-43c7-8922-11de2550d356@redhat.com>
Date: Wed, 3 Apr 2024 10:17:43 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] gpiolib: Fix triggering "kobject: 'gpiochipX' is not
 initialized, yet" kobject_get() errors
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 regressions@lists.linux.dev
References: <20240402164345.14065-1-hdegoede@redhat.com>
 <CAHp75VeJYASFaxwG2yuAdBLn7H5hK1BESP7p+3CzBVmNdCTpwg@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VeJYASFaxwG2yuAdBLn7H5hK1BESP7p+3CzBVmNdCTpwg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 4/2/24 6:51 PM, Andy Shevchenko wrote:
> On Tue, Apr 2, 2024 at 7:43 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> When a gpiochip gets added by loading a module, then another driver may
>> be waiting for that gpiochip to load on the deferred-probe list.
>>
>> If the deferred-probe for the consumer of gpiochip then triggers between
>> the gpiodev_add_to_list_unlocked() calls which makes gpio_device_find()
>> see the chip and the gpiochip_setup_dev() later then gpio_device_find()
>> does a kobject_get() on an uninitialzed kobject since the kobject is
> 
> uninitialized

Bartosz, can you fix this up while merging or do you prefer a v3?


>> initialized by gpiochip_setup_dev() calling device_initialize():
>>
>>  arizona spi-10WM5102:00: cannot find GPIO chip arizona, deferring
>>  arizona spi-10WM5102:00: cannot find GPIO chip arizona, deferring
>>  ------------[ cut here ]------------
>>  kobject: 'gpiochip5' (00000000241466f2): is not initialized, yet kobject_get() is being called.
>>  WARNING: CPU: 3 PID: 42 at lib/kobject.c:640 kobject_get+0x43/0x70
>>  Call Trace:
>>   kobject_get
>>   gpio_device_find
>>   gpiod_find_and_request
>>   gpiod_get
>>   snd_byt_wm5102_mc_probe
>>
>> Not only is the device not initialized yet, but when the gpio-device is
>> added to the list things like the irqchip also have not been initialized
>> yet.
>>
>> So gpio_device_find() should really ignore the gpio-device until
>> gpiochip_add_data_with_key() is fully done. Add a device_is_registered()
>> check to gpio_device_find() to ignore gpio-devices on the list which are
>> not yet fully initialized.
> 
> Reviewed-by: Andy Shevchenko <andy@kernel.org>

Thank you for the review.

Regards,

Hans



