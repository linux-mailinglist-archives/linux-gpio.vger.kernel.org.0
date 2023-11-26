Return-Path: <linux-gpio+bounces-524-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 432557F9526
	for <lists+linux-gpio@lfdr.de>; Sun, 26 Nov 2023 20:58:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6884F1C20849
	for <lists+linux-gpio@lfdr.de>; Sun, 26 Nov 2023 19:58:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C651212E55;
	Sun, 26 Nov 2023 19:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="nSvzK9S5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9AAFE8
	for <linux-gpio@vger.kernel.org>; Sun, 26 Nov 2023 11:58:19 -0800 (PST)
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 06A283F457
	for <linux-gpio@vger.kernel.org>; Sun, 26 Nov 2023 19:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1701028697;
	bh=Fv5Sy1bgeeKuTWXOaS5zgFRHLi1qOcJDMOy9gTwJIrY=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=nSvzK9S5Vwa7e73CcfEcB+oTnJftr//hZb4ddHmP7PIFsSGFpX0RYu5aMvjQar1J6
	 sandQ+Ssxnd/2krJGdBw8M4aLc8U2NRj/emkj3k+A/JnNBUaUrV9Jq576n10PMIBrb
	 h6CA3BeYPeSNlLjaGa6x8LYvbdbx5zRaXu/xO6lVjEj41W8IfHwVnCWuULQxwIwUWl
	 BNKQBdkMJO0E2tMQv3i3hUgG6wduSqWpf5xpUCZYiaPlx6WgW6brsI6pdgdPpWmaSW
	 XGwuibD2LdkcT9ruAcl9H+wjmUCGS2NouPt0JLUVOopsKS+R89cKfpH7SOkQ2bwv0u
	 fHB9UHbEQUrZA==
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-41cb4d6744bso44651061cf.0
        for <linux-gpio@vger.kernel.org>; Sun, 26 Nov 2023 11:58:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701028696; x=1701633496;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fv5Sy1bgeeKuTWXOaS5zgFRHLi1qOcJDMOy9gTwJIrY=;
        b=jFjjjwLeFrYhc+EQHyk4PRPPbFtWUg/CsnINWlzuUPWQZ0EWd/WBLhEYBMk2/P+WEU
         3gRWpYxN8CEEFJzvWxMU3oC9oYGxr/1ONixoJZwbM2BSuHcnSjiQeichvUJsjELdGZj1
         pD8bNuxGkWkQl56p7HiPXL8h7W+nPv0eAjrJN3s1HYO4TfYgkPHMbZmNGzG3iRSsQRN6
         0iHaafFYE4qWU3DqH6iewIJz5QNLNA6tfbNd0KZwUrFVc+OgS0KlhNk3Y4rtyw35pcrk
         SZ0qllWRTPBhQy5tjpE5ZS+N9IQQToAt9jKQJRfCQoAPhQEKNrV888Wl+1WIulYHqM1t
         cq3A==
X-Gm-Message-State: AOJu0YywRutIObSkW1aNT+6nCoPKbcLrNwtczZ7sAyvKxSscHHATa1DH
	Yu+so/TVgri88EDhmHbnYK43fbF2A6scawsDkh0cRcypTkWkbIk2ZrGOyw4rLapVeRvekTfAn4N
	y0V9ErWFl6pPHigBgoR6xJ+Skf92oUWvJFheU3fBWDvStcUyiYFWv5eo=
X-Received: by 2002:a05:622a:4e:b0:415:138e:d858 with SMTP id y14-20020a05622a004e00b00415138ed858mr10677428qtw.60.1701028695975;
        Sun, 26 Nov 2023 11:58:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHzfyxHlMPg6gs3qECUZMlDZNOsnBSQXcHKr05s9isHZQzCbpV2qykQRVIfDqD/UjwyIvvSobv1eWomDNEQTz0=
X-Received: by 2002:a05:622a:4e:b0:415:138e:d858 with SMTP id
 y14-20020a05622a004e00b00415138ed858mr10677398qtw.60.1701028695690; Sun, 26
 Nov 2023 11:58:15 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 26 Nov 2023 20:58:15 +0100
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20231123193355.3400852-21-andriy.shevchenko@linux.intel.com>
References: <20231123193355.3400852-1-andriy.shevchenko@linux.intel.com> <20231123193355.3400852-21-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Sun, 26 Nov 2023 20:58:15 +0100
Message-ID: <CAJM55Z_bWE8BU5V+j5DFHoBm+EWngj9dOVZ8Qq0x7EimLCWbZg@mail.gmail.com>
Subject: Re: [PATCH v2 20/21] pinctrl: starfive: Convert to use grp member
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Jianlong Huang <jianlong.huang@starfivetech.com>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-mips@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Cc: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	NXP Linux Team <linux-imx@nxp.com>, Sean Wang <sean.wang@kernel.org>, 
	Paul Cercueil <paul@crapouillou.net>, Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, 
	Hal Feng <hal.feng@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"

Andy Shevchenko wrote:
> Convert drivers to use grp member embedded in struct group_desc.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> ---
>  drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c | 8 ++++----
>  drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c | 8 ++++----
>  2 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
> index ea70b8c61679..21bfbbaede72 100644
> --- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
> +++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
> @@ -654,7 +654,7 @@ static int starfive_set_mux(struct pinctrl_dev *pctldev,
>  		return -EINVAL;
>
>  	pinmux = group->data;
> -	for (i = 0; i < group->num_pins; i++) {
> +	for (i = 0; i < group->grp.npins; i++) {
>  		u32 v = pinmux[i];
>  		unsigned int gpio = starfive_pinmux_to_gpio(v);
>  		u32 dout = starfive_pinmux_to_dout(v);
> @@ -797,7 +797,7 @@ static int starfive_pinconf_group_get(struct pinctrl_dev *pctldev,
>  	if (!group)
>  		return -EINVAL;
>
> -	return starfive_pinconf_get(pctldev, group->pins[0], config);
> +	return starfive_pinconf_get(pctldev, group->grp.pins[0], config);
>  }
>
>  static int starfive_pinconf_group_set(struct pinctrl_dev *pctldev,
> @@ -876,8 +876,8 @@ static int starfive_pinconf_group_set(struct pinctrl_dev *pctldev,
>  		}
>  	}
>
> -	for (i = 0; i < group->num_pins; i++)
> -		starfive_padctl_rmw(sfp, group->pins[i], mask, value);
> +	for (i = 0; i < group->grp.npins; i++)
> +		starfive_padctl_rmw(sfp, group->grp.pins[i], mask, value);
>
>  	return 0;
>  }
> diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
> index 9d71e8c13310..60160965cd29 100644
> --- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
> +++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
> @@ -307,7 +307,7 @@ static int jh7110_set_mux(struct pinctrl_dev *pctldev,
>  		return -EINVAL;
>
>  	pinmux = group->data;
> -	for (i = 0; i < group->num_pins; i++) {
> +	for (i = 0; i < group->grp.npins; i++) {
>  		u32 v = pinmux[i];
>
>  		if (info->jh7110_set_one_pin_mux)
> @@ -437,7 +437,7 @@ static int jh7110_pinconf_group_get(struct pinctrl_dev *pctldev,
>  	if (!group)
>  		return -EINVAL;
>
> -	return jh7110_pinconf_get(pctldev, group->pins[0], config);
> +	return jh7110_pinconf_get(pctldev, group->grp.pins[0], config);
>  }
>
>  static int jh7110_pinconf_group_set(struct pinctrl_dev *pctldev,
> @@ -508,8 +508,8 @@ static int jh7110_pinconf_group_set(struct pinctrl_dev *pctldev,
>  		}
>  	}
>
> -	for (i = 0; i < group->num_pins; i++)
> -		jh7110_padcfg_rmw(sfp, group->pins[i], mask, value);
> +	for (i = 0; i < group->grp.npins; i++)
> +		jh7110_padcfg_rmw(sfp, group->grp.pins[i], mask, value);
>
>  	return 0;
>  }
> --
> 2.43.0.rc1.1.gbec44491f096
>

