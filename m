Return-Path: <linux-gpio+bounces-3758-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 321F08673E9
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Feb 2024 12:52:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8B061F2C309
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Feb 2024 11:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F8611DA2E;
	Mon, 26 Feb 2024 11:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="b+S8ushs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A79E1B949
	for <linux-gpio@vger.kernel.org>; Mon, 26 Feb 2024 11:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708948329; cv=none; b=oPuoGCX+SHS9QX5g2z3DFbz1mgDf1V8gC9P2baVh3bwwGWD91yGMDrThsDj6T27ocpIgccwb+1HmtMRVvcisTTnJrXAKv5yC9fOTlTJZTALMyWfbIy4jmUUQ0RLKp3Mwf4045AgwL+JuqGDuKm7iLRH4uhS6Ig7ht1VlQSNtcrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708948329; c=relaxed/simple;
	bh=sOzOESPSJJuKs5PAS3HZPU1TL/jbqDPulGHUi2T1kSU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JCLPnq7DIQW0QrIkYwWzLv8bWvHg8SnP6N9mlS+GwH+Uv2YtacurynV84tGA0hpcov73cr6SJ54C1x4MfEzO64n9Sz3cgNaqFVEZ+73amrHD2tdrVfI2gaSDTU4xPfAMChGU5IdrX1CNXOjw45aHoArvfSStvnqgUsFncPwbGpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=b+S8ushs; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-412a87d5afcso1949345e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 26 Feb 2024 03:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708948324; x=1709553124; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mz1uRkxJ9UbCLdRqQYDHAKRawtBRwIdQ/FjWHaCkwJM=;
        b=b+S8ushsfvjC3dYmVdCRBizJgeMP2nlvA00iE4V7Ngk/iSoyp0xUKS1LAhId/R/+8K
         o3lgB0ikWp/TJZpTI2GoqplVdoj9LIu66X/epE4gRYpCgqFhVpHWIz0ggFH9KH9a0rGb
         cDWry9ljQS3pI6+oRIdyWzTKL2y9epGF6By9wo1LUG3Ixq6sUGlxvFEbYxD+nv8IHVcN
         n6yGuV9xsuOC5MFh9Ta6yH+2E/Xycr0KnJsc/OwH8DPRng2ZfHquU2vOpsVywwg9MyMi
         varINfdFm4Upvyf8iiGueSDR7pKE5wFybYqWkD6u/YMwc/FGDuAnqOg8kwfakVgV5vAo
         dERA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708948324; x=1709553124;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mz1uRkxJ9UbCLdRqQYDHAKRawtBRwIdQ/FjWHaCkwJM=;
        b=snbNnbr+nmzEoO3yO1OX2b+UgZRueHVlmxox+GZyGHy4KAeYOc11xHD8kpIcnnVUKN
         EcJPr3zrnJh0Nr3aTfnJvbaf1I7Y2ZKnf+3avwDhjE0En+E37mVEHbPTp/4zgRpgsgkr
         YWsTOCNgkKu6NWHgRV8scLsogXySGmnqONr3tblb96ssHn6YEnfiVzfhGNnnNhP3dNYw
         nHCKOGcZ5K+m7r1jHwc4oRNVb1AAwmrD+vDMOnNxR5kLjH0nV+Q/EJW9OhwblBhTg5zX
         ZCbM77yw3Joib/YL+epfNRjp4Xmj0jZrK/P/d6UMSjXfC54Kp8GkbNH44OlssF/HguZS
         kKng==
X-Forwarded-Encrypted: i=1; AJvYcCUUWeRBsbKszszPsJEK4oTzpnCndlxthtVH5WBGqEOn7fgJbYqo1PGmRF9KQXDkAyACAXZz7W39aoV94xRjFSmDpBkR1zFYIpOb7w==
X-Gm-Message-State: AOJu0Yyyz1gJNCBQme4wJHLiN/C8ghwWMjuca1hxP5o344pfkO2D/xMI
	oohe1k3YQ1BOEDIY0IVAwMt8Vddw9Xy+S5gOcZKatlOz6Lz9ad747Vv3Vm/LKrs=
X-Google-Smtp-Source: AGHT+IHuxCyz0aJYPuqa7jbzFzpVsMcqlrnBD87lnBA/2voj6xC84towYtJdrLWlnO4Avghcg9bmYQ==
X-Received: by 2002:a05:600c:4e86:b0:412:a21b:d5d with SMTP id f6-20020a05600c4e8600b00412a21b0d5dmr2728429wmq.29.1708948324496;
        Mon, 26 Feb 2024 03:52:04 -0800 (PST)
Received: from [192.168.1.70] ([84.102.31.43])
        by smtp.gmail.com with ESMTPSA id 11-20020a05600c234b00b00412704a0e4asm11692160wmq.2.2024.02.26.03.52.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 03:52:04 -0800 (PST)
Message-ID: <d3c579e1-1560-45a1-ab7e-59ed32986eea@baylibre.com>
Date: Mon, 26 Feb 2024 12:52:02 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/14] mfd: tps6594-spi: Add TI TPS65224 PMIC SPI
Content-Language: en-US
To: Bhargav Raviprakash <bhargav.r@ltts.com>, linux-kernel@vger.kernel.org
Cc: m.nirmaladevi@ltts.com, lee@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 lgirdwood@gmail.com, broonie@kernel.org, linus.walleij@linaro.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, nm@ti.com,
 vigneshr@ti.com, kristo@kernel.org
References: <20240223093701.66034-1-bhargav.r@ltts.com>
 <20240223093701.66034-7-bhargav.r@ltts.com>
From: Julien Panis <jpanis@baylibre.com>
In-Reply-To: <20240223093701.66034-7-bhargav.r@ltts.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/23/24 10:36, Bhargav Raviprakash wrote:
> Add support for TPS65224 PMIC in the TPS6594 driver as they share
> significant functional overlap.
>
> Signed-off-by: Bhargav Raviprakash <bhargav.r@ltts.com>
> ---
>   drivers/mfd/tps6594-spi.c | 15 ++++++++++++++-
>   1 file changed, 14 insertions(+), 1 deletion(-)

This might be a nitpick, but for the next version of the series, please make
commit message description for i2c VS spi drivers more homogeneous.
Same comment for MODULE_DESCRIPTION (you changed it for i2c: why not,
but then apply the same change to spi).
With these changes,

Acked-by: Julien Panis <jpanis@baylibre.com>


