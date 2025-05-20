Return-Path: <linux-gpio+bounces-20371-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FA3ABE6A4
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 00:00:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E7B11BC16D6
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 22:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDECE25EF98;
	Tue, 20 May 2025 22:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I1KHkbAc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19DD25D1F7
	for <linux-gpio@vger.kernel.org>; Tue, 20 May 2025 21:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747778401; cv=none; b=Wxw783E+9TIUWMO0hpoyISobXlDmR8Q2or/vFzl0Msk14Pr+9MTt9Rsm/wWyMm/oOG9FmYf6KNNT53uDEQ0jhp2jc2tOOe6kvlapZvxhsL2epUDTTUO337PKYRHgbzi1NL9HBDqZfjl8DbxDTyECykPmHSxeNJXctQDqE7heTjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747778401; c=relaxed/simple;
	bh=IMUFY3ybOGSiBYIbjVEo1Ai4jJbkOoWr7EpGf493cfA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C1ybHkbmldn3TUZBuNwttLKcVQ4/vMyl/fppCigB5QHLXbUBhEX5n9giw/BnR03NN4a1lwaoVQcOe9gCd7lvKPQv36YTXQQR1g3EpOmb0+cI6RTIHqW/YQb5Be8YP9gFB3lsm83iUr25h1a3xN33t3CITaAdC9WoZL6EA6a9KFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I1KHkbAc; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-327fcd87a3cso51225691fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 20 May 2025 14:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747778398; x=1748383198; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IMUFY3ybOGSiBYIbjVEo1Ai4jJbkOoWr7EpGf493cfA=;
        b=I1KHkbAc3f3aFJt5ziNKRLWi1MsJrUs0pt+ke8QCYH1yEIh++6h6axEceD2ehA0eDl
         rj89vEJP/wRGYdQSDEIAtDI3oqQvCn2dVc41zeYBe6oy957q4b7Axjf0yEhVjCzvyTib
         kgtpjCcu66P6au38yRYUghccq/DZ3CUEJvTN71DtSs63t1O8vQt9TeY9eAZi7cZ1gyPI
         GiVag25bZ06nGlNhGbsRwEa/A6QK6u/cZbby4ghMfTQKDCvP9ZoPQFKQH75jC+5BUygi
         iOfToQBlvxJtkALMPWR54BTmyD25ZRLASdSEMxzkUBBEWr7FQK4ABcjg2rWnGZpUu4tk
         jERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747778398; x=1748383198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IMUFY3ybOGSiBYIbjVEo1Ai4jJbkOoWr7EpGf493cfA=;
        b=SizqKhalNUzTdkdTwyoUi3T7kOs3mAXYibqSkE3hkK9P1KByeBzmGQa4iSLdmMT/jJ
         P32UiE8moL3L1bZSh3Hgw0dUdZLvOtpk+kGHh2h3zAwkueeCr71RRiC+KzsoQIAd352O
         29HTVao9sxnA8mcOIPmel3a5g/lBmIHwfKUC96FxC5l3ugtVR8YzEfKiMZ9IP7vyiJ73
         B0MiX27mkUk3MY1S2+OgwHd/y1wEW5M/7jNrsPN/UddKzzu/oPYmLOT7h7SkBwtseFkC
         XiYDY15S7AJmhsbyRpJ0RgxjZEADBbyuS7jRUftkdW7oalzfQlX5tUfUKPPqnUg0Vbip
         qMMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVDscLiIJlFSAX82i0nsxT0Jy1/2jBQPgw624RHF/ue58Cb9ZhGxv92jnHq6ujuprrX1NL+UZ358RB@vger.kernel.org
X-Gm-Message-State: AOJu0Yxtlt15Jl3cu8vLaQhDD7DgDmBSTST9MMn3lhV7ZcGG6YgweDXo
	Q66+1S/vpCGqegB08TpDTeO652wHCt+xezgyXzUS1tdft4M5ohgCffcnQa7PY8bU/pDPI9YGyTv
	K8gxSL04mjdsJgbTibfjnpjHL/0SwELGI3xIwW7pgZw==
X-Gm-Gg: ASbGncsGStEMDimIaZl7mJhI+9opPZ0mUGvITWa4566XX8L/BypMy2p7UmEKZY2FppR
	RXgKM0ON8Y2vRqwvoakhWUrjPp/zCUOIkt7Vx5sSpOWk1AO66pdeZMEkoqFGjctENHIlNv+Ev9S
	H9YDN5V28YVbP5ihTBmzryZ7OjjMuJHBRF
X-Google-Smtp-Source: AGHT+IFS3zMbLY+Uv4yK7T04IXAVa5UUBNsybViiV3N9L+FcNjqxEiE/5JDaeSLuLTbJWGsJq2bHdp8/1bSHtjoS5Cg=
X-Received: by 2002:a05:651c:324d:b0:31e:261a:f3e2 with SMTP id
 38308e7fff4ca-328096a36dfmr56331841fa.1.1747778398073; Tue, 20 May 2025
 14:59:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519-gpio-irq-kconfig-fixes-v1-0-fe6ba1c6116d@linaro.org> <20250519-gpio-irq-kconfig-fixes-v1-2-fe6ba1c6116d@linaro.org>
In-Reply-To: <20250519-gpio-irq-kconfig-fixes-v1-2-fe6ba1c6116d@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 20 May 2025 23:59:47 +0200
X-Gm-Features: AX0GCFt6m0cGDfXHyZSyDb8bizNXDqo04JK2TIbhFyHHh2IYCeXYYPrIh9nSITU
Message-ID: <CACRpkdZiBp84OA643ekF8Yxs5O-JMBH2GF_FXh5YyOPo8Zx07w@mail.gmail.com>
Subject: Re: [PATCH 2/3] gpio: mpc8xxx: select GPIOLIB_IRQCHIP
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Peng Fan <peng.fan@nxp.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 1:10=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> This driver uses gpiochip_irq_reqres() and gpiochip_irq_relres() which
> are only built with GPIOLIB_IRQCHIP=3Dy. Add the missing Kconfig select.
>
> Fixes: 7688a54d5b53 ("gpio: mpc8xxx: Make irq_chip immutable")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202505180309.1nosQMkI-lkp@i=
ntel.com/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

