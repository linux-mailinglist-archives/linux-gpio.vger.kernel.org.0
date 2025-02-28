Return-Path: <linux-gpio+bounces-16790-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 19380A49529
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 10:35:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB29A3B561C
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 09:33:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD973255E3C;
	Fri, 28 Feb 2025 09:32:39 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAF82528FA;
	Fri, 28 Feb 2025 09:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740735159; cv=none; b=l1TC86QEYjDQcVTZ9hyOI89Lmk7xBp0EL2nZoTixKHf78Hl42G1TQd4E6E/MZ5gfRBnXvD5syPVkN9Vjni0XdbqF5sRFAkPEyRAlHwvEx1Or/Lgu3t2yrOnj5z9Qlp73v1KQ775PUnWSAllybULLEjtVcpFEwvJ8CtAhhYW84Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740735159; c=relaxed/simple;
	bh=vt2XSudQWazRZelBCv5/dhTzXXn2sFbrZNnIFZIz1jY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uZ7UWtxL9neXrZjX8IzcOV04C0m3Z7CirT4XTr3WYZWdqj3qodEeuV8MVbqfOUU7tEynMaVMp+tGmroDjap9PBxbWhO+Xrn4TNmKL7q4gU+COwin6E5nwFxJpEtcW+25yhKHugaFtKhlLaXmexhwDW/jTwoqlbQkXAvIQS3dIpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-86112ab1ad4so775388241.1;
        Fri, 28 Feb 2025 01:32:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740735155; x=1741339955;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v3LCsDM4uwm7ZYtqjDKiOAcEMe6kqxFNjxjj6rdEjNM=;
        b=dS0KTvePrmwRQVUPAXj39o/w0ntg6Avbf08AV9+Z/g/BWawiuaneYctilaJvQm7h8V
         e+2hbkHMmxJ1MlgiLsS+88VL89FI+FeHIaNn31dtldt29yGUilJugqlM7I1XGFfjtc4s
         FB+vqtl8QK3E2xr/p5N4DpfvO4n7eMET7jI5AM68ywOzKBKJfTVaGXzO5pLKaJ4PIXcT
         HoqVNwGATXXjQPes5jkrK6OeFXy+Ek1nf6GG0Z40If60jHkf/69nzSLthRQlq5QhIO1e
         6xiuGqct035d2DyBblBBx9V71n65aEjYjKyDIf+BDAd07juJkcfvBPJO/331r97iJPs9
         gMwA==
X-Forwarded-Encrypted: i=1; AJvYcCUoNTue25imcVRUVo/QK4hfI0c8GGbp73iwNvKXc9RGPTVeoLEh6CZxra7fMkCLMw9GHCUIJIb8Ea+q@vger.kernel.org, AJvYcCVXGmsM2W96tww/exgxoMRS/MbadqzBEcmSZt1YvOL6V4/DXEhpVugdYNriitIvVmQhY0nDB0yRUAm6cO/b@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqvw9aU2Wre+ZV3aEYplVNjW3XYyKAN7zudGZbhvmJWK4SlCI3
	hy7WNaUwDKSAwJtHqrwhjo48ZmTTAVjb/fwcY30h7jXTECF1rCzJf3yQ+zXk
X-Gm-Gg: ASbGncveO5QhP/QmgetKY1cdc1z+W72FH74xBpbHr2+VDreUO9VOC5rW5vt4wuklUsJ
	x723ZSqTZr4iNYSMWFLnxoqH9WVX/esEeOPB6LcA0zbz2ME5/tFxm1o0aXcQqPdskO/W7t6FWYo
	RBOJOR4wtRJ0FmpPCAodwq6eQhs6UJF31ijSYZYwIEsJGTiU5PH+fZn1shhMUxpsCyV6Ww5O7Nr
	GehEPZ/pTgfcdMyAZypbmWopfQLDxY8mpZMIgiRCN5pIQhDspB6ndRIZm6PISC6982Fvm63YQdI
	vKWymmvPAQ6No0m/+KGKQd1LrCUudFpbTPiXZrkYlZx9YzWBWJDbczCohsOXzt71
X-Google-Smtp-Source: AGHT+IFGyARKyxCuDkgHYcKpOxwgKIp3vxAFlBFW0YeBgk0U4foaMLZB6KoFtnNJ8KyDCvU79A/sWQ==
X-Received: by 2002:a05:6102:1614:b0:4bb:f0aa:b317 with SMTP id ada2fe7eead31-4c04490e8f6mr1853101137.9.1740735155399;
        Fri, 28 Feb 2025 01:32:35 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-86b3da71bd4sm558106241.0.2025.02.28.01.32.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2025 01:32:34 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-868ddc4c6b6so796859241.2;
        Fri, 28 Feb 2025 01:32:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWbPbHkfubQfSQb3M/MgF8FsWlkv6mok8gKCMOOtyhoo5WxebBgezCkwE6VY47GtfSw6dpqR8E3lOtH962U@vger.kernel.org, AJvYcCXMhm51qzrmd76qWDMUP6s3b5v/5unhHl+B3M8nstkZNRQvsellOGKIxwi/izHJjsTJfVwo53CIE3AH@vger.kernel.org
X-Received: by 2002:a05:6102:6f09:b0:4c1:1348:550 with SMTP id
 ada2fe7eead31-4c113480a22mr213020137.23.1740735154004; Fri, 28 Feb 2025
 01:32:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z71qphikHPGB0Yuv@mva-rohm> <CACRpkdYOGeDaDUuQQUGwvFNNk7ZuFjkXSMPXL3BJ=4jGEGPkoQ@mail.gmail.com>
 <ce0d802d-6bad-4028-bb57-18bddba5632d@gmail.com> <CACRpkdZtWLGAn0K+xENY+RF6CsWPn0m7R--W9EaH+xTKazALFg@mail.gmail.com>
 <8979f8d4-8768-40b0-a3a7-6638ddb626cd@gmail.com> <CACRpkdasQZ26cEv7CCSu75MJH=Pn8a45XQvZmNt4MB=hzTSa6A@mail.gmail.com>
In-Reply-To: <CACRpkdasQZ26cEv7CCSu75MJH=Pn8a45XQvZmNt4MB=hzTSa6A@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 28 Feb 2025 10:32:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVLqS0=OXBMPAct9bkNWcRHTEN49v0uUiZdK8M-hmRKxw@mail.gmail.com>
X-Gm-Features: AQ5f1Jq1cMSEwRj7TbyQXi_z2oPSTaSph0VaiBd9W1bSm0T1r2-CYrOcJ0Yd9P8
Message-ID: <CAMuHMdVLqS0=OXBMPAct9bkNWcRHTEN49v0uUiZdK8M-hmRKxw@mail.gmail.com>
Subject: Re: [PATCH] gpio: Document the 'valid_mask' being internal
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>, 
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

CC Biju

On Fri, 28 Feb 2025 at 09:07, Linus Walleij <linus.walleij@linaro.org> wrot=
e:
> On Wed, Feb 26, 2025 at 12:42=E2=80=AFPM Matti Vaittinen
> <mazziesaccount@gmail.com> wrote:
> > On 26/02/2025 12:18, Linus Walleij wrote:
> > > That's easy to check with some git grep valid_mask
> >
> > True. I just tried. It seems mostly Ok, but...
> > For example the drivers/gpio/gpio-rcar.c uses the contents of the
> > 'valid_mask' in it's set_multiple callback to disallow setting the valu=
e
> > of masked GPIOs.
> >
> > For uneducated person like me, it feels this check should be done and
> > enforced by the gpiolib and not left for untrustworthy driver writers
> > like me! (I am working on BD79124 driver and it didn't occur to me I
> > should check for the valid_mask in driver :) If gpiolib may call the
> > driver's set_multiple() with masked lines - then the bd79124 driver jus=
t
> > had one unknown bug less :rolleyes:) )
>
> Yeah that should be done in gpiolib.
>
> And I think it is, gpiolib will not allow you to request a line
> that is not valid AFAIK.

Correct, since commit 3789f5acb9bbe088 ("gpiolib: Avoid calling
chip->request() for unused gpios") by Biju.

> This check in rcar is just overzealous and can probably be
> removed. Geert what do you say?

I looked at the history, and the related discussion.  It was actually
Biju who added the valid_mask check to gpio_rcar_set_multiple()
(triggering the creation of commit 3789f5acb9bbe088), and I just copied
that when adding gpio_rcar_get_multiple().
His v2[1] had checks in both the .request() and .set_multiple()
callbacks, but it's possible he added the latter first, and didn't
realize that became unneeded after adding the former.  The final version
v3[2] retained only the check in .set_multiple(), as by that time the
common gpiod_request_commit() had gained a check.

While .set_multiple() takes hardware offsets, not gpio_desc pointers,
these do originate from an array of gpio_desc pointers, so all of them
must have been requested properly.
We never exposed set_multiple() with raw GPIO numbers to users, right?
So I agree the check is probably not needed.

[1] https://lore.kernel.org/linux-renesas-soc/1533219087-33695-2-git-send-e=
mail-biju.das@bp.renesas.com
[2] https://lore.kernel.org/linux-renesas-soc/1533628626-26503-2-git-send-e=
mail-biju.das@bp.renesas.com

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

