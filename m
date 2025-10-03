Return-Path: <linux-gpio+bounces-26776-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E14D5BB6357
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Oct 2025 10:03:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6845D4E3973
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Oct 2025 08:03:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6640D2641EE;
	Fri,  3 Oct 2025 08:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="anGi7FIe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09DF235063
	for <linux-gpio@vger.kernel.org>; Fri,  3 Oct 2025 08:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759478613; cv=none; b=WQBIhbiz6m+PL1qK7dU3Pd2vWBuyo9dnsCkq8Ji5Gv+RgcxBfWVILt0YwcPmcW9BI/L4LG8j9A4ICRdc6NKoF6uA6TQ23/nNjQVLzYTx+XOIYM1UHr1ZGB78I8CeOHMj//108/kl3FL5PBH1L3Vlfi/j+npaIOSiFztrWjZ9Ngc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759478613; c=relaxed/simple;
	bh=Tn6OdQEr8XVdAqEx3+HNvbieAPgE9iCGbOGXxcvqocc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UPNjnOc29estny0zVov/Sih0BKdgm5IePxOK0fam7fn9JR5QfywOX1t9tgvDQBnR2MKQJIEHM94s1N+/z4VytueK2BAETg2I2Sq6VCmUc6bgBK1bD1kUAs6sPFM2b8SR0mMDZAklefRuz/htT24aBSbq1GGoekgo+QkWUHxRMg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=anGi7FIe; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-36a6a39752bso21235801fa.0
        for <linux-gpio@vger.kernel.org>; Fri, 03 Oct 2025 01:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759478609; x=1760083409; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tn6OdQEr8XVdAqEx3+HNvbieAPgE9iCGbOGXxcvqocc=;
        b=anGi7FIeHk3rhZ/71lHGwH6BHBNm2Mr9ymqRKp3iSsnzYKi+4Hx6524fKGjCtupHHr
         9v2+KbJge8rndvU4sT6zMcIgrqMevaGlA577wK++Siyb546laVFqq6xRd9OfWeslwAZq
         6expFd7kzFGzvBgnlfbu+eiT6QrQ1SuQ+HdNojiWHp3OZlkLPnYba8qG+K8ZBB71XOSE
         cUh1MYzD+uxwCJ4tZY/aI+IxylWDA/auEPGiqQqfQ+ybkLmY+aAcGkxweyMrClMF4Ohu
         YCB9WpPFzAmA6KHvYxYjeyOAGKgCtfjsI5Nn8Chi3zfCrYJyM4b8MTon1oNKBlhRhFBw
         7JDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759478609; x=1760083409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tn6OdQEr8XVdAqEx3+HNvbieAPgE9iCGbOGXxcvqocc=;
        b=NEUfU/bwVWKT/EZWyYpAqp+CUwl3ejahJ/TU1MYatYYvCGCOGyYQeL1UinRB3IHxZp
         W3VaKtBLzEX1UgPv5FO1u5btP+1ZSeAquVXzTVErCLwEjlj8tZ7JGRXcxO9kd9pYga/j
         t5JNvcp58tnEqtkPXUKcjBg92854vKUJLw+rz6ttzprVjSO6za7JN6sa3SfYDOlAnNEy
         2FjTubAZfaL/eLPC37uH4oam5Ih0l5bDec/N7t7oN6gXYizNa1pISpsRPOOeUaUMa8qL
         7+HSLd2wMSXjGaQw2gcVHQw7rU7yu4fYx/7aVJKixd+FgOGlhzvWy/Ol7jfmf8qfzCkk
         Mo8g==
X-Forwarded-Encrypted: i=1; AJvYcCXH8Ay6JuLTWiLTAAzmFnD1wH7uVL6g76X4vwh/BmF0pwEoCw/65pK8xL3BumxXDA8CxVXKwSXCSn/B@vger.kernel.org
X-Gm-Message-State: AOJu0YxozesGfQMRJSfq+9sAcNpsU5ps3ZIphNjoKEpbOBM+69wc7ZQx
	vk85F2VnSO+hiq1IK+40HzrLYOdICj890jPqijda+7sHLmvj8QJHpaL7REN40Wbdx3WPt+839KX
	7nXyfV/p8eivPyqpwDa9pQWRVQ+8vhejUhKVlpFwX+g==
X-Gm-Gg: ASbGnctE7jM15WJnd3G4STZ4UFL3gsfJ8Xse+sR/60GZugc3Xr/1Stnnzhuut5tv3a1
	qHkBf0TTHF0dFkER6ZtDHm/Tk56nhfUPDNaI1sXBgcAw/QVmPxH4r9hyn4f1soJORCXawKEMn+z
	sVKYoikkZSXoQ8vA99sNFyGbfpoPjdsnkJtGvxMaGto82AbeXJLRU2H4oi4BtG5rICZfZgHg7FZ
	GTKZH6dYfXIwFuJhb3f6g6H37T898E3vw9pt/X+8yddpkr1Ey34bamT0bQzubaFZF9Aias6
X-Google-Smtp-Source: AGHT+IFyQ5SUlbaZKyC2n/giNpyOPrAzduQsXL67RzSc+/XD7ohW54+y3L1jWlwiS/5sdocrcIvEn67wqltom/d/bVU=
X-Received: by 2002:a2e:bc8c:0:b0:337:e5fc:d2d with SMTP id
 38308e7fff4ca-374c37eb3f8mr6316451fa.24.1759478608652; Fri, 03 Oct 2025
 01:03:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251002215759.1836706-1-markus.probst@posteo.de>
In-Reply-To: <20251002215759.1836706-1-markus.probst@posteo.de>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 3 Oct 2025 10:03:16 +0200
X-Gm-Features: AS18NWAb_UicKSU3Hkbg1b38gS-dxjPWCSbdeYjPWZM22VcaOTqo95Y1mZFMQ6U
Message-ID: <CAMRc=Me3VLbmRksbrHmOdw8NxN7sxXjeuNFb9=6DzE=uLn0oAA@mail.gmail.com>
Subject: Re: [PATCH] gpio: of: make it possible to reference gpios probed in
 acpi in device tree
To: Markus Probst <markus.probst@posteo.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <westeri@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 2, 2025 at 11:58=E2=80=AFPM Markus Probst <markus.probst@posteo=
.de> wrote:
>
> sometimes it is necessary to use both acpi and device tree to declare

This is a rather controversial change so "sometimes" is not convincing
me. I would like to see a user of this added in upstream to consider
it.

> devices. Not every gpio device driver which has an acpi_match_table has
> an of_match table (e.g. amd-pinctrl). Furthermore gpio is an device which

What is the use-case here because I'm unable to wrap my head around
it? Referencing devices described in ACPI from DT? How would the
associated DT source look like?

Bart

> can't be easily disabled in acpi and then redeclared in device tree, as
> it often gets used by other devices declared in acpi (e.g. via GpioInt or
> GpioIo). Thus a disable of acpi and migration to device tree is not alway=
s
> possible or very time consuming, while acpi by itself is very limited and
> not always sufficient. This won't affect most configurations, as most of
> the time either CONFIG_ACPI or CONFIG_OF gets enabled, not both.
>
> Signed-off-by: Markus Probst <markus.probst@posteo.de>
> ---

