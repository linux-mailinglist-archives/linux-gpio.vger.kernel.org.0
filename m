Return-Path: <linux-gpio+bounces-25987-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D5EB53DAA
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Sep 2025 23:22:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 124EB7B9E13
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Sep 2025 21:21:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F4B42DE709;
	Thu, 11 Sep 2025 21:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="PGEoNag+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F383F2DC762
	for <linux-gpio@vger.kernel.org>; Thu, 11 Sep 2025 21:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757625755; cv=none; b=ZLx8uBEyMHyHuv5BQcBCY4MLnjdiMrDS+359J/Zg25LHqFrym/3v7p7vNsNuVe29PX3tLMoxbdZKJ8FKMNpsFgfpPKCC2JR0VdMBsVyVJipHw7sjE3k9aNk7DMpE34HzUPMDjJ+CVl7xf6hhj6aC/0vqeyhPrv5Fy8OrXtcpa9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757625755; c=relaxed/simple;
	bh=mpF9QO78XjKHHuLN0e4o5SiMPaTbBuzm/F6ez0J1I5I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u093aYUOY397PH5RRkQATaCbxVczok6HjDRB1nvvButmx/9twoCtwIYPslTPAZLimpwPUK113FIHg9qC2qVcoNLrRFsRQj0wDdYHHVy4oY6QSujRz8SxP48g0ZJE9mHs6LzwpY2hvX89n8soMpQDMoKSnii7Gu0jeujOYEsvT4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=PGEoNag+; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-32a9c1d2b95so724188fac.0
        for <linux-gpio@vger.kernel.org>; Thu, 11 Sep 2025 14:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1757625752; x=1758230552; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sAkTFP0wxwWUgNcsyxLjhWngpDbT6XEGsdkzHC+c2iA=;
        b=PGEoNag+OTsl5jSP+ogd9oIZvFz2LRwRw2FPa41g3CSv7yK+qrGVieRHXcYOCoWGRN
         AiZH6SjNtoHsvEGVZWcqCgrNBpEMo1B9vbhK+w9ZLR3kzgc97ZiDHG3umVQ1vgql/sPs
         mOUqjD68vub7SFoOKmRwCO0HFpRreT++mdCA2aKPFBTaD9rhlLNd7Lys9eWY8fnPDjHG
         92LHIsmlJLrf2twnrfvoPIVM/vr92m9UNKYyCaBEFaPELJxmEuH1UqJVMOL3CdYQrPxr
         8923Y71v2Py4Zagoi8BbuBtyfRqziMBus+cWVV21TFzGLxuBUFeZATDE0w8PA6dPZvTm
         yrFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757625752; x=1758230552;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sAkTFP0wxwWUgNcsyxLjhWngpDbT6XEGsdkzHC+c2iA=;
        b=uUSIMTukq4Moa37QutG5u/qeRczi6+dpHOqDg38EYK9iJr0v/L5Ac8ytloUM4X/5tl
         0VN/7xr+srcR6CGrbsDwuvE8Mcmkc0DxGfZcSGaQLpzeY+lVapjIPSH9rEc/1SjGfPsC
         qznaxyU6eIJ8uj1TLpur3GWpVx5H42VUjLE42m6j0tPsyk4OHWtQjvGlhDd6/+9UFoiF
         2GlZT2EvodQaszRrffxx9steMFdOjotyqYiWMa5Poav5vEwCRSgTIIH6Bbwj82vH8Ka4
         ul8oJxtGp/ZM9/cxzClzJTCcmU4vx7FAEHCUzRm0kC2hij9WBQ52G4/vLeM6y9iuSX6J
         ViMg==
X-Forwarded-Encrypted: i=1; AJvYcCUQrNMp003RQoCyDi0zLdWrLrHT1IyYV1M7J4vKtcbGaqhjkGGUOHnXCLO5ZsF/PNIhB2+VbIUe+veJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwENESO/0gmjsGfveJT2IbzZuGa42bTz3YekI8t/pds0/vxDBT+
	Ur4sE8B58heqb4YYhSfh50pm9TkaVvprYPD3rk9zq+iTqpHErTtXd0nZCZEeGZHQQn8=
X-Gm-Gg: ASbGncvhmvzVwb5MVLIlMbdsA30ZNNPaK2v0HhzqGqBU1hcDZw78GwmAIFTY45KkkF9
	mvrfcUFveTMfyna+L5u/2ysfGy0l7fBhLt8hgdPIaQUulwFUt1d/irQ55JATaFBUxXBpA3UjjGo
	g2MBY7RUakOxXLbU4VGE+Ju2h9QMoxAgfWDHt4HnhlC5FjheKGwsLZBWvq4USEWeGHhmvm5cO96
	sZs/1N+Pa6iIOcPzjd8CSAN9nFz6TN9mKcoQY+8pyY5lmi5F2kpVj2qy1ciL2EGgq3eeiZoC02W
	02eB60B32vSD502NMdkfpcCXyFaCNtf5n22/aLGK/WcNDOwEoFFC300rnoA5CSOf7/JFapXZ7YX
	zKt/mkc6qD9kQ5J1SbZ9f4KxfvqNuSz6npL6mJYcJa6nCbDurkdZ2mLProwxhCixIDmEzzfnwM6
	b4qetEOxgxvpMo7Jy783lx
X-Google-Smtp-Source: AGHT+IFwukD5DNSqehOYV9+RvvVGq7upnMbT0Iek6AnI933AnX9bpqbj2uYAEfMTQRiy63CyP5K42g==
X-Received: by 2002:a05:6871:29b:b0:32b:d4f1:89f1 with SMTP id 586e51a60fabf-32e567c3f9bmr301865fac.16.1757625752123;
        Thu, 11 Sep 2025 14:22:32 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:d684:59db:8b2a:5451? ([2600:8803:e7e4:1d00:d684:59db:8b2a:5451])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-32d357d3252sm673443fac.23.2025.09.11.14.22.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 14:22:31 -0700 (PDT)
Message-ID: <7da87a1a-1aa0-4625-9884-e88ce48b75a2@baylibre.com>
Date: Thu, 11 Sep 2025 16:22:31 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] MAINTAINERS: Support ROHM BD79112 ADC
To: Matti Vaittinen <mazziesaccount@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20250910-bd79112-v4-0-f82f43746a8c@gmail.com>
 <20250910-bd79112-v4-3-f82f43746a8c@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250910-bd79112-v4-3-f82f43746a8c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/10/25 6:24 AM, Matti Vaittinen wrote:
> Add the ROHM BD79112 ADC in the list of the BD791xx ADC drivers
> which are maintained by undersigned.
> 
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> 
> ---
> Revision history:
> v1 => :
>  - no changes
> ---
>  MAINTAINERS | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index af1c8d2bfb3deb870d8df44b8bae22e7cffb5aca..8e78a1168c17d8c2c7056e99e191d542ef0b95a6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21864,9 +21864,10 @@ S:	Supported
>  F:	drivers/power/supply/bd99954-charger.c
>  F:	drivers/power/supply/bd99954-charger.h
>  
> -ROHM BD79124 ADC / GPO IC
> +ROHM BD791xx ADC / GPO IC
>  M:	Matti Vaittinen <mazziesaccount@gmail.com>
>  S:	Supported

Should we include the devicetree binding files here?

> +F:	drivers/iio/adc/rohm-bd79112.c
>  F:	drivers/iio/adc/rohm-bd79124.c
>  
>  ROHM BH1745 COLOUR SENSOR
> 


