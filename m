Return-Path: <linux-gpio+bounces-9151-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BFA95EC20
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 10:37:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB4631F20FF2
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 08:37:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0611113AD1D;
	Mon, 26 Aug 2024 08:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L3NssS4B"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1218A85654
	for <linux-gpio@vger.kernel.org>; Mon, 26 Aug 2024 08:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724661452; cv=none; b=sXND3/K/wFbD79d07w7f4TePau7QRUh+ap0DKcHTEgEGYBHXDwlmncWRemNhGanKIpIkp0c8DwcFbXqZPywpFj94jPiK9mIzY4nqug+xPrWfrXTDsb+NSzS1tKp4wC7abj5fJVtEu4znrkXQ6i2IRbsbDtrFOWczEBLNS1B+ogg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724661452; c=relaxed/simple;
	bh=oM7kZdEzfuoVDcva/iFWT2NafPlq6MKcJXIggs+6Tyo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rPbQUl30I9TXS/2eZib2laWoDK+mn9M9+UNNz0R5GBN/VWk9LlJ/4cM7G0pKCF4D/vykoB+wWluU7QdLzJD3Cm1nIqtfVfr/HObcvxd0YXJM7gcx8/7Ebc2p9rvsstdSYUS+pFSpgCj57nLsfuM1NO9J2IDABYejyF0HTvx+NFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L3NssS4B; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2f3f0a31ab2so45299701fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 26 Aug 2024 01:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724661449; x=1725266249; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mGxn7htxuwUZYATtE1s95mMQFcoul/l6IY3bhY0xjag=;
        b=L3NssS4BvwSejKvZBmvkndcutnGJth0RyDil0X4anX3mkGjaXjSeFJqjp9TKh2cIym
         HyhPYmVbBU6EH4FhVU72qJdBVT5v4h/4L6+wbIvdgRffFi2kFWIK83BghlvmwDsD96x4
         cW1WH1RYOsil2lC1ysZxAmBw60lPqaYbV0Qs6kbYZN0itX9k0LiS5PfVFJJpl07S1096
         G/VmzKfxApZRVvQ/hrWSavbRaz9KkQ/lkIrrcWhwkAs15+ywjomskaupS62PeFKMpaK5
         xValHQwGigWjv1t6Kf35YIowontAuH/ZDHRMv3iAg5Jrt5ZLsvxVn0CSKCUPFoI6ZBV8
         mVyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724661449; x=1725266249;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mGxn7htxuwUZYATtE1s95mMQFcoul/l6IY3bhY0xjag=;
        b=wfQ9OPWL271AQdFaP3wUH+lipogdKOgIJdUGbYN1sTAPa/89rkNKd8rm1b9TyJNZIW
         +SrYUH9aVdHmuJ3Qj+uHrhUaHaHGhLQjVTj3l45ha91XkqfLTosLTjxDEbK7zTSJ9OgE
         Wo643+66nRukMYo9StfVP20kksHAttqJyj3vAer4UdxD4u54AhWtAlvPjIY4DQ02n6FW
         E6Z4ooR67RojQNP3zFl+BrXYOLYhfM8MtkBvss0AwgMUOl3SykGNNVdd/3O4EISqE7+I
         09WAUl4kx1BeZo6HKhcpkHENCQOAcy4KQJIeNofEOZpMDbDOaFY1Rupyy0xCQEWxdCqq
         TexQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKI5tK5afDkyIGg7i3Cq0U+OcregLUbwkTN55OaePla2K25ujaSm5KyUpSGwJVyXeeyAic4KgswPBL@vger.kernel.org
X-Gm-Message-State: AOJu0YzOP0bU5WO+tQIn67nffMBCtnx1llXWzJMy0bvQg3vjmXFWl0D8
	R64ANmWSdwCSesp+d7NpqYCX4EXfuqZjG1XbfK/JSiPdAr3wSjpDzG9br4arfg9h8KctcXl2z1x
	ImI91Od9TyQx8Fh4IVC4Si9spS+gFWV4q7p7UnA==
X-Google-Smtp-Source: AGHT+IHeMj7YBiO18vWqML21+FRq1pFZqa1ADKBp7TehE1pILknI7LCAogJhtpZ5d4cDOjaBm1wLNKiaVP0+mEb8qL0=
X-Received: by 2002:a05:6512:3188:b0:52e:9c0a:3522 with SMTP id
 2adb3069b0e04-5343885f878mr6873547e87.44.1724661448779; Mon, 26 Aug 2024
 01:37:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240821070740.2378602-1-billy_tsai@aspeedtech.com> <20240821070740.2378602-3-billy_tsai@aspeedtech.com>
In-Reply-To: <20240821070740.2378602-3-billy_tsai@aspeedtech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 26 Aug 2024 10:37:17 +0200
Message-ID: <CACRpkdY-sNVdb+nSG4WLZnkj+7jvQ1D0t0Sn+gvOBgCfzvr2fw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] gpio: Add G7 Aspeed gpio controller driver
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: brgl@bgdev.pl, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	joel@jms.id.au, andrew@codeconstruct.com.au, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	BMC-SW@aspeedtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Billy,

thanks for your patch!

On Wed, Aug 21, 2024 at 9:07=E2=80=AFAM Billy Tsai <billy_tsai@aspeedtech.c=
om> wrote:

> In the 7th generation of the SoC from Aspeed, the control logic of the
> GPIO controller has been updated to support per-pin control. Each pin now
> has its own 32-bit register, allowing for individual control of the pin=
=E2=80=99s
> value, direction, interrupt type, and other settings.
>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
(...)

> +static inline u32 field_get(u32 _mask, u32 _val)
> +{
> +       return (((_val) & (_mask)) >> (ffs(_mask) - 1));
> +}
> +
> +static inline u32 field_prep(u32 _mask, u32 _val)
> +{
> +       return (((_val) << (ffs(_mask) - 1)) & (_mask));
> +}

Can't you use FIELD_GET and FIELD_PREP from
<linux/bitfield.h> instead?

> +static inline void ast_write_bits(void __iomem *addr, u32 mask, u32 val)
> +{
> +       iowrite32((ioread32(addr) & ~(mask)) | field_prep(mask, val), add=
r);
> +}
> +
> +static inline void ast_clr_bits(void __iomem *addr, u32 mask)
> +{
> +       iowrite32((ioread32(addr) & ~(mask)), addr);
> +}

This as a whole looks a bit like a reimplementation of regmap-mmio, can you
look into using that instead?

Yours,
Linus Walleij

