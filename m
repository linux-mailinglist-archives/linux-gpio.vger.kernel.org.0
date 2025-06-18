Return-Path: <linux-gpio+bounces-21804-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F168EADF34B
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 19:00:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F37B16F3F9
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 17:00:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 489C82EE5FA;
	Wed, 18 Jun 2025 17:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="gLlzbqTP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626502FEE29
	for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 17:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750266034; cv=none; b=cusVKpZnfP8kFLA9lD6slKoO13PowqJZpU5Am3K2ymH++Gjq1CE2nnYRrSm8aC8i7vz5RK/LaMEuOcsD8oqmS0GbingMLcH0Vzixhm/k/Q1zL1ubvf2m5njF1CK+alSj8vEixeVFuVeOQfVgQXyckAbtVe4HWsujQtf6Gn1JuBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750266034; c=relaxed/simple;
	bh=+8Xdqwb6MvOa9JgOjMPmutzEepHU6LBWPxhoVAtdHHk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vjxs8K0XbGbJUOQ1yKDYnqsKqr7MjIJR4+WmW7AL3kdVojxi2tXD93cvCTtQaqpKf9UHeSp/fWQIHkei6H/NoA7YLEODvu6xpn8pL9LsFQ1/QkQQXi6srw7GepmBJPzQCsnGupd/ci44Q0gzdnRT+Y3T5W0CCBR0rtgz1tIjh+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=gLlzbqTP; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54b09cb06b0so8100940e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 10:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750266029; x=1750870829; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OxTtuzusVWGqXpGsGysxbx2Frn0OYva/hDBE1FUWIBE=;
        b=gLlzbqTPf/GdtLrDXOO1UxqicEoY8LKaUh1Hck/2/j6M7gHgMw14kX/GildZRh/9zf
         nAC51FFNJkA8qY4KcDgA+zaz+8rJPC9W30WytThRwAP3Fv6k4mwK4yMqaSMlKw0AeNtk
         4sFqa0liiR0XrECqxPTxvefJ6+fui69u4huVAriuIiu+SggLO16eG7RU9WiJnJToWT/E
         JqdtyRKPA1mCVXBN7PaSD0euGTSP0jQ4MF4/AgU196BoF7ew7D3DC8B2ZbNW7p1r9u2d
         q5q2g0ibe/4zcOc81a0kCFjMhNyggezAx4wzvqbfk8Ae/iz5pYkeIlveRaqeGwSLX7MD
         9HrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750266029; x=1750870829;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OxTtuzusVWGqXpGsGysxbx2Frn0OYva/hDBE1FUWIBE=;
        b=sFB0psDaUPuTtjEexcAEN4r7Yaqd8g/wVH1fGFD3dKBM3xsV4dyCVS7kd2DXYhs1Qu
         rRVutng6jdIIn2bRdAxu/77FjO3PmbXa5PKryyo7tUjoC1pAVIV89EhLmJZyt2kryTKC
         8op/Bup23+e4qlq6PPgqNdS41Q37USt5dviP9SawcOA765+UXTzD72hU5Ji0eG4PeNwA
         mIqSa2osm0vKnkHD3PYw4gzcOwumAwELvezdb7soBqFkK2GOBdH8JGMC05PzfNjoCHJg
         4nMlGNEcsHX8/vOrsivmgX7z2K27PrQBACmuei6rub0w5lBJjH9AqWrWvP/LbaEgBcrA
         F+MA==
X-Forwarded-Encrypted: i=1; AJvYcCUp9yKtyo3rGVSQiT/PIxYP5T9977ruvWHS0Z+DSrdn/QOL4cQ2OASH/ja++Vs6sxEcQ7c1AUgo6FG5@vger.kernel.org
X-Gm-Message-State: AOJu0YzXrhszsT124esGdEZXuqpqXXMS+77/l5eYzsTY/RfoeRgUm7+9
	tP2LokDaDpTsWMeBdFCg/CLEANsQcnP3CQkalDz2O1G3obcjCOxoWxOXSv+Tanh4y0l6gxeLe0U
	9ZHPRwO5jy+S+dOsyJDke04/s4ELEpKiqtSt7Gz3uBw==
X-Gm-Gg: ASbGncsdQCQknT3bcsXnGPR8+j9dfCNWKo8ld408R206QlKD+txZx1fZQQ8qm3MOtow
	urWbmoczeKbv/jtUgGr78T9vKbWIcXO/KXXQDdottim4JOGu2Td29Rr2NK4wjRPbE9kYWj3NhyJ
	EhOtiq/ExYXZdvhCSCDb8v2OEtMaY754GApy/CnNrFGCKz3ez4jy1XudNtxQTymNxGuf+pUlJnX
	Q==
X-Google-Smtp-Source: AGHT+IFrk7wjLo0FScAaHSeULurkvYIZ6q3poIqbDoop4mdMvyFf4GdTA027YlkMWkLw9hocI1+ULYkfCsJCJgw5Ht4=
X-Received: by 2002:a05:6512:6ca:b0:553:25b2:fd2d with SMTP id
 2adb3069b0e04-553b6f16e9cmr4855031e87.30.1750266029272; Wed, 18 Jun 2025
 10:00:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
 <CGME20250618164320eucas1p28174732f38fd279fbba72f07887e5da5@eucas1p2.samsung.com>
 <20250610-gpiochip-set-rv-gpio-v1-1-3a9a3c1472ff@linaro.org> <06e7a1dc-e58f-4cff-b962-5eb087dc4c1a@samsung.com>
In-Reply-To: <06e7a1dc-e58f-4cff-b962-5eb087dc4c1a@samsung.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 18 Jun 2025 19:00:17 +0200
X-Gm-Features: AX0GCFsZ9BzqvDbhrAHxtqvk55yr6p1JWPmW5O8GtAIoAiziZFdZwWCX10LDhDU
Message-ID: <CAMRc=MfWD7XGuuiLd5_Sh1vODfE-v6suM3w=qdufxXPtkW+HVg@mail.gmail.com>
Subject: Re: [PATCH 01/12] gpio: mmio: use new GPIO line value setter callbacks
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-omap@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 6:43=E2=80=AFPM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> A few more changes are needed to avoid NULL pointer dereference
> (observed on RasbperrryPi5), because this driver calls ->set method
> internally:
>
> diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
> index 9169eccadb23..57622f45d33e 100644
> --- a/drivers/gpio/gpio-mmio.c
> +++ b/drivers/gpio/gpio-mmio.c
> @@ -362,7 +362,7 @@ static int bgpio_dir_out_err(struct gpio_chip *gc,
> unsigned int gpio,
>   static int bgpio_simple_dir_out(struct gpio_chip *gc, unsigned int gpio=
,
>                                  int val)
>   {
> -       gc->set(gc, gpio, val);
> +       gc->set_rv(gc, gpio, val);
>
>          return bgpio_dir_return(gc, gpio, true);
>   }
> @@ -427,14 +427,14 @@ static int bgpio_dir_out_dir_first(struct
> gpio_chip *gc, unsigned int gpio,
>                                     int val)
>   {
>          bgpio_dir_out(gc, gpio, val);
> -       gc->set(gc, gpio, val);
> +       gc->set_rv(gc, gpio, val);
>          return bgpio_dir_return(gc, gpio, true);
>   }
>
>   static int bgpio_dir_out_val_first(struct gpio_chip *gc, unsigned int
> gpio,
>                                     int val)
>   {
> -       gc->set(gc, gpio, val);
> +       gc->set_rv(gc, gpio, val);
>          bgpio_dir_out(gc, gpio, val);
>          return bgpio_dir_return(gc, gpio, true);
>   }
>
> Do You want a formal patch with the above changes, or will You just
> amend them to the updated patch?
>

Thanks, a patch[1] is already up for review. Please give it a try and
leave your Tested-by: if you can.

Bartosz

[1] https://lore.kernel.org/all/20250618-gpio-mmio-fix-setter-v1-2-2578ffb7=
7019@linaro.org/

