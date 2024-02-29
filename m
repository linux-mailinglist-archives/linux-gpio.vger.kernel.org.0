Return-Path: <linux-gpio+bounces-3934-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D4786C570
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 10:36:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 84BE71F26EC3
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 09:36:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27010605B7;
	Thu, 29 Feb 2024 09:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TnoDzhTP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B285F86C
	for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 09:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709199380; cv=none; b=QEh25iHVpQnSRj4abeQESPhpVwKLYK0ykTHXSDwAf9rfGCE92NUX2y+JZYhax13dc8yS6qRXSlMxnzyOoYJuQcEMeVkxU4Z0EIZKwa+KvFYD7asQxdy9XmB+2MIOIIPF2KsbNnVuW9tVLigaL4hic5W7iv/QrXpsSK+Hzotr9Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709199380; c=relaxed/simple;
	bh=NIqCg2Lig+ehBNYGyTvhpjqd6T9MIQgC1nLdSgKx46A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dWyUwx+EAz/XqmrSC5r87sWCeLVZHuwymubuSeZXowwUS2D67Gk979u8GhBTXuAa+BdKZKuE1fcYK2We+zOoLxYdDagZqb+xvCCv6PpLqEjHAOty3cYV6WISCDvpaP2dXoANRLCBq/KnlItwbrtcIKQfhmTAwEZ9mANaZtLjRtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TnoDzhTP; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dcbf82cdf05so734475276.2
        for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 01:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709199378; x=1709804178; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NIqCg2Lig+ehBNYGyTvhpjqd6T9MIQgC1nLdSgKx46A=;
        b=TnoDzhTPL1NMEZWMb9nWQeHeTZInkBgPurxPFKbH38pZIo44mqQN+t6kAy2aVwxtwX
         ygc0IC1VlxoEdbV1zVbiW/Tuk7tUaI6FR9L5hYq/cjpqoq+s0alxRTDL+tQiVmkph/5r
         jhsdwpAY/PeTtiDYGgLJdsQI1dP6yeSs7H0XyjbgQaL6A8CxF7xfgAxQNO+n+ljguT6W
         AuAx1TfyDCFT0fci2mNf20G0doXt1oPguN4lNCxkQCR/gHTogrdQT1qVFbJ2z5FHfDJS
         bLetwnTif5DKGj8evqSdsQ45zXUKFLfL3CnmaKJAUzYNPKslEM2Rj2+AtuHQAdMg0gOi
         fzJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709199378; x=1709804178;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NIqCg2Lig+ehBNYGyTvhpjqd6T9MIQgC1nLdSgKx46A=;
        b=gc+nYD4Uyf0HPGjh18T5rGgFIAOT5vCQ33lggG8WT6iXTzOF4Vs3POGlolywWV+v/g
         HRKad6pcg98bp7gtVXkpmFx/ozw8o5M8JBpKWH/VJZ4MwctEC3msIVt/yg5sj4LuTYJ7
         3LoqEKPM+8hmnokc2UQz2kTtxbvZpsQk9gnGb51rEQzAyORrGnnlONXvGAEzW/OMmNqD
         G7jeBkIlFjNL1d5taRns2Wd5U0Bz/gGa1jeQZK3DbsTKsmGoeBYbvYlrCeRiuEM3d5xG
         VdfTXv5OAAQnQnS9r3X/fPsSsjqvXyebd7nigxy6DvvxV+CTmx95dyWcSS+8NR8DeSPf
         Z9vA==
X-Forwarded-Encrypted: i=1; AJvYcCWAxmEkuylmarTml1J+pMK/cxCCEkTe0AZY2WqeDGy9xHgKeHvvZum2RlIPh7DO5DQG3XVYz0we5MVPR7PqAqeGdPlI/LcD03KEog==
X-Gm-Message-State: AOJu0Ywp+q1qbmVIm3uUv4g9ItuP5OtCSbWJMmIuRPCZg/5SYU7hnckS
	2qyQpvuVr+iE42w3zECQnx4B/BY0YhNgkjS3e/u1Rdfbieu7Hg6u26ucNcv0mLPdrerg9uqRPxF
	zqH9jIQ2bkmIHlbvhRFr0x0J56I+JO9zbFoAAmw==
X-Google-Smtp-Source: AGHT+IGmwaMXnIIeUIA6Bhmf0jz+VJ67d+9hoLzM+6q8PV0Woj1UIg0FkmlH8MD2QBtjAqYNuO4XZHGyfTuC4wsmq/c=
X-Received: by 2002:a25:aa67:0:b0:dcc:4a0a:d0ba with SMTP id
 s94-20020a25aa67000000b00dcc4a0ad0bamr1554828ybi.63.1709199378444; Thu, 29
 Feb 2024 01:36:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228-mbly-gpio-v2-0-3ba757474006@bootlin.com> <20240228-mbly-gpio-v2-22-3ba757474006@bootlin.com>
In-Reply-To: <20240228-mbly-gpio-v2-22-3ba757474006@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Feb 2024 10:36:07 +0100
Message-ID: <CACRpkdZ01WqbRDA2B-8cM98RkPtcRbpf06oF2xHhYdfHqPhACQ@mail.gmail.com>
Subject: Re: [PATCH v2 22/30] gpio: nomadik: support shared GPIO IRQs
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 28, 2024 at 12:28=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@boot=
lin.com> wrote:

> Support a single IRQs used by multiple GPIO banks. Change the IRQ
> handler type from a chained handler (as used by gpiolib
> for ->parent_handler) to a threaded IRQ.
>
> Use the generic_handle_domain_irq_safe() helper. The non-safe version
> must be called in a no-IRQ context.
>
> The Mobileye EyeQ5 platform uses this GPIO controller and share an IRQ
> for its two banks.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Patch applied!

Yours,
Linus Walleij

