Return-Path: <linux-gpio+bounces-18206-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C66DFA7A468
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Apr 2025 15:57:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D5B667A6458
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Apr 2025 13:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E213124EA83;
	Thu,  3 Apr 2025 13:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="gnLvg6sS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6B424E4A7
	for <linux-gpio@vger.kernel.org>; Thu,  3 Apr 2025 13:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743688612; cv=none; b=c3QxwdlYNlG2WQfDK0PMHBkT4JSoH5J3IoDDkx1SRN6PDKTaSMqUXqoY2wjZie/nVkfQ2Xi6Y6Zr1ofL+eAggRoYITpDZwFZsy7964pLKAQsoLWAj6+U5Y59rWnhbBPtM8OlqsxfCACUUgoNhl9kA4aq8lRYt+laENmFqc/QAZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743688612; c=relaxed/simple;
	bh=vL1Fbgp526X3IYUv3jqvaisXbeRKQFXoMWoQUDtRM58=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XU6VQHIICgOLRukgRMKRfLTdhc0oWpbGYYiF/v/VFbxeWuzwXURMN7wSfcq2gmLtg9o5pgqsnM3hMog92nVFtXU/JmS9kOOg3yQO7PiJfqsIUxSo+c6fPlpM7uGNfnnvUrWDNXahYoQm+5xvBEXA1LcRuRiE1XiF93+WiV25DKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=gnLvg6sS; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30c2d427194so9395841fa.0
        for <linux-gpio@vger.kernel.org>; Thu, 03 Apr 2025 06:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1743688609; x=1744293409; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vL1Fbgp526X3IYUv3jqvaisXbeRKQFXoMWoQUDtRM58=;
        b=gnLvg6sS/676/EWEUTXuLojLRftFFoGXwlZsb4uMzhR8XYCPUXE1kNfzGx4+sfcQyg
         72QEWNvUc83iXaOwVuDlHiWXmjepK9NKhMoU+cK0AB8C0kANVBLOBgZ3EBUizzK3EHaU
         0WUsgR2XozY3eGZMyvVU6b9+TIR7OENrsWyV5ScgoQ18UNjJ6OH/FCatZIG7Z6xR2cXa
         s3JYlHFfGfWi+2szzC7du3PrJLz0WInrsfDh/k8XnMfs0wtq+wQi6rQLPOe5CCZRA7cA
         NamEVCDilZUfzQeir90wLEbTErKRTroIvOTguFoLY9YpxtAtQx/iRjdeR6kRHGrOELER
         JPyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743688609; x=1744293409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vL1Fbgp526X3IYUv3jqvaisXbeRKQFXoMWoQUDtRM58=;
        b=b8PK4lepEMl2UAPy80QThxMdNTTtlQpyCHmz8aEBydqnvaARLeKYPp+67jnX6e64XT
         qdYe5UXmf0OT3/UlTpbJQe0lpszqFL2tBDQpKWsKMKcJmwDAdVmCaRQunav0ZmR7eqTs
         +GnOxl5NbeBqLbBaZ2oMVndEQOlIFXOBzwlgqpFIHHBmysuOSSGsrZFEyfrpZssBovZT
         MF+lhyJmXAoQyOzm3LEmUlUejDwMc5vpNcAH88mVI5KGR14eveDEqj2xIENxf54o0O9I
         U0jE1jP9wnr6gHKgOaJNSX0zeyz38zyazn6OOXezI4bkqNlUdjr6YABS0WocmZ5Vdi83
         BQnA==
X-Forwarded-Encrypted: i=1; AJvYcCW3pOyh/kY0qomwoYb3muZk5m73VD5Rm0AnAR80CSARk/jX2dDQUPdMseYeRzztV9W5Dv7ENhsUw4bY@vger.kernel.org
X-Gm-Message-State: AOJu0YzhLPZ2edkqeOqFp6Mo24k2elKR0Np+bJI3Pk/zWu+YGBLfoucm
	al5x4xQbuKbsVdhUk6+pAxIsiBo3sGyNYLx2fQFOZhJE6QyHLR8sFraPhcqr78sBTGNVRgzY+7g
	j8fWLgcxIq8pzr5gU0LK3z46PEQ/S3AApIJ6hMRe9uFYfYtJe
X-Gm-Gg: ASbGncuNO01nF4ogcdEYSgJ8V7BokIq8UCy8aC75wEFBqZHeIqRzBtbuUrSI+gcrjyd
	HzSWB39A9sA8TdeN4cpyuPV0DJ7/1ljiHpAxUa/xdfdd8YqIUTWLs0hC67vbqQdTlULZTSgDkPl
	Ti/4MvO5STwglhzOynZekQIUolVaooaImEZDjIBChEbHhkDeuJKJyBQyoP
X-Google-Smtp-Source: AGHT+IEZq8E9hUMdI8woaEMXoL4h1fGDLU3IWtKUPdoaZP6pLIF3F/ze7rrIOIyIeiS4I9dFtpAdyL29xHsoa9HtLBw=
X-Received: by 2002:a2e:a106:0:b0:30b:d474:12d1 with SMTP id
 38308e7fff4ca-30f02c0049bmr10396971fa.30.1743688608736; Thu, 03 Apr 2025
 06:56:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250326173838.4617-1-francesco@dolcini.it> <174368202234.27533.1000100252310062471.b4-ty@linaro.org>
 <Z-6TGnGUEd4JkANQ@black.fi.intel.com>
In-Reply-To: <Z-6TGnGUEd4JkANQ@black.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 3 Apr 2025 15:56:37 +0200
X-Gm-Features: AQ5f1JoNS8eoE-Q6tSfDVMvkGBz_l6XQrBcrR5WM1qQ5o9XFEN8_s2-duQ2N2l0
Message-ID: <CAMRc=Me15MyNJiU9E-E2R9yHZ4XaS=zAuETvzKFh8=K0B4rKPw@mail.gmail.com>
Subject: Re: [PATCH v1] gpio: pca953x: fix IRQ storm on system wake up
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Francesco Dolcini <francesco@dolcini.it>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, 
	stable@vger.kernel.org, Francesco Dolcini <francesco.dolcini@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 3, 2025 at 3:54=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> +Cc: Geert
>
> On Thu, Apr 03, 2025 at 02:07:05PM +0200, Bartosz Golaszewski wrote:
> > On Wed, 26 Mar 2025 18:38:38 +0100, Francesco Dolcini wrote:
>
> > > If an input changes state during wake-up and is used as an interrupt
> > > source, the IRQ handler reads the volatile input register to clear th=
e
> > > interrupt mask and deassert the IRQ line. However, the IRQ handler is
> > > triggered before access to the register is granted, causing the read
> > > operation to fail.
> > >
> > > As a result, the IRQ handler enters a loop, repeatedly printing the
> > > "failed reading register" message, until `pca953x_resume` is eventual=
ly
> > > called, which restores the driver context and enables access to
> > > registers.
>
> [...]
>
> > Applied, thanks!
>
> Won't this regress as it happens the last time [1]?
>
> [1]: https://lore.kernel.org/linux-gpio/CAMuHMdVnKX23yi7ir1LVxfXAMeeWMFzM=
+cdgSSTNjpn1OnC2xw@mail.gmail.com/
>

Ah, good catch. I'm wondering what the right fix here is but don't
really have any ideas at the moment. Any hints are appreciated.

For now, I'm dropping it.

Bart

