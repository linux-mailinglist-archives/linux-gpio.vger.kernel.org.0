Return-Path: <linux-gpio+bounces-5050-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA70896FB2
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Apr 2024 15:00:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E7F31F2A6FF
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Apr 2024 13:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10E5A1487C9;
	Wed,  3 Apr 2024 12:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="UTWes3r+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1C3148318
	for <linux-gpio@vger.kernel.org>; Wed,  3 Apr 2024 12:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712149187; cv=none; b=kbMG/kF9/PXPJEMN7DKCODlsE9xGxO6AxV6SbPRzqBVfSm438d4Zzdoash+gVDt3mCzUhfPUJr4hlVH3mEX6ZOVM8IBYUJO9QicpH46P51mv2VYtszkmcneG2UFPGdY7aWWnjfxSYsuVnHY1/BqKDxdOKh4gbPcAb50cm33bQ94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712149187; c=relaxed/simple;
	bh=5znrIQEcLDepj8i0BYxKYfip8Zq6prw6jMC2mOgF7wQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l0rM++26X8J7huvCzU9wzeeF6IMIvrS7Vud9dQQsvntZhI9IMnH5WR+lVDkYlCP0VM9ciJen9Wi2/IZm/ahywJQ3BGfA9WbRWW7n3MViKv8W4QkDIGDw5T33y8wAXLmwmhhQUJSTru6CWjBVDPYq0c0zDxwOlHLaHndeIeYdYK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=UTWes3r+; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-516c1f534caso247914e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 03 Apr 2024 05:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1712149184; x=1712753984; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hec3c6A5LUTzdEAyLK3WFDfOKLWpwfFK7uM79F0PJ2w=;
        b=UTWes3r+d3/ZHHxsnIsd1Xvmh0Tg2ivNZCwNJvt0G5Q/+koPUKqcN8ZvIpaXSUdULz
         OoalHeXJvepyV15h4eZwPCRLYal6ZMm2er3nhjB2q6z3RIEozAoH8Tu+cCSxW2cdyA68
         IrzkD/4zYOIiiB9BWafsGX1bxAzgNj5eyCcfkxSakLtHyd2jpdhQ+Y16qTx1sVF1FOq/
         pZPI0Isl0RN3kA4H48GXiOH4KfFbGZcfBIcfOMK34O0z6ZDwvfL5aYhcF1l9kXjYn0Ye
         XrhlOhuLKScGanTM5dPV4eVmJcZAcWRFx9LdWE/hnkeJx47rIwyZ0pkxgUVAFiRLKSUH
         f3HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712149184; x=1712753984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hec3c6A5LUTzdEAyLK3WFDfOKLWpwfFK7uM79F0PJ2w=;
        b=tU0ELUDz9N896l1U6S5lT+txyUaEt4kZD6oVr8lXyupwgkDX00lMt1V8+vsmV/ZKZo
         j51dnHq0WjPUqxOUmoGN2mHelkMUZcHvmse5vL6fN1w4mfY234uJTVoRQsUh4fhuBnFS
         V/wTlogVqSecMq3zfdEQgeVWYDI/lzFUhT15bI1WoNDvmwUAwfS4TUNCHSTRhY6uf7l2
         J29kfqCbaeXc9Y/zE7qtAWPUL7xN7p/m74GL05PeSN8KxBhosMaTPSsDRt8tgfNAsgra
         s9ManuqWutW1+RodxXGxwJeB2cVo2kFmga1jrS8PAHKrVXfaap+OAc4DVu54jmReXxZW
         ppZg==
X-Forwarded-Encrypted: i=1; AJvYcCXN8vBBBtDHSVZHJJ32FP8gio1kE+xkZIcNL/atZZjeNb+TKx/QqymdJOnj9zTOZV0W5LVFlpUdqJdQp6Ri1kLNOBiV0Eli3BQfRA==
X-Gm-Message-State: AOJu0YyGQjwFH+fBSoPgCxDHFoeGeeVy86NWOUkImO9OHYqxtphfXHdT
	n6a1X54HgyxfsNIac3kV1kaITttlo8hwQcgKhVN6TA+nPLAI5l1iKH7jGalgi29FNMzx6zQMxa+
	EdPiYU/0Bl4MJ19iMkZmKDGv1iKyV2+viFAi9HQ==
X-Google-Smtp-Source: AGHT+IH2z5uVLQK954WX2i3Z0bS960gVfaLsQFcEt6rPL5qfRi0Q1S7IvXkYMM4JHde/wkWdVUiNankcoCg4yXsKE/o=
X-Received: by 2002:a2e:8697:0:b0:2d6:ba1e:a54a with SMTP id
 l23-20020a2e8697000000b002d6ba1ea54amr3641702lji.51.1712149184111; Wed, 03
 Apr 2024 05:59:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240326181247.1419138-1-andriy.shevchenko@linux.intel.com> <20240326181247.1419138-3-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240326181247.1419138-3-andriy.shevchenko@linux.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 3 Apr 2024 14:59:32 +0200
Message-ID: <CAMRc=Mf3y4EUSVte9Y5VyTDAFFKHXtM5RSz=MDeHhOVBeqPtmw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] gpiolib: Up to date the kernel documentation
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 26, 2024 at 7:12=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> There are several issues:
>
> - Reference to the non-existing or only single functions out of possible
>   callees
>
> - No return section
>
> $ scripts/kernel-doc -v -none -Wall drivers/gpio/gpiolib* 2>&1 | grep -w =
warning | wc -l
> 67
>
> - Reference to NULL as %NULL in a few cases
>
> - Explicit reference to error codes as Exxx or %Exxx and
>   numbers with leading %
>
> - Spelling of gpio, irq, SOC (in different capitalization)
>
> - Unaligned style of irqchip, gpiochip references
>
> - Unaligned style of NOTE, FIXME, and TODO
>
> Fix all these. While at it, fix multi-line comment style as well.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Could you split it into separate patches by subject (one for
capitalization, one for %NULL, etc.)? As is, it's a huge dump that's
hard to review.

Bart

