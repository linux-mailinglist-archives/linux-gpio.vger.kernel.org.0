Return-Path: <linux-gpio+bounces-30402-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 348BCD0F298
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Jan 2026 15:44:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7786A3030D97
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Jan 2026 14:43:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D7F0349AFB;
	Sun, 11 Jan 2026 14:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="NoTM+k2S"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539B6346AC8
	for <linux-gpio@vger.kernel.org>; Sun, 11 Jan 2026 14:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768142636; cv=none; b=h8ssbQiCgnwLK2eFK5XKAbcg4usetOeamBvND9/dgk6LyRzxepITC7M9/sf/QQrmn2FQBjf6aZPNuMsjuPceRGfqqMnLJjVqnJIZe9/IAFHpiAweKjl9zUgQWM+5Lir/CJbAM/Rx2/vNr91PMvHFel4g6qgX8vThkKr2nUOzkR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768142636; c=relaxed/simple;
	bh=PnoQRnuiOPkoaR4OWKdkvM54htM4YQiVOhdkWK0qg5Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JbPa9/IGBaM0h3I50EqETvRmq2T1panpWJVdZzRu3FfuKKKah/48ET1rs2dh1U6YwbYuwVsb5fSm/WnA8rE2/AkpScEZXR3w9G3x5IV3LxSl77KUcbFYHw/U21RqMJN8HBpydG3iJ/yd+ZlNvrTj3H4E+xFw4CDRsp6uEnxaZTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=NoTM+k2S; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b7eff205947so807241766b.1
        for <linux-gpio@vger.kernel.org>; Sun, 11 Jan 2026 06:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768142633; x=1768747433; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J8ivZWfcmepYc5T+3Up0ol6uJ6XFnUAYmd34ka9AIUo=;
        b=NoTM+k2SO5HylCVHcHNqCec7b7gBIoX2QQd6dHlIYohJij5ffigE1XqVlvs93gRqWu
         zSIkpxTis8OI66sDUEw9DNOr0vv38lEu0MABsxGfO4mb7PU0O/BAenxo8CfbBvrIUjvJ
         LRD7tBDt5dQcbYHF3oqbQYYGIp7uzpqccEsipOONv2jXTM+d2xEwUlLYcgjMnPd3UHaG
         v1LNXlJiyOp211uIT/EXTZAXo6ZwY2pa/ypM6jMTRJzxVWBG9VG0jzGXdKX5J6OsbGrT
         +1rzoSd6z1syRrs42BwDqXaqn95JEU2D+Qx2+rM7+dRq6TJYCADcu6Rbo1rrtVkRqMN4
         drtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768142633; x=1768747433;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J8ivZWfcmepYc5T+3Up0ol6uJ6XFnUAYmd34ka9AIUo=;
        b=TS8tTQtFszBjWBit511B9Uj5xZdEXH4McjVcMK9vfFPtUNDR7BZXHeWFjtYVHjxZTD
         e8xGkDX8es65LY4UITXAFYv/Km3YYJkZbo1YdhWbrIRIojT9eSPHONnHVVeAlGyXne8U
         wxhhQEbLT6kq/ZL1nHS68Ko1MgQeYAKyCacO7xTZU1MQtmdQ4MFebd5z8TUL9r8GK2vd
         Na8a1AJ7hwlVOEIVbaVqOgCTrcoohapwIDfProM6KzezU7E6JEyEMDCzOxK5SgBghElV
         wlkXB6JBv+nWwE42fq69S0dVpvlt9nFVMJvNWDZK8k8AMJcBplQIqHt4m1GT5sajbUS2
         p6WA==
X-Forwarded-Encrypted: i=1; AJvYcCWPEbU1mMqrTVLkzroANrb3WBRuUO9uzm5Lk2Vd7KEkPqR+gN0udlratD2UiPu4pEUol2xm1GJ31nJK@vger.kernel.org
X-Gm-Message-State: AOJu0YzFBTkdld4WoAOFivdLSXrnlzhtiVmc4GYtN0zcAPRJcvfFb3FH
	AZVsUCsMt/rn2ykhxS0mviEPGBiKalDEujfr4//B/xZF1j6MET1m5ibs5FWORjzR5/U=
X-Gm-Gg: AY/fxX44CP2HzUDCr5GBWAF36E/aXr+eY8KR5qCNKY6xHQC0EtqVBtqhKEiCKQe3g+z
	9D22g5EXp/RN177+ksCfiLIvWVzNyLWjVTo+whqbzDnNc/d+DG/JHc+FwQGQWFBHiIVdMfPteCB
	REEYfZQ9oD0DLdphlAq59WjYgQRpw4Re9yoOOCl5xNsLpLI7zODvFZoTup+khC8732FxB23qb08
	18PNGIT4zOAAVhg1s3wHfZD9oWBFnDAXRZfN8CcSAWQoucCjRAQfAsj8lgVPthFKpgkMpTaV3t0
	ojUqm3Ri7lNSUTpABjULJ0zJmvTsRY5OMeHAejDCK76Zyh1I7M9VTIYPwL6FadRQS4fM4ldRYfp
	Ns86YEEAhfFDBlezp6umSsXPBjKAFOgNgc/gqo+9m5w68eg+DNzxppj3KkAIdpzANq/DJVyx0zp
	wq964ylIOcnHoI3XcamrWBD98=
X-Google-Smtp-Source: AGHT+IEIDu7YG5XG/nu65TCe1ZGy2PfVFAGljLAgOLVEydIa/k97PZQn/n1VHfMaw/abNX/NIg40nQ==
X-Received: by 2002:a17:907:980e:b0:b72:5d9c:b47b with SMTP id a640c23a62f3a-b8444f6f7dcmr1568524366b.36.1768142632630;
        Sun, 11 Jan 2026 06:43:52 -0800 (PST)
Received: from [10.216.106.246] ([213.233.110.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b86ebfd007fsm491365166b.31.2026.01.11.06.43.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 06:43:52 -0800 (PST)
Message-ID: <d97c48eb-ebbe-4742-a4f6-220d4515a65f@tuxon.dev>
Date: Sun, 11 Jan 2026 16:43:47 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/15] dt-bindings: mfd: atmel,sama5d2-flexcom: add
 microchip,lan9691-flexcom
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
 <20251229184004.571837-3-robert.marko@sartura.hr>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20251229184004.571837-3-robert.marko@sartura.hr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/29/25 20:37, Robert Marko wrote:
> Add binding documentation for Microchip LAN969x.
> 
> Signed-off-by: Robert Marko<robert.marko@sartura.hr>
> Acked-by: Conor Dooley<conor.dooley@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

