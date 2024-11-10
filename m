Return-Path: <linux-gpio+bounces-12782-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B5E9C344D
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Nov 2024 20:08:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97B711F2126E
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Nov 2024 19:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE45713EFF3;
	Sun, 10 Nov 2024 19:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="R7EVN1tC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9886224FD
	for <linux-gpio@vger.kernel.org>; Sun, 10 Nov 2024 19:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731265717; cv=none; b=JYbhzr9uugj8dsOeRGj5eLOvgbwOGMUCKMup6y53uacZqf3ZGbYOMUgkZu/7U6hsR6PUHno70OUb6MJ+oh0pbZpgManp4bzs//kmPEwndLdjyZcxJdwfHwjmCPfK0vczorc0nKa90FGQDSiGESFx+A89mTff+le+d17b92/OHwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731265717; c=relaxed/simple;
	bh=xXN+etwg9O7UOYdLRxdTl39Khe4/K71I/I9+wx19X9g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aDBDerT/eV2VMIW8VkPd7dbzbJYhAIzqpz0PYqiDlC5wI+L+kwJJK9otQwUVOP7RwqC2JTlXJuyd9MBDjFL5QWGT9NXB1b4jJpE8Eaeh0zC9ezok0YbJRUmiAJLKvaogIu5P7vuOj+smKkCubDHkus3AzjonwLKBUZJqrxZfaSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=R7EVN1tC; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fb388e64b0so33090351fa.0
        for <linux-gpio@vger.kernel.org>; Sun, 10 Nov 2024 11:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1731265713; x=1731870513; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fqjnt/nFLi/tMSpbX01ZlyKkF6+YF1S0IaJNRH9S9II=;
        b=R7EVN1tCfAPJmWLWpflEViZniHwCQC5xSGEpaUQ7Ku9yqe4HE/gFv0iXnYwZOyeXvv
         dY6oo2oWdGrCgLW88JCRVjgE+JGpjm+2jr3Fza9DERFt0oW39LiTYvBbVb0Z+lhyzlJJ
         RPhSy3nVukoYy5X/P59ayFVZ42d5Gg9MmU0CbX4/sNbRH07gwmB3hggDtyetaRLENvL5
         NRYNcGaOHCyEFj7OxBMcGl3JFOh5VrrE1jy/QyU/EIk9/G1CjKOYpn3MOTX5HrQl8kMD
         KgKLaWW9K0uwrCxP8JLZEvi8HQo/o5vWM5azrVXRBavVu6L4fVbsud8imE4sESD48ws6
         i9jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731265713; x=1731870513;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fqjnt/nFLi/tMSpbX01ZlyKkF6+YF1S0IaJNRH9S9II=;
        b=KWwGmmOeiL5tzzIzfwqh3tBex0pz/icxdYGxu4aE5QTrf4NChXpzso/jJrsYQFg2sy
         k1yjgw1pOyJMESx4XYkCwOZfP0UgglZ03rn5uppIcIHTtZgdG4jfxTA1YLz8WD7kiAT8
         gL8D3PYTEOINOtAYQbb2AscLtAKRQBVj5zl5Upa6v8XQD+GqxQCqgV1J7zOATTEXpO9g
         cxdTzNa8a1ljjJpf4IHMNxmhTTTpgP6AmgNLndqhNzDYl3MaLrEyMGNKRMwPHWMLKAP5
         Uu0K60CibYnxWiFTJ1gRidoo6wcN1ESWZ9SYoRe5MChR5xY8ibDzgraU4tryGU+ap0JI
         GKaA==
X-Gm-Message-State: AOJu0Yy8dgi3OvQr6TRp1DSWp1yldgocL7SWL9+gzxipFdN1lON7n7oI
	KLLe+fz+hF4dmoIVg8ZDMC6u0Y1V32vhe7BiDaJvVLjTztZLVOtBxypGRKN1qh8OoRDfynKllgK
	GhAPv9T5bDJ4i4YsWNTbnCQzlh+wHekl5pM3faw==
X-Google-Smtp-Source: AGHT+IEGLuibVTWrwvIgpmZkA7EFJyYxteTsXX8ieDWPZ8HXevFsPAI7Who5jrPLgBImZjSeCmMjGjqA1GRaIq6hQXY=
X-Received: by 2002:a05:651c:248:b0:2fb:565a:d93c with SMTP id
 38308e7fff4ca-2ff201e73c7mr36829581fa.1.1731265711224; Sun, 10 Nov 2024
 11:08:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241107-avatar-clapper-93eb34ad0e0c@spud> <20241107-coroner-amino-5e32e3e59ced@spud>
In-Reply-To: <20241107-coroner-amino-5e32e3e59ced@spud>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sun, 10 Nov 2024 20:08:20 +0100
Message-ID: <CAMRc=MeVHx9u0oDT-cgRir474owqwPMzgBiPW9jFRbdYjnXbhQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] gpio: mpfs: add CoreGPIO support
To: Conor Dooley <conor@kernel.org>
Cc: linux-gpio@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 7, 2024 at 11:33=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> From: Conor Dooley <conor.dooley@microchip.com>
>
> coreGPIO, which the "hard" core in PolarFire SoC is based on, has
> different offsets for inp/outp. Add some match_data handling to account
> for the differences.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  drivers/gpio/gpio-mpfs.c | 38 +++++++++++++++++++++++++++++++++-----
>  1 file changed, 33 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mpfs.c b/drivers/gpio/gpio-mpfs.c
> index 3718121eb97a..4aefae05a9fb 100644
> --- a/drivers/gpio/gpio-mpfs.c
> +++ b/drivers/gpio/gpio-mpfs.c
> @@ -10,6 +10,7 @@
>  #include <linux/errno.h>
>  #include <linux/gpio/driver.h>
>  #include <linux/init.h>
> +#include <linux/of_device.h>

You don't need this. Include property.h and use device_get_match_data() ins=
tead.

Bart

