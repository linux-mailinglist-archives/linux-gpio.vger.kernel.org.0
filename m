Return-Path: <linux-gpio+bounces-9115-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C183E95DE6D
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Aug 2024 16:35:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B8E9C1C21054
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Aug 2024 14:35:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75644178CDF;
	Sat, 24 Aug 2024 14:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ibORBf4u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DFF224FA
	for <linux-gpio@vger.kernel.org>; Sat, 24 Aug 2024 14:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724510109; cv=none; b=JE+NM0ceobWWwqtWsZ6kHZ+awbcKMvYdJLwuRyqIHXeVhLIifCaYhE2I2JcQvJu4eFt4sBTwxAKiGNiBLXNeC/UYmQKruDA8FQoyGniE0E2YykU8OPOFo4zGtxPXN0xFdn7f/ZIe75u7R1r/Qs22xioR3nWZdU+faYGYC8xklQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724510109; c=relaxed/simple;
	bh=VH5G57jXx2kn2MEAoSP1uh+sLnJ5KgRz5lPifWsIXKs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=kdnsikT/n22l8NFXn7FzF6O0JjWTf8n5SvJzBejsPqB7NS69LXFVfB4PeMRyh7fKe2/ZPYfpdjWMwvzWijjOwKah8Bi6l0ANhdIxBgkAaGxdl2p2bk+GaZj0hoaoe2kLqS4m0sRj2Zc0V87f4MC/BOgPcfLOIjf7itbyyG3lFzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ibORBf4u; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a86b46c4831so78921166b.1
        for <linux-gpio@vger.kernel.org>; Sat, 24 Aug 2024 07:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1724510106; x=1725114906; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g8LZHdL3FFyzzC1OxI86paMJzhQTKojqLvm9V9/J/WY=;
        b=ibORBf4u6Ly7/iG8Mp14PYStdoR9dzlZgEkcXThFktzGtc0XfXU6B+xDE4Nw0y8fbk
         SJPBL53oBg7r4mk3JIEIjL3JX0E+iD5hynu8ZnHrlJSIbiR6Fn3Tlp2Xkt0NPyjB9nBu
         KlrIYnSTrriLb2HFrDURoUj905q5Z0f+fIrQcwnoUhmyldSrpqFsLnGxQIcXJb93KD++
         Xd7CUVTvNoDhFBgXEEO+e72vgSXCgmaDL8RHf25On1oayC+lJCZsWsEAnl4+2lKCGJJd
         OPOzRqY+Ps/azK9soDBiAjM+8raEVuWuI+52/k54UcU8mzXVYyVixUwCIEsvRZe7m5/t
         kxtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724510106; x=1725114906;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g8LZHdL3FFyzzC1OxI86paMJzhQTKojqLvm9V9/J/WY=;
        b=HrMNYDUiazTfsY5Ogae/wabh4BZ9dNjeQ19smcURMuHmG50cj/YMi/VG65cirFMYNo
         57PVU/AwZkYQma9ZFXbkV9BsVoAejjX4hB29FOC7HZ1PVQciwSrilhJLLmCkkQOO10Ky
         /rt9IUyzzWnriwfKccQ+HNcIopaAlrFWRtMZiODCHGNHLDGwEgugzw/I9tp3YjHO97aC
         4f74Rnk285hmOHLNebBeZbQTuSzrXY7U0npFiGby5e5Uqx16n8SUNG7P5SUtnlh4ZO9T
         3+3+CArvlHDiuRuWO4NPzlksKRP2dtyCa1hAsgVulwfgDOhY89AmPhy5uwxFClh7GdG8
         D8Dw==
X-Forwarded-Encrypted: i=1; AJvYcCVmeKxpXuHDt+ktnnZHYUgClLMozYb4CgoPKaryMv0zB7kMjqPhFIRzz26kUrbkrZicU6Ldk7zndH5m@vger.kernel.org
X-Gm-Message-State: AOJu0YzcrZR/keO3n8L6ef11YsMJ3ACGz+Vleuv+lJR9gRYLFlpF7hBi
	dJQqpvhlDn3Ct1qzjqqBAY1nmB6U9Rk+cPVGkX/vJteCMR2VySnAuayt+QRmDLQ=
X-Google-Smtp-Source: AGHT+IG1xmW64RqRFWp22zr5FIU9frIH1WRxVjvKz/CUkpQeZ73aZm8FALLySJwTc9Wj/eKjIH21JQ==
X-Received: by 2002:a17:907:9729:b0:a86:92a5:247a with SMTP id a640c23a62f3a-a86a51b47fdmr351845366b.17.1724510106200;
        Sat, 24 Aug 2024 07:35:06 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f4f45a5sm408268766b.206.2024.08.24.07.35.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Aug 2024 07:35:05 -0700 (PDT)
Message-ID: <275606ea-2740-471c-b998-353ab6808591@tuxon.dev>
Date: Sat, 24 Aug 2024 17:35:03 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] dt-bindings: pinctrl: Convert Atmel PIO3 pinctrl
 to json-schema
Content-Language: en-US
To: Manikandan Muralidharan <manikandan.m@microchip.com>,
 linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240814061315.112564-1-manikandan.m@microchip.com>
 <20240814061315.112564-5-manikandan.m@microchip.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20240814061315.112564-5-manikandan.m@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 14.08.2024 09:13, Manikandan Muralidharan wrote:
> Convert Atmel PIO3 pinctrl binding document to DT schema format
> json-schema.
> 
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Applied to at91-dt, thanks!

Hi, Linus,

I took your Acked-by as an OK to apply this to at91-dt. Let me know if I
should revert it.

Thank you,
Claudiu Beznea

