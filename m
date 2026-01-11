Return-Path: <linux-gpio+bounces-30399-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA4FD0F097
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Jan 2026 15:05:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EC14F3004EDB
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Jan 2026 14:05:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E14CE33F8B3;
	Sun, 11 Jan 2026 14:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="A5h3J93L"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3C533C519
	for <linux-gpio@vger.kernel.org>; Sun, 11 Jan 2026 14:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768140343; cv=none; b=uSF9Gjbwe3Ept7BXmqXuEqpGE9wN47LwK8R97Wdj1rzeEsqfewwFgOtOh5g91cmbLcqhHKXE1u+OJBW7pgnJIx1l9hhY+7TyHwowKGupZsF/oPqja6n2o5VAexQUJTwNEF1t98SZyz92JoX8KB4R//u/HQpjW4V1O0063s4nh7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768140343; c=relaxed/simple;
	bh=La7kZA2oSwRqBuL7cT5ghruILrR4PN0GG8fEmUQohxU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EwUX4v2sPZAh7448fKBe7l4eVISnrodM/R/PfqDLd7cqFQnyjgFBwbvfFD2CxIHdeyGPi+Adp4lg3dMK9pOSrnEGIKOkS+94rHf7OZtHhshez8Dh0e97HKn/TYDr32bz8OZOSVrDcB5To9J1kkOeCsXLbvlWMik9V2VRZWTJp+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=A5h3J93L; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b8010b8f078so925387666b.0
        for <linux-gpio@vger.kernel.org>; Sun, 11 Jan 2026 06:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768140340; x=1768745140; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TXunsOKck5NLaqPP1pj13fhYNQN15zYs+l2jwEoFO8U=;
        b=A5h3J93LIBKbImOKSk/PuMD1cA9Z5C6EZEowbXbuQQWRqoIAibYcsoDlQw3TBJfR+T
         u0BiOjCEJXktgpsZjOdLv3j4NKLAL6vWzf02hINhGw9gtNLdyMqKWd3DOyEcZSvo3jYX
         8ZK4HrP0vXDrFAoG6NVNSCZ3YaSVLqWlNr0VD2t95cLlw4Jh61dPCSWNeQ6oulesS2tN
         wj79fRG7ILgJ3A7li2jIzTbZtZZjrXs2jKlLHtMo0WNwEe++CfnFmumACmX2K4HiMsrY
         hZYR2bZ1STtKcGYBa3SuMqw2+bwsgdTMBUMyBFpULbdi1sES9VrFIvs1UBE/wqWbzzwP
         APAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768140340; x=1768745140;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TXunsOKck5NLaqPP1pj13fhYNQN15zYs+l2jwEoFO8U=;
        b=uwrobO8vKYNMGvCFPKW40aJCL38xokl11+D8sz6lq3U9tDtB35otZFw3YaFu65jbQg
         CRk27PSlUflUT2JsKNMGtnJO+2av6dOLEjhmFA2udbeNmhK2cUSB58qvXebGxgtdoguZ
         vntMI4UBf79LpHYhHgy/NVq+Nfhj9AJuk002WpOT4MMGtMN9OpOa/kYFnnsMZcFxVEYZ
         RBQassejoD/s63e/9YheR9rKfYfnCTrF3LT20MdUfPF+zGoQ06uhO+eqrPERR9MH0KGU
         xIm/oTTwbJ9K0yQHvOouZhW3FR7Nh5dPRSTWFe5juP9OMIiEK+6zf0MsZzSshyzkWl1R
         Ij+Q==
X-Forwarded-Encrypted: i=1; AJvYcCX6jg1qHQf8V9CYo7/6WFCe1lKNzmYwvvSsNS9/M8CSxYwkeBqmo+ot9LuZNPNQ6QBalhC/d4d6mrt3@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+GxMN4pUDAuiAbJBX05myydLB6Tb7+CrAOJZl5Z/EtWnIQDrF
	QRV+vGGo+u8BQ+KROfwk25K9eqh8figL6zYPHiuIczXdyc737Mfuw6OYD25fhyr7b2c=
X-Gm-Gg: AY/fxX7/9u1HBhMEykEc/0ohd5+pcGJx/BNCxKUr2c07SH+02S2uPegKzvB+0QJK4Xo
	Q2QYbefsXo0vtiBhKy3G7du1I8+PUcFTfZJlnDpHmO1xVODhNJXKkbDV1NDoDhsj0FHogBGWRzN
	BYcM/uAx4CMUqDL13gI5SANLv75t+gRK4KmtwhLqn5B4gbme2SAKgbNRNhItEg247E/YLRWCnTH
	I4hGXsjK33GmPoOJocZN2afxuZEN8EZmCm2OyrPFOW9M9hdbj78g9C4oW09XLHhLReTmTQfA/sW
	urbG+dMw5AJl9+Dag6aIanNMDVzXd9jU5QIORY2G50mPqE8ct1Z/5CzBEkxBndAQt/PKtUHXQvs
	vTU5AqwunWQDM9/H6MGY+Hbrv+yBPtls36aLbUttHuyQcGai+bQjbUUwGciKgwP41DwD2ZFzljY
	/6/gYLVANYg8S9tARrCI5/eR+7i0tAc1zVIA==
X-Google-Smtp-Source: AGHT+IGAomJOik8MqjiZHm7eirNShLlujIRGUrfTNhxgz3sez9ZGd+euk5Raj7DyHYRFF75x4SXADw==
X-Received: by 2002:a17:907:3fa1:b0:b87:908:9aca with SMTP id a640c23a62f3a-b870908b37bmr200612566b.9.1768140340256;
        Sun, 11 Jan 2026 06:05:40 -0800 (PST)
Received: from [10.216.106.246] ([213.233.110.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b86f1e95273sm439916866b.62.2026.01.11.06.05.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 06:05:39 -0800 (PST)
Message-ID: <05184245-9767-45ef-a4a6-d221f90fd20b@tuxon.dev>
Date: Sun, 11 Jan 2026 16:05:33 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/15] arm64: dts: microchip: add LAN969x support
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
Cc: luka.perkov@sartura.hr
References: <20251229184004.571837-1-robert.marko@sartura.hr>
 <20251229184004.571837-14-robert.marko@sartura.hr>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20251229184004.571837-14-robert.marko@sartura.hr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/29/25 20:37, Robert Marko wrote:
> Add support for Microchip LAN969x switch SoC series by adding the SoC DTSI.
> 
> Signed-off-by: Robert Marko<robert.marko@sartura.hr>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

