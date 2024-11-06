Return-Path: <linux-gpio+bounces-12647-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0634D9BF18E
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2024 16:25:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2AA381C2346F
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2024 15:25:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEBFA52F9B;
	Wed,  6 Nov 2024 15:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="eAvksleF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394C82022EE
	for <linux-gpio@vger.kernel.org>; Wed,  6 Nov 2024 15:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730906717; cv=none; b=Emsk3aiakicxre7L0bHtbjYDSiytbOAP7Uu0MQeJpADLVyjcKwfL4ZrpqZeQEyRwDLhoU5oHaoYjzBo0xZzlxz7L7McfQJCepSGHNdeNAlmaBJOGGaXtXoyQOnCOX1cY7/Jp2oyeRNEsuUaL9jQ/hdx4fHr3kk3tqJPJP364beQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730906717; c=relaxed/simple;
	bh=825fFcUQnPqu974K62Cc6TOzabToD2+pOzemxF4MwRQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d6fQsPVUxNVHtqX+wALVp7fa64XInJniJiBtHjWXJkRu9cShnwYrSACIFI62ciue0sV0k0PxCgv2rNBkURPD/a016nu8LGPv3V9Akms/xWUSzrhE9lqEJZ0ymyN2LCvUwr/5derC+guHnNTnjAF+wpgHtRz/Wpm1PIHRRvrEF7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=eAvksleF; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a9ec86a67feso144544766b.1
        for <linux-gpio@vger.kernel.org>; Wed, 06 Nov 2024 07:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730906714; x=1731511514; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dpz0KPFgwBV81mrLK+Jjg94JN4iKvNSkamb0eOPZLK4=;
        b=eAvksleF7W+C+ALDEBsiL1juBKu4OBb8yTa1Uos7IDPpjRzWA0CZkV4wDVvq2ubycU
         Ft1338HVt9x6/xBsWOh11mGoRQcs4Q3Humzxpd321W1ydp6fNVCBzXNlpEl7wMCHqJ3v
         M15fNINekBH6k/t+HanQpJNZVzIp18KAnAx0A0se/8nx5S1PrDd1cBWaIWSyn6JoAH6+
         2x2vii6jgBe1SbVnAFVbI8SsHMtqm8Tz1RV8oa/4Akr/n0hp0RUF80+nXI+uHREaCZsK
         8DFEWbUeyS60OtSybjOw2o11rgdamI52QSDgm31ETdpHr+4R5TL3TAdQ9YNjgUzllLRd
         yUWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730906714; x=1731511514;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dpz0KPFgwBV81mrLK+Jjg94JN4iKvNSkamb0eOPZLK4=;
        b=XcaDhqDxQDfQ81dTCcd6QxQa9Q1zULRYYMVwsQWMKnMkE1dULgqVfD46E+dL7PJBe/
         eEZq1arDxz0KqOORMTxjhBbew2L6YfOOnfvbwji+BGj+IjfG7tVjh7R3gyV+yD8Nm10b
         gsvFtoK+uB4cZyPEJtQ4J9ikq7EcjyyLys3RxHeLG2e8Ktq/P5bEjohsS45HjyDYFu5T
         G6DGuJeL1QmmHF0ht2bRS6eJJx6sT0RYBt5BwD2N7o1mnoWTVBRiy48TTOpieKTC276q
         Bi5W2uYs5T/zk3KyR4uxx7sjmoCF5k29wNHUDjOc8kBZ9YEbnDF8r4Uo1XkVrQnaVY2B
         oZKw==
X-Forwarded-Encrypted: i=1; AJvYcCVo68/hFYdP/UAbEvieSHqZ1eFomJoHHs+KkU15QOtuYNVebQVKcSehFencskeV7RNfJEv9RCxgr/vQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4oc62zzBNVsGyGwyIuQxd7nJZMtHyQV0FhREFnD6bS1pIT9nn
	HZFfGj3Aj1F1CEfTBoMAgQlpuIBlUEOA2buZYwNgtpmmWl84//2kuErxWX10U8w=
X-Google-Smtp-Source: AGHT+IGCsBt4YImQ9v/cxMm8F2bd0t7nztI/dFwfKLybyOThX/4Zc2NTUaw9MVXNyjcZDUzvlEvVaQ==
X-Received: by 2002:a17:907:1a4e:b0:a9a:2523:b4ce with SMTP id a640c23a62f3a-a9de5c91985mr2353019666b.6.1730906713378;
        Wed, 06 Nov 2024 07:25:13 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb1814086sm294320366b.193.2024.11.06.07.25.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2024 07:25:12 -0800 (PST)
Message-ID: <5f524886-7479-44d7-b94f-21207c5a9ff9@tuxon.dev>
Date: Wed, 6 Nov 2024 17:25:09 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/31] ASoC: sh: rz-ssi: Use a proper bitmask for clear
 bits
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, biju.das.jz@bp.renesas.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, lgirdwood@gmail.com,
 broonie@kernel.org, magnus.damm@gmail.com, linus.walleij@linaro.org,
 support.opensource@diasemi.com, perex@perex.cz, tiwai@suse.com,
 p.zabel@pengutronix.de, Adam.Thomson.Opensource@diasemi.com,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20241106081826.1211088-1-claudiu.beznea.uj@bp.renesas.com>
 <20241106081826.1211088-13-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdWxmoUQSSnAVdqhpTQJYvUCJTL0EZbdKmLLhFWi8UCGkg@mail.gmail.com>
 <4e233ebe-b0e1-4b37-9063-bdbeb5980b13@tuxon.dev>
 <CAMuHMdVrKoyRuaa=jtZ5SJ3OX8ytGyN_jwv2uKX2ohGpg6yiuA@mail.gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdVrKoyRuaa=jtZ5SJ3OX8ytGyN_jwv2uKX2ohGpg6yiuA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 06.11.2024 17:21, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Wed, Nov 6, 2024 at 4:17 PM Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
>> On 06.11.2024 16:56, Geert Uytterhoeven wrote:
>>> On Wed, Nov 6, 2024 at 9:19 AM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>
>>>> While it is still correct to pass zero as the bit-clear mask it may be
>>>> confusing. For this, use a proper bitmask for clear bits.
>>>>
>>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>
>>> Thanks for your patch!
>>>
>>>> --- a/sound/soc/renesas/rz-ssi.c
>>>> +++ b/sound/soc/renesas/rz-ssi.c
>>>> @@ -331,7 +331,7 @@ static void rz_ssi_set_idle(struct rz_ssi_priv *ssi)
>>>>                 dev_info(ssi->dev, "timeout waiting for SSI idle\n");
>>>>
>>>>         /* Hold FIFOs in reset */
>>>> -       rz_ssi_reg_mask_setl(ssi, SSIFCR, 0, SSIFCR_FIFO_RST);
>>>> +       rz_ssi_reg_mask_setl(ssi, SSIFCR, SSIFCR_FIFO_RST, SSIFCR_FIFO_RST);
>>>
>>> But you're not clearing SSIFCR_FIFO_RST, you're setting it?
>>
>> The bits should be set to reset the FIFOs.
>>
>> By "Use a proper bitmask for clear bits" phrase in the patch title or
>> description I was referring at the 3rd argument of the
>> rz_ssi_reg_mask_setl() function, which has the following prototype:
>>
>> static void rz_ssi_reg_mask_setl(struct rz_ssi_priv *priv, uint reg,
>>
>>                                  u32 bclr, u32 bset)
>>
>>
>> Would you prefer to rephrase it in the next version?
> 
> The idea behind such functions is to pass a bitmask representing the
> bits to be cleared to "bclr", and a bitmask representing the bits
> to be set to "bset".  In this case, you do not want to clear any bits,
> so the "bclr" parameter should be zero, and the original code is fine.

OK, I'll will drop this patch.

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

