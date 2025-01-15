Return-Path: <linux-gpio+bounces-14843-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E632BA1235D
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2025 13:00:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85B6C3A441E
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2025 12:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40D4B2475EE;
	Wed, 15 Jan 2025 12:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TQPmbsOJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157A72475E3
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jan 2025 12:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736942434; cv=none; b=iYYsRJGGgySAaDXN0QW6rwiXSigDedNs8udy10QfW3+Q+v3l701JZHE+dEiGoQow6En6PhaBAXuxnfyB/Z2Ts52noYKeRsURG5tmPcgGy+i54yDw5zLLPOZ5mqf4VLEWgz0PYUN/Gzg2NCBHiIfRsZnEQvTmrsQsFpXD9sNDvNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736942434; c=relaxed/simple;
	bh=2gVENKObdf0yD4+Qjax0lZMr103GKoN9lZ9RQF8JuYw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e7R11F0L5h+FZUvm1VFsniivjN9F2oNM9El8BaEc/ZiCcWOnf65LKetpvgpnk1hnxXdyPDfxQTGGb1GojHN+wZIq6LyNEVH27gaXCdiU0WZBzgTr/+w8RrOpjglXGOe24IEObz9CAfgLo7y56mmQRK/VTpLVC1VFKeFiY8MmHlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TQPmbsOJ; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30227ccf803so51841271fa.2
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jan 2025 04:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736942430; x=1737547230; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2gVENKObdf0yD4+Qjax0lZMr103GKoN9lZ9RQF8JuYw=;
        b=TQPmbsOJboPM7Nx3yCbOIovKoRI0Mvnz8eQGUUeUEVRijlM3csRaIid5mHQVHhuLmh
         8AgNEmqx3zhCqqYRSIKIK30uJr5SufnX92tbt2U896wlAQb/pmXdMt/xm9uhkDSnGfxH
         tq9FJZLtF/AHF8/0Onf1iH94Z19p7NtGGEhyBBhAH2ijd7O076EC0t6gvSVQrYAo1Hvx
         hm/Q1CsIkCefEaoJAqUmBBdEx7d2Cbkj7s05btej6/ZXtuLabgJhtxx9dy8kLpaJDqVf
         3N+Qh2ihw1CL0shP2M7WHA8a1/sL7IuUjtDscAPkUW0DVZyEdjmVvG4LYOg+zIhi/7Nb
         v+ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736942430; x=1737547230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2gVENKObdf0yD4+Qjax0lZMr103GKoN9lZ9RQF8JuYw=;
        b=h0DCmU0wfQE36bTsJyR+2Cdx3/vqX4HZIyDB3ApJeu9I7r//q9B2CpKGI3ny9ebRyX
         X8IesX0Gq2oIQN4LHl+Z9OCIL6kWqilaAzbCan5g6gU+TD5p+e+Mu8+UL95Td65DzsYA
         gOb7LfnA+dpa8qAX5xGsigbuJQCLd7gWfq5WO3Y2hLOsrwSS9PG8VGYPz3U1mKPv8Lgr
         yooPXY/4rRcSglieelC529+xgf9/yK4bu3lXmAD8T3/4XLe59kwrNHiUXINnrOAIdbvS
         0k9OhGnpvycp8p6XufoBiz13pum1/Exm3CY60zoR9iDvL8C6q1OP+ZfBjvp4lPzPIhwM
         nqWw==
X-Forwarded-Encrypted: i=1; AJvYcCVu7KA5tQEhJp4deVyMFDF0S8xF/UChFYxFNfh/5W3fP1dr7d65hrwBCMQhdjoYU56I9ARu/UB83Mgv@vger.kernel.org
X-Gm-Message-State: AOJu0YxIBnjW1nTuBVn+4ouvRh1VNnDtlg9sCb80XrfCSkW+NkDW1dXb
	SkGl1VNwBB1ZGtw4joIfNILNpdHRkKUftK+0Xc+qaR/7it7ja0fOlRBiuMwHBbblnFLQQJJQjZs
	q6q/R7BLwSbwA6vYfpayTIGhz15rM/z+ERb/cpISkh/kSWVGT+vE=
X-Gm-Gg: ASbGncufMHSI46JvCeKk4BsrdRq5rs+ncKd4JX6ZAmf3PHINUZnXgB4HL0JEq4NfOfn
	zY8c4yfGYzeK6sHKyHFn0ZUdpFmUWycACJky/tw==
X-Google-Smtp-Source: AGHT+IHZ8JRFA9z0BuxNxyKFpxc+uTJeyjFf7mDX60c40bksrJbFP5JGtyqLP/0FmsVVL1BT/l2aWdaK1Gw0mCFy5FM=
X-Received: by 2002:a05:651c:4010:b0:300:8ff:d93f with SMTP id
 38308e7fff4ca-305f4575ec2mr56064611fa.22.1736942429711; Wed, 15 Jan 2025
 04:00:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113-b4-imx-gpio-base-warning-v1-0-0a28731a5cf6@pengutronix.de>
 <20250113-b4-imx-gpio-base-warning-v1-1-0a28731a5cf6@pengutronix.de>
In-Reply-To: <20250113-b4-imx-gpio-base-warning-v1-1-0a28731a5cf6@pengutronix.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 15 Jan 2025 13:00:18 +0100
X-Gm-Features: AbW1kvZbTfRxw2_bbKGeAzy184NtDYFQ65gHsjdE84o_WvgwJ8_KVgNBHdw_LLg
Message-ID: <CACRpkdbgv5BhP_iv1fV7-=w6qF3H+=GiUJz=hQko3rcd6uq4BQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] gpiolib: add opt-out for existing drivers with static
 GPIO base
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Fabio Estevam <festevam@gmail.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Dario Binacchi <dario.binacchi@amarulasolutions.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Catalin Popescu <catalin.popescu@leica-geosystems.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2025 at 11:19=E2=80=AFPM Ahmad Fatoum <a.fatoum@pengutronix=
.de> wrote:

> As these concerns won't go away until the sysfs interface is removed,
> let's add a new struct gpio_chip::legacy_static_base member that can be
> used by existing drivers that have been grandfathered in to suppress
> the warning currently being printed:

I think entire drivers, pertaining to in worst case several generations
of SoCs is not the way to approach this. It could be a SoC or, more
likely, single systems using a SoC, that has a problem with this.

If you want to safeguard this I would use some code loop in the
gpiolib(-sysfs) that looks at of_machine_is_compatible("foo,bar-machine")
to match the top-level compatible for known problematic machines
so we can be fine-grained of this so when that machines retires
the driver can start using dynamic GPIO number allotment.

Yours,
Linus Walleij

