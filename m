Return-Path: <linux-gpio+bounces-19719-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E680AAAD62E
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 08:35:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC87D983F6D
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 06:35:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CB662101BD;
	Wed,  7 May 2025 06:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SdDlUnF2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79FC1E8348;
	Wed,  7 May 2025 06:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746599727; cv=none; b=PqVMo8Za8rggW2JfHU/+tZ21j7mGrUv5DUWwQRsd+9pqPqlfDsU3NNfgBa3AEh648LhXAfsrtR/qRz9wzYArjKve7gF4zRDB1NurNHxiNPPNcOHp8+Alx22ztrOV4rI96ToyuZfzmU0367KpjMqbEncr29TqRLiNLC3FTQWZE0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746599727; c=relaxed/simple;
	bh=nJWIEiMDSYo0Y23NEoKbx/lhi1dCMSONDvq9aB4E4XE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dIwa6OpaKafgHjCO/8HuZyGdWnjJD4GHY/fgpUcz3MxI3gB4wd+dF8eTlyp8W9AHOJGe3JCrkj1w+e4zvxFNZR7ZCKGGOPBkT88+R5q9+oGMbgn4MTn+ICofLTeWRTeNb/9hlDi9/Khqk72zsgJvv1jpGDDnBR5RqRRFMcfHyEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SdDlUnF2; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac2aeada833so129721866b.0;
        Tue, 06 May 2025 23:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746599724; x=1747204524; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4tSnaafv10+hEryjBGo1tIUlQzaLszY16+8UsMNNQYc=;
        b=SdDlUnF2Em8lZrBwYrQwk0lUO2ZMazbdz3h2W9qQwGtMGiNkCUnNRnO8DnS3U3xT8d
         4dXwLETTF4ry3UdZIBWPgtd0FfzuMhUy6/JwWUibN8fdMMkvuvGwE51MVmd0mkQlTpeb
         rPhXawpsGjeTZJVYClQRNKjvvV1d5QFEubKMcQRVodX8yz9F3us9XDPitAgAFwhYps/g
         7V9nmBvxvyoLKLCkCU3bGuupXnYWyiOSXh8225vyu98oxXbouJxZMqCH6mbGDmoiF3Er
         GUGHGvGs/uhUfGgCOgPPlO02HoIxKBVzAdW5urqA+6+P8W91L7FUexDNDqsDdM2VXVSv
         Zl8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746599724; x=1747204524;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4tSnaafv10+hEryjBGo1tIUlQzaLszY16+8UsMNNQYc=;
        b=UGPqkI3hX5LxVZlCcrDDKOyqqwHcPmLOHpj2zzxw/+vkB9XoBH7P/FpYnl0jl0JZV4
         nCs2jaRU7mvDv9jZMzCINiwNgi1OzkKgQgZ/Mpn6+NhbIKr3HeLFOyranLUGoOdhSxyl
         BeJL90/ehZQjIggq8PFcvjZ3KP3/HEaSgJXJ7MqDzffEo+Pr85gbDcbdg+cvsU6DxeyG
         StISlhy41hdqI6LmnWTg0DyMIdCQ+Z+3fFRSRuqr2EELv1ZHnWv2UUS+1TCYJ2yvFAla
         quJrY6c+MkiUuWCV+3ivnrChnvymKcgc/a7w0ZTi5/akfATTcON9TSbjp6EcxE3yrnl5
         yNZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCnAYffHEpicgyk3RNuAiG02IzJ62Dzg5hu7iEVbTjJp6iIXOahPDdkhZjtGWe5zi69w15TuCSyywb@vger.kernel.org, AJvYcCVNzySH2tDiTfD1K9DT9sRLhvF2tkhlrPydB2GYYlyP90GexNmS+dsKDLjt8cqhx9boSloXNvbY3yRBhY5EPnme@vger.kernel.org, AJvYcCWQ8xi/n8Mjsdf8xCIkwBdom9lh7NHQg28XNUGSQQl8oKH7l+yV9XghAMC8GzKWJto0ufJ7MBt0NWUyUFzq@vger.kernel.org
X-Gm-Message-State: AOJu0YybJYD8DUr4Xp/4RTzBb/nrnaWqkoZ5+3aGORSI+G9jQ/WUdrFo
	Sk7saaRviv3ZvAL5g5Qi91PGiPqTKBgDpBmNbVQGSQaLFqDyLG6FkEVS/1MKTjtc1sd3uQg+pmY
	T+mkcj2Ww9EAC/5npfXHIlkMmkXE=
X-Gm-Gg: ASbGncsv2XAJqvmMyOMCVv0pzGyeX/Hgi4Kdw1Prw+PXHXl/ZQ3adf7r+KNlCdpWZng
	Oa1VsiGrgFca5jirgMl4vFxs+8TMkHLDawPaNYDF2MMcGTPakv3vg7/85H31dvHj9b6RSWxrhNq
	fGtveewX63SkzIjaX5fFhbyAR9f2yQwND9
X-Google-Smtp-Source: AGHT+IFKDPg4bjgVdtlfQ09ZDOjRhfaXcZfLpq3bWiNiaGUd1Epqhz4Bm7knxBtyysuJty5+HRROqSzr64gzEsz7snM=
X-Received: by 2002:a17:907:2d0c:b0:aca:c699:8d3c with SMTP id
 a640c23a62f3a-ad1e77d7d7dmr219704166b.2.1746599723758; Tue, 06 May 2025
 23:35:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506-aaeon-up-board-pinctrl-support-v5-0-3906529757d2@bootlin.com>
 <20250506-aaeon-up-board-pinctrl-support-v5-9-3906529757d2@bootlin.com>
In-Reply-To: <20250506-aaeon-up-board-pinctrl-support-v5-9-3906529757d2@bootlin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 7 May 2025 09:34:47 +0300
X-Gm-Features: ATxdqUF_tXrLmm11l2dOZKOeYq9d6KItYisL8xcY_V7Ghp5-2WvAXQvmSSbOl-0
Message-ID: <CAHp75Vdg2LE885+qjpYLkQrdNqaahJc3=Ki7op=6jJUJfJM+sw@mail.gmail.com>
Subject: Re: [PATCH v5 09/12] gpio: aggregator: handle runtime registration of
 gpio_desc in gpiochip_fwd
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 6:21=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:
>
> Add request() callback to check if the GPIO descriptor was well registere=
d
> in the gpiochip_fwd before using it. This is done to handle the case wher=
e
> GPIO descriptor is added at runtime in the forwarder.
>
> If at least one GPIO descriptor was not added before the forwarder
> registration, we assume the forwarder can sleep as if a GPIO is added at
> runtime it may sleep.

...

>  {
>         struct gpiochip_fwd *fwd =3D gpiochip_get_data(chip);
>
> +       /*
> +        * get_direction() is called during gpiochip registration, return=
 input
> +        * direction if there is no descriptor for the line.
> +        */
> +       if (!test_bit(offset, fwd->valid_mask))
> +               return GPIO_LINE_DIRECTION_IN;

Can you remind me why we choose a valid return for invalid line? From
a pure code perspective this should return an error.

>         return gpiod_get_direction(fwd->descs[offset]);
>  }

...

> +       /*
> +        * Some gpio_desc were not registered. They will be registered at=
 runtime
> +        * but we have to suppose they can sleep.

suppose --> assume ?

> +        */
> +       if (!bitmap_full(fwd->valid_mask, chip->ngpio))
> +               chip->can_sleep =3D true;

--=20
With Best Regards,
Andy Shevchenko

