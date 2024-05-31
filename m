Return-Path: <linux-gpio+bounces-7001-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 055748D6085
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2024 13:20:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B49E6283047
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2024 11:20:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D238156F46;
	Fri, 31 May 2024 11:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="S6/XqAY7";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="hcQ3Gwxo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A9E15746B;
	Fri, 31 May 2024 11:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717154408; cv=none; b=MHvRhIi+qvZaqlyPs5Z2sF8X869oxjJWdwaSpBlyXbfFOhbObkZ0OLSST7pYjmxMSYH8TXoXsB7pYGLoGAE7DdRBKbQmr2LmI2EwWWa2qohXnoX2XtlsCKZdvYRZVkBmOYpJnFKuetAi4Z+27nbJYRTa3mj9Lcdg7glX01XZmjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717154408; c=relaxed/simple;
	bh=yK/9zuweDOypzYDJEBoGAgQ/cyW+LWy0AQZxqNE129s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Md8eG7v4aJjdCqaqw4e/T1avGTjTuGrllGpXBMxQLo0oTyoTGoCEBhYSXxQXb2maHb86VUesGC0ij48cz6dXAd3waS42oU/n8DpQiPG3W2WtcmUo632G4gvj4K7D7YUQ2WHCa5rfZB8Ji72zsBMr8crbzbonzc2XNAiv584TWHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=S6/XqAY7; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=hcQ3Gwxo reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1717154404; x=1748690404;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dBKf2zZ6ISHeCjN/chmz4IF4IvJbZqScCFwFIMuTRXM=;
  b=S6/XqAY7IA7MuOe1R4LPK2qkd/XL2MkJLYuccHCXw0cUzNwvx6l08zkZ
   Bw5iDw5ZWTKR/mhdKlwBbtwN0LJlJHYx2N6ia+Y0nMb00hztMtlszDo/m
   0SimSNXSXV9oPoFkCm2WbPsukP1v0ShOUWhPkZU2VHYsGl+gqqc7E8sJ5
   /oEP9BiaKBCIrTVpsEDlPPn3/HNO228ca7jUPHptxbslAjAjUEHwuAwPw
   Vf/1/W0aBEHXXGoEi49td1pixK+jOsGSpLieZZVvhh+G1EC7TmBqRIwub
   tRU62Bvy3fnmksXUaRFCL2k1F/hzdOLtmuImPE47S+HHGjgb/MMKbQpbI
   g==;
X-CSE-ConnectionGUID: VjAggmQpSy615veur+5o+w==
X-CSE-MsgGUID: 9j/bxm4oQeWL8attay58SQ==
X-IronPort-AV: E=Sophos;i="6.08,204,1712613600"; 
   d="scan'208";a="37159682"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 31 May 2024 13:20:02 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7A44E1664A0;
	Fri, 31 May 2024 13:19:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1717154397;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dBKf2zZ6ISHeCjN/chmz4IF4IvJbZqScCFwFIMuTRXM=;
	b=hcQ3GwxoQ6Dq+OVdklHuJTT67XqYyfbQL0wxRqo7nbnt/8OfGyP2wYg/R0Fqvy9sDljz/k
	xDSfZNsmsYGJG9NVdKUjaQwM/Ifd5OL/YVsjn+UJWNIzZSMAHK8rlSalq1JoVrJnABkY6h
	a5xyFx+BeRswdkRz3jXZGiN1kh1Vg/uvUF0/bQj/VNByKquZkLnQyKIjuGo5Js/bHhJoL8
	1AGeVp2xSSDxBXDshVOQBjVUkzcoArUmt5zuIPUBRXYSQcsmKP/566RMOo1C7BuxPhNzNv
	lMP5dbQrfkgI2NHi3zM1arZr3YmaW3qSA3WGb63tnMazMMI6lezkV2UdYTE9MQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 2/2] gpiolib: Show more info for interrupt only lines in debugfs
Date: Fri, 31 May 2024 13:19:56 +0200
Message-ID: <7750850.EvYhyI6sBW@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20240530191418.1138003-3-andriy.shevchenko@linux.intel.com>
References: <20240530191418.1138003-1-andriy.shevchenko@linux.intel.com> <20240530191418.1138003-3-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Hi,

Am Donnerstag, 30. Mai 2024, 21:12:30 CEST schrieb Andy Shevchenko:
> Show more info for interrupt only lines in debugfs. It's useful
> to monitor the lines that have been never requested as GPIOs,
> but IRQs.

I was trying to test this on TQMa8MPQL (i.MX8MP) using gpio-mxc.c.
But apparently this series only has an effect when gpiochip_lock_as_irq()
is called eventually. I'm wondering what needs to be done so IRQ only
GPIOs are listed in debugfs. Using irq_request_resources/irq_release_resour=
ces
similar to what pinctrl-at91.c is doing?

Best regards,
Alexander

> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpiolib.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index a6032b84ba98..f3b2f5c4781d 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -4888,11 +4888,11 @@ static void gpiolib_dbg_show(struct seq_file *s, =
struct gpio_device *gdev)
> =20
>  	for_each_gpio_desc(gc, desc) {
>  		guard(srcu)(&desc->gdev->desc_srcu);
> -		if (test_bit(FLAG_REQUESTED, &desc->flags)) {
> +		is_irq =3D test_bit(FLAG_USED_AS_IRQ, &desc->flags);
> +		if (is_irq || test_bit(FLAG_REQUESTED, &desc->flags)) {
>  			gpiod_get_direction(desc);
>  			is_out =3D test_bit(FLAG_IS_OUT, &desc->flags);
>  			value =3D gpio_chip_get_value(gc, desc);
> -			is_irq =3D test_bit(FLAG_USED_AS_IRQ, &desc->flags);
>  			active_low =3D test_bit(FLAG_ACTIVE_LOW, &desc->flags);
>  			seq_printf(s, " gpio-%-3u (%-20.20s|%-20.20s) %s %s %s%s\n",
>  				   gpio, desc->name ?: "", gpiod_get_label(desc),
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



