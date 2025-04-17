Return-Path: <linux-gpio+bounces-19024-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F0AA920F8
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 17:11:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E8A83AFF6C
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 15:11:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7C82252910;
	Thu, 17 Apr 2025 15:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="KK68LtVB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F00B2475C7
	for <linux-gpio@vger.kernel.org>; Thu, 17 Apr 2025 15:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744902706; cv=none; b=WHvbLpo6A7HhP+AEqCefvFV4Ju0EoWrMz/02waHp1ZF8a5FRziCtuXuiDfzp9Wb935A/pxZinoE5yIHt/FvMG94zUGvLogtpH3raA0/pYRxqw+kOcY28HN0GxLKhMuuTNf4WLDq11WArVw6YVjec4jnGhgPWccGUdzpoK8m1aak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744902706; c=relaxed/simple;
	bh=yvFHMLwK2h2d7JBRpFtpvcsKnr4SEyHazVUWmW6txAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k3XnjoQncbwHFOixUs2KIl0t8VZ4uf7i9oGW0JSIrnQ9Sj8JkKqVuY/Ri++B8sOnJmodBMMsDd06zAAWXhqXNHl/COWCb4CBK8A0YgziHEsbpbplHFhNukmg8RB5cFl3Fs/hh9lIOp2dfiPe6VMdQZ5rGnLM8mZrYHkmtTV25dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=KK68LtVB; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-2c2dc6c30c2so243007fac.2
        for <linux-gpio@vger.kernel.org>; Thu, 17 Apr 2025 08:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744902703; x=1745507503; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0L9P9esfiiJ15Ss9T0x8gaf9PTvYUA7aID0OiSkQbnc=;
        b=KK68LtVB9dOzv5eLlsNuamTZpDgncgA7558DEPSiFEaFC3tjP/z5VZZVukTPxn5+jD
         gxOIsiAqth74mbd8QyinwTlD5RIEpo0UL+2RnWiepw7IESTmFQizO83RmN8fV1GCsoWD
         3cfca5585rgyPoDmYAjMDoTHcipis+SDJNwdNltvuNdyfv+RPM56fVBTwcwcVx0pHD0s
         SMGh0KfDPEVbjfVpnNlQwpHtYDtGiKVhkKqAs5jY/OkHD4jzO5sSMVaxmQfUNv6zC0sK
         mMjBpKUDjSEi3OYQEp5Fw04YaM0BLpwPHggPjMI1mm72Y+oQnbRFn29gIMoFRKFqxUou
         XCJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744902703; x=1745507503;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0L9P9esfiiJ15Ss9T0x8gaf9PTvYUA7aID0OiSkQbnc=;
        b=PZ6lNtztMtSyBgFwGrFJ5bhxGDXyljFKscJd+QtJeGjqjH1DVLpOgsBECSqTVbhnmV
         YwD+oiHYC+kkoaJUvTSDwwxtEKayaygVEDFfFM0a/8UR1D1zEOFfuqpCXBVZPmHMrnG1
         orQnQ6V4D26KrU27Fc4f3NK42xXvqHE3bCxUL533xc1df+/DLAH+kHUZUwj8YOXkHAXP
         ynhpdrK+JKE3zfnfLUkK+Uee3VVI3D9O0TfMqv7QDHOan+QUewBT9XZVJ3j4TdtPUA4R
         jJml56O++TTxNr8vmLbs8TUX26rH/DrzT/GBP5NywhpJDsq7LOcqMPK7boFTJ9H6Zyiy
         9jpw==
X-Forwarded-Encrypted: i=1; AJvYcCXXZLvNHqVM6SJXtMoJv2G0dLYJDr3XIbQ+/GPRrrBGkROeHB60aeLqyvrl1GDPQEHV3q9aTHEn04dk@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7F5d1SuxfDD3IPpYZpkiV2EPaMHTVSaY1LkAIZxOric6lNr/7
	My6yTgs/GxnQ8qGE65+GIGiB5qRvW7MxeHe9XRYCSPije1kGxplCqoRwXA2Bevc=
X-Gm-Gg: ASbGncuIImzrJsScaCwsMh/Yq3fl0pPAMB4irJVzOX2Jj9mzOzgi4uO+NZZ+NWqK8n9
	e/x8E+Fy508+krQCkyAS9uBFG/913t6ArGyZAXGX1fFGgtVGz51z9ipiiJ1ORIbLIvTEq6BlMfN
	f9ScnxZ3Qe5j5/L84xt9GIA6fUoJ3th1Tp50zzcixOn8ncM8bDdE9KTYUOsA9ewRUyoK69HOq1s
	zrXdffos1e0moJWywVelV6WpURPB3LPMaN0Tto02CYRPwoVnUIWTATOI/VWEnZEMGLo2fqYBoVD
	/z0/d8HbIPETBDXmVkg7QsXsc/HwTv1WET2sr3jdo1Eu5VymraCDT5FAxHfEVsmyRz50qFK4QKU
	JtUaxasJA7wsiEScIWw==
X-Google-Smtp-Source: AGHT+IFStVeBeRR7RoXHH60e1pdUQR3p7PQGLfHkyNvneFyV7pVJ0YJJDGBcw2f+hRUVDosmWlKY/Q==
X-Received: by 2002:a05:6871:d087:b0:2bc:7342:1a6c with SMTP id 586e51a60fabf-2d4d2b37e45mr3858264fac.19.1744902703549;
        Thu, 17 Apr 2025 08:11:43 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:c91b:eea3:7afd:2dee? ([2600:8803:e7e4:1d00:c91b:eea3:7afd:2dee])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-72e73e67444sm3208250a34.63.2025.04.17.08.11.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 08:11:41 -0700 (PDT)
Message-ID: <a5729091-af6f-4549-8cda-ca2778346437@baylibre.com>
Date: Thu, 17 Apr 2025 10:11:40 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/14] dt-bindings: iio: adc: ad7768-1: add
 trigger-sources property
To: 938b950b-4215-4358-a888-6f6c9aab48e8@baylibre.com
Cc: Jonathan Santos <Jonathan.Santos@analog.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, lars@metafoo.de, Michael.Hennerich@analog.com,
 marcelo.schmitt@analog.com, jic23@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, marcelo.schmitt1@gmail.com,
 linus.walleij@linaro.org, brgl@bgdev.pl, lgirdwood@gmail.com,
 broonie@kernel.org
References: <cover.1744325346.git.Jonathan.Santos@analog.com>
 <35481552e9ce39a24a0257ab001c0bcfea1a23be.1744325346.git.Jonathan.Santos@analog.com>
 <938b950b-4215-4358-a888-6f6c9aab48e8@baylibre.com>
 <aABGfv+9KxEt5sAq@JSANTO12-L01.ad.analog.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <aABGfv+9KxEt5sAq@JSANTO12-L01.ad.analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/16/25 7:08 PM, Jonathan Santos wrote:
> On 04/11, David Lechner wrote:
>> On 4/11/25 10:56 AM, Jonathan Santos wrote:
>>> In addition to GPIO synchronization, The AD7768-1 also supports
>>> synchronization over SPI, which use is recommended when the GPIO
>>> cannot provide a pulse synchronous with the base MCLK signal. It
>>> consists of looping back the SYNC_OUT to the SYNC_IN pin and send
>>> a command via SPI to trigger the synchronization.
>>>
>>> Introduce the 'trigger-sources' property to support SPI-based
>>> synchronization, along with additional optional entries for the SPI
>>> offload trigger and the START signal via GPIO3.
>>>
>>> While at it, add description to the interrupts property.
>>>
>>> Signed-off-by: Jonathan Santos <Jonathan.Santos@analog.com>
>>> ---

...

>>> +      Supports up to three entries, each representing a different type of
>>> +      trigger:
>>> +
>>> +        - First entry specifies the device responsible for driving the
>>> +          synchronization (SYNC_IN) pin, as an alternative to adi,sync-in-gpios.
>>> +          This can be a `gpio-trigger` or another `ad7768-1` device. If the
>>> +          device's own SYNC_OUT pin is internally connected to its SYNC_IN pin,
>>> +          reference the device itself or omit this property.
>>> +        - Second entry optionally defines a GPIO3 pin used as a START signal trigger.
>>> +        - Third entry specifies a GPIO line to act as a trigger for SPI offload.
>>
>> SPI offload is part of the SPI controller, not the ADC chip, so doesn't
>> make sense to have that binding here. In that case, the ADC is the
>> trigger-source provider, not consumer.
> 
> Right! Maybe a silly question, but this means we would have then two trigger-sources 
> defined, one in the spi controller node and other in the adc node, right? like
> this:
> 
> spi_controller: spi@44a00000 {
> 	...
> 	trigger-sources = <&offload_trigger_source>;
> 	...
> 	adc0@ {
> 	...
> 		trigger-sources = <&sync_trigger_source>;
> 		#trigger-source-cells = <1>;
> 	...
> 	}
> }

Yes, this looks correct. And for the case of SYNC_OUT connected to SYNC_IN on
the ADC itself, we could omit trigger-sources = <&sync_trigger_source>;.


