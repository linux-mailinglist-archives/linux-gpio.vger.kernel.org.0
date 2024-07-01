Return-Path: <linux-gpio+bounces-7852-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD9691DE24
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jul 2024 13:35:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 284CC1C22738
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jul 2024 11:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB0E01422A8;
	Mon,  1 Jul 2024 11:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T99lJKBP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CAF313F43C
	for <linux-gpio@vger.kernel.org>; Mon,  1 Jul 2024 11:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719833710; cv=none; b=aJ9xqfRVdHGe07mdvRN0bnhXSYkg4IomEr9HQpLpQkNT34WsGZkqAPQm1d/bUjT8ogwpEkVE0ZvQDAwejYYIJemS7lF2RoPn8A3BY5fR3pxOjE4l9FxkkzuVCq/54JP82Bq+VCCVb8a5J5t648OE+yOaFwdY6kSfudTkOoDsVMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719833710; c=relaxed/simple;
	bh=1NrrH/4GMikvLAny3aFE53sPW3zaL/PS5U1g46tV1/g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bYrZXd6RnxeklKXw2+X9PY1+gQ7ESq30Ol/qB9i53xUsYeTorWiMQXgJAphqmSnvDig3cXqYlAQ+/MkcKRirziijZR7aHM5zPp6eFSwB7F3C57xjFcZUjnqfDvUaWbPd8EndXJRrANqgH7W4SaOs5/xmR1LpMCddfdHUOZZ1+fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T99lJKBP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF07AC116B1;
	Mon,  1 Jul 2024 11:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719833710;
	bh=1NrrH/4GMikvLAny3aFE53sPW3zaL/PS5U1g46tV1/g=;
	h=Date:From:To:List-Id:Cc:Subject:In-Reply-To:References:From;
	b=T99lJKBPNu/x8uDrxUPta1yomvDa8eK4INp9fEi0/CPE1wlayjnre9DvF3G8t8+2o
	 /vRbt+QZ6Jm43H7bjaT+CfmGo0xE1CIKfMyuRQ4slF2R5hlB3Uyk8l6TJoG+nvibQ7
	 rX3qm1LCm/gfWx+MrImOESmP3/L7i2xR0MWjDK7KNTDCp0D7Cp8aDfdMczPmDq2iwN
	 rW2+AIUXq9X2l3qpK8bs8U5OHdZdqEdOg0OJtPEs/txADH8GnMxLa0n1XhCctypalR
	 IVNSz2bxJveDcgFeqGAlPfhqda4fTcFI1snif3+04waV9mGWYY179JXOIlzi2F/DI6
	 rmMqnpH9I5qJw==
Date: Mon, 1 Jul 2024 13:35:04 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Arnd Bergmann
 <arnd@arndb.de>, soc@kernel.org, arm@kernel.org, Andy Shevchenko
 <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Ilpo
 =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Linus Walleij
 <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v12 3/8] platform: cznic: turris-omnia-mcu: Add support
 for MCU connected GPIOs
Message-ID: <20240701133429.1f2650e1@dellmb>
In-Reply-To: <CAMRc=MdpJUaJ3B64TTdt8B=PeJwR+BjiCx1SJj+SJGOT=LtT9A@mail.gmail.com>
References: <20240617152606.26191-1-kabel@kernel.org>
	<20240617152606.26191-4-kabel@kernel.org>
	<CAMRc=MdpJUaJ3B64TTdt8B=PeJwR+BjiCx1SJj+SJGOT=LtT9A@mail.gmail.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 1 Jul 2024 11:37:44 +0200
Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> On Mon, Jun 17, 2024 at 5:26=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.or=
g> wrote:
> >
> > Add support for GPIOs connected to the MCU on the Turris Omnia board.
> >
> > This includes:
> > - front button pin
> > - enable pins for USB regulators
> > - MiniPCIe / mSATA card presence pins in MiniPCIe port 0
> > - LED output pins from WAN ethernet PHY, LAN switch and MiniPCIe ports
> > - on board revisions 32+ also various peripheral resets and another
> >   voltage regulator enable pin
> >
> > Signed-off-by: Marek Beh=C3=BAn <kabel@kernel.org> =20
>=20
> This is one heck of a complex GPIO driver!

The complexity comes from how the MCU command API was engineered and
then when I took over the MCU firmware, I had to extend the command in
a way that would ensure backwards compatibility.

> > +
> > +#define _DEF_GPIO(_cmd, _ctl_cmd, _bit, _ctl_bit, _int_bit, _feat, _fe=
at_mask) \
> > +       {                                                              =
 \
> > +               .cmd =3D _cmd,                                         =
   \
> > +               .ctl_cmd =3D _ctl_cmd,                                 =
   \
> > +               .bit =3D _bit,                                         =
   \
> > +               .ctl_bit =3D _ctl_bit,                                 =
   \
> > +               .int_bit =3D (_int_bit) < 0 ? OMNIA_GPIO_INVALID_INT_BI=
T  \
> > +                                         : (_int_bit),                =
 \
> > +               .feat =3D _feat,                                       =
   \
> > +               .feat_mask =3D _feat_mask,                             =
   \
> > +       }
> > +#define _DEF_GPIO_STS(_name) \
> > +       _DEF_GPIO(OMNIA_CMD_GET_STATUS_WORD, 0, __bf_shf(OMNIA_STS_ ## =
_name), \
> > +                 0, __bf_shf(OMNIA_INT_ ## _name), 0, 0)
> > +#define _DEF_GPIO_CTL(_name) \
> > +       _DEF_GPIO(OMNIA_CMD_GET_STATUS_WORD, OMNIA_CMD_GENERAL_CONTROL,=
 \
> > +                 __bf_shf(OMNIA_STS_ ## _name), __bf_shf(OMNIA_CTL_ ##=
 _name), \
> > +                 -1, 0, 0)
> > +#define _DEF_GPIO_EXT_STS(_name, _feat) \
> > +       _DEF_GPIO(OMNIA_CMD_GET_EXT_STATUS_DWORD, 0, \
> > +                 __bf_shf(OMNIA_EXT_STS_ ## _name), 0, \
> > +                 __bf_shf(OMNIA_INT_ ## _name), \
> > +                 OMNIA_FEAT_ ## _feat | OMNIA_FEAT_EXT_CMDS, \
> > +                 OMNIA_FEAT_ ## _feat | OMNIA_FEAT_EXT_CMDS)
> > +#define _DEF_GPIO_EXT_STS_LED(_name, _ledext) \
> > +       _DEF_GPIO(OMNIA_CMD_GET_EXT_STATUS_DWORD, 0, \
> > +                 __bf_shf(OMNIA_EXT_STS_ ## _name), 0, \
> > +                 __bf_shf(OMNIA_INT_ ## _name), \
> > +                 OMNIA_FEAT_LED_STATE_ ## _ledext, \
> > +                 OMNIA_FEAT_LED_STATE_EXT_MASK)
> > +#define _DEF_GPIO_EXT_STS_LEDALL(_name) \
> > +       _DEF_GPIO(OMNIA_CMD_GET_EXT_STATUS_DWORD, 0, \
> > +                 __bf_shf(OMNIA_EXT_STS_ ## _name), 0, \
> > +                 __bf_shf(OMNIA_INT_ ## _name), \
> > +                 OMNIA_FEAT_LED_STATE_EXT_MASK, 0)
> > +#define _DEF_GPIO_EXT_CTL(_name, _feat) \
> > +       _DEF_GPIO(OMNIA_CMD_GET_EXT_CONTROL_STATUS, OMNIA_CMD_EXT_CONTR=
OL, \
> > +                 __bf_shf(OMNIA_EXT_CTL_ ## _name), \
> > +                 __bf_shf(OMNIA_EXT_CTL_ ## _name), -1, \
> > +                 OMNIA_FEAT_ ## _feat | OMNIA_FEAT_EXT_CMDS, \
> > +                 OMNIA_FEAT_ ## _feat | OMNIA_FEAT_EXT_CMDS)
> > +#define _DEF_INT(_name) \
> > +       _DEF_GPIO(0, 0, 0, 0, __bf_shf(OMNIA_INT_ ## _name), 0, 0)
> > + =20
>=20
> One coding-style nit: can you add newlines between these macros?

Sent v13 with this change.

> I'm having a hard-time understanding the entire architecture of this
> MCU but the code overall looks good to me so I trust you know what
> you're doing.
>=20
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Thanks.

Marek

