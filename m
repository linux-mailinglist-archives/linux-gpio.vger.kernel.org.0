Return-Path: <linux-gpio+bounces-15949-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E52FA34DCB
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 19:36:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DFF34188F018
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 18:37:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 703D02066E4;
	Thu, 13 Feb 2025 18:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="2RE8o383"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F6928A2D5
	for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2025 18:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739471813; cv=none; b=OvoCW+DYuzKAMoJxBupshYtTX1IOIrb9Q9iZ5cDk0/17MOJDd07e0GhA9s6aNRKBFYVuSIAq5QiO2ls/FNJM8oEHxZPpza7Tk+fmsTmBCw4QYfpco1hVunRWWMrFErba2LKl2vNI8AzG+pPQLgw6olNQgbaN1j0ZnwOZV6532To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739471813; c=relaxed/simple;
	bh=6MXgt8K1fqxe7oAyzFvQ5u+fTJ1UmsA6LGu4qS+I3xQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DbZs8cN+e+DBM92xCVsCsQG+ziKMLF6N7j6CK7Za4SDDA5a7T44ximxUvAEH0Vnu1n5PHpwmrZ5b+PTnJhawE2sl9FmbEQ/+Q3ZSBEti+287Wcg0bKR7x6pxUULPo8x48wQfXgkJtZwheRQuCLwAo2QiyOWcc2P+ecBLaFeV5qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=2RE8o383; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54504f29000so1206878e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2025 10:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739471810; x=1740076610; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6MXgt8K1fqxe7oAyzFvQ5u+fTJ1UmsA6LGu4qS+I3xQ=;
        b=2RE8o383D4d5qr72Hat6ZKDB9v0NIvT04HN0J46o8boFIAr0RZtzmpITtxG1+yCBEg
         JozeQwUkpSp80mcz/7YGfRvrs6rqQge70wz5oBxqKhqQBo3zPz/G49u1ncaiYEJXLZM7
         5eYVZmSiWOe8q/bPGC4sQ6TQ9fd1LbI7zhEV0zgkjqHefoIeXG1F1duau2kuTP4DMi6p
         c0zxpliv7nyHg7vyWB9RJz6Us0AjbNP+6oCbE9CCSPDE1xm/93RwC+0tPYu7PKPdcxBz
         3TyrTOg4ydRTEnc4AbNoccNHWGDSK1acmHI3wLeaqRwtVlgg/weN3w0OcyeXfVlTLwCF
         JRyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739471810; x=1740076610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6MXgt8K1fqxe7oAyzFvQ5u+fTJ1UmsA6LGu4qS+I3xQ=;
        b=QuGJxHYnajtB+oNAA31lytdx3lXH0id0BQwPcz1qo3sQpIUxRgZk2GpL/Vx+KtizJ0
         xwoE9lIl091uNgW9FIGAcrrosH22AAHeLNXW7LyIttVQIHKX51xU9cO1ycS8Tt/BuUKB
         YWJxUFUD6239EC/7eTFbQDBvtEKPBX/Fo3ivlzmFLr/NIDM5U/ma6TbBry7DbIrZQKCH
         XdI48s6YG0yeQQasbXSP8ZJMn83tuxcyxINHCLYIviRoqvpXzLeNeTXWu9wHl075x1GZ
         5erN6OfRpYXq8Ji/hDcdfneI6Ab0o9gHOSgpYLbNE5aasKis+5FeSB0S3pZICIEEaOOu
         Pglg==
X-Forwarded-Encrypted: i=1; AJvYcCV/2Wd8Mkf6CzrZMYlHve2kyZr4ucHrT2k0I/sWUSA+zucYRapL/JGg8l3EI2EQJayVsm7PStGHV0li@vger.kernel.org
X-Gm-Message-State: AOJu0YzMNVff0SAlHbLN0P5A7wWj/Vfb5Iag1xu9ZtEs3CIi42PA+cYY
	xRzTJkKLuKy+hUENq+hswsPOsbxgDbnxOFRJ6Up23UPSRt40dgQAmP9cnpQQxUq/zN9P2Ff1REF
	Q4jgd1Pa7cpBoxkuA9khCJnKWx02kh9903L1dKw==
X-Gm-Gg: ASbGncsvbwjWehJwpPL8BPGcvHeShLfpX3v1ka+keFd24ImnXtLeDhvtLXI+UcgVhpZ
	P/4dXMaVp80WhaQjXO5oZqF34t7tX9b5rAfj9CZuk3l3Bfb3XwOGxqlrU2ep/Wc6FwQYI+E1yBt
	FMwSwFU8nEGJCibwxCV3w3ppf91yCJ
X-Google-Smtp-Source: AGHT+IGS6rZ5QoysfkI0qHoJmFvWRDPx9d8qV86s8a9//PI16K2BiXEPn/UKdP9YO5UDgyQ2advyGUV8KL3E064dBuY=
X-Received: by 2002:a05:6512:1195:b0:545:9e1:e824 with SMTP id
 2adb3069b0e04-545184bc12fmr3451856e87.48.1739471809751; Thu, 13 Feb 2025
 10:36:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250213182527.3092371-1-andriy.shevchenko@linux.intel.com> <20250213182527.3092371-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250213182527.3092371-2-andriy.shevchenko@linux.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 13 Feb 2025 19:36:38 +0100
X-Gm-Features: AWEUYZkqCv_yLp89wB5ocJkqXxJ0d_HsrRMQvT3Q1hOD30OWbUeTKkdx_i3cu5E
Message-ID: <CAMRc=Mf0MMKB40gC1hJLwY1i1Bjj+aKKDfFN9sYUzG_Z5Hu1iQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm: Move for_each_if() to util_macros.h for wider use
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Alexandru Ardelean <aardelean@baylibre.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 13, 2025 at 7:25=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Other subsystem(s) may want to reuse the for_each_if() macro.
> Move it to util_macros.h to make it globally available.
>
> Suggested-by: Bartosz Golaszewski <brgl@bgdev.pl>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Who would pick it up? Should I take it via the GPIO tree and provide
an immutable branch for the DRM tree?

Bart

