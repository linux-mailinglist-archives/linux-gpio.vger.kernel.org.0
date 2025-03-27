Return-Path: <linux-gpio+bounces-18045-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF5CA72BC8
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Mar 2025 09:50:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 596513BADA7
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Mar 2025 08:50:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9132620B1E5;
	Thu, 27 Mar 2025 08:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="gCE0beeY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A100F2BAF8
	for <linux-gpio@vger.kernel.org>; Thu, 27 Mar 2025 08:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743065419; cv=none; b=mB/R2EYvV7oFk8lKtzUbaf1uIULGIFHuSCGsPFzUikEmQYHG8L/rFzeHFAI6ZIsRplVxRcen7tYjYWQWOrx8RHGMGtPafhby65gDYCgmxKafRDSBxaktjLm2mhLmi/m9Y7e1GTOeTByGU4rTmtMgkjVF01whs3qJ+wGfsrfiizA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743065419; c=relaxed/simple;
	bh=SSuwDDlCfqr5CMC3oPcQO21KrxISnnKr5CAAJcA5Nlc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d46zHuscC0X+aMaUryN3xt2/5BkiiEO0Ya1IA6B1oBh722vRfDeRUsvB6TACN7R/JPGr5SIPYDRvVbHBu0RHpsup4SdzLBFuir0afn8CDi6oVSoy4JhoDwGvTRfvVhoSxVkmC/uI5dmwX4hl2Em1oG2iYi2fLyhRIyYiLmOk2l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=gCE0beeY; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54addb5a139so859092e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 27 Mar 2025 01:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1743065416; x=1743670216; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MrCm7V9nLgr1fSaq78mJmNgFm9htZIYRYnkNXr3wiks=;
        b=gCE0beeYan7j99jrbxYWYywpfcDagM7QrXFdCPNDVVFDDp0TWz1Fo1yrK1Nx1Q1Y8y
         LHykq7V8JDZgAKLvlA3vs257p2KQZHntFiFoJvXpTfrUxgG7iTn7PJWaqCPvXztS1ZO8
         6RpR0nZuZDASfYTfQI71jdnBKpbPVeqbKg+uqJnZJUXlXeXtknd99KGV7CH05fCoP5nL
         zkrw1zBtn0AqA+qCxDARl8KuSgoV4hWU/3cLDZZxMTRwO4bnK1Y/NKHsseKR9kr5RgN3
         FZCcF6i6KALR0aIYqcn59jPMXwzB7M+bL3xh6d0SENf2p0mQyoJ+wfstzQcqEyCygIdl
         jL3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743065416; x=1743670216;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MrCm7V9nLgr1fSaq78mJmNgFm9htZIYRYnkNXr3wiks=;
        b=hiRBkvXnaE1iaef7sCtsZwf2omZZXd+IGW797q0BHoa+x0ROzQTjsp4tX34ZF+6t6g
         eAjwtk0YuduNUwKews4fjsvx1R9GqkCWfYXJ0aBy5fVprvTuPzj4t6kmkZ9zjms32pxi
         dUj4B9GLrpURVt21vZYPv5t6o47ImA+azIh+39c640qaOTNa9x/v/7VNZHTCEMzzC2Ne
         OrcjbVCK5+iTZSqIOBmFgQN3yP8tqR2WZLD4OzXzFReHPeOVvrOO5jmgMxm4sj/cGI+r
         KKn0dM7DHKJTi41PX/BDj1IZLo4UpeV+CWZvlS1yq/RyP3kmkLf499a6kNY1otEbcUq7
         Aqpw==
X-Forwarded-Encrypted: i=1; AJvYcCUxqGahy9u2jIDneFi2CjsBGJSxVLxWkjDArCb5d+FeykoN2Uv2517OGtGS1Lh7r3toxFssvRIim+mO@vger.kernel.org
X-Gm-Message-State: AOJu0YzWiMwd/b9Az9RTWmxBQBDHr/vVNTuoxgNW55aNHAttIR/Y7kOy
	RJLyxei7xC+Xtx9HwxnKRIEYQ4P0GNUYFVSOq56Wz1klCdryNLYnXOYIFerp/JFISqlPz6MmB8e
	PtfkcuEqxI5w0DTU6Krbkn1KK2B9q+lsOX8wdjA==
X-Gm-Gg: ASbGncsKd0UaQSYe4vKAoIyKEdtppQ9rGK5/FwfZAvFC5WrPcChEuN9dQ3mTavAqVP0
	3oXFXK+bD3HP84JhGJfkA6mf5jG7E9dX+avkaCL14DcZdj6iBDrlZRF6qgCbKRAlRBUS+y/V62z
	dYoNZ4lKRaLjQAbWtv0fVNqMLzun1EUdN8Do+HluzFlbp6Ox2phLNe7KbqwzdF2Mu5nm8p
X-Google-Smtp-Source: AGHT+IGOYfstGW/NDSGsi4ZgI8QCbYNVa5kmxR5Ajx1gX2tlX3LLZSUdnx/a3w3PeoNZ581TU/AX8bmJi9F6jl67QDo=
X-Received: by 2002:a05:6512:3dac:b0:549:8537:79d6 with SMTP id
 2adb3069b0e04-54b01264c8cmr1007068e87.48.1743065415550; Thu, 27 Mar 2025
 01:50:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250324-wcd-gpiod-v2-0-773f67ce3b56@nxp.com> <20250324-wcd-gpiod-v2-1-773f67ce3b56@nxp.com>
In-Reply-To: <20250324-wcd-gpiod-v2-1-773f67ce3b56@nxp.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 27 Mar 2025 09:50:04 +0100
X-Gm-Features: AQ5f1JoV2m1sXwLX_76TUmXQLxYpDeYT63Rh9NbFCRvaHsBsAUNM5VZizldP4y8
Message-ID: <CAMRc=Mf9SXJFGmZXtL5kngU6O12oNMi2ovE_ZGRW4nwnHTZVYg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] ASoC: codec: wcd939x: Convert to GPIO descriptors
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Linus Walleij <linus.walleij@linaro.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Steev Klimaszewski <steev@kali.org>, 
	Johan Hovold <johan@kernel.org>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 24, 2025 at 12:52=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.c=
om> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> of_gpio.h is deprecated, update the driver to use GPIO descriptors.
>  - Use dev_gpiod_get to get GPIO descriptor.
>  - Use gpiod_set_value to configure output value.
>
> With legacy of_gpio API, the driver set gpio value 0 to assert reset,
> and 1 to deassert reset. And the reset-gpios use GPIO_ACTIVE_LOW flag in
> DTS, so set GPIOD_OUT_LOW when get GPIO descriptors, and set value 1 mean=
s
> output low, set value 0 means output high with gpiod API.
>
> The in-tree DTS files have the right polarity set up already so we
> can expect this to "just work".
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

