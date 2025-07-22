Return-Path: <linux-gpio+bounces-23642-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE73B0E1DE
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Jul 2025 18:27:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B48DB16E805
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Jul 2025 16:27:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B7FF279DDB;
	Tue, 22 Jul 2025 16:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E5SYcP/N"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20788185E4A;
	Tue, 22 Jul 2025 16:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753201665; cv=none; b=gxxd+6Gt8b+IVczUgEmMOGEKX1LlA7WB3c9bkO8ZSJAOcFK0DxywsmDgR4ggWS0A1AWxxRuXMlW708NNm1tsPViRJ68PRW6fvgvVN7USk3SK0LqjoI1QJD3zHvKo8kGa9VVqjURzvX5GAyVvJGEhLnv5m/CgnFGGUw/2k2z82Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753201665; c=relaxed/simple;
	bh=p4vn85DXlSX/4jMQrgg3MyiYMr9XuCzlB8zMAypufwU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=q2MnRs/iuONcxK7MOgIXGB2DF7NQxvKJu/wdCisRgg0btXNpV7r3BLZj58LA/9RIWsVf13BNoTb5nyef/aHWFBuYFoNvnm+/pf+/uT+scAWF5cxQotx5v5Ux7XYn+QZHBI7Ke09RXImKaCrdNujrmT9d1LlCkOTZpXfqz8gKSL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E5SYcP/N; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4560d176f97so61701275e9.0;
        Tue, 22 Jul 2025 09:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753201662; x=1753806462; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jPL/bQrG0KK97HOrQMIMugN1KCNfKDOWt/BNstzZtuY=;
        b=E5SYcP/NZotzvVgcPiMuUbwkHBk2//WT3R7sfP8hr7VyYwi7DD2YIVF35rbbQit6jv
         mKL9v54J4FIVdWpBCuk5qNlZgi1YzQcIOY/DEumk7/O3oJsxM7eQgsw18r9jIXla5sTI
         eEPYBzdKHXa9Wd+tq1hd0cvoRTIp1CBRODPwKiEYUQQpKq1dAzEg+9gLRl/HN6V5uYtJ
         ULk0a8fki6akRMTHRn82A9vbJ2EvVEGKwisOr14WErsA/uXIqohTvJPTz/3dwzXKhD+6
         TERELhtMIeYxv8juxZ8tzBh/6GED+h0f7TxJGvSkmK10rYyGjz8nJeo9g8HohPaiCsTK
         8G8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753201662; x=1753806462;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jPL/bQrG0KK97HOrQMIMugN1KCNfKDOWt/BNstzZtuY=;
        b=XfIEQh9L+qztBxe076l02x1eNo1b6BFYd783qyNJB5aZkw9PfXT/X8ddDiauurytA9
         eWno8AmZjpk2r3nBX9AQ5g2B8B/uEryopzpUrusOEWzqd2u9H24Yk3jMsWjChIaWMwi0
         iChK7RlMjVSrJSzdrxzogTvAQRVeCls209nHRoadY9KMR1m6ssQ0aRR4j6wPlPNC0+Bs
         s3Rfkgs0lWbagX+2U3dhTV2pLUgfYDCgvQaHipcqodYJyRbDm9bwy63fmc+KpUK50K0V
         iWpTjjWvc1dFQia0MiZiC/6yuiMyhSTbbAeazazJNFyQ6vl3vwZBwb+bAHAOGHxHveRD
         9YHA==
X-Forwarded-Encrypted: i=1; AJvYcCUXqIZizxtIIn4nVbtdOiSyppTo0vRUMqHMCeOSUgRvKEigbSs16YoZ6zCQeshvj7+Lyysn1dvgtzLGGqfQ@vger.kernel.org, AJvYcCWHtbXmoOrq10eQ4jA/vZvzIddBDRWlRsjtQCapupX9lV+3xGwRK9M4XtBuF4BNCVifmGYeo8q9eOpb@vger.kernel.org
X-Gm-Message-State: AOJu0YwwvQcPtumEt4Qc9cFlQbgFe/UwMYL8iSWK3zACYqBSZxP0P+8k
	myVTixvEqvKSgBfuH1dO+n5RI/LHcZgfCs6uhZsmAwSzqFh4a6/9Dojp
X-Gm-Gg: ASbGncuxZOA9FaFSvaihzpn6prmKLd7+80F7F5TCrdsa4EgSR7Ro87TewhR1U8WkZUu
	I2x+pQhJo80rhUBjdH3tYby0ADLGG6Wa/z5FjB59yXIZp3Cch1TZ/YiIZtsLCyN6i1RyYO7cgRJ
	iVg2Bceu1x51iE5UvhTcnjIsY++Cp7UJNnn66EVeETnZ7GdQFtaMc4SCAgiJUV28Swqhqr+OADH
	m5KQQdjSzY1LuVoaO06aDugTOuSPHrImIKh2o88Me9Y/j58WJtdnq3qKcfcM519FUi5qAi5z6DK
	n2W4dc6poXtdF5/N5ukw1KcX/SLs0slsjrmPEWJW4A5T5rq1U/s4iot8yW2ahNYUfNVjTlEEBdp
	Q8uZjVXjQIkm4Z/uuobc8Z97vZ1yQTZAD6RbGIYcZs5A=
X-Google-Smtp-Source: AGHT+IF14PcdZ17fdOykCg8l0j2y9ozBZijR/gp+KaOTGW8PMhcda5B053e9VvTnRUrzZSRZLdiGtA==
X-Received: by 2002:a05:600c:474a:b0:456:1d06:f38b with SMTP id 5b1f17b1804b1-456308f97fcmr233957485e9.8.1753201661999;
        Tue, 22 Jul 2025 09:27:41 -0700 (PDT)
Received: from giga-mm-11.home ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4562e803cb3sm193840965e9.14.2025.07.22.09.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 09:27:41 -0700 (PDT)
Message-ID: <7da8e0ee4d60661a046c1bf22226e1bcff35a377.camel@gmail.com>
Subject: Re: [PATCH] gpiolib: make legacy interfaces optional
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>,  Bartosz Golaszewski	 <brgl@bgdev.pl>
Cc: Arnd Bergmann <arnd@arndb.de>, Peng Fan <peng.fan@nxp.com>, Lee Jones	
 <lee@kernel.org>, Koichiro Den <koichiro.den@canonical.com>, Geert
 Uytterhoeven	 <geert+renesas@glider.be>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>,  Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=	
 <ukleinek@kernel.org>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Tue, 22 Jul 2025 18:27:40 +0200
In-Reply-To: <20250722153634.3683927-1-arnd@kernel.org>
References: <20250722153634.3683927-1-arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2025-07-22 at 17:35 +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> The traditional interfaces are only used on a small number of ancient
> boards. Make these optional now so they can be disabled by default.
>=20
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
> This is the first patch of a series to turn off the legacy interfaces
> by default. If we can still have this one in linux-6.17, we can more
> easily merge the other patches for 6.18.
>=20
> See for the longer series:
> https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git/log/?=
h=3Dconfig-gpio-legacy
>=20
> I'm sure there are still problems in the other patches, but it
> does pass my randconfig build tests on the three architectures
> I'm testing on. I plan to post them after some more testing
> once -rc1 is out.
>=20
> =C2=A0drivers/gpio/Kconfig=C2=A0 |=C2=A0 3 +++
> =C2=A0drivers/gpio/Makefile |=C2=A0 2 +-
> =C2=A0include/linux/gpio.h=C2=A0 | 10 ++++++----
> =C2=A03 files changed, 10 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 12bdf6e965f1..8bda3c9d47b4 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -14,6 +14,9 @@ menuconfig GPIOLIB
> =C2=A0
> =C2=A0if GPIOLIB
> =C2=A0
> +config GPIOLIB_LEGACY
> +	def_bool y
> +
> =C2=A0config GPIOLIB_FASTPATH_LIMIT
> =C2=A0	int "Maximum number of GPIOs for fast path"
> =C2=A0	range 32 512
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index 88dedd298256..b01ff2b68bf6 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -5,7 +5,7 @@ ccflags-$(CONFIG_DEBUG_GPIO)	+=3D -DDEBUG
> =C2=A0
> =C2=A0obj-$(CONFIG_GPIOLIB)		+=3D gpiolib.o
> =C2=A0obj-$(CONFIG_GPIOLIB)		+=3D gpiolib-devres.o
> -obj-$(CONFIG_GPIOLIB)		+=3D gpiolib-legacy.o
> +obj-$(CONFIG_GPIOLIB_LEGACY)	+=3D gpiolib-legacy.o
> =C2=A0obj-$(CONFIG_OF_GPIO)		+=3D gpiolib-of.o
> =C2=A0obj-$(CONFIG_GPIO_CDEV)		+=3D gpiolib-cdev.o
> =C2=A0obj-$(CONFIG_GPIO_SYSFS)	+=3D gpiolib-sysfs.o
> diff --git a/include/linux/gpio.h b/include/linux/gpio.h
> index ff99ed76fdc3..8f85ddb26429 100644
> --- a/include/linux/gpio.h
> +++ b/include/linux/gpio.h
> @@ -13,6 +13,11 @@
> =C2=A0#define __LINUX_GPIO_H
> =C2=A0
> =C2=A0#include <linux/types.h>
> +#ifdef CONFIG_GPIOLIB
> +#include <linux/gpio/consumer.h>
> +#endif
> +
> +#ifdef CONFIG_GPIOLIB_LEGACY
> =C2=A0
> =C2=A0struct device;
> =C2=A0
> @@ -22,9 +27,6 @@ struct device;
> =C2=A0#define GPIOF_OUT_INIT_HIGH	((0 << 0) | (1 << 1))
> =C2=A0
> =C2=A0#ifdef CONFIG_GPIOLIB
> -
> -#include <linux/gpio/consumer.h>
> -
> =C2=A0/*
> =C2=A0 * "valid" GPIO numbers are nonnegative and may be passed to
> =C2=A0 * setup routines like gpio_request().=C2=A0 Only some valid number=
s
> @@ -170,5 +172,5 @@ static inline int devm_gpio_request_one(struct device=
 *dev, unsigned gpio,
> =C2=A0}
> =C2=A0
> =C2=A0#endif /* ! CONFIG_GPIOLIB */
> -
> +#endif /* CONFIG_GPIOLIB_LEGACY */
> =C2=A0#endif /* __LINUX_GPIO_H */

--=20
Alexander Sverdlin.

