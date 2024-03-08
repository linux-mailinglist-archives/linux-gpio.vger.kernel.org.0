Return-Path: <linux-gpio+bounces-4212-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8082A8760FA
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Mar 2024 10:33:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B638728456B
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Mar 2024 09:33:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1216053392;
	Fri,  8 Mar 2024 09:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="DvJMlbwW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7CD53388
	for <linux-gpio@vger.kernel.org>; Fri,  8 Mar 2024 09:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709890388; cv=none; b=JeVInUs4mUT8FFYIjpAJQtzGSnE5FYMYdiSBbHv63jGEXmgaFNbUixtv+c5sFPZNDH4dMu4VLVyjFleclpvnPpIMRl5EYMZRgFirxkPX47QBYGhtIqmpHquCsT34xkc5EJLNecLgy786UdW0zaKCtz/4CZ/hIHUMeKvjamb+zy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709890388; c=relaxed/simple;
	bh=G5c+9IWvn6ieMhvBUbYIVPZPnNSgCyJnNf7/vpLBkgU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=poQz/DpjPQRATzXbY6FoSJZhgOOspSHvgpx5/JEnwiafIeY2+uXRrNluWB92kpQZCDihOAbHdHzlL8KxcH9fC6/R//b+053N2XutsynHFNP4Gj4Ilj7aTiYCKUHdSdh7CrDfj4+YlHWD17b7odPw8e3gIzVcPZdetVueR1IUgdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=DvJMlbwW; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-4d34dadcb23so534650e0c.1
        for <linux-gpio@vger.kernel.org>; Fri, 08 Mar 2024 01:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1709890386; x=1710495186; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uSPL9R4NEdEb5t9F1k6HdAHD+VzckhslVdvrEVAW9tM=;
        b=DvJMlbwWcoCxcE5wlsunzqOQ0UG23+cOrtow8JR1rNug5SpaI1OJvkMy30DUxvDc+w
         1FmU++KsWw614yvYwD5Uof8NG0jm+MhvD/i3M9T2BqJMIj4IDRc8RLo9HAKf4gwvCw34
         StBZmh4WfMUXF87/oZDrXPL3QjzcpmYsmea0hs6ssGo6s9z1aZtV5MCjIMpTgaPhEIFa
         BmZScbL93bA5opMhUeu4HJCHNyvYu4SKrX5vZJ4zQFpKU2v0nvcSMM1S+nnmPVQrNBOd
         ybTkUfGS2P8QtpHJU3sTxEcgHgj2FfzL6khJ4dQfulLgr3uoJi9rj/SMWap/dHV7o36M
         TDUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709890386; x=1710495186;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uSPL9R4NEdEb5t9F1k6HdAHD+VzckhslVdvrEVAW9tM=;
        b=IVlRq/DFWfLiNPqbtUXfY8MsFOw744Q5KO9o1C/zX3NAbn4+dGS242RLOqjzq3imlY
         GRVIag8wv6stBVVGWgnEhO0lA4uDFO1AWpcnIW34sbGEcMWS/3D6RQSa2Bces+NaA83g
         4muNcrv1p7QyBVCTzL7988f6iJFMnGaSfkLKls0KaSwk4Wfq7tgKWC6gQC8zEHjfZ/EY
         7IE03hWbINLV2m/68ynzy3KaugJZjC5R2M5C710aSkourYVvSgpXnyB4SAWFYJxdi1Kr
         iMcPcPaYNpry8H3zQT1erSyGUixvqZbwcID/GR3zdhcQVsrwYkVhjY4zcD+cY7wOvHwc
         /teA==
X-Gm-Message-State: AOJu0YxIilaKKoPgxMpbOB7LV4/NZNZ8DTXujtT+2JtnbmKK9A0jAKgv
	OAcVCQ1h+UKX3mCZF/OzthbOLNiBdZngiLvu6w05/hYEJg78KvpLwIfYGkBsmSGh4NLt/SzlJpZ
	80d3JNPCmkYCWPQMrX50wr63pU8NJYCi1F4rkEA==
X-Google-Smtp-Source: AGHT+IG+yjLhhIesv+RIZF76RV01Z9AqyXG3WzamQmnvFMO5iJ0EoNbH/PSfpWD7+rmgh9gTocQJiEzC3Ty++qgckBM=
X-Received: by 2002:a1f:1402:0:b0:4d3:3974:657a with SMTP id
 2-20020a1f1402000000b004d33974657amr9398254vku.14.1709890385847; Fri, 08 Mar
 2024 01:33:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240307214317.2914835-1-alexander.sverdlin@gmail.com>
In-Reply-To: <20240307214317.2914835-1-alexander.sverdlin@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 8 Mar 2024 10:32:54 +0100
Message-ID: <CAMRc=Me8J0fd066QaSmDhhc+g54A8m-dWTDmtx14HOPc+d0TYA@mail.gmail.com>
Subject: Re: [PATCH] gpio: sysfs: repair export returning -EPERM on 1st attempt
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: linux-gpio@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 7, 2024 at 10:43=E2=80=AFPM Alexander Sverdlin
<alexander.sverdlin@gmail.com> wrote:
>
> It would make sense to return -EPERM if the bit was already set (already
> used), not if it was cleared. Before this fix pins can only be exported o=
n
> the 2nd attempt:
>
> $ echo 522 > /sys/class/gpio/export
> sh: write error: Operation not permitted
> $ echo 522 > /sys/class/gpio/export
>
> Fixes: 35b545332b80 ("gpio: remove gpio_lock")
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---
>  drivers/gpio/gpiolib-sysfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
> index 67fc09a57f26..6853ecd98bcb 100644
> --- a/drivers/gpio/gpiolib-sysfs.c
> +++ b/drivers/gpio/gpiolib-sysfs.c
> @@ -593,7 +593,7 @@ int gpiod_export(struct gpio_desc *desc, bool directi=
on_may_change)
>         if (!guard.gc)
>                 return -ENODEV;
>
> -       if (!test_and_set_bit(FLAG_EXPORT, &desc->flags))
> +       if (test_and_set_bit(FLAG_EXPORT, &desc->flags))
>                 return -EPERM;
>
>         gdev =3D desc->gdev;
> --
> 2.43.2
>

That's of course correct. Applied.

Bart

