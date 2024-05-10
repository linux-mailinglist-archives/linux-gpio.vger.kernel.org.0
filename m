Return-Path: <linux-gpio+bounces-6293-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C21B58C25F6
	for <lists+linux-gpio@lfdr.de>; Fri, 10 May 2024 15:42:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76E1D1F26C91
	for <lists+linux-gpio@lfdr.de>; Fri, 10 May 2024 13:42:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33ABE12C481;
	Fri, 10 May 2024 13:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KPNOwr3K"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73923481C0;
	Fri, 10 May 2024 13:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715348521; cv=none; b=TjtaHY2oKkyfoUOBMLQlA0mswyL98Ca7ynLQRXwTX8UjhYAEZyQXTWxE4zpSj1BkSjkBDlahWH0x8ktrXoxb3WPd9V3DKrnWQh9+2PezGbYQQwVCUTS2Ar9GPHROrizivSzpGQqgZ9LOf6cR5Glw6VKxB1le/STk/r0+odqLD7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715348521; c=relaxed/simple;
	bh=pBA2VuZPGCdMbkNS+zA1XX9ZLFk/dSZGYiAwo8hO2xo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m/yOzBDTE4p5vMXJYNM/jSR89Lw1mNfq/MxHqE1SPMcLBFDW+FCOVXzR8GxgcemkEOBuMQteFHm323gb5Xl7vlawObVFoE7Y9FYOmg/Ck4R64I2xzD0PBOhDCxRKh5bRAw38iHXvP0fSnSfPL4DCMvmhQwnL0ufbM9jOMYCwsag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KPNOwr3K; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a59c448b44aso535882866b.2;
        Fri, 10 May 2024 06:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715348518; x=1715953318; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IwdlNVwzS9nRsciNK1J/Ssg7pbcnDPO0oUNGNSAw7r4=;
        b=KPNOwr3KZci37JuWcLK80+hb0ROTbl8ts8wnefSSoQR8x7mk/YlC1zsrhpXDkJE9jk
         SFjvvUg4sCj1lrBYa6HyN50+qGr/LYV8Z9S/C6AxfBZoZuGrB4LGdrKCg3heFdAFXjff
         ktgudQpsP8O+Z1Evo1641fqgAU5BeEioI+0u988NdOSBaGfp8Qe9azUjgHWbVmNVZLxE
         HCkvRlWEeR4bZu2YZdS2OVxImqGjdusUdhbx1+Ihiil+zx5FkTLEOGIVFllDO1LvJLN0
         OCj0CcsfIG3kq+Uq1rSxPO62ZUCt+QLk6UGk8Oa9vOZ0C6c2D7WVxNfVeGOz47X2p032
         ekfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715348518; x=1715953318;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IwdlNVwzS9nRsciNK1J/Ssg7pbcnDPO0oUNGNSAw7r4=;
        b=IQDBcj40jSHMY7QnSyQaAVuzpKbR7pZ1fw1Y8UuDsMKlG679hSrYcPL2gAB+WahEqj
         znxA1oJZfCBwKKgcAoK0ym22U+JSry082Y7oDu5/WuxJO4OLjMrOW1buan5fgFseALFs
         PNE5fNa3kgPPpCib8uLv6rs+UnpFkqXoIpfuLdQ6kurTdjWcnqypVYD2Zy0j1h1RU3Wn
         C2HKqF64/tOqnEvspmV1Se2W8leUiJUDPDQuz014wgOaEhotp2DYV/befTcYazrrcmXz
         oQHDglNHPnKB/5poNLNQTB+jzW9Nk0SNkud0/JYZ5jRgVHD1H8yF/IzJ7DqMs1eHVmUS
         QQBQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1ZyNS5X4MplEsV8s/3+94MVwpAUtR12UFNQ3aIp+HgRYFHy+3xL8Sv+4Rfv5gVJdPM1+FTrcTjc2v06wHYJZNdJ+NSOifviWYSZB3gzesnnVkiUxUNzLjLUj6iWxVcHSyOSRq7HHw/3DR3PUEfCuNQNSOir69KpjK38CvyWjYuwLV6qex
X-Gm-Message-State: AOJu0YyKfOGweuzzHXjeZ76Rs/ZVKjy+MZRjj9yEfTaYHf542aiqa+vk
	pvAz0KEIhiieSoswCfV0yhpWfTF28vGoMAx1b+YLwtwkD2dOmKcoxpet4/EtfaPbLmh5SCQUyGY
	NO2F9Mytim9YNuXrIu+S+U6XkHuk=
X-Google-Smtp-Source: AGHT+IG+GMq/0Zg0LuPNQxtUo2VyGH2fdQnK+X7ITrvdqHHsGXpWTJXWa8taALyVZQ5+t1G/H3kOiV9SITvuZtHcqf8=
X-Received: by 2002:a17:906:17c5:b0:a59:c9ad:bd26 with SMTP id
 a640c23a62f3a-a5a2d54c601mr168138466b.12.1715348517408; Fri, 10 May 2024
 06:41:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240510101819.13551-1-kabel@kernel.org> <20240510101819.13551-3-kabel@kernel.org>
In-Reply-To: <20240510101819.13551-3-kabel@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 10 May 2024 16:41:20 +0300
Message-ID: <CAHp75VfdSqRbhek3eCPtdPtrv2FJyhpG0XvKFMfT9yrDsCjY2Q@mail.gmail.com>
Subject: Re: [PATCH v10 2/9] platform: cznic: Add preliminary support for
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

On Fri, May 10, 2024 at 1:18=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.org>=
 wrote:
>
> Add the basic skeleton for a new platform driver for the microcontroller
> found on the Turris Omnia board.

...

> +       err =3D omnia_cmd_read(client, cmd, &reply, sizeof(reply));
> +       if (!err)
> +               *dst =3D le32_to_cpu(reply);
> +
> +       return err;

Introduced here and "fixed" in the next patch. Something wrong with
rebasing / squashing?

You will need a v11 anyway. And you have now much more time for it,
don't forget to update the kernel version and date in the ABI
documentation.

--=20
With Best Regards,
Andy Shevchenko

