Return-Path: <linux-gpio+bounces-29726-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CC506CC9BEB
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Dec 2025 23:56:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 216E0303897E
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Dec 2025 22:56:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 622AF32F755;
	Wed, 17 Dec 2025 22:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XJEoG62p"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D1A32F754
	for <linux-gpio@vger.kernel.org>; Wed, 17 Dec 2025 22:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766012173; cv=none; b=lV4vzdX0V1THA+eFe3bTAZsH4HIK46UQaqdYV3S0urJ+Lv3mwnuGe4xFRg2atuf0uqNitv8xuTnlOEMYMW+9+V58n+iPdwyR6PgJfO4SwMk2ESeo29rNvlj5Y8xkvyxQ2YukSr1AtG7yze9oLvaP49huNqXIqcn3za7+zKe37Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766012173; c=relaxed/simple;
	bh=tDcplPya4wN+AN0x25eUKl1n9tuesEBxzO/VDLpjhQs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aXu65LHUxoj7UraIfejPTdWffaYDZlv3weU3zfpGd51yR9iYP93cAGxuYx7m9AjLhofAE6mAE8QQ2kuSwwT2IPNiDNbb/6B+ORpsi+qTh3QQkvZ09J5FD7zxd0KoXGgf/YjsPPYa/l9NJree43zO5hOzE/vrHD6ZQ8KSFiz6p5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XJEoG62p; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4775895d69cso155885e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 17 Dec 2025 14:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766012170; x=1766616970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yGDBzKhNFF0/DbhEJFH86AaKvU2hDmw4u3CRgvRYNNg=;
        b=XJEoG62pQeBPfUw7vCqFQpblnozXxfes9wCFUgrs56qYQpCXASO+KNvM+pnUMP+RjK
         1yvh4MUoOzTbdXfMR+ocs8tJtqF/bV3cKrt6nEpjjAdyh33IATLtKcxQAkeRWDZpYhK0
         wDchhOCdGSH97tnUVjcRF1E2ZLdjVcgqUu7y0UIXbFaiggFMMX3g1C7+fSmCAtZZZAhx
         0yW/NW/WlqQR36JZ5DLaPn/SjOE/eiF2lceDBoXJ8Lwv53eAhZIrvEyuGfOoWdLvndjk
         MoLNqigsLamD1jZvELXzg6u9phH96ne4IXM6fqAjkWI11mceQtVkz9m0rY4fCnjwGNwz
         Ifwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766012170; x=1766616970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yGDBzKhNFF0/DbhEJFH86AaKvU2hDmw4u3CRgvRYNNg=;
        b=G+vWHWgRPQGP9KUdYvfobocBfETiK2wccrLv6LocRApgMxJWmsWj/LJhFNxi8ZSWYm
         8xl64/M+OHHJDDHNj4cIK9m5c13GklGRnO9UE5F5mPV8mU/zqdQP4yGwhlc14ZOMgI8O
         uWkL1c8vgeXKEsOE6HgrhzbvI1uvmKQZUmPXp7h0Qp6OoNrd8UYRUrA9IXTMY4gCEFvz
         pKfMRZyb11oxsOldKkOkzs2XCz5FJ4M7dJeatlP+rxZZFpV4UH4q+7BwZBG/VWZHf7/G
         mYfidibzPBjfpQOWmXZ9qLw3+b2FUT6/Mpk1t1sGv5MbxGNKvWmPsBCTbv8CYuZNneqi
         6AfA==
X-Forwarded-Encrypted: i=1; AJvYcCWmP9EUWPQ2t1OzH7kKZTy/qRA8WqG//Iq6zYlmbMxR+dHMGi6W8WAi4D0jhjSQYcJvIMDxOLQjwIfU@vger.kernel.org
X-Gm-Message-State: AOJu0YwBTKa5Zeoc8Jv8JAS2e5rAse/DrLZIN+cb1AzbqypR2uL/xXWC
	Ccojxw8QRY6dPuKUFHPDl4ocDKpekQB6YiB5BxJmbvQCNya49wHiTvUorQopAw==
X-Gm-Gg: AY/fxX5F5sDMInE5AB0yjEqS0gCiBQD4Kv51M2bsa4wAsVqwDNENvye5Yc+xb2wgPHO
	QeL60/YYju8SxNr5dvYzV9UrQFtJOMKkGN8htUsKxUPUw0B8v8em5Ekghqhc1HQ2FCj6vjN3iKY
	uspr6POsuphXXnP1c+ag/YEwr0DCeIcHY1CsUxwX1sJUmt/tZ/W+NelzKkSpXcxwParNBYtAkB9
	ULpkmLfRbmcP5u1Nul4kmg79couvUNn47bruU2q7UQcY0m5PmsfQhVeBm9atXdw8O8hNgPOlT4V
	L3ya9x9T3T0M3PlcFOv0JPzcRxOKdTSBdSIbo8zeH9zLkX7OSLnkRo+MnYTw66zWhl3r2miyUDC
	hZADjjd53xIQYYuUD5baM4oGbfmsijiwdl59e2QVN/C8w8blOVBCvINo0HSXF9FsNQGxMumTiFy
	u6kahkGrhHV09aK3dzAE23ltZDDz1wp4uXKBE000Qbpn6YRVku/9jq
X-Google-Smtp-Source: AGHT+IEzCpPRP29Nw7XmHkBgKhPimfySiZt+e5Z79juOGxsjflLsAni8KH+OMXRbry8YbaFsi+oCzA==
X-Received: by 2002:a05:600c:35c1:b0:477:7925:f7fb with SMTP id 5b1f17b1804b1-47a8f8c423fmr240925455e9.10.1766012169699;
        Wed, 17 Dec 2025 14:56:09 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43244940148sm1452728f8f.15.2025.12.17.14.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 14:56:09 -0800 (PST)
Date: Wed, 17 Dec 2025 22:56:08 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Rosen Penev <rosenp@gmail.com>, linux-gpio@vger.kernel.org, Linus
 Walleij <linusw@kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] gpio: realtek-otto: use kernel_ulong_t
Message-ID: <20251217225608.1db1a51c@pumpkin>
In-Reply-To: <CAMRc=MdhXqO_b6DU8v6rkuNwsEVO-zY7UP0sXO=2P3tM+uFzHA@mail.gmail.com>
References: <20251217063229.38175-1-rosenp@gmail.com>
	<20251217063229.38175-2-rosenp@gmail.com>
	<CAMRc=MdhXqO_b6DU8v6rkuNwsEVO-zY7UP0sXO=2P3tM+uFzHA@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 17 Dec 2025 10:34:26 +0100
Bartosz Golaszewski <brgl@kernel.org> wrote:

> On Wed, Dec 17, 2025 at 7:32=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wr=
ote:
> >
> > Fixes compilation on 64-bit platforms as pointers needed a larger type.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/gpio/gpio-realtek-otto.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpio/gpio-realtek-otto.c b/drivers/gpio/gpio-realt=
ek-otto.c
> > index de527f4fc6c2..efcddbe01308 100644
> > --- a/drivers/gpio/gpio-realtek-otto.c
> > +++ b/drivers/gpio/gpio-realtek-otto.c
> > @@ -372,7 +372,7 @@ static int realtek_gpio_probe(struct platform_devic=
e *pdev)
> >         if (!ctrl)
> >                 return -ENOMEM;
> >
> > -       dev_flags =3D (unsigned int) device_get_match_data(dev);
> > +       dev_flags =3D (unsigned int)(kernel_ulong_t)device_get_match_da=
ta(dev);
> >
> >         ngpios =3D REALTEK_GPIO_MAX;
> >         device_property_read_u32(dev, "ngpios", &ngpios);
> > --
> > 2.52.0
> > =20
>=20
> Just make dev_flags an unsigned long and cast
> device_get_match_data(dev) to uintptr_t.

Or just cast the pointer to (unsigned long) and leave dev_flags alone.
'uintptr_t' is a 'user' type, not a kernel one.
The kernel tends to just use 'long' when pointers need to be in an integer
type.

	David

>=20
> Bart
>=20


