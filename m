Return-Path: <linux-gpio+bounces-29324-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB14CAA4D2
	for <lists+linux-gpio@lfdr.de>; Sat, 06 Dec 2025 12:05:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8FF4F30BE2C7
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Dec 2025 11:04:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20FE12F0C6D;
	Sat,  6 Dec 2025 11:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RkVE+rKu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D5A2E03F1
	for <linux-gpio@vger.kernel.org>; Sat,  6 Dec 2025 11:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765019071; cv=none; b=IEXRB2hYHcsS4qlg530piphjBwkSu+UW8Q6JKEvgzVisJ4Ps2I1NfpzfVoQWI/z9KGHpiJZJR2OVh4kyHdXpRcDIe9auxljiP14vH+u0in8R/juhDkyUW6gkT6go8feB3gef8byJZqzjYnH2m2Ipxlg2HQbG59B4/T53rMdeQ3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765019071; c=relaxed/simple;
	bh=LQa7x2Xqo1R3BU1iXV2K28BQPa/asQzgGrxZOPXc3Xk=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rFEjHaNxbuxWl6paqMmSLt+ZYFV+IE7HcDlr4Fy+J4bBPP6HhFIpC9VmbYo2hRSrwgRWmRib6YvKT4WErnJ6XHJsxlvx1KUq/gQsbvO/WQeenqh3zVKADfp95ycSuoPmkhEHu3DAx8qKlj1QEO7fVkofeNBYWBnUddDy90X1ru8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RkVE+rKu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C1F8C4AF0B
	for <linux-gpio@vger.kernel.org>; Sat,  6 Dec 2025 11:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765019071;
	bh=LQa7x2Xqo1R3BU1iXV2K28BQPa/asQzgGrxZOPXc3Xk=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=RkVE+rKuk6vqlW3wOjGewK6yLFURkkY7rICN6MN5rU4SJTIsmQoiC4q44ybmi+W/O
	 8vof5AApEEZckXAaTSIJcYUA4p8LjKvFUv0eg9TbeQFektaikX5c8Rb/eqdgaX/TiH
	 KD1SfaZT1/IfEDFSbgGQ2Psp+i/TBZ3oZzCXEy22LnLBg3LiA0ddhZsrL/zFC/mhDJ
	 0oFKxVNkqNi85aLI8J4+iCDTQqx70VA8LQTkxUByU26b/DZSsF/9GjpQMoJSGT9zPX
	 aW6suAvEjHbDaWcz0ikDiOpjYsuwtTnmtIjniizKq84SW/bCH5WG1AcPAbL4G4CaWc
	 SuR4Q46lX32Bg==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-59581e32163so3839339e87.1
        for <linux-gpio@vger.kernel.org>; Sat, 06 Dec 2025 03:04:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWyuzmD4RtZDnPv+0Wtk3mVb/yjNh6z/AizeoGtHxcrq4prjiJNRz44+kxby1rYu4hEuMdd0OLo1GRC@vger.kernel.org
X-Gm-Message-State: AOJu0YwnpxvtIbUyI/Qkf5A4/JE2e/1QrqMDf/9/gsy7EjWxDlWDBKTW
	9IBbsXnkgop+ccMo0zr2ilwFn0faouG1AE+fjMrqc5viaStxLxXIDbnewjm3kKuQRdVc66JtX4u
	jYk1CUGOCXlMyDHVg54d6qmLwmuca2rK0LyGqYXxhYg==
X-Google-Smtp-Source: AGHT+IGzVIVocC6EzRFxCGvPhOPXFCCvOsJH5zhVLbERuSaCGM4g0MgyH12GWd9f4cyL9Esvb2xyvVlzmOz3yFQy3CQ=
X-Received: by 2002:a05:6512:2212:b0:594:2c51:f27b with SMTP id
 2adb3069b0e04-5987e88b210mr601668e87.18.1765019070175; Sat, 06 Dec 2025
 03:04:30 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 6 Dec 2025 03:04:28 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 6 Dec 2025 03:04:28 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20251206050844.402958-6-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251206050844.402958-1-ye.zhang@rock-chips.com> <20251206050844.402958-6-ye.zhang@rock-chips.com>
Date: Sat, 6 Dec 2025 03:04:28 -0800
X-Gmail-Original-Message-ID: <CAMRc=MdNNkQpXiaK7J12QjsQiL-DjxGUarvveeYze19-1wqfxw@mail.gmail.com>
X-Gm-Features: AQt7F2qQ1dE8DUY3pPJ8f0x-A-FdXwUF1S4eurzNXEEc-e8MOcdtpskXb3-4gCU
Message-ID: <CAMRc=MdNNkQpXiaK7J12QjsQiL-DjxGUarvveeYze19-1wqfxw@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] gpio: rockchip: support new version GPIO
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	tao.huang@rock-chips.com, Linus Walleij <linus.walleij@linaro.org>, 
	Heiko Stuebner <heiko@sntech.de>
Content-Type: text/plain; charset="UTF-8"

On Sat, 6 Dec 2025 06:08:41 +0100, Ye Zhang <ye.zhang@rock-chips.com> said:
> Support the next version GPIO controller on SoCs like rv1126b.
>
> Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
> ---
>  drivers/gpio/gpio-rockchip.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
> index 47174eb3ba76..c3e831c6bcf1 100644
> --- a/drivers/gpio/gpio-rockchip.c
> +++ b/drivers/gpio/gpio-rockchip.c
> @@ -36,6 +36,7 @@
>  #define GPIO_TYPE_V2		(0x01000C2B)
>  #define GPIO_TYPE_V2_1		(0x0101157C)
>  #define GPIO_TYPE_V2_2		(0x010219C8)
> +#define GPIO_TYPE_V2_6          (0x01063F6E)
>
>  static const struct rockchip_gpio_regs gpio_regs_v1 = {
>  	.port_dr = 0x00,
> @@ -674,6 +675,7 @@ static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
>  	case GPIO_TYPE_V2:
>  	case GPIO_TYPE_V2_1:
>  	case GPIO_TYPE_V2_2:
> +	case GPIO_TYPE_V2_6:
>  		bank->gpio_regs = &gpio_regs_v2;
>  		bank->gpio_type = GPIO_TYPE_V2;
>  		bank->db_clk = of_clk_get(bank->of_node, 1);
> --
> 2.34.1
>
>

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

