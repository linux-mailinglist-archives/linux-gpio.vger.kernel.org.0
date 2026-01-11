Return-Path: <linux-gpio+bounces-30404-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 126C2D0F2C0
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Jan 2026 15:45:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C473D303D300
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Jan 2026 14:44:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2576D349AFB;
	Sun, 11 Jan 2026 14:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ookWjjOm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AB13491FB
	for <linux-gpio@vger.kernel.org>; Sun, 11 Jan 2026 14:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768142688; cv=none; b=cf09SdN4GjEqahMvlTeSomzBfNEbIVr+ya8L3tgF0rHL3fdONcwxHz2A+GTGTVYff/+HO1uu4bXOmvSpouBwbSIzLWZbtGOcNUfuAiuHldg5E/5PluCg7ZPj6qrcz/JNv7zHOA0T5LO2Rla/1eHTmUiVFgWhS2mvIdsHtQ4C+bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768142688; c=relaxed/simple;
	bh=6nDyEm7V4aXX61sF6eUN6LhYpH2LhvalQYGjX/umKoE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NCoLPwJP0tC2KIgH+MTM0dproBllt3u/DnN1sBYyje11kw1YGYGCJqAI669Si4Sl/CQcFebPNZxr9e0ZVICooqX2D9FHYucomj2zFzu0I95V0Toyxf3shvw6C02MrECCIkq233qf3S1di7yWuzej7RFp8aLY4F/0sLhEuQ4m8X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ookWjjOm; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-64b8b5410a1so8273179a12.2
        for <linux-gpio@vger.kernel.org>; Sun, 11 Jan 2026 06:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768142685; x=1768747485; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j5bvCXfrw0wJAyvC451z7sPKX85y6guKkf78mDKwHw0=;
        b=ookWjjOmWIYoGV8NQWvwlqznn4j8X/9cIu1N+sDUGIRZyYgwPku/XDBbuWd6K70V+Z
         P7HY/w/F6flzBr5IXDYHVEB3ltopxlY2WHQAhLaOCeZR/Hrc1OWjU/V0asR/RmmmcEc3
         tbjCh+t/BspEkplUHtFz+y05jDP3wSvjg3CpDLl8Q1Bh5+kq3Y2fFlpvC/a4tjSPRZgV
         /s9DK4NFB7cEl6zQXNMcpwOkQ/LYani5uYAJvLM+ZJjDPhc1ZKQqnqz5mjqsBNhxaSmo
         d4j1Vc6VbI8lJrz1ATl82rXlA+iKCYIQCQ//J+lmO8a7bTRC9QTjtYFdAUSJ22DHDbQg
         LgTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768142685; x=1768747485;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j5bvCXfrw0wJAyvC451z7sPKX85y6guKkf78mDKwHw0=;
        b=LvOh7TP+F9WEJNlsrcylCjSiKWYSYIXK24y5hyxp3brH34QNkKiFRNCLkq8BPP2I+g
         maW71/pq2vJQDk/Jvie53XgBGKhKur20Qr8A8MG3eyG9NSGna2rY3nt7JqfP6/QVCcl+
         NONDC7jsE531uVMKDLRokaYbfD0oIjETc+Ei6BC09PzQ66eR+AM+YPDMwwHmasrsBA2f
         V7//S7wCJnFRfb1xiwnhGq/6ANjnLOVT0ubzK5QJ3ddVpSs3nJQlZ83HDsde97sKqEC9
         TGXm5E22INx0LYC9nSjql3vvTxsZOMh1Kr4ufWq0/5+aziT1hNVStC092lMTZUR1qGRI
         KQhg==
X-Forwarded-Encrypted: i=1; AJvYcCWvW1a+tHMKQrPA2bqYFf0XNBvG1rBprwPXa04v4sTLH7hqKB2WAE579P2X+ZSCZtBx+nFVJ03k/km9@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8XKAUhlHJF9UT/Q6b1dg1yLibp+tNKorP7XusPNh/lwh8v80T
	AMPaGLx/5mGhqPXqJ0S3Ba9MuiuGsbVa9rtFXDjW3NFJsDYfdYcQauAIcZzv3uFRBSs=
X-Gm-Gg: AY/fxX4N+v/xPu13X1q8auUkMqi28qy+3Xzry3tE6HqAGPI6+nwBAq1v+fSHEWkvy1+
	RJHT0cHwv6vN8mA3DWbPBgwRZBmZWym+z+slmN64Y/J8loSCCM1J6l+FKwNO+4WB7nqh4xsuh3N
	dgRxlwrUAqGF5pYm+eDlrEiwLEFivzhC5bse6CczjubPh/prwEe5vibStJUE9DskvhTOoxK/wAd
	U2AjWwlC73/KSoVaVtShVvMNi/sCVeDDIUlOazr87YKY75PhNQjG9Fydp8g4K+edqVF2dwEdF2M
	RW1CnxI26+Rt89OInj02nspfFMsHNbKEXCSqnptYH7oshWgb3aEesPfitjnO5bCJXcOFYQqm9ac
	Bqgmb5Ap3QHsREqxLc0sRaxpcJZS3fX4fWBLDAwtDJO2fpGOW991Z2qlTQqdoXiTU4LZRI8iw6+
	TTLKhRx8vn1sQFngkAE1Zl0QU=
X-Google-Smtp-Source: AGHT+IHGUu5OYQ17yt0Sks10puH6ECXvHmROUNTsHAGUEt843jNznhl0Fa7GBLD0pgo1znXFARhYGw==
X-Received: by 2002:a05:6402:146d:b0:64b:4540:6edb with SMTP id 4fb4d7f45d1cf-65097e4ce77mr13908239a12.22.1768142685334;
        Sun, 11 Jan 2026 06:44:45 -0800 (PST)
Received: from [10.216.106.246] ([213.233.110.57])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507b9d44bfsm15272072a12.8.2026.01.11.06.44.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 06:44:44 -0800 (PST)
Message-ID: <ff941a66-cc09-4f57-a511-d253f48d7137@tuxon.dev>
Date: Sun, 11 Jan 2026 16:44:39 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/15] dt-bindings: crypto: atmel,at91sam9g46-aes: add
 microchip,lan9691-aes
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
 <20251229184004.571837-8-robert.marko@sartura.hr>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20251229184004.571837-8-robert.marko@sartura.hr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/29/25 20:37, Robert Marko wrote:
> Document Microchip LAN969x AES compatible.
> 
> Signed-off-by: Robert Marko<robert.marko@sartura.hr>
> Acked-by: Conor Dooley<conor.dooley@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

