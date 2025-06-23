Return-Path: <linux-gpio+bounces-21998-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F7AAE385A
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 10:27:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8578F16CACF
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 08:27:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3079223DC0;
	Mon, 23 Jun 2025 08:27:34 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1B62222B2
	for <linux-gpio@vger.kernel.org>; Mon, 23 Jun 2025 08:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750667254; cv=none; b=rkyIvRsJtrusse1swGAcujYoIzmWR6q11nU1CBiMzchuHOsQRKlj/UJljrOsDp1SFiY8Dmoiac/vnXlESzIfDp2ptKqK77rJBqzEKQKbKa5cz5CgJ4Ftw9YNyRlBCTLiDjGZ/EtlL0418ky6XyhtAKzqZE5wkq5vB5rkrK+XC1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750667254; c=relaxed/simple;
	bh=mHMAsoepGjQBv1mEgMO/VvRELEXdWNynFVVXIrPUYQQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=C8K6s+P0JaCzPaaIevmlhIji+qTWeOKEsBlpkyrekY1nZVVgxoKSCZQyT5DiBRfkozZ7LtALf8HCsdnQLPTTkoWXpRgKK05DsMFc/DBZcHoHKI0nnHKY3Ulo3GCRfN8GzJBpQsP6Gwcp+vA6gfgm8/ubQnW4UTgh4WUUF51Gngs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1uTcWT-0007gI-Tv; Mon, 23 Jun 2025 10:27:25 +0200
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jlu@pengutronix.de>)
	id 1uTcWT-004upl-0c;
	Mon, 23 Jun 2025 10:27:25 +0200
Received: from localhost ([127.0.0.1] helo=[IPv6:::1])
	by ptz.office.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <jlu@pengutronix.de>)
	id 1uTcWT-005o58-00;
	Mon, 23 Jun 2025 10:27:25 +0200
Message-ID: <e3cb14a8e1a6ea1e9a050f8013730e56f79f62ec.camel@pengutronix.de>
Subject: Re: [PATCH RFC/RFT 00/15] gpio: sysfs: add a per-chip
 export/unexport attribute pair
From: Jan =?ISO-8859-1?Q?L=FCbbe?= <jlu@pengutronix.de>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, Kent Gibson
 <warthog618@gmail.com>,  Marek Vasut <marex@denx.de>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>,
 linux-gpio@vger.kernel.org,  linux-kernel@vger.kernel.org, Bartosz
 Golaszewski <bartosz.golaszewski@linaro.org>
Date: Mon, 23 Jun 2025 10:27:24 +0200
In-Reply-To: <CAMRc=Mc6ZSp+bu3i0-X-i_8=f69X0Rez98tGsS-g_uJ1nBH6fQ@mail.gmail.com>
References: <20250610-gpio-sysfs-chip-export-v1-0-a8c7aa4478b1@linaro.org>
	 <8570dedab1a7478c39b31125ad279038fe31ac13.camel@pengutronix.de>
	 <CAMRc=Mc6ZSp+bu3i0-X-i_8=f69X0Rez98tGsS-g_uJ1nBH6fQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: jlu@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org

On Wed, 2025-06-18 at 17:56 +0200, Bartosz Golaszewski wrote:
> On Wed, Jun 18, 2025 at 3:38=E2=80=AFPM Jan L=C3=BCbbe <jlu@pengutronix.d=
e> wrote:
> >=20
>=20
> [snip]
>=20
>=20
> > The contents of /sys/kernel/debug/gpio don't really fit any more:
> >  gpiochip10: GPIOs 660-663, parent: i2c/0-0024, pca9570, can sleep:
> >   gpio-660 (DUT_PWR_EN          |tacd                ) out hi
> >   gpio-661 (DUT_PWR_DISCH       |tacd                ) out lo
> >   gpio-662 (DUT_PWR_ADCRST      |reset               ) out lo
> > The header is inconsistent: it uses the 'gpiochip' prefix, but not the =
base as
> > the old class devices in /sys/class/gpio/. Perhaps something like this?
> >  chip10: GPIOs 0-2 (global IDs 660-663), parent: i2c/0-0024, pca9570, c=
an sleep:
> >   gpio-0 (660) (DUT_PWR_EN          |tacd                ) out hi
> >   gpio-1 (661) (DUT_PWR_DISCH       |tacd                ) out lo
> >   gpio-2 (662) (DUT_PWR_ADCRST      |reset               ) out lo
> > If GPIO_SYSFS_LEGACY is disabled, the global IDs could be hidden.
> >=20
>=20
> After a second look: IMO this is unrelated to the sysfs changes. We
> definitely should change the debugfs output and rid it off the global
> numbers but it shouldn't be part of this series.

Agreed.

> Also: are you using
> this output in some way? Technically debugfs output is not stable ABI
> so we can modify it without considering existing users but wanted to
> run it by you to know if I'm going to break something for you.

We're not parsing debugfs. :) I just checked manually if it matched the new
naming and saw that it didn't.

Regards,
Jan
--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

