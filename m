Return-Path: <linux-gpio+bounces-12821-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F189C3CCD
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2024 12:15:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 171A91F21001
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2024 11:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E07D912EBDB;
	Mon, 11 Nov 2024 11:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="OnwcAa7i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A8A15855D
	for <linux-gpio@vger.kernel.org>; Mon, 11 Nov 2024 11:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731323741; cv=none; b=QyIg3e3kao7oJKFkNJ2uXxMd5gh1eKsFs5Loeh0qTLRrNqSnxZ2p0fdnrLB8lop+At/koB526h3tBkKp9q3+pAfSAJ0n4u7JVgUIQstrAmE5edOsawZn7sXSBewc3jHZGu6QQJ1/8IRhDizJmNPsQQYU1Y0LchIQHy97LAMGsAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731323741; c=relaxed/simple;
	bh=UVMY3jncP8KlbJgHSOQbnrh0HSPCD2duUy36Ssl4JeY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EcGiUP/ehUr6nN6EabNxPhtoLSvysP6DmTEBddseZB8YHSVesu4Z1O6RmM6EEQReCwIiVccJ0pBeBKEtPWnmNTclhxahRsO5Ywz4+EktB01HQT4uuMpYUQHbpGsIiTVLiC7ijisozCG9hX+xRzmGzrGI4w8fX+h7gZD3pxVbH3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=OnwcAa7i; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5cb6ca2a776so6779472a12.0
        for <linux-gpio@vger.kernel.org>; Mon, 11 Nov 2024 03:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731323737; x=1731928537; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bhZZuPjatSrdZhX9k+zXeie/9aFPE96IB3h2Z1yS2Hc=;
        b=OnwcAa7iFccdMPXmNNfuo+XSwSVwwhr08r0lXMAp/OEFWu00qv7wHWnONDdCu/5q7C
         W+/EI+WP3Z4aGv/Ppvei6+w6/cbz/ivJ1SatoGSfcVKgMOCcmzaLKkwV1G11XNH6ap7P
         4csA/TfJeSCCpI9ss7PEYectSu1/wz3ulgSj62rdCy3uN3X/rG3ip6lo302p20aszzWf
         J7j5szIPJqSllJjvLBWecWqsy9XqeDSJLTBldqwznATzvsQT9vUSJGUcbQ6+bY4if8Y4
         HOBtESNHHgYU2Ok3fGARnCPQDliwu771U7Z11sWnW0I+BBPQ1Gd6PZSkb3JN8n72IqO/
         AXCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731323737; x=1731928537;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bhZZuPjatSrdZhX9k+zXeie/9aFPE96IB3h2Z1yS2Hc=;
        b=aaTvPip9pRRnSqhvI7g9YIueQ0KuXATWpUiccRlItt3mhjeywiSFYs3AtkCluUzs76
         E6owKRUWr3eKYIWmsz5ia2OTtaTjeHi3HFXIRwvs1EJJG+On2cw+gfyf2mA3balH43+O
         NBThGeMBvrmU54XBS4/818Pg6MDkTdf8xjd5BxOt98plSlvXsbFRPCMZ3jahGaHmNu9w
         lP9JRmXKh4UufDGV/m5W9SiXtUQUyrbjVfg4mgWoZeEKMRgTl4hDFtR1aQSzI41/LPw0
         HiWuxFF1W23BVP9YjNrN68wV3dT7xXQ6eoTSJrypStG8bpJTBPMA9wQbagF1m5pZnLud
         o72g==
X-Forwarded-Encrypted: i=1; AJvYcCU8FNS0PaM1VI/Kdth4Qc5dzlIxOIuquK/AbEVanOrV2MFLheuccHCxEFkowDbV2pCXIVJRI4Insnum@vger.kernel.org
X-Gm-Message-State: AOJu0YwhSRfpKa+M+iXZnmZJcIhyniF7IP9QkqofnnVq9skYXXJEugBk
	YC6k8i3zNel1i8Hs9AlOy5gs1KBkeW/jvAm9F/enS5MefNqDd5T1ZcWZrvZ8DGE=
X-Google-Smtp-Source: AGHT+IFbp4VgcqWBYLe3U0yCi4vd7nmqSuzbqzRywA4zlYZMwP+tOs/p2A4kYUW8+VEuOgG9xmufbQ==
X-Received: by 2002:a17:907:6d02:b0:a9a:60c1:136d with SMTP id a640c23a62f3a-a9eeff0e570mr1147950966b.22.1731323736778;
        Mon, 11 Nov 2024 03:15:36 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0a176cbsm593593066b.23.2024.11.11.03.15.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 03:15:36 -0800 (PST)
Message-ID: <9ef0d9df-3d6c-470a-913c-55698148d00e@tuxon.dev>
Date: Mon, 11 Nov 2024 13:15:32 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/25] ASoC: sh: rz-ssi: Terminate all the DMA
 transactions
Content-Language: en-US
To: Biju Das <biju.das.jz@bp.renesas.com>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
References: <20241108104958.2931943-1-claudiu.beznea.uj@bp.renesas.com>
 <20241108104958.2931943-7-claudiu.beznea.uj@bp.renesas.com>
 <TYCPR01MB1133233B458F3AC5F7C3602B3865F2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <TYCPR01MB1133233B458F3AC5F7C3602B3865F2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Biju,

On 10.11.2024 10:37, Biju Das wrote:
> 
> 
>> -----Original Message-----
>> From: Claudiu <claudiu.beznea@tuxon.dev>
>> Sent: 08 November 2024 10:50
>> To: geert+renesas@glider.be; mturquette@baylibre.com; sboyd@kernel.org; robh@kernel.org;
>> krzk+dt@kernel.org; conor+dt@kernel.org; Biju Das <biju.das.jz@bp.renesas.com>; Prabhakar Mahadev Lad
>> <prabhakar.mahadev-lad.rj@bp.renesas.com>; lgirdwood@gmail.com; broonie@kernel.org;
>> magnus.damm@gmail.com; linus.walleij@linaro.org; perex@perex.cz; tiwai@suse.com;
>> p.zabel@pengutronix.de
>> Cc: linux-renesas-soc@vger.kernel.org; linux-clk@vger.kernel.org; devicetree@vger.kernel.org; linux-
>> kernel@vger.kernel.org; linux-sound@vger.kernel.org; linux-gpio@vger.kernel.org; Claudiu.Beznea
>> <claudiu.beznea@tuxon.dev>; Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>; stable@vger.kernel.org
>> Subject: [PATCH v2 06/25] ASoC: sh: rz-ssi: Terminate all the DMA transactions
>>
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> In case of full duplex the 1st closed stream doesn't benefit from the dmaengine_terminate_async().
>> Call it after the companion stream is closed.
>>
>> Fixes: 26ac471c5354 ("ASoC: sh: rz-ssi: Add SSI DMAC support")
> 
> Maybe add fixes tag for full duplex case as the separation of 
> Playback/ Capture is introduced in that patch.

OK

> 
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Cheers,
> Biju
> 
>> ---
>>
>> Changes in v2:
>> - none
>>
>>  sound/soc/renesas/rz-ssi.c | 8 ++++++--
>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c index 6efd017aaa7f..2d8721156099
>> 100644
>> --- a/sound/soc/renesas/rz-ssi.c
>> +++ b/sound/soc/renesas/rz-ssi.c
>> @@ -415,8 +415,12 @@ static int rz_ssi_stop(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)
>>  	rz_ssi_reg_mask_setl(ssi, SSICR, SSICR_TEN | SSICR_REN, 0);
>>
>>  	/* Cancel all remaining DMA transactions */
>> -	if (rz_ssi_is_dma_enabled(ssi))
>> -		dmaengine_terminate_async(strm->dma_ch);
>> +	if (rz_ssi_is_dma_enabled(ssi)) {
>> +		if (ssi->playback.dma_ch)
>> +			dmaengine_terminate_async(ssi->playback.dma_ch);
>> +		if (ssi->capture.dma_ch)
>> +			dmaengine_terminate_async(ssi->capture.dma_ch);
>> +	}
>>
>>  	rz_ssi_set_idle(ssi);
>>
>> --
>> 2.39.2
> 

