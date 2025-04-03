Return-Path: <linux-gpio+bounces-18198-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEEEA7A238
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Apr 2025 13:57:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34775173A25
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Apr 2025 11:57:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0778824C07C;
	Thu,  3 Apr 2025 11:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="nXN35pJV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B806224B0C
	for <linux-gpio@vger.kernel.org>; Thu,  3 Apr 2025 11:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743681456; cv=none; b=Km4T/fPjrn321Gmoo5r6P29t9eCEPH8bmH+3ouc5sjnQmUjrqQzaYPQh0UHbG5b4JmOMSVNp/NA4tmoiWwShFMbUuASDfw4Uot5XIsZQDEAQE6Ur8+gV2s2bpQi0NK8jPnGW+B8lMLsWr4VPiTnyppxvzMMfXF0yUMXO5kQ7iyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743681456; c=relaxed/simple;
	bh=7RumA3X5eB7LdNlJXXDsoSjZ7aj/drzqeBxe1DW71xw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W8/q3msKW5JhX9l1Al16rWjfOORdrrYC7KIeN4k4ha70MlW4rbh+VcWue6FaeWepyyBCdHjgtfiJp9/1wA7/UaiMYOWXrzznPhc1iAEnY7W4aAbuCIjf+A83B56lW3iIn/tfP6ACT5K+J53O2SQyOHgpIKW3SDiBXzFDiBgwzmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=nXN35pJV; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-548430564d9so713932e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 03 Apr 2025 04:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1743681453; x=1744286253; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qkOktHGlzjAkXagwjlA6YI1+PYwTvY9/fqcii/7p6HI=;
        b=nXN35pJV0C89hgcKghGD6dr09VFh51dAELeuUjSxYij76Sff1JpDDRgAuVzwzQM0E4
         GbU4EsrCIycxe5pS+j+ZRCfTjecOqTKfpZKENBNYg3N7HlDD4CH0ky9RDcBVaA7YFwm6
         oMgE0leusXNQl00mdUOXJxzhWK0WBot0jRjC4HBUFZSK2hb/Hp3oL3AqXzOMLYVfpL0b
         nbJTRyPNlqgFNO4R6OWkQDSh/N5PPkvjh9lRL8yY71b6+EN0VWgaCKbKDkfXpAJ4m6ch
         1EvO1+ne329l9bhy9+Ku9pbRyKUdjE+MoRK2IXvYDEuE9zWfY3Hv9p0G6g6jGBd7AZbt
         ctKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743681453; x=1744286253;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qkOktHGlzjAkXagwjlA6YI1+PYwTvY9/fqcii/7p6HI=;
        b=ujO1cV+vf+aYkrS/I/EUbzg4TahtkMSgNenHVjPGVTPYvx60TnqNvOwwOyHmcHS3n5
         j51icMTFxlEtW8FaxH6Jg5A3L4viRdHDKu3rFcI37EFHUeeXvG9BuA3bdBS/dyKD7Dp2
         hTwF1avpkewbQ0c+ZO06Rkm+oWnH7D2PzA96saxz78REbziUUEHIWWmn/frkRNh1fsjB
         wH+bOd0BF/fyapZhPodwJHCKlENuDBj+Wucleb/rQVs+tahKhR21w0vXaM4oW1XHBRZY
         EhWf+PnYo6IrJ9VLeW68o5sqamkMGLKYQo2lejdm0bDiEV74xJBYpmORZOcDANsxG9Zd
         pxmg==
X-Forwarded-Encrypted: i=1; AJvYcCV3t7mueTQYbTCYUc4JpgFPq66hmhRhL9RG+uUKt9ZFn3pcfWydNjY76S40Jz6if98qunjJqjvYS2C3@vger.kernel.org
X-Gm-Message-State: AOJu0YzWM+TVHHL3mleFp0xT2MJ3AWTh1BqK5PoURVgdj80NKuQ/WyJa
	F7CEX+igovDNn3cCjJhbBRNl25CDeQMpkj3jANHv/jV1TI7cmVEuHoenkM/Kpwu83RDBfKT0EzH
	nNkA9v6HK6SqEecfhfiVjaRBohwMrIO6xWo5cNQ==
X-Gm-Gg: ASbGncupmpXDkIEEgjpBdazCRdBqDZ/izvFFb6Kv08Td84xMpoJLKPThInF+jIouFJk
	CLcqQZZTjTk/lG6FeazQs04R+lJ/eM53F2+DriUZPmEFB8yWvVqcJpqkaGgAa2xNJP5YdrwaG3/
	hRNBPsSadmsP10y0qW2DCdmHkKxo3ipE56JIfKqFKZlmGHn2BT88Wzx1IY
X-Google-Smtp-Source: AGHT+IEJOnKqMX5+dgmSPUxCOsMR6NccyLGkvgLJRbiRfJodYmSW6tCZcu76/+/XfCMur6jjpB+I1EXvHvccn5hkhG0=
X-Received: by 2002:a05:6512:3b25:b0:545:c1e:65fb with SMTP id
 2adb3069b0e04-54c19c5c517mr1842371e87.18.1743681453030; Thu, 03 Apr 2025
 04:57:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402122301.1517463-1-andriy.shevchenko@linux.intel.com>
 <20250402122301.1517463-5-andriy.shevchenko@linux.intel.com>
 <20250403103506.GJ3152277@black.fi.intel.com> <Z-5rJDWaSJd58lTa@smile.fi.intel.com>
In-Reply-To: <Z-5rJDWaSJd58lTa@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 3 Apr 2025 13:57:22 +0200
X-Gm-Features: AQ5f1JqR55KMuRFut8zPE2h0a1E_W5eZhlgdejLJXansH_I-MmaaezYhi6oZpYs
Message-ID: <CAMRc=Mc3YUsLm5dX0b3rFsuCErf0WmyyYtXZgDYBt0w+xwqkCQ@mail.gmail.com>
Subject: Re: [PATCH v1 4/5] gpiolib: acpi: Reuse struct acpi_gpio_params in
 struct acpi_gpio_lookup
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mika Westerberg <westeri@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 3, 2025 at 1:04=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Apr 03, 2025 at 01:35:06PM +0300, Mika Westerberg wrote:
> > On Wed, Apr 02, 2025 at 03:21:19PM +0300, Andy Shevchenko wrote:
> > > Some of the contents of struct acpi_gpio_lookup repeats what we have
> > > in the struct acpi_gpio_params. Reuse the latter in the former.
>
> > > +   struct acpi_gpio_params par;
> >
> > params is better name
>
> It's been already used elsewhere in the code. Do you want renaming there =
as
> well for consistency's sake?
>

+1 for using param or params here and elsewhere. It's much better than par.

Bart

