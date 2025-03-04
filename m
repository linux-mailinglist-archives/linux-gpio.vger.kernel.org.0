Return-Path: <linux-gpio+bounces-16991-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A5942A4D563
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 08:53:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD1741883382
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 07:53:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D06F41F4720;
	Tue,  4 Mar 2025 07:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bzzdgt4J"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA8A1F5617
	for <linux-gpio@vger.kernel.org>; Tue,  4 Mar 2025 07:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741074798; cv=none; b=NE6ptLkMu+VfbBaVcWFpn/Ksb5hmY8LLqsM+Rlo0z7EkbMlEONxLy6jV0ycguxEht4dBtZK4J4j82bwAeHoeqvEGUJQLQ+4fa8I6VrnxP9E20mx0vmSj27cgiFkjonUPPnCX5JlCz8F62hsBNzuOAIWJ4OEL11BlNJv2Zduk8CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741074798; c=relaxed/simple;
	bh=BVJSFhPr+MWcVdsQvQ4e5j7EsE3f4zAOy5yVDG+t3BI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oOL47RDZH/vktZ29Ym91OOfPWt4Pr5a+qogdLYqhwoPPPPdj1Tt0xG1u3aBiDOy5At/wdsniURnhdoFbOYgn2DTQF+YNbx+SCtHrX6o+lxCLWAWA1oFM2eLaC3G7NBKnyB9QCrhnK2ac1VrBdtMxRjgh5ngmmiYCdNzhw/CT2bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bzzdgt4J; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-549490e290dso4032670e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 03 Mar 2025 23:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741074795; x=1741679595; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BVJSFhPr+MWcVdsQvQ4e5j7EsE3f4zAOy5yVDG+t3BI=;
        b=bzzdgt4Jddv57DDM9/XJp5vg22xYr//tW5r6EorBC6CtS+UtHLMdTUSoKB61L3hS3C
         CrLFeeijxXBXKpXJPxBX9AFgLIWAAa5UYRixM3QV9ZC6oNLwVZr3Df6kpZfwXBubOdY4
         yhBlTyYcFzjkJzmOdcUeBc75jeCSRdAVQbWAdbm5JxabjWcvOlxN1Rj3hhf9e96fX6T0
         bW/DH/o4yRmvijclPwFvVlKJ+N9Q2yjgSTcTBD6sqQ035qQiKmivyOaVdj0W7rjFv5EP
         YybQXmu8fPrZC1Gohb/tGjwAlXzmYWMv5UZn4Cy+/zQdkoF1VOJUXR0q7OsNuQwXPCuC
         ZAZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741074795; x=1741679595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BVJSFhPr+MWcVdsQvQ4e5j7EsE3f4zAOy5yVDG+t3BI=;
        b=k4KV/JXuUXnO5zXrDyTmwrn8FGRpwtIbz79JIh/pfSVLZ5tmmmnrzb/FSMb5pmzjOc
         Rg/wKH5UStHyQ6yI2aNUew1QB2RuCsgAJjsfNElNp+J2ESZPbhBM9ScxRwM+6In7x95X
         o4OnQJScAxIdrhCy79YzuRkzQvf860LsSuTrB0aJcYyD0V78cMso3jvqsL37Cli+7SWb
         ThpIDE32YSIyMsxHSn57AQ7m3ZR6bRgjztx+0Fc/U5Ak/FEP031GhY+sKTB5aw9oxP7V
         hXei/IHns0BMT5hxAvCjbwYBd0BcTs5WXc8LxCIR3r/u4KUH8Ia/FjMwDW5PJUl5609h
         n4tw==
X-Forwarded-Encrypted: i=1; AJvYcCVRLA/5dssVIOA976IBsFXuuikw+JAppbEpDFCEroIhAxGE4+3P//Vd3BWdj/6CSWKMFLQ8XfYMoOCW@vger.kernel.org
X-Gm-Message-State: AOJu0YwXCxGQemFmn837VBN3MxY4/HSoisg3IN9nGDzAgpg9YUEpfRZs
	9wlfhLnGbGp5/NtePnmNycK57eKi9CyYeKs/VRr8/+fYmqc6tnoa5METhcCcbtcOG53lc1Ea1rQ
	wU9LNxh5a6BRDNMSRLAY9nE6GTR0eQvhN76kOaQ==
X-Gm-Gg: ASbGncsovIV34tPB/fJvTdJAvbvaG3fGQP+YMQtFQYuozYZr5tFTxyBayNKQ5japVO4
	a9imQi9wQTciBmRO6alVytPoVoBBhqgiz+PD2wVYo8eKKrlNFjfSv4gpF2kPWgnQH8VMNlnoucM
	Z1x267EKmPrbZw2uzKTSEF3er4fA==
X-Google-Smtp-Source: AGHT+IGo7kPW6t6mFBR3/sTMivZuqhRH0SeEyZ9ok1vnRKx+3P9ggktEPjyopRkd13VsV+wua67se3lgNpjzpez8VHk=
X-Received: by 2002:a05:6512:1044:b0:545:2efc:745d with SMTP id
 2adb3069b0e04-5494c3546d1mr5523229e87.46.1741074794798; Mon, 03 Mar 2025
 23:53:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250219102750.38519-1-brgl@bgdev.pl>
In-Reply-To: <20250219102750.38519-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 4 Mar 2025 08:53:03 +0100
X-Gm-Features: AQ5f1JoUOBReXAYnYf9thqIoVITthD3dUEJajNI_puN1-yLNkKw6af5pX77JOew
Message-ID: <CACRpkdYeBM6V+61-cbX1g_wLAVHvQQrtPb=5qjTdUw--+J+E4g@mail.gmail.com>
Subject: Re: [RFC/RFT PATCH] pinctrl: bcm2835: don't -EINVAL on alternate
 funcs from get_direction()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Stefan Wahren <wahrenst@gmx.net>, 
	Liao Chen <liaochen4@huawei.com>, Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, linux-gpio@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 19, 2025 at 11:27=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Since commit 9d846b1aebbe ("gpiolib: check the return value of
> gpio_chip::get_direction()") we check the return value of the
> get_direction() callback as per its API contract. This driver returns
> -EINVAL if the pin in question is set to one of the alternative
> (non-GPIO) functions. This isn't really an error that should be
> communicated to GPIOLIB so default to returning the "safe" value of
> INPUT in this case. The GPIO subsystem does not have the notion of
> "unknown" direction.
>
> Fixes: 9d846b1aebbe ("gpiolib: check the return value of gpio_chip::get_d=
irection()")
> Reported-by: Mark Brown <broonie@kernel.org>
> Closes: https://lore.kernel.org/all/Z7VFB1nST6lbmBIo@finisterre.sirena.or=
g.uk/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Patch applied!

Yours,
Linus Walleij

