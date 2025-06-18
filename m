Return-Path: <linux-gpio+bounces-21755-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDD5ADEB51
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 14:07:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 435D47AA90C
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 12:04:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7F3F2BE7C8;
	Wed, 18 Jun 2025 12:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dFYZfJnz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F2D2857EF
	for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 12:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750248368; cv=none; b=IsYQtb7B0EQZvLiaJS6vceLnY2k1HV2jMp8Dfu9etvoe3uznf8bygZI+neaRsGrrYB5PBAR8BerMCKwmkSmt3mtnUMWKPauQCwROx0pVL7UBlWXLuZJlhzDleacjFLIbuOFv/edXK9/Kylw+iZJwlmn6PKOSMLwg57x3xw7SrUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750248368; c=relaxed/simple;
	bh=waDBNAdNXxdqcgqHzDMNkvJU4Fw+VGcJ8hQzEddJRYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OAzA5XG03MY2hj3s+Ku23+GB2ue2b+TQ+jTr4t9fao1aB53TWG733J+z79kL1QYYxbAk0ZPN66AE6l8msxTOCfphOTpC0LA/kGLigwa3KBL9aI6d+vZlEWk94RV5VqtwHqllaIiA1Ceszpm3E6ARr9TNNQvkWab1y3gGxn1yDCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dFYZfJnz; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-32addf54a00so56009751fa.1
        for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 05:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750248365; x=1750853165; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=waDBNAdNXxdqcgqHzDMNkvJU4Fw+VGcJ8hQzEddJRYM=;
        b=dFYZfJnzz8WZOjQ/jVt0NBm7oCvXgNJpqC6Eca3/ascBl+JThXhTFViuYhiznoXNLE
         Xa8TqHpgO7noOG9A3zQOm+SRM+g3JkOKOkUQ56D2VRt0jYksEpwV/xK53bkqbRitt3Th
         3i0H+cVTIDz0xL6lhK4WyISjLVxCUAnySDaga/Xt+pdcYQixylz0XLReerhnWkLg7pRZ
         V4VY83xJcf92V517g2PZvHdRP+pcvjNWXWOm6aIDGnMXRsOYRdpy0JEbKTkEBdplGBu5
         t+5kVbsSFGQCA/TPHnGaUYoX1HWMyPQ9sWmkFkx1rOrJur7S4TrdCJ/3xRsbOms6qgCz
         Ph5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750248365; x=1750853165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=waDBNAdNXxdqcgqHzDMNkvJU4Fw+VGcJ8hQzEddJRYM=;
        b=fjkyA5yEo98MLY03KJoAAVjRTLXCVGFH6pnuDX9gvXS/xlk/kK3udEFp46ubPrEYJi
         suBpiqzj42p5VGScZe4Y2Z3C87ZcvhRjKIKzSyENVKw/1sX21RUoasQe5GpnPzFph22J
         1F/SCYzlA1tgOWnav/SDf6gAZ9ZwIleKjXFr/cMWrpx/NXqX2iLDtMWAHX0BkhPw9bdc
         dXUeS70Ay+QJNIuUAT5wt1B7qTVqQXggjzmsmHcminmzqmuIbs7cnuMHhFqyqvYz2TTa
         WhIeHCKAaiF9mDDUNd4xMnfZw0Twz/Lo27PvkWlcxil4GueA063TUcrxdbRkNFwQgMhz
         WvqA==
X-Forwarded-Encrypted: i=1; AJvYcCUPxQ54+/T4uOPuViBOr8T7tfC4QmooLEXTmDblIAS180+GXMOq3+ZYGhOLlgL91difhLifnhIixMVm@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ5zPpGDe1VyFXS9VfDtv32iF5LwRq2+x9AtxAsP3HWfZJ0X2K
	29ZQLhpBpYCwne0iclwFmsMLYUkgdPzw3uiFMmtkxYcX7+2hogMlmnXrjtMtVwgSXIvJpar0z1k
	riDPVQgusEI1NtLkmjJ+yVsmMDO3FcP0NU+lot8Q56g==
X-Gm-Gg: ASbGnctfYxpm1QV6Rpv6Zo8Vfau9TbpcbihxiBXjgZ1hh3wOHJNXCpD+W8nPCr9TF9p
	9cO7UkgI6QEImJcTo9UryuLbQ2XA/n9uiBTqWmF2pj7O8iK6oOwuO8iCzJoe2OFB9xsMcbwhWyr
	JU0VDfuS8a+jlmhLpxgFti7pDBd1B27zts5n4BGGtAGSDOCjL5+KTZlg==
X-Google-Smtp-Source: AGHT+IHX45QNOrSIJj3G2Buvowk5UVZrkDeOZZtLRBUP3Ikuxx6tV96sZ9aCvKwmf2GYXljpSaZA+m97MagLrCE4y7U=
X-Received: by 2002:a05:651c:544:b0:32a:81a2:ebb with SMTP id
 38308e7fff4ca-32b4a2d8910mr59681261fa.1.1750248363616; Wed, 18 Jun 2025
 05:06:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250612-gpiochip-set-rv-pinctrl-cirrus-v1-0-2d45c1f92557@linaro.org>
In-Reply-To: <20250612-gpiochip-set-rv-pinctrl-cirrus-v1-0-2d45c1f92557@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 14:05:51 +0200
X-Gm-Features: AX0GCFuR6ywo5MMooqLH6lBxOOHtdfd0tMD2FLmLdxJO_FPZD6GVp0IlKcei7Uc
Message-ID: <CACRpkdakPywi9=wwMNREZWbT5=VrJP=vzZVuyE0S+FCDX0-mEg@mail.gmail.com>
Subject: Re: [PATCH 0/2] pinctrl: cirrus: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, 
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 2:19=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> values") added new line setter callbacks to struct gpio_chip. They allow
> to indicate failures to callers. We're in the process of converting all
> GPIO controllers to using them before removing the old ones. This series
> converts all GPIO chips in cirrus pin control drivers.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Patches applied!

Yours,
Linus Walleij

