Return-Path: <linux-gpio+bounces-10800-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D5C98F2A4
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 17:32:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 28F48B20DD3
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 15:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D17D019F470;
	Thu,  3 Oct 2024 15:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JW6wiGlo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C796DDA8;
	Thu,  3 Oct 2024 15:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727969557; cv=none; b=VtnTy1A/DYw2/TAFK8NNN2f+B0+OaA+w9Xl9w7waadDkXx+N7QmOpdYtIf+nZNiJLdkA5It9AQ5KkspdDYF8TNIV5ihQ7URUJDDqZInO/gBzzVu+qpbh8XAy94Hw9ELdN3Rv3NxbBhrR+8RJ1AdUSdatfzBlQgfyXMHOZEvhYmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727969557; c=relaxed/simple;
	bh=jahUCEKj9NRTWQg1+eog4R85O0MFnIuBfeHhBf4QMZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hlGuq9hY1dwy2DZz4QL+6OhfuiI0Rauo6yH4rFDiYjsZvTawiJ/UwDpLk4/D3nuh7NWPdRGAtukqmloVxTdTc/ABLpa6CX7zAIerGSvDl3VS6VolrI6OynOidTECF+tfvQz8B03dk/TStsEow/lcHM8CGO7KGWw2rxfvRL7HFfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JW6wiGlo; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-287b8444ff3so225195fac.1;
        Thu, 03 Oct 2024 08:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727969555; x=1728574355; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jahUCEKj9NRTWQg1+eog4R85O0MFnIuBfeHhBf4QMZQ=;
        b=JW6wiGlo53t21DwJKAYRAHUyCf2NSxLrvjOlUv5D2By0FbG3k54gJpYkOJ1JFkOiPz
         O1w41yNnu7RqkOIvrviUKGCNBdogS9dHQX4DfQqFK3of6ZCYWCtQjk/44p2j4TvwmB80
         4Du3sGBRgVx0YPPbfDsTAWp5hl54YJfdvmkbLMA9IoJwhslJSB4iIXh9iDIacsV2HDFX
         ZT9ukVF9sVmm+I2lc1jkBPAUvnsyjgCTUX2Hs+7YFSIksduE0wOrRVYRFEm8HNJ85Lzc
         jlfxnu9FqYuz/HIKztaeuQmuMZHJ+ymQFZGV7AuNhNXSRCAlRNJBiRe+pSObtQPRqFEc
         3RtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727969555; x=1728574355;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jahUCEKj9NRTWQg1+eog4R85O0MFnIuBfeHhBf4QMZQ=;
        b=jVELJryxQTl+r8nqgWpQpKtUE7Zjmqv4hnfxb21VDduUIJBgeR0HK7tpouvk6YYE9W
         /QVvwAjwhEhWa9BRjR8XYUFYLi7PhQKD/f7J9JSXCbE6o+3soeurZ9UOrM+p3LOJiuuF
         nR+vjBwSmte9f6t+T2iJKDAX9p0sw91rbMzmXPwYrEzjKnvmRIBTUVzTzPkUAEsXUBxq
         J1SUH4lQDOdn1AzxdWomKbugAE7yj97BxywoxJvSGdZ74EOSBsVrQ39PrHGNuFLqtudp
         2zaJcjdF42r12NiGKHB14GfYimcGLUWEIKz3cIhwVTHOSUtSHEMkblvfo1erb7nG6Xmi
         EmAA==
X-Forwarded-Encrypted: i=1; AJvYcCVDAEh8C7dCaLi8/xdxx9i4gyi5JVhoZstJOmwoNHLI4wgs10LD4e5F9wv25qCB2KMWJ/hXCZ+DvUghDOLW1m+wSrs=@vger.kernel.org, AJvYcCVT2RjQYOTVxPOo8dRg6sbzNffnmpT/bc/6an/9aOoN3SNWp4VrDo181E4xyQpXfRrRyKs5EFRXb2AI@vger.kernel.org, AJvYcCVtqS3LkblJXTDV5wD+s8iFnNbCPoyZixpR5g8cBuP3LtndgCefOyJJXC/X/PgNiIfu7hc0OKRR6Ahx9hdZ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo/lKoFB5AoyuzWBb4ZZ1E5fwIEB96Y15QvKrf2XIkeUrObDFD
	MB8y1nTPcJagTNsJ3LY+Of8bK5xDKv7NXUDttWr39UbD5v9375vhHytuS7bJ62N37Wqz+PKb4vB
	3kR0IFJOPRZM9z6b1knaEl8dkTT8=
X-Google-Smtp-Source: AGHT+IGWgHG1pZLAJW1/0INFYGZK0vzLTtDKn/CvN91U6G58RVlzwkIQ+mHchK9Eyqu2EfUsF5ZJzF7dOXTRO5Q+5L4=
X-Received: by 2002:a05:6870:d1c2:b0:277:d932:deb1 with SMTP id
 586e51a60fabf-28788a8b15emr5118049fac.18.1727969555113; Thu, 03 Oct 2024
 08:32:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241003131642.472298-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVknArz3W5XhPVj-ZGCu97SWyf2EqHhJRXOg6pJ1=tF=w@mail.gmail.com>
In-Reply-To: <CAMuHMdVknArz3W5XhPVj-ZGCu97SWyf2EqHhJRXOg6pJ1=tF=w@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 3 Oct 2024 16:32:08 +0100
Message-ID: <CA+V-a8v-zumfwm4q7icQxwB60SXetGogNOi0fBBFZRQwTsTxEw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: rzg2l: Always call rzg2l_gpio_request()
 for interrupt pins
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Thu, Oct 3, 2024 at 2:46=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Thu, Oct 3, 2024 at 3:16=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.=
com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Ensure that rzg2l_gpio_request() is called for GPIO pins configured as
> > interrupts, regardless of whether they are muxed in u-boot. This
> > guarantees that the pinctrl core is aware of the GPIO pin usage via
> > pinctrl_gpio_request(), which is invoked through rzg2l_gpio_request().
> >
> > Fixes: 2fd4fe19d0150 ("pinctrl: renesas: rzg2l: Configure interrupt inp=
ut mode")
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > Output before this patch on G2L/SMARC:
> > root@smarc-rzg2l:~# cat /sys/kernel/debug/pinctrl/11030000.pinctrl-pinc=
trl-rzg2l/pinmux-pins | grep P2_1
> > pin 17 (P2_1): UNCLAIMED
> >
> > Output after this patch G2L/SMARC:
> > root@smarc-rzg2l:~# cat /sys/kernel/debug/pinctrl/11030000.pinctrl-pinc=
trl-rzg2l/pinmux-pins | grep P2_1
> > pin 17 (P2_1): GPIO 11030000.pinctrl:529
>
> Just wondering: is this restored to UNCLAIMED after releasing the
> interrupt (i.e. after unbinding the ADV7535 driver)?
>
Actually it doesn't report `UNCLAIMED` after `modprobe -r adv7511`,
pinmux-pins reports P2_1 is claimed 11030000.pinctrl:529. `modprobe
adv7511` later succeeds though (maybe because it's the same device).
rzg2l_gpio_free() is called from the rzg2l_gpio_irq_domain_free()
path, either this path is not being called when IRQ is freed or the
adv7511 isn't releasing the IRQ.

Cheers,
Prabhakar

