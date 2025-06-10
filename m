Return-Path: <linux-gpio+bounces-21290-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C501AD4496
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 23:16:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3788189CC68
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 21:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2424283125;
	Tue, 10 Jun 2025 21:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KcuNSzi6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A100824676C
	for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 21:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749590198; cv=none; b=ZoXXXHgsvYeQfOci3cwDkHUszjjtWLnUICYt3ZANJIhhtVEPJSuNmVejzBduwwx59Zxk91czNHCx7oUlAqpIIlNth2MgTiBuSnLoo3+eHPE5F0GIE5FwgHg+4PrX33n4+GQDhGyAJ3Oy9ASiMTGgXOQaQ+/bfn5e7I/LhFbxsXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749590198; c=relaxed/simple;
	bh=WEjoFKJq1fwhLjJL/1LIboVF8pYHP56Xq9jI3aQ+dvM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DImRkbgMhn+CbTyjpsbbFFwjcP4HMz3ML0FkAiPu/x/fpO86ExV7GWnRCo4OGA1URxbQw1AF9H8ZifdFjr9XuahlQ7lTvqbGilYIEiZXWR2Z04PWnpPv/C3hhFPTQQZqzUdR8Uzt3YBokv8NdJE2UuTEhPz1eqhNGh6HfuAKo0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KcuNSzi6; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-32a9e5b6395so55531861fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 14:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749590195; x=1750194995; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WEjoFKJq1fwhLjJL/1LIboVF8pYHP56Xq9jI3aQ+dvM=;
        b=KcuNSzi69ZpOD8lZJ2yIzQp234bfXMoUtF3ot9GhBj4YEsJPC3CB496eGqhb5qOAPk
         +5mq3WO5eQCzubFwtTPTO3JBxEhQ/z7oe+idkT3KkLUPrB+5PuufICXMVl2qugjLTADD
         hvReDhMGy6Cw+6P+JuETfN5+RHUFpbCUVMSTPAc7avuGu8b8A4VQ8Wry9Lhre2oE1yf2
         qJKeoyryLFA40MHZ9epKWId8zSPQsUGwpUC2ZV0cuegLRnpu3GhW176Wp7yMS1Kc/tm0
         jvLtEZ4IfSOD8lGUsKZeFqDzs3mp8I+t7dZy9GoHxShmg7U1iCsiTneVNZndN0vSxVOd
         0pXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749590195; x=1750194995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WEjoFKJq1fwhLjJL/1LIboVF8pYHP56Xq9jI3aQ+dvM=;
        b=QxCBzlnxWFjqKhZDKGXRtnv/tDBQSlLsVTqGobB39se2sr3j6S/So8beKtvPEHgGt3
         DsUQMht9w2a9z1BuUI07byZ5sIfOqP3MaV8vFGHDudCwGlb6smWCjGW109n+JTutDIQC
         b8NgbY9BRg9P30DCVpO5OkuKToVnACUdyiM0Ha9VdettheBtCu9qbVluR1OKhm7fL7lo
         CkyZnDasqwIYSTVVyGa9llEDSv2xaY1gjmAIbsKVbk/199uJO3zf8Q92gsIHCnHT5BRo
         WzjMrkSGhooKpN1fOXlIAJAS7LOJHO0Nv0dDMuKJ0INiw+EX4/Vdk7hyToUCCyf2zAyy
         CchA==
X-Forwarded-Encrypted: i=1; AJvYcCUqyxOWpT5gtWlq5+NwFgts60i45Vvuq++ILIyRpJpiAA36aKnQJoFrz3jK8CWmgogWSzop6ep2bwkE@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+JqLsHJI5sjI9p/F0RXV8+I5DNhwVEZHYNm7XOFGId+WmcGXF
	5Ndfgn317VkzkBT9Gmx81DWcLPrEpiPpdM1fCUXu4KUQ1thnuszKfdKHQ/xVuh1nW+ERjr6LaUH
	q9X8oDqO4bRIJFsFLPsx2YuS0XMza4thg4HzuMR5h1w==
X-Gm-Gg: ASbGncuFru3fbWa232aKTVStkdTIcuKYcoVITpHMVIGCOxc5lFHHNkCl3QtVW4AjQK9
	4ajTvNmFbK6+rhgx9phNjwap7ZcwzgbGrNRpkMN/5UltlONi9e89d2IGzXwxKbYi2syd1iodSFt
	y33ULssVMH2Umf3gmbFmPwgwuwvgYN5/rACO+fx9epszM=
X-Google-Smtp-Source: AGHT+IFjB38ga64es1q/x9Xln0eJ4c1gLnvGRBRN0i0PTR13a813fBLuiycDGURGtRbChXkECB+ZBVHqj34ThqQMqbk=
X-Received: by 2002:a05:651c:1a0a:b0:32a:6aa0:217c with SMTP id
 38308e7fff4ca-32b21e99d3bmr1744231fa.34.1749590194721; Tue, 10 Jun 2025
 14:16:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org> <20250610-gpiochip-set-rv-gpio-v1-1-3a9a3c1472ff@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-gpio-v1-1-3a9a3c1472ff@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 10 Jun 2025 23:16:23 +0200
X-Gm-Features: AX0GCFuXsSEbKJPPrZYl0t_vGXohg5ZS4zY2cQAKwzq1fVBy4N3FSGLwpMM1OkY
Message-ID: <CACRpkdYrnmi2a8iL0tA7zNDfhMRN3F-NEfTntxXgC54t-LZA4w@mail.gmail.com>
Subject: Re: [PATCH 01/12] gpio: mmio: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-omap@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 2:33=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

