Return-Path: <linux-gpio+bounces-16418-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F345A4015F
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 21:54:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6DF717E700
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 20:53:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEE81253B47;
	Fri, 21 Feb 2025 20:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="SF8IWEYQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADC01EE028
	for <linux-gpio@vger.kernel.org>; Fri, 21 Feb 2025 20:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740171224; cv=none; b=YMmdYWDi9ZMU8w/blcPxr/Esh4k1y3u+t4TDTCHsRZluoVXwaS2/a/LaLbXHWAVybSNjoWQdAJqEADzEyw1Z36VD12OWSL4ZRN1fa3YybxyIJlqHEaP/HTVJPWWUMxuhUxAlo7AR0SFXMHCFkS1GyXFs00Nq2udli5QpIvAbgPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740171224; c=relaxed/simple;
	bh=dSU/Y3o79Oen+g1y/O2ttt6++fluDHaGys/I35lxh6k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ndS/G3qdLZtqmM94rL+LJAfpTt6WZETgRAmYI672GiWt0+tWJ8foFwl/NhBlsezJ0pv7oR1DmdvWXNMIoLWhb5S3/83O3G3CcRsHtiWUmuk5Vwj3f7VpoD+m4up55kOxeQy2NGmDPtW0EcBjcR5XttDcF8+v3I98tALyc/JY01E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=SF8IWEYQ; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30737db1aa9so24379991fa.1
        for <linux-gpio@vger.kernel.org>; Fri, 21 Feb 2025 12:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740171220; x=1740776020; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UITCx65oXgxoWzlkKQSoCgIUC5y2VPjQ1zm26AHbirA=;
        b=SF8IWEYQsSj+XugpzSYdcWrLU+pyPwXutM8Xw3ZtOoTMFS6s0HLaoWvbvZI8qwWNNU
         DtzcLZn9wr2oDWmKX89/FOwuq9Y9Yj9q/fAwCe4U+89kVy7b8tTrfTCtsJ5/uFYh9RV3
         UPHuXCeVgvujLFdlQ7zGPYKqKzlRUChO2TTex9OtYeYFIpBOyZy9+9siYGf13rZ3xQWB
         WRuUNMTxYuMnaaJ0Iefmi7lVj+DRnmLgXqVZ6RGedV3YRAS+lMJMvtCEZLbajYmr4gyK
         5CN+4Uayo+MKi4sO3URdRcmNeVcCq87cmkujk1ZWKyCM2qMauq35YTkrBqy76wqWkuOQ
         QkcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740171220; x=1740776020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UITCx65oXgxoWzlkKQSoCgIUC5y2VPjQ1zm26AHbirA=;
        b=cPt+r2CAubDgmjTfG6WPpPa7w/DixaIEIrqihDIZ8JgTJ12xvmKw2K6Gzzj/W2xl2f
         m3PcCjFNJPpItIYbqvfB72dm9J87k2AZGDYJKWj9KlcituU8ww2IQyxVJIjkaUDtfeVE
         m7t8/71eCLntxDsZ7ptwtBcEGXNGstBhiCnHF8tG7DuU+FyL8mIbQ73ji+R4R59bNEPQ
         ILNZpzexFtGNAo4SlITRX8BwInzXl3pHY+NmGeH7L+duhCRGFidW38sjKSh7+i120DyY
         pqWd6Q9WgsR4369KG5OTIo+/fmvKX5gEfhXkMPxw8fR21s5BP1D6z51an2t9WsxajcPD
         WKxw==
X-Forwarded-Encrypted: i=1; AJvYcCVE3k3ZWtwwEKiNN6VhIclm1ywo/KF7gmrtiU6t8SMCBveo6RuQpBWvtcVk+/edeUu+DCmtUxPtR32W@vger.kernel.org
X-Gm-Message-State: AOJu0YyYUm2fd+PMAPATj+7xOHFAwnZICsLCzOeu48pPLOi7Dn7Rnxyd
	Qg5zpX4/hT3eNhNKdqwfqK/vDWYC2Mqp1AbvqFFEjCc1PKxniZvCXHHYbTrscs2ogx4Dofo+9cs
	vo2vrQtDa3fzfNgaB3+lFzjAFzmzYsV1w3vxZk2uMGcvHWDwZ5qE=
X-Gm-Gg: ASbGncsYMr9K7YvvLakV2R89VuVnvwjIWpVbh/Q7pH6RYUnxt03tVoEhLXErKEjV4gz
	9Ke4AK/pFpNS1tMHcszf46OaUHsYHT9ca3R6zAe5qmsyGKAHwEPDCcyv6daD/uL7ouQlBR5zjKj
	k7j3wMuWhoyzFQQFCbzsrgfCj0BjtafcxxGWSZkbg=
X-Google-Smtp-Source: AGHT+IHD/faqLIAxxrUSThF+7Z4ObfCPG5tjOZ5Cb1dKYqP7WiY8zwWQ1Hl9LkauFsK7X0DzVWW2HZxHARnzix6VVHM=
X-Received: by 2002:a05:6512:3f17:b0:545:a1a:556b with SMTP id
 2adb3069b0e04-54838d3e458mr1895563e87.0.1740171220459; Fri, 21 Feb 2025
 12:53:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <9ded85ef-46f1-4682-aabd-531401b511e5@molgen.mpg.de>
In-Reply-To: <9ded85ef-46f1-4682-aabd-531401b511e5@molgen.mpg.de>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 21 Feb 2025 21:53:28 +0100
X-Gm-Features: AWEUYZmvifQGO9hr4odqPIoAEg6jEmQa9XkbaEe-eZbr42YtXkTTJk53aPtcyJY
Message-ID: <CAMRc=McJpGMgaUDM2fHZUD7YMi2PBMcWhDWN8dU0MAr911BvXw@mail.gmail.com>
Subject: Re: Linux logs new warning `gpio gpiochip0: gpiochip_add_data_with_key:
 get_direction failed: -22`
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, linux-pci@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 21, 2025 at 9:40=E2=80=AFPM Paul Menzel <pmenzel@molgen.mpg.de>=
 wrote:
>
> Dear Bartosz,
>
>
> On the Intel Kaby Lake Dell XPS 13 9360, Linux 6.14-rc3+ with your
> commit 9d846b1aebbe (gpiolib: check the return value of
> gpio_chip::get_direction()) prints 52 new warnings:
>
>      $ dmesg
>      [=E2=80=A6]
>      [    0.000000] DMI: Dell Inc. XPS 13 9360/0596KF, BIOS 2.21.0
> 06/02/2022
>      [=E2=80=A6]
>      [    5.148927] pci 0000:00:1d.0: PCI bridge to [bus 3c]
>      [    5.150955] gpio gpiochip0: gpiochip_add_data_with_key:
> get_direction failed: -22
>      [50 times the same]
>      [    5.151639] gpio gpiochip0: gpiochip_add_data_with_key:
> get_direction failed: -22
>      [    5.151768] ACPI: PCI: Interrupt link LNKA configured for IRQ 11
>      [=E2=80=A6]
>      $ lspci -nn -k -s 1d.0
>      00:1d.0 PCI bridge [0604]: Intel Corporation Sunrise Point-LP PCI
> Express Root Port #9 [8086:9d18] (rev f1)
>         Subsystem: Dell Device [1028:075b]
>         Kernel driver in use: pcieport
>
> Judging from the commit messages, this is expected. But what should a
> user seeing this do now?
>
> Also, it probably should not be applied to the stable series, as people
> might monitor warnings and new warnings in stable series might be
> unexpected.
>
>
> Kind regards,
>
> Paul
>
>
> [1]:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D9d846b1aebbe488f245f1aa463802ff9c34cc078
>

Hi!

What GPIO driver is it using? It's likely that it's not using the
provider API correctly and this change uncovered it, I'd like to take
a look at it and fix it.

Bart

