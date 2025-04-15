Return-Path: <linux-gpio+bounces-18834-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98637A89708
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 10:44:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4442016E718
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 08:44:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2140C250C08;
	Tue, 15 Apr 2025 08:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sl9M7YQJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CE12163B9
	for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 08:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744706646; cv=none; b=aa58huIe43yRGMeCUUmBB+Xk+8fbs7yWKJX6mh5jb1Jya38sRdfyXOAMbQA4khSD3FgunpMN/TZTE82EPhWIFk/ou+yoIYowHOKmhiGdklrzUUex6JuFOaGIt5drC/zCL04TZPfT6ZpAm6EkTqa13oX82Q0o3zeX8EvElnVENSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744706646; c=relaxed/simple;
	bh=/896ZSGYVka8ViOpejF5mVMvn2q24U+I9OQ8NbvRuVo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cN+xAzsNNOFNilICp0C4TvBtKKtaY4hi4u2/n5rYYS92mB4OTAq3A3CPXv9ZOcoUiYAIebP/cuX+gQR/UjZhXZngNdVpKul+ag8OUlDB1iwG04XLNyRsYYEkURH/cti/Sk2szd6x7f1257eMNsVIWTLtKplhD2fQhF+REmvZOf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sl9M7YQJ; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30db2c2c609so56464921fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 01:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744706643; x=1745311443; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/896ZSGYVka8ViOpejF5mVMvn2q24U+I9OQ8NbvRuVo=;
        b=sl9M7YQJeXkS9kbOcucEV+sSU2DXBaRAJoA+cFbZHBQfCEN7PduMCbRogvw9AoDCJb
         IKthqh43KJwj6lAKtUmeBWbAb1e3I9qKEap70+/IW5BaUtXUNKxdkddRGoDIWX/NqRIN
         6cFtKKrg6zxKuGJPUxyCS7uaI8efhA6PgbeH73Zzss0ebnEv51Mm8+I1BwYNCue1tMNq
         IjuTthYMIyvKcUSHW0EYhsz/PX7pU7zfqyvXpqzRooBC+CfdDN+UKdbc878b0VWJANqg
         FFHC/l8d0luubKyFiI4JNjtfdShav3SWvqHWmNAJXeouqvjv56fCVO8P/B7pm435qCAB
         45RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744706643; x=1745311443;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/896ZSGYVka8ViOpejF5mVMvn2q24U+I9OQ8NbvRuVo=;
        b=NXbrpVrgrNHwHcd8zfRW55ponLb+KFydEIo2hSI4VcDNIrIwZElGzGZJ7ZE3n4ghRj
         bPvlEscn8Wh8PDEllqNQKkR72OBbomi3+v1/1RPD7Zj70Yrd9j3Z28edo3wCvhgZOZ7A
         nvDLAKaqlATbQ+FLj4Pa8eKHWfrkV5JmMjSQp133TTRXrn6aAM53fYiANufAwLv3kmzn
         A1jmLYQoKHktWs/LgJGR7kTH+TXndEhok1yH0snmFQnMQXa5PJdtKRc4lqvdyPqNIZeh
         hCpcUkFSdWdOY3EzIOxoy+5kNJjfQA+3O04vHDO2y3CM9RY4R5xEzrhiND74iawBT0JS
         EtmQ==
X-Gm-Message-State: AOJu0Yys1RNU6gDQ9+Eg8GAZVSnt9tTVUvVKGPcBzm/DFsnxQVWdNUD1
	D50t1pEmd27xmxXb5U7mH0lPIzgN3D+myCQgar/D1ay3PeXwa8Hex+wv+vzPkSF5mgLu4ocsuE/
	ROiobyi0skee/9yCv7N1ZVv/VK3ouhabe0QH96Qc/nmrt13Le
X-Gm-Gg: ASbGncsRimzj61gjDYd+xw9XbQlJP2YHYoJaaYcJ1/gIGwaMGLE8X2clvnz1n9A9x0C
	8BtwCjpk21uBhdhhpQ/5mdzj2UZjrKAXv+adKloJnRfG5Lpeu+YLxwRIBwJKWAj1K+XbnWw8CgO
	ahei+34iAnzHWZC8EeLq6lIQ==
X-Google-Smtp-Source: AGHT+IFEF/mev3PLvuZ16YQoq/3i5ecaCkHYf9BvQQvirms/WCQvY3L8dXR+US+m2FWo+fBT7ZLAd5znR/L3ddnzFLg=
X-Received: by 2002:a2e:a885:0:b0:30b:c07d:29f3 with SMTP id
 38308e7fff4ca-31049a1accemr47067261fa.21.1744706643015; Tue, 15 Apr 2025
 01:44:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250331-gpio-todo-remove-nonexclusive-v1-0-25f72675f304@linaro.org>
 <20250331-gpio-todo-remove-nonexclusive-v1-3-25f72675f304@linaro.org>
 <CACRpkdYMRnmYD1YRavZs7MHEVFM42bOL2=6s4rJzFDnfLJ4fAQ@mail.gmail.com>
 <CAMRc=McBWncrCcX87a3pYeZ3=uYGNhpSrK74hDP-XNYrT8WMMg@mail.gmail.com>
 <CACRpkdbeObj7t=quffRrZtZQRRSr6GBeayN3o_8H8zGDD22XpQ@mail.gmail.com> <CAMRc=McKgfT1ZLVzsVbBJ5pFc3bwcGT4AyXG+V0JPP0z6ft3tg@mail.gmail.com>
In-Reply-To: <CAMRc=McKgfT1ZLVzsVbBJ5pFc3bwcGT4AyXG+V0JPP0z6ft3tg@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 10:43:52 +0200
X-Gm-Features: ATxdqUGhXPkYsUwayw5aKSjE23R1hNX1yvPVRHIMfBfrJh6y9OenbmdwuTvFuD0
Message-ID: <CACRpkdYev-uRGwsjbpnYWKUCg0QWy8ZRaFDjJRPVbHCPXPgX2A@mail.gmail.com>
Subject: Re: [PATCH 3/3] gpio: TODO: track the removal of GPIOD_FLAGS_BIT_NONEXCLUSIVE
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 2:38=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> I don't agree with this. I could possibly live with that being used
> exclusively in lower-level core subsystem code (for instance:
> regulator/core.c) but, in this form, this still requires drivers - who
> have no business knowing whether the GPIO they use is shared - to use
> the right API. Not to mention that once you make an interface
> available, people will be very eager to abuse it. IMO this should be
> approached from the other side.
>
> The closest thing to making the sharing opaque to consumers is
> providing a pwrseq-backed, faux GPIO chip that allows a very limited
> set of operations on GPIOs - get, get_value, set_value - and return an
> error on others. A value set would actually be equivalent to "enable
> high" and be refcounted by pwrseq. I have something in mind but this
> cycle, I already have a lot on my plate. I will get to it eventually
> and come up with some code to back my idea.
>
> In any case: the GPIO sharing logic should be hidden, I just need to
> figure out how to make it possible to be notified about when the value
> change actually happens as per Mark's requirement.
>
> Let me reiterate: a random ethernet PHY driver should not have to call
> gpiod_get_shared() or anything similar - why would it? It can be used
> in all kinds of situations, whether the GPIO is shared is none of its
> business.

I get your point, it's just that I don't see how pwrseq solves it, so I
would have to see it.

I think a bit of my problem is with the name, as in how would a
power seqeunce solve the problem of a GPIO that is shared for
something not power or reset for example.

But maybe all the existing cases we have are shared power or
reset :D

I could think of a shared LED GPIO (this LED should be on if
any consumers A...X are active) but I just made that up.

Yours,
Linus Walleij

