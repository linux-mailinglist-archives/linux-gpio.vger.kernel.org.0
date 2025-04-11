Return-Path: <linux-gpio+bounces-18715-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ED24BA86840
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Apr 2025 23:29:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30477172E50
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Apr 2025 21:28:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBF4429B209;
	Fri, 11 Apr 2025 21:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="iHYXb1hk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BBF29AAFF
	for <linux-gpio@vger.kernel.org>; Fri, 11 Apr 2025 21:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744406882; cv=none; b=bn6sEaob+KXbX6hV6xq/MiRLE/NspipI1WJ9L3NYPFLSVhLUdHcjwZxTThveQcbsBTNY2Az+RgWu+KpAla3xzbDyPs6in7zEytUaDNUV1IEXOY0mhBQ+oN3nHEODqLOPM9MLvQxQm1PbLEe3dmGY7zfKcV29HYcUySj3sdJosa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744406882; c=relaxed/simple;
	bh=sdqx44PtqxCm5QrNY7t+w2BO/7TFReejCzNRo/28Zi8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kYNz7xdc/w+WZSXjOJtHUBEl4h+jG6vEVHhEELSek7ZqqSrasR2AYTI1izRr/+XPh4w/KGiH+09WWbKqh0Ra+R7B6bNKteYrU423vn4dMr3s8Klkk4fxjWkWBjI1Vs6Bf7UCworyAlWvG6nwiFQtPkKQaFqQuOQbiRgWAEJZjlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=iHYXb1hk; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-2c7e5f7f0e3so620165fac.3
        for <linux-gpio@vger.kernel.org>; Fri, 11 Apr 2025 14:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744406879; x=1745011679; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=On+xUG1gqEO9h5Is3T7qaz4K3CvsUsawvmEk/id/uYQ=;
        b=iHYXb1hkHg9kfYOJ/DxONPqDBFLtQbDTFhlLb9IdGmZAHGt0PAeKa63sc/qFVt/tyz
         1qPTETs1dBNHoxNIJbyMi3GumqU7polD9OhJWeCf+yJCiiGaarsVHGz93sE6JtVWiLHy
         n9ziUQ9gW5m/rUrqq3ogB1IElK1F816HMJziU+dcPEwPUviMKzHIbT8WVZppSCzK+UHW
         ppq36qMGgtxYjdNpbJ+bVqsw1gRVG0mT8s8GG9O2wMgU7YnXJMwxXohxikHoCfkgTYcK
         wmobs6IP2hGhgHmkwlg5rNCxdDcwJHT+0fhyo+CCgi5Yj7cq3e96RFjnR4dyAvKy6G6j
         UEaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744406879; x=1745011679;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=On+xUG1gqEO9h5Is3T7qaz4K3CvsUsawvmEk/id/uYQ=;
        b=hQ95pBcJnzSD2XEuNYwIfn8c0+gK47+A+L53eCVIadimYqrd9HewqGvKx+uzEw6fQU
         vfj2tEKbDEU/ySNsfdpbliJ6AiG/Sj0ROXL36yL7w/aSZc995DBTMBqt+pOtI5jm8r8C
         OfbQxoFg25RB0hR8+k6RAAmlc/UypXFPGWtBqgezEqpZ/Cbip5/mJsC0INNIRB0187N5
         oHN2HMNIz77Xgp+BZohElqJFJtfjQBtQSDD1gD0QRshpmsLMgdTg8MT+dK0icuF0y6qb
         5x0TAzlU7qYm8gX7FQY6bTgL4uG/HZenjvrWFO/6WPUm3lNLhiafmrLKMUF75JPhMB64
         OEHg==
X-Forwarded-Encrypted: i=1; AJvYcCUF+i6oFUqDVLDNi0KW1k1K3KjmfPBwJ6w9s8mYwjvBTXr7xgAN0pC3Nq7bzogeB1+t4NaLmM/fQ1LJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyecNvCvzgToTWeeQxTRWyvyXbeb5jmU4GtugBgDi4tCrpylgIM
	7RzyG531CL60v2Vv6IaJ4+zRJfyig+2yjejZUIGQ3xWuRFlxpR4h9+eufRlE3C0=
X-Gm-Gg: ASbGncu25ggy2hFFUXAxYA4FSjZAiuhSLwymMMsysf6sirxFepzPz0kXDW7bK/jhzLu
	O/SO03BECyNAbcqnTekJISe3ZDVkod1tLGkYCZATmAyuT7XD3JA+5WWXKD7AIhHrWOG0MSFSBeF
	bLhBAbRVJXjdJpnSlK27ZtpX/CDuOjpJutTeq9xH85wmCHnOZPqUuKfz7M6wImO0Gq4jGayKXqM
	JoxSEK1YjJYGOpy6AHARPJMGJ3TCV+9+F7KmjOkaU/JkJxni2azj/q6bvuLtkyud3IDKtKn9Dch
	W6wRkdVkEjQpy+bVQUvRC5WKhmY28rRHYcoclmjh3Tns9BX/qTu6OVLWDfqK5AXT9AURZ/Xgv7x
	bYQ==
X-Google-Smtp-Source: AGHT+IGg4QTDCtKihh/nzT1O5kHrlDnXB+hmqOehgfPCzf1mTXNbF9HZA4hvnDOSlTi98axTDj1XLg==
X-Received: by 2002:a05:6870:2199:b0:29e:503a:7ea3 with SMTP id 586e51a60fabf-2d0d5fc7469mr2321123fac.36.1744406879312;
        Fri, 11 Apr 2025 14:27:59 -0700 (PDT)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d096d48372sm1316613fac.43.2025.04.11.14.27.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 14:27:58 -0700 (PDT)
Message-ID: <938b950b-4215-4358-a888-6f6c9aab48e8@baylibre.com>
Date: Fri, 11 Apr 2025 16:27:57 -0500
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
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
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
> v5 Changes:
> * Include START pin and DRDY in the trigger-sources description.
> * Fixed "#trigger-source-cells" value and description.
> * sync-in-gpios is represented in the trigger-sources property.
> 
> v4 Changes:
> * none
> 
> v3 Changes:
> * Fixed dt-bindings errors.
> * Trigger-source is set as an alternative to sync-in-gpios, so we
>   don't break the previous ABI.
> * increased maxItems from trigger-sources to 2.
> 
> v2 Changes:
> * Patch added as replacement for adi,sync-in-spi patch.
> * addressed the request for a description to interrupts property.
> ---
>  .../bindings/iio/adc/adi,ad7768-1.yaml        | 38 +++++++++++++++++--
>  1 file changed, 35 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7768-1.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7768-1.yaml
> index 3ce59d4d065f..4c58dbe8f749 100644
> --- a/Documentation/devicetree/bindings/iio/adc/adi,ad7768-1.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7768-1.yaml
> @@ -26,7 +26,30 @@ properties:
>    clock-names:
>      const: mclk
>  
> +  trigger-sources:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    minItems: 1
> +    maxItems: 3
> +    description: |
> +      A list of phandles referencing trigger source devices or GPIOs.

I don't think a gpio phandle should be directly allowed. Only a trigger
source provider (something with #trigger-source-cells).

> +      Supports up to three entries, each representing a different type of
> +      trigger:
> +
> +        - First entry specifies the device responsible for driving the
> +          synchronization (SYNC_IN) pin, as an alternative to adi,sync-in-gpios.
> +          This can be a `gpio-trigger` or another `ad7768-1` device. If the
> +          device's own SYNC_OUT pin is internally connected to its SYNC_IN pin,
> +          reference the device itself or omit this property.
> +        - Second entry optionally defines a GPIO3 pin used as a START signal trigger.
> +        - Third entry specifies a GPIO line to act as a trigger for SPI offload.

SPI offload is part of the SPI controller, not the ADC chip, so doesn't
make sense to have that binding here. In that case, the ADC is the
trigger-source provider, not consumer.





