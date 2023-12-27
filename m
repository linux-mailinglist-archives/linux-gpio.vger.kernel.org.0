Return-Path: <linux-gpio+bounces-1869-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7161F81EF97
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Dec 2023 15:52:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D2EF1F213FA
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Dec 2023 14:52:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECFD14503C;
	Wed, 27 Dec 2023 14:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bpXkj2jw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A39C45947
	for <linux-gpio@vger.kernel.org>; Wed, 27 Dec 2023 14:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-7cc65a7143dso868181241.3
        for <linux-gpio@vger.kernel.org>; Wed, 27 Dec 2023 06:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1703688765; x=1704293565; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nD8e1CdpebY37eIukBJ2i1jsWTXkJgQTifus7FLNfqs=;
        b=bpXkj2jwLif3eFZMo88XN4/MC/KsdgZcy0QaXtwMAFpj9kplh4kmQe78beT4fbQoQJ
         YP3L02LvbJhHcFed5chYyyLwOguIS0buD6zXxD2XZgStGS6+HszueDXKZw+E2AEHdYee
         NTfmNiIRlY/QRyW/09YFEiJkOUYMgWoY6j7a0NNKT42iA4unn5XpN2y30QekCr8T4R1m
         qdD5vhjTlBWbTON8wYFdOatx/ioq3s0ulFXwuo7x64O6KJScd9PnYONqzo9rdmNvmZiu
         Bj+wjinKNjUQUyivFvuPzLFUGoi5UnNW/DbIzvaFdyyqQHp8nrXBguoJYLijJxt9vEOV
         aRKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703688765; x=1704293565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nD8e1CdpebY37eIukBJ2i1jsWTXkJgQTifus7FLNfqs=;
        b=AvjMjsQwY9MnrX6eUbrOpuxgJNQlw9m6HnXUPKAzlUbLaopevSBBltuKwfUdPZY1cV
         XHCUcBIhFo38VXMAy5Ojc22Isb2fm4Ubh4OdY7LJQRiQ7Wc/en1/4VGgu0A5VyS2ZIcr
         PoBFHQRM7i0tL1+A5/Nk3dO0Y8EFcIoDRviMJ8UxmudZCm4hs4FTpbKexU8wy1o6DFCz
         hUNXJRH5BZJwqxVI34HD6JNz+MLW8suM1MDTVLZS5kj8SRE5RzeyDAEAAj+eGDbByHBh
         Zugu2OvYD1lciOXN5Cs+seqk3v3S+fnHlTm5zz6V3zWEzRh5wUYWVglID6rP2vaRNe9/
         9gyQ==
X-Gm-Message-State: AOJu0YzckUhKiMuYRXJei6GeMJICwv88M42dZ1OrliZ7vwy9lyMREp6I
	zr/J2xQqxRxMzfG2OBlvz84FsYqNtp2tCrzTPhMHBmaLfqS2Xw==
X-Google-Smtp-Source: AGHT+IHVOzGzMP1hxydPmKWb0O88z9baoC9mI9U03wTMP0dkeay8FoRs5TGqVM00Vc5LOAVbFReETVEFcvIaEpCvz5c=
X-Received: by 2002:a05:6122:3296:b0:4b6:af71:1af3 with SMTP id
 cj22-20020a056122329600b004b6af711af3mr2866069vkb.11.1703688765186; Wed, 27
 Dec 2023 06:52:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231222141952.16254-1-brgl@bgdev.pl>
In-Reply-To: <20231222141952.16254-1-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 27 Dec 2023 15:52:34 +0100
Message-ID: <CAMRc=MfrvGWx-PVtNcQ77jE3zR7gNy0=mwp9745ComK4xFxfdw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: split out the uAPI into a new section
To: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 22, 2023 at 3:19=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Kent Gibson is the author of the character device uAPI v2 and should be
> Cc'ed on all patches aimed for it. Unfortunately this is not the case as
> he's not listed in MAINTAINERS. Split the uAPI files into their own
> section and make Kent the reviewer.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  MAINTAINERS | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9104430e148e..2867da6e233d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9006,8 +9006,6 @@ R:        Andy Shevchenko <andy@kernel.org>
>  L:     linux-gpio@vger.kernel.org
>  S:     Maintained
>  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git
> -F:     Documentation/ABI/obsolete/sysfs-gpio
> -F:     Documentation/ABI/testing/gpio-cdev
>  F:     Documentation/admin-guide/gpio/
>  F:     Documentation/devicetree/bindings/gpio/
>  F:     Documentation/driver-api/gpio/
> @@ -9016,6 +9014,17 @@ F:       include/dt-bindings/gpio/
>  F:     include/linux/gpio.h
>  F:     include/linux/gpio/
>  F:     include/linux/of_gpio.h
> +
> +GPIO UAPI
> +M:     Linus Walleij <linus.walleij@linaro.org>
> +M:     Bartosz Golaszewski <brgl@bgdev.pl>
> +R:     Kent Gibson <warthog618@gmail.com>
> +L:     linux-gpio@vger.kernel.org
> +S:     Maintained
> +T:     git git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git
> +F:     Documentation/ABI/obsolete/sysfs-gpio
> +F:     Documentation/ABI/testing/gpio-cdev
> +F:     drivers/gpio/gpiolib-cdev.c
>  F:     include/uapi/linux/gpio.h
>  F:     tools/gpio/
>
> --
> 2.40.1
>

Applied with Linus dropped from maintainers of GPIO uAPI.

Bart

