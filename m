Return-Path: <linux-gpio+bounces-13615-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C49F79E8654
	for <lists+linux-gpio@lfdr.de>; Sun,  8 Dec 2024 17:26:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B10511604B6
	for <lists+linux-gpio@lfdr.de>; Sun,  8 Dec 2024 16:26:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B242515CD55;
	Sun,  8 Dec 2024 16:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="fKjFcwjf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57DF13BAD5
	for <linux-gpio@vger.kernel.org>; Sun,  8 Dec 2024 16:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733675185; cv=none; b=n7Qa06q5BQhx0vfvAuOnm48QMGI8Tbskqm03q6aTj/ewMzwjvX3FW5+7Yce41IY6XJJxJBRx/QoS71VqKBE4HRD8wLTlQW3X842DliqbIbc8V30SYPqMxRdhBA75weiJTHmEvkMUWGvmMhKeWyrtmA+IYolXBcmKbkG5G9c/0hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733675185; c=relaxed/simple;
	bh=LnCY1BI+0e0DzijFWz7V8IFK0QilDy2CkjwcUcta/VQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RRf8vmu2p5fSb1qI8Pnhl2e1Q7HOm4DKXEDgjfbyleOOcwGjcnA/Cy7h7p9DGoOlmdIeSFoaxE1Pxv3p5UBcm5LoIShRZ3JTbcpHUV4ZNlRe5cCdHDUm9KHBVue2opsCx0b0DXwoI9c6n1Lbm5Y2+75BZG4SFW8wTZKdM667fnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=fKjFcwjf; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5d3bdccba49so3705958a12.1
        for <linux-gpio@vger.kernel.org>; Sun, 08 Dec 2024 08:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733675182; x=1734279982; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EAP88DzTTa15uBA2TewRSQ1lUwNGCSJEF8LO0raYTt4=;
        b=fKjFcwjfGwG0bZWA3WmsySAMZfILpOlTW3jkHf+o7/9WC8T0sEEzvGnT6SCgFKnjyC
         V34TnhVkkVkT+8Y4kr47gvOKyWad0mNCY/9ckskLJfu4fB3XgHjQfeCcNNabkoCtZaKl
         PcBYxnvuwLQX5bIZR/94TIg+Ew05fLF2tYSDPwHXPQHhZQ5pGqgax6K4IjUCFCvE4/dK
         QJxZK2I0Zuduk7T9B32Bp6devxRqQZh/spqY/EYySvTZDwDS2bvU1c8MUQFG/oJrGZ7B
         8rorVjvkE4Fd1cK5iIahjgtaDZI6WAYXKifuBcY1ixfxLxGCdCZdm2q/zw9v6dIZReEA
         jqpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733675182; x=1734279982;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EAP88DzTTa15uBA2TewRSQ1lUwNGCSJEF8LO0raYTt4=;
        b=ulMyU7KuXnZc0UydiygviUejkrYXelPGXx5irRqSdiZEYGUxwT9+1KOIT0bq6wjihY
         23YLHmfaauolkgounHwlwg2ntlwyirhq5sqZSa+IMChvCFKHbyp8Eg2I50YKuH+e50fQ
         1xLCiIU5endhJrN9G1shy9He+jz7oehGtUnsRGcIUIDfFSjxrUSrGAELqrnysyR7D0VP
         f05NBJvBJ5dypyixDdljwMEdF2OYAaXIqq1m1eMsMeClpwfBH5XS6NcS62xMiZkAp/X2
         +KiGJOv7EJUK5vx6oquLCIxecv+L4/E+92fRgBlPd56CXc+dou5VSz6Xdlx7GriA7Vcf
         +l/g==
X-Forwarded-Encrypted: i=1; AJvYcCXEOMBCFlktX0fcYijrjXj6nBkJhjzDu+JQ+OjWW1Qhh8S+cp4XNhtsAr6tCcg+Ajhh9FN60xN1qJkh@vger.kernel.org
X-Gm-Message-State: AOJu0YwPhIRCEkHvGhyivIC8n2BhABDTWOI/ZWBA7KHasbP7+peAzQiH
	L4MDSsrbG4FraQ4iUGzdc0tLF9VgOU6mjNcXb8JAwOX2rybRMveakeMbqGr3h58=
X-Gm-Gg: ASbGncuMOleelu218trI0YUp8PHqyPwqD626hRzXWz0O6aBdxavv9XN9pbmTsycBMdR
	y8ZW82Xw6KdsH8+DbB8XKZzMKH2bF1RG5UdbCq49euX5K6I8RreXVVNpLBjs6QID9xQrN7DF/7D
	wgH26soRvBAD7d46x9UlyOinXPjCYbrXvb1YvONcItkmzyoBMTBSnfl9wjL5G91cg3ITcK0KrAf
	7Bm3lPTugxe5P7kYll9aec0dQjhnN/Zd2fpjUftcZxJ9EEzsoowKJnaHekc7Ys=
X-Google-Smtp-Source: AGHT+IFxY12KAhRWbQXwONnJAJURFo6LciXJ7/zgNx3XbUIqPdq8RMUGE7iRkFtZbi7PYG8M9RNg+w==
X-Received: by 2002:a05:6402:913:b0:5cf:b079:68ef with SMTP id 4fb4d7f45d1cf-5d3be70113fmr8820202a12.26.1733675182323;
        Sun, 08 Dec 2024 08:26:22 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d149a49e48sm4883698a12.30.2024.12.08.08.26.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Dec 2024 08:26:21 -0800 (PST)
Message-ID: <7177c349-a22e-4501-b42c-0c62d94c2f76@tuxon.dev>
Date: Sun, 8 Dec 2024 18:26:18 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/13] dt-bindings: clock: Add SAMA7D65 PMC compatible
 string
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
 linux-serial@vger.kernel.org
References: <cover.1733505542.git.Ryan.Wanner@microchip.com>
 <5252a28531deaee67af1edd8e72d45ca57783464.1733505542.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <5252a28531deaee67af1edd8e72d45ca57783464.1733505542.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 06.12.2024 21:59, Ryan.Wanner@microchip.com wrote:
> From: Dharma Balasubiramani <dharma.b@microchip.com>
> 
> Add the `microchip,sama7d65-pmc` compatible string to the existing binding,
> since the SAMA7D65 PMC shares the same properties and clock requirements
> as the SAMA7G5.
> 
> Export MCK3 and MCK5 to be accessed and referenced in DT to assign to
> the clocks property for sama7d65 SoC.
> 
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  .../devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml       | 2 ++
>  include/dt-bindings/clock/at91.h                              | 4 ++++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml b/Documentation/devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml
> index c9eb60776b4d..885d47dd5724 100644
> --- a/Documentation/devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml
> +++ b/Documentation/devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml
> @@ -43,6 +43,7 @@ properties:
>                - atmel,sama5d4-pmc
>                - microchip,sam9x60-pmc
>                - microchip,sam9x7-pmc
> +              - microchip,sama7d65-pmc
>                - microchip,sama7g5-pmc
>            - const: syscon
>  
> @@ -90,6 +91,7 @@ allOf:
>              enum:
>                - microchip,sam9x60-pmc
>                - microchip,sam9x7-pmc
> +              - microchip,sama7d65-pmc
>                - microchip,sama7g5-pmc
>      then:
>        properties:
> diff --git a/include/dt-bindings/clock/at91.h b/include/dt-bindings/clock/at91.h
> index 6ede88c3992d..e37f1b9cdabf 100644
> --- a/include/dt-bindings/clock/at91.h
> +++ b/include/dt-bindings/clock/at91.h
> @@ -42,6 +42,10 @@
>  #define PMC_PLLADIV2		(PMC_MAIN + 11)
>  #define PMC_LVDSPLL		(PMC_MAIN + 12)
>  
> +/* SAMA7D65 */
> +#define PMC_MCK3               (PMC_MAIN + 13)
> +#define PMC_MCK5               (PMC_MAIN + 14)

Spaces here --------^ instead of tabs . I'll adjust it while applying.

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

> +
>  #ifndef AT91_PMC_MOSCS
>  #define AT91_PMC_MOSCS		0		/* MOSCS Flag */
>  #define AT91_PMC_LOCKA		1		/* PLLA Lock */

