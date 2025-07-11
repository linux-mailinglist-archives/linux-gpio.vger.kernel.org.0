Return-Path: <linux-gpio+bounces-23150-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F2568B01993
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 12:19:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C99DE1C44FFF
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 10:20:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C98EA27FB0D;
	Fri, 11 Jul 2025 10:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="PWZGHuam"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3BF279DC3
	for <linux-gpio@vger.kernel.org>; Fri, 11 Jul 2025 10:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752229190; cv=none; b=NGuD4EOFIeNdr5g+nxhMyynLq/LagwtQ7YCo711uO5+m1Rr8ajhH5Ljob6883hhVvaIqVZSq456G0JC+zv537HtFdIITChPHoKeIggmWgqJJjZ56WjLUpUX8ADjZqBnsnvzmOYAfblcYAvPTM5H7VJs0q481xIAm/gZgvF8o36A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752229190; c=relaxed/simple;
	bh=cbmSGL/Y1Z4mlwSQSHxQV7KiqM9G9CxIi3R6tcvoELM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YdvJRTN/u16lZ6ncb+lIbNCN3l291v0trUsl5/FfZNJbO5a+2Zvjma+L2UydkzOk0rz3LF/ff4Q3Ri8piNEKoBoCLaG2Y6l4YYzhJS/OYX6aHQlfzlraitDWeEXRRMmKmVU30zk67gYMpR1ssRNl09NpLK0I4g5asDwoFvbXN08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=PWZGHuam; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-55516abe02cso1934159e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 11 Jul 2025 03:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752229187; x=1752833987; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uwenZ9KMIUFAX6jrS0AK85gcymUf9NvXLhbThM1sPR4=;
        b=PWZGHuamwJUhoiK/Sou093nchqpKHXczhmhMqMA1Q/GQiOfcNxA7il9VFY7XrgWGu6
         5ogTPUFddkQEb+ca/b0xymLR76Vs5TZyyPNenmZwTc78b/tC6JKuR89hpLCbdHRAutAX
         ZhBTSmyF2dI7MuNNm2d1K5U953+XCgk3xhvizXF72huyxaP7av8zOKXwXYd2sTKTDYZJ
         TRjqehXh77I9k+57J6PP+vqCtRt93JWZfF8tKAXrvCcpTQNITOhIGRHGTmbY9HtFx1oI
         c2rVJwupwIpCsjZ8AmFGcAbesJShuD5LDVw9nCWuQAxv5xt89RHskkADfJzEtftpff/H
         7dBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752229187; x=1752833987;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uwenZ9KMIUFAX6jrS0AK85gcymUf9NvXLhbThM1sPR4=;
        b=axjvDG0bksynBQeJC791jr/f4Nic1ghnlMBgrrBy1NSKJ40+1YLtuM5Z8IRmKeETa3
         n2pNUIJWpQeo1hvNWMFW4vyEkOk5nsi4YkGc+s/f04njN1i1tu8kK0T1Ug3JujpgZnlP
         X54ad5PTy/WLOQoTyzxg1runBUxc7tX4S6/KyxnmV/lITz/llsvHGwgcXSQiFQgk6gUT
         ssl/TLUIUJqEtE5w1w/ZlCF1CFXLMs5jiBwpBEE0J3uIDN2QQW9Iodwghb3jSJjp66Ow
         ZHIReNf1mIN/h+KMupHq0675kONUxMG6dhf6ltCGSizyVUe1TRUiZxyMA8icGfccVFjo
         VGow==
X-Forwarded-Encrypted: i=1; AJvYcCU1cCSHDw6jbl4EF1NHaHXzoEEgxPGzbpV/6yuF7HnmK5QwcHFtB4XBcXmg0enVH97B0SFyjmmJPGxh@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2mTulqopyymzlHJ5QnfEmuUXBER1D1fuxNx8ebqZZ12iCfwaZ
	QGGKy8SECcIwly85OwSvhO14FXXL6kkXGKW2jlkvbzbfuSN8sbEAU+vh5cOxji11VM9xobAqe6G
	xXkzJXjJEp7UiyCr3QlzX89xW4wwTLwtYmRU6oFOzvb8mhyiuXPTp
X-Gm-Gg: ASbGncsmdKq7nOKNFheBNK3KJ8UQqqDCihHBagTzXU62YBOxqb8gtLCTVL+nDBZrtqt
	vH5IVFzRny+E5S601s4WdzndklDGq1Qay8mxeTFHuYlvwmPf67tfz4rFtzBiZHeizANvGF9LXHN
	WTt70Ee7uDg0oyIm/awAheaGUX42Dpgt/wg2Z7h8qW9+cQN/BC/o4uyefyOXL1kz1Q1/7pkVsbz
	/CpDTrgMN7NpnIE8KX0CNVF9fb/Mrd35M1YEg==
X-Google-Smtp-Source: AGHT+IEW/M1REGVCK4E45GEKXbT3V9smSB8rKq/nvr0qctMYIRgEI+I64Yc2BwkbQM3QHr+TWvfrQBwSBy9bCPmHwSQ=
X-Received: by 2002:a05:6512:234a:b0:553:a34e:71d4 with SMTP id
 2adb3069b0e04-55a036ba994mr917962e87.0.1752229186800; Fri, 11 Jul 2025
 03:19:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250709091542.968968-1-marcos@orca.pet>
In-Reply-To: <20250709091542.968968-1-marcos@orca.pet>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 11 Jul 2025 12:19:35 +0200
X-Gm-Features: Ac12FXzsNlwwCPXmWdiqW-RqPJYd46pBsoR9iDovUEPXzuCSAy7cSpXF0__qwB8
Message-ID: <CAMRc=MdLXP=DgHEh6hoNYhDgB4aESmC29VH6hsH=AONNgsjXQQ@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: vortex: add new GPIO device driver
To: Marcos Del Sol Vives <marcos@orca.pet>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 9, 2025 at 11:16=E2=80=AFAM Marcos Del Sol Vives <marcos@orca.p=
et> wrote:
>
> Add a new simple GPIO device driver for Vortex86 lines of SoCs,
> implemented according to their programming reference manual [1].
>
> This is required for detecting the status of the poweroff button and
> performing the poweroff sequence on ICOP eBox computers.
>
> IRQs are not implemented as they are available for less than half the
> GPIO pins, and they are not the ones required for the poweroff stuff, so
> polling will be required anyway.
>

(...)

> +
> +static int __init vortex_gpio_init(void)
> +{
> +       if (boot_cpu_data.x86_vendor !=3D X86_VENDOR_VORTEX) {
> +               pr_err("Not a Vortex86 CPU, refusing to load\n");
> +               return -ENODEV;
> +       }
> +
> +       pdev =3D platform_create_bundle(&vortex_gpio_driver, vortex_gpio_=
probe,
> +                       vortex_gpio_resources, ARRAY_SIZE(vortex_gpio_res=
ources),
> +                       NULL, 0);
> +       return PTR_ERR_OR_ZERO(pdev);
> +}
> +

This looks better but I admit I'm not an expert in x86 platforms so
I'll allow myself to Cc Andy. Is this how it's typically done in x86?
Is this module visible in ACPI in any way that would allow us to
leverage the platform device core? Or do we need to try to register
the device unconditionally on all Vortex platforms?

Bart

