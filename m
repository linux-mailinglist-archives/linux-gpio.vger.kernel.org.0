Return-Path: <linux-gpio+bounces-4979-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CF100894DEC
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Apr 2024 10:50:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A347282C8F
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Apr 2024 08:50:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A27C56B89;
	Tue,  2 Apr 2024 08:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="feF4YrKc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61EC256451
	for <linux-gpio@vger.kernel.org>; Tue,  2 Apr 2024 08:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712047814; cv=none; b=RwKo/5ec74rYNms+BXpFl/lNyvQ1SDUaHZSFqX+QUPFINaYULoIOl+xr86eRUz/wLlP3JY2NdShqVc/NVCc6q6LwBI04LQOO/1mypDnobnFuDad0VnvCDgkxuzNTrVhAOX4WvD3uHSK6Yeorlxi4Y4NrvZbkYSMrQBbdT5ZzUTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712047814; c=relaxed/simple;
	bh=b2/5wE1yEwkP0HttKjeaTzoQ1ndvbDbH7ChWswL5hUo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jwbq0p+wH+dYWG5yjLbY/FfWC0saR2Hpk3f4XC4NmCbhPFFcohkJtq40ZCf6Z11D3/LgghP8VTPNt/OQzeVHKSeLtC8byNpk5WGpWN5ZMLuujJYcO3MRj3fjmRYgktB/JIVO7oCck8SfkZ7JjG6z7sV1p0opyzmoyJ0QjESppmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=feF4YrKc; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-515d55ab035so1757762e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 02 Apr 2024 01:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1712047811; x=1712652611; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=beOpGT1BPMzUzerIhx34u+wlWdi9LklhjtlLJFBuyHE=;
        b=feF4YrKcG0jVD59pgWUzBhUafVjsSW7ppfJfR+zo0Yxdstn9Cs1H6HBSpaYGpspJ+c
         eWKGIOoebto4H+DM71THkG9k/P2AtqXKQMi1o7YNWW6l6Cgy0LRJAYxhV2hsLfhl9bkF
         /o4eLNDDqRxTCNUSqYtXj6ikq80gF/onQLdr1T3k0SqQrbKvFzIcGYdkQ0Sxofy1BnPK
         nZrKd7JXqnakMwIn3D4kypYF/tqQEvMVasJEyGyKHRN54qAbb76F0a40mrz4RyhdOfZg
         TXBQHcD70U0aPE4c0GZpFSh1K+UgupPX8w31h1uKPf6kcem6pCiRJYuiO9gu4iuVFCNn
         6MEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712047811; x=1712652611;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=beOpGT1BPMzUzerIhx34u+wlWdi9LklhjtlLJFBuyHE=;
        b=qwuXZ+oBB/NZEg5vlRR+PsgVuAlY63fuYNqXir3xgyVaJF9aJ1GWnqDKgF8B61uZns
         6X0lKgETLOFPsAX79Cw2dywfx7mnpOmNblhq/XlPs5zfIjpNDewHsp7mZJ+3U0RbdmRf
         BVT9SowttgbW9l1hLjrr5F6aY56shjwaPsWrBCqlDYhx9CDBMq/xRLYHDhEMcwuHMXFM
         x4ATLcYUlR/hTiOuJ167YZSxfIPaKNYSDERN4KDVHnJumPvvsfm5KUnDYHAF9mG4T2N1
         RU9of/0l2v30vCmrkYf4gT3dWKz/ByHzjKLZhGT+c0OPC+bhpiAYgMuxc2fIXtUknMRa
         AHjA==
X-Forwarded-Encrypted: i=1; AJvYcCUMMst2Y7wytrwIlQ0AbUKwJBryNqgdpLpt+ktaUOYKDugCEQj0VmKZbstWdl916MECyEEB1J8BsTzgg7FDEvtD7PsZODy/Kgs/0g==
X-Gm-Message-State: AOJu0YxxJ6DvT75vFA2m8da89GYuM8MRfuTQ7M+rWEoPXhO3qddqQoBo
	jP/IHM9Ow8Os6Uh0qBi8uU3GRzQw1fU0N1w4spthuvGW1qJu4ggIxpuzYlvE4olY8+/mZUkPpmy
	LxmKY+igH1rEC69XXOVmHz1VrGslvR6+Bjg/P2w==
X-Google-Smtp-Source: AGHT+IHe76+zDe7cVdgOiSqvxf958Lt0oux0QPrVSIMhTf7pRv5UnwH+O+W1tzopKaMsZ4SB8smLNO/M63F1ErCoYZk=
X-Received: by 2002:a2e:9e87:0:b0:2d5:122a:4b1f with SMTP id
 f7-20020a2e9e87000000b002d5122a4b1fmr7525841ljk.43.1712047811681; Tue, 02 Apr
 2024 01:50:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325171804.3375280-1-andriy.shevchenko@linux.intel.com> <20240325171804.3375280-3-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240325171804.3375280-3-andriy.shevchenko@linux.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 2 Apr 2024 10:50:00 +0200
Message-ID: <CAMRc=McE-CcRrWpa6Zw_5NGgYJhg+4Ru=uqcaW_WeQ_P25utgA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] gpiolib: use dev_err() when gpiod_configure_flags failed
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 25, 2024 at 6:18=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> When gpio-ranges property was missed to be added in the gpio node,
> using dev_err() to show an error message will helping to locate issues
> easier.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpiolib.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index b98cbf4335e3..5589e085ba25 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -4236,7 +4236,7 @@ struct gpio_desc *gpiod_find_and_request(struct dev=
ice *consumer,
>         ret =3D gpiod_configure_flags(desc, con_id, lookupflags, flags);
>         if (ret < 0) {
>                 gpiod_put(desc);
> -               dev_dbg(consumer, "setup of GPIO %s failed\n", name);
> +               dev_err(consumer, "setup of GPIO %s failed: %d\n", name, =
ret);
>                 return ERR_PTR(ret);
>         }
>
> --
> 2.43.0.rc1.1.gbec44491f096
>

Applied, thanks!

Bart

