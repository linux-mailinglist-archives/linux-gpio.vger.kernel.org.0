Return-Path: <linux-gpio+bounces-10399-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA91983F84
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Sep 2024 09:43:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F0641C2084E
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Sep 2024 07:43:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 106A21487D5;
	Tue, 24 Sep 2024 07:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AtuGKMV2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E8014830C
	for <linux-gpio@vger.kernel.org>; Tue, 24 Sep 2024 07:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727163792; cv=none; b=T2tMbgaBNEsB4rW7mgyJ5Mj9eRL/td9R+0QyipWD0wEqFZ7CSt50lMk8VAMuDwG8jA5sRh2jts77Yby9TI955nDQ1DIUvW66M0oTpdOMCD4w8G5ZFouPrcN6EXllNtVes4v/6tZ5G9JMnbzQ8biel+8lh/qiC/8P1nDh84WfFWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727163792; c=relaxed/simple;
	bh=kjTCESWnozCNSO+5LxU4Dr2NZahYWHk5AXqlWRQen54=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J6cLjKpDRprieyLtTzHck4Aq8SP5urrTKBUMT9BSKvS+bcx26CiDc0pbBl3+eVqZbGxr1GPikStH7MBPT+y+dNb6Y81YANyGSRNRhkpvmUrYVsmZAnlHaklyVAVqLEr1RNvcy4/lrhXjWyavft9hlBres0H9TslZEcWyeFDXZCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AtuGKMV2; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5365aa568ceso6057349e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 24 Sep 2024 00:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727163789; x=1727768589; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v4AE3wT085nmxLHX+pXqyuEkqB9MSe4BJ3vsxOltPm0=;
        b=AtuGKMV22o08HvhV00HTWp+aaMtEXvAXgvPSj3PSaY76YkJqhz+cSIZiDkrjEYdA9S
         0WzMM7FDs5QXaT0tuYDCpjSspkfxPR0BuNtOmKrL5zuOqRvzOmXggX961M6xL7r6K426
         nb1dGL276nTTvITh2U+eH/UY1xODD39wOoWRC71I+BX0TMP1oIV64uG+sUVnDHnZAU7I
         KZ1w+VbLtAqNk9SB5IYDtX8ZnoduDXFPVl3cjG7rLyT8/VSvCtw94j+pJQOm/ujZ0Qi8
         SOCBUwwCgi8f3vE/HTnbfWsR03KN6jQrFJ04zUPaYHrkXqVyhAp5t/Dihsl8Moyumsnt
         y+KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727163789; x=1727768589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v4AE3wT085nmxLHX+pXqyuEkqB9MSe4BJ3vsxOltPm0=;
        b=sVmtPxL/8AcZ/w8vZbevYIQrIdfRG1dalOoRWNDQ+1ggGdTsrvgj0xLHPV7xGvu57L
         aiXWlMZ8C8rAE4tVWUfr1+g8sDwlxLRRTeM68cZyowg04FtY4EUrv/9Fb+WGv4ero/MG
         xWuetDMNTVF9uWyxF0dQ0bIQIOU2VLMAaFR/g1KJm1HESfKi7U8qjMvP0XY+66zfg6p9
         fTMt4vYxVXlIwpfe3WZQGe8QknSp6xZskQzkCJGEveyrud7FLKkXC5JxgjmUHjuHQXxO
         Tvwzw8wweAwGjbHZJDudskXP4QdFCyT/Ofk6eNjuKomPJQdiwN7nPwOMtsB/JWM8W2Ad
         SMaw==
X-Gm-Message-State: AOJu0YwgTbgwRF9+5ZqTmaBqF4D1lNK3IsVU16ppIB5uxw7F/40VqMtF
	JV4KiBI7GHTH5waWiX1y23F3XRCyP1dSTeS4Is+FwzZcOsu4yytMeMTKcIJZlhYoFtxgDTHnGi/
	3yVLcOCX50ZdOo3AF6n7Vgc27jCd0uwM56o8KyoRf1p/I6BajTa0=
X-Google-Smtp-Source: AGHT+IGtM+ap0Bn1i9jACAwLBdGvwwbEYgZPkKvWofN4DPWUUPOGUFpOvQIXuOiqye/dyccJwkvrUhqRM2fBBjeGj6s=
X-Received: by 2002:a05:6512:31d5:b0:530:dfab:9315 with SMTP id
 2adb3069b0e04-536ac2d91bemr10172249e87.10.1727163789373; Tue, 24 Sep 2024
 00:43:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240912142447.981590-1-quic_mojha@quicinc.com>
In-Reply-To: <20240912142447.981590-1-quic_mojha@quicinc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Sep 2024 09:42:58 +0200
Message-ID: <CACRpkdZxu34btYm-ibkgEqWfau97DjuKGib=-xd-WYL2PN_KYA@mail.gmail.com>
Subject: Re: [RFC PATCH] pinmux: Use sequential access to access desc->pinmux data
To: Mukesh Ojha <quic_mojha@quicinc.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 12, 2024 at 4:25=E2=80=AFPM Mukesh Ojha <quic_mojha@quicinc.com=
> wrote:

> When two client of the same gpio call pinctrl_select_state() for the
> same functionality, we are seeing NULL pointer issue while accessing
> desc->mux_owner.

Uh-oh it looks like a very real issue, weird that we didn't run into
it earlier.

I guess we were not parallelizing probe so much in the past so it
didn't happen for that reason.

>         /* Set owner */
>         pindesc->pctldev =3D pctldev;
> +#ifdef CONFIG_PINMUX
> +       spin_lock_init(&pindesc->lock);
> +#endif

Can we rename it "mux_lock" so it is clear what it is locking?

> @@ -115,6 +115,7 @@ static int pin_request(struct pinctrl_dev *pctldev,
>         struct pin_desc *desc;
>         const struct pinmux_ops *ops =3D pctldev->desc->pmxops;
>         int status =3D -EINVAL;
> +       unsigned long flags;
>
>         desc =3D pin_desc_get(pctldev, pin);
>         if (desc =3D=3D NULL) {
> @@ -127,6 +128,7 @@ static int pin_request(struct pinctrl_dev *pctldev,
>         dev_dbg(pctldev->dev, "request pin %d (%s) for %s\n",
>                 pin, desc->name, owner);
>
> +       spin_lock_irqsave(&desc->lock, flags);

Could you please rewrite all of these using scoped guards as that
avoids a lot of possible bugs?

#include <linux/cleanup.h>

guard(spinlock_irqsave)(&desc->mux_lock);

This means the lock will be released when you exit the
function .

tighter locks around a block of code are possible with:
scoped_guard(spinlock_irqsave, &desc->mux_lock) { ... }

It also removes the need to define a flags variable.

Yours,
Linus Walleij

