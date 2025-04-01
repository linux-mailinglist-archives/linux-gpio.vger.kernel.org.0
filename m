Return-Path: <linux-gpio+bounces-18160-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2875EA78072
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Apr 2025 18:31:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 194537A233D
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Apr 2025 16:30:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CF0720D4F2;
	Tue,  1 Apr 2025 16:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="M4bvoux/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A6D20D4F6
	for <linux-gpio@vger.kernel.org>; Tue,  1 Apr 2025 16:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743525069; cv=none; b=WOzdgyDTigEGi0vfj4UJYmft+TBq65VO3Tt65LyDD35ize3QhdHyN/PUe9cYz7Jn02v0SAs6lBTMLt0XnASQNm9BWCPULw+x+q8KKEKpewRphvsDiM6NXMysYEOicJ3JUkw9peK3qjUZup0hjSQI8+qm9lPCJRgGPzWNydo6TCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743525069; c=relaxed/simple;
	bh=A+8CGVk+rHAGbpJizcWomttlBO48kDl6sqlUmqTyKeU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XVP/sDMTkHtKiZqFpoRaZyubu5x13Plvkwxp32bhmc2+wTtj0w8heU0T2fYvFzgywIOYXOAX7AMPVOkNAKtbdhxBnCw17VhCbTX+EuoqdOusb06PoR0ZLI+1Q6SpVZ9YfO/OFWiO5bq8CTrOqRI12KnMBbz6pi+czm7jKBKw9qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=M4bvoux/; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3f6dccdcadaso3893992b6e.2
        for <linux-gpio@vger.kernel.org>; Tue, 01 Apr 2025 09:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743525065; x=1744129865; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DIV9rDTCBYi/ZllmsgW2UcNi1UuQ/GGccoikNyYbqtg=;
        b=M4bvoux/hLbXvcgkPNY5thr8Chc2me65K1M+dghTe3mdBlSeaWIkMeGhYHn0xNTCXt
         KqD4Jkszy4gk26iEDuvoKl+5RgCxtFaG5h7o2qyt/H07ANJxQUMIB0dSfHveuZxMVYcK
         K0Jm/H3cbwuOLVnd7eyJ2jTHehONzxlOouCzXxkpNLFuOmI4J6EasFmQk/SZbZWeQ+Ow
         Bw5oQ/eM8LlRY9UnhQRaT4b+NCYdMRAf6qte579V6BbooM1AgESgnR+xqFYJwQPc9xAp
         FzUv/Cq/cVYlj0Yo093DJIYtgQAAfcAreKO8gzdBxbhzYOLppjbWkZ+Kw/BYLRFbN93S
         tsow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743525065; x=1744129865;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DIV9rDTCBYi/ZllmsgW2UcNi1UuQ/GGccoikNyYbqtg=;
        b=vzR7pB2gSfhI1+rNNsHdPbzuSk9Z57KKCXr/DL8jw3OkMZlP7UmswBOQqOfDXvPWKu
         4K/kVuB9A0Bf8TSlMDYK2IjX3cqwznjlI5TqYWbV4gR4zkqRZc9qGUx/F7aHC1UruUjz
         4hHj3w9upWj7ZnvYUPdlXURStFuobWjVCDDEzXhyvZkkQZVFf3fBECO9lCsYlqSCEh1h
         MfhDRH8p9+5AWp587O/O0YrWs0ArVQ6JViYJfZPav0ipbjcdtUY4GGYyRqBGSaVcDZhN
         Xb4cr3ZqGzAE2MkQ2tIKIUImrcVSGfHZqJpB/+gn1j4CThUHkKB6hlGbT/pBL2Rl/2+C
         nujw==
X-Forwarded-Encrypted: i=1; AJvYcCXlcWxn9Qw/WyFNiFS9MxfueFFna1zLlGUCTmN6p+XH/CSqAUdW8W58luYNNgXoKKoRQC1ZEPTSNaYk@vger.kernel.org
X-Gm-Message-State: AOJu0YxBFdHyeXuHNn1MacQC1ntk0hlQPNlxml670Wy5jucgyv1wCBEj
	FbcoNDVif2XbCJTpN1TCT98B1tARMqqIC0BrQTXxwGbZ4tsIjhujxgbkS1CwdqI=
X-Gm-Gg: ASbGncs2+Vw3XYfExCyfLDr0E19AmNkhuU0HMSgm7FYL7jz45KRmoVdU6m8bp0Yfe0n
	IG8xOCgjSRIB6doyhSH30aqOCY8d8/G4NYVlSfQjFsT7PhLimUVPhFHsIT/ndOcG7MIziXcQSt7
	JIoMAgG3wUI1QCwQhODHWDQPEaQ0eGZNxX1/80mqL3bIc4gHjtvrztUeQ4RTK2I0so+W5SJLRyD
	JFNuItJtEcQ4w3oAAstSwLxkM8sPiaQMPCbH92Q7bRWhcPgf7efh1gOuFLLaOp8PhXfFIqVZocg
	7p8mPJ16Z7rZ+olCewSo4Q0ehcoDriYzeTrpAAoVQDUip8+ttGZKHxlD4lFT1yKhbwFi2Da3FeG
	rIxGCUQ==
X-Google-Smtp-Source: AGHT+IFgxLHlEUHTiaVhBN/WS2y8zglVhq63twptXpO0781V1TyVKN+bnKqC1lUMJ1xUmse1ytdXjA==
X-Received: by 2002:a05:6808:1b13:b0:3f7:e553:56c6 with SMTP id 5614622812f47-3ff0f5d0107mr7722566b6e.37.1743525065453;
        Tue, 01 Apr 2025 09:31:05 -0700 (PDT)
Received: from [192.168.0.113] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2c86a5758e0sm2367583fac.29.2025.04.01.09.31.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 09:31:05 -0700 (PDT)
Message-ID: <c72e422c-1ad0-4314-8171-1c3830f63fa5@baylibre.com>
Date: Tue, 1 Apr 2025 11:31:04 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/17] iio: adc: ad7768-1: convert driver to use regmap
To: Jonathan Santos <Jonathan.Santos@analog.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
Cc: lars@metafoo.de, Michael.Hennerich@analog.com,
 marcelo.schmitt@analog.com, jic23@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linus.walleij@linaro.org,
 brgl@bgdev.pl, lgirdwood@gmail.com, broonie@kernel.org,
 marcelo.schmitt1@gmail.com, jonath4nns@gmail.com
References: <cover.1741268122.git.Jonathan.Santos@analog.com>
 <b0c7976d4bc817b7056ef40e3ce870b42e8a2d80.1741268122.git.Jonathan.Santos@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <b0c7976d4bc817b7056ef40e3ce870b42e8a2d80.1741268122.git.Jonathan.Santos@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/6/25 3:02 PM, Jonathan Santos wrote:
> Convert the AD7768-1 driver to use the regmap API for register
> access. This change simplifies and standardizes register interactions,
> reducing code duplication and improving maintainability.
> 
> Create two regmap configurations, one for 8-bit register values and
> other for 24-bit register values.
> 
> Since we are using regmap now, define the remaining registers from 0x32
> to 0x34.
> 
> Signed-off-by: Jonathan Santos <Jonathan.Santos@analog.com>
> ---

Reviewed-by: David Lechner <dlechner@baylibre.com>

> +static const struct regmap_range ad7768_regmap_rd_ranges[] = {
> +	regmap_reg_range(AD7768_REG_CHIP_TYPE, AD7768_REG_DIG_DIAG_ENABLE),

Technically, there are a few holes in here where registers are not defined
so we could split this up in to a few ranges to only include registers that
actually contain a useful value.

> +	regmap_reg_range(AD7768_REG_MASTER_STATUS, AD7768_REG_COEFF_CONTROL),
> +	regmap_reg_range(AD7768_REG_ACCESS_KEY, AD7768_REG_ACCESS_KEY),
> +};
>  

