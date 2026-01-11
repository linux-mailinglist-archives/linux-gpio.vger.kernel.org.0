Return-Path: <linux-gpio+bounces-30407-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 856D9D0F368
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Jan 2026 15:48:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 032FC307EA2D
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Jan 2026 14:45:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6373A34AAE8;
	Sun, 11 Jan 2026 14:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="g58+wShN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC893491F2
	for <linux-gpio@vger.kernel.org>; Sun, 11 Jan 2026 14:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768142744; cv=none; b=opSv6OrsM62n3ga6yNHUTLb8HBM70qD521ag4CZnLhh6xacKVxTnGjdzF43PdD4yu1Sc5tNYubz+EeWtVX05StSzhqjLPCT62vCfbnV1S52okdKN6NKrDfaZhg/fcupPGNm4QBt1pHjjvVmnHc176Klvb0FX3Dj3+rqQlQoDsUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768142744; c=relaxed/simple;
	bh=8+o9CrQDP9rR7vhYrkmBD4TEK1Ah1Um118V33OBjIn8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cvm9QT8QFNqfK61QhH0cf5WYyI3UewY+UPgjslpazPxFCdhoF9BeKjGviBSLcb/CB9o/IQjJm5kuMEOGrYphqejnrbMCCsPexerVNemr8uEx51UVUR4H6UVvA78tHIXWTQTXZL6ksJUyiWIluQNCmGgg4fVWc3LiT0Batu9yfIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=g58+wShN; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b8710c9cddbso52217366b.2
        for <linux-gpio@vger.kernel.org>; Sun, 11 Jan 2026 06:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768142741; x=1768747541; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lfDtjbPnZQpFER+nbClQWcn44IBaDvTgM6H9iNz+Pz0=;
        b=g58+wShNUGm4cSq/cIFs5BcjtBtziWlVwOnRIYJ0JBVThU79/8vxkDEUyOzt7AzJBB
         cTZ9e0Q9nDikPkEBLmzCCkAYBMC9A64/OO6AU4Ed+EOGygTBTQEKuknv7Bvpc0Hq4pfW
         tWuCEazhna5tzsEGgmV/QS1mDV7AI8F7irWQCIvLFAdd6UBceXKAjkUon+m8Sp9IuWPs
         p2XYZJYaezhBjl4awlNqxLX5lYDftU2jHR0SSz7JmKdP4CM//mkBYchNBUXZFooCPe+6
         dp21GWl3JMqXh5qWiJlPzG2nBfXylKpA9kssFDHJxDnXDPKiHgK0Z6Kpaw+F7SivT7OY
         h9Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768142741; x=1768747541;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lfDtjbPnZQpFER+nbClQWcn44IBaDvTgM6H9iNz+Pz0=;
        b=qYwXG4dDxYXzEjCzRsAaIXeXEiCJ8xePPeXk+6fZ+quJ/6wXPbjhcEjGVjU4eCsA+c
         huPDy3kIDyoG6kjYs4bVemY8hmHdVSxoAWQgXYNqVhyKVBtqUaWuO4YHUjMLTF90AFQo
         /e3vU2VozUt4W9om4dh9qL29yf8o8Xeht0V2hfZUfJup6IUcHBYnrvEQj7gSURsJmojR
         18vaeBjjyHlq1qfGruJxinLp/G/1ER5kIFtDnE8zDHhgnurD1q6Ht4jM8wyF/hQ2iWKN
         jNFdVgoEadnzD6/UFqV+U6eybp5oKy1TdnAI7nZPWNEEqDGHHt2Udu68KUC301tgMD7I
         7/kw==
X-Forwarded-Encrypted: i=1; AJvYcCWy2Wwz87dapb0StxjVvKhyL0/auoM9JBDOBUjo/fKFizgTQ5aAH7FXrFhWZbMdSCScqlVkIwpWhy1v@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa2C9VQybYt//o6rb+l1mhQXf3DP5MhSu3mysrlVWwxZ8sqpj7
	dQt+owCxfsktJ0WGjgHRDbhXapO+OkC+Sm/dcEk70ZLOCHbLpD2Hs9bS/bT24VSXQCw=
X-Gm-Gg: AY/fxX4Zmu2rL0g12Ag13wKHJBgVsk1jI2tCLBIIik4WtwUIB3P3/zDqINKMLTdJy6k
	HyT3hsFqTpUfp2Cbe1fkrZ8qzG43rjAwxtqxshX72m5QdSJeM6/vv7FReinjK9/+vqqNr0k6H92
	+KxIIxOhx++Zve9VfuFJ9MUSnT/v0eHuoY2jGcu5X0tJt+l5HxoAfFemDDvpveYq1Gbs0EtaISt
	6L7n9viqYqZhUdHYtxxVp3L0pvJ3xH/OPyj1bYk+eZD8K0aQO9Llwdrsmh0Tk92//8N3hqUO3Lw
	xePPlc2DjwxhH53zQeWRIHqefCjzBr3KwAN6uHiaxQheqQalRNdP96A4IN55WCGV5I0XL8nQDak
	F+k4sd9FgNh6etEWWxH5BySbWgBYnDFtcDxUVRqonDxr8iov9ETAMbGbJF/gm2dKe2W6DM8NNJY
	XzUqIsOQRm4stTUYYYODVRshY=
X-Google-Smtp-Source: AGHT+IGzzRSG9JPiSsYLBto386guzGNBLdjrzZm8+JQDEKUQ0tWs5J3FidjE880cd/bBYxLZJrvW2A==
X-Received: by 2002:a17:907:9455:b0:b3b:5fe6:577a with SMTP id a640c23a62f3a-b8445169517mr1585237766b.8.1768142741298;
        Sun, 11 Jan 2026 06:45:41 -0800 (PST)
Received: from [10.216.106.246] ([213.233.110.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8706c2604bsm260020066b.16.2026.01.11.06.45.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 06:45:40 -0800 (PST)
Message-ID: <555883af-66da-43a0-a4d6-bd3bc52581b6@tuxon.dev>
Date: Sun, 11 Jan 2026 16:45:36 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/15] dt-bindings: net: mscc-miim: add
 microchip,lan9691-miim
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
 <20251229184004.571837-11-robert.marko@sartura.hr>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20251229184004.571837-11-robert.marko@sartura.hr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/29/25 20:37, Robert Marko wrote:
> Document Microchip LAN969x MIIM compatible.
> 
> Signed-off-by: Robert Marko<robert.marko@sartura.hr>
> Acked-by: Conor Dooley<conor.dooley@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

