Return-Path: <linux-gpio+bounces-25919-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2DFB5237F
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 23:32:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B50631C25408
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 21:33:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43E243112C1;
	Wed, 10 Sep 2025 21:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fFwj/L7x"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5083C2FABE6
	for <linux-gpio@vger.kernel.org>; Wed, 10 Sep 2025 21:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757539961; cv=none; b=Gc/DgY2PC3mfRiRokmdD2BUJvzHK3dUPsKvTEPVSFQb9XSdV4B78tu6U8LTgBCWHchEpoFdBggRElDzrm+2+95Zyy9lLoGEQu2zIQuoTUlbYNf47+IxQnJlqd4297zvAxWZKJdGvX1CpD+Ao1gHdaLpRsATg8JPGEGBgyx9sAoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757539961; c=relaxed/simple;
	bh=tDgFFo1KURd80WOddqneN0YLx5E89K1CqsHmGyLdaRg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dc1fEsJcEfnCaOvUltVOaDjbm/vmM93pesCRM5MF9Mn1m1vS0tBZytZ6XlDLkqapQPLb4XSk5xrnbNE9VGM3rPlsQyR60XbgOBGBYiqO06IEuSQWQjk8NYWLm5GPRk79AcRWXN2hS0RXnPmSRKICZ2eVhY5g24oiU6XXRre7Hcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fFwj/L7x; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-55ce508d4d6so3439e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 10 Sep 2025 14:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757539957; x=1758144757; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tDgFFo1KURd80WOddqneN0YLx5E89K1CqsHmGyLdaRg=;
        b=fFwj/L7xMVLXbrafsiUBxoD7MAxOhttI7KRIebIj5TOl47/6pHUwstG+oyhVRiQKiH
         buogzFmlUB5f2PQDjgejothGY0K4DlSLuyCsKaBhZ0tYy4lRUpzbyL08aFN1uSKZ1bDG
         SwaDZh5OI7T4EXyuLarVGg7+a6/LkS9bvhR6We4NQQQm9ACEpOD1JoyqZFNVG0pMxHyT
         OnmyyfB8iOnrNVa4+KqMOsaWig6syyIUVmE81K0XpMJikbhDfgBXGfer5BF+4pI3T2Bv
         edIUKPC/nO4m6z21NHco09MtuTcljb4aeAAEChVIS3lO2OjtwTogOrriBFrM20qnVhOD
         xiCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757539957; x=1758144757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tDgFFo1KURd80WOddqneN0YLx5E89K1CqsHmGyLdaRg=;
        b=w9LDVG67VqiLyY9kMJdZgCr5tgA4+ad2Qi52U+8lrEfybbxkT9Zi1RJeHpLz5S4iV5
         w1y1g/yfPrkl/Erun/KXL8MTfRt5CfZyCOKAlHvDmkVeqbS1kG6fVL07Rn+Yb17KaDjL
         00K9tGjGsnlOzquX3Ma6EydEqE/0nhWkEo5EW6bZR3OgazXpKg88w6GPVJGFGyJQXlrh
         K9RYvzxyGURCd/Gh+cCXgSEooej8exvKTta4yXRJf8Nf6xSFe7wo5s5MUGORgg9RCEl3
         G7JKRRa9Ye4lod0gFAx0evKPFzMSTjKqhlitVkTdJN6HcokiRAIWNQoatknYSApR+8+9
         0brQ==
X-Forwarded-Encrypted: i=1; AJvYcCWylJWOiztni+O3W2lo79ZlCDgTKME9Zxe1CoVBO9kdIb59X5aAMBqFjy+YuTYkahv/e75eZyT8amXl@vger.kernel.org
X-Gm-Message-State: AOJu0YyEKsKTTQva4KjmcaPObnKo6IJwl+w2qcBx2JWA1qHGnYwByW5g
	dPGoBIF8i4C2czWiXcUApQESgxsrJ41gRGJooSHXqbN0rHyNuCoL59XOt9IAEMnj+8RDwGytYSR
	aeILnLLVnj40hegeJnlxyTekpX2GmEj4pXeS2yeQx6Q==
X-Gm-Gg: ASbGncuKp1akjRgkL5mE64URz0GnTMY52p7u2CwYXgM25X1smHoXbyCGgM6pc9lG4z3
	p//9BOloZ+m6JfQSHNICaczjmUIwDc33GM1OIm4qM99HFHFk0KJln+2nDCsd+nXl8QBCEgW9g4A
	4aUW0WJCdLxjw4+tb0QJ02drnba1NR4C9CPjj3Eoxhe8xokoIelkzF3DuWfGgrz4c7GU8yO3e+y
	FwmKmDp6DLOMMciKw==
X-Google-Smtp-Source: AGHT+IEDFgI45XU5cTVW9FtG8gM2JjDzoZENa8d1uC1g5vQQ+iix+RIzuYFh88VfTx91WSF4c7ZJi4duHEmeM7k85Mw=
X-Received: by 2002:a05:6512:6404:b0:55f:595f:9a31 with SMTP id
 2adb3069b0e04-56262f11dd2mr5910272e87.51.1757539957420; Wed, 10 Sep 2025
 14:32:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
In-Reply-To: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 10 Sep 2025 23:32:26 +0200
X-Gm-Features: Ac12FXzHQO4QoWSTSppUbrZutew2n-HjqWu5POboMsRGiUcu6mJnWXdH0E38Eq0
Message-ID: <CACRpkdb=J+hiC5cu+g0Z-gqzpG8PgX01CXc4P98FfSSAf7PZEA@mail.gmail.com>
Subject: Re: [PATCH v2 00/15] gpio: replace legacy bgpio_init() with its
 modernized alternative - part 4
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>, 
	Doug Berger <opendmb@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Yixun Lan <dlan@gentoo.org>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 10, 2025 at 9:12=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> Here's the final part of the generic GPIO chip conversions. Once all the
> existing users are switched to the new API, the final patch in the
> series removes bgpio_init(), moves the gpio-mmio fields out of struct
> gpio_chip and into struct gpio_generic_chip and adjusts gpio-mmio.c to
> the new situation.
>
> Down the line we could probably improve gpio-mmio.c by using lock guards
> and replacing the - now obsolete - "bgpio" prefix with "gpio_generic" or
> something similar but this series is already big as is so I'm leaving
> that for the future.
>
> Tested in qemu on vexpress-a9.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The patch set is a beauty, hands down.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I especially like where you caught local spinlocks being
(ab)used instead of the generic irqchip ones.

I don't know about merging patch 15/15 into just the GPIO
tree, that can make things fail in other subsystems depending
on merge order into Torvalds tree or linux-next if your tree is
merged first.

I would merge the first 14 and keep the last for the later part
of the merge window when all other trees with conversions
are merged.

(You probably already thought of this.)

Yours,
Linus Walleij

