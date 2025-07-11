Return-Path: <linux-gpio+bounces-23152-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F03B0199F
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 12:23:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADA8A1C47A2A
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 10:23:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83C48280033;
	Fri, 11 Jul 2025 10:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="BFT9BjnE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82CD279DC3
	for <linux-gpio@vger.kernel.org>; Fri, 11 Jul 2025 10:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752229374; cv=none; b=ke9Ex18rveIHFUdSUCntQ5k191CU864DK5/dCgMuqFullTPRmWL4Ev2n5ca3A2lGEa9rgTrx+wNP/6HLdHC3lXpumHpPdotXrvAHwgDCZYUYCihiLeNMzY3qOfciSIZr0eTi0f4lT/GgQ7bJ6NiHcHp9+/qelYtTFcOLnHqQO7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752229374; c=relaxed/simple;
	bh=JGW8MvKUfKhaOjVnbMWj91aDHU9szYu+5s37tDdARUA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mTb2K6qtw3IeApR7qIGeHwYEH1UyqQEV/CrcvRjOHSWcIr94eds7+zlExT2+v5WlDXbyJ5KJ8P+VPjRq5Wzwc/bH1McbRLLCsBtcg4srJEUDVbq1dxeM/lh+OFFBL8GNYuQdJJpeUMCx7nJ4nVFVQ39ePc/TjTImnaTdHkrJKC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=BFT9BjnE; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-555024588a8so1710684e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 11 Jul 2025 03:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752229371; x=1752834171; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JGW8MvKUfKhaOjVnbMWj91aDHU9szYu+5s37tDdARUA=;
        b=BFT9BjnE7QmCOOxJAYTlvWOQexW2T+QvVHwhTpzS3+hHKSzLqHWqP8pMmz4awqmoQo
         mpqgjbm8j4LTXt6qIGw1jsWSseURD0ej5IFU27RcWmF7qg28wYTp4Ehlm0Wy1r5/YZtx
         5rJEehzDlH6q3svoT01BV2x03anMSMSvB3/nVjGntNTcu3RdzQ2tJCISpymvbjlwdmwR
         ZUa9aPGDXQqc18jgRewC4FCrfzsGvSUCJabFm+FG6z6IafuA2qljm4UfkJxarEeLXP/e
         v+WRPtuRKbTJK6hY63MQUCTiz7p1Yq9uNhl32Nf0FwGedXdclYWA5gg0SpEyg34Py1Wo
         IFTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752229371; x=1752834171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JGW8MvKUfKhaOjVnbMWj91aDHU9szYu+5s37tDdARUA=;
        b=NwQPfkA4fkJfl4Ja5pOJsL4lSveFuTB0Yq5+MxDb96CwoqH7mzSCXawZx7blzCiRxJ
         3baAPK91Zns532anMJcerqScPlfF97OwZt9Lrpxq0Q0D+YxILo7+lO0FkO79NmeCvvRF
         BdlWjvOcF3B77Ul3Aefpqojndu82RhVY+6/3OMK9ixu2in0A6JuQz65vBvw4JnkMu91M
         gXIxiYUr0suc7/wzk5cab1XzCIL7gOgwt2UExkhRkGFuRxpUXKFjlyot7kx4RpPPt5gP
         klR/IxfuAXcfEvM0/4D15rXJQcJDvK04oaosypxi86asltvPy/x+HJ94NAvVPN8bRXfj
         eDeA==
X-Forwarded-Encrypted: i=1; AJvYcCUNmFq8gVrs6GqO5nA4C/qoWdYYOYV/54jjxf42C2I4qfTps17jivEpWxNA2tEK+nCAqvmLvyJqDtYp@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4Wc2CITMszXH88h9Sw25UXdkj510K5F2pXShvtzVqKWXHs6tF
	Ub8w9QWXT8rCiepqcdnvjzpDtsxT3t+eBT/JPhnEESJf++zGzYTimctXsKgwJc+lqDD5t8wUPNx
	Bxkfuz6WcaNVJZZQivMJ8HbTEC7kSbMmlCqGwi0ypBg==
X-Gm-Gg: ASbGncssIYn5IQkBodTzz2NHM5CdxL1dCkeFJExgu97IYbTzMQdSidvOps9yjrq9HwE
	g0wu+HQwsMfnnguf5l2F36t5hhzBjDdTfWZg5Ce00EBcNVdPVAXCBN2fXO3CrJZprrOtQzFA0P3
	5EKWEkbhmjvs2ZCqQHV3ErVfKdMYRiBU3N+eI8cDFzAhPHShGc7rtmdOLEKhXeOYKyU4NNUdj05
	qb/6XURE+XWiq+p4NJqJzqRpDcgypz57KXOzu0oKdSlugbS
X-Google-Smtp-Source: AGHT+IErWz8+Owck/Svh0/uZ+pVAPhKAf17395GWgH3vgmlAH8ppyvsQp+0Fhf/VpR4wd9Akgu08i+W2C6AnG8M3FpI=
X-Received: by 2002:a05:6512:3091:b0:553:2375:c6d9 with SMTP id
 2adb3069b0e04-55a04646a60mr740650e87.55.1752229371037; Fri, 11 Jul 2025
 03:22:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250709201028.2175903-1-hugo@hugovil.com>
In-Reply-To: <20250709201028.2175903-1-hugo@hugovil.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 11 Jul 2025 12:22:40 +0200
X-Gm-Features: Ac12FXyPqcMLXdEsGxj8xKlPSpc2z1povCiPDwzBYexnq2JfIGWR0RRUr218NtI
Message-ID: <CAMRc=MeJh2H0zYg5mfkuZreNoRAOWar9oR68+xrAar+-W2gJqg@mail.gmail.com>
Subject: Re: [PATCH] gpio: pca953x: use regmap_update_bits() to improve efficiency
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Hugo Villeneuve <hvilleneuve@dimonoff.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 9, 2025 at 10:10=E2=80=AFPM Hugo Villeneuve <hugo@hugovil.com> =
wrote:
>
> From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
>
> Using regmap_update_bits() allows to reduce the number of I2C transfers
> when updating bits that haven't changed on non-volatile registers.
>
> For example on a PCAL6416, when changing a GPIO direction from input to
> output, the number of I2C transfers can be reduced from 4 to just 1 if
> the pull resistors configuration hasn't changed and the output value
> is the same as before.
>
> Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> ---

Nice! Can you rebase it on top of gpio/for-next, it doesn't apply
after recent changes to the driver.

Thanks!
Bart

