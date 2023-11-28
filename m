Return-Path: <linux-gpio+bounces-581-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DD30C7FBCA5
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Nov 2023 15:22:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98DB7282B21
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Nov 2023 14:21:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 928395ABB7;
	Tue, 28 Nov 2023 14:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jZZs0Gbz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 643BED4C
	for <linux-gpio@vger.kernel.org>; Tue, 28 Nov 2023 06:21:53 -0800 (PST)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-5cfc3a48ab2so24207707b3.0
        for <linux-gpio@vger.kernel.org>; Tue, 28 Nov 2023 06:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701181312; x=1701786112; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C+UG3eivAjAm0i+X6/FSUZzwGX02Fl0BzHgHDeFoqqU=;
        b=jZZs0GbzNn+sz7MrBuzHP8HBxsQui+JiZa+plNf5Q5NjxvnUikDNTjHvFoqLvZgns0
         WY+6/HYPprNvDDA+aKo7tjC7sQ7gL+rSKOLXtPjmmKN1GnXJuKvvv8hgyzwXvwsNB8Hn
         JuCpq6zPQJuKuoyn1qHPCMix398JiF4oTf3u/ZYOZ2ObbXYJoZw1qrUfn+teLF9aITV0
         ZNQ59fYtNstKStrazOyhEFW+EKJytlY7RRnWH4eNKS/5XNQ3Nczi8He4JoQxBI1bsrJS
         UWUvi0n7igED3NuWzaGudyzzZyTg6jp8+RzVUBhww63enFCfpyuGKcRMh3KBarZ5bUfb
         QcFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701181312; x=1701786112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C+UG3eivAjAm0i+X6/FSUZzwGX02Fl0BzHgHDeFoqqU=;
        b=gLj0a2CdK1b2yhXTdzPm30PkFexvAA+T1CZN+6qvxMAnpVy4A2jNrEZfCy8rzmte5a
         ZlL6zsRWjpZPwBdw6N7AMjMu65DVSkx87jNrWEsRgXLx7wQhq3wIKcWBI1SvpJpJaKxt
         JUOiGSfUVojARyU1Wi93GUMfUW8HVaeSjmeyNqqpud9N27LSPMh0UbdxlyZxs16yCb3m
         Ygcxs6fVsH6uxWn+tDXgjcFslt4DDaVwQq/qpuuCo6WiZrK9lXyvE+7ffIZtA1PB13DO
         tIwksspbrLZCrP6sK/f9Y7Kx+BJmfZTb1DWpPlbOxKLeUBhy7m4ox4uGtmSkDbATPpNy
         cDmw==
X-Gm-Message-State: AOJu0YzMw0aFuL9kHk1b60JclXbn99+pqeIS3UJ4F2mtuYVGQTD29GDx
	dSWkAkmMzH0WL3L2zHu4qX0dOsi9hcvssWcPphJyyQ==
X-Google-Smtp-Source: AGHT+IEkGyMKRQn99rVKa8rwk67p/2ddZWmlor3GIfPaWY/5muKqPhZwdy5yzvNoOsgSzfzHVvBhs+aoqqmTJ4cKQxg=
X-Received: by 2002:a81:ac28:0:b0:5d0:4947:63c3 with SMTP id
 k40-20020a81ac28000000b005d0494763c3mr7234365ywh.14.1701181312555; Tue, 28
 Nov 2023 06:21:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231127193716.63143-1-brgl@bgdev.pl> <20231127193716.63143-2-brgl@bgdev.pl>
In-Reply-To: <20231127193716.63143-2-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 28 Nov 2023 15:21:40 +0100
Message-ID: <CACRpkdYG5FbOLDLM+WGEbX-42mjkALU-HfAgdLLhHSq+K1gnaw@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: use a mutex to protect the list of GPIO devices
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Kent Gibson <warthog618@gmail.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 27, 2023 at 8:37=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The global list of GPIO devices is never modified or accessed from
> atomic context so it's fine to protect it using a mutex. Add a new
> global lock dedicated to the gpio_devices list and use it whenever
> accessing or modifying it.
>
> While at it: fold the sysfs registering of existing devices into
> gpiolib.c and make gpio_devices static within its compilation unit.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Nice! I might have found some snag:

gpio_device_find() still does guard(spinlock_irqsave)(&gpio_lock);
shouldn't that be switched to the mutex?

On top of this I can update my patch to the delete the comment
for gpio_lock to just rename that thing to gpio_descriptor_lock
and document it as such.

But when I think about it: gpio[_decriptor]_lock can now (after this
patch) be moved into struct gpio_chip as it is really just protecting
the descriptors on the same chip from simultaneous modification,
especially desc->flags. This is a BIG WIN because it makes it a local
lock not a global one, do you wanna try it or should I? (On top of
these two patches, then.)

Yours,
Linus Walleij

