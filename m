Return-Path: <linux-gpio+bounces-22869-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 57026AFB359
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 14:33:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5103B162BD4
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 12:33:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B82729ACEE;
	Mon,  7 Jul 2025 12:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="lONy7aFw";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="a4QFFm5G"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD1D2957B6;
	Mon,  7 Jul 2025 12:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751891581; cv=none; b=KE+DrVG0VfywLtlPpQjziAjEH+6G34MIrJjxCVLxS6ZwJDkeitI3ktLebI2Ee5ggufqG8LLMaDyOiCoiTbA77cCJarPDZCTLWj3xQVrfIrV1Z/XQ+N8OFSbOKxXrlrRKMVfL5aHORgZNv4HNqR+1zVuEJ7YjddgkkEAVwYjWlg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751891581; c=relaxed/simple;
	bh=ZB4ZKNTjoCRoFxY1M7eYuv9YSVyVx5y1dI8rUYVH3BA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IAEA8ygpN5DzMC6a6LXLdd7hhrhnC41BDcdNtSYHRJa6AJLIUbXlODamqZKvxLRwSDavm89lRKli0Gg29z0/ke+2975E/4N1KzFspFy0qst2lCyRElec1UjkFQUP7qHJ0ClqopAuTINDRcDaI0SMiSxbv5S3TuyIe0ygHRKa4GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=lONy7aFw; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=a4QFFm5G reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1751891578; x=1783427578;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=3EFoMtLUWx6MbDX6P0aC3dbBN3HKxOB4zApNaP2oCeA=;
  b=lONy7aFwBeCnNHUAS2+dsJt99x0sJcIeqb/7u5hzwcg+D8m67LooMGDx
   0zbP0zg7F/5H+2R2a/ggCS4JUbwcDmDpvjYyAtrue3a2zvopLU/qgAnd9
   XIsONLSGaDZv1DrVmrrdpNYjZcDwa6clOtXhfP8K734uMFB0/SkFJ71Av
   ylRT4hUQpqdKaymHCRUjs5kiWqsw14yBOzlqm7pZBqNC5VfkSSxNuFvKb
   G4G4lhxPS3dHfjmMbvNtX1rPwsvmjzDpCVV53YDQE3n/hyHe9zMHO02vk
   VCG+CzinZ+Xq78Klzpm3KVIDiw2fn2mR+msrdSnLY2k3+X894V+u/NBVw
   g==;
X-CSE-ConnectionGUID: dwPCq672SsOplsYjP+AsxA==
X-CSE-MsgGUID: ayOzl+24QC2/dpqRYojkJA==
X-IronPort-AV: E=Sophos;i="6.16,294,1744063200"; 
   d="scan'208";a="45062521"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Jul 2025 14:32:55 +0200
X-CheckPoint: {686BBE77-11-4C91DA42-F9D38293}
X-MAIL-CPID: ECC4F355EFDBBE1EB90FE1E99CCFC922_5
X-Control-Analysis: str=0001.0A006397.686BBE89.0055,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6A300164D01;
	Mon,  7 Jul 2025 14:32:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1751891571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3EFoMtLUWx6MbDX6P0aC3dbBN3HKxOB4zApNaP2oCeA=;
	b=a4QFFm5GESvBpUD4d2yaaa+l+TsYTB46OOtPgJPHFCHRMDRwCRlHRJUtJph6HveriV4d8+
	47P2d1fiec1o2zISgVTJj5dFnFHmsLuRN2qvmdg5/Do9VDOzmOraA4zSCI3XpigixMTVys
	xcVwWkfRu7qmDXw3gA8itDCsqFvM/egOYYEoZd9H7mh82YyDTdhdKxaCgck4I1i9lfkq61
	eF/L6/WnJ3oxeBTQvyTBjW+lV+AuRfV+/8YpHjYPmCIy7pbA0nNFdInIHxxWM5Xi3pp5TV
	N6GkhxoaG+IPSArJUJPcy+Z6BJJzF5obbNnA+jv5AaueT2wjSPLliQQFCdrUiQ==
Message-ID: <bf08cf4f890060d2d32d365abfb49d1c708a7fad.camel@ew.tq-group.com>
Subject: Re: [PATCH 05/12] gpio: tqmx86: use new GPIO line value setter
 callbacks
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux@ew.tq-group.com, linux-arm-kernel@lists.infradead.org, 
 virtualization@lists.linux.dev, Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>, Linus Walleij <linus.walleij@linaro.org>,
  Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu
 <mhiramat@kernel.org>, Viresh Kumar <vireshk@kernel.org>
Date: Mon, 07 Jul 2025 14:32:48 +0200
In-Reply-To: <20250707-gpiochip-set-rv-gpio-round4-v1-5-35668aaaf6d2@linaro.org>
References: 
	<20250707-gpiochip-set-rv-gpio-round4-v1-0-35668aaaf6d2@linaro.org>
	 <20250707-gpiochip-set-rv-gpio-round4-v1-5-35668aaaf6d2@linaro.org>
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

On Mon, 2025-07-07 at 09:50 +0200, Bartosz Golaszewski wrote:
>=20
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>=20
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Acked-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>

> ---
>  drivers/gpio/gpio-tqmx86.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpio/gpio-tqmx86.c b/drivers/gpio/gpio-tqmx86.c
> index 18f523a15b3c03e083b363a026e751f7367fb080..056799ecce6a256f3438d9fd8=
1ee4677cdd20125 100644
> --- a/drivers/gpio/gpio-tqmx86.c
> +++ b/drivers/gpio/gpio-tqmx86.c
> @@ -93,14 +93,16 @@ static void _tqmx86_gpio_set(struct tqmx86_gpio_data =
*gpio, unsigned int offset,
>  	tqmx86_gpio_write(gpio, bitmap_get_value8(gpio->output, 0), TQMX86_GPIO=
D);
>  }
> =20
> -static void tqmx86_gpio_set(struct gpio_chip *chip, unsigned int offset,
> -			    int value)
> +static int tqmx86_gpio_set(struct gpio_chip *chip, unsigned int offset,
> +			   int value)
>  {
>  	struct tqmx86_gpio_data *gpio =3D gpiochip_get_data(chip);
> =20
>  	guard(raw_spinlock_irqsave)(&gpio->spinlock);
> =20
>  	_tqmx86_gpio_set(gpio, offset, value);
> +
> +	return 0;
>  }
> =20
>  static int tqmx86_gpio_direction_input(struct gpio_chip *chip,
> @@ -368,7 +370,7 @@ static int tqmx86_gpio_probe(struct platform_device *=
pdev)
>  	chip->direction_output =3D tqmx86_gpio_direction_output;
>  	chip->get_direction =3D tqmx86_gpio_get_direction;
>  	chip->get =3D tqmx86_gpio_get;
> -	chip->set =3D tqmx86_gpio_set;
> +	chip->set_rv =3D tqmx86_gpio_set;
>  	chip->ngpio =3D TQMX86_NGPIO;
>  	chip->parent =3D pdev->dev.parent;
> =20
>=20

--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/

