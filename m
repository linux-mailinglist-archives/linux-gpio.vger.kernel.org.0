Return-Path: <linux-gpio+bounces-16280-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EF2A3D7D9
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 12:09:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E984B19C209A
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 11:08:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB4971F12E0;
	Thu, 20 Feb 2025 11:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="UL+0Jqbp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936CF1DA10C
	for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2025 11:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740049713; cv=none; b=YAkesqfcTTRwTXJpoDLLrPOk4Ft3l8IT8ci52ZS9Sitx0ikS6a/HfWN7d98gFytI5ZV+r0tCk8SR8GKSGPVRuVzP4D4Wg6wHRcfu2nup6ZhwUrA/SF5OeljW4pUVG736Ijgv4dxHF+DCRw+SSS9QQMOYpwydWQOwJkVCJwQPSZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740049713; c=relaxed/simple;
	bh=wsklMZucUPkbHHT0MAAjFIJG2P6Hdi5divFOEI5Inq4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ba5o1fGI55hrRw49ds6ZvVcBRIZa1+EwDJf/8xv4Y4ePDrX19moDEgFOMVnkplAdzcFDlhYd+h8URFs4fDZne/PrOG552ZyOR9RIqNUVG+pNI4xt/FfaURbb0bEy0zJPEl86TjA8sVeONbUcR7rJbPYmZlG06WPzb1qDGF3Bt3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=UL+0Jqbp; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-546237cd3cbso857147e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2025 03:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740049709; x=1740654509; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Wq8QeYYoAG6GqdK6ykrRH0bnFwzccAb5pciRQeLX7g=;
        b=UL+0JqbpGKdX+6wAg8n25yk7LN3eWa9O8ksL1Qn3M4E7RKVgPDe4msk2cJXSZwHE12
         viQHYXSj7d4sgdhZu9b6Q1jK4c04KMYPABr3h8y/bDRQIGHZGmBg4XolP69UTqh/G7hU
         Jp5cORW0Ldk/pnfhVNxu3ChgU68I3k9L/E9R+rntVxsql9TEOTA+KCvW+h8crJga9miT
         QtVjjnCEvU6bYvsZCkNKqbRJ76JJTQu+cBxJghktDNxuMILbjDvLm3wshhtBXV0XMkcT
         tPckx9HQQeLSPrf9I2Wq9JjKwwYz3YwxZKaYNVtdoIGl1oOIMGHhnZ8iODOaGS1J687d
         2FXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740049709; x=1740654509;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Wq8QeYYoAG6GqdK6ykrRH0bnFwzccAb5pciRQeLX7g=;
        b=FU/IWXc7HYbTR4sSdaCHGMSDC3ELkOBLXa1p3cgsREn7qDxgxGa7SvP7Juwm6FOdzw
         NI2d8tjjAaPKjUIFNybEe/3ZhpwpOtEPklxETWnDW23PqEYwA5hEX+RMNjH2BUBveUz3
         DWPmpkBSDA1tQ85+3LzN9th4eKj1km/YDddBgmZLyAfM/1Lm6flTqrag1/4Za7iYNtSS
         tVzjnWRB0cLhbLAnLWdn3pvcLieFJiMZkkM+ZHcjTlqfZMk+evm3lmMeia2RZP+n2Kq0
         t5P9eEsfLx/WQIflnfmCE1peRJEuGX6EZNrtdXVkrFbQosgxaiw0nBsCczEKJS8GlfDF
         CzsA==
X-Gm-Message-State: AOJu0YzIQQLj/YstOdF3pxej5C4LV0SsknZAgkipLwNWeg3ybvEAl+QM
	WdJ8n7YBSlM2rNn4UCmyrIQhi9M6/vWARdBCvfnuP+z8QYkoJ0vg4kJTTc8OBtoKAYu9usUVXXj
	iojXIh5WnXvIksSvnEwNeLYM4F0FjIgNf7wot0A==
X-Gm-Gg: ASbGncsN2skunVezsSq1szlHRPZXFTAZiy2F9VSmpcpUOC1t7HvY4n47dpyYTE9Ac4Z
	QDfbw7f7UO8wRcW2MaLELDchAFgxIr+YZpTh3G2MU6Q0yml9s1inAveY9C0vA7WXUgAuYH/p2Zk
	9xhVtFbd5imdBmC8oCm0WEyUSxODc=
X-Google-Smtp-Source: AGHT+IGfnHxc0LwSbIsH3Kf0h9dCgr8wHOa++ItKwQprXHL288wbvCBlEUijw2k3KO0J+QRayqaZh9njys8ex67sVUI=
X-Received: by 2002:a05:6512:318c:b0:545:2b20:5b21 with SMTP id
 2adb3069b0e04-5452feaafc1mr7290527e87.50.1740049709567; Thu, 20 Feb 2025
 03:08:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250218160333.605829-1-koichiro.den@canonical.com> <20250218160333.605829-3-koichiro.den@canonical.com>
In-Reply-To: <20250218160333.605829-3-koichiro.den@canonical.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 20 Feb 2025 12:08:18 +0100
X-Gm-Features: AWEUYZm27-QxV--npSm6sC1JkRv8xgNE48OfDabPsd9PEnwFWvOwLgvBjR1dAuo
Message-ID: <CAMRc=Mc5XfcQPsw1K70ogT6Oyxhy=PJ8neHT9xA8wrZmk069eQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] gpio: sim: convert to use dev-sync-probe utilities
To: Koichiro Den <koichiro.den@canonical.com>
Cc: linux-gpio@vger.kernel.org, geert+renesas@glider.be, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 18, 2025 at 5:04=E2=80=AFPM Koichiro Den <koichiro.den@canonica=
l.com> wrote:
>
> Update gpio-sim to use the new dev-sync-probe helper functions for
> synchronized platform device creation, reducing code duplication.
>
> No functional change.
>
> Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
> ---
>  drivers/gpio/Kconfig    |  2 +
>  drivers/gpio/gpio-sim.c | 84 ++++++-----------------------------------
>  2 files changed, 14 insertions(+), 72 deletions(-)
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 2e4c5f0a94f7..ba06f052b9ea 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1866,6 +1866,7 @@ endmenu
>  # This symbol is selected by drivers that need synchronous fake device c=
reation
>  config DEV_SYNC_PROBE
>         tristate "Utilities for synchronous fake device creation"
> +       depends on GPIO_SIM

No, it does not. Please drop this.

>         help
>           Common helper functions for drivers that need synchronous fake
>           device creation.
> @@ -1916,6 +1917,7 @@ config GPIO_SIM
>         tristate "GPIO Simulator Module"
>         select IRQ_SIM
>         select CONFIGFS_FS
> +       select DEV_SYNC_PROBE
>         help
>           This enables the GPIO simulator - a configfs-based GPIO testing
>           driver.
> diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
> index a086087ada17..d1cdea450937 100644
> --- a/drivers/gpio/gpio-sim.c
> +++ b/drivers/gpio/gpio-sim.c
> @@ -10,7 +10,6 @@
>  #include <linux/array_size.h>
>  #include <linux/bitmap.h>
>  #include <linux/cleanup.h>
> -#include <linux/completion.h>
>  #include <linux/configfs.h>
>  #include <linux/device.h>
>  #include <linux/err.h>
> @@ -37,6 +36,8 @@
>  #include <linux/sysfs.h>
>  #include <linux/types.h>
>
> +#include "dev-sync-probe.h"
> +
>  #define GPIO_SIM_NGPIO_MAX     1024
>  #define GPIO_SIM_PROP_MAX      4 /* Max 3 properties + sentinel. */
>  #define GPIO_SIM_NUM_ATTRS     3 /* value, pull and sentinel */
> @@ -541,14 +542,9 @@ static struct platform_driver gpio_sim_driver =3D {
>  };
>
>  struct gpio_sim_device {
> +       struct dev_sync_probe_data data;

Maybe something more indicative of the purpose? probe_data? sync_probe_data=
?

Bart

