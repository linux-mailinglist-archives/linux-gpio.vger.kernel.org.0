Return-Path: <linux-gpio+bounces-18718-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDACA8688D
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Apr 2025 23:57:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E076B1B873C0
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Apr 2025 21:57:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5494A29DB84;
	Fri, 11 Apr 2025 21:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="M6dr6Jbo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB0C29614E
	for <linux-gpio@vger.kernel.org>; Fri, 11 Apr 2025 21:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744408636; cv=none; b=L5QWekvouITbtNgANFb2k37Zi4PBY1tI/fUkfFmDboZz3t29s4b7+oAiy1ocg5rjz/umneE9g6sGLN90e5oVUq6605gxGAJUmpLWxbQi8bb42mlM/32WefmtysPyMzGlW24rITaxN7bNhNucBtR3sn2QjHbStj2zpR5VmOrQscI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744408636; c=relaxed/simple;
	bh=U/5OSHIm4xidi8WZpyCWBuRqvMGUXBR//iyTnMoWcNA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EemGSPidtI9UsBNb9Ids/nJ8NZEqVYyIYuh7dD5sqhgXPntqqgQrck8Goh8TeIt/VabEqVbdfTwyE+eB5GJ4U4HRoVZo9EeaQ7WlIGA9d+N3u4cqIYfnsktVsj+5Yzy7OrIXzSKAqdIDQ5wcXo88yCWXjQe5V67Feit77A9IVgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=M6dr6Jbo; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-72bceb93f2fso1865851a34.0
        for <linux-gpio@vger.kernel.org>; Fri, 11 Apr 2025 14:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744408632; x=1745013432; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hGxgbzS8SsXJLi5EFV0c4NWHcpynG76/jsFGgon3TKI=;
        b=M6dr6Jbo7oVS8NsgNlCn2EguipsGDH9H50oBIxFxjAr2bh3JnWasNuTJv1AxkFTXfW
         wW9ke+3WzhjlrvUPLqip92zDQnEylA7TyYXpVOAvkvPdrecqxToTDOBBWn3YDsVugdBM
         qjegjBZ6JAfYQ2hb9UwjGJd63z//gobAM2zNdIo1VSUNp7Sb1Z4Y4ekfDo07v4YNC+a8
         NkfDxkhUVLS3VC8rblHwI4hwSHfECa2TrLUY68IbhOQVnc2Rgssn7N5UIeE/1Fqs7Vr1
         13qeE8fs1DYcsdDeqpfehtdJSSNbB0g0Qon9CzeMTWVun/ixOjOwv+/9KKIkWuo7hTHm
         q4jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744408632; x=1745013432;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hGxgbzS8SsXJLi5EFV0c4NWHcpynG76/jsFGgon3TKI=;
        b=WQ/OSf2VuwbimqHEXz7cQJs01qiScNO5DzjZS1bmtmIU4uIKLpvMl5lFpeWGXt4HqG
         3F1pXULdWVYLgPoinTe+DoA4dGGdIoe/Dic5DxZDpk4yoK0kLFA1ZWmM8FRoMyKgMrg8
         D9oQWH7/GvJRao8GZ40S3fYRCbU9hAn1lTFF5EkEerb1ZfgaFWQ+qu1b4ybXlMHMZ77E
         aPFH/DjBEGPdBiNhDAqjt5ERfHDtK284aOCAGcRDbu7I9Y27VbjBEN3ZEFQAfo8i1NtW
         oFgLTZ+pteF3jvhwhUdWOEhqRCn4kgq9HTLb2Fb1Y8+i6eWdh2e/2xrKRGkZIvaCPRXK
         mfwg==
X-Forwarded-Encrypted: i=1; AJvYcCXtvLfrW6AyHo2fkoVfUB9vr7e33yMMU4xSggGeXg9lrnpxAKeI+Z1T4dHWBjV/SM7XD4o0ByYzV14s@vger.kernel.org
X-Gm-Message-State: AOJu0YyXARRyIfBM34vUm2/f5UN5baM2bBM+nJOAurnGe0TZAZlM27TO
	VF2IXvwoArC6x8vpqipVPQvdqKb1j0YOP84K6tmwe8jblF9sk3XJe/6SWXksaMA=
X-Gm-Gg: ASbGnct1bEYgwHTzuZ5zXSuzhRRDbjYUUURsAa8MFN0IVyQYveRutOQBah4g9mEwGwl
	RYGcB4U3Acxud1OSs8yehmMnesyN/s0HyHF52CXAJLNLqbnAhrKB3SlrshPDa5xcb+fWlXX+52k
	kXaTnn2G1EwgwxqJF5LgnJMGKU8MVRKCDigPNjQ1shZGFrCeOvSoxq5G3FmbPofzNIQUPNi0m68
	JdMS/AOFNhVmIG2kaSJSBfDQZZFyRxTKCo82sb81vXGuipRJCdqkUCV+vKh4imJ89Us1z1Wg64q
	8aQBef2Uym3jn2/vknJGZL4/Nfgo9UUikb46DZezVDx6y+Qk0PJ2ZJEFCS5Whq1pNb8ak3RJDyb
	GXVIbfgEOAnpz
X-Google-Smtp-Source: AGHT+IHJ8jsSgRFDtzkrcSxyEZnKdBoL/URDBhhkNCEX69zyJiLizO+9RyTuZoOivQHbrnufomIfTQ==
X-Received: by 2002:a05:6808:17aa:b0:3f9:176a:3958 with SMTP id 5614622812f47-4007bfe4d70mr4807862b6e.11.1744408631784;
        Fri, 11 Apr 2025 14:57:11 -0700 (PDT)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6045f5b295bsm1073636eaf.35.2025.04.11.14.57.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 14:57:10 -0700 (PDT)
Message-ID: <3027a9b0-cf4a-4e55-80a7-7f0dd2a008e4@baylibre.com>
Date: Fri, 11 Apr 2025 16:57:08 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/14] dt-bindings: iio: adc: ad7768-1: add
 trigger-sources property
To: Jonathan Santos <Jonathan.Santos@analog.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
Cc: lars@metafoo.de, Michael.Hennerich@analog.com,
 marcelo.schmitt@analog.com, jic23@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, marcelo.schmitt1@gmail.com,
 linus.walleij@linaro.org, brgl@bgdev.pl, lgirdwood@gmail.com,
 broonie@kernel.org, jonath4nns@gmail.com
References: <cover.1744325346.git.Jonathan.Santos@analog.com>
 <35481552e9ce39a24a0257ab001c0bcfea1a23be.1744325346.git.Jonathan.Santos@analog.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <35481552e9ce39a24a0257ab001c0bcfea1a23be.1744325346.git.Jonathan.Santos@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/11/25 10:56 AM, Jonathan Santos wrote:
> In addition to GPIO synchronization, The AD7768-1 also supports
> synchronization over SPI, which use is recommended when the GPIO
> cannot provide a pulse synchronous with the base MCLK signal. It
> consists of looping back the SYNC_OUT to the SYNC_IN pin and send
> a command via SPI to trigger the synchronization.
> 
> Introduce the 'trigger-sources' property to support SPI-based
> synchronization, along with additional optional entries for the SPI
> offload trigger and the START signal via GPIO3.
> 
> While at it, add description to the interrupts property.
> 
> Signed-off-by: Jonathan Santos <Jonathan.Santos@analog.com>
> ---

...

> @@ -57,6 +80,15 @@ properties:
>    "#io-channel-cells":
>      const: 1
>  
> +  "#trigger-source-cells":
> +    description: |
> +      Indicates the trigger source type for each entry:
> +      0 = Synchronization GPIO-based trigger
> +      1 = Synchronization device trigger (e.g., another ad7768-1)
> +      2 = GPIO3 pin acting as START signal
> +      3 = DRDY pin acting as SPI offload trigger
> +    const: 1
> +

0 and 1 don't sound like trigger outputs that this ADC is providing, so don't
seem appropriate here. But the SYNC_OUT pin is missing from this list.

Also, outputs could be used to trigger anything, not just SPI offload, so don't
need to mention that.

