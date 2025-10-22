Return-Path: <linux-gpio+bounces-27424-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E2DBFADF9
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 10:24:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F95556246E
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 08:24:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A54630504C;
	Wed, 22 Oct 2025 08:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b="ZW4uF3y5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBE5307ADA
	for <linux-gpio@vger.kernel.org>; Wed, 22 Oct 2025 08:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.241.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761121451; cv=none; b=ShhOw+s3HD2VItOY5G023KCUBApYDtmy2X6tmXkO2OVZ8wS0VAkhWEEd95Pgwjcmwkz9b36OOXj7p9SYmwp6p6Wbd6k1ZvuXVq0AT1HOUbHx49QxORQxvk7xSyPxBaWz1WWwn5BVIpiYL84p6YqDoB7rybRgbWjaA6gk/5VgITQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761121451; c=relaxed/simple;
	bh=cVLAI8TidoafTBGuNFYDV/STwV4in9pD95DRKnSWSMk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MX9aUdDrf8ZI9ada9BruvCI4NV8fn+zL8Fd2yfYwSCIsQHz1QuSVNqdbRR52TeOYRNNBiWMLnJRAbch7UR86aiW6tWdhucISY5+OxL3mNhdMx6NssmIC34JNf8FYg4BoHhcF01ZRxvELqVsLQ0/7VFZAKBaHhlZtHFRWXfQUcq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net; spf=pass smtp.mailfrom=svanheule.net; dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b=ZW4uF3y5; arc=none smtp.client-ip=84.16.241.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svanheule.net
Received: from [172.28.172.2] (ptr-94-109-117-102.dyn.orange.be [94.109.117.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id D88AA68B189;
	Wed, 22 Oct 2025 10:24:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1761121447;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cVLAI8TidoafTBGuNFYDV/STwV4in9pD95DRKnSWSMk=;
	b=ZW4uF3y5R7fcDgf9PaMVfeZt4x0p/ZgPa0U+r6M87BR8FT7cpWGQ/EaZz1WWU3GokV37HE
	cURMdW0WJniFNpUlbSgmAbhZPiJc6n1II7TPE3Kt1hCIAxYNLYSxYxboPmQPKi4UFPi7Kl
	42oxNcoq0BQGaq2MNWu/X8bQZYC2wpc5Yjamjfp+ptfaSDucrIQTxE6tNvSIsb1ZUu/bBo
	cK2l3HTFdODeNW1l4C6logie0WdX/J4GKYuu7cC3jhMtp+5x2j4u37D4XY/OU0lXkUL290
	YjFlv751+dTC0Sii866FsiXjs/hHWEWMUQG+ZEtSLOzYucUKC07uN5Ciq2Wi4g==
Message-ID: <e6d95d91b68a86b748008f69dcc495796b61843e.camel@svanheule.net>
Subject: Re: [PATCH v6 6/8] pinctrl: Add RTL8231 pin control and GPIO support
From: Sander Vanheule <sander@svanheule.net>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Walle <mwalle@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	linux-gpio@vger.kernel.org, Lee Jones <lee@kernel.org>, Pavel Machek
	 <pavel@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 22 Oct 2025 10:24:04 +0200
In-Reply-To: <CACRpkdYde+=85f6Zfz40bMwOxSE-bszHzvBhQwC+G-E2CZr3Lg@mail.gmail.com>
References: <20251021142407.307753-1-sander@svanheule.net>
	 <20251021142407.307753-7-sander@svanheule.net>
	 <CACRpkdYde+=85f6Zfz40bMwOxSE-bszHzvBhQwC+G-E2CZr3Lg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Linus,

On Wed, 2025-10-22 at 09:42 +0200, Linus Walleij wrote:
> Hi Sander,
>=20
> thanks for your patch!
>=20
> Overall this driver looks very good and well designed, using the
> right abstractions and everything.

Thanks!

> The build bots are complaining but I think you will have fixed that
> in no time.

Indeed, I reproduced it on a UM build and resolved it by changing the under=
lying type for
enum rtl8231_pin_function to uintptr_t.

Additionally, this showed that I was missing CONFIG_GPIOLIB, so PINCTRL_RTL=
8231 now
selects that as well.

>=20
> Just one minor comment:
>=20
> On Tue, Oct 21, 2025 at 4:24=E2=80=AFPM Sander Vanheule <sander@svanheule=
.net> wrote:
>=20
> > This driver implements the GPIO and pin muxing features provided by the
> > RTL8231. The device should be instantiated as an MFD child, where the
> > parent device has already configured the regmap used for register
> > access.
>=20
> This is Realtek, right?
>=20
> > =C2=A0drivers/pinctrl/pinctrl-rtl8231.c | 538 +++++++++++++++++++++++++=
+++++
>=20
> Should we put the driver in
> drivers/pinctrl/realtek/*?

Like you noticed, this is for an external chip, so I also decided to not mo=
ve it to that
directory.

Best,
Sander

