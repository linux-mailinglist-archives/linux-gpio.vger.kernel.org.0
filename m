Return-Path: <linux-gpio+bounces-26670-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4615FBAC75E
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Sep 2025 12:24:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06139170B36
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Sep 2025 10:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B1CC2F8BEE;
	Tue, 30 Sep 2025 10:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="nKIpd7xH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350EF220687
	for <linux-gpio@vger.kernel.org>; Tue, 30 Sep 2025 10:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759227867; cv=none; b=XyOncijxU/wwnQrrwWVpbofTQkH8f4OwpWRCKbTCO/ZbjKq6zjRo+t3/ic7FKUriwLW0d1/tM7cZlGpiS4eDlVlN2nKAm8Tb70e1Tj8l/XgwLNwpa/lnlTLNapUbadpC/mDNqDwXRVPLGuD2mvIiz5Id0JZoYgKE6fQAMTvAfoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759227867; c=relaxed/simple;
	bh=/xO3z020SlrGnH1T1fxHsnuXvcuFN/F7C6gDnFLfAhY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O7U6x/opshOCaIw8/GsX4nW06jLHKMP6yAv0OVifg5l5oXPCZ/TDpe45Z5Nz9MTAclkxWYPyUvy+OzfDe0/d9na7fiMMpC+liHY8ya/TTuJsuer4LT03hpxMtKKNXDJ7ZIIBliMI+DL1kRyYKVELlcnbZTLzYyxEraKD6OKaEbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=nKIpd7xH; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-634cef434beso5858488a12.1
        for <linux-gpio@vger.kernel.org>; Tue, 30 Sep 2025 03:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1759227863; x=1759832663; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yku4GoZzp9LeWe3ADlx09HHrsnQ3oJo5nPkdtrMrKK0=;
        b=nKIpd7xH0CXPhYC2VZthyLijAwfxXiUFGgh3W/jjAWaRtzjJXsbPolvPjsWU1NvWW5
         XJzHH5usUrlK9MxBaI+FWbY0E46BUUVQy9UslH17cchzoeR7/y5KLAtelVQj9TtjITBn
         kz2JCwmlAJe8hIS7jCsOzG1frpIxVyzWWU4m7fifMtV37z7PioMOyJDcpTtWAQNRC7o2
         KjAZMdVPjDi/VjNvTycWYE6/JmQ2mlOgOOmkrf3yxi6+zbPd42pfkofbkque5U2CX2/k
         x2ypQYbl2pmaqrZ9WZrbtuUG20s9i7BQxYqlWiEQRq/2rbgPB1urPC4jcf1qw8wuLrPf
         G+DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759227863; x=1759832663;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yku4GoZzp9LeWe3ADlx09HHrsnQ3oJo5nPkdtrMrKK0=;
        b=wa+wjsMxQmd4J9bTUyuzPo04e7RYI2jcMEMGXC9/929tuomkfTnf3eradQV71HlMDj
         UgLHMt5Q/lsKuF192xkM9esujdfbvzjAI2YayGkXmq/9rJNaOo3nXiz5PBHg5/v+bvcz
         ecdrsEfyT794Z+m7KmeavYb+YBfoZ/nZunOJsXTsjPBHs00nfW2C9nYmMH3+5+tsEe69
         iC1fard76jDdIKqb1ujkXKz99hxd5/kNOP0x9a3MrNuH5AWBNLDDOZjBcn6by0dOity/
         LqBsNTjwwGFxV+zxkrtbZxkE8S0tlvncTUQvPOjrVCKJD1To/qIhb+6S+Br97PKTDT4p
         Cg7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUkctItuqWYFBCGxYyw8JwnWP8ulK3O15fbVVFJ6Qz61LVeqL280yl/2zCohRbTzFgRsEpbq+OMSwLW@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl8gmqSkXgZZBo6s1NC/ArSI1MCGlaqm6Q9mHLZ6nfzkjxMB3F
	PxBDBdtC7N07SqSwZCdVnp7AZwsyM/FJlgMzBvQjuD5qNVOkeFkB0OfGtG9taKpH2Jw=
X-Gm-Gg: ASbGncsyKi7V0cuHLaVpBzlFHni6kKrhKDDVRX+wjZIuPTxqXw0+KZOGDTj9geV4KgC
	ANTOIh9sKk5bQ/byBnYlEmqvvdX1m82aoGTAdpD97UdzVCq6Rgk3UzxBsrQJZddqju7vBAcwAcg
	KV5KweIlZd0n/BG2/LIvkBD/fQbktXYRFH2VyWF3sKyfiZwTRoUZsmzmuRD0bKqvy1uX1cFXyN4
	pntanrBr1rh7Tz/Nx1ngo68JHADJfz5g8UjBNtCiMTdoZIciWArWVFqCElKgYifyqvxaPU3FUeH
	Gdubw8r9THJEov5HAYimiCV3y0Snk/iirB00aE3XkRsau26IiOyWCYKt1D0ZTj2rS77BfTeL0ji
	5gcyeOOAV+pVe2rdSkUyJzbIIE/IHpv1sZD7rdmuw0IWid0A4MWtTBo/V7hISGWpy1w==
X-Google-Smtp-Source: AGHT+IEwT6Q7OMLIIwGyLtVN5rHhdWH9GNscWF9k7Eai3fNlLMNA2xSp+0/7z8qMh2DHsvkbRP8yBg==
X-Received: by 2002:a17:906:6a13:b0:b3d:d30b:39c0 with SMTP id a640c23a62f3a-b4138d54e8fmr374520766b.21.1759227863393;
        Tue, 30 Sep 2025 03:24:23 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.111])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3ccb3234fesm494802366b.8.2025.09.30.03.24.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Sep 2025 03:24:22 -0700 (PDT)
Message-ID: <aab3bf2f-b778-4754-a1ac-5e5e32e54743@tuxon.dev>
Date: Tue, 30 Sep 2025 13:24:21 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] pinctrl: renesas: rzg2l: Fix ISEL restore on resume
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linus.walleij@linaro.org, biju.das.jz@bp.renesas.com,
 linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, stable@vger.kernel.org
References: <20250912095308.3603704-1-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdXv1-w0SE7FZy5k3jg2FO-a-RB2w1WB=VM_UFEA9zjWDw@mail.gmail.com>
 <ef82c610-0571-4665-a5d1-07a9ed9fb8d3@tuxon.dev>
 <2bd09757-cd66-4a2a-8801-0f62dc99b9c8@tuxon.dev>
 <CAMuHMdW6TQFZJ_r+XZOuh7yTUKwZxQRCr4Ps-xZ8U702xMd1=w@mail.gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <CAMuHMdW6TQFZJ_r+XZOuh7yTUKwZxQRCr4Ps-xZ8U702xMd1=w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Geert,

On 9/30/25 13:20, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Tue, 30 Sept 2025 at 07:33, Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
>> On 9/29/25 15:10, Claudiu Beznea wrote:
>>>> This conflicts with commit d57183d06851bae4 ("pinctrl: renesas: rzg2l:
>>>> Drop unnecessary pin configurations"), which I have already queued
>>>> in renesas-drivers/renesas-pinctrl-for-v6.19.  Hence I am replacing
>>>> the above hunk by:
>>>>
>>>>             /* Switching to GPIO is not required if reset value is
>>>> same as func */
>>>>             reg = readb(pctrl->base + PMC(off));
>>>>     -       spin_lock_irqsave(&pctrl->lock, flags);
>>>>     +       raw_spin_lock_irqsave(&pctrl->lock, flags);
>>>>             pfc = readl(pctrl->base + PFC(off));
>>>>             if ((reg & BIT(pin)) && (((pfc >> (pin * 4)) & PFC_MASK) == func)) {
>>>>     -               spin_unlock_irqrestore(&pctrl->lock, flags);
>>>>     +               raw_spin_unlock_irqrestore(&pctrl->lock, flags);
>>>>                     return;
>>>>             }
>>>>
>>>> while applying.
>>> This is right. Thank you! I'm going to give it also a try (on actual HW) a
>>> bit later. I'll let you know.
>>
>> Sorry for the delay, all looks good to me (checked on RZ/G3S).
> 
> Given this is a fix which will be backported, I will reshuffle both
> commits, so your fix is first, and the above no longer applies (here).

That's OK for me. Thank you for handling it.

Claudiu

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 



