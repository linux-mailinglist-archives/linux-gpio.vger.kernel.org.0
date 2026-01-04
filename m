Return-Path: <linux-gpio+bounces-30105-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D40ECF0E21
	for <lists+linux-gpio@lfdr.de>; Sun, 04 Jan 2026 13:07:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D4103300CB86
	for <lists+linux-gpio@lfdr.de>; Sun,  4 Jan 2026 12:07:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62E832980C2;
	Sun,  4 Jan 2026 12:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F99sMSqN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230C428CF6F
	for <linux-gpio@vger.kernel.org>; Sun,  4 Jan 2026 12:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767528434; cv=none; b=XKTcZf7rNO85/8wKw9F40dD/0H4hYislaVIMmVNcQUHfTDXIvdtwTwy4OWSg3UPoYnQWrxfbrpBOOF6V0G5JrPHdaxaLPOcd2Sf3LfwJdcjrqzDJYkxjHe8NQMWgoUoOB+/azS1sOU0sod1Stn2EgNN9uBAQc27GVKr21NSY+lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767528434; c=relaxed/simple;
	bh=NNvyyWX4s6zQYzEi25YKiL7e8RXhkosrjifCZD5E5vw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f2iTnFc7uI6jveePOGN6f7YZQtwIx+oI68x8Daz+Z77LX/qCxmUwCftc6by+hrGVQM0v3W6Qs6MvZ/Pe/hj1pZvJbpALPimqLfXGKoDKITwqGXjX8s65+JECZyKh66Ol3eamaQpfe4iPm05+IBcN05fsktsJWUQS8nOZd6qhB/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F99sMSqN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFA49C2BC86
	for <linux-gpio@vger.kernel.org>; Sun,  4 Jan 2026 12:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767528433;
	bh=NNvyyWX4s6zQYzEi25YKiL7e8RXhkosrjifCZD5E5vw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=F99sMSqNtKTS1XOYzCZAbP2BarfQXFGKiyZIqMFQ3MBN7uUtVsClTC7njmSl1zKI9
	 I8uzTVclg7H7khUTrO2CXFXpMMTJObChinfcQ2uZDU1fPFquEJNeR1VvV6EirdIRCL
	 /Hv9WvKdWVErg68rrbxuIvYUp4xen4Ivl3ulfo2Rb9hvdtf13Mw22h+UWmQLCwQbil
	 yqIhjWYuD3zZW7hpBJbfRThNhXXBJ1jI0KVqlTymYySj6ZMPzrw5O/lEa37p9BL/Au
	 8rEb0hdAP6+vR7yz2LvpI6pG2grngZjsOOgK1uPMLMfQKrITXfTlz3np8YP3Eb4B1Z
	 XLsXNB4WIx4BA==
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-640c9c85255so13090403d50.3
        for <linux-gpio@vger.kernel.org>; Sun, 04 Jan 2026 04:07:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVx0OIhQbHH1KDvnt+lUFJwLF9lDneGanmTgaSZ94WQrcbARAI2R9ji6oN7GtQA7T+YbNX3y6MmGiRd@vger.kernel.org
X-Gm-Message-State: AOJu0YwMydS5agJ/9Re/aaD+CV9hwWPIJ1UEqk4XHyCdZaF1yrEza9p3
	14xec469IeNiXKTgRAyp6jrepFgGmQe82Nr8gG5lLOcIfSXF1NAfYyzqaHgS92RhWhtJ2ubDf5+
	aylTWW4iUNLgu8HxZzT7POV3WffaOTPE=
X-Google-Smtp-Source: AGHT+IEmQp6cbGwTzqXge1KwHKoG+z5w5e3WneR+07MNzdrKCIkhm3jWBiwRI4b1zlZsBGsG3/Wbao0TEUuNqyOu0lo=
X-Received: by 2002:a53:eb84:0:b0:640:cc09:b7c8 with SMTP id
 956f58d0204a3-6466a842a27mr27876038d50.23.1767528433144; Sun, 04 Jan 2026
 04:07:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251227114957.3287944-1-ye.zhang@rock-chips.com>
 <20251227114957.3287944-8-ye.zhang@rock-chips.com> <ebb720f6-4756-437f-a71a-d94f45d732e8@kernel.org>
 <0de0f505-5858-4ea6-85a7-4c386ac205e9@rock-chips.com>
In-Reply-To: <0de0f505-5858-4ea6-85a7-4c386ac205e9@rock-chips.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 4 Jan 2026 13:07:02 +0100
X-Gmail-Original-Message-ID: <CAD++jL=Dv9Ad3EN_+WsD=tKVZORTbW5xcPaJUx3Zi7DNyvzruA@mail.gmail.com>
X-Gm-Features: AQt7F2rYKwRUFgA0GUo1cru6R2kIwdvHzJq_1rhGARF7vZUzJm-EZk1Pe49KE1M
Message-ID: <CAD++jL=Dv9Ad3EN_+WsD=tKVZORTbW5xcPaJUx3Zi7DNyvzruA@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] ARM: dts: rockchip: rk3506: Add pinctrl and rmio
 dtsi for rk3506
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Heiko Stuebner <heiko@sntech.de>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	tao.huang@rock-chips.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 31, 2025 at 9:18=E2=80=AFAM Ye Zhang <ye.zhang@rock-chips.com> =
wrote:

> This file is auto-generated to provide a complete set of RMIO
> configurations.   Our intention is to offer a generic library for all
> future board developers, so they can simply pick the needed nodes by
> phandle without manually looking up register values in the datasheet
> every time.   This improves usability and standardization.

That makes it even more important to use the standard pinmux =3D <>;
property in pinmux-node.yaml for this instead of custom properties.

If you establish a standard, then use a standard.

We have two ways of doing pin control in DT:

1. Use strings for groups and functions.

    function =3D "uart";
    groups =3D "uart-tx-rx", "uart-cts-rts";

Since a lot of people really, really like to shoehorn a lot of information
into the device tree instead,

2. Use pinmux =3D <....>;

This is an opaque property that contains magic numbers. By using the
pinmux properties, developers and maintainers know that this is some
magic numbers that sets up the mux.

No custom invented properties please.

Historically old properties like rockchip,pins exist for the same purpose
of pinmux =3D <>; but this needs to stop and migrate to the standard
bindings, not proliferate.

Yours,
Linus Walleij

