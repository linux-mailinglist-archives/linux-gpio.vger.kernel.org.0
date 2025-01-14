Return-Path: <linux-gpio+bounces-14760-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A51A10349
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2025 10:50:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96FA41888DED
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2025 09:50:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E90C22DC44;
	Tue, 14 Jan 2025 09:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H9ZmFhmL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8484B1D5CFE;
	Tue, 14 Jan 2025 09:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736848192; cv=none; b=m9aUdWHjjAcwvr+AFk1yjNwICu9s9wfRRduENdglZodlzeKSPtRlAZaFpi2YeoOuwpDudT0EUA9mw6ILu91+RSML+gAt/u4I6BUORqmBd8BSbiJ4jwynvDW1EluIREF1skj6/FkaKgjbmoRHSumY8nZg4wQVbe276OCadWBuA6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736848192; c=relaxed/simple;
	bh=3XUEIKXhj11O+kUNhaFonLT84lykcMgjTfyuLIRbQb0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KgdZxBtEm5Mix9k33J3XTfaggU4fTfxs3TXFd+M79IiRKX8RHPb+MHg7lhPDxDt/X7MogtC/wkkcEz7Jrl7NBNP97ZLFWFmOfRUqv5FpXYuOuLU0SjT4vN14+n6O8r9LCBmloiDR6lY4qVET7Ht3HgRzVjLnImBvH8HOKJAoMwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H9ZmFhmL; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aaf900cc7fbso919590266b.3;
        Tue, 14 Jan 2025 01:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736848189; x=1737452989; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iwP1tti+yLWvcbErin2Brt+AMboascV0NwMOTqURVnc=;
        b=H9ZmFhmLmCritM09/PgNTI3MiweDOe9V7wSF1pjrblSevxVbGhq0G+PPa1V3gCh/M7
         bTMOd0a5pwa4LnfL6xlGSYmPgTg/c8v0G6R9zGn9xgSOOgPi7jXGSWXA2SrphlcTXs9S
         s3WlG8RCW4fzAvSALF0KcBJ5sfm+gWh6myeYDWkPTcTICRl9Jy5fNMfAZNip35irMVnO
         qlqvcvilPx58SiF0hKQiOkjMJURbRe2Svd2fyHCka7xfysjWioGWVjyR5JhUCY7MaChU
         Bst0JcCEWOz3esBXkRiykwR2Vn5jtItQEf4/K3V8R3pnJX+NZvablALfqz3HyN6gsqeq
         3nyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736848189; x=1737452989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iwP1tti+yLWvcbErin2Brt+AMboascV0NwMOTqURVnc=;
        b=TLyI+eqzR3yvHJdxVafuXfJ/16UWADGKNYI+yuXicUZTYwv4BZCkWxRBSxcGGt4AjW
         Qq5T2Jh1GVfg4ZBai9NK3zNinUIFSBy2jdYhx1q8acC2vciCtOwtBRI538gwEDPSZGm+
         JEW86A6UU3/MinJ16wrXgjrrjIK6C9QGmO3zHzasQrx1XV0/6OmPKIvdwdsQ0HqV73nY
         SlODljAaykwLlyjH6fevBj/OvkwCj1B+7Yzbvqo+QfRcZ5ZnZP4amayx2NZSAfuqTkzq
         uikWzzp2g9qTaKTkA78bcyP/cB1iScNnsZQ5Ebdqxwaj11b5Udx3mGr5NkwQ73Qk4wlh
         bpwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxJYd9SK10W6EZYqCA9qsvZ2VY2VxdqtsDeXbHHMsoonoNpVT5cTbBGg7kc/gZWuJxlY8fpNuGmrhms3Tf@vger.kernel.org, AJvYcCWSIz0WA472P2fhyFBUVm6LAIEVBATpmtb7sLMwZc4KYNi7EvR15oMwrU9ixcgeDvjaBUYmeM94oB4N@vger.kernel.org
X-Gm-Message-State: AOJu0YyRNWGbJiblrMQ9ewgLaI7Bu8A5FD3ha+B3Dr3LCiOXIcCmVtPv
	ZWEuQP53weXTlFdKnADBbcFXMovWKjpM9yj4m0ueFuzJdGXRbHjrjNmOH+9FfvWvWFEX1o9Y0ca
	rjXFSaIyE2lm8V/Ny9ZkIFPZsmDk=
X-Gm-Gg: ASbGncvoTRZ6Bk3B1k01ugzLfgNs3gDajNd+sopu+2WcnY/A+ulv4YDOAFwprNXgbQL
	0W+PJtZUEalQBVE7ZwmV+G/eugjp8aiydVLUiAg==
X-Google-Smtp-Source: AGHT+IHSE0X0c/RAV6RHPYce2+Lu6HtvF4f8pJXDO50RUlRMfR3JVOivMCp53pLKP3YuDBdiRYv5612VS1G8WhdmTEU=
X-Received: by 2002:a17:907:3e9f:b0:aae:bd4c:22c0 with SMTP id
 a640c23a62f3a-ab2ab70aeccmr2153858366b.19.1736848188749; Tue, 14 Jan 2025
 01:49:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113-b4-imx-gpio-base-warning-v1-0-0a28731a5cf6@pengutronix.de>
 <20250113-b4-imx-gpio-base-warning-v1-1-0a28731a5cf6@pengutronix.de>
In-Reply-To: <20250113-b4-imx-gpio-base-warning-v1-1-0a28731a5cf6@pengutronix.de>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 14 Jan 2025 11:49:12 +0200
X-Gm-Features: AbW1kvaXInedzCQDKle5HtOug-2PYAvJssuAdg06rMQek_Ee7DEA41pCoh3PZGI
Message-ID: <CAHp75VcnB37ET8mW=m5sXwP4qDQDUPKL0yRy8n49m++zShqPMA@mail.gmail.com>
Subject: Re: [PATCH 1/4] gpiolib: add opt-out for existing drivers with static
 GPIO base
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Dario Binacchi <dario.binacchi@amarulasolutions.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Catalin Popescu <catalin.popescu@leica-geosystems.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2025 at 12:20=E2=80=AFAM Ahmad Fatoum <a.fatoum@pengutronix=
.de> wrote:
>
> Some drivers have had deterministic GPIO numbering for most of
> their existence, e.g. the i.MX GPIO since commit 7e6086d9e54a
> ("gpio/mxc: specify gpio base for device tree probe"), more than
> 12 years ago.
>
> Reverting this to dynamically numbered will break existing setups in
> the worst manner possible: The build will succeed, the kernel will not
> print warnings, but users will find their devices essentially toggling
> GPIOs at random with the potential of permanent damage.
>
> As these concerns won't go away until the sysfs interface is removed,
> let's add a new struct gpio_chip::legacy_static_base member that can be
> used by existing drivers that have been grandfathered in to suppress
> the warning currently being printed:
>
>   gpio gpiochip0: Static allocation of GPIO base is deprecated,
>   use dynamic allocation.

Warning is harmless and still a good reminder for the stuff that needs
more love.
NAK.

--=20
With Best Regards,
Andy Shevchenko

