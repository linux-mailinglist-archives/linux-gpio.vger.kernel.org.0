Return-Path: <linux-gpio+bounces-21335-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 107F0AD4E2E
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 10:22:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F175A18968FD
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 08:22:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 252A0236431;
	Wed, 11 Jun 2025 08:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tPsXw+ag"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250B62D541D
	for <linux-gpio@vger.kernel.org>; Wed, 11 Jun 2025 08:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749630156; cv=none; b=gdhPvas2+oUhcLsOnIGFG3TkHP91e4IzuDpRKJFdc11KkKnBoA3j8xRh4206Rq564MxTAP8hkDpa59ZjERVuGznl3PN5Xd3If5jqFg6dIqyiYsCMFp5gEo5KoubkAaUchoCY2LufplRel/6Cn0as34Vh8trpYcwxjLu9MWlvQnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749630156; c=relaxed/simple;
	bh=ShwVaKjDpG7+4o74DNAGziNbXdTpTI6IUe1R+SDL+qw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n5vNUANq9YuaeqDkzbqRZGzKj0BpYejrMkbYjMobcGpYMMIBd/q9NFD5Nxh+1Ff0tySkBzzyKmCKvMhpd7NIoHECartfBu80Vjo8DB2SZJFvzU5yvzIQafuWlFDAmyokKn8vuo7518reozDXOuQ3AzXSdg2hHMaAQ5AIQpgNE6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tPsXw+ag; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-607873cc6c4so1455266a12.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Jun 2025 01:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749630153; x=1750234953; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ShwVaKjDpG7+4o74DNAGziNbXdTpTI6IUe1R+SDL+qw=;
        b=tPsXw+agmy0fctUql9GBxhdk8Gt+A5g+MXYOm1jZXFFhWwRLi0WbMFblixMaiY7Qkr
         OdVql5Qz2h53S+wwpC91NHXulyAIcbZ0gLtLReUG+iPd2w/co+vJJmtPkOrlxmEcpt2a
         Rvdt1HiWIzSSIkgnjXKzvjuAcEgZ4TPdvjOZpGdN6NtmvHdXPPoBv77tUhA3rMSe2lTx
         NJ+OTGUI2gpi1jbNE+iAkNGUgWpU+iDXoTU1ffW52icfaJRgs8KQPOa0qO1ATYTVuMCM
         C3s6vFQA1mK5Go/byr1tdkxOCugH6k2gGC3H6jIJVb6sxWuEaXa7jyfwPZIQ15kEAqJU
         lwpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749630153; x=1750234953;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ShwVaKjDpG7+4o74DNAGziNbXdTpTI6IUe1R+SDL+qw=;
        b=amXGIGuSvih6SC2E9/drET7OPnlfqqSg+SUHp77Nqv3siKyJSr8ijYBzpCoc9yqnUe
         WPNseHtuAMJJGFqtsJLs2dJzdodVDQ60dXpV2PAfNUy2nC8ocVDTQUw13ZCYWK2MqYd2
         1FsY9Xtf3QmOX9XmfIwk1JyNSD1uBVCbRowl2vnuErXcuYaSFBi89yKGekdzOVmTeJQU
         91TzpS0RUS97BCpK+2KRcbOQdtSacnmQLzUJ1Ezcf26WnzFX0/qlGNaVc5R29uhU1vxz
         KBtZi40TiMWsL1+PxhH0Jnk/V+SzKVj1dA6kqq3bPHb/pa6LMcupIEl9uShzpfB7lIQl
         3r3A==
X-Forwarded-Encrypted: i=1; AJvYcCUR0B5E/JSo5fRJ2uhc1uojy0bsJVDfTaDpdZ1WF9YkKAsQb/2h7YiQsASkHFdhsREYl+D6dkvmLbGQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzlatc9ovJvI16Sw/b2OaI3My8hu2p/SY5RwZUWWtboXbKYFXgq
	nHnE+fPuRcw3UPsZYD/yPLiffjegA4WGwi0Ix+aZA2L7K+fvEMIIwlsKTu37Xf9gY3L2C8uBeCz
	bx0fYftF5m/ObA19dXIU2++nc2ewCkCdNE+AkN1sSPjvPahZ0YnzlCA8=
X-Gm-Gg: ASbGncvdq9as9az6sv3CWotKUF9N1N+TQVIo6bmDCQNHu2vlFtFYUOdz0tvUjffTSbU
	1yy7ESFPwcEDJm3mdL4sL+1LQlAIxEQD6+9BoVcn0uU62l8BoOFcLt6Y32rVgTfPYqJ+u3WjoVD
	KkCjQr5oZq6h2TgrDjRw82gglhH32qeWRDHjqGKdD07uk=
X-Google-Smtp-Source: AGHT+IGXS3heA5qyRtrd+4PAKvbYklR3zvJzrJ3RBT7cs+jAZdxvkJTxT5aBLkTN7bCTRwZRkYwgSDQCPTjbpUlVI9g=
X-Received: by 2002:a05:6512:308b:b0:551:eb51:bf6b with SMTP id
 2adb3069b0e04-5539c5ff0a5mr584462e87.17.1749629834228; Wed, 11 Jun 2025
 01:17:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-gpio-sysfs-chip-export-v1-0-a8c7aa4478b1@linaro.org> <20250610-gpio-sysfs-chip-export-v1-5-a8c7aa4478b1@linaro.org>
In-Reply-To: <20250610-gpio-sysfs-chip-export-v1-5-a8c7aa4478b1@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 11 Jun 2025 10:17:02 +0200
X-Gm-Features: AX0GCFtVhaGSB5A9mmhgCWL9dI6yqwjiUrywoul5APbUdTYmKPZGBXV4WSO__vo
Message-ID: <CACRpkdbXoutC3cUm8u-_NE4Cnp9HUpzSQ4kWjprwUyQyoK6ctA@mail.gmail.com>
Subject: Re: [PATCH RFC/RFT 05/15] gpio: sysfs: remove unneeded headers
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, Kent Gibson <warthog618@gmail.com>, 
	=?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, Marek Vasut <marex@denx.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 4:38=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> No symbols from the linux/idr.h or linux/spinlock.h headers are used in
> this file so remove them. We also don't technically need linux/list.h
> currently but one of the follow-up commits will start using it so let's
> leave it.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

