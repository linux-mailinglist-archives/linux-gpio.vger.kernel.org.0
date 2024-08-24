Return-Path: <linux-gpio+bounces-9112-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D8595DE65
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Aug 2024 16:32:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C3111F22247
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Aug 2024 14:32:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F368F17A595;
	Sat, 24 Aug 2024 14:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="KbK3j85p"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B111714DD
	for <linux-gpio@vger.kernel.org>; Sat, 24 Aug 2024 14:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724509945; cv=none; b=ie2sy0LzB15V8PbGxjO29692O89uS4VQ4tHHTnTmpxG9iOXReW8ukw2wD6YqVoNxVnYEfD2CNEaI/4q3T9k+rGahMxMmv13OqNEVrQq2naRTmcv6PsxTJJfV7/ANVNBqw8rLxqJ6oda99+sTzKfboRYHuiJxuYCVCmcJb9Evk4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724509945; c=relaxed/simple;
	bh=DguyKs9nIdgiM35CLVoOBmMRDj6H5AHNIznN0BoAbcg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=XhD+z42X7O4z1RurohGclLyajqDJpqEYGq+dxmAaYu0gNPhDJXPVKZQIew4ZaiK2EvKfW09jeXtmJpN2PiK6UbFLpJl53Ai+zEogA1NqW7bRyFKp05bDGCzyeq7pxrPz1vDpmsBUUnFXKWhUbzrHNeka3WYwm8Ult+Goa+T0rmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=KbK3j85p; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a8684c31c60so357013266b.3
        for <linux-gpio@vger.kernel.org>; Sat, 24 Aug 2024 07:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1724509941; x=1725114741; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FxkKnCfGm75wdEytACBKZw4a5zm6SPbgUczbsalGslc=;
        b=KbK3j85pOoQFVlz8VswZaQmaRUq4lRPIOJvD9D5OXJiXb3uy9BMOuIjdv9a+Hr4ewN
         xDRiTIlTpGgqVx5f67I/HLKmXvq8WzqceLm1YoJfxqiCNOkfvYW9uVc0uQZoz6IAptZ6
         WpMWNIRDK9Ecmn7K1B+hAg3ZFBiT+hXttjduQRLCG9vtUeofoiCO9OM70jpf0BRB2kAW
         JaQaWcgYwsPG4mMk4/V5kk7Eg29baY9lc47Skt6FtoAg9OQR9clg9NLN35vdoRYvVzhN
         KYOrp37ndeCXhxoBS5FQbCfiSbcX1/7gjIPXHhknqNbKhEao/SHxuy11sGdueMVLwFAz
         TTyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724509941; x=1725114741;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FxkKnCfGm75wdEytACBKZw4a5zm6SPbgUczbsalGslc=;
        b=PomDRNQtO1atJ2XKcNzkOJt/E5VCkJttjStvOnOOPWRw6O1ZpYu9ph/Ru+GneVCEsi
         4wSr1Ap36zyApZd5A3VEkEK9FUHwUnuyJxelvQLlXz7AKqK/RotTifgIrgtygCxZwizv
         sZaCzcpbZNoYIACG24+ko1zAhOKdLUufxKEVRbJU2RExXkErtdgiS4MMpPk9T3tMZW89
         cbPg8HnX4S2w4a83WRow9JY0/AwLBvWcX3WDpDNDMxtcX5JpOudSLeV877aI/kKBKnOS
         AqIKFNpLL5LvpfH5ga3gkHEFxgj5JHbNFXBZ9THqxInaUMzdNqMt0+GulSdCOwcUy3JA
         h1Xw==
X-Forwarded-Encrypted: i=1; AJvYcCV6MezflLe6FdTpQsSDQx8nelaT5cnlBpC29jpvaHZG1V1kD7faI9E6ecsU6lu5/1Q9gDIjkssoEQMG@vger.kernel.org
X-Gm-Message-State: AOJu0YxP0WZEjtzs7Ns1mKvm3nmBxEUBhDMUcaE/rPCORMcyTG7qEZR/
	gqWiB+eAZ/3q154WDhdvNoDYZa4FsTPN8WbdpHtd40iCbelWyTthos+LcXHZOMc=
X-Google-Smtp-Source: AGHT+IGUDSJmT75t/n3hVit0finEeyZFMRMLVOMS69aLxoBMz95Jx4PjAGkAk+H23b7eP9fleeudYg==
X-Received: by 2002:a17:907:9724:b0:a86:95ff:f3a0 with SMTP id a640c23a62f3a-a86a5188d5fmr383961166b.3.1724509941384;
        Sat, 24 Aug 2024 07:32:21 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f222b23sm413681866b.19.2024.08.24.07.32.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Aug 2024 07:32:20 -0700 (PDT)
Message-ID: <b6307e8c-1ef0-483e-9091-83949166743c@tuxon.dev>
Date: Sat, 24 Aug 2024 17:32:19 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] ARM: dts: microchip: change to simple-mfd from
 simple-bus for PIO3 pinumux controller
Content-Language: en-US
To: Manikandan Muralidharan <manikandan.m@microchip.com>,
 linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240814061315.112564-1-manikandan.m@microchip.com>
 <20240814061315.112564-2-manikandan.m@microchip.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20240814061315.112564-2-manikandan.m@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 14.08.2024 09:13, Manikandan Muralidharan wrote:
> The pinctrl subnodes that define the pin configuration of other devices
> under PIO3 pinmux controller are not simple memory mapped nodes.Ergo,
> change simple-bus to simple-mfd.
> 
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

Applied to at91-dt, thanks!

