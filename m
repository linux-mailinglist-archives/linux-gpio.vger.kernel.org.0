Return-Path: <linux-gpio+bounces-13240-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 564F09D702E
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Nov 2024 14:30:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E499F162D72
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Nov 2024 13:29:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1366933987;
	Sun, 24 Nov 2024 13:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="HOCOk5UP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7526A18BC19
	for <linux-gpio@vger.kernel.org>; Sun, 24 Nov 2024 13:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732453568; cv=none; b=lEir28Xyq61fF94pORvC9pa8Rfk7JFNh+yfn9LaMg8BhsU4niHOsAcN9N//j+xmxKA0JTewy6gOfw6fHOzhbA33ojAs5tiO0Y96abuVSqD7xR7sLybIUAjOPaiRWpcjzbf2NrhZiCLnvXJ9u9VwBgRvnWxjK9XZb2YWQe9ur7Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732453568; c=relaxed/simple;
	bh=579OTAxxCTsdzuh+nLXM4qxYrJpkNNqj06Nk7dWiucg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=agPEnEYav/TzeMPiTpeg6/bpttab+9UrNBf1jZAbqJ0709ZWvudhoTBLZVnC4E8q5eRbX1Yt2O09wtRbNe4X9vt7rZONLcuGR9A2HFOPaxgO1UTxQjFcz19IXU7lg6TM1uK3MNuWmy7BUkxyLp75j5aHY/YpPvea4bC/C2nnnUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=HOCOk5UP; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38232c6311fso2473893f8f.3
        for <linux-gpio@vger.kernel.org>; Sun, 24 Nov 2024 05:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1732453565; x=1733058365; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UDgXaUWWMXn90x1MGvmiPRPBz637uFXJlZfJg+bhsYo=;
        b=HOCOk5UPZKkjXEZ3v14KiQMmAAGJcntS3/JT4Fq3QD4zOnvudYybDR2ooMkWesSgIa
         bNKg7jpn9eNP9/J2CXlRT891DqkzTATJFL10cELoo5QaF0hKpyIzcQOLyc+gtY5zqTs6
         yTCGtSoOIfg/HyXUqJ8jRKCdR9UiYRkQkJnzkHiiEhyy9G/GfPNhfOTgT8FGqmuEUuaR
         US2ve565Xs9ri1J03HdcvO+Oh+gDGDhyM4DcMGAiiEA0RXIxYM8waaLpKoZlghLltFgr
         o8j6dxvw4MHCuOOtO+bMuoFpoSz1GI0mYZ+btL4CWDOMZrHDK6jN4Jf2ekfOeTWV8pX+
         5PVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732453565; x=1733058365;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UDgXaUWWMXn90x1MGvmiPRPBz637uFXJlZfJg+bhsYo=;
        b=EAX9Cg5WSml1FWb0YRy1nPQaFn8f9We7ZHgjJGwDqAKyc/Ro11cO0PAgr8hCWS1CAv
         1SkVn/ltxcgvo2dLVps6gzuZPe73u5iYd1eswOZOWxdpUjho5iAAHtGVt5g2x8BZ8lvs
         a91D2e+C6MjImk9WtPZaS6xAc+komuoWPIACzl2fsW+AMNv/7EWUrUobmuB26kcZv5s1
         3dSzvn/rbPng2kL8z7gzX7weIe+wfFEpHRDczS4zVTyn3kYKeDL5SYG/amDNB/FlPKll
         r489kCpzBz9VRyxT7aZgWVhgtHLgaVtNxOnIRcmTOfZJeC+SjalcE6pwrf75ob+Gu8Ja
         zcGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzMW8ZIW2bNIFvPl/NKqXytGYcO6zZdkfL3KbTMcRcv+w0srvNSzacxdrt9cJRfpA12cYSurnQWa9P@vger.kernel.org
X-Gm-Message-State: AOJu0YwCA87PR8H1QeSKgEnvwQnUoz1CQvAIBFNXgPK8X3zz4tZehOrW
	7A/QZRk/vlRO7IXY9Xw6wZTNOnlwKNAz5PV7UxRpySPWn4seov+BwCvKdSvdIZc=
X-Gm-Gg: ASbGncusyXQuR8DT0L1Y7OL0Tncao+srlfG1dxPeeUa7i0jZosrdgvageDju4FkULwD
	5fm+mFekvYtKbvq7KBWj+EVkWpCsWu92DVEo8HzXxeu0jRH50xFOPul12jhzs8/IHbPQ6pdZ2+O
	fG+YyifwyNcYkepsllJKonvuUZoVsiwtQ5g9kdPU9sJ6oEAmfeD44Jb79fKS0HGalsHYgcWGv/S
	uOHRz44OX+8A6qLyK1yYFxYmt4e0ffG1ul+l/CYcXos+L2PVjYM/w/J4Q==
X-Google-Smtp-Source: AGHT+IE/ekA4n5NRsUPfRrSQ4WEQs+2aEfMt8e8Vr2hUc52ItH2CCdtUMuUey9X354G87nt1GQ6+6g==
X-Received: by 2002:a5d:64cc:0:b0:382:4503:728a with SMTP id ffacd0b85a97d-38260be41c0mr7533295f8f.53.1732453564522;
        Sun, 24 Nov 2024 05:06:04 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fad5f59sm7682760f8f.10.2024.11.24.05.06.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Nov 2024 05:06:03 -0800 (PST)
Message-ID: <55685905-7a28-4796-b386-1212bc1abed1@tuxon.dev>
Date: Sun, 24 Nov 2024 15:06:00 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/15] ARM: configs: at91: sama7: add new SoC config
Content-Language: en-US
To: Ryan.Wanner@microchip.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, mturquette@baylibre.com, sboyd@kernel.org,
 arnd@arndb.de
Cc: dharma.b@microchip.com, mihai.sain@microchip.com,
 romain.sioen@microchip.com, varshini.rajendran@microchip.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-serial@vger.kernel.org
References: <cover.1732030972.git.Ryan.Wanner@microchip.com>
 <4c7750b6f29b4ac0e2858ac279af7548e19934bc.1732030972.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <4c7750b6f29b4ac0e2858ac279af7548e19934bc.1732030972.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Ryan,

On 19.11.2024 18:40, Ryan.Wanner@microchip.com wrote:
> +config SOC_SAMA7D65
> +	bool "SAMA7D65 family"
> +	depends on ARCH_MULTI_V7
> +	select HAVE_AT91_GENERATED_CLK
> +	select HAVE_AT91_SAM9X60_PLL

These starting here:

> +	select HAVE_AT91_USB_CLK
> +	select HAVE_AT91_UTMI
> +	select PM_OPP

ending here are not needed for this phase, AFAICT.

> +	select SOC_SAMA7
> +	help
> +	 Select this if you are using one of Microchip's SAMA7D65 family SoC.
> +

The Kconfig changes should be a separate patch.

