Return-Path: <linux-gpio+bounces-15639-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1C1A2E764
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 10:13:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED6CF1631CC
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 09:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EF911C245C;
	Mon, 10 Feb 2025 09:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fAbRhpl5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DEC743151
	for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2025 09:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739178791; cv=none; b=t6yif0zQXn+1vEAwkrNiGIOoPQF/LB/q8qAe/w/JvuRhRVq7xWzUiOh/ZAcU+RHXrt1HLxoVMa8Fmd9ifsOQ+hty6S1G0ZDTJAophTi15gCOzi/LnlJ1VBs7V7EqJnzmxVQ1Nw3iB5IRuSep/NHGPySv1BhfOkizNqVfrk2WQio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739178791; c=relaxed/simple;
	bh=X0/PXNOgWGzr20OYVC+mAkplv1xOmw1KN7bZLZtDOzE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JjEcPSgiSqCk3zrF0wkuOAiYLY3+Wk/+8FjDPAx9g/uAGbMTJI+a7aPCke71/uyOdbXht9xUqrk3xGa8uR1YLeOtI3jFgIAR0/cCiNs1dCmaNiPWdEb5slzZjw+ZTYQcolEr3bMZ5yylyMdpbQ2waE/rpFwJRmlKOJpmEHI1ECQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fAbRhpl5; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6f972c031efso43065857b3.1
        for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2025 01:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739178788; x=1739783588; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X0/PXNOgWGzr20OYVC+mAkplv1xOmw1KN7bZLZtDOzE=;
        b=fAbRhpl5xH6/mhPqhCH1TJ63F+KmyaPrUaXvninCjnE1PQS2j+4xEtFK3dFY3VQi9y
         94qhnwL/eLKsJYbhIwA1vivoVu9fbRyX53wHRu1yIm14nlWwBviPepVN3XXDLYanYsmq
         bh9zrlrQZ5ngVyNTwdsE2pTty9HVHBDODq2kVs+vu2joxeB9+9l828/kKSpK0HeNhuE/
         DCCtUUOsExu7dfSBfOgIc/Y/EYf9Fuk/V0E6Im0eO59Cp/09BaOB0O+fcHDHC5O5ddQZ
         M9LfvZGEuZm1RePNbAozdGWyw8KdGd7DS0XLB607lO+Yr2u2Cw6q1Es3QjnEPc5lmQTL
         wJoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739178788; x=1739783588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X0/PXNOgWGzr20OYVC+mAkplv1xOmw1KN7bZLZtDOzE=;
        b=rtvJwJH0t8Ekd5HrM2qQfVErXMR+B1QZHoiHIzx6cm9n84zb602CrzH5V6nfE/yCe+
         R4c51h209qtgH3zd5XoBWyid50kvvmIZXLiMrJISTdO0VXUb3xmrQUk4JVbHxz0ioC0H
         qFI9pe9kWTDNE1Sdnt9vmEjxwFfhJBcA9n93t49dLD4GwnskFubN3uouPwFYQFnjEYli
         AZ0uglkO9/El0fr3sGzxneYgn8A79Ia+kQqJFcMkeCQfwQvyU8FsMu/RAyP0DMkDCF4N
         PEAKOS9dxVnOUB2TVOZO5SIxsk2OXCyABtYB0OO1omppNRl+5o5ewsRo+qRI7MY/kbYn
         q8rQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSU0EUZTUZX7lNXevejc8TcsqFODXhyxtCmIxklSfQ5zmxm4FRS/rNINyA3pOa2CUUgx95oXYVbpWO@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/DQkFh/NX7bzT6wZol+TiPyu/Pw+0eJ2Z6vKxiMaHKcTdOEBT
	DLrvnTt/dAUYDw3tJhnKECYXdwKtGRvbryrw9VB+UicZi0Koj0J+ItUBZn4SiLJfZPv5OyRfOlD
	Ad0SkPBY7X5RlgX23a5/pi7aWWNvX43yIWmyLyw==
X-Gm-Gg: ASbGncsIW5MGF5ewBdJ0HHCxBJeSzyYYW0F04Y45QudMTQYzBI1rjuXbdssJ/WC0+1u
	CoMQqpuUaB+ZA6H7gr84ID595NpTvEzP1RfgRbvZgSnSIQ3oUMCKk8zPVF1AgoCUJZjO7D25w
X-Google-Smtp-Source: AGHT+IH4sdhIuLACrBWvBB25/H/W2wr5Xete97rMTNDwftuaz71XXeB0d2e+IethOrADM/o4py/UCwCnCABGKhL3Ors=
X-Received: by 2002:a05:690c:45c2:b0:6f7:52ba:ecc0 with SMTP id
 00721157ae682-6f99a64afffmr138750697b3.11.1739178788584; Mon, 10 Feb 2025
 01:13:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203121843.3183991-1-andriy.shevchenko@linux.intel.com> <20250203121843.3183991-5-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250203121843.3183991-5-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 10 Feb 2025 10:12:52 +0100
X-Gm-Features: AWEUYZnWdpmJ8wm_BCN0nhuakUPiK-G08A79OENgbUCHTeTHJ5SP5B35rKiAX_A
Message-ID: <CACRpkdb7f6YH3PvZiK=GXx=Jbr-xGUdeZnCOEDsozVociS3F-w@mail.gmail.com>
Subject: Re: [PATCH v1 4/7] gpio: 74x164: Make use of the macros from bits.h
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 1:18=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Make use of BIT() and GENMASK() where it makes sense.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

