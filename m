Return-Path: <linux-gpio+bounces-27314-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDEABF2432
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 17:58:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37EDF407272
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 15:57:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AFE027B357;
	Mon, 20 Oct 2025 15:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="it80txUR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F028727A917
	for <linux-gpio@vger.kernel.org>; Mon, 20 Oct 2025 15:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760975827; cv=none; b=AmVKJ0BVa8iKhZwHcyad/WxXAyrTWZSwXAB1jmebSQ/j+msVLSw+8pDJYpZdSXCfmVvafMbtGqHnlGXnkixvlR5/A+qJ62RzjIxVyp+VoTW90UcRrLpoFrKwGq1u/zBE/9AgEPcDje1fcmNlNjL0Uw51chDWq/bhajWZO4NPYrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760975827; c=relaxed/simple;
	bh=2GHllKR78eXABXgCgXnbeq26/zdb3DR14G1wBwF7LXA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WR/bb3ddfZCxNzMr+65PVnayrB1NinBB+lm1lgNSzSYqFObM4Xx62fZAr1WdTwVJnJZr0BjP9rP4lvOelKq/LyqjqpxmmkPFjD5BD5Lxfyzdf0Roi99QS9CzueHATLVAsP09rYgwqqZps7QOejdjkYfrs5bu4Qd0kLql809xn48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=it80txUR; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-579363a4602so4533236e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 20 Oct 2025 08:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1760975824; x=1761580624; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=see7eeK/o3JXFmIi0swdhzRJ0AZ3Yr9L2D3lHDaHtOo=;
        b=it80txURHOiLdwoe77XG1aiPXjIUoMIGiD4iPGh+EGHOq9MujGiMoEl9i5LWfvQ5Mp
         UV0P80q42sXX/XtRZnwia0OrTHa8YIt8+3SKuTAHYMkjIHrpo2o6HHTNu5At2p7qXM6U
         011PjC78n2jNzzUJ9L50PX8NK6maVLMZfuTkg1sTIp9x3kTGqW4dVRR8ZJESg/onzOHF
         LGcxupbq6EUS1XZDzipQ1XcU6VGUVbA68indkZ1trAA37+lpnSNe/x45qlYkF7MRZe1E
         XrT/SKQGWfrka5c5iFI3sC0uBWaKwrrcH0cefYzTaC8XPiyzc9E9ZGiTtg4mhlmM+shM
         kkZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760975824; x=1761580624;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=see7eeK/o3JXFmIi0swdhzRJ0AZ3Yr9L2D3lHDaHtOo=;
        b=e5WP9KDfIUb7iS4gojhO+1yahc+dUBavzM0DZe9SxmZ1DiYzQUK+8StQJNad8V8lXy
         7LcOtTAjc8Owh6Xr1Rj+vW+7n0UydXr2IEShvudSE+2W8OopEoNWImVm6OdjII5nlC+M
         Dk+O4d/GYL45S51rTxTNYBT7IKHnZ4qpwX8bRss17+l/amaq5MZ+bz+ZH80TynedWRjq
         VJkY8WOg+yvZOlQRgmVl39gciXeWHQOnDIVPYpo/LW3RMQr0d5IDWjs/76aSvJgJMFmC
         awQ61MS3hj31YihOAwqzmlJwG3Do3FyqGXaDwu0fl2jI/nF1xVVeTRyIO934mhuOu7eT
         F8yg==
X-Forwarded-Encrypted: i=1; AJvYcCWg1cP4ah1oi9YupPllU7tpvtybeC/rpkQsvJH7COJaoTa7KzkkKNI6NqRAWzwabzmNna4I4Yi8VJHb@vger.kernel.org
X-Gm-Message-State: AOJu0YyalxjFc0Scrju5jE79jakPFSQZ9+7VD8DU7dBPiZ/WigRai30r
	IdPCXZE+GJfMpgFHaSwnUPSr4+SseFbotc5HN+xCI9aeuyWAKaW1NH/jsfKEzmd+v8QFCL/+osG
	rNvttRHoYLau94GzVOA2+x0ULLsaekNasMOlfsMx9gw==
X-Gm-Gg: ASbGncsgqN/rRC9CE2b86Q54G//KMsaJ67C4BzHOVQ2a5ayij5yX+8det1lwuOvdeUQ
	3rarDItVfXBanYiGonJxxRYiVNA5RvaH8Kv5QUpa1AsW93jr6NmZIFfxbfN9vtRCiy6zrViToay
	OM3Zx9/tMd4jDwVA5qkcUfEcS+kekKApSyy4we1TNo3UtONTPiyb92IMF33CRWly4NXKbWgZWRp
	4nUqWfx/LLN5gT+emm4j/qvKCn49h776uTXVia1A5Lx2JHGqIrRiSEdzHgDAAbYD7nDKz3dyyWO
	5ei7OtiW75B2+v8w37A9WGtSLg8=
X-Google-Smtp-Source: AGHT+IEuuuAXyQbhIZ1efTXDOiUURdFYJXMq2J+B/+HoQEbi+jmTEhyTs5lF9J4ykjqXS8qP6TFPNABuDMtHbVYgwAc=
X-Received: by 2002:a05:6512:6c1:b0:57e:ad46:b0a9 with SMTP id
 2adb3069b0e04-591d851f0d3mr4618106e87.16.1760975823902; Mon, 20 Oct 2025
 08:57:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251006-reset-gpios-swnodes-v1-0-6d3325b9af42@linaro.org>
 <20251006-reset-gpios-swnodes-v1-7-6d3325b9af42@linaro.org> <95bbec130437846d4b902ce4161ccf0f33c26c59.camel@pengutronix.de>
In-Reply-To: <95bbec130437846d4b902ce4161ccf0f33c26c59.camel@pengutronix.de>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 20 Oct 2025 17:56:52 +0200
X-Gm-Features: AS18NWCip_vrKjuKwXv30qIgtOF4llYZifypjnStXrv1XDQCWqc4qBKkCG1yVdc
Message-ID: <CAMRc=Md6FRUjUBGYZnrNd+FpYq3eb4kptkzxU0wJiAzALx1dWw@mail.gmail.com>
Subject: Re: [PATCH 7/9] reset: make the provider of reset-gpios the parent of
 the reset device
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 6, 2025 at 5:19=E2=80=AFPM Philipp Zabel <p.zabel@pengutronix.d=
e> wrote:
>
> >
> > @@ -868,10 +868,6 @@ static int __reset_add_reset_gpio_lookup(int id, s=
truct device_node *np,
> >               return -EINVAL;
> >       }
> >
> > -     struct gpio_device *gdev __free(gpio_device_put) =3D gpio_device_=
find_by_fwnode(fwnode);
> > -     if (!gdev)
> > -             return -EPROBE_DEFER;
> > -
> >       label_tmp =3D gpio_device_get_label(gdev);
>
> This is the only remaining use of gdev in
> __reset_add_reset_gpio_lookup().
> It would make sense to move this as well and only pass the label.
>
> Given that all this is removed in patch 9, this is not super important.
>

I'll allow myself to skip it then because it causes a surprising
number of conflicts later into the series.

Bartosz

