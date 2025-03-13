Return-Path: <linux-gpio+bounces-17518-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A2112A5ED38
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Mar 2025 08:45:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9B8F97A790E
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Mar 2025 07:44:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECC251C860E;
	Thu, 13 Mar 2025 07:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=maquefel.me header.i=@maquefel.me header.b="BObLBsrE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from forward500d.mail.yandex.net (forward500d.mail.yandex.net [178.154.239.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BBA3A8D2
	for <linux-gpio@vger.kernel.org>; Thu, 13 Mar 2025 07:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741851932; cv=none; b=hiasICaOORS86FCUYLhWgIrdEnKujwkZX02FFzIvZ2lXmSyrd200OaMa9EakbKeUZHiBoKOEJMXg6zY6bj9+OAH01eESZxCr0B5BXqb1PD4hmGO8O6yEDO00sPZo4aCHbfsXaYVlKORhTI3+UgS2JBTZHJt4ciD+G6CpRKOv+lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741851932; c=relaxed/simple;
	bh=w5/WVVVxyvk7Djrlb0ht2kGGIZelcHVkOyzgdm5Wnaw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JMgYJ4vCUIDp+yv4Ix6DZD3/nwqMeqCFSzGNazOK9rd8K99oDK3bhoxfMnyCx2RyTUQI+B8V/hRWt32oqLiAl42J9BRQAp/mexPtolWNZ6RLZyrGeh1kswNKC9+aKpThan53SSi7yGus/GKrXQq31bE34mLf+mrnCQ4U3GNkJfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=maquefel.me; spf=pass smtp.mailfrom=maquefel.me; dkim=pass (1024-bit key) header.d=maquefel.me header.i=@maquefel.me header.b=BObLBsrE; arc=none smtp.client-ip=178.154.239.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=maquefel.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=maquefel.me
Received: from mail-nwsmtp-smtp-production-main-59.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-59.klg.yp-c.yandex.net [IPv6:2a02:6b8:c43:c14:0:640:86a6:0])
	by forward500d.mail.yandex.net (Yandex) with ESMTPS id C32D86115D;
	Thu, 13 Mar 2025 10:39:24 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-59.klg.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id Ld7US9XLk8c0-I58P5V7m;
	Thu, 13 Mar 2025 10:39:23 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail;
	t=1741851564; bh=A20s7mospYwoMutjh3srjwHTDHgDhq9CGMZZ8avn6VY=;
	h=References:Date:In-Reply-To:Cc:To:From:Subject:Message-ID;
	b=BObLBsrExnMTi/bHhPqAs10jRQ8DLdTt0d682boseMKsVfKKWoeVRGZ8Cu0jsZCAu
	 8JygciM7EZZe0M4/VXrpvTKtlvBcFD/WYbmoHf0/w3cVaGG5Po8dsJnDIVdlJJu47O
	 bJczVjPpDJmlxGCX88prRKmIsRRwS8X70tS94hfo=
Authentication-Results: mail-nwsmtp-smtp-production-main-59.klg.yp-c.yandex.net; dkim=pass header.i=@maquefel.me
Message-ID: <5372f57d61f31ac681e295964cacf2e23df3b3ed.camel@maquefel.me>
Subject: Re: Question about ASPEED GPIO value/direction set order
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley
 <joel@jms.id.au>
Cc: linux-gpio@vger.kernel.org
Date: Thu, 13 Mar 2025 10:39:24 +0300
In-Reply-To: <4878ed9cfd9ff20550cf0d9d8933ec993f4b288c.camel@codeconstruct.com.au>
References: <3cd0fe0ff42a751fd0738dacf16badcaa8ff51fb.camel@maquefel.me>
	 <4878ed9cfd9ff20550cf0d9d8933ec993f4b288c.camel@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Andrew, thank you for quick answer.

The reason i am asking this is that in QEMU the first time we set pin,
all below if (diff) in aspeed_gpio_update() won't be triggered due to
direction is set after the value itself (so no qemu_set_irq()
triggers):

https://elixir.bootlin.com/qemu/v9.2.2/source/hw/gpio/aspeed_gpio.c#L314

aspeed # gpioset 0 8=3D1
aspeed_gpio_write offset: 0x1c value 0x100
aspeed_gpio_write offset: 0x0 value 0x100       <-- VALUE
aspeed_gpio_write offset: 0x4 value 0x100       <-- DIRECTION

And i doubted if it's a QEMU or Linux driver flaw.

Thank you for the clarification!

On Thu, 2025-03-13 at 16:51 +1030, Andrew Jeffery wrote:
> Hi Nikita,
>=20
> On Tue, 2025-03-11 at 15:40 +0300, Nikita Shubin wrote:
> > Hi Joel and Andrew !
> >=20
> > I am observing "strange" behaviour when pin direction is set AFTER
> > the
> > value itself:
> >=20
> > ```
> > aspeed_gpio_dir_out:
> >=20
> > __aspeed_gpio_set(gc, offset, val);
> > gpio->config->llops->reg_bit_set(gpio, offset, reg_dir, 1);
> > ```
> >=20
> > Is this as intended ?
>=20
> Yes; you tend to set the value only when using the GPIO for output,
> and
> by setting the value before setting the direction, we avoid the
> potential value glitch which occurs under the opposite order.
>=20
> Andrew
>=20


