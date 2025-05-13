Return-Path: <linux-gpio+bounces-20049-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B945AB5555
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 14:55:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 531E48647EE
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 12:55:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73BC928E56C;
	Tue, 13 May 2025 12:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YrWUVTU2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6214728DF25
	for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 12:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747140910; cv=none; b=TA8QG/9T+wttx1TCDuhPpKTahzQfPh6oNdxwPDQYo2czSKM36FUiBpR4C8D96ICw3//iDs9exbYd0qB5E7ei3AaQYifNwPqZKJ7uvJ5ORnhqTP9jDH9onrBBiRwi4gBjNDoECVzUJ1ZYRM5laKl5sdRCNd9JE9lh3rKh4r9nN+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747140910; c=relaxed/simple;
	bh=V4YyQVRHSdZGH95X6Dop/K9VSHUKb/zy1JX85cuCZ+0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NYgVBYcdMqC3qvUt61c0KZeCT+dUtqUDp3g4XIM/dmlWgeCuXdBk/h1qFwIyD5q3CKpwtdztKQumj4redtTPm0e/OuhvcmlCVOUf2zOY1ML9rVH46/vZV7oXz22Q9f1QVjMpyPRHe/Gxr4sI8FfUfkedTZihSOUwyO2VgspRu94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YrWUVTU2; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54b10594812so6946259e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 05:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747140906; x=1747745706; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oBzqHhCokto4VQmydUL0xYsmAFrm82zvVpsZ947pF1M=;
        b=YrWUVTU2yFiPvxemnNMDrhJsEoJ4IkdDFTiuATVrjiSIpWNYwzSyry1h1CEOwL6ZXj
         MCvZGSyh2DG2rLvJ4YqMCl1TKHCqGMphV2MPcJmZfjwvspBy2kiMioCCVeuwJQTd0z8h
         PogqDWxdEnYh6yYy0UhwB0OP5/AAOzgwhWcU5j359LGmQouzsmsO/vQ+H6BvC/jYJP/W
         MnwSZd+/BXuVeXJ0P+viojL9ueAZPrgVaXHYX3I6gEMCeys9qr0pqkqWpYSmmyJjbkgJ
         4EoT/wObRPmK62QnVgMtU6z3TY292YivR87jRZkXxLBqfVcYqVM/LeFspLOXYIFREdiX
         svIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747140906; x=1747745706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oBzqHhCokto4VQmydUL0xYsmAFrm82zvVpsZ947pF1M=;
        b=OpyJqUS8rGsMzPXuIBUixooKNUbVbNkfsvgRSJFgiDXfTLiF9WxhKgKDqhGjjBySOl
         lQ5hJhtWLvu+PLDmnVgZGfai6q8RUhOh2+K26slQRbpAcTbR5Fpwd5hYpC5UzvctdVDl
         PSyl+yAFJApYtx/NkW6sxI4/2PcNN2+c62qszSLYZxCSFTuxfiOR6SwtlVAW6709qZyE
         U3vRgJKhdLtdalA5Z5a3l4T6Gg/mq6mWIfDYaX9pyodVw2z59WxsXKSwfT2hCO8Ewb+6
         vGM5uOS5NzZfVqg/8e6z2h7ngIU8p3vrLqqnvDhH9hf0a/smTokgrCn+2KWtqTMHtPWE
         raPg==
X-Forwarded-Encrypted: i=1; AJvYcCU8GVQ/VshNeIrDHRKWYAmV5ReiBClafBk7YARjgVh3KYIUStqe2Lgs3cHqKxifYBxYwGH8AOc6jlix@vger.kernel.org
X-Gm-Message-State: AOJu0YzujCsUIVBYCBR7Y+O9BbVbFmH15OXSP+xjLYfLnhuXWWsSPfh3
	PoyhIdp5Tu9aYVEaid/SPVOMtYEZZMrhY6o56Nis8DwL6KsPyzSsa3XCDfb5bT2U689nmbp0RpZ
	Jyqt9NAeZnJB7tJeJfASTqAzFwvZvpNa+LPI75w==
X-Gm-Gg: ASbGncsjjRFN1tZyHphStzjALVWbxCNVbH2Vd0G5hpYWzGxv381AKI7r4YQSx6oNbYy
	2kMmHML9fVeEVyTxwdAXU32+xKM/GRo47+gqMiHCjqsd1GWuEuQlTIcXq+jXxpJavsrroszozTm
	HG3qnfj3hGvGtCFopAhXS9mMLXcV6xd4sc
X-Google-Smtp-Source: AGHT+IHTFGyGwp9ZkTHbN6H+qRfhqiaJF5qklk2HLXLvdnKeNStMq5u0eI1KtmcABLjQWHC/XfGr6wXO7uX8wsZ2Pj0=
X-Received: by 2002:a05:6512:260f:b0:545:e2e:843a with SMTP id
 2adb3069b0e04-54fc67e46fcmr4489655e87.38.1747140906451; Tue, 13 May 2025
 05:55:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506-csl42x-v3-0-e9496db544c4@nxp.com> <20250506-csl42x-v3-3-e9496db544c4@nxp.com>
In-Reply-To: <20250506-csl42x-v3-3-e9496db544c4@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 14:54:55 +0200
X-Gm-Features: AX0GCFuU44C4FSkF3AR9zYUwaxaJQIxJSQKAhzs5A_rmQVyc3t3w14XIErFsNdk
Message-ID: <CACRpkdbFASLw+Sr6Uofa_F+csmETa8h=YhDWkZOfF1x2fq9dOg@mail.gmail.com>
Subject: Re: [PATCH v3 3/9] ASoC: codec: cs42l56: Convert to GPIO descriptors
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 9:31=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> of_gpio.h is deprecated, update the driver to use GPIO descriptors.
>  - Use devm_gpiod_get_optional to get GPIO descriptor with default
>    polarity GPIOD_OUT_LOW, set consumer name.
>  - Use gpiod_set_value_cansleep to configure output value.
>
> Checking the current driver using legacy GPIO API, the
> nreset value is first output HIGH, then LOW, then HIGH.
>
> Checking the datasheet, nreset is should be held low after power
> on, when nreset is high, it starts to work.
>
> Since the driver has been here for quite long time and no complain on
> the nreset flow, still follow original flow when using GPIOD
> descriptors.
>
> Commit 944004eb56dc ("gpiolib: of: add a quirk for reset line for Cirrus
> CS42L56 codec") added quirks, so the gpio request API will work as before=
.
>
> Per datasheet, the DTS polarity should be GPIOD_ACTIVE_LOW. The binding
> example use value 0(GPIOD_ACTIVE_HIGH) which seems wrong. There is
> no in-tree DTS has the device, so all should be fine.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

