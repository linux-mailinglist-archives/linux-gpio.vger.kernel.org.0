Return-Path: <linux-gpio+bounces-1030-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F2A8059B4
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Dec 2023 17:16:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73BA41C211CF
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Dec 2023 16:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 846BF60B8A;
	Tue,  5 Dec 2023 16:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WI7e9xZd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EBB6122
	for <linux-gpio@vger.kernel.org>; Tue,  5 Dec 2023 08:16:51 -0800 (PST)
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-5c67c1ad5beso2023593a12.1
        for <linux-gpio@vger.kernel.org>; Tue, 05 Dec 2023 08:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701793010; x=1702397810; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nb6CHM3yfDtGTZBk7fxTwlk032gu1XjkkQ+jCGcfE7Q=;
        b=WI7e9xZd87ef+QkS4MHI6hsVBJfNJ8Y3ofIHJJPAxuVz2qE2y0RG9DHOCfkJQb2Opo
         DI76SJlt1jCmYJJhc/KkU95yaJru5FTyu343GE3ZMOvtqC4Yfm+LYnNrNzXnU00RxAm+
         AQZOeDq4fx9VqCvde1MBcLPCnz5MaAV+ECuVuF6gPbP0yc5qOVEOunfP9iuHQJhlY592
         gsxJiAh4+I+P4HZHyHh27woagOeMUy1qchaqD212Ud1TMV2JCDIiuODWs/AnrYv0gkZe
         cZrULCC7l/JgRevtv0G6uiNICgw9KERszAeEg/ci/2ASS26dKarmcQAg8lzPp91N5+vj
         Gqxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701793010; x=1702397810;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nb6CHM3yfDtGTZBk7fxTwlk032gu1XjkkQ+jCGcfE7Q=;
        b=DI7Nt+b9hyF4oxv9gE9K3HQNjQ1XmR4v8Ufh8K//Ed5Pgclki/I1jRjfks6CHEQqvg
         KoN3iW41n1lyqXwpoHAOH+ht7vO4uJO16bjKG8qPBzyVSYvIFkbsNLEuJoh6tC5xSJ5d
         wZENiqbd6dvFD46sKcCVJ9oAotEsCK3p0m1mf9qSlbF6WAeKp+d2ch/LFjM3LOrw0T+j
         ZhoznZNDO/+LuN06kNS5E4ok/u9mAezkiHL5WDqxJJ+ZwGsUdsa3FQuotabUWgBw2BXW
         5zV8PdCm8DeRjAZy6HF9e++akklFWxxn0njzEEyCBfQnzjN2+s1CZFz7TaiYTIkLqBIo
         WqZg==
X-Gm-Message-State: AOJu0YwvduepfeAHenpcMGIU2PHJY5S0I6LaAhYW6D0cwNtqp4BDYkgb
	0dU7IH9iIauWZdBuDe61oBZzS8SqUncmcQehw7oNgpvfULs=
X-Google-Smtp-Source: AGHT+IEJg56YgzYeP7RhEtPnLkWMtHALIHtv4vBOqYOyvpURk+JFcASG0Wo34/0uVj0S9tPsBtDfGdGr/6zvIGZcwBg=
X-Received: by 2002:a17:90b:17d2:b0:286:8f8f:5e3d with SMTP id
 me18-20020a17090b17d200b002868f8f5e3dmr1558203pjb.30.1701793010280; Tue, 05
 Dec 2023 08:16:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKm-UmajXOivhNzy7hbL9-Afrk77uk=oSgCHQAL11jFOqE2FtA@mail.gmail.com>
In-Reply-To: <CAKm-UmajXOivhNzy7hbL9-Afrk77uk=oSgCHQAL11jFOqE2FtA@mail.gmail.com>
From: =?UTF-8?Q?S=C3=A9bastien_Chaumat?= <euidzero@gmail.com>
Date: Tue, 5 Dec 2023 17:16:39 +0100
Message-ID: <CAKm-Umbh1x=x+uk6CRVGJnqJg+dBEaOgkN1tCdi=Y+HVA9eNiw@mail.gmail.com>
Subject: Re: [BUG]Xen : amd_gpio AMDI0030:00: failed to enable wake-up interrupt
To: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 5 d=C3=A9c. 2023 =C3=A0 13:03, S=C3=A9bastien Chaumat <euidzero@gma=
il.com> a =C3=A9crit :

>  Trying to get Framework Laptop 13 AMD with xen,  the touchpad is not
> working because (in reverse order) :
>
>  no events received from evtest while device being detected
>  i2c_hid_acpi i2c-FRMXXXXXXX: failed to reset device: -61
>  amd_gpio AMDI0030:00: failed to enable wake-up interrupt
>
>  Tested with xen 4.18.0 and kernel 6.6.4.
>   We need to get the kernel to be more verbose about the issue to
> understand what is happening.

booting kernel with "dyndbg=3Dfile drivers/gpio/* +p"

[    1.997798] i2c_designware AMDI0010:00: using ACPI '\_SB.I2CA' for
'scl' GPIO lookup
[    1.997804] acpi AMDI0010:00: GPIO: looking up scl-gpios
[    1.997806] acpi AMDI0010:00: GPIO: looking up scl-gpio
[    1.997807] i2c_designware AMDI0010:00: using lookup tables for GPIO loo=
kup
[    1.997809] i2c_designware AMDI0010:00: No GPIO consumer scl found
[    2.007517] i2c_designware AMDI0010:03: using ACPI '\_SB.I2CD' for
'scl' GPIO lookup
[    2.007521] acpi AMDI0010:03: GPIO: looking up scl-gpios
[    2.007523] acpi AMDI0010:03: GPIO: looking up scl-gpio
[    2.007524] i2c_designware AMDI0010:03: using lookup tables for GPIO loo=
kup
[    2.007526] i2c_designware AMDI0010:03: No GPIO consumer scl found
[    2.343905] gpiochip_find_base: found new base at 512
[    2.344408] gpio gpiochip0: Persistence not supported for GPIO 0
[    2.344436] gpio gpiochip0: Persistence not supported for GPIO 61
[    2.344458] gpio gpiochip0: Persistence not supported for GPIO 62
[    2.344480] gpio gpiochip0: Persistence not supported for GPIO 58
[    2.344502] gpio gpiochip0: Persistence not supported for GPIO 59
[    2.344523] gpio gpiochip0: Persistence not supported for GPIO 2
[    2.344546] gpio gpiochip0: Persistence not supported for GPIO 6
[    2.344571] gpio gpiochip0: Persistence not supported for GPIO 54
[    2.344646] gpio gpiochip0: (AMDI0030:00): added GPIO chardev (254:0)
[    2.344648] gpio gpiochip0: registered GPIOs 512 to 767 on AMDI0030:00
[    2.344650] gpio gpiochip0: (AMDI0030:00): created GPIO range
0->255 =3D=3D> AMDI0030:00 PIN 0->255
[    2.357663] acpi MSFT0101:00: GPIO: looking up 0 in _CRS
[    2.376188] mdio_bus fixed-0: using lookup tables for GPIO lookup
[    2.376193] mdio_bus fixed-0: No GPIO consumer reset found
[    2.401459] rtc_cmos 00:01: using ACPI '\_SB.PCI0.LPC0.RTC' for
'wp' GPIO lookup
[    2.401464] acpi PNP0B00:00: GPIO: looking up wp-gpios
[    2.401465] acpi PNP0B00:00: GPIO: looking up wp-gpio
[    2.401467] rtc_cmos 00:01: using lookup tables for GPIO lookup
[    2.401468] rtc_cmos 00:01: No GPIO consumer wp found
[    2.659765] amd_gpio AMDI0030:00: failed to enable wake-up interrupt
[    2.660047] amd_gpio AMDI0030:00: failed to enable wake-up interrupt
[    2.660162] amd_gpio AMDI0030:00: failed to enable wake-up interrupt
[    2.660277] amd_gpio AMDI0030:00: failed to enable wake-up interrupt
[    2.660393] amd_gpio AMDI0030:00: failed to enable wake-up interrupt
[    2.660504] amd_gpio AMDI0030:00: failed to enable wake-up interrupt
[    2.660609] amd_gpio AMDI0030:00: failed to enable wake-up interrupt
[    2.660726] amd_gpio AMDI0030:00: failed to enable wake-up interrupt
[    5.445265] acpi FRMW0004:00: GPIO: looking up 0 in _CRS
[    5.445396] acpi FRMW0005:00: GPIO: looking up 0 in _CRS
[    5.448467] acpi PIXA3854:00: GPIO: looking up 0 in _CRS
[    5.448483] gpio gpiochip0: Persistence not supported for GPIO 84
[    5.452476] gpio gpiochip0: Persistence not supported for GPIO 5
[    5.463304] gpio gpiochip0: Persistence not supported for GPIO 8

