Return-Path: <linux-gpio+bounces-8577-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8BE9476EC
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2024 10:11:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 44C271F21616
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2024 08:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A84114B095;
	Mon,  5 Aug 2024 08:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZXXjgvqI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E511494C8
	for <linux-gpio@vger.kernel.org>; Mon,  5 Aug 2024 08:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722845485; cv=none; b=XFQfsi639GJ/0FfFF297j5jmd15ETAB6HyP24sgMBlmr/GDOs9foFF0ryEfnAgNUEcFZm6QAL4JAkRa2OyL9z9ykc4Oa9RKrf4OFEuUx//XFQ2ECJBCrlNl06wQgMuOuUalHTa30zQHpdWUgHlHXn1mVpbU1iPeXbgbdjvZmxcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722845485; c=relaxed/simple;
	bh=OGaVx+qMhZ0b7otpK3O02Kw7IL7OQu7ghb0iUPKBQPk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zl7CzcSkS0CoW7SgLA9b4sCTxQtnOl6mzRnkQkcedBFSPJVv6WKyzSQuPtNbiQYpoe1iXweeMZkDqMgtS26q/cQ9s26tCYcbWOo/ywOk5lVr8UosEFaKfMu02AEMpIiskRAmnpK9Lquyv7QJHQy4WRanoefKnhx+lt0r2zNhgRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZXXjgvqI; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52efc60a6e6so15772487e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 05 Aug 2024 01:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722845481; x=1723450281; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OGaVx+qMhZ0b7otpK3O02Kw7IL7OQu7ghb0iUPKBQPk=;
        b=ZXXjgvqIc5ePHCwNR8+DkTdAWjGsWOTN2rGFbNRBQbEZEExu2gDdX2Hj+sKMNZdHuo
         oJvb0U4F+aEo7QvSAale5n1Ixh2eeTUAhoqNu1DQ8kPIVCXE+Tc6NInk9GJ1TIEgqchS
         efs7VeT8zgMAaA4zKbn27VXl2e+rFIkZoPHxr/jRbcNss+cRx8Vg0iAdz1ryTKBfcoss
         txQdAQKbQK9UOTScsYSPqHY40TaeKVo+ActZy8DzdVO6E2+UhfJUlx0XDhIkuy2m1w7V
         qeXoCvKApuSqAIE0+sPWsNxDNIri15pJi1oyZ21aSBNyk/NOic5tsjwJT12A40JUG2ft
         TT+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722845481; x=1723450281;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OGaVx+qMhZ0b7otpK3O02Kw7IL7OQu7ghb0iUPKBQPk=;
        b=ta3/hftv/GTEBOXez2jlQZY+wrVIR+wZDDdiWJSONewrqsmQ8+eSJ2eFgFwSDkxIAK
         IfqvUNKq+h/F9zUjCLFyNl+s17ixH/I8XgyRyOuQYB81RzlgGCwKvorhcFdlWS+kG9Yb
         f2YcvlwGa3sx8oR0vJSPh5oqB4S4ids8zEQk+DX0vy0saUOUIZ5WV7j+uJW1CnErhYwt
         2U3VSJeSUrOSRVkLwvjxwDjpNxOlbKSYFT3f3UuNoT5HKs2pzN4CPu0H1t0PnDJqExSO
         72STX4vDxwY7Fv8Wlvxv9o+MqdB2BT888uNBVB0ahM/to6rIa22O3z1VjImuL0GSBsnv
         umwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCKrw/61jR+uvEut9H6kDTT5WjsspwDg5kCe9L/wsQ3Tm+EpEey/r4bbHcuRxt3CK1WZVgwU8I7wfyPFPLHXetmJbniaHc+NVOaA==
X-Gm-Message-State: AOJu0YyJCmVEIyirEY1buLL62OYdoWp7Id+uFlrIGqvXCKpaqTacQN0b
	X0m3BuX5eqtearvB/IEZ+nR2osE9/p3YBuCCleVtihISeaXGqT7/bmf6UgP9QCNKPgRIgQTuQjz
	2SEG9S2hRIUkNvRQvqpdzwHCiiI05VzqOFEQYcA==
X-Google-Smtp-Source: AGHT+IEexVYi+TyR4tI+GJL56PCbzdQ1IM0K1XkXHiZ4BaBgjJiBD9SkZedwISuAdeYS+5aa+vlh1tFok3PdTds2jiQ=
X-Received: by 2002:a05:6512:32c5:b0:52e:95dd:a8ed with SMTP id
 2adb3069b0e04-530bb385320mr8050795e87.35.1722845480886; Mon, 05 Aug 2024
 01:11:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240723-supervise-drown-d5d3b303e7fd@wendy> <20240723-handoff-race-33160609553f@wendy>
In-Reply-To: <20240723-handoff-race-33160609553f@wendy>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 5 Aug 2024 10:11:09 +0200
Message-ID: <CACRpkdYdxdLG8=_Xd7HLwQ5+pxwGw6Xte7=UNbknB8HR474bcQ@mail.gmail.com>
Subject: Re: [RFC v7 5/6] gpio: mpfs: pass gpio line number as irq data
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-kernel@vger.kernel.org, conor@kernel.org, 
	Marc Zyngier <maz@kernel.org>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Conor,

thanks for your patch!

On Tue, Jul 23, 2024 at 1:28=E2=80=AFPM Conor Dooley <conor.dooley@microchi=
p.com> wrote:

> Since the interrupt mux is going to provide us a 1:1 mapping for
> interrupts, and it is no longer correct to hit all of the set bits in
> the interrupt handler, store the GPIO that "owns" an interrupt in its
> data pointer, so that we can determine which bit to clear.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

I don't quite get this, the irqchip of the GPIO is clearly hard-coded
hierarchical, then why don't you:

select IRQ_DOMAIN_HIERARCHY

And use e.g. girq->child_to_parent_hwirq() to handle the
hierarchy?

See drivers/gpio/gpio-ixp4xx.c for a simple example of a hierarchical
GPIO interrupt controller.

Yours,
Linus Walleij

