Return-Path: <linux-gpio+bounces-14408-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B059FF98F
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 13:56:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D639318835E6
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 12:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C34041A4E77;
	Thu,  2 Jan 2025 12:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="QutC7JiC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44953FE4
	for <linux-gpio@vger.kernel.org>; Thu,  2 Jan 2025 12:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735822608; cv=none; b=BNz4jsIgR66+ePWlvf1ZSZBtGe0ZAWxliLa2INYiumSrXpam7mxjW3Ic7JUTK9ihxt2oE72fpIviCBjmVDV17L3TqjpQoKgNl0axoJe0NvGKnM1xSX5dCyouvy/qhE1wO42724t0rKUj4ewJ4hIGrqGmA0TvbwARVfxmlCD0BRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735822608; c=relaxed/simple;
	bh=sjWL0VMVDGZi3yWgGojdLSXyUJ6Mk44e67f6TjyqEoM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GlUL7PMqTk1c+SVFEiZqFtwuZD3/0Ed0Xz9tT7hcXbjmrRyPbArhgMj/ig0JEMyRu9zKVr9QiqUoJZBDub6JDZTBgZf/SfWJ6MRf9trd5eTzDq6c4i3FhT+GQZmBLbqZB+dR7cVrR4QhEP8Gyepqv12ffxtaGE9bPY/LF67n6TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=QutC7JiC; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54025432becso12335373e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 02 Jan 2025 04:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1735822605; x=1736427405; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2fQvsuZO2WDVts8WS+nNViOwdPUU5JgkYo0vn0AOKOw=;
        b=QutC7JiCPZXSqE0DyRKULfxEjy0qXk+qBM2Z+xQIPT43BMHadSUPb/KOE55c078GEx
         hPUrAYV5SCRP3e8e2dzMpk6TXiAXO8TX164AwARlxD63ID0lObrRJcaJHFYTdvMA45w9
         VCltgEHbVEfIEfSLDMZkyi5oTvEJ8FVn4YRGRVie6OEt9ByDCzLFQ3LTU1xWuYO1j9nL
         uaE7W7iwdeS/dg0kfjoKhA1G3JoXU5ZvVm1Hbj55cXeJTzmL1zCdVjExlmu21X0mKNTR
         fwtRUFyKXnPfy40phMPu74eEdaDRO0x/R6927gs8hBBAZV+60FJoepW0thrpDo2shrhX
         p8ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735822605; x=1736427405;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2fQvsuZO2WDVts8WS+nNViOwdPUU5JgkYo0vn0AOKOw=;
        b=bjFtT1fbWsdidLLsVF3Jp+JTUJkhs+ItLq8XwoiVjvhiVjuwj+1Fks59D8u14IoHHc
         tWkfi8nZLmFIOhvrQ62BliNy/u52Mo4BpMMycG5xIY2t3xduZ36ZevJnYM0lMfkB2JBy
         UFDhb/W/SjCzJpy+0n/UxUYKiF9VSs9Rj4GFlDcHvhMAHfHXCbkXJcR0XgSNe9qchrWe
         gT64tmJTQnE3d/tQ3Q8NJNjlkUWNHuvjBEJWcadVHLtBbFqsHn1Nngq3RAkMxatZ/cSJ
         XV9nbaCurmtLKwDF0+uU9YvpOxykCaN7RsAg1jVcuDyGF8jSJPUDpQOKTi/UY1PqpcuH
         VmTw==
X-Gm-Message-State: AOJu0Ywd31oR97lAZsNG7ktxRMw5KfulE69ej3yrRNR3bc0pIsz9+0WT
	sqkJamfXjp0lpi8q5ZH9sAfPDw08bqsMEvizko4YN4YNmlXNJd6TYe6o9sa2bc1nX7n7CcuRTQI
	XwSfkM8yrnt090zw2BZUcFPPGoPEj93Q9En1QGw==
X-Gm-Gg: ASbGnctJnOLWmwhpz+GVA9zH46q8kLcQDCjwi9dJUCaklE30GOXrikUpqxgMSZBC/Nh
	dbCDWPrBhG8vgiN/DBGl8I3OBubnEfwpgrqBDK1LCHvcEVL/1zESDk1YpLGlU47SbDXUWhQ==
X-Google-Smtp-Source: AGHT+IHjYLQt3vIwm4u+TnEhpDYaXqBJStK+68zBOqqDRbj4nMx3tDmRsCE46gnVv3GxDLtD0Ki6NxTd8s4h/Pu+EEE=
X-Received: by 2002:a05:6512:10c3:b0:542:23a9:bd2f with SMTP id
 2adb3069b0e04-5422954d7fbmr12153205e87.29.1735822605081; Thu, 02 Jan 2025
 04:56:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241224060819.1492472-1-koichiro.den@canonical.com> <20241224060819.1492472-2-koichiro.den@canonical.com>
In-Reply-To: <20241224060819.1492472-2-koichiro.den@canonical.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 2 Jan 2025 13:56:34 +0100
Message-ID: <CAMRc=McjLeSfHMaAtj_P0kd2thOVZjrGTSZsDWZX2Oir+8DN_w@mail.gmail.com>
Subject: Re: [PATCH 1/4] gpio: virtuser: fix missing lookup table cleanup on
 probe failure
To: Koichiro Den <koichiro.den@canonical.com>
Cc: linux-gpio@vger.kernel.org, linus.walleij@linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 24, 2024 at 7:08=E2=80=AFAM Koichiro Den <koichiro.den@canonica=
l.com> wrote:
>
> When a virtuser device is created via configfs and the probe fails due
> to an incorrect lookup table, the table is not removed. This prevents
> subsequent probe attempts from succeeding, even if the issue is
> corrected, unless the device is released.
>
> Ensure the lookup table is removed whenever the probe fails.
>
> Fixes: 91581c4b3f29 ("gpio: virtuser: new virtual testing driver for the =
GPIO API")
> Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
> ---
>  drivers/gpio/gpio-virtuser.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpio/gpio-virtuser.c b/drivers/gpio/gpio-virtuser.c
> index 91b6352c957c..a81e15a4b807 100644
> --- a/drivers/gpio/gpio-virtuser.c
> +++ b/drivers/gpio/gpio-virtuser.c
> @@ -1509,6 +1509,7 @@ gpio_virtuser_device_activate(struct gpio_virtuser_=
device *dev)
>         if (!dev->driver_bound) {
>                 platform_device_unregister(pdev);
>                 fwnode_remove_software_node(swnode);
> +               gpiod_remove_lookup_table(dev->lookup_table);
>                 return -ENXIO;
>         }
>
> --
> 2.43.0
>

Good catch! Don't we need to do the same if the call to
platform_device_register_full() fails?

Bart

