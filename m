Return-Path: <linux-gpio+bounces-4605-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D475B88A383
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Mar 2024 15:02:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 126BB1C3A6BF
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Mar 2024 14:02:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E020128372;
	Mon, 25 Mar 2024 10:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ie3Tcacz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C47C18AFE1
	for <linux-gpio@vger.kernel.org>; Mon, 25 Mar 2024 09:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711360436; cv=none; b=BKrWv6dtMx3++CGkrWUsuBA2SKr901J+tkK2VsVpfzoZcdAspIZgscsKao4x3Gh/q65nNU50ZIcSf/dSGqvrzfzBZPiWc4zMkpqPwsvgFkOhjitmewKDTX4mver3eyvH/BnRx+s3PNSkD9YAO5Bz2TYV6P06vIzTIx91nUT4V7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711360436; c=relaxed/simple;
	bh=tJPcPnuUEFp+CDXQqerYYoZxsWHiild4D5RUu48Z0Ks=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Uzjtxv0JaHSeqUwtvLdb6oRlqZeCNOaNtz6rOdcwMqg7wHR/UeHpol25PYVxvu3EwKszGNX+Qp6w+/euXXgItIfCjg1p9YnpEWJojrcDc6fJh6HRackGiCJf5iwqMpOEyfgGRvoWKdlwV0/YKbeZ28rEG9nnK8vcc54/Ah5KTQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ie3Tcacz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09853C433F1;
	Mon, 25 Mar 2024 09:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711360436;
	bh=tJPcPnuUEFp+CDXQqerYYoZxsWHiild4D5RUu48Z0Ks=;
	h=Date:From:To:List-Id:Cc:Subject:In-Reply-To:References:From;
	b=Ie3TcaczheWBB9Z+nJdPLDdSPftm5KpyqcG+MLA6j82zO1gKtlLkHupoT+e67x32H
	 re0Rai/Djf9rK30hxjbu+1Fzs6280e4TPIlg+KEmfa3oq32RO2pZPqvypySZwMQLYe
	 TvKg88ncVEnfolA4+I1oD9605ixkQNxKlpLhDYb5aJjs7tVWliSp9rE4RHYoOoXXIn
	 CHQtpSVtu8JuE/UlOUj9iFKqG0CceHd0RtycTXgKk9qTuQNrdRyXp0+lBn2Aew15/Z
	 gWv6dsRh2b9HM+Y7Mm/atB07IrFbg6HndvgVZDnFpuYEPmhAwD9lOWCUc8eIX778cC
	 LRqASdsNQZy6A==
Date: Mon, 25 Mar 2024 10:53:49 +0100
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Gregory CLEMENT
 <gregory.clement@bootlin.com>, soc@kernel.org, arm@kernel.org, Linus
 Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v5 03/11] platform: cznic: turris-omnia-mcu: Add support
 for MCU connected GPIOs
Message-ID: <20240325105349.6f6c21c7@dellmb>
In-Reply-To: <0352287d-cbd0-4ed7-8551-a23191487279@gmail.com>
References: <20240323164359.21642-1-kabel@kernel.org>
	<20240323164359.21642-4-kabel@kernel.org>
	<0352287d-cbd0-4ed7-8551-a23191487279@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.39; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 25 Mar 2024 11:10:04 +0200
Matti Vaittinen <mazziesaccount@gmail.com> wrote:

> Hi Marek,
>=20
> I can't say I did a proper review but browsing through the code without=20
> proper understanding of the platform raised one small question :)
>=20
> On 3/23/24 18:43, Marek Beh=C3=BAn wrote:
> > Add support for GPIOs connected to the MCU on the Turris Omnia board.
> >=20
> > This includes:
> > - front button pin
> > - enable pins for USB regulators
> > - MiniPCIe / mSATA card presence pins in MiniPCIe port 0
> > - LED output pins from WAN ethernet PHY, LAN switch and MiniPCIe ports
> > - on board revisions 32+ also various peripheral resets and another
> >    voltage regulator enable pin
> >=20
> > Signed-off-by: Marek Beh=C3=BAn <kabel@kernel.org> =20
>=20
> ...
>=20
> > +/**
> > + * omnia_mask_interleave - Interleaves the bytes from @rising and @fal=
ling
> > + *	@dst: the destination u8 array of interleaved bytes
> > + *	@rising: rising mask
> > + *	@falling: falling mask
> > + *
> > + * Interleaves the little-endian bytes from @rising and @falling words=
. =20
> This means the 'rising' and 'falling' should always be little-endian?=20
> Should the parameter types reflect this? Or should we see some=20
> cpu_to_le() calls? (Or, is this code just guaranteed to be always=20
> running on a le-machine?).
>=20
> > + * If @rising =3D (r0, r1, r2, r3) and @falling =3D (f0, f1, f2, f3), =
the result is
> > + * @dst =3D (r0, f0, r1, f1, r2, f2, r3, f3).
> > + *
> > + * The MCU receives interrupt mask and reports pending interrupt bitma=
p int this
> > + * interleaved format. The rationale behind it is that the low-indexed=
 bits are
> > + * more important - in many cases, the user will be interested only in
> > + * interrupts with indexes 0 to 7, and so the system can stop reading =
after
> > + * first 2 bytes (r0, f0), to save time on the slow I2C bus.
> > + *
> > + * Feel free to remove this function and its inverse, omnia_mask_deint=
erleave,
> > + * and use an appropriate bitmap_* function once such a function exist=
s.
> > + */
> > +static void omnia_mask_interleave(u8 *dst, u32 rising, u32 falling)
> > +{
> > +	for (int i =3D 0; i < sizeof(u32); ++i) {
> > +		dst[2 * i] =3D rising >> (8 * i);
> > +		dst[2 * i + 1] =3D falling >> (8 * i);
> > +	}
> > +}
> > +
> > +/**
> > + * omnia_mask_deinterleave - Deinterleaves the bytes into @rising and =
@falling
> > + *	@src: the source u8 array containing the interleaved bytes
> > + *	@rising: pointer where to store the rising mask gathered from @src
> > + *	@falling: pointer where to store the falling mask gathered from @src
> > + *
> > + * This is the inverse function to omnia_mask_interleave.
> > + */
> > +static void omnia_mask_deinterleave(const u8 *src, u32 *rising, u32 *f=
alling)
> > +{
> > +	*rising =3D *falling =3D 0;
> > +
> > +	for (int i =3D 0; i < sizeof(u32); ++i) {
> > +		*rising |=3D src[2 * i] << (8 * i);
> > +		*falling |=3D src[2 * i + 1] << (8 * i);
> > +	} =20
>=20
> Also here I could expect seeing le_to_cpu() unless I am (again :])=20
> missing something.

I don't understand. The rising and falling variables have native
endiannes, as they should have.

And the src and dst are u8 arrays, which contain two LE32
unsigned integers, but these integers are interleaved. I am converting
then to two native unsigned integers byte by byte, so I am basically
doing what a theoretical le32_interleaved_le32_to_cpu() would have done
if it did exist. Putting another le*_to_cpu() would only break things.

Marek

