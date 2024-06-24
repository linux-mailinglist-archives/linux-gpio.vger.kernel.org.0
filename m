Return-Path: <linux-gpio+bounces-7633-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB430914187
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2024 06:57:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC0981C223A8
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2024 04:57:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80C3310A1E;
	Mon, 24 Jun 2024 04:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="BxXvXiZ2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA5217552
	for <linux-gpio@vger.kernel.org>; Mon, 24 Jun 2024 04:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719205048; cv=none; b=dzKPzyNFByMgAh2EqU6NcA/5r440Abx3YyI5nVt8SOJbMhfpns6hVg1QA1QHCC+COxt0ixier9RieSrCiV1BBnFBSCLE0/H4D4VOqTjTKiuC40kAheqn9kkDJWmnCQZXjNjErtYbVLpmLYKgSBFy9CLN2BhFqOLoHExCs9Xwf08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719205048; c=relaxed/simple;
	bh=phiJ6SmQt4PGVhxlzteKdz4Tx9PzcGXSswl3QDBWW2Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bxMzJufEOxRQbZH1XJ+OhDjG4A7ISTQMqqKQA2lc0u6PsIksnS9OrnC4fVcVTwq1f1Rmgw+FgFa4UcobpCz1Atfi7M67Aas8oRCYgHhwtLFPw3vsLje1mnJuONZ4bP6pAZggWHeqBy08wacv8la88Mz0wSH60ljdueJbVvdvFVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=BxXvXiZ2; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-57d06101d76so3966298a12.3
        for <linux-gpio@vger.kernel.org>; Sun, 23 Jun 2024 21:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1719205045; x=1719809845; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n81hC2mURHX4tBeWsNYtjmTYadrSB2qqFxnJH1xgsRQ=;
        b=BxXvXiZ2Po9/j4eL7OwoucTQTwk1hr8PHkXjiJUMVCVOwbTJ9fy0dwuOpwSJZrvT1V
         eabirO7G4cOg7ydZoCVL2fdpS8B/2MX2ZH5UliXcXJsI67x4I6oKKxA1F/uXOMrIVPzK
         diYrbqd5JRmNwKHkDIdIpZij65qj+F2X97JQ4uCJH0NZRupWYAVylWB5DhehXWfWAt3F
         68USNEEruixoy+euD4ZBaZbsEnG5NE8+gFoO0JxULOCJahsbmS5ofv9+in5/i9O59deq
         hcSZqRgXw7H85x15lj75qWvOiA2HOEQHGIKPCOUCKllcnEtiM0Nv+VwoY02m5EyzNtaW
         0kGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719205045; x=1719809845;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n81hC2mURHX4tBeWsNYtjmTYadrSB2qqFxnJH1xgsRQ=;
        b=eR/UnWt6J4ACbxYzLg9f9Q7fWgDxEcdi8CKwBQjLcIJ1C9aq003sKoocUtIyQZxZW5
         lsaoEnb41wb3OvHyVX/nasPkiCfORSlzKHgD1KWyqC4YYT+8GWABBsJ+mVzAkxh3/wvF
         WlUxe0muvaAEywNruW3wo3vdMDvfBMsMiQXete2gljj+FEeFqabRd/1v4/AYQicOUztv
         o+DD1mg3DCC8+Q/tGmcfq/yyoNJxTfSJh/t8o55WpR4kFFDCWaeK9PDspN22nrREZ95z
         Y8T5ru6hpMneZBPm0HEeTx0+iUsndAF3QLc6yaHjS1E9lHqnz4gSf9cCjNbBdPJF4Blj
         oCYw==
X-Forwarded-Encrypted: i=1; AJvYcCXwaznzgUkPYnDhA+ylU0C9rzZjdRIN2UsqLHaRHWLKDiTFw7qsDfsuemfLO680GzLQFLUSPAKljNjgzhOoljfCh4Kj+HHvbmgXgg==
X-Gm-Message-State: AOJu0YxVmc3Zt2aY6sMdPc331Ds2OISJ3rtUXLtJeIirrDrcapbft9Uy
	MOnhWSP35MyVvRX167rVTF93OAtgV+ZMZOJebl51byAOIfEO03y0kxx0P+GO47Y=
X-Google-Smtp-Source: AGHT+IH29Wte+fcyhuRsKCPqSiaTew5pLfA8h8FdKKj6z0S4WRk8AFcfmziFTtXwiLY7lgiU/PX/XQ==
X-Received: by 2002:a50:d504:0:b0:57c:749f:f5ef with SMTP id 4fb4d7f45d1cf-57d4a020170mr2321012a12.34.1719205045172;
        Sun, 23 Jun 2024 21:57:25 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.70])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d303d7aecsm4209761a12.20.2024.06.23.21.57.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Jun 2024 21:57:24 -0700 (PDT)
Message-ID: <e66c9670-f7cb-4f3c-9e10-ef210bf73719@tuxon.dev>
Date: Mon, 24 Jun 2024 07:57:23 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] pinctrl: renesas: rzg2l: Move RZG2L_SINGLE_PIN
 definition to top of the file
Content-Language: en-US
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240618174831.415583-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240618174831.415583-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20240618174831.415583-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 18.06.2024 20:48, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Define `RZG2L_SINGLE_PIN` at the top of the file to clarify its use for
> dedicated pins for improved readability.
> 
> While at it update the comment for `RZG2L_SINGLE_PIN_PACK` macro and place
> it just above the macro for clarity.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>


> ---
>  drivers/pinctrl/renesas/pinctrl-rzg2l.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> index b79dd1ea2616..37a99d33400d 100644
> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -64,6 +64,8 @@
>  #define PIN_CFG_ELC			BIT(20)
>  #define PIN_CFG_IOLH_RZV2H		BIT(21)
>  
> +#define RZG2L_SINGLE_PIN		BIT_ULL(63)	/* Dedicated pin */
> +
>  #define RZG2L_MPXED_COMMON_PIN_FUNCS(group) \
>  					(PIN_CFG_IOLH_##group | \
>  					 PIN_CFG_PUPD | \
> @@ -105,15 +107,13 @@
>   */
>  #define RZG2L_GPIO_PORT_PACK(n, a, f)	RZG2L_GPIO_PORT_SPARSE_PACK((1ULL << (n)) - 1, (a), (f))
>  
> -/*
> - * BIT(63) indicates dedicated pin, p is the register index while
> - * referencing to SR/IEN/IOLH/FILxx registers, b is the register bits
> - * (b * 8) and f is the pin configuration capabilities supported.
> - */
> -#define RZG2L_SINGLE_PIN		BIT_ULL(63)
>  #define RZG2L_SINGLE_PIN_INDEX_MASK	GENMASK_ULL(62, 56)
>  #define RZG2L_SINGLE_PIN_BITS_MASK	GENMASK_ULL(55, 53)
> -
> +/*
> + * p is the register index while referencing to SR/IEN/IOLH/FILxx
> + * registers, b is the register bits (b * 8) and f is the pin
> + * configuration capabilities supported.
> + */
>  #define RZG2L_SINGLE_PIN_PACK(p, b, f)	(RZG2L_SINGLE_PIN | \
>  					 FIELD_PREP_CONST(RZG2L_SINGLE_PIN_INDEX_MASK, (p)) | \
>  					 FIELD_PREP_CONST(RZG2L_SINGLE_PIN_BITS_MASK, (b)) | \

