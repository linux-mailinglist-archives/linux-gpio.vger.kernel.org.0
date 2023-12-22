Return-Path: <linux-gpio+bounces-1829-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD4281CDB8
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Dec 2023 18:42:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B7121C21D47
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Dec 2023 17:42:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3114828E01;
	Fri, 22 Dec 2023 17:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VpSe0/Jd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D682C186
	for <linux-gpio@vger.kernel.org>; Fri, 22 Dec 2023 17:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-da7ea62e76cso2074618276.3
        for <linux-gpio@vger.kernel.org>; Fri, 22 Dec 2023 09:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703266943; x=1703871743; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sORYQjvjhn91mhHWmml7PbQMB+VcO/Ox7jN+qS08qmM=;
        b=VpSe0/Jd5nXGG62u0Ae6fVsFugDUcoVPeh+s9yLQo6l4ZbeXQlFdwPQPvOQ8Hlr8Kt
         5OetozNsCSQUUHHpnZ1uy4NQpPGqxDrRtV42ATp3H5JpDebOvjvZLe++6m0zqAdL4RJ5
         YSXCpbblvH0Sj/P/Vt+YnoujtyKDRvd/1blj6by9nyatK2uhfIfJKqBuoNVOEKUGvwh1
         zHjBS+l/sWwVIUCyPJhhZNbGG3c0s6c6H/FZJOowldLDuiBzeCqogOC2zHVfYHP4ynE7
         rpLvnFfjOb6ZXXmun2q5YjkhO8GuQUwla3uWY7c58T8kqw1mAWeEsXhcCj+CE5uDVVAs
         OSfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703266943; x=1703871743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sORYQjvjhn91mhHWmml7PbQMB+VcO/Ox7jN+qS08qmM=;
        b=hKVG0/t38C7B1mzEn4Xy+HvkartFrtaHoPGxgo6En3Wy2YyfQ+SoT8PJ/U8LhckkND
         3G5P/DIKH+fgGWL28uDdUVC5GkaWPA/VbTKDUbNjAN7yR+g1vLelv7Ox1m4FGkrsgb8H
         Cm3RZVBKYE99pVV8b0IFZmPLBlys75RLlviIuoX4Uh/Pn5jqcvT76aeIqBMdQFkoxuzU
         a91mbNWr3+MPUW4IYBOaryOz4jOBTFMmhV3VAndREZqayWT3WbeR8kfZHOnV354JQfjB
         E4/cmO3Sf9gzKfgu1oLVh2dmkqF1COX2KOexoSRtgYJvLZ9MwKmWFd74kkuZ3bP3Ym5l
         RtiQ==
X-Gm-Message-State: AOJu0YxxRjLAJjc8UaLiojzp2kxCUiY60MpaH/CjPykgh6MBeiHgKTyx
	M6/H1ic2iId2A9uULGVGXk4kbgNkVZywSWQQeehvsFntfYcX0A==
X-Google-Smtp-Source: AGHT+IEPyD9jGVm07hqjtuuMcVr/kIdFIZwi5RVJ0LxxpraRGb6Srxhqt/JNYhC0I9XOqK9ADOwhPpHrjOa2o3mQ16g=
X-Received: by 2002:a25:830f:0:b0:dbd:5baa:366d with SMTP id
 s15-20020a25830f000000b00dbd5baa366dmr1412617ybk.54.1703266943410; Fri, 22
 Dec 2023 09:42:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231222141952.16254-1-brgl@bgdev.pl>
In-Reply-To: <20231222141952.16254-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 22 Dec 2023 18:42:12 +0100
Message-ID: <CACRpkdb32EpsHMMR2vSQg51NzCVAnEFTXpsWWMvwY0mCVpnXLw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: split out the uAPI into a new section
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Kent Gibson <warthog618@gmail.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 22, 2023 at 3:19=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

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

Uh, I don't know if I'm competent at this point, I think Kent and you
are the proper maintainers of the UAPI.

With me dropped from the UAPI:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

(OK I know I wrote v1 but think of that just makes me feel ashamed
these days wrt where it has gone since in v2.)

Yours,
Linus Walleij

