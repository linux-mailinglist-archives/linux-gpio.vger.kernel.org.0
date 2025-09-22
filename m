Return-Path: <linux-gpio+bounces-26457-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D15BB919EF
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 16:17:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC0561900FCD
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 14:17:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 572321E5724;
	Mon, 22 Sep 2025 14:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="FJtRL/ii"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB111DD9AC
	for <linux-gpio@vger.kernel.org>; Mon, 22 Sep 2025 14:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758550642; cv=none; b=UVivGXAg3VOMKELuDCRDtmBeHfI8SfpTdlcZYQb+ssZKeq6skzsAKmvO+vcVLq9Ucy4EVoByv6jAi8rZCEkXgk/JA96j0m3bfzFft6ZYZwQDxe2MWTHiLlFOxKJKpbBJff+g3v/x4U0+T8sEqTDjRyxidj6RxGUezEhwSVgZwJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758550642; c=relaxed/simple;
	bh=fWzzdjlL6Qeihn+o/itxjEqN74qvQQO38r2QqurBj94=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ugKQfc+C/gnXIM7wRk0NE4QjjNetHpEzyn1qVShALElClrsj3rCENy6ntL9REQ1fEn7tAEZGgMJCrvb+Wfp0BFecUKYdF6VAmFTKczYHCau/v6VB4Eee8oNafe93HmG5Is2zd+slU4dXasPgEYb8rEbJ0T7Q0yMW7B80/eR59r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=FJtRL/ii; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-367874aeeacso16306631fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 22 Sep 2025 07:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758550638; x=1759155438; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D42mDx7XES4dJT5DCpqob2SIIqhWq10lpNC2IIru3f8=;
        b=FJtRL/iilefnLtGJ8RHt8JgsdkR9Bwv5jp5h9u6hOudyZ6LPBr9JRFkLYvaXS5n/Pj
         3eN6Slc2BXlzCDaaPKfYUf5kPD8EA8rodgkufNy8SWMmZi14ttFzIAHz7CnvDpQbeG9P
         CltohY2KfFtz68kLonVt6XNO6gjd8lrIw9B9vlGk4wwxZvnWInWWjtBaC40wPJK9CDOh
         QnNLP1EwDbHlXAfEEI8M6895VghrF9762JOwmVEvQqjx+nH9TOnut8S28f/AwfvZjytS
         2Wn1dHe5v0Lq10jRdpBiKL4t3iN1tecmmm8LUqjTucWDL/g9rbqyOm3rXyuCvHdO41fa
         xh2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758550638; x=1759155438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D42mDx7XES4dJT5DCpqob2SIIqhWq10lpNC2IIru3f8=;
        b=ExIHtV/tXWj2H9qks/djnJlmSVnPd+OOXqCTdALeZhdn/ip2wg5FOEURhQZi4BByM6
         kXBTXbE912ahLalmLiyV0OH6YFseQ6EbMPBxoybfEcE0xcVoqnwULBQD/1hjre1Ts7uU
         q5GXihdR7pLbZYWxcQVCvYgUwFzT3wY2crycqO74z6p2HQcoWko7mMWNiWSLUaiXID85
         r1e9z90Jt7a2gSPucpGJP/EWaLjVomMP5owBlSAHhWpXsOXz40P+EYlTC0s3umqqItfZ
         vPw7Wbslptw2fy0nxl1dBLGvysrsctnp9bUa56ZqOopuJ53SZcpQIkp3oO1oPrFTPKOF
         IN1g==
X-Forwarded-Encrypted: i=1; AJvYcCVjZ3A5WxcoSj2FsHuXtFXEOEDYUmJAplCRG5ojzOJMVkFQ2rO7KHNgNtkQqQ+tU7EcB9Lh+fKPb0mr@vger.kernel.org
X-Gm-Message-State: AOJu0YyiLAcHSa0ChNVG8Q32Y+uIicNPFBpFY6ANrnPIzVSQGLFr0xHy
	pIA6/3KmW3WNZ40mji4Sqe9EipZm4YQbx3ZiqOXsiiyW+R7tf2TS1HfS5zKtWCo6C7Vql1xr3TR
	fzx2IraGpKzfwbmbDGimPuTLCk3E2o2SLbii7NiseaA==
X-Gm-Gg: ASbGncsoY64To3FH/8LGaLhEnPv6qKR3od9Ziv7Yk8B1zBSnh85f1gwwcmeCEtn/mM0
	FPOMawApmcBTWIT9yBjXtikh5F8H90BLuHF2NuahQJ8GuXP/t8FHOqZHrDwMJEaIM2zE2q6hTB/
	oxHtUpDHOJUIngxZGIMNtFUks0NChw4Vfh06WqMbKpP1deFkMWNA63aTR2nPi7BHwLPUNIytADS
	PRn27DhyEUO3LriQfKTr1Uq1eLPx89bAvZaCA==
X-Google-Smtp-Source: AGHT+IGS2AjVg06y9Gl4ZoVygRe0txj+WZLEO+s0iRtEWqABbE+tNtV+p0mvb++GTiupjPDEskTHy6Yf/wVmcolsOo4=
X-Received: by 2002:a2e:be07:0:b0:36a:97e5:c4a5 with SMTP id
 38308e7fff4ca-36a97e5c8d3mr17177811fa.39.1758550638057; Mon, 22 Sep 2025
 07:17:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250919-rda8810pl-mmc-v1-0-d4f08a05ba4d@mainlining.org>
In-Reply-To: <20250919-rda8810pl-mmc-v1-0-d4f08a05ba4d@mainlining.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 22 Sep 2025 16:17:05 +0200
X-Gm-Features: AS18NWBBtPPpfa65LcAbGVqvkVRIVUyroOGhaWLkgkmXpHaSdWCO_RUkKb2djeo
Message-ID: <CAMRc=Mc4hO1LDumxAfkB1W6miTJXR1NUVAKBVarkwiF2yGvSLA@mail.gmail.com>
Subject: Re: [PATCH 00/10] RDA8810PL SD/MMC support
To: dang.huynh@mainlining.org
Cc: Manivannan Sadhasivam <mani@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-unisoc@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-hardening@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 18, 2025 at 8:49=E2=80=AFPM Dang Huynh via B4 Relay
<devnull+dang.huynh.mainlining.org@kernel.org> wrote:
>
> This patch series aims to add SDMMC driver and various drivers required
> for SDMMC controller to function.
>
> This also fixed a bug where all the GPIO switched from INPUT to OUTPUT
> after the GPIO driver probed or by reading the GPIO debugfs.
>
> This patch series is a split from [1] to ease the maintainers.
>

This is still targeting at least 4 subsystems and isn't making the
merging any easier. Are there any build-time dependencies here? If
not, then split it further into small chunks targeting individual
subsystems and the relevant ARM SoC tree.

Bartosz

> Tested on Orange Pi 2G-IOT using a Buildroot environment.
>
> [1]: https://lore.kernel.org/all/20250917-rda8810pl-drivers-v1-0-9ca9184c=
a977@mainlining.org/
>
> Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>
> ---
> Dang Huynh (10):
>       dt-bindings: gpio: rda: Make interrupts optional
>       dt-bindings: clock: Add RDA Micro RDA8810PL clock/reset controller
>       dt-bindings: dma: Add RDA IFC DMA
>       dt-bindings: mmc: Add RDA SDMMC controller
>       gpio: rda: Make IRQ optional
>       gpio: rda: Make direction register unreadable
>       clk: Add Clock and Reset Driver for RDA Micro RDA8810PL SoC
>       dmaengine: Add RDA IFC driver
>       mmc: host: Add RDA Micro SD/MMC driver
>       ARM: dts: unisoc: rda8810pl: Add SDMMC controllers
>
>  .../bindings/clock/rda,8810pl-apsyscon.yaml        |  43 ++
>  Documentation/devicetree/bindings/dma/rda,ifc.yaml |  45 ++
>  .../devicetree/bindings/gpio/gpio-rda.yaml         |   3 -
>  Documentation/devicetree/bindings/mmc/rda,mmc.yaml |  92 +++
>  MAINTAINERS                                        |  18 +
>  .../boot/dts/unisoc/rda8810pl-orangepi-2g-iot.dts  |  20 +
>  .../arm/boot/dts/unisoc/rda8810pl-orangepi-i96.dts |  20 +
>  arch/arm/boot/dts/unisoc/rda8810pl.dtsi            |  47 +-
>  drivers/clk/Kconfig                                |   1 +
>  drivers/clk/Makefile                               |   1 +
>  drivers/clk/rda/Kconfig                            |  14 +
>  drivers/clk/rda/Makefile                           |   2 +
>  drivers/clk/rda/clk-rda8810.c                      | 769 +++++++++++++++=
++++
>  drivers/dma/Kconfig                                |  10 +
>  drivers/dma/Makefile                               |   1 +
>  drivers/dma/rda-ifc.c                              | 450 +++++++++++
>  drivers/gpio/gpio-rda.c                            |   4 +-
>  drivers/mmc/host/Kconfig                           |  12 +
>  drivers/mmc/host/Makefile                          |   1 +
>  drivers/mmc/host/rda-mmc.c                         | 853 +++++++++++++++=
++++++
>  include/dt-bindings/clock/rda,8810pl-apclk.h       |  70 ++
>  include/dt-bindings/dma/rda-ifc.h                  |  28 +
>  22 files changed, 2495 insertions(+), 9 deletions(-)
> ---
> base-commit: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
> change-id: 20250918-rda8810pl-mmc-3f33b83c313d
>
> Best regards,
> --
> Dang Huynh <dang.huynh@mainlining.org>
>
>

