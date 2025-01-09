Return-Path: <linux-gpio+bounces-14616-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D80E6A070F1
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jan 2025 10:08:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A51B716412D
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jan 2025 09:08:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F673215192;
	Thu,  9 Jan 2025 09:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="PJOzQmLc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E542144B4
	for <linux-gpio@vger.kernel.org>; Thu,  9 Jan 2025 09:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736413675; cv=none; b=K728ZDQrU1PrRJr63FTj9wlc5jCLOrapGD0UsffOhEpItfE+gUFSus4n+W+qSkRSpcj31M1kyI5rQE4PHGJ3ma4d7zaVlrip7rIM3SQ3gpc4Ngdb8WKrfM6NHI7eiKOcAeEeoTeYKha1zCtL8TUeKWtH4iTzcVGNdqRFg8EaAJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736413675; c=relaxed/simple;
	bh=lfI1k0wMgFMfX2M7M5coh8Z+nbWNplNx04OURuDOF0Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iBP8niwawcK5I9KMhfRg4rFPMPpgW2leE52Vj4XRTWhI51Le8CEhUApVp09LIE1fz6R2Kbzekk6oXAF1ojweWHAjAOo4RJkfnvwmzx924oJFN7FQhIwFRm1yI5Jb7wM292JkBYuo6RvhwRtWh74xALWdWf9w6Xe0NLtW2Kowzv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=PJOzQmLc; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43635796b48so4181915e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 09 Jan 2025 01:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1736413672; x=1737018472; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0z9juEC+YEqySrxS6PPDAc02oimlrf77ef6rngsd1Bw=;
        b=PJOzQmLcrw2qBmXfxtTaBlY5iEHmNlqwQ55+1EYianRSakqvIy8tOfMxL3giXAgyMk
         J7B10ZJlAYWKYNIg2m6w9bGsfDqD2P9QAcceblrV4HN3NZAJ2urnDPkMkM74/2vSP5pQ
         iXBZsJtq6bMZ1k6sNCIq8WknC0sB4QkmfMSwxugEKYGFn5NwYcrnUl9UScFP8aHVoiX7
         LrJ+nDDAIe+EdvQYbIGMExPDyqplLTx3m9mB4TESdxBxD9iS8OpOS+SDPuInuEjQgSdS
         DIOlSzoacsbf+KeZFxLpImP1XwIldb5wYimNWwUXU9TKr0Lf1AXe6f699K5SBg4AToa/
         MOTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736413672; x=1737018472;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0z9juEC+YEqySrxS6PPDAc02oimlrf77ef6rngsd1Bw=;
        b=c7UO25E5XFBMVEbVZUT0msbFrDeCtHX1yC5lFjGrQvl8YfLgowjwTwZk4CJmS98aBR
         8/J/ZQAPFUfWkHqf9Rn5V5xntsbM46u+SikAzXKlKRupY2zt6vrnFv5CjVb1PpB3mWlS
         LJj4CqNwyB/woETFxuv0nGuuoC82JoC/nJ4Xck4afrEKTKPsWtet+6GQksQwz5sQzb6N
         MR4ny9QztzU4bSqqvc6a3g39bQARVc3FXICaXSqwRBKXYfCxePQlDn11tWn4jVLgTIdk
         gPf/KDwXqNF98YBZ8Uud2MnCLtCdZ/bFc72ymvW2VfRtCKwDhFxrWwVAChwxfcxHeqkZ
         ZSVA==
X-Forwarded-Encrypted: i=1; AJvYcCVpHSPH2FT8q7WxjIq4S/fF5Lqt9Mk57hC8e9S+JXp+gYxMqhhAgo4i3pkh0nKJhp2MBqeaJbqe2QPQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzOAIDNn6u/t/ZGhdFphw46vUp0z6+11p8KO97lPZd2v0p62tBk
	yTiRwWhVSNllIE11t7bbeg1GQ8wQmvj8eopMrIcsXmoy99uy5xp7vXQYEr1ZC7k=
X-Gm-Gg: ASbGnctzovQUDrYss+duHZk2LVoMz4YteVwBLEWMZIfgBcg1atzBaaGu8L5HQOMarDO
	M/721DJ13IPKPQ4R4sYhJSMAFRjc94BJTe2QlQsEKS+AZ26DsyaIsY+HgqM43BAOHASbsd4wZ6k
	DgKAsF/PrAWL6SukjXrOHSOzsoMl6O/dlCmQ7ABo1LlmWcSAX86aVZBd5heIQk1U8V5pyz4ng8U
	NQ5HwEeh5ko5CGBW/dEQzWOnQ803ZSz+o+nTiZGLtyedsFZ9UPTPeovRbZhNMV4zw==
X-Google-Smtp-Source: AGHT+IFhZW5aT/6BOpkdWIdluaAhlNSbsykRP/2gidEWNKCALvd4CcTnaBDhpgLuYHgx1FqVxmhfAA==
X-Received: by 2002:a05:600c:444a:b0:434:fe3c:c662 with SMTP id 5b1f17b1804b1-436e9d7b99cmr10865985e9.12.1736413672521;
        Thu, 09 Jan 2025 01:07:52 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.102])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e38f0eesm1242682f8f.61.2025.01.09.01.07.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 01:07:52 -0800 (PST)
Message-ID: <680b0818-5a0a-4a98-825e-3d4dff0244bf@tuxon.dev>
Date: Thu, 9 Jan 2025 11:07:50 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/5] Add support for SAMA7D65
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
References: <20250107160850.120537-1-Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250107160850.120537-1-Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 07.01.2025 18:07, Ryan.Wanner@microchip.com wrote:
> Romain Sioen (2):
>   dt-bindings: ARM: at91: Document Microchip SAMA7D65 Curiosity

It was already applied from the previous version.

>   ARM: dts: microchip: add support for sama7d65_curiosity board

Applied to at91-dt, thanks!

> 
> Ryan Wanner (1):
>   ARM: dts: microchip: add sama7d65 SoC DT

Applied to at91-dt, thanks!


BTW, if I'm not wrong you lost the MFD patch on this version.

