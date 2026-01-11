Return-Path: <linux-gpio+bounces-30403-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A71BFD0F2BD
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Jan 2026 15:45:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7E7A1303836D
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Jan 2026 14:44:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD05834A3CE;
	Sun, 11 Jan 2026 14:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="isTsJ1t8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1CB3358BD
	for <linux-gpio@vger.kernel.org>; Sun, 11 Jan 2026 14:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768142661; cv=none; b=kzr1AT6tnd3F6jtxDkyTWsrIGOlXBmDnAP3zDuN6Z8tCc0xm2pZaSgoernGYc0FCi44cYgbwguZba8bQ6Q0AZhj3YWGcDcVYnXwQCaxQ2XoL8KX+LwKXY2rfI64jxY1+xR9ErX+58oUSbSeMVoJ3UYjIB+zIptHCl1yghiKK6TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768142661; c=relaxed/simple;
	bh=w4Acm3yPEzhNfgXHej8RhBm1qF1q4y2VgssP/5Zk1hM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZqMHefu0weqDd7xCRnRl0e+7m+fapiDdcRYoI5P4LE9JyVjO0Oq8hGSXAeguHLqbG2ww0BkotbKE6aer8yKIhmm7Ca7mTQoPtnUdUuP0kTwjAcWe5NcF4fw6htQpdwPG79Q1Av0t+5LIzAKNyvL2JqenHnOuXp+82v6ywBU7YZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=isTsJ1t8; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b72b495aa81so1072717566b.2
        for <linux-gpio@vger.kernel.org>; Sun, 11 Jan 2026 06:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768142657; x=1768747457; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vh0+NaFNSqUUr0lRvi0qh/0gFpaLfgRir9e/Vu9U7W4=;
        b=isTsJ1t8ThUdJlPcckoMxmOQN5p6f/iPi1Qz4+ymaOaMGg0HLRsEsqSZm3KEyOWwaR
         ZyJVvDBUIjMFYRKBQWAAqUA2E8lh2ITkmYgecHewN41dPFpOps4j1iduS0RDablFZa6b
         HpMQqEuK2qHm4wLB8ElCKvNNwpBajX3awNIIukUBvuu/LJEu1PULd34b1y6SP3deF3w/
         ntQWAuPAxbyU1xlmVWz0zMWNGEeFBHz89/gZfq4/2h+F0xF4+AreQNuoFSvgXYEv2bpu
         Oy7HVBxdxvC5W0dQ4KZbQxmbi94FjFBo9OMaPT1Trz8YzH8aDwWO3B6X+slFxjvyAKcG
         eCcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768142657; x=1768747457;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vh0+NaFNSqUUr0lRvi0qh/0gFpaLfgRir9e/Vu9U7W4=;
        b=lfnvJ0zQNXiKYnXnJDLZR/6uB02x51l09fBsGuXGjze7BHQv/Cn5J19oGlYUQcXbho
         kPpmOtmkaHEXlVpTB4llSkCnDxNFb2SBhD+qHn05hpHP5i0k4DKsUEehN5D7lidVEsvk
         7KdlmVaSMaetxStI66sbwNtp4ywA+oIZb0+GC/koLhR4v5WMf4yPXO6eSxiBegMSjOB7
         CtmTEkzFYXRpPSBo49aVkg3Ek+VXMCBylDmp37bPKfncoZvyQYRMhBQ0pVGR53kiR+KX
         14slyfu+7FlwB0xra3Q2FRxHO1wUCgadj0N5g8Vf+S48pCLs65+g+Wz8y1oCx39bpJdP
         BW3w==
X-Forwarded-Encrypted: i=1; AJvYcCU3k9FldscGe3LWfgcb5aL0jyHmYiL8w6yZNQje4BQlFbCuwicpiA0eV+dfNAVk6orF4juBDu5w1MtK@vger.kernel.org
X-Gm-Message-State: AOJu0YwXlrXnI/CCjMxlcDmDalBnfkQ5K32qFVqSb4rra4xHnNLzqoAo
	kBgbBpZ8WfBxx81lxbdnjHDltP6NOg9NcoPsUR9/fffo+NA3k01Wx8hhjwgTysXgcZk=
X-Gm-Gg: AY/fxX6DEPZ6b9GtAMaWFg4y2l7LRRq5dgb1O8OBQigMvK3GOfWSUaDEVWFg7FEPX7S
	2XoECCB4X81xLKRRpTqPyxavUsP98STfChNVSHetqjnqhbA8iyvQZvIjYaeF5F+gEUuDtFM0kCc
	s3OTgb5HRHYBYTa29QUB7COB3qglG2Ttmft2ojvLJxKN+0Lx6syWYVzjVjs1ARmE7ijeuV1TSGe
	ovRk5WPanB3YlrzX0myZGl25uPBKNY/PAb7psWf6KAyQDg/UolJIfVKqsZXKTECWFWNDvemvX4u
	0rndKqkKMdZBaRaY2tVQKNcZYmdKeeApX4aqcQNzHsoKIekt7mt/ODOASRuyp+zRfdmgJaZY0DJ
	5e/EmYHDhQp5L4WxNPH0zozwVnOX8Ld1D71gfE6JakC8Ev6udNtEaBBZsm+1GC0k4lWdCOdrznm
	zMbA+na971aHgnkji0bznegJo=
X-Google-Smtp-Source: AGHT+IGSkgRdvFAJszoEIUVPnmxFKxpG81LZeaQDTCtjgK8/9NBkGo4UJCrHj8/qs3u8e7/Yxpu5vQ==
X-Received: by 2002:a17:907:96a1:b0:b80:6ddc:7dcd with SMTP id a640c23a62f3a-b84453a123amr1485279866b.31.1768142656775;
        Sun, 11 Jan 2026 06:44:16 -0800 (PST)
Received: from [10.216.106.246] ([213.233.110.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a4d3831sm1727347466b.44.2026.01.11.06.44.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 06:44:16 -0800 (PST)
Message-ID: <bb0c473d-0a86-407b-9c4b-9a39f9985ab9@tuxon.dev>
Date: Sun, 11 Jan 2026 16:44:12 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/15] dt-bindings: serial: atmel,at91-usart: add
 microchip,lan9691-usart
To: Robert Marko <robert.marko@sartura.hr>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, herbert@gondor.apana.org.au,
 davem@davemloft.net, vkoul@kernel.org, andi.shyti@kernel.org,
 lee@kernel.org, andrew+netdev@lunn.ch, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, linusw@kernel.org, Steen.Hegelund@microchip.com,
 daniel.machon@microchip.com, UNGLinuxDriver@microchip.com,
 olivia@selenic.com, radu_nicolae.pirea@upb.ro, richard.genoud@bootlin.com,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, broonie@kernel.org,
 lars.povlsen@microchip.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-i2c@vger.kernel.org, netdev@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org
Cc: luka.perkov@sartura.hr, Conor Dooley <conor.dooley@microchip.com>
References: <20251229184004.571837-1-robert.marko@sartura.hr>
 <20251229184004.571837-4-robert.marko@sartura.hr>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20251229184004.571837-4-robert.marko@sartura.hr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/29/25 20:37, Robert Marko wrote:
> Document Microchip LAN969x USART compatible.
> 
> Signed-off-by: Robert Marko<robert.marko@sartura.hr>
> Acked-by: Conor Dooley<conor.dooley@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

