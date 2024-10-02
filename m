Return-Path: <linux-gpio+bounces-10684-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D82EE98D29E
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 13:58:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 084E11C21651
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 11:58:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C451201241;
	Wed,  2 Oct 2024 11:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="f+IRTxBq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F89200114
	for <linux-gpio@vger.kernel.org>; Wed,  2 Oct 2024 11:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727870299; cv=none; b=VXtw1Huv20gLPpU8TQPQciwYKZjwlRj3vZAQkaqNuRVFl4XwpdV5cAqJCxgYl1IMzw1vhP57OJ0Iu6FBjhC76P346rRXIxeGw0CgypYeVA6GZKWx/V3ldrBB+CJPCa8dj6z8z4u9Em8AFsIJQwWga66aT663oYHDMy6wT+xtoGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727870299; c=relaxed/simple;
	bh=N4nanubrZloQt6H+/yg1NMcUdEKwHYaF2wzFYn8NjJA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E+7SUvzQMTpnm7r+FkVQIj7rMU1EZJ1OQL3/nYmKOvUdtv6GEj6enjxG/2T0qbAZ9OKyTilMKYzQsrldh/cs5bUbbFyW44kdThQCOY1qsmJ9xa5mLaYtcyOMOb/wxbl0LuikbqvJ/imsuQQIhed+I5yiVSTcodkNBiFwyySRSNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=f+IRTxBq; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fad100dd9fso44354581fa.3
        for <linux-gpio@vger.kernel.org>; Wed, 02 Oct 2024 04:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727870296; x=1728475096; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4xuDo4Lr9uVZcQtomduS6VfvfKIUum1uatoQDPxhvGs=;
        b=f+IRTxBq/zs/ZnvmJRbSd29Dy4zu4i7qKjcBXfWGUEVk6IyrJ1NJnXy/mP72jscmOe
         iaw96EJsMImSWKRe4sqjRraaUHKa08mAVyl4e3gSYtgGtYm7Cv84XNW2YfGjXgKsnbp6
         Slws/iHoOVMf/yMdcYwUvYnMt+nvV1+a4YyWR/BE8ZmsahZtX9lAr97EeBG1YYJKZDYw
         FrS66acSMs9KnJJGGo+M4MbSmjcV2z/hohUkvwBQ9f6J8wjjbbILnm3uBigIpxDqb9GP
         QCtMryaRWG37mXf+QGwCab+EJ0WQkAQwE2InOc61f+ALIOfUlUv/5UwvajtpwyTMG5RT
         mpow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727870296; x=1728475096;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4xuDo4Lr9uVZcQtomduS6VfvfKIUum1uatoQDPxhvGs=;
        b=A9vo8huCIkii3lj/WDy/PZIT9oP1GmXo9jWHaCh/fJJiJ0vH7kWhV258UHNgTOvden
         8Iy4gj3I+GLTLqM31Nt4g1dhvienZ64T4fzVMuLpwrueFgZQFwobienKp2p2X9iNeglK
         dTn5eU5YggJTmExkIlIaKr/TohF5roXKzJiL2rkrnThEC/uqYBJ3CarGdAI17LjYft1/
         Fee6iD6OIi4NSRPR+sOvJpPHdzC1pJEew4u2ns5F3YELfxtheVrHbMQb0smLBubmdGML
         GrAQOBQHBB4Dgcs/nw6K9UhHc+aoEBb4GdECH4Fpvc98wtnONit8tYQ+DEbIfY2v9G7z
         QN1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWxTchn1rpgEVPXhHuY8ysjHAhDygKlrCI1D2aOgGlTQDHaRE14XahawHukokVT7XiVgBpgZX1ooI0y@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj9KW74AlAylAh5ko+7dPT+EFwqaB4T95xK1CYYvkNWEMDKGbl
	a6cieWF8Yb1tRYLGh1opLKDrL7LG/elriwNr/bVWfIrYr4ioEZefGxkoz04EQf0=
X-Google-Smtp-Source: AGHT+IFg1miftEMHVgGxmQjPa2VMmir89jlS2yV5cnvRgU9XOmUyLOMctk99dCS12vn2H43xW7EP7w==
X-Received: by 2002:a05:651c:1990:b0:2fa:d4ef:f234 with SMTP id 38308e7fff4ca-2fae10228c8mr27006121fa.1.1727870295912;
        Wed, 02 Oct 2024 04:58:15 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.162.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c2997f50sm844074466b.198.2024.10.02.04.58.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Oct 2024 04:58:15 -0700 (PDT)
Message-ID: <054fd366-89fe-4ab8-b9db-88c5245cb719@suse.com>
Date: Wed, 2 Oct 2024 13:58:13 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] pinctrl: s32: add missing pins definitions
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
 <20240930132344.3001876-2-andrei.stefanescu@oss.nxp.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <mbrugger@suse.com>
Autocrypt: addr=mbrugger@suse.com; keydata=
 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
 PVrr2NoUqi/bxI8fFQJD1jVj8K0=
In-Reply-To: <20240930132344.3001876-2-andrei.stefanescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 30/09/2024 15:23, Andrei Stefanescu wrote:
> Added definitions for some pins which were missing from the
> S32G2 SIUL2 pinctrl driver. These pins are used by the JTAG,
> PFE and LLCE hardware modules.
> 
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>

Reviewed-by: Matthias Brugger <mbrugger@suse.com>

> ---
>   drivers/pinctrl/nxp/pinctrl-s32g2.c | 52 +++++++++++++++++++++++++++++
>   1 file changed, 52 insertions(+)
> 
> diff --git a/drivers/pinctrl/nxp/pinctrl-s32g2.c b/drivers/pinctrl/nxp/pinctrl-s32g2.c
> index 440ff1879424..c49d28793b69 100644
> --- a/drivers/pinctrl/nxp/pinctrl-s32g2.c
> +++ b/drivers/pinctrl/nxp/pinctrl-s32g2.c
> @@ -216,6 +216,12 @@ enum s32_pins {
>   	S32G_IMCR_CAN1_RXD = 631,
>   	S32G_IMCR_CAN2_RXD = 632,
>   	S32G_IMCR_CAN3_RXD = 633,
> +
> +	/* JTAG IMCRs */
> +	S32G_IMCR_JTAG_TMS = 562,
> +	S32G_IMCR_JTAG_TCK = 572,
> +	S32G_IMCR_JTAG_TDI = 573,
> +
>   	/* GMAC0 */
>   	S32G_IMCR_Ethernet_MDIO = 527,
>   	S32G_IMCR_Ethernet_CRS = 526,
> @@ -229,7 +235,21 @@ enum s32_pins {
>   	S32G_IMCR_Ethernet_RX_DV = 530,
>   	S32G_IMCR_Ethernet_TX_CLK = 538,
>   	S32G_IMCR_Ethernet_REF_CLK = 535,
> +
>   	/* PFE EMAC 0 MII */
> +	S32G_IMCR_PFE_EMAC_0_MDIO = 837,
> +	S32G_IMCR_PFE_EMAC_0_CRS = 836,
> +	S32G_IMCR_PFE_EMAC_0_COL = 835,
> +	S32G_IMCR_PFE_EMAC_0_RX_D0 = 841,
> +	S32G_IMCR_PFE_EMAC_0_RX_D1 = 842,
> +	S32G_IMCR_PFE_EMAC_0_RX_D2 = 843,
> +	S32G_IMCR_PFE_EMAC_0_RX_D3 = 844,
> +	S32G_IMCR_PFE_EMAC_0_RX_ER = 840,
> +	S32G_IMCR_PFE_EMAC_0_RX_CLK = 839,
> +	S32G_IMCR_PFE_EMAC_0_RX_DV = 845,
> +	S32G_IMCR_PFE_EMAC_0_TX_CLK = 846,
> +	S32G_IMCR_PFE_EMAC_0_REF_CLK = 838,
> +
>   	/* PFE EMAC 1 MII */
>   	S32G_IMCR_PFE_EMAC_1_MDIO = 857,
>   	S32G_IMCR_PFE_EMAC_1_CRS = 856,
> @@ -317,6 +337,13 @@ enum s32_pins {
>   	S32G_IMCR_LLCE_CAN13_RXD = 758,
>   	S32G_IMCR_LLCE_CAN14_RXD = 759,
>   	S32G_IMCR_LLCE_CAN15_RXD = 760,
> +	S32G_IMCR_LLCE_UART0_RXD = 790,
> +	S32G_IMCR_LLCE_UART1_RXD = 791,
> +	S32G_IMCR_LLCE_UART2_RXD = 792,
> +	S32G_IMCR_LLCE_UART3_RXD = 793,
> +	S32G_IMCR_LLCE_LPSPI2_PCS0 = 811,
> +	S32G_IMCR_LLCE_LPSPI2_SCK = 816,
> +	S32G_IMCR_LLCE_LPSPI2_SIN = 817,
>   	S32G_IMCR_USB_CLK = 895,
>   	S32G_IMCR_USB_DATA0 = 896,
>   	S32G_IMCR_USB_DATA1 = 897,
> @@ -503,6 +530,12 @@ static const struct pinctrl_pin_desc s32_pinctrl_pads_siul2[] = {
>   	S32_PINCTRL_PIN(S32G_IMCR_USDHC_DAT7),
>   	S32_PINCTRL_PIN(S32G_IMCR_USDHC_DQS),
>   	S32_PINCTRL_PIN(S32G_IMCR_CAN0_RXD),
> +
> +	/* JTAG IMCRs */
> +	S32_PINCTRL_PIN(S32G_IMCR_JTAG_TMS),
> +	S32_PINCTRL_PIN(S32G_IMCR_JTAG_TCK),
> +	S32_PINCTRL_PIN(S32G_IMCR_JTAG_TDI),
> +
>   	/* GMAC0 */
>   	S32_PINCTRL_PIN(S32G_IMCR_Ethernet_MDIO),
>   	S32_PINCTRL_PIN(S32G_IMCR_Ethernet_CRS),
> @@ -638,6 +671,13 @@ static const struct pinctrl_pin_desc s32_pinctrl_pads_siul2[] = {
>   	S32_PINCTRL_PIN(S32G_IMCR_LLCE_CAN13_RXD),
>   	S32_PINCTRL_PIN(S32G_IMCR_LLCE_CAN14_RXD),
>   	S32_PINCTRL_PIN(S32G_IMCR_LLCE_CAN15_RXD),
> +	S32_PINCTRL_PIN(S32G_IMCR_LLCE_UART0_RXD),
> +	S32_PINCTRL_PIN(S32G_IMCR_LLCE_UART1_RXD),
> +	S32_PINCTRL_PIN(S32G_IMCR_LLCE_UART2_RXD),
> +	S32_PINCTRL_PIN(S32G_IMCR_LLCE_UART3_RXD),
> +	S32_PINCTRL_PIN(S32G_IMCR_LLCE_LPSPI2_PCS0),
> +	S32_PINCTRL_PIN(S32G_IMCR_LLCE_LPSPI2_SCK),
> +	S32_PINCTRL_PIN(S32G_IMCR_LLCE_LPSPI2_SIN),
>   	S32_PINCTRL_PIN(S32G_IMCR_CAN1_RXD),
>   	S32_PINCTRL_PIN(S32G_IMCR_CAN2_RXD),
>   	S32_PINCTRL_PIN(S32G_IMCR_CAN3_RXD),
> @@ -652,6 +692,18 @@ static const struct pinctrl_pin_desc s32_pinctrl_pads_siul2[] = {
>   	S32_PINCTRL_PIN(S32G_IMCR_USB_DATA7),
>   	S32_PINCTRL_PIN(S32G_IMCR_USB_DIR),
>   	S32_PINCTRL_PIN(S32G_IMCR_USB_NXT),
> +	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_0_MDIO),
> +	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_0_CRS),
> +	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_0_COL),
> +	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_0_RX_D0),
> +	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_0_RX_D1),
> +	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_0_RX_D2),
> +	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_0_RX_D3),
> +	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_0_RX_ER),
> +	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_0_RX_CLK),
> +	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_0_RX_DV),
> +	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_0_TX_CLK),
> +	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_0_REF_CLK),
>   	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_1_MDIO),
>   	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_1_CRS),
>   	S32_PINCTRL_PIN(S32G_IMCR_PFE_EMAC_1_COL),

