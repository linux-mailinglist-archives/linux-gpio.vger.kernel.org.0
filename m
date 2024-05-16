Return-Path: <linux-gpio+bounces-6408-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4098C75A1
	for <lists+linux-gpio@lfdr.de>; Thu, 16 May 2024 14:07:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D6971C218D1
	for <lists+linux-gpio@lfdr.de>; Thu, 16 May 2024 12:07:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D96BB145FFE;
	Thu, 16 May 2024 12:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WzozJMDv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C941459E2;
	Thu, 16 May 2024 12:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715861212; cv=none; b=aTG8mU87EM+bs4vrqaFxidD/AsM9IkCMPOjFlW3NMONDzgICvGBMadqs7jgdQAz2QDvmy2TaMF+zkQh0ZciGoTnbrBxDwn+1qKm/QiMK9ld/TKTMwq1uBWswegOYVYNG7uOvc8PPzIoKCyWeMXMbVVZ/teuUuvOsRLx8+ouoWzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715861212; c=relaxed/simple;
	bh=iOUIrdlu87CHnC7pAPLPHYIfXVJw3A6l8WecuIe9HRU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=J5vOemJ995AUsDXjzu+XWNx4Cvhhg6T3zLoYK/JCgwzwm2JdrSQXGUJSXcLtkJQQRhTpYeGaSmrFq747KN3SApPWL1+0Pm7HEFEX3aXVeHAzyBHtZJK1v3m6xZ1GMuvt2SpyW4C4/d+/zeWvaWyeykV8n7x0c9akuvV21xNoevs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WzozJMDv; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2e3e18c240fso8214281fa.0;
        Thu, 16 May 2024 05:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715861209; x=1716466009; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d/+iOXfE5JhcsldrJn15mneL9tsGrRwJenKZ7TfkMY0=;
        b=WzozJMDvx8fx9C0seY2dgyyzOT8V3TFnVzJpVR1jqakpfY/jGfK+V/jUIrOea+ZYPj
         ovt08twrTKjE6Zt73tYiQwk4e40QoLjJT3SG+ebmh7iGC+remWCqI8cbvffYAejXUvcL
         uB7ldqFZNlHTqlwtxOFW5Q1U3+0B/qqJ297FlBXbtQsrqZxIVfQi2mGMCeHxaORcIWkc
         UJLac2Bavsu0jEaeBM0IqlFp6gyMUbl7IzdQ9ZnG5ETN/8IzpfqOTqThAabh9ZCDFe42
         uAhTYmPW7rIkzrSKxFMd95mIdlwpFNA0v9N7Iy9TgMA9QP90F3eYqUi+l/1j8K0Yu8ji
         DquQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715861209; x=1716466009;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d/+iOXfE5JhcsldrJn15mneL9tsGrRwJenKZ7TfkMY0=;
        b=pSha17KRw6iW3ODSD2IySAYj6pV6QFxSKvFHm/6tOmLOkFNVH74I+OGIJRRyZBQYKu
         czXGORQPiYVUGTaMrN9QW3Zj8nCSxxAivlG+bxNtak86K+QJYJPbm6fbsyRa8xoUb/8s
         fVgsYQngwoGbdixclCY8xmWaZr61Q93Y18XxaFGjZCJvJgE7Hu7lW6383Bv+vaskpjkq
         V4jnjkAZsAvy4s4xIeCL9H0vngiEw8TB5lPMTBO0MMqfKdjAiHyPbbmGGYTni7nqUjOg
         hoKkzB0C7pNGx8s77TXVl0kR60xf2XBwL6zQmu1XWkMjWpDcHpJdmjDUVSbwp4AIz+89
         q1og==
X-Forwarded-Encrypted: i=1; AJvYcCWQEiqcF/bGpB7Xf2wPJ0rygFR1AAgDWTHTxB9LhQYdsqMkbYImIrXCWqq80Y1/GDtH0dJWK4SbHsQlbtXsPEOYziXh9gX3FVTCZ1VM7FObbwt9FZpApSgkqIjKNBqwwyWpcQCK22i4VkodNTS9mThpzg0g7vf61VH28PZFkP0G99ZeKkI=
X-Gm-Message-State: AOJu0YwKPHZfx/c9RPZpAA4ggP/KmhpH1J5wMB8PZkuaIe8+ndNaWlJ0
	GmsJdkiVh6+lquv7dB6yGZ3/MlIPmbO4qeR7vMqvjfBPC68ouet+uMmVwUss
X-Google-Smtp-Source: AGHT+IGRXdu4e46HW+sJ65tDSzWCXInDmL+maJuMRLPwnyxExOFx8EFCPUqneDMLyHGHRnj5Mj8LLA==
X-Received: by 2002:a05:651c:546:b0:2df:1e3e:3280 with SMTP id 38308e7fff4ca-2e51ff5da7dmr204135241fa.28.1715861208838;
        Thu, 16 May 2024 05:06:48 -0700 (PDT)
Received: from [192.168.0.107] ([91.90.219.38])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e4d15155fdsm24154071fa.83.2024.05.16.05.06.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 May 2024 05:06:48 -0700 (PDT)
Message-ID: <81aa0e4e-a3c7-41d1-8cd2-4d060730b37a@gmail.com>
Date: Thu, 16 May 2024 17:06:46 +0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Dmitry Yashin <dmt.yashin@gmail.com>
Subject: Re: [PATCH 3/3] pinctrl: rockchip: add rk3308b SoC support
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Heiko Stuebner
 <heiko@sntech.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Jianqun Xu <jay.xu@rock-chips.com>, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Dmitry Yashin <dmt.yashin@gmail.com>
References: <20240515121634.23945-1-dmt.yashin@gmail.com>
 <20240515121634.23945-4-dmt.yashin@gmail.com> <20240515182954.03c4a475@booty>
Content-Language: en-US
In-Reply-To: <20240515182954.03c4a475@booty>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Luca,

On 15.05.24 21:29, Luca Ceresoli wrote:
> I'm skeptical about this being bound to a new DT compatible. As far as I
> know the RK3308 and RK3308B are mostly equivalent, so it looks as the
> pinctrl implementation could be detected at runtime. This would let
> products to be built with either chip version and work on any without
> any DT change.


Thanks for your feedback.

Indeed, these SoC's have a lot in common, but as I can see the rk3308b
has more blocks, like extra PWM's (rk3308 datasheet 1.5 [0] shows only
1x PWM 4ch, when rk3308b and rk3308b-s have 3x PWM 4ch), 1-wire and
CAN controller (mentioned in the TRM, but dropped from rk3308b
datasheet for some reason).

So, in my view, it really makes sense to add rk3308b.dtsi, where extra
PWM's, pinctrl compatible and its pin functions can be moved. And if
its not worth it, then I will try to adapt the entire series to runtime
config based on cpuid like you suggested.

Additional thoughts on this would be appreciated.

[0] https://rockchip.fr/RK3308%20datasheet%20V1.5.pdf

-- 
Thanks,
Dmitry


