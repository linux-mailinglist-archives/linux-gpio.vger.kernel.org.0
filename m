Return-Path: <linux-gpio+bounces-16994-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D3AA4D57A
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 08:57:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BAA9E188D62F
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 07:57:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 823871F891D;
	Tue,  4 Mar 2025 07:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SCSKcBHK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9114D1F8736
	for <linux-gpio@vger.kernel.org>; Tue,  4 Mar 2025 07:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741075044; cv=none; b=tUW2YohGxwkRSn2AizHD+/AghscvwE2+ZaVCOyGMDMsA1AapEvXbnSeWqjBcLZ4XPGB43bSe9bamY8hYeUvwWDxgeWa3fAZ26EoN4i15sLhBL7XWlDjnBN/GxQNTCYVMbHfAZbpRglWLBIHr33fHqXiuoo46FH4kzJiOo9UI+PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741075044; c=relaxed/simple;
	bh=9MJWVNAYbFfN5gmFYspnU7mZ7rSbwhs5+PzxvlEK5oM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SoEoMXSFymk7aUWX9x8AqBQn1y3idi4LeF7BGMi61hIq5W9e9ULIdK3Bly7CT8K9Lw9o3iyctjZHNDt6rARopXc+2lP4240ugUeFddyVFmh90litPFTNcT4L0e7Hp0lkvDwD3Ogj6Tn8ELq+T4aUiwvHp2i1Kolk7HESmnw+KL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SCSKcBHK; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30ba92c846eso26620171fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 03 Mar 2025 23:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741075041; x=1741679841; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9MJWVNAYbFfN5gmFYspnU7mZ7rSbwhs5+PzxvlEK5oM=;
        b=SCSKcBHKpd+HiqtH6OBQs5GSaQK/JFJYX4y+yldo4lDLBtUoRAQYafUf2LWkY5BFrW
         otmgMb3OXUD/VN82lbhJOE7ThLxRPlwp1nvUnjWCZNrIgQcx4bUetBLPL47aHr8fvOhz
         kWj5EvnnY/br4vdwOilgz/gMm7WS7MancGWkBcKWBxVazix5v7al5QTqUfiItU1BiPf4
         hoTSvFPdqTTxmlHtoKT+ygPxArUlHpQTa0Ouc6snA3gjfgzOznQDMCrOBXcvYSXcIA3Z
         aRELQPWxnprFY5BXdBu7WgAO+AZsNE8KCfIovtnSMEzUKLhxCRmGYI8M5UxX7X4hoyNd
         YzEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741075041; x=1741679841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9MJWVNAYbFfN5gmFYspnU7mZ7rSbwhs5+PzxvlEK5oM=;
        b=ITysu8DfNFJvBa10j1Y9Tmv+l8+eRoxQuJijWZPCkVquRNdTmgeTz1jLHRDpDYzbba
         DwbcZUeay628tLaLNBVrUbL0dfFWH6oOxjoSXId8/yUTVBGvAjNkvYQhYR9436zioNS2
         5bvZiYEaLtybQOuO0vGyQSvc/iXg6cNIvJtXWqh0MpJk9ZAQ42an3TwrTHGF+JS/SUBn
         a9+KO8LVj0Cd8qrUkS7eaqumxs9OjpRrWjroNzsGsk64g60qYjqrrwKRGQ4bPRMHxVg+
         U31eN70GJxw2rt/dK2fPWKfrUAQid6stvzI5fVop8sgFZv2UVRWWp9Bodvton9WB5Nt8
         zWAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXla/8Pviu9KsukO6opgzjlUwEUcN+ryPm8nXx8QXCJozpNhw6bAAQmhi4q752LFo3MSRUVCj9MbxHR@vger.kernel.org
X-Gm-Message-State: AOJu0YyJHYKZF68Wl1BLoj5WloHk1haYORQoaP8iCKn2sOe8Tn4JYVNQ
	lPgY1mUYxBUb2FP9jVMGS077ZAAuGx/nGHSgZ8ZjKQ+pDowTClkaDKRq4/ASoSSWORK/wBD4GYx
	6IB5/vzkoU7noO1Gc6/A76JLA3VLd4N2kTsJKTw==
X-Gm-Gg: ASbGncsKG/fcrJqtM/MUZtiRMI3d+pYMyyO8mexOyLZxu0CXXMgYFCzCWP11XV0OR21
	Sw7iOilfFneOiHKdKMu6hByn4LJBM33rxsvbM/dsTh7EEFDAoKl5Fp2KmSM0D2rChmcMzRr3WFA
	Mw1TppsgmGjtt0NA9JSpIlQ8G7mw==
X-Google-Smtp-Source: AGHT+IHSy++EDa8uB5yFe/BN1OzFpcRiPv6q/L0Yb6WEIAoWQ/01QGVa6aOzlJPGbi7YoL8CeVCsSdBYLnA1PRv5TZU=
X-Received: by 2002:a05:6512:1103:b0:546:2ff9:1542 with SMTP id
 2adb3069b0e04-5494c370474mr5181702e87.53.1741075040603; Mon, 03 Mar 2025
 23:57:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1740745270.git.mazziesaccount@gmail.com> <fae20f205d4d3c9f0bafb133e51dd115f68de84d.1740745270.git.mazziesaccount@gmail.com>
In-Reply-To: <fae20f205d4d3c9f0bafb133e51dd115f68de84d.1740745270.git.mazziesaccount@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 4 Mar 2025 08:57:09 +0100
X-Gm-Features: AQ5f1JpIi2JxPyYJe78FxstL1PUTrYRkGuGmpoWXbSVW-5ZdXAx2tNfGb4CuOR4
Message-ID: <CACRpkdZJnzd6uu9qO5VRLps17-2+ownFQ7CgHCko0vUdjnhTuA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] gpio: gpio-rcar: Drop direct use of valid_mask
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2025 at 1:36=E2=80=AFPM Matti Vaittinen
<mazziesaccount@gmail.com> wrote:

> The valid_mask member of the struct gpio_chip is unconditionally written
> by the GPIO core at driver registration. It should not be directly
> populated by the drivers. Hiding the valid_mask in struct gpio_device
> makes it clear it is not meant to be directly populated by drivers. This
> means drivers should not access it directly from the struct gpio_chip.
>
> The gpio-rcar checks the valid mask in set/get_multiple() operations.
> This is no longer needed [1]. Drop these checks.
>
> Additionally, the valid_mask is needed for enabling the GPIO inputs at
> probe time. Use the new valid_mask -getter function instead of accessing
> it directly from the struct gpio_chip.
>
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

