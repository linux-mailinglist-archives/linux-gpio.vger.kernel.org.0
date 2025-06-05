Return-Path: <linux-gpio+bounces-21042-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7050ACEFC8
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Jun 2025 14:59:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41FFA3AD1CA
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Jun 2025 12:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D234224AE8;
	Thu,  5 Jun 2025 12:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xoHrauFL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9E921D590
	for <linux-gpio@vger.kernel.org>; Thu,  5 Jun 2025 12:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749128389; cv=none; b=Jo1H0QmL4CYLKJM3JYelCZe8qE4pnKAb3fM9tL+U5BzzsWDxRwqOyQHGpq+NjwlnP87LgRA8jbBuNSQUyGzjmoRSwPDY6XsFfoYrDe4hr0rp95X9QkRnyEzoBnsUOzssvOP8a6Vo8dBNtxiIcWTKVkbR6ZX5IAqd5iErC+wOfsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749128389; c=relaxed/simple;
	bh=+1SW841llZ/TeEXc7OtrdGQp8Q6S49QXPRYgXl1e+Uc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qE5k23ggcsZYdmfI2aqasQFI9RRP1vO2qCWCo0SPfSzVKppxhJO5XBIce5pbLX19QJmHNXqb153E3Y7ApbSJhAJIxZQ/unx4m20pGHKfj5fHoAK+Ro0KEvQJO1mHpk2cxde4RNSUF8eI0FWE0oIBNUvADxSXf7vlzS5ehKs2pi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xoHrauFL; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54b09cb06b0so1130004e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 05 Jun 2025 05:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749128385; x=1749733185; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+1SW841llZ/TeEXc7OtrdGQp8Q6S49QXPRYgXl1e+Uc=;
        b=xoHrauFLBS2MyIsJrZf+9KN1Vlyu7/Yo5+H9evtq4tkyDncnLN+moqHZ1UaEaFULhZ
         4fGlt8P6Cr7SbxOItRI+VZjAPlLjQKwHa997plGQFDMAJHlmw5A2kdE5uGaDI3pAOeDy
         nhxLcs8Ry/3n7UsasEui1uQ4XuQnzCiHKXUhXy3u+KKYTYTxkXRQ2gX/q1tkDF4u+6A3
         XyRwLiAha9CGadFprSQE9MDPLdXj8m1at+FXoWOzy9I/iWlDDgzxPkBYgFVbSerpzpoF
         JEe0W0YgP/eVYTzBtagB4RvXr3/ziWEP2O2g1i9QrwF0wggaqHU1q/N242oVAhoFFR81
         XafA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749128385; x=1749733185;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+1SW841llZ/TeEXc7OtrdGQp8Q6S49QXPRYgXl1e+Uc=;
        b=b4oSGQQZQYagexhcEI0hS3lHsvN1Y8TQn5++a+ce3TPesZVIQOh+oeoyzvhlB8jUro
         9OxWLPdK+hui1Xdm3fcR8l6xnpwUOsWAxGYZOpYeU0AMCKsyjr1YfXBEKp8y09ehxRCE
         ePFyxpj83DFTVRarK3ebGaSkH5EP2647OXfgQqrwXC+YdjHO+84p0JfaFqL7zuN43skH
         MSxjPnqh+knCTyVpqs8a5AkKkcM5s4RMLZ2pIIox/L4KZ1YzSwe4UoNx+DTxKL3M8tzI
         Ta3nffUK89a4C5TNE6jkxrhZROFnjjplEP8MNlUnS8Ax9tdyLaBhRxxMr6n4rW1nHTw/
         wdSw==
X-Forwarded-Encrypted: i=1; AJvYcCXekQ9kt1ydC8dvk+QYPqoGuu3angaiz+k5iSbw39QGTdQOrKPzfUxEVyJB0NokNzSrM1+AMszC+9f0@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0xF9zaL6RLqjkw3AFdo+b2z1xTH66h9dIp7LjNSuTHL2X5LUl
	6legYjC4UY6Q4XVayT9zXn4BRNDBYul78l0zavMBv4d9+z1tT7Eb3qZmKLdHyi1eRPy2PYeOl0r
	cm453xC3hVfOBpq6hWquiFglqd5HqOVjz8D/99yUgJw==
X-Gm-Gg: ASbGncvtc6bb47JI/gF+kTsTvKYYgDgkwF+WuvRvDRJfQr9V48fZ4TWP+GHvOYxdMA0
	/pVQxi3zfTQ7M7rE4c8RPyKGTVuSPcSlw2Hoe2vI6LE+FusdL1z0GXxcoCAV+wOh1Jsc1+LYUUe
	cIsXCkja71ItJYtuPIBBnyo00Co0c//v4F96IIiWKH68U=
X-Google-Smtp-Source: AGHT+IFCavHF9adGcVmqAC/SJ2B/xxLRQCctMY8xdnqc9im25wwFXVUPSZMsCxZi+sqtxi8x7B4+E8N2egCUTx7o6NA=
X-Received: by 2002:a05:6512:2399:b0:553:3028:75bd with SMTP id
 2adb3069b0e04-55356df25f4mr1863539e87.49.1749128385410; Thu, 05 Jun 2025
 05:59:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528-hdp-upstream-v4-0-7e9b3ad2036d@foss.st.com> <20250528-hdp-upstream-v4-1-7e9b3ad2036d@foss.st.com>
In-Reply-To: <20250528-hdp-upstream-v4-1-7e9b3ad2036d@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Jun 2025 14:59:34 +0200
X-Gm-Features: AX0GCFu6YXXSfinnPxm6al8Hk87Fy7463uSEHIJGoc535sekNRVPuuiSEP4FOgU
Message-ID: <CACRpkdYfU0xGAWwjJVaDLS_QjT2jjVZouQ4bVU8gqMkfEc05Bg@mail.gmail.com>
Subject: Re: [PATCH v4 1/9] gpio: mmio: add BGPIOF_NO_INPUT flag for GPO gpiochip
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 3:33=E2=80=AFPM Cl=C3=A9ment Le Goffic
<clement.legoffic@foss.st.com> wrote:

> When using bgpio_init with a gpiochip acting as a GPO (output only), the
> gpiochip ops `direction_input` was set to `bgpio_simple_dir_in` by
> default but we have no input ability.
>
> Adding this flag allows to set a valid ops for the `direction_output`
> ops without setting a valid ops for `direction_input` by default.
>
> Signed-off-by: Cl=C3=A9ment Le Goffic <clement.legoffic@foss.st.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

