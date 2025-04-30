Return-Path: <linux-gpio+bounces-19516-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2B4AA540F
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Apr 2025 20:47:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50B443B48A4
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Apr 2025 18:46:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 531F126460D;
	Wed, 30 Apr 2025 18:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="DXDdvIMN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40AFE1C5D62
	for <linux-gpio@vger.kernel.org>; Wed, 30 Apr 2025 18:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746038809; cv=none; b=VTyxRU9wtsZBG80EbXaOK1ULMIT0uktWgQWtsuupoymnq0fHL/MI3PbuumfTBDDCmk8PcrNTZAPtdx1KNTyn9OYWNM7d3owcEzUS5A/39bquY0eVX2l59vpB38/iYtC7TGZwpmajLvaakKd+79vcQQdEob/TdVPCDc6kNeMRPCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746038809; c=relaxed/simple;
	bh=Tjt7SVaTlOlpBRH6eoevRK63rsFx7sHHtqzp+HITOvU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HOqs6/REBQZeCC9uE6iL5MyMpVeNhzyiu28vu9tlT+PZEjUrdSbgiQZHHahvo9474Lmn8FcVFVNMfm3TjZCL7imxsOwIrdIcX5MjHCH5icQoLXNmob28OiApzDo4LfKX2mQ9ACY/gvV4JIJTyAOU3/qrcBRc3CsR91lPffsKDFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=DXDdvIMN; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-2c77a5747e0so126584fac.2
        for <linux-gpio@vger.kernel.org>; Wed, 30 Apr 2025 11:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746038805; x=1746643605; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RXxYKFdvPhnv+i2OQnjVQIRhugvl2GuR0kkHgiv5OW4=;
        b=DXDdvIMNL7KSK9YwgOALkU4pQzb+iWP+LL7DW5mTrJiAVJw0EM6HDgSpmxrl0hxXiU
         NMCy65C6W2EdqMHXGB1PIX+INDdzfTUSKxKWrUz9oaq19SN3caF94BIg3a9r3FepBeVd
         tv+VEuTdsqERsnnPrX4RSKmykOSEx8BcI8wnL1gPEImTvmzK/sF/fFR8RBD1HiUupgDF
         vl/8XDBVESobOrNd9sm8X1zeAJU6ijgUVHud0qgd4uGdxoULauxE2t5d98p6erIq0rhu
         DceZg3xT23Sv39lidSNM4UrkJzheUpqX9yk6udhN1HDKqDA8lDw5RK17b5WyQuAMsjg+
         SDQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746038805; x=1746643605;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RXxYKFdvPhnv+i2OQnjVQIRhugvl2GuR0kkHgiv5OW4=;
        b=pzSn7JEYc899JavCFITvpQk++2Pnc1FCtIl7mY6pp95fMBrm98+OMFUNF0TC5+o2kw
         1sKtnpYXswRQw4/fp7vylrBqJKnACP7B5hRE/8qgarHQmTGHwv1+3KA2zOqkO1b5rFJF
         pfo7r/FyCHHDIEsZ0cF8ujNWNJFUtKcY0TXf/KQBJlDN2zdyOiTTvGWp7FeGYU339FlQ
         qiPzuiho186ImSRv30i25rBd8EIFc6ruz+P8llL0qBzB/DcswuqpNLuIwPOZA9OaN+VZ
         jOrLOe7BX1zIKrKpQ5VHu4IkHBkSbHK60MLRoj9cMz3Ydcj8sQZ+i0mDLD9Gzk5lZCYA
         HPpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVZHKw1k17nj4MggGSyQaje2JXm48UKn9zI2NDS2QFtjppa5NGJR3LPtfkwSN6DJ5CcF4RK/1f5kQ8@vger.kernel.org
X-Gm-Message-State: AOJu0YyWzP9CaLD19gQw/lRYc3MiVgQsRbkTNbUD2AOglKGMbEJ/RRew
	f82kBsV6k2pFKJ47nAUnY+cp5q8g6bo/UMpYm9qlP9tp3wX03tUPZaf0TC2fD6Y=
X-Gm-Gg: ASbGncvYTpsZalwwRDH+xULZVF97/xUuTvagm4ZzFi1hvYj5n9AVk7j4lQiu/zhvxth
	LKio8IJ1wJStk1sXq9jKNHD+JAPTCd2gLSkqIfjQU/HXj+H5S6tALATO63PuIU4MWYYARF7i6Cy
	9bkhTTCf/1qONz5zBKrWyo4dqbZ68ZueD+Skex4blCSJnF3mzriTU0o/1Elr1v9WWlw4+5OJfND
	98KO8Etilcfaq9wu82pt6M4o9rPq1GjKVYkBytypYeRb6OIci66IGuqtRndz/HUocdmrVuhedHo
	sFLfvSwQamtmCkoNCmBXvn3Aju/5tZ0SmlMpH3omgtS+Rim+6J+CR/j9HJReFr58WoefoufVHjq
	47V6tw9OrNISfxh4PxUwDHibF1A==
X-Google-Smtp-Source: AGHT+IFPQcd2cZ+lppyTbrPKR3yE2CUjnINt9qXLSF2VkkLMNJ220iqVNXLIMGAHI/5Kafk9Ar//nQ==
X-Received: by 2002:a05:6870:8315:b0:2c1:9897:dd24 with SMTP id 586e51a60fabf-2da8c82f967mr227133fac.35.1746038805290;
        Wed, 30 Apr 2025 11:46:45 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:359a:f1e:f988:206a? ([2600:8803:e7e4:1d00:359a:f1e:f988:206a])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2da6e4f7cccsm577231fac.33.2025.04.30.11.46.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 11:46:44 -0700 (PDT)
Message-ID: <7d93075f-8426-45f1-8c7d-3c3c904a859a@baylibre.com>
Date: Wed, 30 Apr 2025 13:46:43 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/11] dt-bindings: iio: adc: ad7768-1: add
 trigger-sources property
To: Jonathan Santos <Jonathan.Santos@analog.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
Cc: andy@kernel.org, nuno.sa@analog.com, Michael.Hennerich@analog.com,
 marcelo.schmitt@analog.com, jic23@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, marcelo.schmitt1@gmail.com,
 linus.walleij@linaro.org, brgl@bgdev.pl, lgirdwood@gmail.com,
 broonie@kernel.org, jonath4nns@gmail.com
References: <cover.1745605382.git.Jonathan.Santos@analog.com>
 <128de2793d6d5424ad152c394faf1d51f0d56e0b.1745605382.git.Jonathan.Santos@analog.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <128de2793d6d5424ad152c394faf1d51f0d56e0b.1745605382.git.Jonathan.Santos@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/27/25 7:12 PM, Jonathan Santos wrote:
> In addition to GPIO synchronization, The AD7768-1 also supports
> synchronization over SPI, which use is recommended when the GPIO
> cannot provide a pulse synchronous with the base MCLK signal. It
> consists of looping back the SYNC_OUT to the SYNC_IN pin and send
> a command via SPI to trigger the synchronization.
> 
> Introduce the 'trigger-sources' property to enable SPI-based
> synchronization via SYNC_OUT pin, along with additional optional
> entries for GPIO3 and DRDY pins.
> 
> Also create #trigger-source-cells property to differentiate the trigger
> sources provided by the ADC. To improve readability, create a
> adi,ad7768-1.h header with the macros for the cell values.
> 
> While at it, add description to the interrupts property.
> 
> Signed-off-by: Jonathan Santos <Jonathan.Santos@analog.com>
> ---


...

> ---
>  .../bindings/iio/adc/adi,ad7768-1.yaml        | 31 ++++++++++++++++++-
>  include/dt-bindings/iio/adc/adi,ad7768-1.h    | 10 ++++++
>  2 files changed, 40 insertions(+), 1 deletion(-)
>  create mode 100644 include/dt-bindings/iio/adc/adi,ad7768-1.h

We should add this new file to the MAINTAINERS entry.

Otherwise:

Reviewed-by: David Lechner <dlechner@baylirbe.com>

