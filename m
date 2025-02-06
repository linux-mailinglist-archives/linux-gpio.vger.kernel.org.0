Return-Path: <linux-gpio+bounces-15480-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B76FA2B133
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 19:34:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1358A3A6CD1
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 18:34:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54DAA19DF81;
	Thu,  6 Feb 2025 18:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cijfQZoJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1686C19C56D
	for <linux-gpio@vger.kernel.org>; Thu,  6 Feb 2025 18:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738866577; cv=none; b=hMhN0Tv3oO9MFioOYY4ZrG/W5ZwP7Cg21svX4AErayU2qh/hNeUa+oJRHVoY1Cq/kTmF1IGLBX5UiTxa1K65cbQtFjnDmdNZcRZDAMwPTXQRdfVUSa43EeWqCQ2/D22bIPLQd1rMCsAyCyB0l2D736dmjsKvsHx/oMs+T7oBeR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738866577; c=relaxed/simple;
	bh=sDr006/hgglkdO/eH69B79eDazs4yzuZiXbBBe0Lgkw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WAqFWhGtDKI2T3V+iwUEtil5auNH5Dk9fRyYS3uYAK15Rsh9OBZAqe7yrMmlugw5Bdsf8T/3lquCgrOWO7vjR3zNXDxYKfcKZSuhOZVNLyiggW2PhNMfO/QvABG841YRKIPAY7Z0o8tbvWqlMjX4Me+Yvh5/TDOgZKQcQ3E6EJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cijfQZoJ; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30613802a59so13683941fa.0
        for <linux-gpio@vger.kernel.org>; Thu, 06 Feb 2025 10:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738866573; x=1739471373; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sDr006/hgglkdO/eH69B79eDazs4yzuZiXbBBe0Lgkw=;
        b=cijfQZoJT9bLjSXFUk8aTDFaV9tThL1K21xeCX+N8Xc+6CcksHiKgWXQaWEp1efwBM
         6szYEYfOyj9xuTEIlpo1nUM2qo4T0hMLbJfp5fafrYjlNS3a/GhOMDjffALDZ+kxzrg1
         wpRy8MxpMWVMMj27WMwiGmMIsUgM+qr1gy4DPXIBzlkN9TPnqGs8T/1VrSVBXggrjb21
         KRKb6Y6jvB1QBlUhDxo7QMM03G3Bv1HRfTdkKt9NNW1I1b18q3zHdIgjoE+rzP9TsIpA
         5IyVckD19K5RD2i9Jf+VH3TNJ5Yyrvt1cQauBMVdU7JDr5ONCd8d1cjQ4MDLvhxBsBHy
         QLNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738866573; x=1739471373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sDr006/hgglkdO/eH69B79eDazs4yzuZiXbBBe0Lgkw=;
        b=ioMzkirv78BObBSJxYPndyYTzzDx3JW2D6I7AdtZX8+QfHidKeFdJkomDm8GaKJ0s1
         lSe/KTOuzK7KvU9wELDurZD6fUkPmt84tU4j3ZBDk3v8oC7T+uMEHJ3oG1Gmf94O6NkY
         NWNGLtJLX/toESNIR7LEGMATwCEkKDhfcmVE7DAltTXPMzIw2HLrS0P9XdCrRG4kf9LV
         tSGl1E8kUCJh5U4EPvFX2tGztrPdp4pTgAtn6tQB2g73BrPR33Y70tUodgFjASiS3eWh
         jdI8t4vSQDJiNans6TNdyAOejBZgzy1d4nos/IgjFJGknCF+sHpd0g+Q49LkvwUg3tfu
         NZNg==
X-Gm-Message-State: AOJu0YzpGhwQxem+0e/W0aVtSgXiPfV2tPWmX5k3wkuw6EthlqNVVHDv
	hmyGP7aWVONi5kuyWowVqpYEFnRWgf4UnyzH4SuTP4mfIiLpSh3xrvM+H7P5wTNWaioh7TvtniA
	DcNeDph+i/co+G5xrKOb2q36OyE6fCQZtS2dWnKHkZQ6AXqptQX8=
X-Gm-Gg: ASbGncvVhLCLWtO459CPP0k4u0CEt281WIdD+9IAmEgXM8+m/dTgXF1l8NppQyKiI5h
	na0NQOY0pmNWmJ4IlxoiUaehyd3Ceqq9QN6uAXIRCtOWvMpQXURp3+zje59EbH1iE+zy91OY=
X-Google-Smtp-Source: AGHT+IFAh1VgRDp84JcG8BQ8x1afxyj+l5KHa3cSP3jtqaCzdvDTN5xVn5MiYXV8z1FW+fO4hOyN0/vE3KExKR4iYNk=
X-Received: by 2002:a05:651c:b29:b0:2fb:5f9d:c284 with SMTP id
 38308e7fff4ca-307e57f1261mr70831fa.16.1738866573122; Thu, 06 Feb 2025
 10:29:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206181714.417433-1-johan.korsnes@remarkable.no>
In-Reply-To: <20250206181714.417433-1-johan.korsnes@remarkable.no>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 6 Feb 2025 19:29:22 +0100
X-Gm-Features: AWEUYZljeypmu7Ac3J3fYezV27yEj5E3E13DTNDQWv8hwW2-IPQqzHdNA0hksOQ
Message-ID: <CACRpkdaNDJrGZ4Y2PPUWQfm6BprfNACYWD7srs3sYHMEsdX1Ew@mail.gmail.com>
Subject: Re: [PATCH] gpio: vf610: add locking to gpio direction functions
To: Johan Korsnes <johan.korsnes@remarkable.no>
Cc: linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Haibo Chen <haibo.chen@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Johan,

thanks for your patch!

On Thu, Feb 6, 2025 at 7:17=E2=80=AFPM Johan Korsnes
<johan.korsnes@remarkable.no> wrote:

> Add locking to `vf610_gpio_direction_input|output()` functions. Without
> this locking, a race condition exists between concurrent calls to these
> functions, potentially leading to incorrect GPIO direction settings.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Cc: Haibo Chen <haibo.chen@nxp.com>
> Signed-off-by: Johan Korsnes <johan.korsnes@remarkable.no>

Looks correct to me, verified by looking at the most tested
driver gpio-mmio.c and seeing there is a lock there indeed.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

> where after a couple of reboots the race was confirmed. I.e., one user
> had to wait before acquiring the lock. With this patch the race has not
> been encountered. It's worth mentioning that any type of debugging
> (printing, tracing, etc.) would "resolve" the issue.

Typical. I would include this in the commit message, people care.

Looking at the driver it seems vf610_gpio_irq_mask()/vf610_gpio_irq_unmask(=
)
could have a similar issue, both write the same register.

Both issues could be fixed by converting the driver to use
gpio-mmio() with bgpio_init() which would also implement
get/set_multiple support for free.

I have no idea why this driver isn't using gpio-mmio.
Not your fault though, just pointing out obvious improvement
opportunities.

Yours,
Linus Walleij

