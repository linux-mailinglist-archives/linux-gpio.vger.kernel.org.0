Return-Path: <linux-gpio+bounces-3501-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C5685BACE
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Feb 2024 12:42:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB3D41F23AD0
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Feb 2024 11:42:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FF1E66B2D;
	Tue, 20 Feb 2024 11:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="zqE1ULDu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3348167C64
	for <linux-gpio@vger.kernel.org>; Tue, 20 Feb 2024 11:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708429336; cv=none; b=CRYxWzeQkFspbD+x2xOct6J9uTP4BOHeWozNggFcUW7locPEoF29yV2q7lz8sRSbnbwxUCHaXbq/MDrNfm9OEZ5tlbgho15FdPb+yydeN/qntk3siLC+3CZjMOAyN995SZd9w3A9/x6RXtycZxIufyiMe8mNguFg8KvpOVbQR3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708429336; c=relaxed/simple;
	bh=ouR2+vSQw/fSXVao+thlbu3IjNZ33JoflBcFWY3O8Jk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DhwXZAjwmsyZNyyk+PLkx0JMO0SFLsEmnYNwJjSbKt3rpf6dlO13M8eC271OkJrtbObUEUphKaXLN8IOTpskYxdfCB5njyMj+owr1BvQNA1Qf5VCZYZj730PP4kColzNURuY1fjrt8iwvqvMSF0ImG0lpXOqUBaMIyGDNk5PKiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=zqE1ULDu; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-4cb26623dc1so526428e0c.2
        for <linux-gpio@vger.kernel.org>; Tue, 20 Feb 2024 03:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1708429333; x=1709034133; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AsA1IuJ1QgZr3RxDT4dHm54eEdxgfhuTT8X+jj/Chbk=;
        b=zqE1ULDuEYEjsylSbBQU4zhm/yArJK978TWf3jKkxUIiwW5XiToMdRgkqF5hQseidX
         X3CR8GsFEQ0TGEjFOcy8zD+YZiCuWlMueyKy+fSwE+bewsc1p3J6GFl3HbOgxtaOP873
         gXZqAp31rH8PhkH3STA+0P4iXoV4VTXjxzYmC+K02khLFBWjxqqIJX9rL7hYB7ly4TE9
         hrdFwL016oeDPcfNTSr162fURpO7aevF6oQCcLhfGy6K308RegpC1lEDxoVLdCnKbjUc
         C4HJnNTTFouXjmOBbp13A7XO4aTETwMbgGooBruF+9+TNDE3AfLLcroXBSEUHuPntSiL
         rIHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708429333; x=1709034133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AsA1IuJ1QgZr3RxDT4dHm54eEdxgfhuTT8X+jj/Chbk=;
        b=vLc46m+PU5lpRuXk1EDi0akm5CEOyJ2kHdCF3p5sgjyA4CX//CFC4LmmSliDXUfKUi
         M5rJETrVBgn/4YRzsOaJnz+VgIfy43iwLdDxGFgRWADvHBJCha1w1hE8Q1wpIxIKNb3k
         JwAGie0ch8Iu2RhkNfg+AcJs0E5sfOovicjDkYEExNU8IgMK3Pr/mPT1zdYtZWFgQpMH
         gLxc1wyYJB5H88TLTmejnwLMucez7SVLDVy1HPcT7Np4EcjwlBaWIyZSit7hruDgGIeN
         YRVzBvX0A4AXJrI282G3J9z1FKjg9kOVABMOmE2z9A7cJNi774ifos6/+5H5iDB6d4FR
         QfFw==
X-Forwarded-Encrypted: i=1; AJvYcCWkR+cTUam8/d7DodToktdJZ9tHA1WZNeUN/JQQJy3W8BsEpPw0fZfxJRXj0i7tTWZ8GwQJot6GkEFo8ok5hJZ8Z4oEJU2RqYXT5Q==
X-Gm-Message-State: AOJu0YzhHdAxtvlejEqR5hdDVcYwJ0cIJpCinJ0lpK1axzdweUDiL+FP
	hqdxrhmiJ2U3VG5Nj3FXVNsHp57DS6PZpEb0rI3c7GNW/VQ1qaubMMNnKwRaaEfqP3bwthRx7e8
	UzIyOEe+aeRhLQd6aQA7v3+EFJZPiPyKYDgFqfA==
X-Google-Smtp-Source: AGHT+IHcllRQy0QvMPlfXyC0j4mq7HZDSa6oNk423QQzmnQONpsBgUoG4iBcidN29kecafPXzp6gdVs8vJxKCKzoCyQ=
X-Received: by 2002:a1f:4b07:0:b0:4c0:2182:3cdc with SMTP id
 y7-20020a1f4b07000000b004c021823cdcmr11701946vka.1.1708429333138; Tue, 20 Feb
 2024 03:42:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240213160522.37940-1-lincoln.wallace@canonical.com>
In-Reply-To: <20240213160522.37940-1-lincoln.wallace@canonical.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 20 Feb 2024 12:42:02 +0100
Message-ID: <CAMRc=MdoUuOLTYHu99+c_AVhnDZ5LkKHkYJ0D681fcJV_aW2Ng@mail.gmail.com>
Subject: Re: [PATCH] Documentation: gpio: Add a note on the deprecated GPIO
 Testing Driver
To: lincoln.wallace@canonical.com
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, corbet@lwn.net, linus.walleij@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 13, 2024 at 5:05=E2=80=AFPM <lincoln.wallace@canonical.com> wro=
te:
>
> From: Lincoln Wallace <lincoln.wallace@canonical.com>
>
> A deprecation note was added on gpio-mockup Kconfig since v6.7,
> update the documentation to inform users.
>
> Signed-off-by: Lincoln Wallace <lincoln.wallace@canonical.com>
> ---
>  Documentation/admin-guide/gpio/gpio-mockup.rst | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/Documentation/admin-guide/gpio/gpio-mockup.rst b/Documentati=
on/admin-guide/gpio/gpio-mockup.rst
> index 493071da1738..a6424de925da 100644
> --- a/Documentation/admin-guide/gpio/gpio-mockup.rst
> +++ b/Documentation/admin-guide/gpio/gpio-mockup.rst
> @@ -3,6 +3,11 @@
>  GPIO Testing Driver
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> +.. note::
> +    Since kernel version 6.7, this method is being deprecated. Prefer us=
ing
> +    Documentation/admin-guide/gpio/gpio-sim.rst instead for kernel versi=
ons
> +    newer than 5.17, which is when gpio-sim was added.
> +
>  The GPIO Testing Driver (gpio-mockup) provides a way to create simulated=
 GPIO
>  chips for testing purposes. The lines exposed by these chips can be acce=
ssed
>  using the standard GPIO character device interface as well as manipulate=
d
> --
> 2.40.1
>

We already have a note on that, thanks.

Bart

