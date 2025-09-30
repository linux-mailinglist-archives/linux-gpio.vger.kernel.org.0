Return-Path: <linux-gpio+bounces-26685-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F15BAEB97
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Oct 2025 01:00:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E8FC07A62F4
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Sep 2025 22:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FD9A2571DD;
	Tue, 30 Sep 2025 23:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S31i/LCt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C2E2459D7
	for <linux-gpio@vger.kernel.org>; Tue, 30 Sep 2025 23:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759273217; cv=none; b=HUDLeJDWlLsjre+kT7kByP18McuwBuZu1+KYrBud6M5T+3lP/cBkPjZ/bRQqFVn9gUjMUPAMBgljDpiOtUKSheVO0TQR6/Lk+kmVzIqEYt71v+cOIv8iIdeqOu50auf+8m0uByKw6stODQAQU9uhH8O1n8WfsadDQibbCYVPvgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759273217; c=relaxed/simple;
	bh=0JAdTX9kSCI0ZL2lixlSV2aTjK1FwSvpdQJXgYHkgA8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mmnKEkk514vuuzWBNCebGg0Z5mxh2ioYP+dRcKw+T8uO64YWuhujkuqzwh41kw7XWr4fiTnYyVK0cRBpd2XrmSJr7K1gYRDnk6kFRm3yoT+JKCHZ0GL0K/9t4HuvI+8XGlZtAka04GSzOwbsjYtRYD6/6Ox0U18t3jPini2BtNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S31i/LCt; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-57dfd0b6cd7so8203415e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 30 Sep 2025 16:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759273212; x=1759878012; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YNGpoJ5D1HDARLkPTC0Il8tsGPxqsMJo0AN7zBWkLI0=;
        b=S31i/LCte32fAC5JKpz4CSTkJ7tadDLjIngdsdFR0nKDFcnmWKB2uxbjY+uWyfeuQx
         7vuCrzkydDTd8o6JtxmTiYEQK4Ocmxhl8PcX2HsD3nDPAEw67NV6DF8DplxQnccZabL2
         ioJkc1BiogXLwFDOM0UsQ7otBAaVFIIBI8UlHMtaPoDxyrxJjuKPjyB3uAH+vWW2OTGh
         xCEhlDCX75P/BAP9VhPc6pcs593xJkgpvTJCqWz8FZNEAV9SKFd+wHOJDXKv446mUYi0
         WBSxwY3CWEHUzuluEAlq+ScbPBD5zqEthRCxah5dWLKs4X6H9UO4IgyLn9EBXP6f5xen
         fRRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759273212; x=1759878012;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YNGpoJ5D1HDARLkPTC0Il8tsGPxqsMJo0AN7zBWkLI0=;
        b=X2RtdFxJuS/tqwtFdqGCk9zfErquBh0pJfErUMcVfuFi7fcJO70tWC3NP+yVzKg8gT
         NAg563tn6gDBNjlZ5HucftYYLP2p517d0IkEWbX9MHKRwRnjUU/1ZyZY5lZABauuCJ/p
         aa7sp7L6M0/mKoj37B/JzKHkGiTgoiqD5GBNAqOf1pPqkZQpRDYBrBpNXyugtskKW/dW
         SdZNUg2PoIZ5/6jZpAVNHR/vEn+Riu+T5ZHk5LP9kup2oD3kEGEztilkkCewLDJqPt2w
         wkOmkY4mGcRKYGbHtamwBrDx2aYYEfPRVtkSNgpuwh6lCeWKHpcX+bMLMZm/QEwHPSmD
         PyTg==
X-Forwarded-Encrypted: i=1; AJvYcCX0SC0D3bMxbk29PZj0eIXHZwp4bw8R9rySp7LjoBroTcgX4SI2ZrTyvPZ4Oe1kfMtSatC7aMQBWKfB@vger.kernel.org
X-Gm-Message-State: AOJu0YytV+rCM8gty2yxfB+DYMZUjHRkwCtFBWv/g0oXT6Md9ZZNKVQ4
	qtxyM1gkhFT2vqIkwwV/I1QYdHczKrRiFdojTvJ6nK7BCUk0cWSQA7FScmVJo4I6ekIb/VaJr0A
	UzCWhORQMs4gIizC6WtrmFIu3r43GTodbp8izKI6Mtg==
X-Gm-Gg: ASbGncvr4Lie5Q8YfXZasyWzdwUm6ZeUh1CiN0FQvHLL/3YmE8uJu5qb/7nfN0LEspX
	rTglGhvnMLsMOoSqZJlHiCtHHZ/MtAq9v9xhMZyVNOyeOF6RudfsfZi6gKose410BVnp1JxLasr
	W6cvh5F3WmzdaKsl5yDggwwcp0oG2EkotHH6VTUv5r6ReL6j3dQApulM6IZmK6VLRmoOq+wmvxk
	fmW9kwSBjQmI7BrCuD5TSH8jAF1/kc=
X-Google-Smtp-Source: AGHT+IEVz6f2f6ubGL1NAHbArQuJx21btrHT6IMUIR8tJN8YYNQAnJBbiclaELxhNdFbCs8p1UkBI5RhBN5Vzj3bgbs=
X-Received: by 2002:a05:6512:b05:b0:57d:d62e:b212 with SMTP id
 2adb3069b0e04-58af9f4b755mr335472e87.38.1759273212293; Tue, 30 Sep 2025
 16:00:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250922142427.3310221-1-ioana.ciornei@nxp.com> <20250922142427.3310221-9-ioana.ciornei@nxp.com>
In-Reply-To: <20250922142427.3310221-9-ioana.ciornei@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 1 Oct 2025 01:00:01 +0200
X-Gm-Features: AS18NWDno9w3YJfSDGfd27SZbITIyFHNn9tKwshGM3VINLqos-LcWggqf3IrU68
Message-ID: <CACRpkdYBz2Ly20N92w1FCZFOs6GONzEHi8ZsVg_HAUNExh071A@mail.gmail.com>
Subject: Re: [PATCH v5 08/12] gpio: add QIXIS FPGA GPIO controller
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
	Michael Walle <mwalle@kernel.org>, Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Frank Li <Frank.Li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ioana,

thanks for your patch!

On Mon, Sep 22, 2025 at 4:24=E2=80=AFPM Ioana Ciornei <ioana.ciornei@nxp.co=
m> wrote:

> Add support for the GPIO controller found on some QIXIS FPGAs in
> Layerscape boards such as LX2160ARDB and LS1046AQDS. This driver is
> using gpio-regmap.
>
> A GPIO controller has a maximum of 8 lines (all found in the same
> register). Even within the same controller, the GPIO lines' direction is
> fixed, which mean that both input and output lines are found in the same
> register. This is why the driver also passed to gpio-regmap the newly
> added .fixed_direction_output bitmap to represent the true direction of
> the lines.
>
> Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
(...)
> +++ b/drivers/gpio/Kconfig
> @@ -1986,6 +1986,15 @@ config GPIO_LATCH
>           Say yes here to enable a driver for GPIO multiplexers based on =
latches
>           connected to other GPIOs.
>
> +config GPIO_QIXIS_FPGA
> +       tristate "NXP QIXIS FPGA GPIO support"
> +       depends on MFD_SIMPLE_MFD_I2C || COMPILE_TEST
> +       select GPIO_REGMAP
> +       help
> +         This enables support for the GPIOs found in the QIXIS FPGA whic=
h is
> +         integrated on some NXP Layerscape boards such as LX2160ARDB and
> +         LS1046AQDS.
> +
>  config GPIO_MOCKUP
>         tristate "GPIO Testing Driver (DEPRECATED)"
>         select IRQ_SIM

Why is this menu entry among the virtual GPIO drivers?
Move it under the MFD menu where it should be, please.

With this fixed:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

