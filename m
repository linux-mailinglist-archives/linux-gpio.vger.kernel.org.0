Return-Path: <linux-gpio+bounces-6287-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3948E8C1F80
	for <lists+linux-gpio@lfdr.de>; Fri, 10 May 2024 10:10:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5BC771C2135E
	for <lists+linux-gpio@lfdr.de>; Fri, 10 May 2024 08:09:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2375315F3F1;
	Fri, 10 May 2024 08:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dqk/LqIQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9431131192
	for <linux-gpio@vger.kernel.org>; Fri, 10 May 2024 08:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715328591; cv=none; b=OyBQPhJsce0jF+qfSZJBWjVASrFURnK1S36axSUgOTk4aJ1Af0kpWc/ZOOo0Ov6+L/C3ysaPuBHVHD6D57NR+WMK8oik2YbMgsfYTuC4BxfuRFdXuwjOlpZ10Ge8xtqu9+faiDd+XSoC1Mk2JaFiiUP2CNVNw1HUs2eTNmU5HaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715328591; c=relaxed/simple;
	bh=W2UAzXDx1JJQEGjRLpfJ+yKhnxYjrwqMgJeXw+yMleo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZFrKgrr5GFZAFASifer57LUYRaEh4oYTfuEIRCkVw2j4WIPeAeDTect+vjRIq/kA0AfJ4AxTFBqGR648FowdqP0xLmEfY7GAvpTtrZDDBLf3M6pQC3aTe33w2qrVPJMe7g17C2+5aN+Qi+sS1sUdBZNaLqguzwMKO7aKn2VCPJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dqk/LqIQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48AE6C113CC;
	Fri, 10 May 2024 08:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715328591;
	bh=W2UAzXDx1JJQEGjRLpfJ+yKhnxYjrwqMgJeXw+yMleo=;
	h=Date:From:To:List-Id:Cc:Subject:In-Reply-To:References:From;
	b=dqk/LqIQL/tWGZe4UHPMQFasZmFc3m8UEle9efU9dFXtv6z6iOXMO3QgbENbOrosT
	 3gKGWtsazKHUFczDbFALaTqvxEtmQwprHr/6oOgQo/IYPePNNV97noyllpku/hDXP2
	 TcTxi5P9i6cWLPXPhp+of1Q2hZHtUcyAvcAimJPyZkaqd4rvdCnSUQb80AZWsBqtWC
	 kl6vCjeFLcbncgYncRHqNO3vLp6Y2Bjk1RfoPhFdB+xWXXAhdmSl7+6udarbJlG/hs
	 F/eqzVgBl2+BKpRkPOH9PGu3ItvEdbymmO3FCREXX2t4Acw5u/b/GHmmnMb8uVBKn6
	 pumg9gO1oAkQA==
Date: Fri, 10 May 2024 10:09:46 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Andy Shevchenko <andy@kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Arnd Bergmann
 <arnd@arndb.de>, soc@kernel.org, arm@kernel.org, Hans de Goede
 <hdegoede@redhat.com>, Ilpo =?UTF-8?B?SsOkcnZpbmVu?=
 <ilpo.jarvinen@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v9 3/9] platform: cznic: turris-omnia-mcu: Add support
 for MCU connected GPIOs
Message-ID: <20240510100946.270c00e3@dellmb>
In-Reply-To: <ZjtfCjAlDMMndRfv@smile.fi.intel.com>
References: <20240508103118.23345-1-kabel@kernel.org>
	<20240508103118.23345-4-kabel@kernel.org>
	<ZjtfCjAlDMMndRfv@smile.fi.intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 8 May 2024 14:16:26 +0300
Andy Shevchenko <andy@kernel.org> wrote:

> On Wed, May 08, 2024 at 12:31:12PM +0200, Marek Beh=C3=BAn wrote:

...

> > +static int omnia_ctl_cmd_locked(struct omnia_mcu *mcu, u8 cmd, u16 val,
> > +				u16 mask) =20
>=20
> Can be one line as it's only 81 characters long.

OK

> > +	if (type & IRQ_TYPE_EDGE_RISING)
> > +		mcu->rising |=3D bit;
> > +	else
> > +		mcu->rising &=3D ~bit;
> > +
> > +	if (type & IRQ_TYPE_EDGE_FALLING)
> > +		mcu->falling |=3D bit;
> > +	else
> > +		mcu->falling &=3D ~bit; =20
>=20
> If those variables was defined as unsigned long, these can be just
>=20
> 	__assign_bit()
> 	__assign_bit()
>=20
> And other non-atomic bitops elsewhere, like __clear_bit().
=20
Changing this propagated to many other variables and even required
some refactoring of the omnia_gpio structure, since the bit, ctl_bit
and int_bit members are stored as a masks, but __assign_bit() /
__set_bit() / __clear_bit() requires bit numbers.

For example
  if (gpio->int_bit && (mcu->is_cached & gpio->int_bit))
    return !!(mcu->cached & gpio->int_bit);
needed to change to
  if (gpio->has_int && (mcu->is_cached & BIT(gpio->int_bit)))
    return !!(mcu->cached & BIT(gpio->int_bit));
and so on.

Moreover, I agree that the if-else statement which you commented on,
when changed to __assign_bit(), looks much nicer, but some changes that
sprouted from this are in my opinion less readable.

I have prepared the fixup patch, but I am not confident enough that
everything is done correctly. I would prefer leaving this one for
later, if it is okay with you.

> > + * Feel free to remove this function and its inverse, omnia_mask_deint=
erleave,
> > + * and use an appropriate bitmap_* function once such a function exist=
s. =20
>=20
> bitmap_*()

OK

...

> > +static int omnia_read_status_word_old_fw(struct omnia_mcu *mcu, u16 *s=
tatus)
> > +{
> > +	int err;
> > +
> > +	err =3D omnia_cmd_read_u16(mcu->client, OMNIA_CMD_GET_STATUS_WORD,
> > +				 status);
> > +	if (!err) =20
>=20
> Why not traditional pattern?
>=20
> 	if (err)
> 		return err;

OK, also for the rest similar.

...

> > +static bool omnia_irq_read_pending(struct omnia_mcu *mcu,
> > +				   unsigned long *pending)
> > +{
> > +	if (mcu->features & OMNIA_FEAT_NEW_INT_API)
> > +		return omnia_irq_read_pending_new(mcu, pending);
> > +	else =20
>=20
> 'else' is redundant, but it can be still used for indentation purposes he=
re.

As you say, for indentation purposes I would prefer keeping it this way.

>=20
> > +		return omnia_irq_read_pending_old(mcu, pending);
> > +} =20
>=20
> ...
>=20
> > +static struct attribute *omnia_mcu_gpio_attrs[] =3D {
> > +	&dev_attr_front_button_mode.attr,
> > +	NULL
> > +};
> > +
> > +const struct attribute_group omnia_mcu_gpio_group =3D {
> > +	.attrs =3D omnia_mcu_gpio_attrs,
> > +}; =20
>=20
> Haven't seen the rest, but here perhaps ATTRIBUTE_GROUPS().

Those define the variable as static, but I need to access it from
turris-omnia-mcu-base.c compilation unit.

