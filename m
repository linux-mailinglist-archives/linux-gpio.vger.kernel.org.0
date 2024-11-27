Return-Path: <linux-gpio+bounces-13327-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E540F9DAC51
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2024 18:22:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 40989B21523
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2024 17:22:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5724201028;
	Wed, 27 Nov 2024 17:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="G77ziwA0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D878225D6
	for <linux-gpio@vger.kernel.org>; Wed, 27 Nov 2024 17:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732728112; cv=none; b=fciWa5uaNNLnXA3rK76lqxzfR4SOK4F7YSy65Nx05M+gnsB2/uB/ve8l2B9Fo/tlT866fzdZbxd1ECM9ShU2rhTBYA80G8FSM0H9MbI+qS0f0vrYaKxxTT9IcCTch1g5PwJpgOBQ/M/fqgsAWYZ2rsQfHdZvsMhc0lXrnmmw45I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732728112; c=relaxed/simple;
	bh=65aYM6N26qjzWOA+Lupo8UVQBrVj+zOdMVkxHTv50Fc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IdAGc+yUjpvDS39e3gXd12OArZoIyKhzbRyxjdmoumvmhJ6zpOdEnlSumi9+yRQpeccTQTJ3WTp0x1goIWeb06nscD3nDJQCWYuMo9Hx7ByJrF1vx65q5G0RdtT79HYWgKz2k8zNAhGz/Lxj1JFghynXiPww4ER0BA6ZNC9RePs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=G77ziwA0; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43497839b80so33608375e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 27 Nov 2024 09:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1732728108; x=1733332908; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=joY9jROGlnz2og0g8pwUmAhFhVOpMoCp26ajpyfTKYY=;
        b=G77ziwA0y9G9j4cePwQnZAW154DzixMaIkHm0krR8wW8WEDoorADqsl5IHEwEBQtCG
         YrIcl5JKcVl6DLcU9GdrfWhrbOF13k4LIT82pumvU+Suyn6Gqlju0ric9O3kYIoCa/2p
         ZviuAWa7tPNucPLIzI6YFY5fE7VXwg3ywtr72B4RpOfUDXUW3yhK3pYJ5up8hXFUON3x
         uDE/8uCQvPPE2kbdYM1O4qsTWIrSCgRSQy5zRUK/xnF0RpgQSc8XKKBvYj3vWoyNr5WQ
         hZx8p3H/F+BbEwgBlF/ghshCNWgHDWQB7erhOEcb3BHtww5MnjLH7luagnTFO/zrfpyH
         usVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732728108; x=1733332908;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=joY9jROGlnz2og0g8pwUmAhFhVOpMoCp26ajpyfTKYY=;
        b=vgQyyGMF+QYJFiCsha7LgdMPa/Ql+FJjix/Cqy93QwpVW4Md31pc68GYRrwZfTZndf
         l3LrBCVpikQ5WD4iCAXmhAAPyrF7PixOBQHvReYuMpFqERuulDxQ3h9Vd9zTprdAkwKN
         nDGzSnaOrMX1kIO6Yq7GttHcw8DD2J+XM7ZLZfllDEpKcdQVLyTxgngDCn9LTdAz7lul
         qdyfPvl61IGzSNxRDV+06LmNPPwbgFU1+bJ3a0jGMayh3az9fpRs7ngJOhHdbVskATJ3
         arb/qYoeOxPuaCpqJlwCBhgQ2CMFimoykiB4tRH23REUjgi276GxST2bsZJPzStqnRHU
         /8Tg==
X-Forwarded-Encrypted: i=1; AJvYcCU9eBqEU+duKk0hrY7Cn11GK3aGpTlOFCapwJXhTpW4PKOG7lpvbkGLzpFDPoNFnd8VSo3XnoIpazrV@vger.kernel.org
X-Gm-Message-State: AOJu0Yy96HJmD0BwdbfdzAeewXZJOCA1fJpikNkxOzLp+ZRWtMrnZG8Q
	HWH6VEXiGH9w/GPpR6mij8sUHgHla0RAmy5h4flITClQJ7ImkHfvytErHXW/lH0=
X-Gm-Gg: ASbGncvGwZvhAL7r5U0xXdiiJIGmJAz1EM7+AaM/7XUINonmmfn/+oCE7/yKTKtqylM
	T4Ahj/1gn9PU3PNYjcNpsO6RtK0U7b/6wb/LRn5JVHtOZMwRACGJmgfu17MQenUqk40ZMQJ7lLB
	5WK8PZF0QcjYHW1sGZ53aioLKgFnFsyy6cMydJEBKudXMokvOxRsa02q9y7ul8DanANV4IPvmUA
	Q7bD5UB14tgdcvCz3pv3uKt4zZCp72HqbTmGHLQsO9qbX3fR9On8TxiWg==
X-Google-Smtp-Source: AGHT+IEwxFX2alAudU3RtsTrvMnoOq4JYgGY0fdaW4rv6kK+qa7GhKDhgceGlbe6flrzyyd7UpC7Pw==
X-Received: by 2002:a05:6000:2b03:b0:37d:3735:8fe7 with SMTP id ffacd0b85a97d-385c6ec08e2mr2414458f8f.32.1732728107563;
        Wed, 27 Nov 2024 09:21:47 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fafe3cbsm16741588f8f.38.2024.11.27.09.21.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Nov 2024 09:21:47 -0800 (PST)
Message-ID: <9cc61971-4a0a-4421-a998-341cc3072d3b@tuxon.dev>
Date: Wed, 27 Nov 2024 19:21:44 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/25] clk: renesas: r9a08g045-cpg: Add clocks, resets
 and power domains support for SSI
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 lgirdwood@gmail.com, broonie@kernel.org, magnus.damm@gmail.com,
 linus.walleij@linaro.org, perex@perex.cz, tiwai@suse.com,
 p.zabel@pengutronix.de, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-gpio@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com>
 <20241113133540.2005850-2-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdXfSmkbnTS463xa5ty_2W+vFbWhRK65nN1yiN_+c66P5A@mail.gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdXfSmkbnTS463xa5ty_2W+vFbWhRK65nN1yiN_+c66P5A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Geert,

On 27.11.2024 16:46, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Wed, Nov 13, 2024 at 2:35 PM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Add SSI clocks, resets and power domains support for the SSI blocks
>> available on the Renesas RZ/G3S SoC.
>>
>> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>
>> Changes in v3:
>> - collected tags
> 
> Thanks for the update!
> 
>> --- a/drivers/clk/renesas/r9a08g045-cpg.c
>> +++ b/drivers/clk/renesas/r9a08g045-cpg.c
>> @@ -209,6 +209,14 @@ static const struct rzg2l_mod_clk r9a08g045_mod_clks[] = {
>>         DEF_MOD("sdhi2_imclk2",         R9A08G045_SDHI2_IMCLK2, CLK_SD2_DIV4, 0x554, 9),
>>         DEF_MOD("sdhi2_clk_hs",         R9A08G045_SDHI2_CLK_HS, R9A08G045_CLK_SD2, 0x554, 10),
>>         DEF_MOD("sdhi2_aclk",           R9A08G045_SDHI2_ACLK, R9A08G045_CLK_P1, 0x554, 11),
>> +       DEF_MOD("ssi0_pclk",            R9A08G045_SSI0_PCLK2, R9A08G045_CLK_P0, 0x570, 0),
>> +       DEF_MOD("ssi0_sfr",             R9A08G045_SSI0_PCLK_SFR, R9A08G045_CLK_P0, 0x570, 1),
>> +       DEF_MOD("ssi1_pclk",            R9A08G045_SSI1_PCLK2, R9A08G045_CLK_P0, 0x570, 2),
>> +       DEF_MOD("ssi1_sfr",             R9A08G045_SSI1_PCLK_SFR, R9A08G045_CLK_P0, 0x570, 3),
>> +       DEF_MOD("ssi2_pclk",            R9A08G045_SSI2_PCLK2, R9A08G045_CLK_P0, 0x570, 4),
>> +       DEF_MOD("ssi2_sfr",             R9A08G045_SSI2_PCLK_SFR, R9A08G045_CLK_P0, 0x570, 5),
>> +       DEF_MOD("ssi3_pclk",            R9A08G045_SSI3_PCLK2, R9A08G045_CLK_P0, 0x570, 6),
>> +       DEF_MOD("ssi3_sfr",             R9A08G045_SSI3_PCLK_SFR, R9A08G045_CLK_P0, 0x570, 7),
> 
> If you don't mind, I will rename "ssi[0123]_pclk" to "ssi[0123]_pclk2",
> to match the define and the documentation.

Sure, thank you!

> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-clk for v6.14.
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

