Return-Path: <linux-gpio+bounces-3922-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E507186C50D
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 10:27:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2275B1C212FD
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 09:27:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52B1B5D74E;
	Thu, 29 Feb 2024 09:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nXYyUMPa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FE25B686
	for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 09:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709198810; cv=none; b=gW7sc6lVZ2GXa42doi8XR6TWuUiwvN1Eqihar5uSPUYpTMN+Kh3EJUFn16/wXticiMOv9YBf4gr5UqbabJVp0nDGmdf/cQ3wH4vur3LqqrmcJ+JtDIvGzWmLMNV9C3UQTH3ubuXlw2GnzM8pIqiA3MXxU01ZbMSKV4GW4cNtMUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709198810; c=relaxed/simple;
	bh=mMVB3NbVb2aor6sIOhTKCLgvCgLNr1BwNA02SqIQ2f8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=khAhC982GoxuyABHTXbO6ouhAMLZ1fHqG3g3mLwkCeJgIPqwC5K9k+azxQ1UVeO7x0eTXIWHyUJA3oIZRX+vNEhP8AGHPId2ROcnFCX3+8BjQXWlWXDBil4RrhL6PvmTYC+nOOjlSps9rP0cr0So5otPyTz7qslw8zH+DNEZlkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nXYyUMPa; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-607dec82853so6983187b3.3
        for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 01:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709198807; x=1709803607; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BynpSFPstF+JPRCovNMfjh5xTc1CIZoNd8nL81uMYyY=;
        b=nXYyUMPahqcmdnXVePAsGhpdzsdYM+6chflJELk3irKfodzos+tvQY7x+djuFSE+qa
         q9eCtmjtli5ZMAzkJPBquAf7XtUXQjNNLcXkOFFPFNV2GrJZ51jyMwayt/eV3U0cTK4f
         nulm2kwtUG942P2Bf2qTRor42vlTXQf/yQ06JtGUedIbzkbkKErXooS0u5szO+SmCnA1
         6pWQXEt/9tefpxDP9SMSjSv77Wc7c3Aw8Z6AIs4fZn0/U/RYzkdc1wxknxXJKsSfKsL0
         a6SHO0wK65k5YyYiW8QcK80ZKLJ3U9PijlrXKgHot6cfJZvFTHRUYqpqm1j0t+0hByJ+
         fybQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709198807; x=1709803607;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BynpSFPstF+JPRCovNMfjh5xTc1CIZoNd8nL81uMYyY=;
        b=j1p6LhyovFGX63La8KZ8afvpdTe5mLnCm/2jifrFp2j2VIy5aYEc2xVimH+OYs9jO8
         Bxp6MHOWHqNLUlbw8J+bg3jeL8hBk+tOaSeJJ6ZPv2Uvq4eCTGp1p6XwFORAyAz5L2Fj
         2MHrEHd/HWum6KoOZEiASLkrHs/2Mt51Iz9eRYhQP6yeKAwfkicXzGXc4QkZ72VUImmt
         Mj8uhEE5Hmx9jB7lxP+MWFQNamfm1By/h9cNqYxFE5E0e0chcVmKwSKcsYX9QM7EPuAj
         RpAjj++htoehD6vyFHA0BMPPM978c/lZednkW4fcKLrZEjpowk3ut5FmOxeLXfsifX06
         Jm8g==
X-Forwarded-Encrypted: i=1; AJvYcCVrrMsz0f7bgXdACUClh0cxin22iJ2rtoY1rWgYEU3bIbJ7vQmdYFuPVEpn0e15F22sZrwuQyEtiMsByuKmBDxr/1zPsePlC5jAig==
X-Gm-Message-State: AOJu0YzZP7XcGb2NOXD1YDj7Wm9jvADsoVZcGPCcjghphEbBhmhkSN5j
	dPVTngKKdIjGpZLTfBugAMZZ8/tOyPSn5XzGF/wTUJNGYdrbkJKUw7o7wSXRy41uT+R0yMg5w/P
	tioz4aWsrazKsmzY5cujSAtO+TdbOoU2UV84czw==
X-Google-Smtp-Source: AGHT+IETBT7Vkf+KWC2B0cVuE2nVenXl/BHkUQlIpZscJkS6D21qmSwap0I27pP9tdeA/bkvEGDjtm1MbAwYZE0AjDw=
X-Received: by 2002:a25:acdf:0:b0:dc7:4c92:16a3 with SMTP id
 x31-20020a25acdf000000b00dc74c9216a3mr1423519ybd.27.1709198807667; Thu, 29
 Feb 2024 01:26:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228-mbly-gpio-v2-0-3ba757474006@bootlin.com> <20240228-mbly-gpio-v2-10-3ba757474006@bootlin.com>
In-Reply-To: <20240228-mbly-gpio-v2-10-3ba757474006@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Feb 2024 10:26:36 +0100
Message-ID: <CACRpkdZj2+b4G3V+YeMAEXy=Xkjs=c4FmJ9NBPi_2Mok00_76w@mail.gmail.com>
Subject: Re: [PATCH v2 10/30] pinctrl: nomadik: minimise indentation in probe
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 28, 2024 at 12:28=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@boot=
lin.com> wrote:

> nmk_pinctrl_probe() iterates over each GPIO block. Use an early
> conditional continue to skip to the next iteration rather than indent
> all the loop code block.
>
> Do not change code logic. The block is changed from:
>
>         for (i =3D 0; i < NMK_MAX_BANKS; i++) {
>                 x =3D of_parse_phandle(...);
>                 if (x) {
>                         ... do work ...
>                 }
>         }
>
> To:
>
>         for (i =3D 0; i < NMK_MAX_BANKS; i++) {
>                 x =3D of_parse_phandle(...);
>                 if (!x)
>                         continue;
>
>                 ... do work ...
>         }
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Patch applied!

Yours,
Linus Walleij

