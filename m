Return-Path: <linux-gpio+bounces-5140-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F169089AB31
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Apr 2024 15:54:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB91E2821F0
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Apr 2024 13:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AA76374DD;
	Sat,  6 Apr 2024 13:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cTyAHhU0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D013A26ACA
	for <linux-gpio@vger.kernel.org>; Sat,  6 Apr 2024 13:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712411693; cv=none; b=Y6D0k0TJ3jRyeVN4dAydLXUhrcB+07d79Wmtkjat1lYcJnW9ebYjMp8YGVryzpQHpXIuLYnfSAly1z7KGB4zaXy4cpo+e5Flmfiz51jsywXKjR6OnKlKJIG6jyEJu36LZUUHoXHLL1f6ebYEQ5BFZspKn/3H0t4o+76W3jweM28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712411693; c=relaxed/simple;
	bh=JnR2pB2nc1pwYrV5f4Yv1uTuvZrflEHkqfGeoMrFjVk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=inSZBJe3OFzxnSSevdXHgXGSDK7i1xzkGIYBz2g6aWUGFlrQpNIXuKLNoBEJO6BdxtaCMBTi7f1e6c1YTptyZcsE/5sqLCKXHFxQGuzYq14wdyZD6mtXO0+TFM9c/eq4q37dfrUO94Y1FruwD8H8QImnsLNTlbUnIZ0L7GyjY/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cTyAHhU0; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a5199906493so261740166b.1
        for <linux-gpio@vger.kernel.org>; Sat, 06 Apr 2024 06:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712411690; x=1713016490; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7jsWV5s5owewx3aaiFWiMNVnF5go4HkGVhUADKwbzKM=;
        b=cTyAHhU0OJPQpGYYnB1F0HHfdMzS2a8S8klqlylc7xoX0cRE50peEgPoE55EDGUVp+
         DcjK7h5r3Cz+olQqloClTrD+7IacVtJ/K+o51zwS5FGzSz2++V/fxSDZpHjZtOkJzKG6
         0yDGrpDYZrQhUDIwjSop+hrOvTQr83AeIWnBCpo2wyDzoh9hvs1oWK7XvS1FlN/LWZht
         mGwKZrivrALiKKgXucv08UC176iEQzZURkbU8B3vxFBi/9+MBFIFK9xZ5thDIbCaunvW
         SRJM11SSnkWfBJZ4Y9f4X+El8cohsi1RatvzY6nxH7Xcw8m/5lUEzSEas8aaNuXOA2M3
         MTUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712411690; x=1713016490;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7jsWV5s5owewx3aaiFWiMNVnF5go4HkGVhUADKwbzKM=;
        b=UcBNNtHT8fW6kqULyGkFEXcLUDy2ipCOhpdr1QQTMMXBxfUfEsQVT+gLGoWeUEDXHb
         5HDGz8e2Spuomo46g1uXQkIqwaAVIjC6OT687GRkbP6iXjMfqxIoufIYFJoUXaWtlezq
         AyVcltZq3q50jJDzYDHjJYqJ+gsUMoJcuXp7d9SwouOmM0c3TemcKMuCvcw8Pf35qWne
         lLnAGTs6vhcQBghozs12cV7GMSbk6rnrc0J12xne7UHfZmQXsADuiE7IMkRTsoS3M9vJ
         4i8IV56SsnELPp34A2KJKGsffD/Ih2ub+KF/Wu0UkiREoyHeA5sUU4II8oaNLVgGky4L
         dVZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdBA8Y5fDTZ7tWhrjif/arb24myyTgeLrtKeSqyVYvU+kMGZpZ6FeGuEVEdGmbIoQE33FmAZNjTGYigv1r1fmuAR3HhJTHRcZjQw==
X-Gm-Message-State: AOJu0Yzk2oE/SI9mgALda/3kGHG4qz+WEmszrJwSGFsqCFbnnUVXNmhJ
	/iTHtHuZ/ox/bi9z/gR4r/z8yqs+rsbVJYHdHKB4PLQlCKwXoF4JSuVAc/boc94kdWi0Zy/zdSh
	skdueFIAB9hV0bOMZYYI1r7NYViY=
X-Google-Smtp-Source: AGHT+IGNGyxQG4bRUkbZODHC0GBIRFiJeYmTadyuFZVBgeb+HKHwrLV7X/gOu2UO9ur43QyVfIIq4m/EFxVEzG4C5lg=
X-Received: by 2002:a17:906:24d6:b0:a4e:8e96:d43e with SMTP id
 f22-20020a17090624d600b00a4e8e96d43emr2732121ejb.67.1712411690039; Sat, 06
 Apr 2024 06:54:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240406123506.12078-1-hdegoede@redhat.com> <20240406123506.12078-2-hdegoede@redhat.com>
In-Reply-To: <20240406123506.12078-2-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 6 Apr 2024 16:54:13 +0300
Message-ID: <CAHp75Veg+nusW-Wde4Yo-VgUoO4GmSo8Jc91uwJhUoGZyYTDPA@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: baytrail: Add pinconf group for uart3
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 6, 2024 at 3:37=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
>
> GPIO_S0_SC57 / GPIO_S0_SC61 can be muxed to PCU_UART_TXD / PCU_UART_RXD,
> add a pinconf group for this.
>
> On Bay Trail board schematics using these pins as UART these are
> called UART3_TXD / UART3_RXD, name the pinconf group "uart3_grp"
> to be consistent with the schematics.

...

> +       PIN_GROUP("uart3_grp_gpio", byt_score_uart3_pins, 0),

>  static const char * const byt_score_gpio_groups[] =3D {
> -       "uart1_grp_gpio", "uart2_grp_gpio", "pwm0_grp_gpio",
> +       "uart1_grp_gpio", "uart2_grp_gpio", "uart3_grp_gpio", "pwm0_grp_g=
pio",
>         "pwm1_grp_gpio", "ssp0_grp_gpio", "ssp1_grp_gpio", "ssp2_grp_gpio=
",
>         "sio_spi_grp_gpio", "i2c0_grp_gpio", "i2c1_grp_gpio", "i2c2_grp_g=
pio",
>         "i2c3_grp_gpio", "i2c4_grp_gpio", "i2c5_grp_gpio", "i2c6_grp_gpio=
",

The above parts won't be needed if we have automatic _gpio generation.

--=20
With Best Regards,
Andy Shevchenko

