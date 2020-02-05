Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3BBF153077
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2020 13:18:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726953AbgBEMS1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 Feb 2020 07:18:27 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:39437 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726277AbgBEMS0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Feb 2020 07:18:26 -0500
Received: by mail-wm1-f67.google.com with SMTP id c84so2491239wme.4
        for <linux-gpio@vger.kernel.org>; Wed, 05 Feb 2020 04:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=voMdPtqTu9Je6ipNUTsS1dof90qK0VWTr6b+FpuYAkw=;
        b=rbYxnd3Uix7LvN8ZvaV0sEul0n8FVzPXwHi7sHxmLtOpmfZGdBtWi+TVgWzW5dKARR
         6A5yOT4I3hYP7jhJmEzkNzdZoIo9QUZ5eKrl/CrxN+bpQkrNx+7UHuSCkWjanxeK8/zF
         PlKx3mHY3WdKj7TmWrM3JCpP/+DtEWP/2pUfTvEusUpDPaSrEzobnG9zQrOACe3LywVB
         Xh7JJYtulg4YpAs7zkDo8D/uYt+pEawWL9RDV4qaRaG3hVDd1uNSuFZ5a6ueXc0C0ojS
         LDgmedeSLNDaJUrtpI7t3t72nkeETwNSQQCbkuAjPJ0rqKV34c+/wi9U9HQ7vjNcV6EC
         /fyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=voMdPtqTu9Je6ipNUTsS1dof90qK0VWTr6b+FpuYAkw=;
        b=KqHudJUI/JrO6gfZcumdqz0XwLezvgGNkMkK4OWLHpsnS2CRfweagUdE/yUpwENRix
         UPPlg5cIsuRikc2zFZhmC47C4m+lVY3aiUdIqxtKWl4nfBqqvBjNKZyhChy0QG7ShP0j
         yrfZE6L6DKhV0a4nOct6ek2/DIiUsr0kB1pHg0hKaK0VUywKmaOvCuhFMJ5JjRIu8PDD
         rMgaxUb8XLaEylkBUfdpPSao98bW2qf4Rh5p3FzgPQrRxa3SEQSVtMRgsKyu+H6OFgzF
         XKKcfohyyeI5b5v1h0uVWu47OEHF9KhFrdj1NewU7MBRggMNWPxQycigNpDyfP1LLpBB
         N6OA==
X-Gm-Message-State: APjAAAUTZXJHmmXM1LXSt2oThH0bFLKTZi+cItyI1H6W2LVv5dRIGSrR
        tuw565vGeXDxyqEhqyB/CiHjkA==
X-Google-Smtp-Source: APXvYqyDoDPihMTOysPRfqs269bKMj5DhpyROGO1P5iqEr8w+Aqy9iE+RcMqTgaKG2uVbVB/PT73+Q==
X-Received: by 2002:a1c:4d08:: with SMTP id o8mr5620521wmh.86.1580905104558;
        Wed, 05 Feb 2020 04:18:24 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id y20sm7513220wmi.25.2020.02.05.04.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2020 04:18:23 -0800 (PST)
References: <CAJZgTGF2ihuu_bSzQ93iBTf1YQ4_NM29S4iBFM8Fhd_RUaw2vQ@mail.gmail.com>
User-agent: mu4e 1.3.3; emacs 26.3
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Nicolas Belin <nbelin@baylibre.com>, linus.walleij@linaro.org
Cc:     Kevin Hilman <khilman@baylibre.com>, linux-gpio@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: meson-gxl: fix GPIOX sdio pins
In-reply-to: <CAJZgTGF2ihuu_bSzQ93iBTf1YQ4_NM29S4iBFM8Fhd_RUaw2vQ@mail.gmail.com>
Date:   Wed, 05 Feb 2020 13:18:22 +0100
Message-ID: <1ja75x6xdd.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On Wed 05 Feb 2020 at 12:22, Nicolas Belin <nbelin@baylibre.com> wrote:

> In the gxl driver, the sdio cmd and clk pins are inverted. It has not caused
> any issue so far because devices using these pins always take both pins
> so the resulting configuration is OK.
>
> Fixes: 0f15f500ff2c ("pinctrl: meson: Add GXL pinctrl definitions")
> Signed-off-by: Nicolas Belin <nbelin@baylibre.com>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

> ---
>  drivers/pinctrl/meson/pinctrl-meson-gxl.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxl.c
> b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
> index 72c5373c8dc1..e8d1f3050487 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson-gxl.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
> @@ -147,8 +147,8 @@ static const unsigned int sdio_d0_pins[]    = { GPIOX_0 };
>  static const unsigned int sdio_d1_pins[]       = { GPIOX_1 };
>  static const unsigned int sdio_d2_pins[]       = { GPIOX_2 };
>  static const unsigned int sdio_d3_pins[]       = { GPIOX_3 };
> -static const unsigned int sdio_cmd_pins[]      = { GPIOX_4 };
> -static const unsigned int sdio_clk_pins[]      = { GPIOX_5 };
> +static const unsigned int sdio_clk_pins[]      = { GPIOX_4 };
> +static const unsigned int sdio_cmd_pins[]      = { GPIOX_5 };
>  static const unsigned int sdio_irq_pins[]      = { GPIOX_7 };
>
>  static const unsigned int nand_ce0_pins[]      = { BOOT_8 };

