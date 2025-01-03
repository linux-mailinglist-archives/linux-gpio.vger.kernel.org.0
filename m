Return-Path: <linux-gpio+bounces-14458-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3BAA009CA
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 14:15:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CCA41188442D
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 13:15:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E05C1FA17D;
	Fri,  3 Jan 2025 13:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="sPxcmcPM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D8D1F8EF3
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jan 2025 13:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735910138; cv=none; b=NVZuaeUWRbubJcPVaZTj6bOKHGtxVuSlzGKCwr6A/ZKUXnLO+u22OU1zirSHd8Gs+MbIhxe7ammwzDw2UB07QQRwVgefRwWudSNg+trb4rL49qbQZU3TyJMmbloyyVEbk5bklAEQHyKwhcU/PGGvCAK8zzMYy3mwdBf2V1DDgqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735910138; c=relaxed/simple;
	bh=Dxumu30Ll1YbG6ub+XuEJIRyGDwO1xN6brs/gqQFdPY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qzYYWOH+AcjUIDGW5cPZ1pWvO41Q8TJ+EkzaGIemN0mr+BuegIziaQJzEfkkpyVy2Wuv/JpY6CFkKxCTCR/JIp+DzWjXxlcMjfO+q6rDQ5DHE613CGq2gRh6J+LKsUYNZ8aiMyM82S3KsjbcqfLHkzx/UxV5z4U6RH8K1JUlzmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=sPxcmcPM; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-304d760f12aso12735911fa.2
        for <linux-gpio@vger.kernel.org>; Fri, 03 Jan 2025 05:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1735910133; x=1736514933; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=syfx9fuDDy0qiH3fjNFJDhX6i6rCazuUw8yCQG/gv+0=;
        b=sPxcmcPMkGRI8jvFAkT9feKk+AE/VhqllzBlKOFEGCvI3uYMdLThRSRTwUtdig5OSD
         0+QdrmBRRUmXIWGiuwV7sk/LxGnmcFvFRCuWGaWMIrvnBDSCRV8vHe69n/ucg4y9Uok0
         7o1S/U3OGZlzjpESyVpbGoFxZ6htX5wiMavoXDRZ68zUeXMy3axAibik1frxGOV6X5zt
         t8dQXlfuDMBlv1Chnp3GYJ7pkNMsMb8xVEObGIECUDyC2uVZrDfJ31S4asqRf1clBQKD
         suxFBj/kgESd1zffm5pOJkDzOtPaVIwgF+aCM25acdQwMrrYPwE2R4KvQmHQPVmdZI4u
         D8pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735910133; x=1736514933;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=syfx9fuDDy0qiH3fjNFJDhX6i6rCazuUw8yCQG/gv+0=;
        b=VDczFBmKno7kHFuN8A9/ol4k++61jSCOM9DVFHlaNeu/oXxgKpkb2gjXq6RhdNwH+x
         CaQDAtXp8j1X9C5Sd/xx1XzcS8fNnSSzBETBClfpaxNj2goTkubhllvZCzwhlXqIOaLB
         CyI9GVKw7GctyYihHhNchIA76VsrmFYnjpfCc92Z+CG14iNP/7QvFAQ90E/4o/AZ+taW
         uqaZQmhRs+KsxsWKlRc+bjgBpFw3qxusKWxxqeGRmKFs7w+SRoWULDQRJurw4riTbk2X
         wht33Pb9InXieBOfn5QvQJo1LMYzhboddtCSfovgM8nNimvRWZyIZQJ5fc/XYHCG3iWb
         GrUw==
X-Gm-Message-State: AOJu0Yx0IuHX/Bfv2gGzbiYE2My2C+z3JYG36Wya0wg7ijUMQxH3pymr
	0EslDVm+mM6cnYQCySiH16s+FztPj9KGxtZU9UoPSe9taQJIB9/IZkFPxsYs46PAsRT6dwmghg6
	k0VHEFRdaVxERj+9lbMrtlNYhKAhPTw8obXjAMw==
X-Gm-Gg: ASbGncslzUH/CuvdmnSEVqaMb3frbdg1WxDKWTFHgNFFUqupAPhgj9MFUc30BDCHJ8H
	gHPnonMx8vgjOHrah6LC7kvtWa4rptH2ts96CfbnQOGFYN256iQMRx7y6Xu9x4lBncRWAWg==
X-Google-Smtp-Source: AGHT+IGG/N3TlTte2VIK2IUBmw5GcWSRNo4hb3kBT9rMcVaiHIWnq+s4+PuQo2BrrQqjkUxsfbbDaytO2Bj64B42vTU=
X-Received: by 2002:a05:6512:3a90:b0:540:1ea7:44db with SMTP id
 2adb3069b0e04-5422952d8ffmr16190906e87.4.1735910128371; Fri, 03 Jan 2025
 05:15:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250103030402.81954-1-koichiro.den@canonical.com> <20250103030402.81954-2-koichiro.den@canonical.com>
In-Reply-To: <20250103030402.81954-2-koichiro.den@canonical.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 3 Jan 2025 14:15:17 +0100
Message-ID: <CAMRc=MejjiFin4hU_-8Cnzs03gDsd18cM6ahoSsZVQDeFSZd6g@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] gpio: virtuser: fix missing lookup table cleanups
To: Koichiro Den <koichiro.den@canonical.com>
Cc: linux-gpio@vger.kernel.org, linus.walleij@linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 3, 2025 at 4:04=E2=80=AFAM Koichiro Den <koichiro.den@canonical=
.com> wrote:
>
> When a virtuser device is created via configfs and the probe fails due
> to an incorrect lookup table, the table is not removed. This prevents
> subsequent probe attempts from succeeding, even if the issue is
> corrected, unless the device is released. Additionally, cleanup is also
> needed in the less likely case of platform_device_register_full()
> failure.
>
> Ensure the lookup table is removed whenever the device activation fails.
>
> Fixes: 91581c4b3f29 ("gpio: virtuser: new virtual testing driver for the =
GPIO API")
> Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
> ---
>  drivers/gpio/gpio-virtuser.c | 25 ++++++++++++++++---------
>  1 file changed, 16 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpio/gpio-virtuser.c b/drivers/gpio/gpio-virtuser.c
> index 91b6352c957c..ec5abfebca3d 100644
> --- a/drivers/gpio/gpio-virtuser.c
> +++ b/drivers/gpio/gpio-virtuser.c
> @@ -1487,10 +1487,8 @@ gpio_virtuser_device_activate(struct gpio_virtuser=
_device *dev)
>         pdevinfo.fwnode =3D swnode;
>
>         ret =3D gpio_virtuser_make_lookup_table(dev);
> -       if (ret) {
> -               fwnode_remove_software_node(swnode);
> -               return ret;
> -       }
> +       if (ret)
> +               goto err_remove_swnode;
>
>         reinit_completion(&dev->probe_completion);
>         dev->driver_bound =3D false;
> @@ -1498,23 +1496,32 @@ gpio_virtuser_device_activate(struct gpio_virtuse=
r_device *dev)
>
>         pdev =3D platform_device_register_full(&pdevinfo);
>         if (IS_ERR(pdev)) {
> +               ret =3D PTR_ERR(pdev);
>                 bus_unregister_notifier(&platform_bus_type, &dev->bus_not=
ifier);
> -               fwnode_remove_software_node(swnode);
> -               return PTR_ERR(pdev);
> +               goto err_remove_lookup_table;
>         }
>
>         wait_for_completion(&dev->probe_completion);
>         bus_unregister_notifier(&platform_bus_type, &dev->bus_notifier);
>
>         if (!dev->driver_bound) {
> -               platform_device_unregister(pdev);
> -               fwnode_remove_software_node(swnode);
> -               return -ENXIO;
> +               ret =3D -ENXIO;
> +               goto err_unregister_pdev;
>         }
>
>         dev->pdev =3D pdev;
>
>         return 0;
> +
> +err_unregister_pdev:
> +       platform_device_unregister(pdev);
> +err_remove_lookup_table:
> +       gpiod_remove_lookup_table(dev->lookup_table);
> +       kfree(dev->lookup_table);

Just one more thing: now we open-code this but the actual allocation
and adding of the table happens in a dedicated function. Can you
package these calls into their own function
(gpio_virtuser_remove_lookup_table() maybe?) and use it here and in
gpio_virtuser_device_deactivate()?

Bart

> +err_remove_swnode:
> +       fwnode_remove_software_node(swnode);
> +
> +       return ret;
>  }
>
>  static void
> --
> 2.43.0
>

