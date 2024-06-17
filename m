Return-Path: <linux-gpio+bounces-7513-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB5B90BC11
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2024 22:23:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 354EE1C2384B
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2024 20:23:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A363198848;
	Mon, 17 Jun 2024 20:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IuPCxu13"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F1618F2E8;
	Mon, 17 Jun 2024 20:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718655578; cv=none; b=JuQenfFiesRsNNbl6N9fVIiHW/eCrJtQLAFPLV871mj51yU1dQSpI6fMAz1qphVrHNH8nrII2+nifXO+nmX5cOBYREVF2dPHVF1+vzhLej4Yx6r0wXuMzsDhG4VYwE6dYmq6CqlrxpQ75345zoZKp3LcC+tkpw7790uzXNyeDMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718655578; c=relaxed/simple;
	bh=efJHnhSwA5pI1JDI9LxvZ9ihjh6ylrIdaXKFDqrK9vI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cxF7OiD0UGTFT8bQwKdIr5vaixksGj1iSluBR7J2Pc/m13o5FD/eYG9wOCvcmNQpa/tUOO8lyfandxrxl4O/3HLv7STYxWUsQoZzsPmxbZYtAeWpiiS2uS1xbrUreUYkmphD7MOhrXjNkhcNokHPvjTym6rQ4gnKtWij7mC0QUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IuPCxu13; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BBDAC2BD10;
	Mon, 17 Jun 2024 20:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718655577;
	bh=efJHnhSwA5pI1JDI9LxvZ9ihjh6ylrIdaXKFDqrK9vI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=IuPCxu13d25eoMaHHtf/LJQz3UaINGRzLwpot4JXEZ+CavewScW0D0XWXX3uJOg0I
	 O2xdowNhsMyPmVCzb7nAsolFZgHkFMP9MlxBFwBGiMOR6CuDZv1VUyuqoTFgUzukcA
	 mk9sL3Jbf14KrtJydrDAuWY8pR/reVrqOVioupOsfyZa2i6rbERhzQ15W+NXV9IfjQ
	 Kb1/pv/Ty3A88z5x3IchsKI5cnqgFGKqXP1QacKa2p/TIBHc1MsRnCrFO3gPJLvqbs
	 0A1CX+ZpCi3dWJEKFVh561kz9SCRN2gSOSCRRoIvlDQ00nkMBZSgysL5hAYBRJgHfF
	 ayAXGJmOk8Hlg==
Date: Mon, 17 Jun 2024 21:19:31 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Markus Elfring <Markus.Elfring@web.de>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org, LKML
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] pinctrl: pistachio: Use scope-based resource management
 in pistachio_gpio_register()
Message-ID: <20240617211931.70bd2d31@jic23-huawei>
In-Reply-To: <CACRpkdanLmWrDD6AdzJJx3fJsQWTE64vh+MjOtDTkpzwqqPkuQ@mail.gmail.com>
References: <3f6fc17e-2ab4-43f2-b166-2393a369a263@web.de>
	<CACRpkdanLmWrDD6AdzJJx3fJsQWTE64vh+MjOtDTkpzwqqPkuQ@mail.gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 17 Jun 2024 10:32:03 +0200
Linus Walleij <linus.walleij@linaro.org> wrote:

> On Wed, Jun 5, 2024 at 6:02=E2=80=AFPM Markus Elfring <Markus.Elfring@web=
.de> wrote:
>=20
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Wed, 5 Jun 2024 17:46:52 +0200
> >
> > Scope-based resource management became supported also for another
> > programming interface by contributions of Jonathan Cameron on 2024-02-1=
7.
> > See also the commit 59ed5e2d505bf5f9b4af64d0021cd0c96aec1f7c ("device
> > property: Add cleanup.h based fwnode_handle_put() scope based cleanup."=
).
> >
> > * Thus use the attribute =E2=80=9C__free(fwnode_handle)=E2=80=9D.
> >
> > * Reduce the scope for the local variable =E2=80=9Cchild=E2=80=9D.
> >
> > * Omit explicit fwnode_handle_put() calls accordingly.
> >
> > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net> =20
>=20
> Looks reasonable but I'd like Jonathan's and Andy's review tags on this.
>=20
> Yours,
> Linus Walleij

I took a look and it makes me a little nervous. Markus' patch isn't
changing behaviour (I think) but i is mixing scoped handling with non
scoped handling which I'm not keen on. I'm also struggling to understand
how the code was right prior to this patch.  In particular what cleans
up the fwnode_handle after the point where Markus has used no_free_ptr()?

Whilst it's assigned to the gpio_chip that chip hasn't been added when
girq->parents is allocated so even if there is some magic path to clearing
it up I'm not immediately seeing how that can be working here.

So this feels like there are more gremlins hiding here and Markus' patch
may not help flush them out.

Jonathan

