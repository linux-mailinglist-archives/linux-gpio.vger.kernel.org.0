Return-Path: <linux-gpio+bounces-3682-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EC7860D57
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Feb 2024 09:58:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A28B1C22796
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Feb 2024 08:58:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27E091AAD0;
	Fri, 23 Feb 2024 08:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="hsc9L+4q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00ACA11CBF
	for <linux-gpio@vger.kernel.org>; Fri, 23 Feb 2024 08:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708678679; cv=none; b=K6X9UeqRbVwxtsQaAOS8529cukagmAFjn0xw4hI7c4YL2VaPCPs54hzW52W7txqoHruxbbhO5/kbcHzC0M4YQi0SVsP3RlmtywDgu7wHNFHFOEfKW5KgpUJqKkjw9/hkhxKK8N8ULAiDYTo9F3A5qFerb5chQZfm7ys82WR4GHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708678679; c=relaxed/simple;
	bh=nlK5qHaZhiykL1gGFylKHCeTVd6rL0Q153oLIBBktCA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BJsYI7Wv42XRrdufnDKFo9zQn/pGCRFPvvIwlSTdZXpg5IpUlPNXxl13i6FIHElb8tUmYZPtbC1v3UbZfZI7a/6+sd5RxUtXpErhLkqG7DX9BVGOkqugQ7Hq8K6aXmXvdpyxNrObe9D7g6gISKRyVeD1Z/jYluWTovi89/Z3S4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=hsc9L+4q; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-7d6a85586e3so349032241.2
        for <linux-gpio@vger.kernel.org>; Fri, 23 Feb 2024 00:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1708678677; x=1709283477; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CjhPEhBa12TItlvxQZxsnnjXxJoCDUZerm30n59NmwU=;
        b=hsc9L+4qeDS6W1HqxbjC7PeBfOfJt1ODkai83guOCktqMmL1LDOgoaLtMfyTRBkoWf
         xXQ1vbZ5r4/ojrbDZUCHa7J3Gy+qcXzl9mNM8XBfv2M3q9UlbVYvxD/lEto9KoVbVv24
         FIwrLb+gFmcdh4GhjU24KSzyCK/d/78lBA0Til/50FYmnEQnW0PvqL+ARiNWnkfZbbPK
         1+Dtb8u5s1cIgY8+n8W7Jn+RXGncrYfYOUoD1bXYgmkDhIQjCDPeZzvY7QwMe3gi1VSt
         GzKXdCIt79vNCMzhN/mZlSjzTjN227vvUasKylRDepNWUl3tKuO7y8P3gxGW1cuDG+zv
         QoeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708678677; x=1709283477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CjhPEhBa12TItlvxQZxsnnjXxJoCDUZerm30n59NmwU=;
        b=j5eKMjuQq1KgwjePzNnFLogx7Eh3vb2/9H+h17LFy8rsMPcBo+yUqYrtLt4QnZeJH0
         s2k+2IhP/vHRGtGNHyLjUFZiBrwRYoCyYR++xHW/jwJdvBQmlAlI8WuN6TexryLyAF6Y
         8mSlj4YKW4OqOZsuBX2p5a/a0L5wX2khU4qT5NJTc1ThBmLH7idybXdyHKqa6nuxDffV
         k8dvBmLPsy73deAIs3ZJtzF2mU3tLCf7w6egpq/pbalJaPQoCPt01bzMW23cXwlKYtgc
         uNtiHIYzHjdcowcSvl13DlAG4CF1pj1GP1hHTBdo4f8yJ1uBov1GKf9r468x5G0re1oq
         tN4Q==
X-Gm-Message-State: AOJu0YzniA9F0FtWq7+FjJG0J4IYT6ixpZgnJBmiwBgHAfv/0+ciQcHL
	/pATJw0GQ/X5cJG9a3Zz7lVaeflm4x4VOplW57IG/TBrTQ6jSyYvG/vDyf+z7plqJ1sc9cwY4go
	vysyvH3IAb3E3ZZe9Snnr9tSW+2ZUIGmCW2jiPYmEwUYv11cG
X-Google-Smtp-Source: AGHT+IF5EtRLg2sHfJzKBquPxZdBzGX8N61QJTJeYEubsIh78w4hHntCP/VtMxzVtkyLbjkp9oBlqYwmlgEWyY3rL4I=
X-Received: by 2002:a05:6102:2910:b0:471:c4ad:4119 with SMTP id
 cz16-20020a056102291000b00471c4ad4119mr1380211vsb.8.1708678676895; Fri, 23
 Feb 2024 00:57:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240220135431.22910-1-brgl@bgdev.pl>
In-Reply-To: <20240220135431.22910-1-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 23 Feb 2024 09:57:46 +0100
Message-ID: <CAMRc=Me7h9fzTqu7hkfOOGdFz4dwcgcVOdLu+3KovX9nZk5U4A@mail.gmail.com>
Subject: Re: [PATCH] gpio: sim: delimit the fwnode name with a ":" when
 generating labels
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 20, 2024 at 2:54=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Typically, whenever a human-readable name is created for objects using
> a software node, its name is delimited with ":" as dashes are often used
> in other parts of the name. Make gpio-sim use the same pattern. This
> results in better looking default names:
>
>   gpio-sim.0:node0
>   gpio-sim.0:node1
>   gpio-sim.1:node0
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/gpio/gpio-sim.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
> index c4106e37e6db..1f3dd95dd6da 100644
> --- a/drivers/gpio/gpio-sim.c
> +++ b/drivers/gpio/gpio-sim.c
> @@ -420,7 +420,7 @@ static int gpio_sim_add_bank(struct fwnode_handle *sw=
node, struct device *dev)
>
>         ret =3D fwnode_property_read_string(swnode, "gpio-sim,label", &la=
bel);
>         if (ret) {
> -               label =3D devm_kasprintf(dev, GFP_KERNEL, "%s-%pfwP",
> +               label =3D devm_kasprintf(dev, GFP_KERNEL, "%s:%pfwP",
>                                        dev_name(dev), swnode);
>                 if (!label)
>                         return -ENOMEM;
> @@ -833,7 +833,7 @@ static int gpio_sim_add_hogs(struct gpio_sim_device *=
dev)
>                                                           GFP_KERNEL);
>                         else
>                                 hog->chip_label =3D kasprintf(GFP_KERNEL,
> -                                                       "gpio-sim.%u-%pfw=
P",
> +                                                       "gpio-sim.%u:%pfw=
P",
>                                                         dev->id,
>                                                         bank->swnode);
>                         if (!hog->chip_label) {
> --
> 2.40.1
>

Patch applied.

Bart

