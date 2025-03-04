Return-Path: <linux-gpio+bounces-16986-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A236AA4D4D8
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 08:31:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CEEFF16DBE9
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 07:31:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1398A1F5840;
	Tue,  4 Mar 2025 07:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SegvU3ZP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EAAD18A6C1
	for <linux-gpio@vger.kernel.org>; Tue,  4 Mar 2025 07:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741073481; cv=none; b=MvD0m60zDl3VbbfF3qN9FCPzkGKq+eCz4NN+gIh/Ecs2HtwFkWw1HXwfGyMQ68f6PSLuQNPImg5pJGVyAXiHiEhCtEj3HYEFJ3jKtVMibMGOa0hU7kCti2l2WWevD9Bah1MexbKjvF9NBfXLOqKdHPagFwUPDrVkOVhE7aR2HKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741073481; c=relaxed/simple;
	bh=tpN98sYNx6NgaaNJaNzJjhfkNLECKzO5ZtZBIw9ZphA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cFwPBHBM0S3mQS+JBIlR59BxXBdHIURT/G1RcWMiSSqsdhnQKUQlBTLmzzWTitMxFdjkQgy2fXbEolGLutJfuc6Io5eZ//246Q/ELS1XPI7unPBOWjMW0SezU68Lh7IVKv5C117nL2BP0y9a2bfaK0rUc+8DYEIoTEfJmv6CV3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SegvU3ZP; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-549662705ffso2334194e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 03 Mar 2025 23:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741073478; x=1741678278; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gsNGbnsLqSkU3I8v0oKk58JnonHmFCpGP5Ckb34MbPw=;
        b=SegvU3ZPa0feQ3QVjApd0e2+Vj2ilFNx/ugOLK5zBl+q00IYfqXYdi3FtgjPP4sdxs
         muQNipSdsiRxEoYrRTF8g3Lve1rEn9ezJItTrpIKvwQU3f2udpp+zrKhUkmPtLHRGPAs
         jCbrTRHwONlNvmK5gErhSCkwLF/9ZR+r1XqU0r2zfAZ2lcxrcF1hXrB6VVUpmufnvwBT
         fLX7kr5ovjd6oHJjFv+F8Pj2fpaTt3VI4A1iJo1/KJM5X7MmmoW2UYb8jE5b9cesesq+
         x3DHxgznNjEFEYtm6YLMHKye7oEpy9juzb7NzZvo+vFJFjZW4pBzQshcMYpBLru55c5K
         F5mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741073478; x=1741678278;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gsNGbnsLqSkU3I8v0oKk58JnonHmFCpGP5Ckb34MbPw=;
        b=jIb8x4E5Jsv44plY9zTM4uAKEbuhOrGWIfoicCwC9vDkKWuRebfwfX9PD2i0ajy3iX
         KQKBuNMfFaRxoNZ9tX+9P1zK1knQaNwBN5g40LVWsLJ8muJanKGvVbifqA7F+ORevb+Y
         sI+i2pUwWlEK1yQ+AEF5PLR2PVPTT8+vyW/JCatwzMVQzh98NEepdUJNbjrVXZzdv2uA
         RsuXZedRUnQOoQNC1niYtokaX8weDBORzp6hegEYg5kTxlN21XJ16LAMPVUY8jDj3YWF
         0C4YVm35vP9jrU8K6fQJ57jkqwbaEDo2cfc1JtMHA6ZrsihkksAjH7X8/HgvPQ/C5oWR
         cs2Q==
X-Forwarded-Encrypted: i=1; AJvYcCX90oHQ52vT8oz2HB2S3FCaHOePjWUvu2p/NWufkNj8IoFXZ8TYcfYpYs1KzIhTOIDobVJicsUIblIF@vger.kernel.org
X-Gm-Message-State: AOJu0YyX/jhNzv6D3qOI8tuJRXcQOYLK2C7/Gtsbl8d/9LhIgeTKrzm2
	MGXCvTFh49wesYAWMuEC5PNmKUYY/2jy3/mGjK2MTIn+UigSd7gP7ozGxisDR2BiAqKa+Ua9xVs
	r8XQSnfhF/Mv4BJiEIt+MfBTvpUU1l18Bc4oGTg==
X-Gm-Gg: ASbGnctPZtZyUd3thwe1vSkoQM2j/qLG2aEr3SD/8ENsFLgk+XXrMDdwJ3bHLm2id9i
	NbkppWcKxf+GKmUPl6wu8ZZEM852Lbv5iG1i//h1ZGx5H10U9IWmJImZjnQOBr84bzl+T67pjkm
	El9WiFVV/zmQPBjfVZ9MWAbKcuYQ==
X-Google-Smtp-Source: AGHT+IGXmA371lT7C1gO2PiMuw8QGq/Oxyz60NAUpFqe9NaMOJoZxgRPOUxapC7rGv2iphJZKsi+29SyMJYP0KghgcY=
X-Received: by 2002:a05:6512:398e:b0:545:b25:ace with SMTP id
 2adb3069b0e04-5494c3282cdmr5632664e87.18.1741073478093; Mon, 03 Mar 2025
 23:31:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250302-04-gpio-irq-threecell-v2-0-34f13ad37ea4@gentoo.org>
 <20250302-04-gpio-irq-threecell-v2-1-34f13ad37ea4@gentoo.org>
 <87jz97cml1.ffs@tglx> <20250303124011-GYA59067@gentoo>
In-Reply-To: <20250303124011-GYA59067@gentoo>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 4 Mar 2025 08:31:07 +0100
X-Gm-Features: AQ5f1JqjLIt-xiSK5fnSqtY7c8S-APPE94mFjAG2-VPGFTkMlXbz-5UAA8K1r5k
Message-ID: <CACRpkdZn93oA6Tmi4EaWw9U=TAjEAdqgtK+2Ct_Nf1YUUrurgw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] irqdomain: support three-cell scheme interrupts
To: Yixun Lan <dlan@gentoo.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Bartosz Golaszewski <brgl@bgdev.pl>, Alex Elder <elder@riscstar.com>, 
	Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 3, 2025 at 1:40=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wrote:
> On 19:30 Sun 02 Mar     , Thomas Gleixner wrote:

> > Why is the three cell translation not following the one/two cell scheme
> > and has the parameters at the same place (index 0,1), i.e. adding the
> > extra information at the end? That makes sense to me as the extra cell
> > is obviously not directly related to the interrupt mapping.
>
> I think we currently just following the scheme with gpio cells order
> scheme, which is (index(instance) offset flag..), the index and offset
> are parameters to locate the irq which can easily derive from global
> gpio pin number, so I thought it's more intuitive to group them
> orderly together..

Right, the DT bindings are mainly for human consumption, and the
cells are positioned in left-to-right intuitive order.

If they were only for machines it would be another issue, but it's
people who have to write and maintain these files.

For example, in a library a machine could arrange books by
first letter in the title, then by second letter in the title etc, but
that would be very confusing for humans who expect to find
them in author order.

There are many examples of this in the DT bindings.

Yours,
Linus Walleij

