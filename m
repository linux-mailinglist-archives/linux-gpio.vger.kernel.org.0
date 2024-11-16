Return-Path: <linux-gpio+bounces-13053-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FBA9CFF34
	for <lists+linux-gpio@lfdr.de>; Sat, 16 Nov 2024 15:12:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E9C4283731
	for <lists+linux-gpio@lfdr.de>; Sat, 16 Nov 2024 14:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CC991119A;
	Sat, 16 Nov 2024 14:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bvbxlky3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B873679F6
	for <linux-gpio@vger.kernel.org>; Sat, 16 Nov 2024 14:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731766344; cv=none; b=QgeT3pcH1D/o9yj1ngncWMaQJEUcgUnXSsUDqki+ygljxGeZBJJHhlz67uRimLhZlRPRVP2/jFJLf9mqWwAS4EB8s/Pbttjo/G8Oa0SuZFbZ3e0gGXgcuhOH7jmDms9nQw1HW6A+2CB6zeQJQkCFfE2RF6Iy6Jm6uUx+Oynj4+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731766344; c=relaxed/simple;
	bh=Ei4hNc2W7w0BschPL49y66f/AldtB3jsM3bkhJI4ohU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZLpcF/k3rVe/fyerTmmKBHddh5B+Hz8aNV50XUpHE1xOZU3OPiluGz6WTk6Y3vfG7BthEin9e1QlaE7Lk2QSsaq0YA24ixhWgG59yTV53R2PGdUA2O3hxOmU2ihql10BX29nZfyADW+yAZg14CB9OqbRielaoJ0E1w59+k/E0vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bvbxlky3; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53d9ff92ee9so3302788e87.1
        for <linux-gpio@vger.kernel.org>; Sat, 16 Nov 2024 06:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1731766340; x=1732371140; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nSOMDGJBHqykq0W0MO0tKTZ9jaOMkcUQd2K0fa+ZeiM=;
        b=bvbxlky3FgM5Zl1rvLy6f/WYblZis2xzURkgAVXYUseecVwWztO+vzpIBlRoRPOQ2x
         qkx5NO640wRfUmnuHKAKtkASdmIdYxrpidGhT63jP+zT/YUdYNNkNYv/XOx6KOuL04yN
         6gGM2Ka0Ile89EAlBkNXf0w5cnyK64FYr3IKPoptPcz819HUPoIHl///lsWVASr5hBA8
         gG2nOzYuM8WqdTuv8sf5K0q/9dBXpTd5cczObPnkWlRBvdeMHM+xECBndY9JUWURQASr
         qehCV9MHpiOXgn5XniK/YacNCiiopvlOveqvb2LI2yvno7F23XYhmH9uzMHVVtivDxpn
         Dvkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731766340; x=1732371140;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nSOMDGJBHqykq0W0MO0tKTZ9jaOMkcUQd2K0fa+ZeiM=;
        b=C0lRNFSi/EqPb6ySeciyHoGPA5l9rVdzYRx9qA4ba+KRfY7Wc/SUwgnuZfgo7iZlzr
         K3WegyhcUieHeJMjNTlssKMhi2JDN8de/nMQamW0tT4HfZ6vUJvmYJMcPgetl13VIDvT
         Ux0sSERl7XhtGpfRNWKjzledC386o52Z2AJTZdTcwiDLQW7Z4XgrU6Za076Y42s6FIZI
         jwpJVIxWygtqP6qnmMGny73nnTwtd9Hl8sZ6kiTiI9Xa7lgoa2Lwfp5ZJ93BcfT2LKfN
         gsxZcBN+Q8matGO4qb3fdqcTGHWm9PTH1Q3hH69ZbefCytkIxQYgsVk3PZtHBaP89fil
         vFvw==
X-Gm-Message-State: AOJu0YzLM98Au/B/lNAveuHI+TQpE9KYQTfv+r32TccfW4ns3uz18gp7
	OLkvoTOm5MjqQhO5HF1u6X7wAVY2QXfZrzr2xFCtz5kkuD4IseP7HTWzDFhuGm/nONWzHRJ0rzg
	bIu8zctRSa/0s0TpIwTBuduoK0WrxNK7JTtYJR1WfwbOtZ6ajb7g=
X-Google-Smtp-Source: AGHT+IEq16DP00C8W20dPuD2ZQPQr24sgXffkVKh2QM8Z8F5nnmTdl7N8bDwpNO/QbjBz4VCkdBEUw7imEt3gY6tYo8=
X-Received: by 2002:ac2:4bc1:0:b0:539:efdb:4324 with SMTP id
 2adb3069b0e04-53dab29dc16mr2803482e87.21.1731766339676; Sat, 16 Nov 2024
 06:12:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241115123028.3904126-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20241115123028.3904126-1-andriy.shevchenko@linux.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sat, 16 Nov 2024 15:12:08 +0100
Message-ID: <CAMRc=MfF=jrJNMcJ=yBPp_=atEt+isrJEDUwgx6gaBeQP+H=hQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: altera: Add missed base and label initialisations
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mun Yew Tham <mun.yew.tham@intel.com>, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 15, 2024 at 1:30=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> During conversion driver to modern APIs the base field initial value
> of the GPIO chip was moved from -1 to 0, which triggers a warning.
> Add missed base initialisation as it was in the original code.
>
> Also initialise the GPIO chip label correctly.
>
> Fixes: 50dded8d9d62 ("gpio: altera: Drop legacy-of-mm-gpiochip.h header")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>
> Can be folded into the mentioned change, up to you and sorry for missing
> these in the first place.
>
>  drivers/gpio/gpio-altera.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpio/gpio-altera.c b/drivers/gpio/gpio-altera.c
> index 039fef26546e..73e660c5e38a 100644
> --- a/drivers/gpio/gpio-altera.c
> +++ b/drivers/gpio/gpio-altera.c
> @@ -261,6 +261,11 @@ static int altera_gpio_probe(struct platform_device =
*pdev)
>         altera_gc->gc.set               =3D altera_gpio_set;
>         altera_gc->gc.owner             =3D THIS_MODULE;
>         altera_gc->gc.parent            =3D &pdev->dev;
> +       altera_gc->gc.base              =3D -1;

This does in fact fix commit 50dded8d9d62 ("gpio: altera: Drop
legacy-of-mm-gpiochip.h header") and should go together with it
upstream.

> +
> +       altera_gc->gc.label =3D devm_kasprintf(dev, GFP_KERNEL, "%pfw", d=
ev_fwnode(dev));
> +       if (!altera_gc->gc.label)
> +               return -ENOMEM;

This is a separate thing and I would argue it's not even a fix per se.
Lack of label doesn't make it entirely impossible to use the chip. I'm
willing to send it as a fix but please make it a separate commit as it
doesn't fix anything from 50dded8d9d62.

The commit message for it could also use some explanation why it's
better to set label (so that the chip will not figure as "unknown" in
the kernel).

Bart

>
>         altera_gc->regs =3D devm_platform_ioremap_resource(pdev, 0);
>         if (IS_ERR(altera_gc->regs))
> --
> 2.43.0.rc1.1336.g36b5255a03ac
>

