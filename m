Return-Path: <linux-gpio+bounces-18158-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F29A7804A
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Apr 2025 18:26:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0E0816EC13
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Apr 2025 16:22:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFC24219315;
	Tue,  1 Apr 2025 16:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Ox2cgNtr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12401EF388
	for <linux-gpio@vger.kernel.org>; Tue,  1 Apr 2025 16:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743524127; cv=none; b=WmSzf4t3/dVNypAK0DJjEUs7Q02iXL88hXTp4UPrFVplQORl85MVkvhh8TYDdpr81dqJXpdggMHCoVUogmmv0Sr2ylHaJcR3K39SlOfmSIFo7PO2pvjOyANiba2AV7ElbFYhfjeyGguCmI4cNAFSGC3+6L5bfTJd7eTw/DHzTrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743524127; c=relaxed/simple;
	bh=MCDRrc6gITw7ILHOzJNTmL2BGOeoJlccEAeGN1hnyDY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XYZkVZ16gNI1JCqRoqxD2dFp1cF4r55mqhVOwc1tzSy5G2PWBNFwJbYoQMGKOH9PPyKLAJAFg+7iuNihdV01e7PrUrUzIdjEK+Giv+esv93YRV0R18PRUfuTKWy7JJhzeSgwZw0DdfP1StXfEAkCfBr34xThoLjCwNI50lzIZYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Ox2cgNtr; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7272f9b4132so4171664a34.0
        for <linux-gpio@vger.kernel.org>; Tue, 01 Apr 2025 09:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743524124; x=1744128924; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KV6A6SkFyjP45lT34VumuzTtupTmw14mZAo1pKWFBns=;
        b=Ox2cgNtrnIxNz8aG0aUMSR2rosHJfCY+GQRSrNdUVCK6mGUQ3XxVu878TmVFCE5+jR
         EUe9x2BdE+QnpP+rMy1/D0VSOy32zu7KOHDXRnw3hvogEiiaBLIxici2yC1eV12j+LtR
         saUsDBFjalGxEbzSzgdvjv9JQKWMYSxe6/j83Jld7scNrZJpHjLMcG2MK1v//VQ33F4o
         1mtSlwX6s/4fGOhhQ99QiR5HaVF+umven+BKDy0nIzOEr7oJhv5hW64vYYDHftUqFJ1b
         WnZX7m1kxcuZl9o0WB6Ri0OyF78rC1VJsb/MnA3Y/gPtufXeykZSqLNtOTLGZa8D7MXB
         Jfbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743524124; x=1744128924;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KV6A6SkFyjP45lT34VumuzTtupTmw14mZAo1pKWFBns=;
        b=F5GtR0lL4Ww/88QYD/Y6Lt7J8CJeUDM7WwYYW35kDYP2+vtjTSkDk5LafzgOFqhzMC
         2DqeDhO7jTG5McN/PgWvDhvUPCxaitvS3WChCK3wpINrzwPoX1sAMCGsNJCSnVHve27g
         JmQMVd3x4XWAObiXORb/dLcuFuQ/yp3bmBy/XZfd8WdI0J2KNyI4bQgKOGrMw9TnnOAI
         qfvT5AetO2QER+DnhEQ/82tEaamuyIiXM09ofBmXra4YkeUQEntnvBnHrg/TE5PylNn6
         G7pob3V+pfgbE9shEHWO83nVGraM1p7QYhKKULsFfBgE9M9QdNADFrYFPzWvC3OSGZXb
         wAWg==
X-Forwarded-Encrypted: i=1; AJvYcCUJxHQGpmcsylWl2FpewDZKr4T+YpuuoHGBFHyygY3BY7QgSx2OP9Ou52hwnq9F9enTjJqaVOXqXbwc@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi6FSkQMnMpJfJJGc89Z9Bya+7vH0VPpMqASeaFjvW+ay1AHMd
	8fGNxIXldJa6nShYELluGXndnN2Qswaz4ii6fw0OCtomIO0xcXN/o7ofV2AW+20=
X-Gm-Gg: ASbGncuXE7EjM5P6BFZpENCGnT+V1G9I2vMvz80kVFTxMjrrMDbS9W8VITjEdfX8ueW
	Em+YVAYgPoRVS96Avio4X7Ytm0lpN+mLSCZCiYOTHQdWnCNbc5mWIqXjxa1SgsXEEXcVcVN6BTP
	3X+qGFRuKNZjcwWAbvweSEvqlq9J14sCPScm+VZnLPsW+cs63nGrsH364z1IG7hCqiTD7NWIAuG
	RJ3EgkmuT5PUG7XT9vCL4lE8fT0SgK7WRTGZIzKv7IiERFJt05b8PZZu1BUB6iUGewwi9523g/Y
	0QA0qFrpcr7J1WzMLrU3N6jfm67/tI5Jv+1iGrXeG/5TV9lhcJTiXWZm7Mhrg1PabQOyttviUf/
	ZvYCEcw==
X-Google-Smtp-Source: AGHT+IHkFB1qErKdOP/R3+n0pyHcdkpWGJYkUI8OIJLr5yCsfzswBCRj23kPPNNelf6fm+HG+W8KGA==
X-Received: by 2002:a05:6830:3152:b0:729:ff76:5166 with SMTP id 46e09a7af769-72c637c450dmr8141400a34.14.1743524123806;
        Tue, 01 Apr 2025 09:15:23 -0700 (PDT)
Received: from [192.168.0.113] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-72c58092589sm1914991a34.2.2025.04.01.09.15.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 09:15:22 -0700 (PDT)
Message-ID: <e609fff8-9fc8-425a-8362-9205c17ffc4d@baylibre.com>
Date: Tue, 1 Apr 2025 11:15:21 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/17] dt-bindings: iio: adc: ad7768-1: add
 trigger-sources property
To: Jonathan Santos <Jonathan.Santos@analog.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
Cc: lars@metafoo.de, Michael.Hennerich@analog.com,
 marcelo.schmitt@analog.com, jic23@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linus.walleij@linaro.org,
 brgl@bgdev.pl, lgirdwood@gmail.com, broonie@kernel.org,
 marcelo.schmitt1@gmail.com, jonath4nns@gmail.com
References: <cover.1741268122.git.Jonathan.Santos@analog.com>
 <4136b5259df75221fc314bcd4a57ecaeeab41a45.1741268122.git.Jonathan.Santos@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <4136b5259df75221fc314bcd4a57ecaeeab41a45.1741268122.git.Jonathan.Santos@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/6/25 3:00 PM, Jonathan Santos wrote:
> In addition to GPIO synchronization, The AD7768-1 also supports
> synchronization over SPI, which use is recommended when the GPIO
> cannot provide a pulse synchronous with the base MCLK signal. It
> consists of looping back the SYNC_OUT to the SYNC_IN pin and send
> a command via SPI to trigger the synchronization.
> 
> Add a new trigger-sources property to enable synchronization over SPI
> and future multiple devices support. This property references the
> main device (or trigger provider) responsible for generating the
> SYNC_OUT pulse to drive the SYNC_IN of device.
> 
> While at it, add description to the interrupts property.
> 
> Signed-off-by: Jonathan Santos <Jonathan.Santos@analog.com>
> ---
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
>  .../bindings/iio/adc/adi,ad7768-1.yaml        | 28 +++++++++++++++++--
>  1 file changed, 25 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7768-1.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7768-1.yaml
> index 3ce59d4d065f..4bcc9e20fab9 100644
> --- a/Documentation/devicetree/bindings/iio/adc/adi,ad7768-1.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7768-1.yaml
> @@ -26,7 +26,19 @@ properties:
>    clock-names:
>      const: mclk
>  
> +  trigger-sources:
> +    description:
> +      Specifies the device responsible for driving the synchronization pin,
> +      as an alternative to adi,sync-in-gpios. If the own device node is
> +      referenced, The synchronization over SPI is enabled and the SYNC_OUT
> +      output will drive the SYNC_IN pin.
> +    maxItems: 2

This says maxItems: 2 but the description only describes one, namely /SYNC_IN.
IIRC, the 2nd one is for the optional /START input.

> +
>    interrupts:
> +    description:
> +      Specifies the interrupt line associated with the ADC. This refers
> +      to the DRDY (Data Ready) pin, which signals when conversion results are
> +      available.
>      maxItems: 1
>  
>    '#address-cells':
> @@ -57,6 +69,9 @@ properties:
>    "#io-channel-cells":
>      const: 1
>  
> +  "#trigger-source-cells":
> +    const: 0
> +
>  required:
>    - compatible
>    - reg
> @@ -65,7 +80,6 @@ required:
>    - vref-supply
>    - spi-cpol
>    - spi-cpha
> -  - adi,sync-in-gpios
>  
>  patternProperties:
>    "^channel@([0-9]|1[0-5])$":
> @@ -89,6 +103,13 @@ patternProperties:
>  allOf:
>    - $ref: /schemas/spi/spi-peripheral-props.yaml#
>  
> +  - oneOf:
> +      - required:
> +          - trigger-sources
> +          - "#trigger-source-cells"
> +      - required:
> +          - adi,sync-in-gpios
> +
>  unevaluatedProperties: false
>  
>  examples:
> @@ -99,7 +120,7 @@ examples:
>          #address-cells = <1>;
>          #size-cells = <0>;
>  
> -        adc@0 {
> +        adc0: adc@0 {
>              compatible = "adi,ad7768-1";
>              reg = <0>;
>              spi-max-frequency = <2000000>;
> @@ -108,7 +129,8 @@ examples:
>              vref-supply = <&adc_vref>;
>              interrupts = <25 IRQ_TYPE_EDGE_RISING>;
>              interrupt-parent = <&gpio>;
> -            adi,sync-in-gpios = <&gpio 22 GPIO_ACTIVE_LOW>;
> +            trigger-sources = <&adc0 0>;

# cells is 0 but this has one cell specified. So one or the other is incorrect.
Since there are other outputs that could be used as triggers, e.g. /DRDY could
be used as a SPI offload trigger, having 1 cell seems prudent.

> +            #trigger-source-cells = <0>;
>              reset-gpios = <&gpio 27 GPIO_ACTIVE_LOW>;
>              clocks = <&ad7768_mclk>;
>              clock-names = "mclk";


