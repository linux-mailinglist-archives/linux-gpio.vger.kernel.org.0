Return-Path: <linux-gpio+bounces-31014-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOUwHnl+c2nDwwAAu9opvQ
	(envelope-from <linux-gpio+bounces-31014-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 14:58:17 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0067689D
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 14:58:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E779D301A436
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 13:58:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CFDC28CF42;
	Fri, 23 Jan 2026 13:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kFg7unut"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A18E1B808
	for <linux-gpio@vger.kernel.org>; Fri, 23 Jan 2026 13:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769176695; cv=pass; b=T1jcwLkSpCH4zee+JWC5EE4xHFqXMen7P7PJSwppenvVD5vLIlRNsbnbkku3qH5ak1LUFLvoc8i0vBK6mzXvnZr4dOu19Gr7weFPnKJ9SVMgTbboXl5vFNz0we9gWPrwIPgW0AEvUaP/roIC47fFpxm4UkM0wR4AJ2vDdZGXcvs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769176695; c=relaxed/simple;
	bh=H3K7Y1UUd5FzBZWnAK5FQmEqy8Onwx/IMpxiGXi9tXU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fz1ifIjnYN8f3C6/9Q6SGMoKDTLYs2GNQ5ugIOCwhtwK9X2u0KVxk/ZNLWWWgbgU6PwYHWHNH9iceq+CCOK7fskPcQ0/eMqNNu3NctkIk927QgWhyEswiQrATVxV8Q3rELEl+tpXb+wH4yE0d3CPorGiWPsChwb9w8sm6m0A3rc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kFg7unut; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6505d141d02so3273268a12.3
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jan 2026 05:58:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769176691; cv=none;
        d=google.com; s=arc-20240605;
        b=MBJmpba/LtDqZlBBfhZECKxE8CBznU0Up7ZvYHWehpgbESYSAAEXAPk1LZd4+CPHsU
         7g5ZHLdOq6Ynr3e7/JJgzEdK9pcC6UUHqnzBdHr1BmiqCwSHiL7J7Mpd+8M1Gj8OtilM
         DKs2/tFqZh2VXt7B+6h66hfc7nkRS569/CBnQHfAOi/No/EXrGUkbZJb7xNC+fRMzVEO
         HC5uHLi6Xg7IzE0lk2O/5732J5I2eP8Oqk3cCKqKp5IJKitIRYU0vT0TZOq85k7iezrM
         t47+ZRFlCwIA2W6KdjlhKnv4GnaGji77HRLsd6Veh5NfbRYi2eMpz1/UnRgQI9aLrxTL
         BRHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GGE0nuYpaKQHKtQZCEQ7uetRNJ215gHEdrxyGaPgKyU=;
        fh=UUWedPUikVCCgKzNSzxp9b5A/+rS1hx6FGwnr67gnZ0=;
        b=cF4TeUm/QBPInwww/wLu5PIgxfTXQJivHlgsJyBiiughofBpAMH5bF49N/GOc32F0y
         pVJ9ERmJJ5lHsT+chREfMh8Ruk8vfQap2krvoKyaxlQeNmVfKQ/0EMMHEBDYHKgB6XNA
         wIDq4eEN/ZbRqOKQLsP6pE7C+PK3cAYEdx6fmeGcpUNn8MKYhT+ANJABYwq8GuwzUSVY
         MUXF54iPa4ZXMap4YXGTJ81lkAEqffl50DXKr+fV/qzo4GJ5EeiRHL2UwI6f1gbCNkU7
         2EAX5FbZn1A+W/lw6iDXSGWR6Id9A37+nPUNu9zQVwT2X+j389yD1pTNhKE/4nTBjgar
         EV9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769176691; x=1769781491; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GGE0nuYpaKQHKtQZCEQ7uetRNJ215gHEdrxyGaPgKyU=;
        b=kFg7unutyj8QwTqB5dpZrodjclh+UoECaeXXsRkLKNVovm8U+PdTaO+s4wyIQsmdah
         uurICUIJ0OWKZhMFKabyq49xIaJvkQSPb91xiCTaHURdIfH3bveEqfeGGBCdQTSPBhYN
         H/5SZaLVr+HWSGPzB8D8AkS2Gq3YT9Ffw7QwC5arg8lTfEqZ3ESrsKqliQ5/fbxHf1RC
         mMRodejSxots4zCtfZutrXH5L/obx7zvEYJwgEk5wn8kAeAE2SVzZf0vgem4pQD5T3ZB
         YYPrsjZUipUHkY2HTLNYUjLDegRVWM7OpCnnDH+vk0Sv1OxTfhVXUs7jFKVPCUXBMguR
         94wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769176691; x=1769781491;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GGE0nuYpaKQHKtQZCEQ7uetRNJ215gHEdrxyGaPgKyU=;
        b=JEyj5SewNtfaVSHd271QP6MHYmLRDQVAVAy4qSZrSG1BHVgDLwP8F2cNTSybmJwCyJ
         SQ/0uf8humEEWHhcg8JuPhXqVD3TAkvmzbV/Dx38V+vmB4Hf4S5QvvJa03PrT/iBH7AT
         fcbYtbE1i1c54F9pHTqtcYN4Nce6CkbKtwvuEcW8BsBNzUF+AYLgV67w8ukINmKREnSM
         RuzyJw0WltuzxrluoU1SPpGC22YSuzfkU33FcUMAv+ygRXbwYx609EfBol+G71KfO0DU
         vcOadu//cg4AFgB1NPhEXNmnq/QVkA/nksp7lgxVabaSipcPmlDVvetYb2iO3lj8TRio
         A7UA==
X-Forwarded-Encrypted: i=1; AJvYcCWoX3ukJ0b2hKM9Xs4JCPaoPv54Oq7PiR67/IPuYyFKHZw1ZkLlVHCMqjnpV5Rj24s+yAGYhNCBLIWd@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/ziXzfzVScrQifZjjgX4g/eSMSfG8UEuZ9a/x7HgGFddjkCqQ
	Y++wOXjZLjztQvV8JoULzn0heDmVWmD0tGb36Ld4+HBU9AY0fjkTrfJ/mnPNRAji1RqxzS3NKjX
	+gFNx5l4ARB1AlkH8XKXmx59q7QUON+OzCD/hQ5Q0IQ==
X-Gm-Gg: AZuq6aIhrXLSmhyZrOnaltue/nD+yGfj7oiaVmhDnapSqGFyA+oLc2Fog2wWN4K8tF3
	R0oWznAMe9XU/eyF503/q8itnAQnK86Rndyt2BsC1N8ZtK9Byan4c8Cua3n3mFLtZE+Jdp4e2S3
	e9GtERAG26mGrcdsiikZw99aN73061uDmF/+aq0NtFB39u6QuhTU12+qTB0bSY2TV74Oetsk17c
	vKCPNLlY8o4onJQa70dLtf0lZB2uPynaEvcm0PbuEJJfvO+fGfGtPC0+ok+4xRgI/DbksaVbPg5
	GVHGDygf6zPn5fbC7v3fi5CW
X-Received: by 2002:a05:6402:144b:b0:64d:4a01:fc23 with SMTP id
 4fb4d7f45d1cf-65848762170mr2202436a12.10.1769176691377; Fri, 23 Jan 2026
 05:58:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120115923.3463866-1-khristineandreea.barbulescu@oss.nxp.com> <20260120115923.3463866-7-khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <20260120115923.3463866-7-khristineandreea.barbulescu@oss.nxp.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 23 Jan 2026 14:57:58 +0100
X-Gm-Features: AZwV_QiAQsZA5zBmebv7whc3eQu-e3v4RPd4MoMEVVMDs04rAsUL7nt2fdX8y_w
Message-ID: <CAKfTPtD6LOMFGhzG3dhiSQCNbYrGLjBiT83eqz9mmwaDVpNV=w@mail.gmail.com>
Subject: Re: [PATCH v8 06/10] pinctrl: s32g2: change the driver to also be
 probed as an MFD cell
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Alberto Ruiz <aruizrui@redhat.com>, Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org, 
	Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31014-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FREEMAIL_CC(0.00)[linaro.org,bgdev.pl,kernel.org,gmail.com,suse.com,nxp.com,pengutronix.de,linuxfoundation.org,redhat.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vincent.guittot@linaro.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linaro.org:dkim,nxp.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EC0067689D
X-Rspamd-Action: no action

On Tue, 20 Jan 2026 at 12:59, Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> wrote:
>
> From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
>
> The old pinctrl bindings for SIUL2 are deprecated by a previous commit.
> The new bindings for the SIUL2 represent it as an MFD device:
> - one cell for combined pinctrl&GPIO
> - two cella acting as syscon providers for SoC registers access
>
> This commit allows the existing driver to also be probed as an MFD cell.
> The changes only impact the way the driver initializes the regmaps for
> accessing MSCR and IMCR registers.
>
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>

[..]

> @@ -969,12 +1017,28 @@ int s32_pinctrl_probe(struct platform_device *pdev,
>         s32_pinctrl_desc->confops = &s32_pinconf_ops;
>         s32_pinctrl_desc->owner = THIS_MODULE;
>
> +       ipctl->regions = devm_kcalloc(&pdev->dev, soc_data->mem_regions,
> +                                     sizeof(*ipctl->regions), GFP_KERNEL);
> +       if (!ipctl->regions)
> +               return -ENOMEM;
> +
> +       ipctl->legacy = soc_data->legacy;
> +       if (soc_data->legacy)
> +               ret = legacy_s32_pinctrl_regmap_init(pdev, ipctl);
> +       else
> +               ret = s32_pinctrl_mfd_regmap_init(pdev, ipctl);
> +
> +       if (ret)
> +               return dev_err_probe(&pdev->dev, ret,
> +                                    "Failed to init driver regmap!\n");
> +
>         ret = s32_pinctrl_probe_dt(pdev, ipctl);
>         if (ret)
>                 return dev_err_probe(&pdev->dev, ret,
>                                      "Fail to probe dt properties\n");
>
> -       ret = devm_pinctrl_register_and_init(&pdev->dev, s32_pinctrl_desc,
> +       ret = devm_pinctrl_register_and_init(s32_get_dev(ipctl),

you should better add a child node for your pinctrl mfd device in its
"nxp,s32g2-siul2" parent instead of registering the pinctrl device on
the parent device. This would fix phandle to gpio too



> +                                            s32_pinctrl_desc,
>                                              ipctl, &ipctl->pctl);
>         if (ret)
>                 return dev_err_probe(&pdev->dev, ret,
> diff --git a/drivers/pinctrl/nxp/pinctrl-s32g2.c b/drivers/pinctrl/nxp/pinctrl-s32g2.c
> index c49d28793b69..2d56ffb1a109 100644
> --- a/drivers/pinctrl/nxp/pinctrl-s32g2.c
> +++ b/drivers/pinctrl/nxp/pinctrl-s32g2.c
> @@ -3,7 +3,7 @@
>   * NXP S32G pinctrl driver
>   *
>   * Copyright 2015-2016 Freescale Semiconductor, Inc.
> - * Copyright 2017-2018, 2020-2022 NXP
> + * Copyright 2017-2018, 2020-2022, 2024-2025 NXP
>   * Copyright (C) 2022 SUSE LLC
>   */
>
> @@ -762,7 +762,7 @@ static const struct pinctrl_pin_desc s32_pinctrl_pads_siul2[] = {
>         S32_PINCTRL_PIN(S32G_IMCR_SIUL_EIRQ31),
>  };
>
> -static const struct s32_pin_range s32_pin_ranges_siul2[] = {
> +static const struct s32_pin_range legacy_s32_pin_ranges_siul2[] = {
>         /* MSCR pin ID ranges */
>         S32_PIN_RANGE(0, 101),
>         S32_PIN_RANGE(112, 122),
> @@ -773,27 +773,47 @@ static const struct s32_pin_range s32_pin_ranges_siul2[] = {
>         S32_PIN_RANGE(942, 1007),
>  };
>
> -static const struct s32_pinctrl_soc_data s32_pinctrl_data = {
> +static const struct s32_pinctrl_soc_data legacy_s32_pinctrl_data = {
>         .pins = s32_pinctrl_pads_siul2,
>         .npins = ARRAY_SIZE(s32_pinctrl_pads_siul2),
> -       .mem_pin_ranges = s32_pin_ranges_siul2,
> -       .mem_regions = ARRAY_SIZE(s32_pin_ranges_siul2),
> +       .mem_pin_ranges = legacy_s32_pin_ranges_siul2,
> +       .mem_regions = ARRAY_SIZE(legacy_s32_pin_ranges_siul2),
> +       .legacy = true,
>  };
>
>  static const struct of_device_id s32_pinctrl_of_match[] = {
>         {
>                 .compatible = "nxp,s32g2-siul2-pinctrl",
> -               .data = &s32_pinctrl_data,
> +               .data = &legacy_s32_pinctrl_data,
>         },
>         { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, s32_pinctrl_of_match);
>
> +static const struct s32_pin_range s32_pin_ranges_siul2[] = {
> +       /* MSCR pin ID ranges */
> +       S32_PIN_RANGE(0, 101),
> +       S32_PIN_RANGE(112, 190),
> +       /* IMCR pin ID ranges */
> +       S32_PIN_RANGE(512, 595),
> +       S32_PIN_RANGE(631, 1007),
> +};
> +
> +static const struct s32_pinctrl_soc_data s32_pinctrl_data = {
> +       .pins = s32_pinctrl_pads_siul2,
> +       .npins = ARRAY_SIZE(s32_pinctrl_pads_siul2),
> +       .mem_pin_ranges = s32_pin_ranges_siul2,
> +       .mem_regions = ARRAY_SIZE(s32_pin_ranges_siul2),
> +       .legacy = false,
> +};
> +
>  static int s32g_pinctrl_probe(struct platform_device *pdev)
>  {
>         const struct s32_pinctrl_soc_data *soc_data;
>
>         soc_data = of_device_get_match_data(&pdev->dev);
> +       if (!soc_data)
> +               soc_data = &s32_pinctrl_data;
>
>         return s32_pinctrl_probe(pdev, soc_data);
>  }
> --
> 2.50.1
>

