Return-Path: <linux-gpio+bounces-13622-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE4C9E8683
	for <lists+linux-gpio@lfdr.de>; Sun,  8 Dec 2024 17:34:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBE511884C1D
	for <lists+linux-gpio@lfdr.de>; Sun,  8 Dec 2024 16:34:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55956170A1A;
	Sun,  8 Dec 2024 16:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Qp1/DbZZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B3116EB7C
	for <linux-gpio@vger.kernel.org>; Sun,  8 Dec 2024 16:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733675665; cv=none; b=FvlKdL63AK9L8lk4QfxmDM+QBeJ5Ys5wty1E37B0+MTbXy6wfo6sMudpHkuIe5Gt3a05rqoiWvbGlYYzm3ycTX4/xI0dLDmLBJ2vWynkUuB7H82BPsD4m9VRFwBCB91s31SH32GnJGSA9e5Z3qdTUjqQU8U2tdBsXaADhHigMRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733675665; c=relaxed/simple;
	bh=sfwHUbpW8XDdoQtwvphDU/WFW5sPN+tjwHvMRp8wfok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RGjJqsgNpUKdwSmDHh/CsHoxPhB3FumHWgLTPYi5qEU7cl8LrtASygucC1RY2NQUxeH6MAbtKVvmFAOufYMrUHd840Y6MmRqctToSaHjgoHhfENaS7fgvke2KXYg0ixQvK7a5Taib4CXaAM1wno9i3rOJ8tKV8SQC2gx6fRqX44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Qp1/DbZZ; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5d3e9f60bf4so1451639a12.3
        for <linux-gpio@vger.kernel.org>; Sun, 08 Dec 2024 08:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733675662; x=1734280462; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1iT4NSRVpd0erHt+8HYNhpTfhW4lFJNhq1fa73nwHoQ=;
        b=Qp1/DbZZx2NGqg7d8a+PsUD+4gr75eDQYBm/GAQqKy3W44kbIF5ZRsXDdpQwfWmapi
         J0j62l4c/cEZijGgoxTW1jXxIoxpBn1NKr1TSH9KAb1ynmMB1pU7j+U0kalioAX1lFA/
         xngEgTOiSVlQ/yByDnSqrEbZTmCNYyLilDculHjIVpDcPpaoOUTt7iGnUgknRI9jtyR+
         R0gqqBTY3927/kyVyRY1+H5lD2tMWJGVxsvtegnjeCWoQEQIsdEImYlKRF02seft2PcQ
         tM7US9+v1TPP/arR/+lxFpV7qxttnolxheb3JOpXPEQgNAT1Rtb+4Ut7l+2MCYCPJOWx
         qyDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733675662; x=1734280462;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1iT4NSRVpd0erHt+8HYNhpTfhW4lFJNhq1fa73nwHoQ=;
        b=Bv9xJ7LJ7yzri+ArE+4wjJUNwM5pYgeykX4+Ms1/8n9FW0QOEowZWCQ/eupRWuXACz
         frBeO+bxhqz74aB+dP9cDW7eEm6JMQd7QLPnxN63n7LzJhINuOIzqKS8PngeeWktzai+
         oYN4da6IPoZdedrDf4okqQA25KAJUm71/a+nF0YnMY73/gL9KqtaB84TPQOkYQX0A5Mr
         Z87JZPXN31HAkbDgci1vIMQkghLHMN/upFsq9k8gBhkkbnO4lhxZk3o+CHwsGCi8lK9h
         YvwMvFk9m4D4uF5E3Hx9Dd7l9Qj75dn6LIw6kcntEQHjeQYG8bVg/8GLT48gAx/i0arU
         bAnQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1D0/zvHWDNvOKE5dY0+jppT/sMGDsFJs/Pd5no4KPcb9v1Q+T09NzTlv7AeU7TGl27ez7LtmZ+5v0@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7+AFwbmqnprWqi3k+3FI4YczSqkAeZaqe9YBVg9lbUNEZnwMY
	PL1BhKeQyeePpxbou2D/rqZMfJNvrzv/TIZ5e783ZhLS6ShjWs/DVJvzBbYvLSE=
X-Gm-Gg: ASbGnctiNf2xrMC7yUEwMtkQqPlETODUj38JAInHccpHrV7uq4CSlVa0xoMjwNJulYT
	DPlj3CvYnajaEIPlu3yyNpoA5y+Gzu2zCm4a4ZHD6cf45HS/aB9QoBGliBBIGhoJK+HPnxdZCYr
	GaIUIKVyXKZriLZPZ+bUjb7AWLHktRvX9PDg6bEYAxOCY8vA8p7JMiwtdeydUQapw2P1F8dWFof
	XfBaj10Vy4GZfOIjvAeLm3T9AL9SjYPI1kcQdMEn12iReCYSRJk6s6zAi4=
X-Google-Smtp-Source: AGHT+IHiWExZ8bPK4wGroZLlYPeAABfeeYHqCY2Pc7mcSXStanDyIam/ppcbW7eqPB4JrD4ws75z6g==
X-Received: by 2002:a17:906:314e:b0:aa6:57aa:1fe9 with SMTP id a640c23a62f3a-aa657aa2b65mr521603366b.51.1733675662072;
        Sun, 08 Dec 2024 08:34:22 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa67a4f8dc2sm113804466b.179.2024.12.08.08.34.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Dec 2024 08:34:21 -0800 (PST)
Message-ID: <30d2d8af-836c-440a-8b39-4131e8c85540@tuxon.dev>
Date: Sun, 8 Dec 2024 18:34:18 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/13] ARM: at91: add new SoC sama7d65
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
 <465960c9240553753e96a7f4ff3f48879ade7558.1733505542.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <465960c9240553753e96a7f4ff3f48879ade7558.1733505542.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 06.12.2024 21:59, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add new SoC from at91 family: sama7d65
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  arch/arm/mach-at91/Kconfig | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm/mach-at91/Kconfig b/arch/arm/mach-at91/Kconfig
> index 344f5305f69a..2c7179b1baa0 100644
> --- a/arch/arm/mach-at91/Kconfig
> +++ b/arch/arm/mach-at91/Kconfig
> @@ -58,6 +58,15 @@ config SOC_SAMA5D4
>  	help
>  	  Select this if you are using one of Microchip's SAMA5D4 family SoC.
>  
> +config SOC_SAMA7D65
> +        bool "SAMA7D65 family"
> +        depends on ARCH_MULTI_V7
> +        select HAVE_AT91_GENERATED_CLK
> +        select HAVE_AT91_SAM9X60_PLL
> +        select SOC_SAMA7
> +        help
> +         Select this if you are using one of Microchip's SAMA7D65 family SoC.
> +

Spaces ^

Other than this:
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>


>  config SOC_SAMA7G5
>  	bool "SAMA7G5 family"
>  	depends on ARCH_MULTI_V7

