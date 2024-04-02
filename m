Return-Path: <linux-gpio+bounces-5008-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E7B895638
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Apr 2024 16:09:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 764261C228E2
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Apr 2024 14:09:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF07A86146;
	Tue,  2 Apr 2024 14:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="1QsuxWiE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E0985925
	for <linux-gpio@vger.kernel.org>; Tue,  2 Apr 2024 14:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712066977; cv=none; b=plXJMZdYO2KdPprGa47U1VCi+SIXQHPc2AtseotCNhGJcOC8/Ol2/RI+BZ5P+wYQiybCESe4nAuEGdpvxCY0G2fnA7MUmX8tqAKJbmg/3P5RAxXB1xSP033ZiWp2WiGcw+3FS7Yb2PwTo6mxicPNjoPzHlUCKqLoajvWrOpuaHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712066977; c=relaxed/simple;
	bh=Jt8J83Qs52Euab+TTyyULznFALZqzcKbukrVmjAqGVA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jYEDw6+yIoNPju+QBgR65dBfoLEGGk7IAtoWVcp8yRrrZB81D3i8SdUg1Abay+PQ5HWyiBBkoeRBgpn2xlmx14JifPFZxLn1c95n6/LauRl+SDn0TLJ1O5zEU3X84YVYGIDJi/2MZPGAKuwe9/h3HEd85yA5gfQcwRbZqqF0pzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=1QsuxWiE; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-516b80252c5so841600e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 02 Apr 2024 07:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1712066974; x=1712671774; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aPGwoUzYRhrsxJJ6NbAyzYSFsQyX9rvT9zXjZL5FaHg=;
        b=1QsuxWiEGpKSNXMNmprjypKWdFn05snAHnc6uSxaVwYp5J96pt7NwY3QDvr1+zpszo
         kU8TlAEUld4yFV2wpyCf2LSIjbat5e32xun6vQB/E9L72NjYXzIkWGYUo7OzG5lvTjaT
         0pDW5ggQ1Qy7SOp6Bq9y6Cm8fP0W9wgjVOd/iPdNfTapcfidHc4R11URr1ZIG7pIXM74
         cilCeSubZljH4iB8wtYfyct8F90O3snABE3TRpRnVLB4onBVUEana6/bgl5dA3Tlj/j+
         H3Y6c5bxW90Um6/LrMqRWRX9GdUIcfIHKVzKlozEdOhVfwg119OZhTuqd2hAa/s+Pq1n
         DLrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712066974; x=1712671774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aPGwoUzYRhrsxJJ6NbAyzYSFsQyX9rvT9zXjZL5FaHg=;
        b=uVZrpW1mOFH6ZAJT5FfeKmxqHgLjlnIgIsrAkdiWb8sXxcaGx2pAVsDb55/c5pf9aL
         1DEN6LVgaN9ycWgxblsXaWR5DL1wzu83AJ8FQmiHRNryLWVo0UrgJB+jTy1Xrxaij738
         bDNBW/0trD6DcDdyOpFoAZNZGLeJsBm0tNr5kcEIMSYDQIsCXq8OOH3DR/XxiEqfbAHI
         j+6K9eh21/p8b43Xq2uC0on4Clcmr/SrON6GraB6Yi8oylAGJGn2AzyTCE3yNJfeTN8B
         HvVPMsZPSD0dC5gBe7TO3cra+WLlBFdxQjlfQP5gqR3pYDglJ57M1kjvRGZh9h7HZHea
         G1kA==
X-Forwarded-Encrypted: i=1; AJvYcCUcYGUaX8VtYqnaW+J2Nv0KYwTFJWw726kOeYIhzSf799ry8ENz2/S2Ddx8d8Mm4YunCjvGfWYWQgQ0dNNwW0qgXJl2jhRJHBVK0Q==
X-Gm-Message-State: AOJu0YwGSbsuzw+07Z5uKi+YITm+on86NL8YZtHEUjx6bmd2PbqoSEEj
	Bp4gSf+P7mMVfjbGdETeirV/F+pdX/jqJokAOq2cwxDRx84a/EWNj/6gK2TFGrKG1v3vgkgVOOj
	WHFllXp7Jsa6nd3ZVWKQ7XowPp4FH9ZZJGfIc1w==
X-Google-Smtp-Source: AGHT+IGVLgbiu0THc2aQqtdUiIKArPfEBHJNcPp4M7o4+j2DroDeGXiKjz7cFgg590XIJhOVWCEaf+V62qpHjsMKBqs=
X-Received: by 2002:a2e:740f:0:b0:2d7:1323:6792 with SMTP id
 p15-20020a2e740f000000b002d713236792mr8996831ljc.43.1712066974361; Tue, 02
 Apr 2024 07:09:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240402134334.173409-1-hdegoede@redhat.com> <CAMRc=MciKFPrqSG0BbLr3oQmXXfDsJGiqukhjKryxUGNPg4KYw@mail.gmail.com>
In-Reply-To: <CAMRc=MciKFPrqSG0BbLr3oQmXXfDsJGiqukhjKryxUGNPg4KYw@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 2 Apr 2024 16:09:23 +0200
Message-ID: <CAMRc=Meygux5seJTkW7ya-Bm-4bQkzd56VPJ-RWMTNjAoG+qWQ@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: Fix triggering "kobject: 'gpiochipX' is not
 initialized, yet" kobject_get() errors
To: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 2, 2024 at 4:08=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
> >
> > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > index 59ccf9a3e153..4c674a37bcfc 100644
> > --- a/drivers/gpio/gpiolib.c
> > +++ b/drivers/gpio/gpiolib.c
> > @@ -1179,7 +1179,7 @@ struct gpio_device *gpio_device_find(const void *=
data,
> >
> >                 gc =3D srcu_dereference(gdev->chip, &gdev->srcu);
> >
> > -               if (gc && match(gc, data))
> > +               if (device_is_registered(&gdev->dev) && gc && match(gc,=
 data))
> >                         return gpio_device_get(gdev);
> >         }
> >
> > --
> > 2.44.0
> >
>
> Can you do what Andy suggested and move this check even before taking
> the SRCU read lock? It doesn't protect the underlying kobject struct
> in any way.
>
> Bart

Oh, and please add a Fixes tag too.

Bart

