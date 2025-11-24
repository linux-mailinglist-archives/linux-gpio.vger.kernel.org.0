Return-Path: <linux-gpio+bounces-29005-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AB1C7F67C
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 09:38:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 14EFD4E39CB
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 08:38:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E80502ECD14;
	Mon, 24 Nov 2025 08:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="e/gOvjmc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D44F2EAD1C
	for <linux-gpio@vger.kernel.org>; Mon, 24 Nov 2025 08:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763973508; cv=none; b=Cv9oqXU4ZMhOW04M0XbQGsXUYLshddECSxSmVfLVHo9wur6DDThlxSFLCf0gv1ORtmVacA7g5kaAFUsDNYkX0kjJK6Mrq8JS5NgeJROsg/QAS3Kde4/OGAWmcTAR7bvQk7cNul6qL2Ee5srQs1zXXqhatuuqLQAdSi74snwgC2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763973508; c=relaxed/simple;
	bh=A4ko1llTfnMpZKhwN6XAGIF19i93xfliAblBu+9SIoA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kEd5IyawbKIUAt3tu5x0Yqg2q+9YTweu24NIfNtuveiRFJJHBqORxFcsz54goIHv+/ao1bWbjfGISyA2yVn2//FfWs95ZhS8oHtask6ugJopFdHc31U4UZb5DEiqX1VRB5b96sgI2OjJKmXWWWVUzsX0yM1vesxhUrP29XLEKbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=e/gOvjmc; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-595910c9178so2633889e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 24 Nov 2025 00:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763973504; x=1764578304; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Ya6oXSuW5HKGVZ0GUoG6QlLfgFpzkuWfKoJsDP0RZ0=;
        b=e/gOvjmcirMdLpSd1+COw4etcwgdEoeXYLos3MvMPScXWOFLRmsdXgUx7gI0ZsCf91
         rAhmaRSMI5jE8cZtZOHgTeu3GMacAM4KK6q74Cjg0sNQWDA7iXgFpSq6+fEaH3i7KxOT
         k2bN9h/QdEjzJo6rUjX0OBNxVz8WiO8iVM2XK+kDO5wIUSqz87Y2t5Wd1/wJ4bUXq43M
         SKVMZEWZ4ZRZB1kWHs9GAqg5XxtYcJmGGBKzxNTtpvJpkeY9P5r1OIUP0IWA2Eul4m19
         /9ceC/0UklkJkf3jfd22VVh+OKHpz0PYc5GMY+nTRzaYgImtWEnOh9YZU59WBtQgkuvx
         h4wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763973504; x=1764578304;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0Ya6oXSuW5HKGVZ0GUoG6QlLfgFpzkuWfKoJsDP0RZ0=;
        b=uuG6re1UZIOXPTnuVpXGKNG/NzfiPfN4E3jEwUCP8jA5WYsXqQGhuIi5z/kdNhk6rX
         DxJ5f/Cv77NCwKSr3ogKx9xU/PiAxTm0+PYqTWeToojHGE7WmLglUGGci2o9Do9VqTFL
         xXrPXrOzUEgkchOZAoPHpRIDYNsiEn1sOuFbWpJqFvKQmTJ6d3J+2PFhdqdmWvIH7oRU
         QUNKpVw99UkHH8XJiiOkJIZgSJZVBhxAvK9lF933IvPelPwVg795dLZb3harfaHmX2WE
         4cMHsBDJKKUKx1fBxqByLEtqhOV3nQ5Qh2IijbAEMqinJORHMzZ8VGxTk60IBOX8l3OV
         rK4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXczcX47pqslPo5B280JxBRgzvNARKBhlARnQ+76cLdkaEksgWV+8hHDrrWhZ9HwQPky4hznUAg+2di@vger.kernel.org
X-Gm-Message-State: AOJu0YzyeVCQKLolWTHSzgTMKzcqsGS5btpJYhe99dFfhbPOs8QAfpfa
	46bIwB5IJ3szit8TijnBGvYTOn5SHkikYYQlu8Bqx/FLxX8CvZ516Zp3KT5IlwhTHg4ajUCMyvu
	5zjHt2R1m+pqfOIn5RxBP0Ti5Dw8YLcuMxpg2g9DeGQ==
X-Gm-Gg: ASbGncuuxBS4UksYWKP8NK2zLIeuCEXPjGTExYz8wjHpxTiaV3s+u4WRsODVqvB1ZjI
	7KsjfzL4+wq0sGPvDTw6yF9thmDTCdrgxWkC48VrsusmPS2uChdDlOqlLdF+4QFh7R+u4cs2ih9
	ohSYShiwS8rSe/eCZe/eWqb57zAI8i61UeTTglbyivbHQRy5aRyPqfg18XqPKtYpT4FpVihixT1
	qQmHROm79ILy6Z7fQXNsBdz1bQ3ywohfKpIGq7f2hp0tCMN7Hn5gfqOI8xTYRCTsoLFqHBhtV5A
	DOwdt+hjBehZ003VIx69jKj3vbY=
X-Google-Smtp-Source: AGHT+IHddP45Iw1u4x5gRhDKYJif/xDaoPtzoUcfY5zo1vTJhPnOEF4e60BFJI6rchMqF8oMYnvc4vWnv0O61qtodtg=
X-Received: by 2002:a05:6512:110a:b0:594:253c:209f with SMTP id
 2adb3069b0e04-596a3edc91fmr3270301e87.39.1763973503967; Mon, 24 Nov 2025
 00:38:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251121-gpiolib-shared-reset-gpio-fix-v1-1-cf0128fe4b47@linaro.org>
 <be7fd390-e81d-4e93-880a-1b6404398408@packett.cool>
In-Reply-To: <be7fd390-e81d-4e93-880a-1b6404398408@packett.cool>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 24 Nov 2025 09:38:12 +0100
X-Gm-Features: AWmQ_bnn18M7d0OcQOnbJTJz4lGmLFoHp7b-dn-7mGA9R5vcmt5vBbCxue_57oU
Message-ID: <CAMRc=MdW3AkkivE=sA4STZAmmee7bCBkD5oEsXiRcKA80Ggd4A@mail.gmail.com>
Subject: Re: [PATCH] gpio: shared: handle the reset-gpios corner case
To: Val Packett <val@packett.cool>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 23, 2025 at 2:03=E2=80=AFAM Val Packett <val@packett.cool> wrot=
e:
>
> > ---
> > This is targetting linux-next where the reset-gpio driver is now using
> > the auxiliary bus and software nodes rather than the platform bus and
> > GPIO machine lookup. The bug is the same in both cases but the fix woul=
d
> > be completely different.
> > ---
> > [..]
>
> Tried applying only this, as well as this +
> https://lore.kernel.org/all/20251120-reset-gpios-swnodes-v7-0-a100493a0f4=
b@linaro.org/
> + https://lore.kernel.org/all/20251121135739.66528-1-brgl@bgdev.pl/ (on
> top of next-20251120) and the issue is still present.. am I missing
> something?
>

Can you try this branch?

  https://github.com/brgl/linux test/gpiolib-shared-reset-gpio-fix

I confirmed it works on my setup and fixes the problem with multiple
users of reset-gpio AND shared GPIOs enabled.

Bart

