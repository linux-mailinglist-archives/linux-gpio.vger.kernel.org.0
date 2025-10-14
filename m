Return-Path: <linux-gpio+bounces-27079-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id C6154BD9340
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 14:03:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3321C344B5C
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 12:03:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A2BF310654;
	Tue, 14 Oct 2025 12:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KeRbIqUR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D56530FC3A
	for <linux-gpio@vger.kernel.org>; Tue, 14 Oct 2025 12:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760443429; cv=none; b=h2PNFFmxTj1VQ0WhGEHeEDWw0UGgMG1ckwMrIdlkaZiowJ7VERr2s6VT1XbyHRVu0oZVDrQ8nq5lmfvJEfSLI9nY7dd8EJ5GVKxvIf58eqthRE8R9dzP3JNlfCckxbtzKvUtd7XRJLJwl268VlO9mDkaglS4pomE20xkd3wxO40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760443429; c=relaxed/simple;
	bh=0NzeDm4YRr+qmfFJMboOlJS287Q0PmtLlAQtT9HyscU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ld7lgnZKs0Ymqp8KXBvHpLRg28TCg0qnjcgaQwlfRmBEKImHIpVffl8Eahx/QDUodbHryejj0EIDdJE8YMIsgrVztP0jtiFm8A6eoZCH49K8tfT5EJH3sXtwjFZiB5/4Z4lyIZDfX1fttTpcGlyy64ey7RDCSezJQPvPUdlXoEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KeRbIqUR; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-59093250aabso3971934e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 14 Oct 2025 05:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760443425; x=1761048225; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0NzeDm4YRr+qmfFJMboOlJS287Q0PmtLlAQtT9HyscU=;
        b=KeRbIqURvSmDKHLD9BjfyIl86pAK4C1iZUq/tjbs9bCMuphFQdxqW/bAwAcKUAv6Lm
         t2wwL6yXnVXaxgrF0sLYb737SQ8RdSXjPkeXO5507NRFOtJA4msOXarJBHf2TSkPrEfZ
         pxFqUgNRQ7AKGBqXyiDY7KwpgVVKEutHHW2tS7ahbfy4iBGKMRlFQyzT/5jYpbWmfRXe
         lf/ysQHLr3QRASu7pWgUnhdiN1VaT6ddwnnzRTyJY8hWJDGJTH7ftYZHxcgmQyuu+m1+
         +N+7s27oeoUcsRHx5dygwN8+RN/TogsDtRbxTubRDheKks491Bi1l0+2JQtjj6ZQrTq6
         7KhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760443425; x=1761048225;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0NzeDm4YRr+qmfFJMboOlJS287Q0PmtLlAQtT9HyscU=;
        b=pD9Cnf9yM7OJb/8cOxLWScjtuIjNeFT7j25ArEDw8LNHnPM9CPOkB68+FotAqx5ktv
         PTAD8hfwp5+kD6ZlMwc3wv5HoChBdJI19K2WrwWhnY9mhNT2RTqarmh0OzfKinqo+ykZ
         c4QGNTCyMDgI5MAu1NA0z4t73OUt6EkNIxpgyQ1DgQV/VXUbC5owdE+Xb4bzA7TKOWkz
         RbKQRsq0yrBBXowuiqLe6znFcrGY8VNOS3CSX3jr0w4QjVmTlu5DDrcFvuFweRDxnl7U
         OM0DtEAS+pBs1BwTaAf89RydZQdtBepaGA3m9js50sj8eINQJgpcXq2piMIz4jlrO/gJ
         g5Yw==
X-Forwarded-Encrypted: i=1; AJvYcCVKcVYIOmQHsY/7yPl8hC2WNGzbzWZduJN4iGsvSp9yXmoHCxZtAgbZwzEqz+9GS489pNo27PWIQOje@vger.kernel.org
X-Gm-Message-State: AOJu0YzCbzdUR1yp8FWgDoT1g+lezPMeE0HlnWy6Z5Hn7ciQXy02LqMe
	1ytH8452FjplRkpiD3BEiMkJSN60B84mzEP6r6OA4k+xCZ4thVmIt8WuJXEXCpKbH0MI1tcNqXx
	+Q5ptfHmIg4PUm934c/sK+DRdkJs5PLec0w8J1M43gw==
X-Gm-Gg: ASbGncvSiJmtYY2B4CnuL1WMFInXscSgx+Et7K5jYNAuiLnMfKT0+uoKSiNeZrQUbsA
	bIJ9smgbNg+UCX5uF3v6HNW+M4sVkX7Zmw8Jr3n7EGg8Ub6r+ZIJubOjeIJhftBKMi+WEOIptUE
	mRuyRFXvxNfO8S3BRn3g7TEJVufbk794XndeWTYmd/FT72I0fw7VY9u5uuFOwsUfIodHHZH26rF
	o+KXTo3eWfQOBCmJbfHtghxBqofF/vStIocOPJo
X-Google-Smtp-Source: AGHT+IFD0BB7RH2Ep9aDetjvf52TraFr1nZFUAFZVtaRLq2brbGFG6VPJ0RQdb2vqcIUZBE6o0FGikD6X+TXoiS5UhI=
X-Received: by 2002:a05:6512:3d10:b0:58b:26:11da with SMTP id
 2adb3069b0e04-5906d8ef684mr6189769e87.29.1760443425099; Tue, 14 Oct 2025
 05:03:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251008073046.23231-1-clamor95@gmail.com> <20251008073046.23231-2-clamor95@gmail.com>
In-Reply-To: <20251008073046.23231-2-clamor95@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Oct 2025 14:03:32 +0200
X-Gm-Features: AS18NWCj_bKF0VIZCo40xgE2nZcym7DwrLVXQ08YjlTg5hV9lzx6rx-fa2x4Vss
Message-ID: <CACRpkdb74fh_eFCd0MM4RK1_KtNRugLPp2yMA20FrpHq+-o6YA@mail.gmail.com>
Subject: Re: [PATCH v4 01/24] pinctrl: tegra20: register csus_mux clock
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, 
	Dmitry Osipenko <digetx@gmail.com>, Charan Pedumuru <charan.pedumuru@gmail.com>, 
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, Aaron Kling <webgeek1234@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 8, 2025 at 9:31=E2=80=AFAM Svyatoslav Ryhel <clamor95@gmail.com=
> wrote:

> Add csus_mux for further use as the csus clock parent, similar to how the
> cdev1 and cdev2 muxes are utilized. Additionally, constify the cdev paren=
t
> name lists to resolve checkpatch warnings.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

This patch 1/24 applied to the pinctrl tree!

Yours,
Linus Walleij

