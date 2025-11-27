Return-Path: <linux-gpio+bounces-29165-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 79776C8F7A6
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Nov 2025 17:16:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C79B53A81E1
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Nov 2025 16:16:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93E592C2AA2;
	Thu, 27 Nov 2025 16:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KPs5FdL0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE9629D288
	for <linux-gpio@vger.kernel.org>; Thu, 27 Nov 2025 16:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764260204; cv=none; b=VXOgvGjc64M4B/zbvuAntvu0+wUPJRhd+E9Xzw88emdmhWsdOzT696jOdQoIE2S6ZbOHyOdBWl2+dqz0GXMjy2wgjXf8NeYbqX2L4B6QzvRrPk+PMhaU+WrLolIaq9lcpE4snr9s9R1gw1IlS4hTaCtEXNACx6IsPqLxXhfSN7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764260204; c=relaxed/simple;
	bh=xDypKOX/n6GRcGDAU8VyLfV/rY9GENv82TIM6XTxRto=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fmXb6ff6cUEkT4UqLz9f7q8LdrnXjMx1lfH91sSWXTM01IjXOaDRzqI/p+HHptBOZqPXLytSETO92H4l1SV6FkyLNvsgHN0YP17OxpTjH/Ec57L6SPuP/ymp7EAcIYHf9yma93NvVvgqDaxJtNye8rrDq2rjd3Ox+t38CbPMq4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KPs5FdL0; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b737c6c13e1so193183466b.3
        for <linux-gpio@vger.kernel.org>; Thu, 27 Nov 2025 08:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764260200; x=1764865000; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KNO28PzgIsx+2Ndb8A3ECc1R+7TzxXSai5xVu+osWaY=;
        b=KPs5FdL04I8adeZnQ9V4xT1D/R21qLv4bEymY7y1NKEsv1aSHOxF7+0WOhOANz6hEu
         H0t9EqE3YzDceOOA3aOZJ50d9mUgX6KkcBRvBSfaqWx0Vx5/aQXfdqzXkhrn9NrISEpq
         FNhREaJi6TU+fIpTf4p3drfvf7RVIdc9L2+mIuGhqUNNVtnf4tdoPBB0GJ8B1hso97xG
         XEQnXkv895T5F58P8cYDt+Z/7cV2HHFfsC5TbUh7o34q52u+qWHcnDjbG1vyCouftlhm
         Ojjghv40AkxBRREjFwcO5yf9SysAncr+yoDaaiYIpcUnwfWjCWKTlUaJcVSdFALHypzg
         bynw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764260200; x=1764865000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KNO28PzgIsx+2Ndb8A3ECc1R+7TzxXSai5xVu+osWaY=;
        b=DMcVTsIncHmapqNOk7KG8cq7sMTIbZ15R1lNdg8rWSfbDcL2fmp4Z8tSr+VUiasCrW
         jJAGk2m2epeienZFhq3HOw+midqUqOvqMZgeeFqkcnIceKqIEwu2B2DbdNxBo5Ca5mGd
         XyrqhkPktN7GRm0MsjJ2rRAmHhcqPa33RjkHqZviNY+jeyfo3YYzm+ElYOTNZV8ArSbe
         Lx58f+S6wszDw/iX6vQPG2q26V01DLHx3cuXRjk/qSChRs+4y/17qsjKfdinG63SDB//
         MyxCR0QFnyEIHWZwEiEt5nw8kLmO3isHMg2l8iPE0XxLo4HX0kD6g8LC5YnltFWwdfzR
         7ZlA==
X-Forwarded-Encrypted: i=1; AJvYcCWWwJbCWA3WP4YfSiCvZUuIIzsxwYigv6n6BsALH4gWtbDupisANxo946I0CDhAoTIFgxPUf3Ft7x5Q@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn04zWMz3X3lGE29kGZIVHL4UEMTMn5pw7E5snEyxL8sG2dKy/
	Y6V311qppefVt2HioV64HIT6hGh7mphStw7wc1lWXmd9UzyhaWEZU0VmZzUtwhlR1T81C3sc+lZ
	lFbNARpp1Cf4VcV+s4XSS3dPbrVXZ8u0=
X-Gm-Gg: ASbGncuCY8ty/hwfU44JvGR0QToOheIWniWGsUCGfEGVxiN7XBsNIFwR6IlQnfTeL2E
	fTeF0ngOnrIqv6xDjXa5AihIhIxW4kKoFgA4GmSeQ0kNyzJJ/c0Yr9P/MoqtWMDSndV6Nz7sxrX
	DybMLBr00Tg97ig1USZ61cidF7xTGa7lGpp70XUZew4Qv+yNoTXqMzV6MlL8INgfInuFtSpgUyn
	XX7ltGE8zUDqCoK9k4Fhvw3Ojh6BQdzd22GWfsv6zlmlwEEGGpAHSYuT1VJyFz2bKfARLSas/zg
	GWI0D0O50gmyLs0ctAs3BpeMr9FH86Y8eCuBWIxNk0GEnsygtyfZKU02ZxTALaprJmZtpCs=
X-Google-Smtp-Source: AGHT+IE6et7KPZp2GkXfofcAVlXzT7muZvGR6VaoGxIvgHz2tucfIoZqOFaUmU2ZIt9fSGn6WlPk+6UoVkEjoIjxQZM=
X-Received: by 2002:a17:906:f5a5:b0:b3f:f207:b748 with SMTP id
 a640c23a62f3a-b76c547167bmr1211487466b.10.1764260200132; Thu, 27 Nov 2025
 08:16:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251127155452.42660-1-dev-josejavier.rodriguez@duagon.com>
In-Reply-To: <20251127155452.42660-1-dev-josejavier.rodriguez@duagon.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 27 Nov 2025 18:16:03 +0200
X-Gm-Features: AWmQ_bkZa2nrqUftdjH6MAYONe3JSVeW4Th2GGUqnpqYo2uuwkRVZXIvhkoPc0g
Message-ID: <CAHp75VdvJUFwFBRKT+iqwQXiK-toah3gZq6pX9Omcp6d2R7g+A@mail.gmail.com>
Subject: Re: [PATCH 0/2] mcb: Add modpost support for processing MODULE_DEVICE_TABLE
To: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
Cc: linus.walleij@linaro.org, brgl@kernel.org, jic23@kernel.org, 
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, morbidrsa@gmail.com, 
	jth@kernel.org, wim@linux-watchdog.org, linux@roeck-us.net, nathan@kernel.org, 
	nsc@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 27, 2025 at 5:56=E2=80=AFPM Jose Javier Rodriguez Barbarin
<dev-josejavier.rodriguez@duagon.com> wrote:
>
> During the process of update of one of the device drivers that are part o=
f
> mcb bus (gpio-menz127.c),

> one maintainer of the GPIO subsystem

Krzysztof? Did I miss something and he is now a (co)maintainer here?

> asked me
> why I was adding new MODULE_ALIAS when I also added the same new
> information on MODULE_DEVICE_TABLE.
>
> You can find the messages here:
>
> https://lore.kernel.org/linux-gpio/80a20b13-7c6a-4483-9741-568424f957ef@k=
ernel.org/
>
> After a deeper analysis, I came across that the mcb_table_id defined insi=
de
> MODULE_DEVICE_TABLE on all device drivers was being ignored as modpost wa=
s
> not processing the mcb MODULE_DEVICE_TABLE entries. For this reason, form=
er
> contributors were using MODULE_ALIAS for enabling mcb to autoload the
> device drivers.
>
> My proposal with these changes is to complete the mcb bus by adding
> modpost support for processing mcb MODULE_DEVICE_TABLE and removing
> MODULE_ALIAS from all device drivers as they are no longer needed.
>
> Jose Javier Rodriguez Barbarin (2):
>   mcb: Add missing modpost build support
>   mcb: Remove MODULE_ALIAS from all mcb client drivers
>
>  drivers/gpio/gpio-menz127.c            | 1 -
>  drivers/iio/adc/men_z188_adc.c         | 1 -
>  drivers/tty/serial/8250/8250_men_mcb.c | 3 ---
>  drivers/tty/serial/men_z135_uart.c     | 1 -
>  drivers/watchdog/menz69_wdt.c          | 1 -
>  scripts/mod/devicetable-offsets.c      | 3 +++
>  scripts/mod/file2alias.c               | 9 +++++++++
>  7 files changed, 12 insertions(+), 7 deletions(-)
>
> --
> 2.51.1



--=20
With Best Regards,
Andy Shevchenko

