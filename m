Return-Path: <linux-gpio+bounces-8395-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E507A93D98E
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jul 2024 22:08:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 166C5B2232B
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jul 2024 20:08:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E6385FEE6;
	Fri, 26 Jul 2024 20:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s4raXWw/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35EF2502B1
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jul 2024 20:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722024478; cv=none; b=MmTqD87AEEk+9C5ISDWX7Ft5JqQM3KUZRTDhnzmuHaLIBDG+0uo45IiwVhuSeHMVu91vPzoOR/mNYFoUZU4iREkEWfLPbWTTQfI5/egs+6yAP3d2s0KO5w/0b145867pFZrkKv39n228oq0z4f/SZB0LyHKfwZOm0CnVkKUyhVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722024478; c=relaxed/simple;
	bh=cN+bhlGhXvdQOy/q2phk9f7fwDhkHhzSgfNRQFqKX5o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jvQUeHj2RwzmiUfyyOz9PC9789cbkZhUq91R6nhMqMeCYBvw2CzSwfWnaeW0C57GEXY/70ClD3D37pX+XwsnYMTaKugppQrw+ix/BsCYob67u/Pc3xaws9kCZ8/QMOFV6D99kYAf1zwzGh5w0FQqjYcEvPPBofNA0zkkPGpkPTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s4raXWw/; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52ef95ec938so2141086e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 26 Jul 2024 13:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722024474; x=1722629274; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L6vPQqxnaA8iRKELxBTOBnuLq648rZn3hSbphLM/0KA=;
        b=s4raXWw/ciF7cbAfo2mI1C5VFeHoTtQ7U5tkGVfzTzVyfSdSK7+zQdbb6KlA7OsDz6
         tZuie2ajJxUgFh6oQbSE4N8PJBrcxE1kQNhEk6xTlpuDBm9bI/RIILS1nf4I3jVZjvdx
         smcjK0XFZFwLgUxGa8C9rgHI0U29xdUCmsLaer79OXY4j2be5yMYSEFvOxLdITH8eh5s
         8Xze1rlMEFQkIGPBnlBYVGox04BXQXQK2xIu3XubqfNspPUUcOcGE9UXQU99kS5umaU1
         8OCNDTvYLPXi482zTJK7ED527voeMYORPR/HQs5VT/GipXFuaosl1Da3kWB5E3it4Gki
         2sAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722024474; x=1722629274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L6vPQqxnaA8iRKELxBTOBnuLq648rZn3hSbphLM/0KA=;
        b=Soy7YChZwdFK1lXbkiGKMvGj5i++c6YAapudvegZVDq72WkujmdVLjNPDfHLBjMKU6
         cXe6fANiBQCeEturm5eUW2CcY7lNw7FD96rGzc1N1gFHOCWznuZbjlRAIj/EAerCjFwP
         TyL1Ou5d+B5wHJTWTTTY6ZW/1wKRRRAd4b112bCb5zBHG3bSAHSnxla8dydYs+fSIJdt
         rGJC1+jqs6YAopL48yInjedum+T5h00I5pnreHcFEpqrCcVS72tMB27Zm7+syWrfECm9
         VSyvbIt3CodWbnJv4ea6rzasP35fjw84ddwFH1Hi4ALqlNAZTEjUKphpZNv149gAmNOI
         THIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDhIWBypdUay41BMdIrJfwV5w8PFdCRzxyUtb204QDi0XWn6TL8k8V1laaqc7+58kr2aaWFXwRGdfXmxFs/qdF3OZOtKQQmSs9ng==
X-Gm-Message-State: AOJu0YyoIqEpTZr6OsMaX6XbL/TW2QSEFUYMpx7ZHZu7P8SwuFdSCaLN
	iHfK77apYgeukPtUXD2fbejLsxrooYhNFTgisCd4QXT40Nimz1TjYfxRTpQfkh5Yk4KlFzStzPj
	c7RymEpd+nt6RqMCg39BF4+ESq3IzUv8BN33f6A==
X-Google-Smtp-Source: AGHT+IEwJZ6dF/yGVYmOpFKpqcphcFS2ZB8YkzGVJkaRqeOwmM/ZJdVJevz+++6YMY8Cqm3K5Zdr9yx2KkbFU9KgNvs=
X-Received: by 2002:a05:6512:324e:b0:52c:7fc3:601 with SMTP id
 2adb3069b0e04-5309b2cea1fmr427084e87.61.1722024474236; Fri, 26 Jul 2024
 13:07:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAPbMC77iDKaJvc_8Qq2SqQ-mnkAJyeeADGhWx-jgUV7KsCi28Q@mail.gmail.com>
In-Reply-To: <CAPbMC77iDKaJvc_8Qq2SqQ-mnkAJyeeADGhWx-jgUV7KsCi28Q@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 26 Jul 2024 22:07:42 +0200
Message-ID: <CACRpkdbaRNigfU_mLqcJJckwFz0+14NqWP_TpYqbONCa6wAH6g@mail.gmail.com>
Subject: Re: [drivers/gpio] Question about `ljca_gpio_config`: misuse of __counted_by
To: Haoyu Li <lihaoyu499@gmail.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Haoyu,

On Wed, Jul 24, 2024 at 11:12=E2=80=AFAM Haoyu Li <lihaoyu499@gmail.com> wr=
ote:

> Dear Linux Developers for GPIO SUBSYSTEM,
>
> We are curious about the use of `struct ljca_gpio_packet *packet` in the =
function `ljca_gpio_config` (https://elixir.bootlin.com/linux/v6.10/source/=
drivers/gpio/gpio-ljca.c#L80).
> ```
> static int ljca_gpio_config(struct ljca_gpio_dev *ljca_gpio, u8 gpio_id,
>    u8 config)
> {
> struct ljca_gpio_packet *packet =3D
> (struct ljca_gpio_packet *)ljca_gpio->obuf;
> int ret;
>
> mutex_lock(&ljca_gpio->trans_lock);
> packet->item[0].index =3D gpio_id;
> packet->item[0].value =3D config | ljca_gpio->connect_mode[gpio_id];
> packet->num =3D 1;
>
> ret =3D ljca_transfer(ljca_gpio->ljca, LJCA_GPIO_CONFIG, (u8 *)packet,
>    struct_size(packet, item, packet->num), NULL, 0);
> mutex_unlock(&ljca_gpio->trans_lock);
>
> return ret < 0 ? ret : 0;
> }
> ```
> The definition of `struct ljca_gpio_packet` is at https://elixir.bootlin.=
com/linux/v6.10/source/drivers/gpio/gpio-ljca.c#L53.
> ```
> struct ljca_gpio_packet {
> u8 num;
> struct ljca_gpio_op item[] __counted_by(num);
> } __packed;
> ```
>
> Our question is: The `item` member of `struct ljca_gpio_packet` is annota=
ted with "__counted_by". Only if we set `packet->num =3D 1` before accessin=
g `packet->item[0]`, the flexible member `item` can be properly bounds-chec=
ked at run-time when enabling CONFIG_UBSAN_BOUNDS and CONFIG_FORTIFY_SOURCE=
. Or there will be a warning from each access prior to the initialization b=
ecause the number of elements is zero.
> So we think relocating `packet->num =3D 1` before accessing `packet->item=
[0]` is needed.
>
> Here is a fix example of a similar situation : https://lore.kernel.org/st=
able/20240613113225.898955993@linuxfoundation.org/.
>
> Please kindly correct us if we missed any key information. Looking forwar=
d to your response!

This is a Gustavo AR Silvia question, so let's loop him in.
(I think you're right, and we should make a patch.)

Yours,
Linus Walleij

