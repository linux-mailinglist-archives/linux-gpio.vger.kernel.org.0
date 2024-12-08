Return-Path: <linux-gpio+bounces-13612-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AAC9E8646
	for <lists+linux-gpio@lfdr.de>; Sun,  8 Dec 2024 17:23:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC2CF1884137
	for <lists+linux-gpio@lfdr.de>; Sun,  8 Dec 2024 16:23:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 529D813BAD5;
	Sun,  8 Dec 2024 16:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="FlAE7rAS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0412D535B9
	for <linux-gpio@vger.kernel.org>; Sun,  8 Dec 2024 16:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733675008; cv=none; b=DtfJrAHBP5MqEkHfKJmTAxMu9HDB8C/wAYUpXDdclBm7wBttj6m9njbxdoFg/j1uBefvlHPG26vE8dBtiPPsVM5bGzUNr3H3n1Z/KxoKrAt2DLvi5K2j1bPvj7/BZmrl7we1ouK4U232AgqfF3XlczzRuCVMphjyTzAJnEjOwI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733675008; c=relaxed/simple;
	bh=JsGq0YhaA/fjrB5i30iNldjy4eoZqlyPCHjVboORafM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sQA1cH8fLeLr8vDzQ8eENS/5dkyIVZ/B0jIPQJ7wbjjhcC3d6hUaB44/XsWln0JepYofnQy+kXDbpfIqg0Y6fU8NTd22AHr/U3Dg7eiN9cVV+sOYghbV4jHplfQcmWb4oUxZXcHH6f0wNXNehJnCTAq3y/hQLwHp+E4hV5PBsNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=FlAE7rAS; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5d3e9f60bf4so1442200a12.3
        for <linux-gpio@vger.kernel.org>; Sun, 08 Dec 2024 08:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733675003; x=1734279803; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2Ja4iyQmAzISPsWmv2Yy+J9mTuONiwkR0YrQmpPL14U=;
        b=FlAE7rASzQNuKr9euzhs9NzZvBARBYt/IpnehyvTb2Wy5sL4zB0eTp5N9X6agMmUqb
         0h9+3AhChPJObIzyWK37nEiK2m0Po2I4aYYNFOgnbEHYmYI8BEbJtcvBac8LozdrUn1+
         63l1VJlqJNHYyqXjdbBabCVY4u8eA6xCSZqOf1CNwZlD6Pp8eEOsrUqsC3wl31ZFunwz
         ouBnXinGMtGMmuG9ZII48//6wXYCvtKggsg29rC1oAThHYHv1LLdDlXfklJT/BOFvKh6
         BPu9vvaK5wgHWMwrNS1p5ci1Ii5+DYSmjx4Q+Q5UvO2t/CG46NWI+2xKkEoPgZuqit7i
         tbzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733675003; x=1734279803;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Ja4iyQmAzISPsWmv2Yy+J9mTuONiwkR0YrQmpPL14U=;
        b=Z4NJvTqOEw9JG+177/wYImiFu42ckstSEH/8AveDNaZiCHoNgib+4/o3CpTkUyoLYa
         HjpWF9+mxZ8zao2dqxiUZUZQHLPUPfudBBVGxYz64zC8bnfumQXjW3CUBU+Tnob7/m/W
         HVisQPcr/t5TqS3uc+JyfHMfwrExtVo87fLAKwG61jraM0hBQetTacQk0bjj/0i1z21f
         S6hh2IJdMRID7HTFV4BNXQsOI+CJ3PcLY1rifnUyctdyeeH6KZ1il8CZUs4Mxp9YvIKv
         j4Tc11htyo92skaTifZFWFjKllBSNewn52VyIWqfeSJFnawd9JG3iiUZ6mC60mhf5Yxd
         wTcA==
X-Forwarded-Encrypted: i=1; AJvYcCX5YwoH+Yt+jhl3EI+EfhFw0DmIshaORi3vcTbaDA5+rIA53BFaQsk07I13TbW9WAcVJe7bl1V3gHw5@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0hcFJJ3PPCCqyIR/ZWkkBZylgJPW8L4elsYYkhiP4g0Ax8tmu
	ljsd7Xr8o3icD2cs0jiciTnOiHsnvt+UWMwIq2gRByPIivki562siwcsHxXJ5jw=
X-Gm-Gg: ASbGnctuittXP1qh97nP5eurmQETklQaXKkRk5DXzB0moghckmJoT8oyFcNtL2fjjVn
	UhBEzTv+qenIqN8gcg2OlhOLefM5W4mZPzu9qpFtPvqHVTjWtkmCYBNSjjt0I0ksmS7z0lLEpB3
	xr5/AdT/qiqxF8lUf5WLgqetGK7lM4ng1VFH7MzJU8NJKskLld097yG1QgIY/eYyVaxxt99Prtv
	FF8aDzkWpCLoMH8GfWP16Oxvp31RHVlPYV+sW/lVXr8MxX4ABHddEBmrP1gjE8=
X-Google-Smtp-Source: AGHT+IH86UBvGGnyAV0eg40dVkna/XfNJd8hDIG21j22U90IZW6G8d+OfAAcOP2EKLLK8RxyDrgbuA==
X-Received: by 2002:a50:8e1d:0:b0:5d3:d7ae:a893 with SMTP id 4fb4d7f45d1cf-5d3d7aea934mr5930138a12.25.1733675003295;
        Sun, 08 Dec 2024 08:23:23 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d149a49e48sm4883698a12.30.2024.12.08.08.23.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Dec 2024 08:23:22 -0800 (PST)
Message-ID: <40084072-8581-49b1-b0b8-e3c63dd39f3a@tuxon.dev>
Date: Sun, 8 Dec 2024 18:23:19 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/13] dt-bindings: ARM: at91: Document Microchip
 SAMA7D65 Curiosity
Content-Language: en-US
To: Ryan.Wanner@microchip.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, mturquette@baylibre.com, sboyd@kernel.org,
 arnd@arndb.de
Cc: dharma.b@microchip.com, mihai.sain@microchip.com,
 romain.sioen@microchip.com, varshini.rajendran@microchip.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
References: <cover.1733505542.git.Ryan.Wanner@microchip.com>
 <d5a22763a2081daa0d2155e2c05b7dc0eb468610.1733505542.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <d5a22763a2081daa0d2155e2c05b7dc0eb468610.1733505542.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 06.12.2024 21:59, Ryan.Wanner@microchip.com wrote:
> From: Romain Sioen <romain.sioen@microchip.com>
> 
> Document device tree binding of the Microchip SAMA7D65 Curiosity board.
> 
> Signed-off-by: Romain Sioen <romain.sioen@microchip.com>
> Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

> ---
>  Documentation/devicetree/bindings/arm/atmel-at91.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/atmel-at91.yaml b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
> index 7160ec80ac1b..0ec29366e6c2 100644
> --- a/Documentation/devicetree/bindings/arm/atmel-at91.yaml
> +++ b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
> @@ -180,6 +180,13 @@ properties:
>            - const: atmel,sama5d4
>            - const: atmel,sama5
>  
> +      - description: Microchip SAMA7D65 Curiosity Board
> +        items:
> +          - const: microchip,sama7d65-curiosity
> +          - const: microchip,sama7d65
> +          - const: microchip,sama7d6
> +          - const: microchip,sama7
> +
>        - items:
>            - const: microchip,sama7g5ek # SAMA7G5 Evaluation Kit
>            - const: microchip,sama7g5

