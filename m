Return-Path: <linux-gpio+bounces-22967-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCABAFE23D
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 10:16:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F9AF581943
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 08:16:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5083223B61B;
	Wed,  9 Jul 2025 08:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="b2hOwPrF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49EA423B613
	for <linux-gpio@vger.kernel.org>; Wed,  9 Jul 2025 08:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752048791; cv=none; b=u3C948uz6mg1UZ/loMlJCmSCzydRJtSJFJ5HqozZrgIvyL6RVANaOEph/XaG6GPanCM36j90DJbonnGbbaYaIGkRT4sxqWIE0RDMUVXXwFuUaa1HlWN8DAmq3bB8Lqng9mS7+Pn6anz83ewety12U89wjughhnhdBcraF7o88DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752048791; c=relaxed/simple;
	bh=DH9NUD8mzU5ovthvNp8ZKZYQRFFPM1EeEMXe9n7EirA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fLik/QzeKMhUfWuFruJVrUeWZP9tUcCuBdBcj+UnbsNlhIWvp8PuUUys151mrCuzvbWnuYiPpxdyf1itT5S4Ms/NB+QrMoN5AlCyUEfUzeGaWqjJvUvK9BfcF2m27vNghe51YyUasFSYIa1bhR1nvfyxQwNdB2PSIR6z8MqvIsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=b2hOwPrF; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-32b7123edb9so60323051fa.2
        for <linux-gpio@vger.kernel.org>; Wed, 09 Jul 2025 01:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752048787; x=1752653587; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=865uQGi3JHs9gU6SJdGaHyOjW16oPlGySA+XL9vzYmY=;
        b=b2hOwPrFTgRG0MGHTN+J0+KxYyJHJh/GJuJHifKKlR/x/o1R+O8LGbeizacvpVQC0z
         VP5pLEgEYfV5dug8jHL6S1lzAo2UEITF/uNaRx3n0oT7iAq5uphjcJOx8Qa0gD8twSTG
         DnGOx6yTVuP50JNgnA9d7nb69htAAGW02S0oGcTaYMGpMo+cqsxlaMu/iQH0ezL6iXFb
         i0Nip6eS/Y7XRL7Xnu4gUxdRAgUjYi7Vp2DPoR1oiSlEkpjnlMyjJ2ml0xx+SxNaYggu
         rv2QXZx7brS53Npv3agLLu4OleM+gSR5nLpY5EamojJlBIr6KNyziHduczrwqfONcZnf
         EMwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752048787; x=1752653587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=865uQGi3JHs9gU6SJdGaHyOjW16oPlGySA+XL9vzYmY=;
        b=QViEYUztRyXShNvC0x+HmY7Do+VeQrpc7/nLsnlIc9HzZqBkQaoBT9ruJwR3uYeU+I
         ltnUbmcpiMg2Wx589myuL39XhfDyB+hTO3ZsFXj9XGjBp6t8aM37iOBbXriroQ1MBMH5
         sj0JcRmaY5JExMXuFpVBMrCM8A7l+e4wXl1TtH6sVRaRkM8men0rXC5iuCE0DDThelr2
         AW053zG0lywEZ/pz6CHntyustU7EjvA85Iy7UDSFOj6i06QrZayOuhWhUZQW5KFs1rYl
         yYk6v01jNlilnSn9aAQ5o84hesOS6733LzYVnjyyQhWaahV8qHdKbovJhzzhfSHZQaL8
         wjow==
X-Forwarded-Encrypted: i=1; AJvYcCVBQK2YmtzAsWaGiNUw3MfESdMe4DYd+kUBkJpFfsgIcfMA5IfLxDrR5D79PXUHOdu1PC6SuYv9p6x6@vger.kernel.org
X-Gm-Message-State: AOJu0YzVldgYZrx2cQQe96oTl5t6l2TedU5/TKWCVmopMYnMVfFKLgnn
	ZJnUUwj/rLhhJm6VowUEQ4Z8StbKYwYgyybILo2HuKAPmMiw1oYOXHBf1qzhaoIUJNNFreJRH9q
	NuU+cLzXrU50v6PYLvGNxB1JP0rqWtsepiarQkvU1VA==
X-Gm-Gg: ASbGncuGCgLbtJZ95j13oCUXjGYsXRSBuTApfVsMBBSS3+53o4FwmbRYhA1F9olHUe6
	rmXrn4tWe+h0V6uy9fvxhmGVo8Fj/25CZjcqkhq6XWNGmP0sqsKWTc5XGi26+6dRkyNVyOBlrX4
	zW7A2PeRN7nlHKq4P7YzMfIztLUwuLowxbout31MUTNjbxZhBmFHMKIGX1elpo1yN8tMWVquWvX
	DI=
X-Google-Smtp-Source: AGHT+IGdXHk9MOPcJEsIkrUcBBcrbdbZTeRRspKa0o7hVMdnKdwLyq1jVJADdc+lM8sJtrMggELmxg/v0AA8YEwt7qk=
X-Received: by 2002:a05:651c:3044:b0:32c:102a:f02d with SMTP id
 38308e7fff4ca-32f485c5877mr3801891fa.30.1752048787410; Wed, 09 Jul 2025
 01:13:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250709071825.16212-1-brgl@bgdev.pl> <aG4eT557hI8AT38G@archie.me>
In-Reply-To: <aG4eT557hI8AT38G@archie.me>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 9 Jul 2025 10:12:56 +0200
X-Gm-Features: Ac12FXy7aI3Qs7lgagRv3GPU9z2XcHjmSgG0_MnFsJ-CNXmaAn1fS4KYQmiWBC8
Message-ID: <CAMRc=MehnbMsYj9EW3P6T-20-tYBBJ1CeKUCf8qRxva3UFdpzw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: remove bouncing address for Nandor Han
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 9, 2025 at 9:46=E2=80=AFAM Bagas Sanjaya <bagasdotme@gmail.com>=
 wrote:
>
> On Wed, Jul 09, 2025 at 09:18:24AM +0200, Bartosz Golaszewski wrote:
> > -XRA1403 GPIO EXPANDER
> > -M:   Nandor Han <nandor.han@ge.com>
> > -L:   linux-gpio@vger.kernel.org
> > -S:   Maintained
> > -F:   Documentation/devicetree/bindings/gpio/gpio-xra1403.txt
> > -F:   drivers/gpio/gpio-xra1403.c
>
> Shouldn't the driver status be orphaned?
>

It falls under the higher-level GPIO subsystem umbrella.

Bartosz

