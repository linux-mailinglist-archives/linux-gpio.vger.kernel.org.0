Return-Path: <linux-gpio+bounces-27468-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 45882BFC64F
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 16:08:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C654C622B99
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 13:50:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 393EC34887F;
	Wed, 22 Oct 2025 13:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DHaW3NDe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31609348474
	for <linux-gpio@vger.kernel.org>; Wed, 22 Oct 2025 13:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761140896; cv=none; b=fYJewz+OI9aUyLeQcXtvEcBfplI01DqisQcnTYhPlcQIhXEkz2OO3aYKDIKK/8Dv8YNjsVEL0W+60Kb+mwFX41F+wxl3sYoSmcgCKnpxmmWOPuSPKa0UQl78j95lTv5XNn3cIglMB0hUTWdZRd/3SghcDBhQEaQcgLzPpNPKoWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761140896; c=relaxed/simple;
	bh=aYT6Os1q2Rohj9KWPycuJw6XL0ogAAvatT1CGliGFF8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KDSOnw6j3aSjW/udtP6JlY2llvlW7q16lpnwVvcKgxKwuqUh4OL6TbzCCeHSXg1yjHrPQfNtPpzte9DQw0Q22y2LmrK2YwpJMUeHqeIarnKgB9ZGzBUJVq5ADoJPUMVNnUGeLcRZlSI18nFxweOGYbeBztpM8AN0gW/lTSfrjmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DHaW3NDe; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b626a4cd9d6so1361247766b.3
        for <linux-gpio@vger.kernel.org>; Wed, 22 Oct 2025 06:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761140892; x=1761745692; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aYT6Os1q2Rohj9KWPycuJw6XL0ogAAvatT1CGliGFF8=;
        b=DHaW3NDev1RDSphTbDxQD251qxiDChfS61xdvO0IDpC1JxWRGuCTmbqFPp7bRlTEbH
         J0c92Q/jB1nKojacP1C/x0eyPH1ZyQaBKZUJmEJ9a7MEo2s5RWJVhw77mkAKrh5liwtV
         PJJ+pGcGVv5y1LXkUjTPCOl1fl3FWrdghLdrW80WSGYvUqaP6kcYoevWjNXw9dtraHER
         Z+Dmp5l+6/7jaS4xCLH9WfHPJgOQiyoIqPrzCeO5s0Ve3TBooRJBIVHS3y5kybHdA+7A
         8L4DWh25aYfB0aoQv5HR25kGnZFsw7uPlHHj9KRRtqfVEK1E10Xh7CcZRsZYKxQ9Tcbv
         tdMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761140892; x=1761745692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aYT6Os1q2Rohj9KWPycuJw6XL0ogAAvatT1CGliGFF8=;
        b=fM86edh5xi8cEieh6DQW6niVZF3SAEiHOao+WYtQmfd94GHOY3f+xROpuCqDvs2mZH
         9EcvTmYXHYmWBaJdbI6qiSrPs2H09tVtRqz233g4raq6P68k/2IIcHCRak9s8S1uIomC
         gY37mMhT4WDCKAMiqapmwXALZpBEVX2SGr+wEwEPp8zot0919cccEvrQtILK0Vby1x31
         S1/JbIZfyFUglmRgk9Q3YyJfO+Tu2ciqRmIKXevsmwYGRWVvl3vnYKmwd05Vkr8RzeHd
         gCREC+DrwsgqQsSvW96GFH/3lohlj/hmLqpIMKq1FOfWJ0N+EMvKjjlOD5QHBkEPkluJ
         f/Sg==
X-Forwarded-Encrypted: i=1; AJvYcCWmEFmREXpA6txx4YiwK46JmjuzVykUYSLVsO7uDiMnJ6iX6JLYP/0RS8wJbIDCwRPj9+4lUmwGJ5/c@vger.kernel.org
X-Gm-Message-State: AOJu0YzOMYGkXEkjR+bl37yhfGWmeIVueS+MdJvBUji6LN+LdslVA+yO
	2U4/KTjTyZSPWQDfKI2040RxrsYKd0o7ClaS8nAb8oR1xXcUn/enKTf17uGNksws2clSGWTy9hv
	kHMiOGKS9bgwS61tH0uep+bSgGcgG4ws=
X-Gm-Gg: ASbGncuo/Ue+DX4n7+M5yuh3UlyyCYvacqYT8xWyG7YRh7eTuxlxi1l143dM9DGrKzq
	rNDhTJ02xgdBMclfIw0DTnvBhRA4Qpr9czqe0k/KZwpuhDVNBNzSEGUbzprcvkIADtKGTsjCr5G
	W59NnqhSt4Yz3yrQ8suz2hUnBrSfcATeUXYWpK1uLOPbH7trnB1A1R8/EDbnK60w00aoENZaqQq
	gZ95C6fg5VXhDV2UNU+lcOXkayvGwljBrTHk2zRpbkMKX+ixvqB/K/wL9Ne+35ldCdi5FST
X-Google-Smtp-Source: AGHT+IEuV7ok09UjY4sSyg8xFKgHnnOuV/JfYn1sZVkbPUVR5FFRF22mq8r+kNUqlJQt2/5X3tjoeoegXNFBatkKhxo=
X-Received: by 2002:a17:907:72d3:b0:b3b:4e6:46e6 with SMTP id
 a640c23a62f3a-b6472c6191dmr2347267866b.1.1761140892136; Wed, 22 Oct 2025
 06:48:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022133715.331241-1-hansg@kernel.org> <20251022133715.331241-2-hansg@kernel.org>
In-Reply-To: <20251022133715.331241-2-hansg@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 22 Oct 2025 16:47:34 +0300
X-Gm-Features: AS18NWBj2gBYFMQcocMtRK0flD8nTDu1ZgBmGY1rHhMmb1QfH--tXoq-ijJYeDk
Message-ID: <CAHp75VcDmafp4fiOH7LqhPqtTX5BEp1w0eA5UMk13U=2_tHsyA@mail.gmail.com>
Subject: Re: [REGRESSION FIX resend 1/1] gpiolib: acpi: Make set debounce
 errors non fatal
To: Hans de Goede <hansg@kernel.org>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-acpi@vger.kernel.org, stable@vger.kernel.org, 
	Mario Limonciello <superm1@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 4:37=E2=80=AFPM Hans de Goede <hansg@kernel.org> wr=
ote:
>
> Commit 16c07342b542 ("gpiolib: acpi: Program debounce when finding GPIO")
> adds a gpio_set_debounce_timeout() call to acpi_find_gpio() and makes
> acpi_find_gpio() fail if this fails.
>
> But gpio_set_debounce_timeout() failing is a somewhat normal occurrence,
> since not all debounce values are supported on all GPIO/pinctrl chips.
>
> Making this an error for example break getting the card-detect GPIO for
> the micro-sd slot found on many Bay Trail tablets, breaking support for
> the micro-sd slot on these tablets.
>
> acpi_request_own_gpiod() already treats gpio_set_debounce_timeout()
> failures as non-fatal, just warning about them.
>
> Add a acpi_gpio_set_debounce_timeout() helper which wraps
> gpio_set_debounce_timeout() and warns on failures and replace both existi=
ng
> gpio_set_debounce_timeout() calls with the helper.
>
> Since the helper only warns on failures this fixes the card-detect issue.

Acked-by: Andy Shevchenko <andy@kernel.org>
if Bart wants to take this directly.

--=20
With Best Regards,
Andy Shevchenko

