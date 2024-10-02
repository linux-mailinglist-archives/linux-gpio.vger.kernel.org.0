Return-Path: <linux-gpio+bounces-10685-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A5998D2A5
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 14:00:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D777D1F22C8B
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 12:00:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3A401CF5DF;
	Wed,  2 Oct 2024 12:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="PvWguRL/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75DB194AD1
	for <linux-gpio@vger.kernel.org>; Wed,  2 Oct 2024 12:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727870423; cv=none; b=C8sbGJzsNHjSwq3UzaOl8M5pMkj29W/fVcAEOUUmAPWMHc3ovLYBgxZ9jHcG3wSMFWiDzO7GCYc3SrkMKTHFyBphyEs7ZD2bRBE6sq9dtBVbiO1JxCGwEsKL0yKtj30atGAXsHfJBnocTZnGo4VYRHyZwtcFx3kqx6K98IV+Qko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727870423; c=relaxed/simple;
	bh=tXLUOFuMcabAaH7RRoWMbEWnGHyK3YTaBTAbq54kgao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hUhCjZ7RWUBLj+F6exKt2oTG935hDyekzYwvBfXAxxkKXsPzPlYxFtSM9vIjl0LhhRReLlsXumUxpRsEEG3A2j8GWbzR6ZmR2TxM8jgW+2TKX0T9m2QrjEmEea20iVs+zK1DGiFetNvH3zIW8bxpGpqjlOqRKleA10cCx0YL7Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=PvWguRL/; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fabb837ddbso69742841fa.1
        for <linux-gpio@vger.kernel.org>; Wed, 02 Oct 2024 05:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727870420; x=1728475220; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0U1iMmO6Yb8v2aj8WGyHSmNMK+sbGpBJ9awFW1LpN04=;
        b=PvWguRL/pqP6zZnCLvNH1z4iOhe2yzHmrZIq19McIo3edW0+XknH+pVstpBoXbP9D+
         JY8bDTNQa0uMMnl4GelpTti3QS0P3b5B3hnXXPslmmZ/kP4cRoZyjBhmGR+Vfc7vcPp3
         ULFYNL1BneaSk8k2LbYU8xSOGMfLOVqiwfioYIYbRGnooaXE47wOpkGpSdCa568Hmkq+
         AKbgI1ud+D2pWmpTLjFZxJFL9DE7j/KUtagMnJwgt7ISNdD9Amksi3rrBSUL7Oufz8vb
         U4LO+8fnJtKo3XgablVe+DLG0wVRB5Cr7wTEfP5BNLH1bBfNE/hfYBsyBzdXZjmF7RnE
         Lo6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727870420; x=1728475220;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0U1iMmO6Yb8v2aj8WGyHSmNMK+sbGpBJ9awFW1LpN04=;
        b=BR5po83BCu/wdU4QpJm9ZThKPIatrR4sX6WqBuNZ9eeXcETtobSHcK7UaKSxGEZPxY
         H5+Ype9J9MJC2VvttZskTYV7e+KrEEmpzETIE5LEIuH4gTtGr3Cfg4KajERPRJCdAEdn
         Hq39omYXnjLAjbjnCXxB6ixqN0DxtibLjinw36KhT7OKcnr1gzvX3O0aJem4LvHL3Amx
         1MVrD9JImIhRw88oD7sJWHABCnVNtJDALuoMTT6qk9Edx40IkJC80f4/k3GkNUckORk8
         gfu+MTt+l9P/czahmd4errhmjiemPWuE65V/y0XsQalPLfH0IrPVcZmddzuuMqEEIhGA
         Tl7w==
X-Forwarded-Encrypted: i=1; AJvYcCUUT/MjfH57LyHMsGfZeXLTbCQ9UdyPtgjoCsZDWHY2L/rqb245NIxeRv2L3lbjpYGCU0rlOdCbR86R@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/w3kuVPYGPgdHU58kghqSUtPHUMyxSlynlCZJ9l2Fqv5HFJeM
	p6stRWFQ+j+hUKC+hq+HL1vA+voHZVfGVP3GKAZFdxsk7ia21haj8qZrPBEzapY=
X-Google-Smtp-Source: AGHT+IEFZS8hg2h4HKpUhEwch1eKO0aMzSYSCOcCmIeaVg6qzH4Hh2/nABCk2ldMboGUVrRAwvrY1A==
X-Received: by 2002:a2e:be84:0:b0:2fa:cfba:fb7f with SMTP id 38308e7fff4ca-2fae10b46eemr29688701fa.40.1727870419992;
        Wed, 02 Oct 2024 05:00:19 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.162.240])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c8824051b7sm7818872a12.7.2024.10.02.05.00.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Oct 2024 05:00:19 -0700 (PDT)
Message-ID: <8d0dc480-737e-4ab5-9f52-58024a9bfb03@suse.com>
Date: Wed, 2 Oct 2024 14:00:18 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: S32G3: add S32G3 compatible for the
 pinctrl node
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>,
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Ghennadi Procopciuc
 <Ghennadi.Procopciuc@oss.nxp.com>, Chester Lin <chester62515@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, NXP S32 Linux Team <s32@nxp.com>,
 Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>,
 Enric Balletbo <eballetb@redhat.com>
References: <20240930132344.3001876-1-andrei.stefanescu@oss.nxp.com>
 <20240930132344.3001876-4-andrei.stefanescu@oss.nxp.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <mbrugger@suse.com>
Autocrypt: addr=mbrugger@suse.com; keydata=
 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
 PVrr2NoUqi/bxI8fFQJD1jVj8K0=
In-Reply-To: <20240930132344.3001876-4-andrei.stefanescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 30/09/2024 15:23, Andrei Stefanescu wrote:
> Add the newly introduced S32G3 compatible for the pinctrl node.
> Currently, it will fall back to the S32G2 compatible.
> 
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>

Reviewed-by: Matthias Brugger <mbrugger@suse.com>

> ---
>   arch/arm64/boot/dts/freescale/s32g3.dtsi | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> index b4226a9143c8..f6aafe44c9d7 100644
> --- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> @@ -172,7 +172,8 @@ soc@0 {
>   		ranges = <0 0 0 0x80000000>;
>   
>   		pinctrl: pinctrl@4009c240 {
> -			compatible = "nxp,s32g2-siul2-pinctrl";
> +			compatible = "nxp,s32g3-siul2-pinctrl",
> +				     "nxp,s32g2-siul2-pinctrl";
>   				/* MSCR0-MSCR101 registers on siul2_0 */
>   			reg = <0x4009c240 0x198>,
>   				/* MSCR112-MSCR122 registers on siul2_1 */

