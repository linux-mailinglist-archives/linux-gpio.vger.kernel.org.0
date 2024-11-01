Return-Path: <linux-gpio+bounces-12457-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 768EC9B910E
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 13:17:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B4311F2166B
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 12:17:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E0AB155300;
	Fri,  1 Nov 2024 12:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ouDS2uda"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E092FC13C
	for <linux-gpio@vger.kernel.org>; Fri,  1 Nov 2024 12:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730463431; cv=none; b=DC90jn3J5yzITUicyadF7gOm1fzSw+uWbJaylRenqC2wIyhqxrKYVZMK0Km4BACpM1MlR3UbG0SGXtb5x0YKIzKBUxsNHsp7gfocbKLSSa9h3InO0q/8dTmvdA10MsOZRLluJvE9yQdAxI2Vu7fChK0vwvtdqn5HwIoT6KRUxGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730463431; c=relaxed/simple;
	bh=RLfSo4O4fxkfzXfQp6pUx6oskYOHg2FVGUk83HSMWE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XKw1KeYJQeYyQlq1tzevMrspTJVJgQm8mFwDNEqpKkZ28adrzmAMQJiwZbMBgdWJtZcTvq90f2uV/7/5bRu3+avOHAWVbrQeNKi0q3gl98M3w5A+i2aHke3vx0dwqmxUgM67rZQwXsRYR73t4mYZ1OcgQUPLlr7Wy+0JMy64uRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ouDS2uda; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 143BBC4CECD;
	Fri,  1 Nov 2024 12:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730463430;
	bh=RLfSo4O4fxkfzXfQp6pUx6oskYOHg2FVGUk83HSMWE0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ouDS2uda9ZO2OLw/rZctc7NIB/wi5b516ERqa60h+L9d2XSjLH4i3CoJUTus6cJt6
	 MxGyB1/vmOKz3dUtyS0TJTOxR1ZXSOdj/0IYy7bC/Da0pVCRdO8Atpf2JxngzpYGfn
	 lfQTEriw23SuwSYqmbWpH6KJdeglLX3342o2n4aC6IIqbVlk7LoHoawDtaVb/UxaNB
	 wnxYhG7H5q+BQlN0KLfcbAa0qdc28YhbNVPPmGpXTuJ+3120YonFHxozZVRTE/rNZz
	 T9ahx2ovnU6kHmv15apOh2GpcYlYbqL0lCASSEy06gkVBeA8RJRem8PUAXEY0TFEwi
	 a6cR1FFzUL3Fw==
Date: Fri, 1 Nov 2024 12:17:06 +0000
From: Conor Dooley <conor@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	valentina.fernandezalanis@microchip.com,
	Linus Walleij <linus.walleij@linaro.org>,
	Lewis Hanly <lewis.hanly@microchip.com>
Subject: Re: [PATCH v9 1/1] gpio: mpfs: add polarfire soc gpio support
Message-ID: <20241101-cadmium-speed-78ff7577347a@spud>
References: <20241031-scouting-earmark-6b4dfc6bc6e2@spud>
 <20241031-appease-purse-55145b5dfba4@spud>
 <CAMRc=Men4sxFdSVR_WaJEG1UM7dXeGxTbw0=M_y3NsBmEOZzmQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wtHXo/lG9MWJibGl"
Content-Disposition: inline
In-Reply-To: <CAMRc=Men4sxFdSVR_WaJEG1UM7dXeGxTbw0=M_y3NsBmEOZzmQ@mail.gmail.com>


--wtHXo/lG9MWJibGl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 31, 2024 at 02:00:22PM +0100, Bartosz Golaszewski wrote:
> On Thu, Oct 31, 2024 at 1:04=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:

> > +       mpfs_gpio->gc.direction_input =3D mpfs_gpio_direction_input;
> > +       mpfs_gpio->gc.direction_output =3D mpfs_gpio_direction_output;
> > +       mpfs_gpio->gc.get_direction =3D mpfs_gpio_get_direction;
> > +       mpfs_gpio->gc.get =3D mpfs_gpio_get;
> > +       mpfs_gpio->gc.set =3D mpfs_gpio_set;
> > +       mpfs_gpio->gc.base =3D -1;
> > +       mpfs_gpio->gc.ngpio =3D ngpios;
>=20
> The "ngpios" property will be parsed by GPIO core so no need to set it.

Are you sure it'll work here? I tried dropping the ngpios parsing, but I
get:
gpiochip_add_data_with_key: GPIOs 0..-1 (20122000.gpio) failed to register,=
 -22

That's coming from the device_property_read_u32(dev, "ngpios", &ngpios);
in gpiochip_get_ngpios(). Checking against the bluefield driver and the
code in gpiochip_add_data_with_key(), it's not immediately obvious what
I am missing.

--wtHXo/lG9MWJibGl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZyTGwgAKCRB4tDGHoIJi
0vSBAQDRJSkqVaC3VbT0Qr9sisYouEOHuK9RasZhdpZAJx8EmQD/WPq70cmQvBlR
4MrHN0baRk/zcZbWxXkaALsaCY9gHgY=
=c2DU
-----END PGP SIGNATURE-----

--wtHXo/lG9MWJibGl--

