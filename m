Return-Path: <linux-gpio+bounces-27065-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 228BEBD8578
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 11:03:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E8A8B4EB6FC
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 09:03:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B70FD2DAFC8;
	Tue, 14 Oct 2025 09:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jZ3DE7CE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CA21D5CD4;
	Tue, 14 Oct 2025 09:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760432610; cv=none; b=q9qLkMDBAAkZ7JyK5LuiKhCyOMhFT3seOcGOYnoxYE/gFTiQOcSPADcOC4BcwrkEtB/7nG5YNJDbwMax2bpTY4PnMvgI9ZoxX7V34fmjuDUNs+sBvRbn9JK/1riGIoVFlik47nk3gEhv1B13D9uoDytf/9AQmnhY1NlaFqBM9h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760432610; c=relaxed/simple;
	bh=fkXihXerukmBr4Cr39uGoHGVGXk0EGVBsQV7Qzs68W8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:From:To:Subject:
	 References:In-Reply-To; b=ewA2k7TlQzTYodZYdodyxNkSniAV4tsumLhu5YQNrmOBrc0+KSpq/ayLGdYXMLh3Yzkdp8yL84XxelXUPWwymyTqrn3IMaywbFuGJqhPBSPJYmJ5BvH3dvbnAdHtZqwqBgnh6QskZI0HM0IyBib5M5gGK1ckOlXgLtrRD1oZ4H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jZ3DE7CE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83870C4CEE7;
	Tue, 14 Oct 2025 09:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760432609;
	bh=fkXihXerukmBr4Cr39uGoHGVGXk0EGVBsQV7Qzs68W8=;
	h=Date:Cc:From:To:Subject:References:In-Reply-To:From;
	b=jZ3DE7CEh/8lQAJgQwP3XloJ2njFpnmpJZlJlG0hKwbJRsZHmjifeIeY1Xe6ViC1O
	 ftemccZYBJl7B9knHaP4e8bvcyVTUFcY+VCzOcbviQD+PI8z3T35ZIpTe7BiGlD8on
	 YQDLpMYg6i5lJjXtoixU02GifWcUTL7NyIEgwfgmOlndeq3jjyB03BFWYvEN9SXMeH
	 u6JmSFlpadp38nN0COYSlqaf5M+Au6ABzDZfsgYvLkLUzzMEMuJDiIuKvaiqNyCqOF
	 9onXGxs6yIpr2sFvNjO+lAgBSWPnaHplKkXZIwY5OVSeiyZ4Pd4Vlbc9fU7yxXslVC
	 xD40gB2WVWh3Q==
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=cb76824c9f0c47a22e6de9cb32dc6f95d72ef0b186cf187189b9989a28aa;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Tue, 14 Oct 2025 11:03:25 +0200
Message-Id: <DDHX9YA0ZMKO.C1MA3CHLT4ZZ@kernel.org>
Cc: <linus.walleij@linaro.org>, <brgl@bgdev.pl>,
 <andriy.shevchenko@linux.intel.com>, <broonie@kernel.org>,
 <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Ioana
 Ciornei" <ioana.ciornei@nxp.com>
From: "Michael Walle" <mwalle@kernel.org>
To: "William Breathitt Gray" <wbg@kernel.org>, "Mark Cave-Ayland"
 <mark.caveayland@nutanix.com>
Subject: Re: gpio: gpio-pci-idio-16 regression after LTS upgrade
X-Mailer: aerc 0.20.0
References: <df4857cb-daae-4428-bd93-5878564624c5@nutanix.com>
 <20251009094905.223456-1-wbg@kernel.org>
In-Reply-To: <20251009094905.223456-1-wbg@kernel.org>

--cb76824c9f0c47a22e6de9cb32dc6f95d72ef0b186cf187189b9989a28aa
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Thu Oct 9, 2025 at 11:49 AM CEST, William Breathitt Gray wrote:
> On Thu, Oct 09, 2025 at 10:05:58AM +0100, Mark Cave-Ayland wrote:
>> On 07/10/2025 09:16, William Breathitt Gray wrote:
>> > So the intention I had with gpio-idio-16 was to provide reg_dat_base a=
nd
>> > reg_set_base to define the input and output bases, and then
>> > reg_mask_xlate would do the translation between input and outputs. I
>> > think this design is allowed by gpio-regmap, is it not Michael?
>> >
>> > In theory, gpio_regmap_get_direction should call gpio->reg_mask_xlate(=
)
>> > which is mapped to idio_16_reg_mask_xlate(), and thus set reg and mask
>> > which then is evaluated at the end of gpio_regmap_get_direction() to
>> > determine which direction to return.
>> >
>> > Is it possible idio_16_reg_mask_xlate() is returning the wrong values
>> > for reg and mask?
>> >
>> > William Breathitt Gray
>>=20
>> The only logic around .reg_dat_base and .reg_set_base in
>> gpio_regmap_get_direction() is this:
>>=20
>> 	if (gpio->reg_dat_base && !gpio->reg_set_base)
>> 		return GPIO_LINE_DIRECTION_IN;
>> 	if (gpio->reg_set_base && !gpio->reg_dat_base)
>> 		return GPIO_LINE_DIRECTION_OUT;
>>=20
>> Otherwise it attempts to use .reg_dir_out_base and .reg_dir_in_base
>> which are not set for gpio-idio-16 because the GPIO directions are fixed
>> and not controlled via a data-direction register. And as these are not
>> set, gpio_regmap_get_direction() returns -ENOTSUPP.
>>=20
>> Were you thinking that gpio_regmap_get_direction() should have some
>> additional direction logic if both .reg_dat_base and .reg_set_base are
>> set, based upon their comparative values?
>
> Ah you're right, I misunderstood the logic in gpio_regmap_get_direction.
> So essentially the problem is that gpio-idio-16 has no way of indicating
> the direction of its I/O because it's mixed.
>
> The IDIO-16 series lacks a direction setting register, so I think the
> proper solution is as you suggest: add support for a get_direction
> callback to struct gpio_regmap_config in the same vein as the existing
> reg_mask_xlate callback. Then in gpio_regmap_register you can set
> gpio->get_direction =3D config->get_direction in the same way
> config->reg_mask_xlate is handled.

IIUC the chip has fixed input and outputs. In that case this should
help:
https://lore.kernel.org/all/20250922142427.3310221-8-ioana.ciornei@nxp.com/

I guess Ioana will resubmit the series for this cycle. To fix the
regression, I guess the patch can then be picked up by the stable
team along with the driver patch which will set the
.fixed_direction_output config field.

-michael

--cb76824c9f0c47a22e6de9cb32dc6f95d72ef0b186cf187189b9989a28aa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaO4R3RIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hzUwF+PpnUOQg6vTdN3rz6ofqVnWvR7WNpH6wt
6rS4Eh5Zs9sio7sQkBOk7yBB2ZekLs55AYDcUCxWBrQJdAQRRbs+Wr6TWWcGC1Wv
TzF6aObgGYFmFHOKlenw0x545SnB8vcYTA0=
=DL4w
-----END PGP SIGNATURE-----

--cb76824c9f0c47a22e6de9cb32dc6f95d72ef0b186cf187189b9989a28aa--

