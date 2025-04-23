Return-Path: <linux-gpio+bounces-19223-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF9DA99112
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 17:26:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6F0C461C6B
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 15:21:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D91628A1D0;
	Wed, 23 Apr 2025 15:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="RyAJMglp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51ACB28936C
	for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 15:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745421308; cv=none; b=Ik31ZbiZ0WKLcl1ocwmarnJyjChGqnsnemXmBzodTunNuXFE7NXa8mmwh9GQjX4Y9ooXZPPCFLeocIHBcvj6eMFkvI/Kx15FzbgCik9xII0mfQxfBXC8I3oUjysmpF3zbJ2bOkMjty2z/B79gnpXWr1sx033IJWJCE94Orirpe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745421308; c=relaxed/simple;
	bh=sH43wZDSA6ULvKiQsCxo4qPmgt69ZgTMoXJGnjlxiDE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DmqLTWZvilz8FiLkzRMvnKsVAmv3g2VMHNhSHd9hU1MhhX70EHZjQ0hnrY0qrZP1lOMpeOe4DCoidVhgSw73JEywAssSeto+O0qdpZoBJtAE/IV0ZyB/xrf3brAt3si4iTxsyq/ZnMzIEvO5OiuDbJvZZOLmirdj7pb56mcmtfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=RyAJMglp; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30c44a87b9cso52275191fa.3
        for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 08:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745421304; x=1746026104; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sH43wZDSA6ULvKiQsCxo4qPmgt69ZgTMoXJGnjlxiDE=;
        b=RyAJMglpEHtS0PW6fL7yx/lYL0EAkMS/JYwWjJcKJtUxZCThn9j7wR1GYt2QaUPV2W
         DuWsJGYR5LQOIhE+ddGughs8xQDGxtoAmv/sge6ZkTrGAxe/0u/KTiKJN51L4rnuKDzJ
         ra0z//UvW1zGyhHDDA1kzqM4ur69YyJ2kIfklqEd3WptPv7O/9jqo0YRqRTejWjDQbSD
         p9rFPUnnU9zxHcR5cbRvg4H14mxLBvSy8VYSijbOm/zjVa+4BF9LToX9IQchDAcH13D6
         C/9P0KsJPBg4/1khR7BC2Y4oHcvcDzwWpKvg8o6LKhMD2s9VNRgxXbS29BdFEsiOKLMg
         vu+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745421304; x=1746026104;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sH43wZDSA6ULvKiQsCxo4qPmgt69ZgTMoXJGnjlxiDE=;
        b=IWUM9KFLIjZNH+qOQNJX8qYRKn+FjJiEm77ZM0wmbw3ZJDBAOGMsH3zrxYHNnnD6H5
         R3ziAQSTEhyzh5nPt8tBKDfXIUk01cOV1t6Lr//ZBQDiDvH2xArPAcz6UDnRyhzNV8N6
         qSBEHGCxrheymrCOgrfwRV2DEr9Qmg1aWTulNXF/eBjdqwl1P5V3yemNkC1Dh8aLrn/D
         VorQdG/w4MC1ECnL5Ucxl9Ct2/0aAxCnqIHR5T4fOFU/CnN4zjbVTv2P5EgLd7rmn3zm
         jHqHNttmnIdyJbEGWqu/zkrUVsv3xxAzs7Unpkewd8Lwq68bZ9mBrhn5PnyyAZDYtHjb
         XYoQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6DWff0RWkY86iZTKGRjgfvlAE71nzilKhh18HJXN1uKZAsQVCB+omHOxOoULnGL8bgErqVmKxL437@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+Za6Z6rk/BYnNMNgd2HJgsPrrGLsPUGLIGoMB7ZEapRkY+Q1l
	Ub/76IEq8+kYCWJPCTwAhmdwmeJAj6CXbiN++gJyBUc8HXvCDuIapk+eizWn+mT/MQl1YuYf7EF
	05JN5cvXS6BVsXnF930RxNwUVknyRZa1kECwYvw==
X-Gm-Gg: ASbGncs5J/sUGjywZdwFAdJCRfAwr4ZuSDeJddwilVxJgcH/my/dhcXsmGj0uUuLkgY
	rhX5PBTFTV4a5fIEhtPfvx9632+SJieX1RLLlT51fOCbBddn1igdMIhcvcWXg3z14wc/JGsVlnG
	o4zcDFYx9SoBSrKpxG3K4oenlpW65RULS7/MEjakgq1zzRttXW8IcLbQ==
X-Google-Smtp-Source: AGHT+IFrc3N9fcKjWkQwInkGwP1iuM17+E4Bour+4L9YjNC2svIFlMVYhIXA3SO1RVqWs6dRS/QAl2y1mWeHhZ5nAD4=
X-Received: by 2002:a2e:a914:0:b0:30b:c91d:35cb with SMTP id
 38308e7fff4ca-310904c99dfmr62404951fa.4.1745421304301; Wed, 23 Apr 2025
 08:15:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408-gpiochip-set-rv-video-v1-1-200ea4d24a29@linaro.org>
In-Reply-To: <20250408-gpiochip-set-rv-video-v1-1-200ea4d24a29@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Apr 2025 17:14:52 +0200
X-Gm-Features: ATxdqUEaDlHUdTm4mGFk2lweVXhbcBmvMoXiFs3_P4h8ihoSePSMtu8I7HWwBPg
Message-ID: <CAMRc=MdYQ9zsOqiuVTR4vJ-D6YZ5gsxm6akQXaK6AoD_XFO0hg@mail.gmail.com>
Subject: Re: [PATCH] fbdev: via: use new GPIO line value setter callbacks
To: Florian Tobias Schandinat <FlorianSchandinat@gmx.de>, Helge Deller <deller@gmx.de>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 9:42=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> values") added new line setter callbacks to struct gpio_chip. They allow
> to indicate failures to callers. We're in the process of converting all
> GPIO controllers to using them before removing the old ones.
> ---

Gentle ping.

Bart

