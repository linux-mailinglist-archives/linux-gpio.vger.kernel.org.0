Return-Path: <linux-gpio+bounces-5350-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5898A1434
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Apr 2024 14:16:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B6281F23A22
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Apr 2024 12:16:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26ABC1442FF;
	Thu, 11 Apr 2024 12:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iefl028Q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C0914A618
	for <linux-gpio@vger.kernel.org>; Thu, 11 Apr 2024 12:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712837778; cv=none; b=lTs6MIfAaV0yHAisIEgQDDT3QI47rP78cPoZtV4yGFuRgjmO7yACVEw93JH5uLtQ0u6VKMyicwAtxppeuMwlCCe4VbToz5AuCljAYKxLWDHuFOyXZeZiK3jo5v3+DbcvtQG3z3GZPtOdyI9VnH3Ylk3KK25gCCWLzBm7nZvgun8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712837778; c=relaxed/simple;
	bh=RsWSzvqfRrvQGDUZSked2pWIzCaGfGyUajfHMTKBnfo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nYyGBSi0Tdvws10fyAcQnnRg6wcbKxUW9SgY608y8O98dnfZsJDj1lIGvKVTW8Y04sKot2uIOAtNTy3CBLViEugIiARwMkl03CZDQlR5EoFbcTTGlszkCt23foKPhrK8Cnu4q+lKLF8wLOivF2sE1G0AI5mrAh+2DUOaIIozhwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iefl028Q; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712837776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fpb1PA6lu+VHUNPqG85Lr6dBe/adZWkbu+51rmdO4Pg=;
	b=iefl028QbHiAgeI7sdbw+m4r3JLf3DG6o/1JkJ/v6jPI774MuUpjHdorBpDXYwngj1UHsB
	O65j5J15pAvNvK8j6V28LQ+UZa30YDQKiucEHiOsZpLF9sgP3Z3ahKCBmiKIXfN1AUZVk8
	QnLPhpgwCeoAtRVOwbI/hZ4xLv90Otc=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-552-jm-rat3gMd-rK6zc8VW9Pw-1; Thu, 11 Apr 2024 08:16:14 -0400
X-MC-Unique: jm-rat3gMd-rK6zc8VW9Pw-1
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-2d87f5937fcso42369201fa.0
        for <linux-gpio@vger.kernel.org>; Thu, 11 Apr 2024 05:16:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712837773; x=1713442573;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fpb1PA6lu+VHUNPqG85Lr6dBe/adZWkbu+51rmdO4Pg=;
        b=szI1yxbtplRyvt3Xmqh1PGEdzd3FW6Eig5vkPrwBIM4XBoqrI6fj20AmcbCfz/dzPe
         HEVXX70bRKb7b7W6Jie8Pekd0FSoCL9EGejXVG3u+bqKoq6nz2EYclXPwcjJ+R3W+PH9
         wLooVmHBH6mencmAd05pQd+UXM+cz5hw6KHNTnPmBzalyyva7cNw5DZD3bcfiglowIi0
         D1aaWvzRpBRxowI3zAfy+FwpJVTWT7zmMIUDdLt8GwEplXOZJRz9RLBF9C2Nt7qYCZ5K
         BA8Wdwgr2motJuE0FjReCkLofVYvPob8ueSw3An0Bhgt5SxMg3S8RDwT3MauQ2L869Jq
         qk6g==
X-Forwarded-Encrypted: i=1; AJvYcCWZrUNFDP6Qv1I+I76kMuCX+JyOTiB9Rv7ibeqEjSiUQ/0DIYlwUI7ADGQezhINRSw06B41MffZ604oTkAWBFfy6DeVGzOjVM5Glg==
X-Gm-Message-State: AOJu0Ywziqipds9JkrDegslLkQyu1YHUVa5yTWX3ciHD9a43ZnJc3lOu
	AFtIdYg4NJdaLXW4szvikLBtCaae7dQFmBQNkLiOQnOWQMofbHo1nxOWbSItG/aUXT2nI24VfRJ
	LIdIEPNrMOWTZf1H8m0OFNpurHN+e+nqGWQXjqwT9ROhn+DTbC87dAaifLiY=
X-Received: by 2002:a2e:bc23:0:b0:2d6:c23f:7dff with SMTP id b35-20020a2ebc23000000b002d6c23f7dffmr4329191ljf.44.1712837773509;
        Thu, 11 Apr 2024 05:16:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4Kb6ndMMgsnlXZOXRSCmDhjhTY2JLx8jmfc+5fD4WKLaHk6hFxOJ4qGTxegeljAvujYRgQg==
X-Received: by 2002:a2e:bc23:0:b0:2d6:c23f:7dff with SMTP id b35-20020a2ebc23000000b002d6c23f7dffmr4329172ljf.44.1712837773170;
        Thu, 11 Apr 2024 05:16:13 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ig4-20020a056402458400b0056fe7e308c3sm572339edb.0.2024.04.11.05.16.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Apr 2024 05:16:12 -0700 (PDT)
Message-ID: <fa9deb3f-5d07-486e-965e-fb5f998c9868@redhat.com>
Date: Thu, 11 Apr 2024 14:16:11 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] mmc: sdhci-acpi: Add quirk to enable pull-up on
 the card-detect GPIO on Asus T100TA
To: Andy Shevchenko <andy@kernel.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
References: <20240410191639.526324-1-hdegoede@redhat.com>
 <20240410191639.526324-7-hdegoede@redhat.com>
 <ZhbxNdf0mGB4zbzA@smile.fi.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZhbxNdf0mGB4zbzA@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andy,

On 4/10/24 10:06 PM, Andy Shevchenko wrote:
> On Wed, Apr 10, 2024 at 09:16:39PM +0200, Hans de Goede wrote:
>> The card-detect GPIO for the microSD slot on Asus T100TA / T100TAM models
>> stopped working under Linux after commit 6fd03f024828 ("gpiolib: acpi:
>> support bias pull disable").
>>
>> The GPIO in question is connected to a mechanical switch in the slot
>> which shorts the pin to GND when a card is inserted.
>>
>> The GPIO pin correctly gets configured with a 20K pull-up by the BIOS,
>> but there is a bug in the DSDT where the GpioInt for the card-detect is
>> configured with a PullNone setting:
>>
>>     GpioInt (Edge, ActiveBoth, SharedAndWake, PullNone, 0x2710,
>>         "\\_SB.GPO0", 0x00, ResourceConsumer, ,
>>         )
>>         {   // Pin list
>>         0x0026
>>         }
>>
>> Linux now actually honors the PullNone setting and disables the 20K pull-up
>> configured by the BIOS.
>>
>> Add a new DMI_QUIRK_SD_CD_ENABLE_PULL_UP quirk which when set calls
>> mmc_gpiod_set_cd_config() to re-enable the pull-up and set this for
>> the Asus T100TA models to fix this.
> 
> ...
> 
>> +			mmc_gpiod_set_cd_config(host->mmc,
>> +						PIN_CONF_PACKED(PIN_CONFIG_BIAS_PULL_UP, 20000));
> 
> 
> Just noticed, the PIN_CONF_PACKED() is a helper for pinconf-generic.h. It seems
> unusual to use it directly, and AFAIU documentation, it's for static
> initialisations, however it's not explicitly said.

I saw the static vs runtime comment, but I assumed that applies
to the parameters passed to PIN_CONF_PACKED() being determined at
runtime (not the cases here) vs the parameters being static / const.

Regards,

Hans




