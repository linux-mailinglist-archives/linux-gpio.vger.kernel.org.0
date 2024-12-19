Return-Path: <linux-gpio+bounces-14034-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8849F82DB
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2024 19:03:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 495BF169CCE
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2024 18:03:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 122F61991C8;
	Thu, 19 Dec 2024 18:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mIUk9sVm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B77E190685;
	Thu, 19 Dec 2024 18:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734631377; cv=none; b=G7QBoMIJOIb8eSTxzpofZS4GAsI3WXA1GVts2+kajk28/8J3QWAQMCx72AZeutVNN3/rRwxURgnC0u4/LxJIFQKbpe1MDkIC3LkUsq18TXNLpBJ+STh61DbsAKbMN5Ixv4CeWIiPCsILL842HeADalMIGPkxQXgDW4wicKu6lsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734631377; c=relaxed/simple;
	bh=U5RgpqJo51da1RhVLYMspV1xTRV4VeKr6yh4hNFTXNM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nkXNxopqqZK+pxFK6xyKv4LhKtOn9jsGzQsjpIcvDB7ql8QQ3ACynwicEOyI5TE0VgFCooCWAGwZLx9Q+lmrVvs4C9P84sqw7mm6JMn44N8Y/kHPVTFviDRT+wt3UhTyeEzfFWqzs00oFJR9ZmnX6Vu6j8ka185OCniJYWyuafk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mIUk9sVm; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id AF11EFF802;
	Thu, 19 Dec 2024 18:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734631373;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U5RgpqJo51da1RhVLYMspV1xTRV4VeKr6yh4hNFTXNM=;
	b=mIUk9sVmCs2iJoRFPvMhAINj0bhbYYJ6b6bVSKQ66e5whUNTZ9+5L9eLs2mMD1uD1UMRSk
	9fX7AYhlkO3EP8U4PHRL8Nv01k9ffsPygrMlAaD/tE+RACfoxICzQFSwaPMuOeyt0rmpno
	YEw9eeyxxho+IdswiKjAb+t5iFU6THi8u0v94QcnlNgZo5uNhkQAPGhK81XgUam2fZYyFo
	IBtSvyRnftwaOl9DMspKsVAUKWmLRVLkxiRwHHGggIC0wgeMYk1lFm+8mFSTSWzy0xWaS9
	h07JyDhL8x0Mpdcs2XL0IOcl5Py8zlQv+XGNDRC74rKDOHP30tHRhwiRNS55XQ==
Date: Thu, 19 Dec 2024 19:02:51 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Steve Longerbeam <slongerbeam@gmail.com>
Subject: Re: [PATCH] gpio: pca953x: log an error when failing to get the
 reset GPIO
Message-ID: <20241219190251.43300b1a@booty>
In-Reply-To: <CAMRc=MfDbS53m1YOu6zicXQfcs1HfoO+rK0=4QqkQPnYqj9q4g@mail.gmail.com>
References: <20241219-pca953x-log-no-reset-gpio-v1-1-9aa7bcc45ead@bootlin.com>
	<CAMRc=Mf7=9N1Wo642XnGJ+nzqBY8N3D_cHb3TnsG93y+KTqBKQ@mail.gmail.com>
	<20241219163802.01a6a7b4@booty>
	<CAMRc=MfDbS53m1YOu6zicXQfcs1HfoO+rK0=4QqkQPnYqj9q4g@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: luca.ceresoli@bootlin.com

Hi Bartosz,

On Thu, 19 Dec 2024 18:00:09 +0100
Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> On Thu, Dec 19, 2024 at 4:38=E2=80=AFPM Luca Ceresoli <luca.ceresoli@boot=
lin.com> wrote:
> > =20
> > >
> > > Fixes: and Cc: stable tags? =20
> >
> > I haven't been considering my patch a fix but rather an improvement. =20
>=20
> Ok, I'll pick it up as is then.

In case it's not too late:

s/dirver/driver/ in the commit message.

Luca

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

