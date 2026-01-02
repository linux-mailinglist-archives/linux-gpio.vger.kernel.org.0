Return-Path: <linux-gpio+bounces-30084-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E82CEF60C
	for <lists+linux-gpio@lfdr.de>; Fri, 02 Jan 2026 22:54:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 031503015AAA
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jan 2026 21:54:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 301962609CC;
	Fri,  2 Jan 2026 21:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xu7GF75J"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38DE21C17D
	for <linux-gpio@vger.kernel.org>; Fri,  2 Jan 2026 21:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767390851; cv=none; b=ZzRnP56Ozbzt4Iy1p85YRUuh0kPdKgFEIQfYzx+dtA2KJuuY1SQjjFIgJAn1wR83exCuzUElygGVGuLAWsAkJuNClzBcoyfHbtqPMvOf+UxBYeMULhW2a7hUI8mpiYs6n8cWLVHsf3zb0h7HhpOiNW4gVYaQG39IOyvEWKH9mL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767390851; c=relaxed/simple;
	bh=bXO5/mKi14SNXt+ALR0xb15wP92GSk4JfVc32yECu98=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K6zwd8O/3Du4XUnWRcjIVpzAW6P/EseyQnFGb7Wpukw4OmnLXqMdazQncCH2af6az3cmsLdZPQt33Bc7rLIPbM5+xquwmwQ0PHd5Oet/O2hNc8SR/VFbAikI8wKioqIk1HkcDTJRRRQ9ELUjBP/ryd5dk56UgZmEjjeZLysiwPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xu7GF75J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90A94C16AAE
	for <linux-gpio@vger.kernel.org>; Fri,  2 Jan 2026 21:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767390850;
	bh=bXO5/mKi14SNXt+ALR0xb15wP92GSk4JfVc32yECu98=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Xu7GF75JqygqgjG7jRFqBQC9amhxigiNBCbpjl/4a7XEqmVHHBo5Bz1At3iNeilOK
	 GMxOJccXg/of3MMOS23sl2AUM47InHLe5oDVnHWHctMUHngnkITry5gbSl4SX1m1DZ
	 pCY4qdvJzYlMEN6ezIYfdI7PUlnZHBVr88dIe2C+8freNRrXqQxy6WvdtmVoRB+qt1
	 xGJ6cDLeYwfa0lyzH2W2HNlk5DSriXN5iXM5yj9TRNfuWocZ3a/w/lSggBuBLejWXw
	 WiLz3FlqMTlWPucaWmT4TnE5izms5W4wgYb+DJUAw3/bGPdpdOF5tLuDBTlt6HJg21
	 mPUCB4Sms6kSg==
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-64669a2ecb5so325390d50.1
        for <linux-gpio@vger.kernel.org>; Fri, 02 Jan 2026 13:54:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXmrk8kTOs5lyrapyB9CjG5h/GlpIQ2moGN7XC9SJrdhcGYAtn9J6bBzIKS+a/NlPS/X2gbcWkU8hHn@vger.kernel.org
X-Gm-Message-State: AOJu0YxB+Us0C2MkXl8FU1NnVodSwGc72J54iWdIycA4de1wsGYwkCmW
	c20DuHfa/FtXuqYG1CRoVFIQ+shRwdhwTSuREuZSxqjqjWoLdUKxxWORgnrQiNnY9Pr4pAq/5U3
	CVtsatuH3Qh6S9KwO2M6FYqCxV0ozyAY=
X-Google-Smtp-Source: AGHT+IEhEl1mjhchJ1w5VCgkAeC73rxu4iaz3+l4FeH+T1USCuQFRrCa5hkkli4BCMUqb7ZNPk1qWfl/sZFC0YgOzI4=
X-Received: by 2002:a05:690e:1c1b:b0:63e:336c:20e1 with SMTP id
 956f58d0204a3-646e341aaa6mr795999d50.25.1767390849835; Fri, 02 Jan 2026
 13:54:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251222-axiado-ax3000-cadence-gpio-support-v1-0-c9ef8e0d0bce@axiado.com>
 <20251222-axiado-ax3000-cadence-gpio-support-v1-2-c9ef8e0d0bce@axiado.com>
In-Reply-To: <20251222-axiado-ax3000-cadence-gpio-support-v1-2-c9ef8e0d0bce@axiado.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 2 Jan 2026 22:53:58 +0100
X-Gmail-Original-Message-ID: <CAD++jLkxsynXSgpO+O_ThOE=3yzDH+2NgO3v=9LDDOMezXJ_Ag@mail.gmail.com>
X-Gm-Features: AQt7F2qR1nZxgt8AjUDTlSYxIt007uMjm-AatbFykgqpTu4GeHTEhl8LDn4DEx4
Message-ID: <CAD++jLkxsynXSgpO+O_ThOE=3yzDH+2NgO3v=9LDDOMezXJ_Ag@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: cadence: Add support for edge-triggered interrupts
To: Swark Yang <syang@axiado.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Tzu-Hao Wei <twei@axiado.com>, Prasad Bolisetty <pbolisetty@axiado.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Swark,

thanks for your patch! This is an important improvement for the Cadence
GPIO driver.

On Tue, Dec 23, 2025 at 8:30=E2=80=AFAM Swark Yang <syang@axiado.com> wrote=
:
>
> From: Tzu-Hao Wei <twei@axiado.com>
>
> The Cadence GPIO controller (CDNS IP6508) supports edge-triggered
> interrupts (rising, falling, and both) via IRQ_TYPE, IRQ_VALUE,
> and IRQ_ANY_EDGE registers. This commit enables support for these
> modes in cdns_gpio_irq_set_type().
>
> Although the interrupt status register is cleared on read and lacks
> per-pin acknowledgment, the driver already handles this safely by
> reading the ISR once and dispatching all pending interrupts immediately.
> This allows edge IRQs to be used reliably in controlled environments.
>
> Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
> Signed-off-by: Swark Yang <syang@axiado.com>
> Signed-off-by: Prasad Bolisetty <pbolisetty@axiado.com>

> -       /*
> -        * The GPIO controller doesn't have an ACK register.
> -        * All interrupt statuses are cleared on a status register read.
> -        * Don't support edge interrupts for now.
> -        */

Maybe we can instead insert a comment with a little table like this:

Interrupt polarity and trigger behaviour is configured like this:

(type, value)
(0, 0) =3D Falling edge triggered
(0, 1) =3D Rising edge triggered
(1, 0) =3D Low level triggered
(1, 1) =3D High level triggered

It's good that you also clear the "any" register for all other modes which
is something we didn't do before and could cause problems if e.g. the
boot loader set some value into that register!

+/- this small comment addition:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

