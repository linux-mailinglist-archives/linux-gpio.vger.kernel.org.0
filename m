Return-Path: <linux-gpio+bounces-14410-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6C09FF9C5
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 14:22:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B42F1883B58
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 13:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CFD719E968;
	Thu,  2 Jan 2025 13:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ThzbzXa7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2701B2522
	for <linux-gpio@vger.kernel.org>; Thu,  2 Jan 2025 13:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735824101; cv=none; b=GEeIBmrC+xZgXebANxl1LgEhqO8wky5PkCKtM26sfbO16/L6armU714Qw/o5QirvwUGfWuIutEgwt5NLSlJMlIB3YJnMu7ljJPCIdTuU9AizfhZE6LSLNVtwGfwW15dqeG6KgOfIt/Fxg79/Aa4hz07KpgOPjmqxXHzsDscn2+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735824101; c=relaxed/simple;
	bh=5Lm9WaQIrqczIB+mVjDAjWvaxfDtiThUfFqifgecR3g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ls3RpVU9gqlsraD4jW0gPKJoFnGNyaF8ht4gNObmPDlniAMJl7a3V0aHXqQDxk+lYUFErcXjwm4opY3oNVWSV4grSNBJ2XeqOPZDcaePBinHMRadfqHJC7ATl3x32E1Orx2E6ekYWvqYtzAdDNRPCjz+NyXyzclfyU20tWNVpnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ThzbzXa7; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53e3a227b82so10752880e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 02 Jan 2025 05:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1735824097; x=1736428897; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BtdXA2fgdp1OzghWL+E0eyShhxPlV5eAdfR07gxtCyI=;
        b=ThzbzXa758ycoQbETSOEDfMyujpy65ud6pANnv/OX01FK8KalJeIXYvpgRdJARuYir
         FdghX0/hr9M6g6s1NglJxztqCdNR6ipWz1sQgqthqtuxlZIPDUnhjzz6MoLLvIk437Ns
         q4V3YZlcqWrBilH+oaHCYMRQ1q2vU5HimUg8x5M8Jjx8y1c+3C4TQVtwu0BjZjIHhDzp
         k74rM7sb0CURlXCDwpJMX7/GdGOmlGiZRpjNAR1Vdc/Bx44h2T9Yz0omAmZdxOUg6OHA
         O4PkGunQavqsimF5kqSvIyAp+xuJLCPpaL2GAkew075kQ4ay5XlBSnZDopcnfsAtxvpb
         WAgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735824097; x=1736428897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BtdXA2fgdp1OzghWL+E0eyShhxPlV5eAdfR07gxtCyI=;
        b=S98exLaz2BVDsl4OeCWoMi8ZyKJbQQ1Tf8L1ddGcnRAJdIvIH++ciFr6BKiuai613E
         aO1twfTA/u4pmkIKbHCu+/bAxk41Ts+bfJQMM0licp1E/yuvlmBAmjycIIeGAhKTwacy
         g8NHf0P758LraPJ2nqULd+2xXQYnNSB6T9vhSxYvfZWDXbG95KRGvrBzFr+d6nQD/2iR
         0Lw1eNx30PpDsI5/xEzWra7mVsHTK9o4yyyUPwwjqBrqQUWCeNiLE+X/oCTLfZI92wZv
         UGbCfI0QYwXwJJZPGTedXFOCpyrbWlS4kUNOvcsfxwvlqhEeD6vdEJOFIUREfhkOgWcw
         1rQw==
X-Gm-Message-State: AOJu0YwSrvJlu1YOkcEsvR3BzSm8g8/vA0hXxzaKA7O16eD5QmnqSITn
	UReuge/uNDmnhG3RDH9gPIfXKJYQBrHH+x+Mqd8O3NkayTTpSyuRLAzhn+QpVhRhyTD6HOCuLbd
	iUKI/NxpxQaOXW/A5c6Khtxx8B5jhHRf7fdu1q9zBDnA38w9b
X-Gm-Gg: ASbGncvCLcG0RHr9TaAehIWTXUMFMBaFn6rYtx5KJnds17FrmtU+WLKmcDi+6ce0a8Y
	ppllKsoTfvhB8Z8FKB4XUrWPL1IVR0B2N/Pk/+Tx+h3f84mTXam52XYEYOMdGa0enXoKiZg==
X-Google-Smtp-Source: AGHT+IHFjyWNPcTzpf7PWyd+V4lHti11LU5224sOrAOmhfc44Ijj4H8uQv8ma2tLax77MXCxYIu5uvObOB8VQSRaLZk=
X-Received: by 2002:a05:6512:3192:b0:540:1f7d:8bc4 with SMTP id
 2adb3069b0e04-5422956ba37mr13120296e87.48.1735824096637; Thu, 02 Jan 2025
 05:21:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241224060819.1492472-1-koichiro.den@canonical.com> <20241224060819.1492472-4-koichiro.den@canonical.com>
In-Reply-To: <20241224060819.1492472-4-koichiro.den@canonical.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 2 Jan 2025 14:21:25 +0100
Message-ID: <CAMRc=Md+Z9Fd1TRqNB3V41vmxrk8wZ5gk_C9tV4jbCiUgAogsg@mail.gmail.com>
Subject: Re: [PATCH 3/4] gpio: virtuser: lock up configfs that an instantiated
 device depends on
To: Koichiro Den <koichiro.den@canonical.com>
Cc: linux-gpio@vger.kernel.org, linus.walleij@linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 24, 2024 at 7:08=E2=80=AFAM Koichiro Den <koichiro.den@canonica=
l.com> wrote:
>
> Once a virtuser device is instantiated and actively used, allowing rmdir
> for its configfs serves no purpose and can be confusing. Userspace
> interacts with the virtual consumer at arbitrary times, meaning it
> depends on its existance.
>
> Make the subsystem itself depend on the configfs entry for a virtuser
> device while it is in active use.
>
> Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
> ---
>  drivers/gpio/gpio-virtuser.c | 49 ++++++++++++++++++++++++++++++------
>  1 file changed, 42 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpio/gpio-virtuser.c b/drivers/gpio/gpio-virtuser.c
> index c9700c1e4126..45b8f192f860 100644
> --- a/drivers/gpio/gpio-virtuser.c
> +++ b/drivers/gpio/gpio-virtuser.c
> @@ -1533,6 +1533,32 @@ gpio_virtuser_device_deactivate(struct gpio_virtus=
er_device *dev)
>         kfree(dev->lookup_table);
>  }
>
> +static void
> +gpio_virtuser_device_lockup_configfs(struct gpio_virtuser_device *dev, b=
ool lock)
> +{
> +       struct gpio_virtuser_lookup_entry *entry;
> +       struct gpio_virtuser_lookup *lookup;
> +       struct configfs_subsystem *subsys;
> +
> +       subsys =3D dev->group.cg_subsys;

If there'll be a v2 (patch 1/4 possibly needs it), can you assign it
at declaration? Same for 4/4.

Bart

> +
> +       /*
> +        * The device only needs to depend on leaf lookup entries. This i=
s
> +        * sufficient to lock up all the configfs entries that the
> +        * instantiated, alive device depends on.
> +        */
> +       list_for_each_entry(lookup, &dev->lookup_list, siblings) {
> +               list_for_each_entry(entry, &lookup->entry_list, siblings)=
 {
> +                       if (lock)
> +                               WARN_ON(configfs_depend_item_unlocked(
> +                                               subsys, &entry->group.cg_=
item));
> +                       else
> +                               configfs_undepend_item_unlocked(
> +                                               &entry->group.cg_item);
> +               }
> +       }
> +}
> +
>  static ssize_t
>  gpio_virtuser_device_config_live_store(struct config_item *item,
>                                        const char *page, size_t count)
> @@ -1545,15 +1571,24 @@ gpio_virtuser_device_config_live_store(struct con=
fig_item *item,
>         if (ret)
>                 return ret;
>
> -       guard(mutex)(&dev->lock);
> +       if (live)
> +               gpio_virtuser_device_lockup_configfs(dev, true);
>
> -       if (live =3D=3D gpio_virtuser_device_is_live(dev))
> -               return -EPERM;
> +       scoped_guard(mutex, &dev->lock) {
> +               if (live =3D=3D gpio_virtuser_device_is_live(dev))
> +                       ret =3D -EPERM;
> +               else if (live)
> +                       ret =3D gpio_virtuser_device_activate(dev);
> +               else
> +                       gpio_virtuser_device_deactivate(dev);
> +       }
>
> -       if (live)
> -               ret =3D gpio_virtuser_device_activate(dev);
> -       else
> -               gpio_virtuser_device_deactivate(dev);
> +       /*
> +        * Undepend is required only if device disablement (live =3D=3D 0=
)
> +        * succeeds or if device enablement (live =3D=3D 1) fails.
> +        */
> +       if (live =3D=3D !!ret)
> +               gpio_virtuser_device_lockup_configfs(dev, false);
>
>         return ret ?: count;
>  }
> --
> 2.43.0
>

