Return-Path: <linux-gpio+bounces-7200-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B41AD8FD567
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 20:11:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4D851C24396
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 18:11:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D85FD364BE;
	Wed,  5 Jun 2024 18:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a3iHTze9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155B613D8BB;
	Wed,  5 Jun 2024 18:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717610707; cv=none; b=JvY6RxNMBH2BiKh4o5aaXwB2WlwHRBoAY24BFIZuVoSnvn6XDXahmFBxqXoOFui18k+pTtMYmnx45TXxgJPJNs7vJgWyCd7NGGKiiqMYyF9SXtkWiwqoBvcLFvzkLQj2ra6MUXH+akT47/Q+NHCUjT1zKAnLTHhxjp7SKf/R3ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717610707; c=relaxed/simple;
	bh=VKzLBb0OSi2baRcPQk322AjysnqqpqQj3xhCYr7x5f0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hnIeXA2Y/o05YdVLJGf7a2pyRgKqmFFoOOqUs3TycxuNmZ8WkIs6kYpNKaLDUbu3cKJn8B8t1S/M69aVZw7n6qB5kQepLvLYEvNcI1a+BXXClS77YLVgl7C5I2tD+6+uGKXin2yrZuyeeg5KrtWlhWk1w4EMCtQefKslloNNznQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a3iHTze9; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a68ee841138so13395266b.1;
        Wed, 05 Jun 2024 11:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717610704; x=1718215504; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=my3UZfUe7kM4u8AuhMa7F42Fri1dYIgy1VNRL62itHU=;
        b=a3iHTze9RBw5XKyuTX1cwOkqKgzPqmQxXaQfmgh5ynMWmCEf5L0vB2tM1OFw4gDs/p
         H3aIw7Xvzj3pDqMV9+vIn6UqiHe4db/MgExr5y3EXRYjO/PlaJp4M7Zhowk55n1HzvNn
         rxTNd92k2JEO76Xc5AsPffNtGtDQxYOxz0zq8SUODhQaBih0FHM0EkwoQ0mW3Qo9UlBm
         dnbIrHDTxsf8s1p6iIUadOfTWiEiD9uOzhyCEfABuEYRBciQHOBfwvGEO7UdCV6KoQB5
         NQqqyVbcN9YwxeuxqP893OmGACAwxKcd2aU+OiXd2qiBwRT9LuyBQwiDnS1lFO3xPeGS
         1nGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610704; x=1718215504;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=my3UZfUe7kM4u8AuhMa7F42Fri1dYIgy1VNRL62itHU=;
        b=hH/ZpiTLwoKe+lQTYb+et0Ed0zENPv4VQZifjbrpu1CbsQMD3a7yRdGTyPt2N+qt9r
         wi/hdKgCRPfHwcp/dU8hh9hQw20AhQr8KjVacW/xXTqagWz7Ul+WChWK6EdVdUcE34Dz
         VA/4iL0+eWqRoKEz5AitjWZEmBRvd9sESzLhTWk8nmPa5n8G/8dmIY2Q9MKKW/srAxU3
         2LUBjH8yfEtHO6L/Ls0S6uSROhtyCrcXx8HYBcWnFFY1q7Tg38RrWpDdIUzsGgO42roI
         8Nlbjdt1Nz5Xecz5MU7PJfRDBhoulxOKwYMaDRsvKGhhloZbPgLFtQZbYPjcWipBrQza
         Y4+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWJ4nOl8ZojSqMHGZ3Hr1IDs/b5LD1hTbehP2KKgrkczWyWd9x3DGI/daDjR/Fsfs6o07EBKeGwHkdnwC1tuDXptjQjgug9MikY0skp3drJx5PFE+VYGxyh0BmaKn3JgII9EDoQdr8nm2hIZXXwL+ChKNQI+arqqxOsoIZejLuOdutUDsOI
X-Gm-Message-State: AOJu0Yxh7wECgu7sZQkmfujRT8qMagLhBuj2vdhTunNHvHTcntxCywdO
	CldrobvruJEk6Myj+qhpJOx27/33dGV1/O2HxMDEkoyYH4G33RZE0tvi204XbzAUjXQa2WmZCSj
	upDzGr2wbM4/dhzd0kysCox4WzpflN8+U
X-Google-Smtp-Source: AGHT+IGhWTYwKt5+UnLZMLgA3WGENZ6y+3VeysAk+PsADmfk/ucAPuWrvI0YWMvgkFEa9EoLpDzWeoDtKMznAZZxEUo=
X-Received: by 2002:a17:906:ee89:b0:a68:379d:d623 with SMTP id
 a640c23a62f3a-a699fac0c4amr245842366b.36.1717610704188; Wed, 05 Jun 2024
 11:05:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240605161851.13911-1-kabel@kernel.org> <20240605161851.13911-3-kabel@kernel.org>
In-Reply-To: <20240605161851.13911-3-kabel@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 5 Jun 2024 21:04:27 +0300
Message-ID: <CAHp75VccGwei9XE9vp04or7dbjOSvN7Hb0kvD06_H7=sFTKy_g@mail.gmail.com>
Subject: Re: [PATCH v11 2/8] platform: cznic: Add preliminary support for
 Turris Omnia MCU
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, 
	arm@kernel.org, Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	linux-rtc@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 5, 2024 at 7:19=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.org> =
wrote:
>
> Add the basic skeleton for a new platform driver for the microcontroller
> found on the Turris Omnia board.

...

I paid attention to this block because of ETH_ALEN, see below.

> +#include <linux/array_size.h>
> +#include <linux/bits.h>
> +#include <linux/device.h>
> +#include <linux/hex.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>

> +#include <linux/turris-omnia-mcu-interface.h>

This is part of the niche of the driver, I would move it

> +#include <linux/types.h>

t is followed by s :-)

> +#include <linux/string.h>
> +#include <linux/sysfs.h>

...here as a separate group.

> +#include "turris-omnia-mcu.h"

...

> +       /* we can't use ether_addr_copy() because reply is not u16-aligne=
d */
> +       memcpy(mcu->board_first_mac, &reply[9], ETH_ALEN);

The inclusion block misses the header for ETH_ALEN, but I realise that
instead it's better to use sizeof() as it makes this rely to the real
size of the buffer and header is not needed either.

...

Other than above LGTM, FWIW,
Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko

