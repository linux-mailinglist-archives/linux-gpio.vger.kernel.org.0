Return-Path: <linux-gpio+bounces-15083-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E89A20F50
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jan 2025 17:58:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E321B1685DB
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jan 2025 16:58:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A83A1C5F37;
	Tue, 28 Jan 2025 16:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jcnvgYKc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40751ACECE;
	Tue, 28 Jan 2025 16:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738083497; cv=none; b=LukvOVAJeRnuynxfG1GJkRTGJcs+ayG/DD3lJb3/aPM6QxvthFS124DlibZPSbp3Dwk3hMIs+O7KdGfcwW3IWYa131nFk5AwZ8pRII0GhbYU2/nALFvBzCLQLSl9vkFwnshuH9LWQmsllbAMTmOABkVbh0yTMUrEAkGeOHki7KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738083497; c=relaxed/simple;
	bh=y0G/CNUpOShOI21G2rXVvvmIYC7FYgCkYYNmc2IXvb0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OWJEZr9zDF05gXBZrBv5ly3AU6aJVDoNFK7+YZDywhsN0SSlhU3TdOkDETc7lNY6HsKRgEOPWMysbUjSMPBvcaamfBhMpzTAmrEB0iBI+sD4XzlwwY6LPHqCg90K0e6HD9+/f4zvDXUE7ooJWonkNr0RrGrT60ss5pkAewh/jaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jcnvgYKc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52982C4CEE9;
	Tue, 28 Jan 2025 16:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738083496;
	bh=y0G/CNUpOShOI21G2rXVvvmIYC7FYgCkYYNmc2IXvb0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jcnvgYKcqmBb61GSD68TxjoEjj0LXe3WZBmBGGn9fWCWJ8yanWHrpbCZ/5ELUrJIK
	 gAvjAwegHqkbQY4lSItbsbP9NVc6aZz1gJEVm/lqxykxYB9SE3ZpDzxqZiAOejT9W+
	 W806RdH6d+0khAyUdR0fhS38zNaPsDANx1zgvg3YZCetkQZdEtgtQom6WH9xQI0HLR
	 4gkGoI+d6WqXx2R17sK05xfQhjctLuID45bIv098Pakd5MCCeAKLCZ6DVgaqdTiL3X
	 pWCl1+sPXbO6L7gw4CWAAVdKsbunNw+rdFl2AZ7vc1i5bOJXOpLSHT76oBAi3aMo8x
	 1kKcltAko2eFw==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53e3a227b82so5312034e87.0;
        Tue, 28 Jan 2025 08:58:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUdmRKtIgRgVliFQ9fpY8ogXd5mhRGi61MWyXZt8R+w70IvejzFeqZwOushl9IyjVxtGSR5o41Xx3a1kw==@vger.kernel.org, AJvYcCUmuXq5Q4x/TVrNW2DRVixPK2uE3EFPe/6la47BT6z9rvf2RqxFnsfr85Mk3sGNo5qr4Nq3NKDs82u1Hg91@vger.kernel.org, AJvYcCX7wkv79cg0P9YPEt2I83rzbb+LUkIkbADMBME9PsEohmUtv50Szqu2m6pKDYLyrnPIli5+C2GMfbpS@vger.kernel.org
X-Gm-Message-State: AOJu0YysExt5aSzZQwZrFcnRYU4hjXYajWpdgL86KJCOdPzlatmo1yNb
	bzvt2WNn6hnMUpY/SNOfz3RtjuLax5Covr2yi7G0gx+L/6iwZD2iWJ2usM0dqAWX1O3MS8Gb9PU
	YUN9QH+PluXc+5Jsm1DX+8VCiSw==
X-Google-Smtp-Source: AGHT+IGZBJ5sNC4e/lfqrnbWISj/cWgnjLcnpHkbkXiOQn3yUrA0tM+/GVs4Jx8zNEw9eiDrE3RJVIQzxYNeXv8+DK8=
X-Received: by 2002:a05:6512:159b:b0:540:358e:36b9 with SMTP id
 2adb3069b0e04-5439c2807e3mr17546566e87.45.1738083494575; Tue, 28 Jan 2025
 08:58:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250121-03-k1-gpio-v4-0-4641c95c0194@gentoo.org>
 <20250121-03-k1-gpio-v4-1-4641c95c0194@gentoo.org> <Z5FPJLzAEVXGWJnE@chonkvm.lixom.net>
 <20250123113042-GYA38135@gentoo> <Z5LOdh-4UxRtteOy@chonkvm.lixom.net>
 <20250127181726.GA538260-robh@kernel.org> <20250128031712-GYB47737@gentoo> <CACRpkdYbSOHD9UH5=+qjztxS3Cq_rxaoOT9tFtD8ZWm9zQGnPw@mail.gmail.com>
In-Reply-To: <CACRpkdYbSOHD9UH5=+qjztxS3Cq_rxaoOT9tFtD8ZWm9zQGnPw@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 28 Jan 2025 10:58:01 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+f56DoH5YTV85ZqP52sMzkOtHtjWzQ7Tu4FhKSjTSpEQ@mail.gmail.com>
X-Gm-Features: AWEUYZnuV1NO_CdVjSEHj4BGZlEY-zMnXERRyRsEZ22al7MVrBDW1ebcFa4k10c
Message-ID: <CAL_Jsq+f56DoH5YTV85ZqP52sMzkOtHtjWzQ7Tu4FhKSjTSpEQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: gpio: spacemit: add support for K1 SoC
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Yixun Lan <dlan@gentoo.org>, Olof Johansson <olof@lixom.net>, Bartosz Golaszewski <brgl@bgdev.pl>, 
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

On Tue, Jan 28, 2025 at 10:03=E2=80=AFAM Linus Walleij <linus.walleij@linar=
o.org> wrote:
>
> On Tue, Jan 28, 2025 at 4:17=E2=80=AFAM Yixun Lan <dlan@gentoo.org> wrote=
:
>
> > [Rob]
> > > If Linux can't handle 1 node for N gpio_chip's, then that's a Linux
> > > problem. Maybe it can, IDK.
> >
> > I haven't seen somthing like this to register 1 node for multi gpio_chi=
ps..
> > To gpio/pinctrl maintainer (Linus Walleij), do you have suggestion on t=
his?
>
> For Linux we can call bgpio_init() three times and
> devm_gpiochip_add_data() three times on the result and if we use the
> approach with three cells (where the second is instance 0,1,2 and the
> last one the offset 0..31) then it will work all just the same I guess?
>
> foo-gpios <&gpio 2 7 GPIO_ACTIVE_LOW>;
>
> for offset 7 on block 2 for example.
>
> We need a custom xlate function I suppose.
>
> It just has not been done that way before, everybody just did
> 2-cell GPIOs.

You can do either 3 cells or 2 cells splitting the 1st cell into
<bank><index>. I'm pretty sure we have some cases of the latter.

Rob

