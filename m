Return-Path: <linux-gpio+bounces-21260-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBFEAD3D94
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 17:40:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D9BC1BA1B47
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 15:35:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 450322376EF;
	Tue, 10 Jun 2025 15:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bUdRhzdR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F8A22A4CC;
	Tue, 10 Jun 2025 15:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749569691; cv=none; b=ZHuFmM6LrtSmaLhP4k0s8fyOS86N4kC/zBcYez/CtS1aZA6jZSAZ1VAvu3zDtkNzHhi+1GiYRB4X6sB2OOn6RWcNXT+3Oml4WfRJEUYkHGMJNJjTdVzmLbETRy6wy1Cxy/WhUHm8k/jz1pf5BkpeBE6X8ZOl0kzhA1KT91B8TmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749569691; c=relaxed/simple;
	bh=MqIeJ3Z/v9s5PB39f8ATtxRcPHFnymAolwGEhww+kAw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=usPIpWpQZ1/nlX6/OuNk7ZZfnWJFFN236WKIwyekO2U5sVhJtjpCbUfcsO7U9Gcux8tt9TBPNB+gMz4ZVuD5v2UeZ86JM4rUE5b6c3Qg7u3H6WDoN4GKQ7tuwNICDgDVikzNMG9nlgKgRaRW0E1EI5oXQprSI6XEp4gjCZ+CRVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bUdRhzdR; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-551ed563740so6935453e87.2;
        Tue, 10 Jun 2025 08:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749569687; x=1750174487; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MqIeJ3Z/v9s5PB39f8ATtxRcPHFnymAolwGEhww+kAw=;
        b=bUdRhzdRSIG7PiIhtzBR+B3559hGuRAIhLZtlPV7RoZ/mWWyOwGVLLg71RbgeECBwC
         QRb53niQ0/JEMSb8V/f/MgP+E47MFLYthXMTr42gBeJ45BLKzCVZt1s2f5XsqyW+30rE
         9SdNZTku1orNJ6o+s4TS0XJv9l4OoAM0kVmkAYIYz26sxEGiwxs5cM5RfRFqeYLszCGM
         IfAhtKBNARxVC2FTkwesNSVLX6GJQMa/n6Lw6FCmpVhVFwH3LuchCZw7y77sCf0ttupb
         CZQzOBi5jnxKtaegdmEhVxCXKiK/IlkoqrYOI+akY7VytM9wsidLeWcZ4OEEO6JCpM9C
         I3XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749569687; x=1750174487;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MqIeJ3Z/v9s5PB39f8ATtxRcPHFnymAolwGEhww+kAw=;
        b=eMtEep6wf4CnXxlb6CBz3t2fITfhpWmkVsiAF19MdipT2Rh039bTS5ZhchEqmQw/ps
         z1qj8LfgL+tzbGxzKLwqXru664xcTR7VagZms+UI1yZ9JPCyBHeRUeANuXkXpMRMh52D
         zhl3vhi6td+utPT1KlhoPD5O0MDmnu3JCepnI5YAl4qi8qhCNYWhVY8PB5P0mg96rgy7
         JpHiZbdBkVJ+xXdX3l2PhN0xv09Xy/nnWq5eL7VqbeUytaKWGbfZOBB9fSvwZZMR3/hV
         +GoBD9RRImHE8tkOUJv3h+dxMSsK5czxkW842VL5wCu4V6hBGInfaMFxbgIbzeBjliLx
         IHsA==
X-Forwarded-Encrypted: i=1; AJvYcCUBQhy1QAdXINgHZxvl8wkWAU2fLKpEldr1nqeWzeNIP+BTpWFLQDTJRzbjQlpYXnEze3B7wLHI1nQz@vger.kernel.org, AJvYcCV3aCT6yIMufr1I6gVgAaqzSho1Toswf1FcWwkaRXKii/OCe/VSvteh+Ze4JhnyGyTVdSAHCVqIDzs5xw==@vger.kernel.org, AJvYcCVuQH8/p8XKY3wEG+KxFEXrTFsk6XmJf5U736Kvs5AESfzwiPNKeLwE/GCQ/A9aBpwj+4vaW6qN0rz1uoaj@vger.kernel.org, AJvYcCW8/oXf4nKigmKuAo4HGaapoP+OVvn/CqToejC7kM91SF8p9anLgs9na+VKH5Ut1oPmXwcGhyuYuXFigNA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7rSBHkRzMeFwPM1ElZ6G4f5Jh5rX0Fmpb0ItLQWiYq+f/S/Ld
	u7dz2Zgv44zxJ6WjDkCq5gSmjNTCGUwuq1ceuR/zXqONZ9H9IwL3fP/Lqxz2M3fuktpmvWTzywr
	UXOACQIwk3gjSJ88i8zM3up4HldwlcHM=
X-Gm-Gg: ASbGncvRIC9qUB5q1KurYOWKLMf+gdHK+aXpkHkNl8wx/Mhq3QJlUEUObEVF5xKH9uZ
	UKp1hWwadyRTBY4MBuL1eMF9nLA7GZHNdCZfpUK7hhMZaBWYVkW34WWEk+eNKNtzWSOxf+ZuOJc
	6E73wLhsFRkQzhKwOlERuxkbkv0QkWT7MUd9tRsCiDhmc=
X-Google-Smtp-Source: AGHT+IEJ1ZmrGjCVMSTlbre49ihcrED5/bqIPNHDU9iGhqG87iTWzIVwBOxMYwIwqyAgvBsr9yQYrbRSg02Hs0mulTM=
X-Received: by 2002:a05:6512:12ca:b0:549:8a44:493e with SMTP id
 2adb3069b0e04-5539c0a32a6mr14812e87.5.1749569687142; Tue, 10 Jun 2025
 08:34:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250608-tegra186-pinctrl-v2-0-502d41f3eedd@gmail.com>
 <20250608-tegra186-pinctrl-v2-2-502d41f3eedd@gmail.com> <yw2uglyxxx22d3lwyezy34wdniouu32zppfgwqs5omny3ge5zd@iuqo4qmi55a2>
In-Reply-To: <yw2uglyxxx22d3lwyezy34wdniouu32zppfgwqs5omny3ge5zd@iuqo4qmi55a2>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Tue, 10 Jun 2025 10:34:35 -0500
X-Gm-Features: AX0GCFsd7xdIB9QWQua1RQ4pRCI39zZoWW2thwkZ7CPS9rox8nnF-LfaH58f7aE
Message-ID: <CALHNRZ_gy_wJxAW85d0EnpY4Qa2h+tuR=CM2AE26r0UEdYz8ag@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] pinctrl: tegra: Add Tegra186 pinmux driver
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 4:40=E2=80=AFAM Thierry Reding <thierry.reding@gmai=
l.com> wrote:
>
> On Sun, Jun 08, 2025 at 09:13:14PM -0500, Aaron Kling via B4 Relay wrote:
> > From: Aaron Kling <webgeek1234@gmail.com>
> >
> > This is based on Nvidia's downstream 5.10 driver, rewritten to match th=
e
> > mainline Tegra194 pinmux driver.
>
> A few words upfront, to justify why I'm being pedantic. Originally the

I don't mind pedantic. Get it right the first time, save later pain.

> pinmux drivers were generated using the tegra-pinmux-scripts[0]. This
> project was later archived because Tegra210 was deemed to be the last
> chip to need a pin controller. It then turned out that Tegra194 needed
> pinmuxing for certain pins, and then more, so we ended up with a full
> pinmux driver for it. However, we also deemed Tegra194 to be an
> exception, so that's why that pinctrl driver was a one-off job.

Tegra234 also has a pinctrl driver, which makes tegra186 the
exception, when looking at the driver list without any other context.

>
> I now regret these decisions because the same formatting mistakes are
> now proliferating, which is exactly what the scripts were meant to
> avoid.
>
> One thing that's not clear from this patch set is whether we actually
> need the Tegra186 pinmux driver, or you're only adding it because it
> happens to be present in a 5.10 downstream driver. Do you actually have
> a requirement for setting pins dynamically at runtime? Do you need to be
> able to set a static configuration at boot that can't be set using some
> earlier bootloader/firmware mechanism?

I have a device that's based on p3509+p3636 with an audio codec,
originally targeting l4t r32. The odm provided instructions to use the
codec was to first run the jetson pinmux python script after boot... I
made that less bad by putting the pinmux in the kernel dt. But I see
similar recommendations all over the nvidia dev forums, even for t194
and t234. Solely for that reason, I'd think it reasonable to support
the kernel pinmux driver on all tegra platforms: to allow easier
porting of l4t devices. And a secondary argument could be made for the
devkits: they have expansion headers with mux-able pins, prototyping /
experimenting with those at runtime via sysfs is a valid use case.

Taking a look through the public cboot sources for t186, I'm not
seeing that it handles pinmux at all. With one or two exceptions like
the t194 pcie stuff. How is it expected to configure pinmux at the
bootloader level? Using the auto-generated mb1 flash config? I'm
unaware of this being publicly documented anywhere, not just for t186
but for any tegra arch. And the format of those aren't particularly
easy to read and hand modify.

>
> If we really need this pinctrl driver it may be worth resurrecting the
> tegra-pinmux-scripts so that we can add these drivers based on the
> generated files as originally intended.

Imo, this would be ideal. That will require some updates to the
scripts to handle the main/aon split. I don't think it's something
that can be done externally either as it depends on the internal only
pinmux spreadsheets as the starting point for a soc or device. But if
that's done, all the format issues will be sidestepped and this series
will be superseded.

Sincerely,
Aaron Kling

