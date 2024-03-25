Return-Path: <linux-gpio+bounces-4607-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3BE88A490
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Mar 2024 15:31:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 653B51F626C5
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Mar 2024 14:31:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A0A015B121;
	Mon, 25 Mar 2024 11:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FwkU4T1u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845B517C65F;
	Mon, 25 Mar 2024 10:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711363203; cv=none; b=jNgDlVVJv6V74r3bHfHMljwb2A3nmK4pDhtjnVtko7Z48cpgc1wLobmDNhzn5jl4CHdgQt5bwD9B/HNzQNj6Z3O0HvUb9Nqp4Q5ldkd7PiNN/zpuu20+wM7MkF0WCt1v+h8BEkxTVuP/kskH5WleCWqzJxLSlfLvc0Z35UFzYmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711363203; c=relaxed/simple;
	bh=1kjdqR5hsduSp6QR7U3kFDUoSJ+njpkloL6RmW5726U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TfosKN6NmeuOWhDym4OdfPRX5WgsZtLzQXgsFoTladl6P6m8NMyMr/TeRU6j9QqzIn17BG9Ar0c3MRC4+ln60zB0iH3rACMyd7XOQlZYLJi/eh+v5YI6FMANrCcDZItprdR+fr3x3Lbub4fKGQjVCtBjs0YupfmtpfyrlfCNTzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FwkU4T1u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DF6FC433F1;
	Mon, 25 Mar 2024 10:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711363203;
	bh=1kjdqR5hsduSp6QR7U3kFDUoSJ+njpkloL6RmW5726U=;
	h=Date:From:To:List-Id:Cc:Subject:In-Reply-To:References:From;
	b=FwkU4T1u/wN6jSTzwB12KysXpLxkLz1uLie4n666O/NjfsK84S6UDZGZxp71WAkuf
	 ZmIbq2TtIxNW3y+YBAZ2xlyEr3m8bT2k7GZdfAqu0Z1pSBjUvXEdIYgpl4MdvRpUH/
	 ViuWHmeT8AdIsJkTIC9zAfcYDRgMU3GHAqiHuMvDTiSHyzRljiFgfQHDzr7iqqyxxM
	 L5ZvJ3qJP8njs4njJmwAHQaDQMb0WSB23GCilNdZmyvH6V+G++2nBwVqhmP6wkdzMz
	 hYuDZhxuBkJkO2nStrgej1SHqp/xv7bMMrVFXTibbokY2Tx1nq3ielOAhfGfKpLaAe
	 vRlgZyJSiI/Cw==
Date: Mon, 25 Mar 2024 11:39:57 +0100
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Gregory CLEMENT
 <gregory.clement@bootlin.com>, soc@kernel.org, arm@kernel.org, Linus
 Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, Alessandro
 Zummo <a.zummo@towertech.it>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org, Wim Van
 Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>,
 linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v5 02/11] platform: cznic: Add preliminary support for
 Turris Omnia MCU
Message-ID: <20240325113957.7a83e093@dellmb>
In-Reply-To: <CAHp75VesxrOdm4H3TYUtfEJx=i3Zpd6a=yzbkUFismnzW=nE-g@mail.gmail.com>
References: <20240323164359.21642-1-kabel@kernel.org>
	<20240323164359.21642-3-kabel@kernel.org>
	<ZgAII1B03bLUisWr@surfacebook.localdomain>
	<20240324160408.77c8574e@thinkpad>
	<CAHp75VesxrOdm4H3TYUtfEJx=i3Zpd6a=yzbkUFismnzW=nE-g@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.39; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, 24 Mar 2024 17:30:39 +0200
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> On Sun, Mar 24, 2024 at 5:04=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.or=
g> wrote:
> >
> > Hi Andy,
> >
> > thank you very much for the review. I have some notes and some
> > questions, see below. =20
>=20
> Btw, I'll look into other patches next week.

Thx.

...

> >
> > There are still some people wanting only 80 columns, and the whole
> > driver is written that way. =20
>=20
> Hmm... Is it still a hard limit for drivers/platform/cznic for the _new_ =
code?

I don't think so, but I personally would also prefer leaving this at 80
columns. Is this a problem?

> > I considered it a helper function that should be defined in the header
> > file, like the rest of the cmd helpers in this file. If you disagree, I
> > will put it into the -base.c file. =20
>=20
> I don't see the technical justification to hold it in the *.h rather
> than *.c. To me this one is big enough in C and likely in assembly to
> be copied to each user. Besides that aspect, it slows down the build a
> lot (mostly due to i2c.h inclusion which otherwise is not needed).

OK, I moved it into -base.c.

Marek

