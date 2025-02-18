Return-Path: <linux-gpio+bounces-16180-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A75FA39758
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2025 10:45:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C6B8170655
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2025 09:45:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7194C230274;
	Tue, 18 Feb 2025 09:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vBXM/rx6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC5222B584
	for <linux-gpio@vger.kernel.org>; Tue, 18 Feb 2025 09:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739871914; cv=none; b=AXUl7PoxFgmpWagfbuTbUqIb8Mf7sr/79jyUAg3NuMhYNRDKA94duX67aybgIimFodAFiv6xh/967GQfXCedXmwiajBIjNnO92ixVa/Q00pyZPcDuwFJzMfYbBUJC9RDoF+T0fhJgMGj4Ft635jG6wZElqS1Z0rhUOZTLmW3YtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739871914; c=relaxed/simple;
	bh=7fXt6T5kmLlXgE+CzxBthLo33V/bf++Dbg39Nps04Mk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mSRucB8Z3NiHcqEvAYFLhtIqwSdFLswmY3Sr2g9PUPjIQ8iyE78oWcTwBmenojC/YgB7njI0L4Q8P4Y3pn9dxgKsyv5dUOuVTAPRtymt6O2gr4bOpID/l/3f7EQgw7+RCKXaEU8tDUgcsL4GVycAlsxOWHJxTlA+4O4gfve0rgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vBXM/rx6; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-307c13298eeso54783111fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 18 Feb 2025 01:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739871910; x=1740476710; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BN2VhcauqG9RbV8MqCf3noWGKfT4ixMjIIxfEPq00RA=;
        b=vBXM/rx6yUBhusU238+qeS5vNPlYLG6dDHdZA07UwZlwJtotWgoPo/hUB3gAM48rb6
         R2mwZkFc60NU+v3Bo1IdyWKnfEwhj72+SlfkOXjDI96OG386U80q1WERDMAmfLJ1HX9u
         S+dAuH7GewfXCgLO6R07U1fUKTSBI2f7nuAGMUYVhLEF42SBoL0uNVC2hPu/rPhFUPIv
         hk7Dbl9rByCwrk723bHAVG884FggE2CYoVJiJCsCQ+Q7XiXKo6sYIM8JQt8RTqoU/jei
         naBM/en6wzAsNb7ddmTfeCzD0LsSJ5BBgFIZzRGup5gvpUFxc/slyl/cnvxxaRTi5LBv
         EFJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739871910; x=1740476710;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BN2VhcauqG9RbV8MqCf3noWGKfT4ixMjIIxfEPq00RA=;
        b=S3k2Twm1SUn0/bEYOgAtQHmra3A9DbwspcPzwXdzDss8tV6PQsPHKgVWJpsuGHckt+
         ybNVpWxhFrxo8QDlH1lGnycqVppKirEPd3urvgsC5q1d1aYip3fWmcGnvCK5hleJ3FTP
         97Nz9ZDw8BbFH81NyWBbNwOKdvPDs/cyhKBM75k4S/6IOU1JhOhuFMx+EfBQIZaZ8XfH
         +Pv7v/48GpG17fTT+VaM43fWWEwBk1U79J53DwKSP8l/kI1bIdwotzxnjIwGAOKUNre3
         EDpJprRzocaJYb7sVd1jMQQUIGsxS+FJd11jeZA0gy6B3VnJMuRX0BNw2vMZTKyZEWst
         cIwg==
X-Forwarded-Encrypted: i=1; AJvYcCXcb/7035LHXySTtzvkwDJL8hveH8DiZmYMoUhMeOiFFZ18lH2fYtTDiJY4aJPy9Y91jElTfYrH33xZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw24pQbOrEsMi1x8gVNDaKjr/YJIxNU23XuAgVn2esmeWeSp7pn
	tm5TVhToGtTQBkUHbdeI0qVkj29iJM/+RNuir/X0Oil/2bvIlRXVdH3xxJnm6ZjgWI361R5KU2d
	fOGxvapM7rbqQU74WuNlDSl/l8QOTulhOztxFGw==
X-Gm-Gg: ASbGncsrA0qXShCr3wvc2wktB0m3UEMCuODW+94tYdRoeIMB8+n7FGMzUIqQuFlSsTA
	gngbGBVCkQB8QADoafk/pPJYOW5oOF4GfMhEhGZEt91F20pxmk211Cp4Tje9LEi5Nf9a7tjh+
X-Google-Smtp-Source: AGHT+IGxEO+DF5kRzIjq3qFDfgxYzzAxwLSdI984z84zV2jQrwPlYtypYU1pgjXiiaRe+HuUJiU9UcU2s7gThRggfQU=
X-Received: by 2002:a2e:8457:0:b0:309:31bf:ec17 with SMTP id
 38308e7fff4ca-30931bfef5fmr28690911fa.15.1739871910394; Tue, 18 Feb 2025
 01:45:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250121-03-k1-gpio-v4-1-4641c95c0194@gentoo.org>
 <Z5FPJLzAEVXGWJnE@chonkvm.lixom.net> <20250123113042-GYA38135@gentoo>
 <Z5LOdh-4UxRtteOy@chonkvm.lixom.net> <20250127181726.GA538260-robh@kernel.org>
 <20250128031712-GYB47737@gentoo> <CACRpkdYbSOHD9UH5=+qjztxS3Cq_rxaoOT9tFtD8ZWm9zQGnPw@mail.gmail.com>
 <CACRpkdZa887vx4Lmxk1U_8w5n7AxMnyzGexeYzhsxNGT-DTYcQ@mail.gmail.com>
 <20250206133156-GYA5687@gentoo> <CACRpkdZYYZ5tUR4gJXuCrix0k56rPPB2TUGP3KpwqMgjs_Vd5w@mail.gmail.com>
 <20250214115410-GYA21743@gentoo>
In-Reply-To: <20250214115410-GYA21743@gentoo>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 Feb 2025 10:44:59 +0100
X-Gm-Features: AWEUYZnVti-LvZHDXYhaweA_xJfXLbPMVGPKFtEd0c95Dmo8gtzeCdJx9Be6kOY
Message-ID: <CACRpkdaQZ5wJ0S=FfTzBkZOfCE7zvTPQ-wn53rHcZztbHLC8xQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: gpio: spacemit: add support for K1 SoC
To: Yixun Lan <dlan@gentoo.org>
Cc: Rob Herring <robh@kernel.org>, Olof Johansson <olof@lixom.net>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Yangyu Chen <cyy@cyyself.name>, 
	Jisheng Zhang <jszhang@kernel.org>, Jesse Taube <mr.bossman075@gmail.com>, 
	Inochi Amaoto <inochiama@outlook.com>, Icenowy Zheng <uwu@icenowy.me>, 
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 14, 2025 at 12:54=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wrote:

> thanks for this very detail prototype! it works mostly, with one problem:
>
> how to map gpio correctly to the pin from pinctrl subsystem?
>
> for example, I specify gpio-ranges in dts, then
>                 gpio0: gpio@d4019000 {
>                         compatible =3D "spacemit,k1-gpio";
>                         reg =3D <0x0 0xd4019000 0x0 0x100>;
>                         ...
>                         gpio-ranges =3D <&pinctrl 0 0 96>;
>                 };
>
>                 foo-gpios =3D <&gpio0 2 28 GPIO_ACTIVE_LOW>;
>
> It should get GPIO_92 ( 92 =3D 2 * 32 + 28), but turns out GPIO_28
>
> Probably there is something I missed...

No it's just me missing the complexity!

> to make the gpio part work, we need additional custom gpio-ranges parser,
> which should similar to of_gpiochip_add_pin_range() in gpiolib-of.c
> (at least gpio core need to adjust to call custom this function)

Let me send a patch set to bring threecell into the core instead,
and see if it works for you!

I will post it real soon.

Yours,
Linus Walleij

