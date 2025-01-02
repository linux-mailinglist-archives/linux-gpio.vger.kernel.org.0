Return-Path: <linux-gpio+bounces-14406-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0409FF8DE
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 12:34:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A852B3A2DA5
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 11:34:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E5AF1A83F4;
	Thu,  2 Jan 2025 11:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="EM43osrj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D01C1A8F80
	for <linux-gpio@vger.kernel.org>; Thu,  2 Jan 2025 11:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735817677; cv=none; b=IQmQjC/5au0xfjmsT2KZkHCPY3HJKXhQIHpiitPTIBDisCQ4McC3YEUfKhA2k6ynIcu0feFJcuDZ6pxCPRo7tzEC+XpOGhzhvPwUd9TslcF9oU7cul0HiMgaqnPxC5Nfq4Hp0yAdK/nHhy+hBzLQ6YP4RIdKXOlSZZvBoBSIoYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735817677; c=relaxed/simple;
	bh=xZk5juEQTblPG6mT+mOtIaKkOYTA19ECmOyXXFnW3A4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SFtQWqWCzyTYhzKjZAqmVeHM4LBGgRsH2c6C+XBGForMZqLvNRc1UF7VI1uewt/b2TMv74Iqj5b/RtSmkbSdw5LGo2tMLa+vm+2c0jr7aXnUa+Az5beSA33LF+bcOWfV0fW1CbdTAi4rhKCheZ2yXndH/ehFEYDKUNqKJWUAYTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=EM43osrj; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aa696d3901bso1258867666b.1
        for <linux-gpio@vger.kernel.org>; Thu, 02 Jan 2025 03:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1735817674; x=1736422474; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IJuTW2/wmv0Cni895FL84+N2QJ2H1fwMgsWcI7DGnW4=;
        b=EM43osrjrSM15bPSCvRGvVR7Qmi1JctNay6HwZePyE0XwIjVEsfPuCmPRoykfMBIVe
         EFejN/PzJGRW99/Zl+4S/u+k+wRbuaArdWcBNRmtNvwhsSepcY2aly2Ef/O8m0ewNfVL
         SEMVZsV5Xrry2p7etoQBMXACAdPGCxGHSh6n8D2fim7yt4ttWzlyrWcYpYpiTjruGklM
         MxqgaIRCBJSpPvG5wHKSVKoeoaTZqc6bd07MHoI/3p7WizITXFj1M/sp+T/esZ1fLI8C
         WlKyll5dP+DAApSR6ScRLLXlC1jPCvJOLKbFnio75pcv1ZaahlvrvnrKU/770e6ZKOLR
         Q1rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735817674; x=1736422474;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IJuTW2/wmv0Cni895FL84+N2QJ2H1fwMgsWcI7DGnW4=;
        b=CiBxzCsQRwdid6a2zVkCIGLLce7R1tMgrL7V0zkp7o0XKyEjc1dzUEaM+XVMbsudf5
         Ds1+AFw7OZe1cmsoOGwMsi2buhkwGQWYSOHpbSh7uU+uMsofjUHzy4RgLfENZDjorZj/
         jsS83OFUD1HHkLeJl5JYnwlN9LwAdvUobvd8N/uSOsPR2t7R36wqaHkkrLQXoX5Hmj+c
         aZdEoAmRCSRhh6Z3V2Vy7nwCu1cinG+wL0K7vjImhyhXIuHFnF2Cl03SQNh/Qw2T8mhD
         LQ+yG/p+/t2fckG9BO75BcQb+aWToO7xHOVQyP3rfrtd6m1kDAzmxZkw2fARWIv0nixF
         kmlg==
X-Forwarded-Encrypted: i=1; AJvYcCXBZTtUw79KI7ossnq8DBe3aKB619PEwDCB8MNorAI1J3EAxQ0r9APjaXW7dFBtXUdUc1l9geVC0k+0@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1C9K6PiYfuWswfKt+rd0zq+TDznEbDTjX+ZnOKbXE1f9uDKw5
	S7O9bkOlkTk+Rzs5/AFa1EYyFfftVtn2KXAaxs62/Ta+FD4ltvZscrZdcSXtRDA=
X-Gm-Gg: ASbGnctmPOtHi12MBerFBSoY6mcD0En8oGZI/7LaNCRx0Ee0uDa0K45L1xzOgt3DaVh
	xC8jJK6HzCBTIUyFKXMra856h90kwZosfcvLkcIG7UI3JgqdTO1+0/66JWIoXvXKVjVDpOEE3U8
	x14a0c2fKkDSg4POrBHKke/Q6cJ63/lfLcR1XY8zgrh2BBTMtjkuIpou8f3E8iwsLz/LQFQHXoK
	cc82SOrXmgKnEjT3DgR5bBI5dJdsr8Gp6xlUcbmlRK4kyhdVQPGsZ4JhUAfcZNkLw==
X-Google-Smtp-Source: AGHT+IGIlULUY5OVKXjFZRKGpQ2k3iKZcvVspZWtEdWr47v7SWAFqOFAYEk9fc6/cC6JF/XKlQkXSw==
X-Received: by 2002:a17:907:97c5:b0:aac:431:4ee7 with SMTP id a640c23a62f3a-aac2883fe8fmr4247597966b.5.1735817674243;
        Thu, 02 Jan 2025 03:34:34 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e830daasm1761964966b.13.2025.01.02.03.34.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jan 2025 03:34:33 -0800 (PST)
Message-ID: <9f2025e3-5ec6-4a7d-8a4f-d04b343da912@tuxon.dev>
Date: Thu, 2 Jan 2025 13:34:31 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/13] Add support for SAMA7D65
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
References: <cover.1734723585.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <cover.1734723585.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 20.12.2024 23:07, Ryan.Wanner@microchip.com wrote:

[ ... ]

>   dt-bindings: atmel-sysreg: add sama7d65 RAM and PIT

Was already applied from v3

>   dt-bindings: clocks: atmel,at91sam9x5-sckc: add sama7d65
>   dt-bindings: clock: Add SAMA7D65 PMC compatible string

Was already applied from v3

>   dt-bindings: ARM: at91: Document Microchip SAMA7D65 Curiosity

Was already applied from v3

>   clk: at91: sama7d65: add sama7d65 pmc driver

Applied to clk-microchip

>   ARM: dts: at91: Add sama7d65 pinmux

Was already applied from v3

>   ARM: configs: at91: sama7: add new SoC config

Was apready applied from v3

>   ARM: at91: add new SoC sama7d65

Applied to at91-soc, thanks!

