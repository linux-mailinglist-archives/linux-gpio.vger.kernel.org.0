Return-Path: <linux-gpio+bounces-20376-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF15ABE73E
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 00:35:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A3711BC2E3A
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 22:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6727125FA01;
	Tue, 20 May 2025 22:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e0Dn5uB9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561C825F7A5
	for <linux-gpio@vger.kernel.org>; Tue, 20 May 2025 22:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747780504; cv=none; b=fVBPGGollbJCx9MYaGopFVCLgvbO0/8WB0No8185nYpEVBVFIq1vmQuJQ9zp+1BHQ7ebDc9fD9KoyNTZuYZUHZJsS1IHX14qJx4x/ejshAGtCD1/xq6rzjpQiKqrRbXfz+V3OYwLTrkdu6lCfNaroQDItBNqSvM1zC5grLNdQzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747780504; c=relaxed/simple;
	bh=G/qZCh5e8IqALffgL4PSg+SILS7Tze0xhMEWFjvrHHc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HBIK2+X9vB9N7fORMLe25Lna4QL7d8LUB6MZepdrIc7ZHaqkFJCtEsWeF0GDAg/J8cVr8MzFjmIt96+mIVUn+5+4zKk6R2Sk4B251QR8ujME56M/K69JpmndIxb7+lycssrDYVjl6/R5qZS66+L/CoS8EdbeS7WKuj6NlfESDBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e0Dn5uB9; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-328114b262aso41925471fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 20 May 2025 15:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747780500; x=1748385300; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G2rh9i3/PUqd91HnT/agwHUBEJLIceaCRVKrhRf0A54=;
        b=e0Dn5uB9ac6prNeknALYJ7BuoRdeXIG822lQ7EoN8W8L5SozhHYtBGB2I6LKni0mGe
         E7MD/mPwCytlOqlj8wMDB843N9KmeUmrB3ecItahrETSO8xL4cFwcVeEctsc6IiQ5bH0
         AWU2SWuwWWBwrOqHU7WBxmpgG63EgMyHpeHSwLgqnV7uks9w/roBzJZgfK8EdxL1hLj/
         ioXDj8hzoAqCZ1Pez9SQbGpavb/gjupacpdHzDbJ6pq/zj/GveQ8k9XP/fg0/TLnJno9
         1Su0Fm99xwI7072qpMDVrh9tscWjLloaCtPOyzYpNLX2dRjOYiYkkXpxPZcwhDH7KFrR
         +kOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747780500; x=1748385300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G2rh9i3/PUqd91HnT/agwHUBEJLIceaCRVKrhRf0A54=;
        b=MtJER+h/6ZOuKa6makVQS39bebXqqMg2TlDO8/c+L6FdXTy3KTxlgLliVW1gqEXVFX
         uxHlPx5CBMQW3z1LIFMtRWhSIz7MnwFf2aElrE7GoeBysXO3BB+kb6wghi70M+SQZeC0
         VT4fLA9mR2tL0epwBlpCzJnsX8mWvJMzfuIuf7ngWe2mRYXQkAcMoYCjIruu5ljMBmLG
         huharotY/mC2KUxSM6Np8tRhOmb68PkIP0xU25kqi7ycfkD+SxYatP0pLNcxDNshuhL3
         gElKSjKD9dAe0u+ZhcGMetdEnKwK/dYRvvBNhtgcKclMho7cFqCTxnVVxEx2NB7IrlHX
         XeKw==
X-Forwarded-Encrypted: i=1; AJvYcCVHePG8Ut/GB4rAItedsangPEi6oesxTwDQlRoSGUxHbWm8VcotriP8VPyqY1/NbTaZkWp+VYOkS9Q1@vger.kernel.org
X-Gm-Message-State: AOJu0YyrbTYX64etr+gXzHpDBNKcGKWaXNDwyYZXcN5dsKt/X3qm8Xbj
	FoZ47eMqvY2ljBgCpjHbARg9DqnWjyvsdixZh5yS2yNZzDnv++UHq99QQ2fwvkVi44pWuIglOZK
	pklQUUHXtHQS+LKIoi2AlfeL3X9Qp6mSuC5ISxew7sA==
X-Gm-Gg: ASbGncv0w/x37ZrPFxp/LLEFm9MqR80F/87DlDMawdzlXJEwYPghp8iv6U7LhWThM3S
	KnaqXrzxwgz95HPhMMQP9b7BneMLr5abq9xn83uBnHfrgWZOyQi7W514NeuB+HpZdGQt3jrb3Ue
	81fclPZKb1VRT9XF6XbDYjWaxwkQiSFVPd2jP+2b5NS6A=
X-Google-Smtp-Source: AGHT+IG3zE80N3OdjZZgIj1CBi8G4bnNpTjDsApWfo+qPPNIniOdUu0Ts+pT4sWio2WYX62CWpyx5h4GPmpl48aN4uk=
X-Received: by 2002:a05:651c:f0a:b0:30b:ed8c:b1e7 with SMTP id
 38308e7fff4ca-32807728eb8mr48465441fa.18.1747780499896; Tue, 20 May 2025
 15:34:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520-hdp-upstream-v2-0-53f6b8b5ffc8@foss.st.com> <20250520-hdp-upstream-v2-2-53f6b8b5ffc8@foss.st.com>
In-Reply-To: <20250520-hdp-upstream-v2-2-53f6b8b5ffc8@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 May 2025 00:34:48 +0200
X-Gm-Features: AX0GCFuW4vdoq3ZxavI5D-k3WcmH7E3A9H2e_P8Zln_7BppO66UxFChz04uYBvs
Message-ID: <CACRpkdZp6D-duzyVRLv5+PURb3Nu69njJx_33D-2aYS4DjmsoQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] pinctrl: stm32: Introduce HDP driver
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Cl=C3=A9ment,

thanks for your patch!

On Tue, May 20, 2025 at 5:04=E2=80=AFPM Cl=C3=A9ment Le Goffic
<clement.legoffic@foss.st.com> wrote:

> This patch introduce the driver for the Hardware Debug Port available on
> STM32MP platforms. The HDP allows the observation of internal SoC
> signals by using multiplexers. Each HDP port can provide up to 16
> internal signals (one of them can be software controlled as a GPO).
>
> Signed-off-by: Cl=C3=A9ment Le Goffic <clement.legoffic@foss.st.com>

(...)
> +static int stm32_hdp_gpio_get_direction(struct gpio_chip *gc, unsigned i=
nt offset)
> +{
> +       return GPIO_LINE_DIRECTION_OUT;
> +}

That's reasonable.

> +static int stm32_hdp_gpio_get(struct gpio_chip *gc, unsigned int offset)
> +{
> +       struct stm32_hdp *hdp =3D gpiochip_get_data(gc);
> +
> +       if (((hdp->mux_conf & HDP_MUX_MASK(offset))) =3D=3D HDP_MUX_GPOVA=
L(offset))
> +               return !!(readl_relaxed(hdp->base + HDP_GPOVAL) & BIT(off=
set));
> +       else
> +               return !!(readl_relaxed(hdp->base + HDP_VAL) & BIT(offset=
));
> +}

...but you still make it possible to read the value of the line
if it's not muxed as GPO?

Should it not stm32_hdp_gpio_get_direction() return
GPIO_LINE_DIRECTION_IN if HDP_MUX_MASK(offset))) !=3D HDP_MUX_GPOVAL(offset=
)?

> +static void stm32_hdp_gpio_set(struct gpio_chip *gc, unsigned int offset=
, int value)
> +{
> +       struct stm32_hdp *hdp =3D gpiochip_get_data(gc);
> +
> +       if (value)
> +               writel_relaxed(BIT(offset), hdp->base + HDP_GPOSET);
> +       else
> +               writel_relaxed(BIT(offset), hdp->base + HDP_GPOCLR);
> +}

Can't you just use GPIO_GENERIC for this?

bgpio_init(gc, dev, ARRAY_SIZE(stm32_hdp_pins), // =3D=3D 8
    hdp->base + HDP_VAL,
    hdp->base + HDP_GPOSET,
    hdp->base + HDP_GPOCLR,
    NULL,
    NULL,
    0);

The default behaviour of GPIO MMIO is to read the output register
for the value if the line is in output mode.

You may wanna override the .get_direction() callback after bgpio_init()
and before registering the chip, either with what you have or what
I described above.

Yours,
Linus Walleij

