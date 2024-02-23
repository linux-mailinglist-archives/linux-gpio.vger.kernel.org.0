Return-Path: <linux-gpio+bounces-3709-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F9E86118A
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Feb 2024 13:34:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 949671C22F21
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Feb 2024 12:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE4707AE6E;
	Fri, 23 Feb 2024 12:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="duqXFttV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5775C12B6B
	for <linux-gpio@vger.kernel.org>; Fri, 23 Feb 2024 12:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708691684; cv=none; b=tFzvzCFr9i4VtBE5Vh6H+Y29uqr33+4VsHmt4SdHY3sKVz6WY+PE5NipSa+YmLDR3rmM8MkpFXebj29uOmjDzc5mX7errA1NEGjxu/h3Jzf6sNJ6z/QvKmOmp1eWwTwrjLeJe3mDnx7+JNgO6Wc+8aAiGKIhPIzTs9JuyjpOQ0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708691684; c=relaxed/simple;
	bh=zhjRfVpkoxLXxvUubdOEZ58ErNvPOno2Axh+xYl/pgw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JI+dWKAd4neN7N6zBA4V7Fxu8sxRNUyIb08LqygCLNDNjW+/gzmo/zhKpruKSF7tb2ILPdNMIzYvzdkjMLnAoNXthytj3MNrQ4UlS9I8OCdPTLo+rgpb89bCseib4m/mewUHWA70VNdf5JQzaDUAhJYx5kFaG5q45eoegwjWDPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=duqXFttV; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-7d6a85586e3so449710241.2
        for <linux-gpio@vger.kernel.org>; Fri, 23 Feb 2024 04:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1708691682; x=1709296482; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WNe+xdbuP+XQVL+r99jidBW6ZKxShOp89bgusTStUEw=;
        b=duqXFttVRi7mAjfZIet2WuQXB5XTNBCJT1n8ZMNN//gHqzl0HydlleDWMdMFI8WOcu
         egVFROgi73LbFBVUEStTRKlKkSMWseJvpdyRKAXClKSaUmCCx2srlbNQ3Q1nWQRXnM8C
         Mwp7Cl5Y9Agw1aZFipHqaAPw6UVgXON0wN0P6w3rqmvXMFLn8McdUnJ0qDP9HC5yYq1P
         OW66qRmRK8XIghvUovVxq2Lgxqu4bcgOfGylRMNpHYfB8ueAzG1JKwyiOZp6lohy4aME
         it5t2Cr708YjeWsvRUCfOhWf4j1PsMa8Sm4Em52OSzdE/Eiz3ioPOFTOLE2C44pIUerl
         cyBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708691682; x=1709296482;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WNe+xdbuP+XQVL+r99jidBW6ZKxShOp89bgusTStUEw=;
        b=NrgxTtduLVzTP6Oto/yY8XLwcMrBRMDDb5G4KKq4v+jA0G/PwLEgJ+nTA3RIIkGnLm
         VytffZBIGYBWaeIrrrfd0mQv+q6MUpeR8WJTEcDFxy/OS/7G81whbzRYvoeDPeaTlvku
         waRB7eU+G8lFZBfrWIt4iXNZ0Z/JsfWPCpyhU/Es/8BGlPYbSWFs5rH0rUUDkrFElygi
         Zp3CtzGhODTrgGcQ/vZmHTWk0dWwbRWBkp1x96M+GmcJkWGjPw2FXfhxnanZnQVQCQ7U
         DKp99DAPrMIzLrAcJulGjOHvulM0L3D9FO+gwOqbjiUuIPTfw0pNhFaPkt7sNne2B7JH
         22GA==
X-Gm-Message-State: AOJu0YxeNTFaT8GeMx4/8520cQhPRtltxvq5+OHrlV1jKLodbqF6DAIh
	nMru+CtcGsMsMOCENQcamVQCBjSBXqFoTiP65akdxqoDNvCCuZiZ/gQgxxfSaKq1nQIwODr09kO
	oCMl4IohtiVBlU8790HQ2cyvJBeUOnNLaMtP5kAUmGp4g1+tt
X-Google-Smtp-Source: AGHT+IHQiTZmMiNM0w5NjI6gyMnFY2eO4mN41D+kyCN1AJC/GocX/0tuubU4v2jly1kNifC7Ftx+QhTjPB+y5DVE7Jg=
X-Received: by 2002:a1f:de82:0:b0:4c8:9db3:3b60 with SMTP id
 v124-20020a1fde82000000b004c89db33b60mr1697184vkg.6.1708691682205; Fri, 23
 Feb 2024 04:34:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240223123028.288038-1-brgl@bgdev.pl>
In-Reply-To: <20240223123028.288038-1-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 23 Feb 2024 13:34:31 +0100
Message-ID: <CAMRc=MdQWAQHzM5ei=-pfghjSRzRFYyxHVXcLgXvjWOmRVLjqw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: don't put the reference to GPIO device in pinctrl_pins_show()
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, David Arcari <darcari@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 23, 2024 at 1:30=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The call to gpiod_to_gpio_device() does not increase the reference count
> of the GPIO device struct so it must not be decreased. Remove the buggy
> __free() decorator.
>
> Reported-by: David Arcari <darcari@redhat.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/pinctrl/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
> index ee56856cb80c..bbcdece83bf4 100644
> --- a/drivers/pinctrl/core.c
> +++ b/drivers/pinctrl/core.c
> @@ -1644,7 +1644,7 @@ static int pinctrl_pins_show(struct seq_file *s, vo=
id *what)
>         const struct pinctrl_ops *ops =3D pctldev->desc->pctlops;
>         unsigned int i, pin;
>  #ifdef CONFIG_GPIOLIB
> -       struct gpio_device *gdev __free(gpio_device_put) =3D NULL;
> +       struct gpio_device *gdev =3D NULL;
>         struct pinctrl_gpio_range *range;
>         int gpio_num;
>  #endif
> --
> 2.40.1
>

Linus,

Disregard this one, it had no Fixes tag but I didn't press Ctrl-c in time.

Bart

