Return-Path: <linux-gpio+bounces-3652-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CDA85FBF2
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Feb 2024 16:11:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6B2A1F283C1
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Feb 2024 15:11:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A03514A4E4;
	Thu, 22 Feb 2024 15:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="UwkIsLyk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57238149013
	for <linux-gpio@vger.kernel.org>; Thu, 22 Feb 2024 15:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708614687; cv=none; b=CyuovOuNGibGuuQ457tTuiCWrVNVJoXvK9AzpEm/brR8EylMSMeXcSLeYVuz1Ke8j0TkGP3/8ifx5YGNG3MgwWvua8Wn6CdjoykwNY1Axx+tmbRQh6IfaLeukpcM0MqBKeZTYDnUFu0W5n3H5t7jhz3PYkg9DOO4TgaJp1blQvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708614687; c=relaxed/simple;
	bh=E0AvIIn162mSDyZwPDTo2b1xyRz7jAaOfrYbNUsD19s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d0gJ4kpxExhah7p4HVGTGBFUGZibWbzNeYcpy9EV0xRw/djZWi/tvuk0Kozs9kUh7uiv6xDJKxWlFz8IwlAYh4ydQ2GfvwdFHsW6snsiAyv6R6U4YnI27vV8BaTfqpI/8aMb3m41j4vNkv1InxP8N1PE+iDAQHMH+VrJjv6pEJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=UwkIsLyk; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2d204e102a9so101390781fa.0
        for <linux-gpio@vger.kernel.org>; Thu, 22 Feb 2024 07:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1708614684; x=1709219484; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+1MyTAa9W6rwmrz4X17WTkjYYC8wuvxkD+qfkCmD8gA=;
        b=UwkIsLykfJRFNvIHoHGBPHMNOiHcdcQuVYCHaWoS5aYxT5Ka5iGYvLPTlpAaP+ej2l
         LkSANWN1ECg+wxpZc13XRS2NPCmfmdUMvRLiA3BV6HEdlghd1rdFyBB9kG3FgENyu2l/
         s2QvMk5J6v6XoSo9GqdOHWlQdTP/C8L3G6CQ2CKe2UVU1Lp8B5PacI1vk4kwZjZcgpnm
         ofl2c4aUnIHqRT6ifeTSNvRL1QmW+os+Fku/Nz33UOl8QJBgkr+rn2oI8K/hKqFQpmoq
         gKuDgoTMhWmU1ZnRh2GxW1UVcfpmHgexdkEe5WeeSEejr9sClJ5ibqIctcgrIy+95J+u
         C4dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708614684; x=1709219484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+1MyTAa9W6rwmrz4X17WTkjYYC8wuvxkD+qfkCmD8gA=;
        b=II0RHK2sbXfA4GTL5fTBuSqQ4WH1u2jEmyLvUuwPQO5bgicAR9hhhrH+ghBvkRfv2v
         NOLgB8AqRi6cBqeLicbJ+yhwVk8dXxGEU4w3Vfg8+/DGKcf1cvVajmYC34vEabNZKinT
         9I5cBHsJNQILH2CD1pN338APDKO2+gDYxyesof7L/OfCuwCkWUnGycb9ZbTcjL2MDP1b
         4PgxQbDmFCkM63nxbD8Vt+LMqxFCK4gXBRhQ4V8pFrY2oiwDNaM/P/t5fLxYAch6NtzJ
         SvPlHCn0kNdcwilJo8YEB7W4xOhEcqpSNRIo5G6HMPdBts+h+KtZJOns02lr1NYURZSl
         dTTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtr2hVRQBykZJHLaHZO7c1qE2k571p81lY1/5QHCyO2qF7kcIp2qsekFIaUgYt6ucj59BPq/4TK4C+ZrfZKL9WU/qa0Cbh4YxnUA==
X-Gm-Message-State: AOJu0YxsMII8/14V9WgyRiyyJkboZcL5MambNtEdAyW95HIXRIn0YPSw
	rN+Ne+8LJQAwQvfhWvIzlFab7RevNoC1Xi2UIJFOfKxopiKSGOOy1zQ1BN9ZLwhjykPjAQkLfJZ
	r6Xq+2nOF/F8bounWVFDMngz9nFYtPbtKNUfUYg==
X-Google-Smtp-Source: AGHT+IGw3hbqPWYN/3vfhhQBFzrTvi1PbeoR9WvH0886TzS1KyGrr602I8E8lLCB6pIuc8bHxZF8tDM1xPYr0gG8zd8=
X-Received: by 2002:a2e:b166:0:b0:2d2:6002:c239 with SMTP id
 a6-20020a2eb166000000b002d26002c239mr1510902ljm.3.1708614684451; Thu, 22 Feb
 2024 07:11:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240222145838.12916-1-kabel@kernel.org>
In-Reply-To: <20240222145838.12916-1-kabel@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 22 Feb 2024 16:11:11 +0100
Message-ID: <CAMRc=McWhC0ZdR55TMkkdVov=dwT0=H-4_c4J-bq0quRpvyoBw@mail.gmail.com>
Subject: Re: [PATCH 1/2] devm-helpers: Add resource managed version of mutex init
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
Cc: linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Lucas De Marchi <lucas.demarchi@intel.com>, Oded Gabbay <ogabbay@kernel.org>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Aleksandr Mezin <mezin.alexander@gmail.com>, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-gpio@vger.kernel.org, 
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-hwmon@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 22, 2024 at 3:58=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.org>=
 wrote:
>
> A few drivers are doing resource-managed mutex initialization by
> implementing ad-hoc one-liner mutex dropping functions and using them
> with devm_add_action_or_reset(). Help drivers avoid these repeated
> one-liners by adding managed version of mutex initialization.
>
> Use the new function devm_mutex_init() in the following drivers:
>   drivers/gpio/gpio-pisosr.c
>   drivers/gpio/gpio-sim.c

Yes, please!

For GPIO part:

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

