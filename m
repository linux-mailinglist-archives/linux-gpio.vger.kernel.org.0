Return-Path: <linux-gpio+bounces-5187-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F47389C816
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Apr 2024 17:22:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 15A5B1C2266C
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Apr 2024 15:22:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFBCF13FD87;
	Mon,  8 Apr 2024 15:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H7A0SX2j"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090A613F45E
	for <linux-gpio@vger.kernel.org>; Mon,  8 Apr 2024 15:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712589733; cv=none; b=BZx00ZSxI0dUTRXcDdpG+hJ3R32cBTJjPo+RlwzjZpCkmTYzY4qg4Fj09DRWtXlBInaPMkxyjNr6wHAzKLGIW/TbGWTlPFW83uehOTEVnZYpRSe023erNMgApqJx+C3gEO8x2wTY3ZHEmw2eSXnnob+oG6I/b4geLtfrR2qUrtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712589733; c=relaxed/simple;
	bh=mdxRFDP/fJY9LNfVWpqv3bciV0awZTad/suM50GtTwo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hjtQp4V/8DxilsCVEKJZr51qNaWesKmSCnTU0tGEMmrmv68u0pFYgenDx1bd0ZBJCvSYpWwhdTiCPI91RMh2ZdN7kfdijX7qF21w4Mj1e/X/ddO7J8wpduWm8yP371TD6awawxTbT0EKZMJsTlY88ZQTpR2RoHOJc+X2/RJbLL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H7A0SX2j; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712589729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fq2QYO9X+TFapJRSM7+TRy2sSb2j5RewS6tFIyzbq00=;
	b=H7A0SX2jwj0H2ATljQasuUooIjVe44DYM19kIV8f9MpjlCG7b0Yja3AYYz4u7fvPdoEN8S
	qWrJdL2PQa8O/ufaGZYH6rBzWhqoP4wYsQTYzszfiUUBNt38fPf+Hv2/3JneWb8QpDyLad
	F8CQUMsnWhclF+eNg3Uh/FeQHhRF8HY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-193-h5lnyfYyN4mZoLWoVjQvww-1; Mon, 08 Apr 2024 11:22:08 -0400
X-MC-Unique: h5lnyfYyN4mZoLWoVjQvww-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a51d062b178so76732766b.2
        for <linux-gpio@vger.kernel.org>; Mon, 08 Apr 2024 08:22:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712589727; x=1713194527;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fq2QYO9X+TFapJRSM7+TRy2sSb2j5RewS6tFIyzbq00=;
        b=AtGuU8Tg8v8jq0CZTsnVREc0sVecTktGqJ9rGqFMO6XxcdLCutfZrqT3Kp0FOUBxG4
         ccL6HRTXgcUI8cfl8wnB4tz2luDjwSm6WO4pdtC4jS/qg4bKY29EjUUd0BbtCDw+WotE
         W3LJBFgapqwaN/kqbvokX71v3GUycBz3SW/0V4TVVtuAeQZespNHmaO6Y2cF9RYruwQj
         vsu3GaZ0cUEc8GA1RU5tzt2iGsFhEunmhg+BN6fCnYkPsQOeQX9er7sQF7Ye3C/vm+Tu
         bg/eZdjFwTWCpd0HCm/J3BAUzKn3rkrDuGUSLMxNW02PI6GMtOItDNCzV+4oeugIC2b5
         huXA==
X-Forwarded-Encrypted: i=1; AJvYcCXjBHLl4xPzn7AJ3IGcAEHeZlIHG6sVKCtLdlhSGYDJbp49ED1IBuqNdZcTVkN80YdHBA9LRtQ0NJDs4/hNY5UeOvR47P4sH9MvrA==
X-Gm-Message-State: AOJu0YypUphZ07MeHu633hmLWyE2iJZHxQ0005d+Y1rs8Fr/vAHsCZiA
	xJhRIhQKV8gvUMKZkfJMQXasq5hFTNSeF/lSxsVRyji4Ukl8UWJrPYeS+pN1+jsTj7n/smUYPU0
	eyasoZQz+bug69DR/AktpYFZhR9zkubpgFskkaWpDs4vdd3Nn41+I/aVsCVSXqap6Ph6P1w==
X-Received: by 2002:a17:906:374c:b0:a51:7ff3:5d5f with SMTP id e12-20020a170906374c00b00a517ff35d5fmr5994135ejc.67.1712589727076;
        Mon, 08 Apr 2024 08:22:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2oOmlGwU/XEafe0tSNrYtXAq6rzCrYHM9CIvWLjh6DbVGjel4q9KmFr2qwKitxZ+aYMxG9A==
X-Received: by 2002:a17:906:374c:b0:a51:7ff3:5d5f with SMTP id e12-20020a170906374c00b00a517ff35d5fmr5994122ejc.67.1712589726832;
        Mon, 08 Apr 2024 08:22:06 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id d4-20020a170907272400b00a4e5866448bsm4553639ejl.155.2024.04.08.08.22.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Apr 2024 08:22:06 -0700 (PDT)
Message-ID: <8e1e561f-3d34-4023-bae1-08bce71ebe55@redhat.com>
Date: Mon, 8 Apr 2024 17:22:05 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] mmc: sdhci-acpi: Disable UHS/1.8V modes on Lenovo
 Yoga Tablet 2 series sdcard slot
To: Andy Shevchenko <andy@kernel.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20240407200453.40829-1-hdegoede@redhat.com>
 <20240407200453.40829-4-hdegoede@redhat.com>
 <ZhQK6K0OUrXmrtWQ@smile.fi.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZhQK6K0OUrXmrtWQ@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4/8/24 5:19 PM, Andy Shevchenko wrote:
> On Sun, Apr 07, 2024 at 10:04:51PM +0200, Hans de Goede wrote:
>> Unlike all other Bay Trail devices I have (quite a few) the BIOS on
>> the Lenovo Yoga Tablet 2 830 / 1050 and Lenovo Yoga Tablet 2 Pro 1380 (8",
>> 10" and 13") models sets the SDHCI_SUPPORT_DDR50 bit in the sdcard slots'
>> SDHCI controller's Caps_1 register which causes Linux to try and use
>> UHS SDR12 / SDR25 and DDR50 modes on UHS cards.
>>
>> These tablets do have 1.8V signalling implemented in the hw level through
>> the Bay Trail SoC's SD3_1P8EN pin. But trying to use UHS modes leads to
>> lots of errors like these:
>>
>> [  225.272001] mmc2: Unexpected interrupt 0x04000000.
>> [  225.272024] mmc2: sdhci: ============ SDHCI REGISTER DUMP ===========
>> [  225.272034] mmc2: sdhci: Sys addr:  0x0712c400 | Version:  0x0000b502
>> [  225.272044] mmc2: sdhci: Blk size:  0x00007200 | Blk cnt:  0x00000007
>> [  225.272054] mmc2: sdhci: Argument:  0x00000000 | Trn mode: 0x00000023
>> [  225.272064] mmc2: sdhci: Present:   0x01e20002 | Host ctl: 0x00000016
>> [  225.272073] mmc2: sdhci: Power:     0x0000000f | Blk gap:  0x00000000
>> [  225.272082] mmc2: sdhci: Wake-up:   0x00000000 | Clock:    0x00000107
>> [  225.272092] mmc2: sdhci: Timeout:   0x0000000e | Int stat: 0x00000001
>> [  225.272101] mmc2: sdhci: Int enab:  0x03ff000b | Sig enab: 0x03ff000b
>> [  225.272110] mmc2: sdhci: ACmd stat: 0x00000000 | Slot int: 0x00000001
>> [  225.272119] mmc2: sdhci: Caps:      0x076864b2 | Caps_1:   0x00000004
>> [  225.272129] mmc2: sdhci: Cmd:       0x00000c1b | Max curr: 0x00000000
>> [  225.272138] mmc2: sdhci: Resp[0]:   0x00000c00 | Resp[1]:  0x00000000
>> [  225.272147] mmc2: sdhci: Resp[2]:   0x00000000 | Resp[3]:  0x00000900
>> [  225.272155] mmc2: sdhci: Host ctl2: 0x0000000c
>> [  225.272164] mmc2: sdhci: ADMA Err:  0x00000003 | ADMA Ptr: 0x0712c200
>> [  225.272172] mmc2: sdhci: ============================================
> 
>> Since sdhci_acpi_slot_int_emmc sets SDHCI_QUIRK2_PRESET_VALUE_BROKEN
> 
> sdhci_acpi_slot_int_emmc()
> 
> 
>> I tried setting that for sdhci_acpi_slot_int_sd too and that does makes
> 
> sdhci_acpi_slot_int_sd()

These are not functions but structs .

Regards,

Hans


> 
>> things mostly work, but the above error still sometimes happen and
>> regularly access to the card simply freezes for seconds, which are
>> problems which do not happen with the non UHS SDR50 mode.
>>
>> Add a new DMI_QUIRK_SD_NO_1_8_V DMI quirk flag and set that for these
>> tablets to disable sdcard slot UHS modes by setting SDHCI_QUIRK2_NO_1_8_V
>> for the sdcard slot when this quirk is set.
> 


