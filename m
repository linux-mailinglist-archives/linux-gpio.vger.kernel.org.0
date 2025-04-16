Return-Path: <linux-gpio+bounces-18918-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA75A8B29D
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 09:49:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3922016D7CE
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 07:49:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A2FD22DFBF;
	Wed, 16 Apr 2025 07:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FrJA4UIx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331B2189B9D
	for <linux-gpio@vger.kernel.org>; Wed, 16 Apr 2025 07:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744789772; cv=none; b=niWcsgRfqqcd76MN51zKEATo5pMIa0WPYPIjMJ883EV/lss+h6B8hrbMfUynlO+kAhOE0JxKoDDa+aG979Zoi4XWPIgKAc71HLnT72Tg2ByomT92NDnIbXLUunRpsaoxTiNjJHeE6SYt3k5/+s6by45YiGYSpv3rOq5GVR03BR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744789772; c=relaxed/simple;
	bh=y6V3AOLdTv8dlanS3n9ETQGh16vUI1tGl4CKTRTctpA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JMIfZHj3z1WunzxTavMxLuYCm6wdiaQRUVBE7dl334eEPDBk7oqKb/L3xBAmTSwRl0iIdKhkXJDz9VS1u2OLol5ejSznu89G8CM1ElXVqGDh6O2zXkyahrv9LKHTR20UTsDKAJhFDyqxNczIPuY9Zd9lDj12xpKZgq9yw+d1QUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FrJA4UIx; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30bf3f3539dso4973511fa.1
        for <linux-gpio@vger.kernel.org>; Wed, 16 Apr 2025 00:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744789768; x=1745394568; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Li318XyTiN/uJIOI6yN8FSyh+RWJRrMKNpH3kjEmCJ0=;
        b=FrJA4UIxJShXW+zB22cMC4pK+GXJmBQi31ykbYysCNcLWXL+zWROXIhN7W4leUKYMc
         R5XMd/pqToRTvyLSuQvsEDQCjpkKErTXz0fstIt8Nt9js2+626slK5T1xHfG2AD1e79J
         M3CZ1nSw56EeyDEYwfNfsdlbYQ4U0xjSCzR4xz6fg51BIIWWclzKy2VW/sArWZSah9Pt
         dLYgtlZrtTjoTDzM8w50USy+gQzI7Tv0ilSEMcS2AumvmMoFj50oX0dsg+dAhIPCtTR8
         hvm3VZF6WiszwyWuzGWZKaipdFD1pvyDaISP5KhCAAIl2CrR46QjuvRpxdKbhk+G9S1s
         x/XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744789768; x=1745394568;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Li318XyTiN/uJIOI6yN8FSyh+RWJRrMKNpH3kjEmCJ0=;
        b=vdW9fVHw4reS6HenXR4gFGA+l3FjRQ3PQu+u022qgzrR2XcXdafeUFx+PA+Q6Kovaq
         bCK1/XsSJW+YO3rAetBpAKXRNgtVKvvYDqhAfIFB/baH+YCJ1ICe23dlVA2NITtR862e
         A4JtSxvvmxrskMThsxshEVCqV+34lfeDWlSe2LsylBiJu+oc6q0/qGC4p5kYSgU+P4fb
         lq7GOKMX7V1mTON4fPIpUzWYnMo7TpEGQUxQto6EWQdTbAZ8HKeWYP/X+gpZe7fcL/sV
         zsrfAsPBBoVPCtURlxuG1mDvjsUeWpuJtTriwMj5VwICaW2Tw0iHhFmIEW4sqOaWaA8E
         t0iA==
X-Forwarded-Encrypted: i=1; AJvYcCVfjD6nET31TXwqk0sdZ5BTU0NCgKNnMh3giZVFpOkas8QxzYmjA/abEMyZB9ZGccGASR+7mGOtr9J2@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+WwmA+45d7SFlFDnrURzZjb2CV0meEMt6RRplKNtyx0fFlkwx
	HUYDs36pcsgVHYI7B5IAGTgQsQfiAHyroDHXuuf/HFL0iY5SiE2TpUJH5YJoa7iXVAuXDOt0vYn
	V9Vw4vWoSX7BGxpOngMlWfBZwvQomkmirDcy7ig==
X-Gm-Gg: ASbGnctOXzzDT1loEvTTClcC0mhF3JZnSAWLaAUZnmYquK7q4UzeD4qklXSjAvE1WLd
	RAychgNwlv+Ido+yw0vYYQn1tVYfipUmdYeQlBbXHZIR9FeBs2AwJpOwX/aOx/qmWcL5HNA7kBJ
	ikLCCYk3Njpul2BxKo1EbRTg==
X-Google-Smtp-Source: AGHT+IEPREySuoOfp15YyWzzTmAt01Tqbj/2VqmaXRIkeCym/y8X/7ABrRBdra+DcM3mt8+IdmE3iK2e3PADEhQvaGc=
X-Received: by 2002:a2e:a801:0:b0:30d:e10c:cae0 with SMTP id
 38308e7fff4ca-3107f74da68mr3089381fa.20.1744789768244; Wed, 16 Apr 2025
 00:49:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250414-asoc-tpa6130a2-v1-0-5f4052e656a0@nxp.com> <20250414-asoc-tpa6130a2-v1-3-5f4052e656a0@nxp.com>
In-Reply-To: <20250414-asoc-tpa6130a2-v1-3-5f4052e656a0@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Apr 2025 09:49:16 +0200
X-Gm-Features: ATxdqUF6aMsd-1N8yiBF4iVw_pbJpleioZMe0w-CQnoYIzWZdrI1NmDNikEtseg
Message-ID: <CACRpkdZz8vpQp5utC_oT54LrZB3kOdMO7VTQ5K_tViwB4WXXUg@mail.gmail.com>
Subject: Re: [PATCH 3/3] ASoC: codec: tpa6130a2: Convert to GPIO descriptors
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
	Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 10:35=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.c=
om> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> of_gpio.h is deprecated, update the driver to use GPIO descriptors.
> - Use devm_gpiod_get_optional to get GPIO descriptor with default
>   polarity GPIOD_OUT_LOW, set consumer name.
> - Use gpiod_set_value to configure output value.
>
> Checking the DTS polarity, all users are using GPIOD_ACTIVE_HIGH.
> so all should work as expected with this patch.
>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

