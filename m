Return-Path: <linux-gpio+bounces-19798-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 82794AB0220
	for <lists+linux-gpio@lfdr.de>; Thu,  8 May 2025 20:05:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CFD2F1C4060C
	for <lists+linux-gpio@lfdr.de>; Thu,  8 May 2025 18:04:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2B6D2882D0;
	Thu,  8 May 2025 18:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="h/NKT0MV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E72286D64
	for <linux-gpio@vger.kernel.org>; Thu,  8 May 2025 18:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746727431; cv=none; b=QTf3NpvGfqcbhO3TYbaLFD3GfkF67+9xOGPs8lkl8LZFLw/QjkM58Y5fFpDYlxAHVdPG3PxA/H4aqVtG8gjQInDOOQejoQOS4XyuNTlSy3ToIFMnEnjRpcPKcTwuhPGdmvUVM6V+jG9w69NCRzv3hSDprcbQe7NvlCzSeCDPaTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746727431; c=relaxed/simple;
	bh=BPaM3uBsQYkug/7fouL8TiZUFIRkQwryGGOrlftw3rI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JpeBNuIDkGepULjMmlmDEej9UiyQ1U4BfoOQ1vTlHRnmf//rDyYrRVoJRIq1yMQ7a4i0f6CLQ7VH7D+ITotTC06L8EIAilJn1DgvJhpu8vOFclp7wLaQ/Q4377KSlupWnA9rgHJw+S+U1PrF4qPZ7FfinAz/39h5+KglSHDxGlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=h/NKT0MV; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-607dceb1afdso844290eaf.3
        for <linux-gpio@vger.kernel.org>; Thu, 08 May 2025 11:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746727428; x=1747332228; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eDIMXcUh+1t2oaHEL05AcYmEhaIiuHzLG4RdkwQs3gQ=;
        b=h/NKT0MV3szo5YA+cTcEaMfm/g+f0KzQJ91PosONwMUNS0wToMj+tFls38jgaX1uPk
         oOzMwrNE4VZBd+m2MuNC8R8iNS/DIQpoczEJb6rPaaX1jcu8CwuvfdP4yttusT6yyTfM
         qPl21SWeECE2vCHispLqKCQZhaVar87SqRnOQtj1ZOcW9+2NRXWqhPPUJTBl5/2zFYfM
         ay6NY5O9EN1S/u5TU8pkcohEr11mqVa1mTZXSizJxPXrnr8HD6/wQFoLXnvvAw3onxsU
         7Mq+4mTzDcR8lB2ZQu3Fcy7MlIH3WZxucn6FVPqI/dKX4HZCGo0Oj30UwsFsBfG3HTXN
         VfzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746727428; x=1747332228;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eDIMXcUh+1t2oaHEL05AcYmEhaIiuHzLG4RdkwQs3gQ=;
        b=gyG/0Vs4Ei/9XQAc6QidvwRAyOZ8RnkUmk2W1hmeAkKuOyI/7qP/2mQYFCjA5dmcvq
         FyfTycdrGjmHWGEGf5N79kwA66ffc6QVYKv9W6Cnh/drt9LMpExV1EdW8yVDUQjss4XU
         fzsPuBaLaqxzMgpxqN+JNSPBFD7nwB2lS5aQxT5o9ijxImRbh+L6FJL8VBROAmpq+M73
         uQE7ANA2ZqdLsBwAhQgBH3qHWfs1f+I76Z71O/6s6ND8VYjLZpP6MRH4Gx8CKlRsvJrb
         A43fWcHliZDTBAU9nYU1Vl2efhI4QLaKa1OS28UbtFlAaHa52C7yZC3CPoeJw/Tt98AS
         wAZg==
X-Forwarded-Encrypted: i=1; AJvYcCV9NOmlYF4MW4q+DPUWoj4yuxqYx0r5BVymAZUVaaBQW6G0pNY0V8LxsXc3MSkEJmr3FTm5CqDmI9yH@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+cL2fRPErHP3yeQZRecBQSH9puNaimOrF4lysBwwKz6me8zMy
	NpIXvu5d2ATzA6jrc61oGmeRVGbF8vpeXHPAZR699tYIqRVu8ml7+HETnufkEaVprzcKoN02FOk
	I
X-Gm-Gg: ASbGncuKjtNhZj4yS5Pu4Vd1IsSAknfm7KkzajfhiNet1x+ORoz8HXZz4FDq1MJyF7O
	hsXUHJzyjizoddr1Zp1N2bLtOPhIeTibEH87GOxDZCPQcQINUeBL2+TzgongVc4m0TYjibnW7LA
	4fkd6PAe0i/zCykxiGRlkzG0d/nmwdeno7UsgxL0J25qoOtLyMIKuY5Fagy5IheJKOZ1u1aG5g0
	NbVfZ1L20+wnEArTjexdXq1tF2634gZRVuGz1Hr78x897JUrwxbcAnZyc6g2qz0nQSP9aqYOMLm
	Y4VyPJI4qwGAIywOQpqQEzeva3N7OfONUzcO9yEK1rgwKFBmvwc+p6ogHS1qgMmMyRv9e7tRL9b
	FZlhjmhsWtMyMj8w8lw==
X-Google-Smtp-Source: AGHT+IEf3U6aBnbW0K6M59yOkNClYiW3gx4S2YQp31BRyUSuIa+tQqcacAiU4K9X6FdN1TJqPPe90A==
X-Received: by 2002:a05:6820:818d:b0:606:9ed9:c38 with SMTP id 006d021491bc7-6083fdc3f6cmr408574eaf.0.1746727427735;
        Thu, 08 May 2025 11:03:47 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:1120:d1cf:c64a:ac7e? ([2600:8803:e7e4:1d00:1120:d1cf:c64a:ac7e])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-403803995e7sm60463b6e.46.2025.05.08.11.03.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 11:03:47 -0700 (PDT)
Message-ID: <1f8e1576-a850-4ddc-9be1-16e59756c65a@baylibre.com>
Date: Thu, 8 May 2025 13:03:46 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 08/12] iio: adc: ad7768-1: add multiple scan types to
 support 16-bits mode
To: Jonathan Santos <Jonathan.Santos@analog.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
Cc: andy@kernel.org, nuno.sa@analog.com, Michael.Hennerich@analog.com,
 marcelo.schmitt@analog.com, jic23@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, marcelo.schmitt1@gmail.com,
 linus.walleij@linaro.org, brgl@bgdev.pl, lgirdwood@gmail.com,
 broonie@kernel.org, jonath4nns@gmail.com,
 David Lechner <dlechner@baylire.com>
References: <cover.1746662899.git.Jonathan.Santos@analog.com>
 <8b8f861422b15b1316a1513cd66abc544ab8c5bd.1746662899.git.Jonathan.Santos@analog.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <8b8f861422b15b1316a1513cd66abc544ab8c5bd.1746662899.git.Jonathan.Santos@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/8/25 12:04 PM, Jonathan Santos wrote:
> When the device is configured to decimation x8, only possible in the
> sinc5 filter, output data is reduced to 16-bits in order to support
> 1 MHz of sampling frequency due to clock limitation.
> 
> Use multiple scan types feature to enable the driver to switch
> scan type at runtime, making it possible to support both 24-bit and
> 16-bit resolution.
> 
> Reviewed-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> Reviewed-by: David Lechner <dlechner@baylire.com>

Typo in my email: baylibre.com

> Signed-off-by: Jonathan Santos <Jonathan.Santos@analog.com>
> ---

