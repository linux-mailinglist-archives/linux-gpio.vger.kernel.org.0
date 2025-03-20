Return-Path: <linux-gpio+bounces-17833-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8054BA6AA5B
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Mar 2025 16:54:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 106EF461125
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Mar 2025 15:54:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EE831EB1A8;
	Thu, 20 Mar 2025 15:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Fe3JAR48"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB6D18641
	for <linux-gpio@vger.kernel.org>; Thu, 20 Mar 2025 15:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742486082; cv=none; b=CCyRNCC/pJL9G0XzASIDgekaFJOcj5wksHURUneAfKBPWdi6iK6QTVV9ZimEjJEotqduDKd2Rk991Z1ExzGXJM/mWPM3OQAUkByhH/bYnUC3PXLRDROVQuur6w9zLqdOLLL/3sFLanVHvsYFUv9PcSH9GIf9pgeZjlX6zGtxgII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742486082; c=relaxed/simple;
	bh=+G8xeVswd64dlgvV6el9zAepddTC6p9H9vdVZhXc1Wg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gBBIdDwWal8kIKOyLjxn2HntqDyvwN5U93szv6mIjtSOvdyKvSuh5ouDBn7M94w4qISMwDeUFwCThxn8tgGi1yJhYKTFs2xJxdd3Bilw7G3iUTzjoGca9UL37zMRTnOfVI1Jx0nsUl4tDcVwt4G1I576BzO2bPZ3FRKPNJChvBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Fe3JAR48; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5439a6179a7so1047453e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 20 Mar 2025 08:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1742486078; x=1743090878; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qMDvJ9Jznrc1kD33TmeQ8/ARj3JPxSTd2xs66KZP2qE=;
        b=Fe3JAR48Qd2aoKWMa5SJJZgS6LVHstFP8hhJSZ23uI/urZYq/eCoWt7y2WL79Tu053
         xnO9S+J+7gKzbKT1Zo+MaeOAlqOE+pxHP/3/hhIu70M2fpRWPDUN5UqFN4TOsJXhF7iG
         MsrrGHKgMI++Zx3eJ7cxo2oMICQADAQZ3DJzovpPTcjcSfrUsrXuLjTKmOAYwn7PPOJZ
         s3bS6BYejGh7pdWjVK4A+Rb/S8NtB7wlUz+IYe6A4alm96e3qO1wder4Xe43904L/Q/G
         txO7HbufL7Sc0jxmGKjYSrb25Oha/4ibAbLh7fcQhrt/6yx9jfbq9Sec/UmnfQd+BogC
         Hivw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742486078; x=1743090878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qMDvJ9Jznrc1kD33TmeQ8/ARj3JPxSTd2xs66KZP2qE=;
        b=QPjcUae0b2fz9zM4c2lkpg264BHggAjb+AkN0P0/GVAvNjPWY0rS42wleZe2RtxNKL
         ZiV/z9cH36OcSBocFJDI8MxlTD01GHMUORj+HzJmwBvgKV52ADV2Ed3Zc2Nq2M4nBnlw
         osrvhYqvfp2I/LLDFmZdsS6c9Pg0f2AXecKe14VLL3W0EJdIROu3mA16IWioBMRlfbzX
         ribx7E3YYnalXPrL0UleXn8BOr70ELQGG1qQUIvmuLAqxbjtPoiO8TdD5jm6hXCd8NmN
         vHEq9cQ/WVwnRpDxqCD0+DP1d+VSozbwGBL9e7W0IaMRzlTV40kL2VDg5pTTP95DywCA
         2QTQ==
X-Gm-Message-State: AOJu0YxDIUOsV+pEileh0dr77spKBLXfHMgCZI2upzlCU4YW38FcWgzM
	iydx9GTSsvnRXNMRYyz7YqEt0h6Fp1DN7TRqx9cQ7l1wxl1YAapdfqMOo2X8XoELE3Xy/3Ofl1B
	ob5l4ydJCgLPpGpQNP1PIdzFcH7SnmKMjaVqy4g==
X-Gm-Gg: ASbGncvkIj/vGgjBcU9TB39ODhGYU4mY9xHVsC+2RW3+vb49s/2YaSjKnPJwjtDvKeU
	J8AvkfGcWWzjakqE8Zofd4JfMoXCDw/xWcLv5Ty9hbCnoWIkqRCrOHzcLsmg2zWq0MUe5C6zmgP
	Yg4ymZ8qIUykKXX2Lion8OdN2rc9ZCfwLzE65XII0jQOKcO835KaNoRn8/I1DPIT6Mslz5
X-Google-Smtp-Source: AGHT+IF+Dw4jJDHhYac2m4xlt6eGAUVFlhWY8ywgAYBxOQs5ZxYS31GdgGmCoHjcswuXQiFt2O3iic8dVwm3QijXkU0=
X-Received: by 2002:a05:6512:3d11:b0:549:965f:5960 with SMTP id
 2adb3069b0e04-54acfadd027mr1698919e87.16.1742486077679; Thu, 20 Mar 2025
 08:54:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250315164123.1855142-1-koichiro.den@canonical.com> <20250315164123.1855142-5-koichiro.den@canonical.com>
In-Reply-To: <20250315164123.1855142-5-koichiro.den@canonical.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 20 Mar 2025 16:54:26 +0100
X-Gm-Features: AQ5f1Jp--exJBMeZ38IUr8lUaIruSRiPIjhRXCBMKUmIrhqWOczKBQE9iCeCJ3k
Message-ID: <CAMRc=MdOSsakJm4H5=cqVzdKDrrMFO2t-wKVWRCU83saozepxQ@mail.gmail.com>
Subject: Re: [PATCH v6 4/9] gpio: aggregator: introduce basic configfs interface
To: Koichiro Den <koichiro.den@canonical.com>
Cc: linux-gpio@vger.kernel.org, geert+renesas@glider.be, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 15, 2025 at 5:41=E2=80=AFPM Koichiro Den <koichiro.den@canonica=
l.com> wrote:
>
> The existing sysfs 'new_device' interface has several limitations:
> * No way to determine when GPIO aggregator creation is complete.
> * No way to retrieve errors when creating a GPIO aggregator.
> * No way to trace a GPIO line of an aggregator back to its
>   corresponding physical device.
> * The 'new_device' echo does not indicate which virtual gpiochip<N>
>   was created.
> * No way to assign names to GPIO lines exported through an aggregator.
>
> Introduce the new configfs interface for gpio-aggregator to address
> these limitations. It provides a more streamlined, modern, and
> extensible configuration method. For backward compatibility, the
> 'new_device' interface and its behavior is retained for now.
>
> This commit implements basic functionalities:
>
>   /config/gpio-aggregator/<name-of-your-choice>/
>   /config/gpio-aggregator/<name-of-your-choice>/live
>   /config/gpio-aggregator/<name-of-your-choice>/dev_name
>   /config/gpio-aggregator/<name-of-your-choice>/<lineY>/
>   /config/gpio-aggregator/<name-of-your-choice>/<lineY>/key
>   /config/gpio-aggregator/<name-of-your-choice>/<lineY>/offset
>   /config/gpio-aggregator/<name-of-your-choice>/<lineY>/name
>
> Basic setup flow is:
> 1. Create a directory for a GPIO aggregator.
> 2. Create subdirectories for each line you want to instantiate.
> 3. In each line directory, configure the key and offset.
>    The key/offset semantics are as follows:
>    * If offset is >=3D 0:
>      - key specifies the name of the chip this GPIO belongs to
>      - offset specifies the line offset within that chip.
>    * If offset is <0:
>      - key needs to specify the GPIO line name.
> 4. Return to the aggregator's root directory and write '1' to the live
>    attribute.
>
> For example, the command in the existing kernel doc:
>
>   echo 'e6052000.gpio 19 e6050000.gpio 20-21' > new_device
>
> is equivalent to:
>
>   mkdir /sys/kernel/config/gpio-aggregator/<custom-name>
>   # Change <custom-name> to name of your choice (e.g. "aggr0")
>   cd /sys/kernel/config/gpio-aggregator/<custom-name>
>   mkdir line0 line1 line2  # Only "line<Y>" naming allowed.
>   echo e6052000.gpio > line0/key
>   echo 19            > line0/offset
>   echo e6050000.gpio > line1/key
>   echo 20            > line1/offset
>   echo e6050000.gpio > line2/key
>   echo 21            > line2/offset
>   echo 1             > live
>
> The corresponding gpio_device id can be identified as follows:
>
>   cd /sys/kernel/config/gpio-aggregator/<custom-name>
>   ls -d /sys/devices/platform/`cat dev_name`/gpiochip*
>
> Also, via configfs, custom GPIO line name can be set like this:
>
>   cd /sys/kernel/config/gpio-aggregator/<custom-name>
>   echo "abc"         > line1/name
>
> Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
> ---
>
> @@ -90,6 +124,70 @@ static int aggr_add_gpio(struct gpio_aggregator *aggr=
, const char *key,
>         return 0;
>  }
>
> +static bool aggr_is_active(struct gpio_aggregator *aggr)

Series-wide: I would prefer a different prefix: why not
gpio_aggregator or at least gpio_aggr?

Other than that, looks good to me!

Bartosz

