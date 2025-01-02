Return-Path: <linux-gpio+bounces-14411-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A68B09FF9C7
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 14:22:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC4F01883BFF
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 13:22:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A63BD3FE4;
	Thu,  2 Jan 2025 13:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="OsZQRYx7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD43D1E51D
	for <linux-gpio@vger.kernel.org>; Thu,  2 Jan 2025 13:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735824145; cv=none; b=P93WZz76cZOl8ZrqrplO8iDUKsO00ONoKsYoIoT0Tkfb/O+wDr7Fv4/CXGHMXjBrLJ36auoxtr9nPrCXxxdofvo5Pf+HcZYnm7BUWFn7OWrrYNePYpzKbI8FUb4bjbG6rkWGG89XkqHBYlj/81FpUb4UbmVXgtFIVI34fGUSK9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735824145; c=relaxed/simple;
	bh=1nZjAx0qWiO+zlxHWw7IbvRLA1FxJb150cahJ+mW1cE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=icpINM9y86ZZ6Eoz1s7G7hVzMIVtjYmdMLKA28WI+4Vap4djT4iDF5PMAMwhAObO4+rB8pOrGBDEmOd+TOTNUNPs6VEup2gaK3G8eZeUSfCi1WzRaVgwBlq+8VSyZYou4gtCv25ojXhdUZ6lFkol1b8j31pr61wb/2puSHv3mFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=OsZQRYx7; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5401c52000dso13061368e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 02 Jan 2025 05:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1735824142; x=1736428942; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NCb/5qEQt2dGN4gAAGX/1SQFE6k5JsY2Am5vmOmvaKg=;
        b=OsZQRYx75OPd+W5mge9xowXuoCG9q9T4W3CbG7ZmYLgkYmPHegZKZqllXMhOvjS53P
         195PSeJjdsRQuFt+CjgQymxh/lSdWAwAwl75ED2+15GbHrmyWi+9ZwW5mAfpNXRBR/Hv
         AGOOcuMVx9SAHJ+wSg7/sDJ2U8E35utYSNuHzAuAEqT8e7xnAMIwd9pAj8ITBik/zjm/
         9bWhmAML8xs/LiBIGbnTBC/2u8e7v6qmuw4w4agX082ALqf5WnS6r3RxxVhxsBXwsHJz
         wij3XMDyMrMmWX34Fe6E0jkQvdeXPy8Vi0BV4YyLpgO0Qm5uDPNNJm1YyM+rFrpkq6EF
         i0SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735824142; x=1736428942;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NCb/5qEQt2dGN4gAAGX/1SQFE6k5JsY2Am5vmOmvaKg=;
        b=NmuZctXkfX9dPne1lFmgw9AL539IPTXO7Mriog2poJ+Cq7Jwcod2RN2hW9m2icmv6D
         Iqn0sgSbZKs1qL7imZ7iTLrDvjOfow/DD81BYqDalZ+7HxXXNaADEexkUjwkOgMDetST
         q5XhwqUpbqWZlPu5pZmfa5xjc3WPuzJ//Henxkzg0XKE7dG8hGG2k/vL2YRAQrl9lA6N
         v03hXh6uGNCTobQMXVEmeq/BfdWx6ndQGSVerlryDjpsvnWV1Db79mZvRzgK+iYwGxU1
         MhJmLnY7B7FZcVFuBjd+sphiCTFGIAxB8ZlDg9ViLQdEtjs+4T9MIqqkUMTjOXZ84BLi
         oYTA==
X-Gm-Message-State: AOJu0YyUb4a5jU7kVpywXJFFs1/9R5com6r/1sEfRHSxPpC5eIPWd5Qc
	u/QMpAJlbMODre8txDXa+7+h+x5G1KntT+XJAs9YA8ABsOzJ2vjWdL16gMtXsfdUJssNwvhchGu
	bGz2XmlLTkgu1nZeXEpoS/tnoG0NsFPCMeEnwX+dBTIIrZala
X-Gm-Gg: ASbGncvssg2DM3rWn/7Xxhvs5CSLurZJ2B3f+cMqjZaRtjcC1CDWM6zh6X4Hn8ttJ2Z
	E2CGyAv+JSTumTC/AoMNyg/tUmYBYN/P3zIW9MlMdXKUbDkiGijj5QZTPohIfkEWu5mtoyg==
X-Google-Smtp-Source: AGHT+IG02EaAUVpJsOHMwTEH+b2K6tT1bt3clfiJIKzv/LjGwUySesFCX7G9NNyFO9MFVBk9zUY+AmvXi4iF1yH715o=
X-Received: by 2002:a05:6512:114d:b0:53e:391c:e983 with SMTP id
 2adb3069b0e04-542295229d3mr16123988e87.3.1735824141807; Thu, 02 Jan 2025
 05:22:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241224060819.1492472-1-koichiro.den@canonical.com> <20241224060819.1492472-3-koichiro.den@canonical.com>
In-Reply-To: <20241224060819.1492472-3-koichiro.den@canonical.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 2 Jan 2025 14:22:10 +0100
Message-ID: <CAMRc=MddJ4gguNs2bHyQH6pFnApv6whjGgGPZP0aMEZ6C8a6_w@mail.gmail.com>
Subject: Re: [PATCH 2/4] gpio: virtuser: fix handling of multiple conn_ids in
 lookup table
To: Koichiro Den <koichiro.den@canonical.com>
Cc: linux-gpio@vger.kernel.org, linus.walleij@linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 24, 2024 at 7:08=E2=80=AFAM Koichiro Den <koichiro.den@canonica=
l.com> wrote:
>
> Creating a virtuser device via configfs with multiple conn_ids fails due
> to incorrect indexing of lookup entries. Correct the indexing logic to
> ensure proper functionality when multiple gpio_virtuser_lookup are
> created.
>
> Fixes: 91581c4b3f29 ("gpio: virtuser: new virtual testing driver for the =
GPIO API")
> Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
> ---
>  drivers/gpio/gpio-virtuser.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpio/gpio-virtuser.c b/drivers/gpio/gpio-virtuser.c
> index a81e15a4b807..c9700c1e4126 100644
> --- a/drivers/gpio/gpio-virtuser.c
> +++ b/drivers/gpio/gpio-virtuser.c
> @@ -1410,7 +1410,7 @@ gpio_virtuser_make_lookup_table(struct gpio_virtuse=
r_device *dev)
>         size_t num_entries =3D gpio_virtuser_get_lookup_count(dev);
>         struct gpio_virtuser_lookup_entry *entry;
>         struct gpio_virtuser_lookup *lookup;
> -       unsigned int i =3D 0;
> +       unsigned int i =3D 0, idx;
>
>         lockdep_assert_held(&dev->lock);
>
> @@ -1424,12 +1424,12 @@ gpio_virtuser_make_lookup_table(struct gpio_virtu=
ser_device *dev)
>                 return -ENOMEM;
>
>         list_for_each_entry(lookup, &dev->lookup_list, siblings) {
> +               idx =3D 0;
>                 list_for_each_entry(entry, &lookup->entry_list, siblings)=
 {
> -                       table->table[i] =3D
> +                       table->table[i++] =3D
>                                 GPIO_LOOKUP_IDX(entry->key,
>                                                 entry->offset < 0 ? U16_M=
AX : entry->offset,
> -                                               lookup->con_id, i, entry-=
>flags);
> -                       i++;
> +                                               lookup->con_id, idx++, en=
try->flags);
>                 }
>         }
>
> --
> 2.43.0
>

Thanks, somehow that escaped my attention, I never needed to use two
different con_ids.

Bart

