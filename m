Return-Path: <linux-gpio+bounces-13762-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B009ECFDD
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2024 16:35:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5587E167C18
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2024 15:35:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6233C1A76D4;
	Wed, 11 Dec 2024 15:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="VlU4gdHm";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="KmMALQrg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF89A1A4E9E;
	Wed, 11 Dec 2024 15:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733931320; cv=none; b=IHT7PIl7qqnuYfeITjAK1tmuJ3TTFgAhvlqAvcDkGkeYjfiP9BK3nFolDQdb2bB4CV8jUretzYLPwVCjW+a1cg3Gk5CrfmtuMYgINnMtE/svA2RfVK88uyp30W9HotiSsyyoEhxMrsDFpRZjCpUjClQUKM+LWw3eNqxOihekLSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733931320; c=relaxed/simple;
	bh=CBrRXCBDXzJyRcpKO1KAvD9x3v4k3C8W/5ulgYUbhHE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NDjLOsLvpWFgi+8jdjG93+ZyQYQPJTSarEik+2Xo7v9W8+T5TbnimGkD/KNns22inHV5Nax3gu8RIwGHxOk7S98JKloplpYiX29oguGvNupJCix21thTO3+YeJfKsN+bs4+5EwL1eAeu0NQ3Gs5LxdbREEq4qLmLAFHmIZXfoX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=VlU4gdHm; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=KmMALQrg reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1733931316; x=1765467316;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=2XwkcdEsEk4eyD2TGy648qZkGwuJpx7ENIxAqvrs4cY=;
  b=VlU4gdHmqCiLLsY5lKShzxHeQLxQHHzvCNDALxA/HVuIga9kARXy4XR+
   Vq15w2lbwfggOsqTfy75Fmw8NhAXDO5IfuYQLZkssgDVwdOk4orhaHNBw
   IWMNezYVyjSDiQUF5678Pwwv18ajEcMu8kCY3LCzQLB5nT8iGj+cd7oTL
   uLx0U4ykQ1uUcP6Hd57sW0ABnkY7V8oEkW3WFgrcFd9SkiT01LuVq6/+X
   0tYsY69I1JmyMKu3S3m16btYsCSQMpEp4S1X8m4jnOeQSI4TSjSyesK2k
   0YcUuPBJGkFAYETri7+++ldBWCPaIbf/i2hmSKd4qx/lgfIrQwivSOgA8
   A==;
X-CSE-ConnectionGUID: BMgRZIHISrGsDDZhmNE+Vg==
X-CSE-MsgGUID: ZQ26mmc8RAauFlKe0OQOYA==
X-IronPort-AV: E=Sophos;i="6.12,226,1728943200"; 
   d="scan'208";a="40542880"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 11 Dec 2024 16:35:06 +0100
X-CheckPoint: {6759B12A-21-2508CA35-F8546865}
X-MAIL-CPID: 7E02583DD20E2049FCEA9FD40FC1EB8F_4
X-Control-Analysis: str=0001.0A682F24.6759B12B.000D,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1C9F816AB31;
	Wed, 11 Dec 2024 16:35:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1733931302;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2XwkcdEsEk4eyD2TGy648qZkGwuJpx7ENIxAqvrs4cY=;
	b=KmMALQrgKkt7/hI2EmKa37WANn2nOrO3oRF/8dlIpKGqklh11C7RO836W5MlSceSYR01KW
	FfG0+EhTYzmEn5E46GP0sMp9m65VWQlQIrb5UcHLWSSPlXEw9nHVxJh1KjukZJpRSo5kuF
	NoDqQsGM46ET+t8NXmlb9AF1yM1RaFqXBBub9+iJnf6VfcelGiEibcRcskiid4vVkHQrew
	6HHXVefbf4wsOFy4VIei1LGIKQ1s2tYQSsPb0dniNHUD192pvpcPRHSP+kcWPwcRHFzXwh
	wbggZcFyX3DzaCjMWks6Ik3xdySEVocPnpyBwYLeb2yzL20Z7TXB6lmLZL1+gQ==
Message-ID: <3ceb31ad50046ada646f91e45c857f6350a06116.camel@ew.tq-group.com>
Subject: Re: [PATCH 0/4] gpio-tqmx86: cleanup + changing directions
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux@ew.tq-group.com, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Wed, 11 Dec 2024 16:35:01 +0100
In-Reply-To: <CAMRc=Mcw-r3b_a0XmpfVbF04MuZYnmM05AZqGav8GA_PM0-ozA@mail.gmail.com>
References: <cover.1733739697.git.matthias.schiffer@ew.tq-group.com>
	 <CAMRc=Mcw-r3b_a0XmpfVbF04MuZYnmM05AZqGav8GA_PM0-ozA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3

On Wed, 2024-12-11 at 16:12 +0100, Bartosz Golaszewski wrote:
>=20
> On Mon, Dec 9, 2024 at 11:36=E2=80=AFAM Matthias Schiffer
> <matthias.schiffer@ew.tq-group.com> wrote:
> >=20
> > This is the first of two series adding new features to the gpio-tqmx86
> > driver. The first 3 patches are cleanup/preparation and the last patch
> > adds support for changing the directions of GPIOs.
> >=20
> > Once this is merged, the final series will add support for new TQMx86
> > variants (SMARC and COM-HPC) that feature up to 14 GPIOs and full IRQ
> > support on all lines.
> >=20
>=20
> It's not like this series is very big, what stops you from posting the
> entire thing right away? It would probably add more context to this
> series.
>=20
> Bart

The second series is bigger and involves both the GPIO and MFD drivers. I k=
inda
expect a few rounds of reviews to be needed before it gets accepted, so my
intention was to get these smaller, more obvious patches out of the way fir=
st.

Best regards,
Matthias



>=20
> >=20
> > Matthias Schiffer (4):
> >   gpio: tqmx86: add macros for interrupt configuration
> >   gpio: tqmx86: consistently refer to IRQs by hwirq numbers
> >   gpio: tqmx86: introduce tqmx86_gpio_clrsetbits() helper
> >   gpio: tqmx86: add support for changing GPIO directions
> >=20
> >  drivers/gpio/gpio-tqmx86.c | 135 +++++++++++++++++++++++--------------
> >  1 file changed, 84 insertions(+), 51 deletions(-)
> >=20
> > --
> > TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, =
Germany
> > Amtsgericht M=C3=BCnchen, HRB 105018
> > Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan=
 Schneider
> > https://www.tq-group.com/
> >=20

--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/

