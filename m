Return-Path: <linux-gpio+bounces-3603-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 672EB85EB6B
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Feb 2024 22:55:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 209B9283539
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Feb 2024 21:55:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8045127B6A;
	Wed, 21 Feb 2024 21:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="drqEE/Ra"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D023810953
	for <linux-gpio@vger.kernel.org>; Wed, 21 Feb 2024 21:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708552512; cv=none; b=lbXuszJJ51EnlyhYrKJvcWNaqw/BBBN6V3c9ArEw6pN2v4TBR2v7hpIBpMIhm/UE9vR7VW9biatgglZqI008FD81zGYSM5ijoIZNCgFxGqCiuw7RgM8i/Jcj5l9T75o3y1GLflEIk+FAGZHejALXjUbYffTgtpRzl/5hgUzZNh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708552512; c=relaxed/simple;
	bh=vWHrhgI4Kt8kGUNcvtf3QHT4fPb4OVK0J5B/aX4bSNk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=daqc0qLl5OJLGnvaRAQ+MLa3R9HqyiBhPvI9IUp1vx8lSESIzOqRqf5k2N1oMDKhRI0cPcaLApaWx9GRo1cJQ5YbhizZiNs6kVbwWj4O/JRuDj4zDBpjcqP8AN7zgO9W7dDKUZvT1bFr8R31ro32lyEzuDzHBemxsdwEsPmVpK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=drqEE/Ra; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-607dec82853so68133367b3.3
        for <linux-gpio@vger.kernel.org>; Wed, 21 Feb 2024 13:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708552510; x=1709157310; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vWHrhgI4Kt8kGUNcvtf3QHT4fPb4OVK0J5B/aX4bSNk=;
        b=drqEE/Ra7/oHoShJ7/NZDmAVwtS0BWeyxBhhJ8pG0Q+hfOT7/RkP1v4BPHiKR0l+TW
         2pEHKFm5WmwIi9za/fv4FYJimgSrIxuuEs/7MGdBTLj4f3X7E48RBGOjLOwBhjpAFduM
         42tjxlzb8MDXXHi9bR0NOa27f6f6ILYvFdV2v/Sa2UzsetY5ZWkpMYqftkKJqXbgtauK
         WORIW/FkuPGeVWFU//sFhGjZs6bd231h00u9XX95CqEJaGaWxRgtJCStxG/IDH8qVDmH
         Hh9nB/0AwHVFxofSGBzQyKaoahb+eCHVljS8/7bqDQu4+VFfhZo4a8EYIDrzh0t/bdJQ
         lA+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708552510; x=1709157310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vWHrhgI4Kt8kGUNcvtf3QHT4fPb4OVK0J5B/aX4bSNk=;
        b=lsh8vSBxYJIaSdycoHUBdg2nG1OJ4DMGcC2AGOQQkgaOiV9qGhOT2Xu8xsxiBESFdO
         XL99Cin4Eqnz0Ay6e4GbByagLf7n3wSC3sT66ap/JftktwBCyYlqaqVQmv2O53kZgwWu
         POGVNSe0qgPkrptruDD3HbFKZEtSbsmLFJeCkzXjk1/eJTp9kmoEhJNxxgxyZE3QFjnJ
         0sD3UlXjV7jIkZ1OyzwXFB9IxYjBY0pQatr6OZV2XSYHM3TXB/BVndsFSozqSHOK4f2F
         P7tVbJYSIki1kBQtCI0vPN7Z8Nb3SQfinb6FFsEvcZiyXEoTsOz7LJ0rNIoUL9By8Eds
         cqqw==
X-Forwarded-Encrypted: i=1; AJvYcCVPOTUNXdW1XqMTlu4IM6fy3O3d3+oA+Ijt/o6gzs1qDSNzdYMXAoj0ZXbMtSV3Z2VghDKMXTASN6XEbhwv+x0yOzDfSFw8vvSnfg==
X-Gm-Message-State: AOJu0YyWk9bq7ZUm8LQus4vIKsNiX5J2B5MjxT3sSoxdc9jaWcarghEM
	Fq7z1nsPqZEqo9nZ1K/z0cA6BA/G51N5FxR/7ctLIkkejctk1MLOjILCDnsNkT+mDLGNQ48JkTb
	BK2Sk9PwbgmJTPw+nfsZpZXxDchVIM1QFeDLiWg==
X-Google-Smtp-Source: AGHT+IFG7OkXBXjbNPYxfp6BSZzFgHptfq8O7pHlOruVpRLafhQo6wGBbhxmoAykBBf2wzpi0CwmDlGUgveqYfQh/CQ=
X-Received: by 2002:a81:8341:0:b0:5ff:796e:481f with SMTP id
 t62-20020a818341000000b005ff796e481fmr18807228ywf.11.1708552509905; Wed, 21
 Feb 2024 13:55:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240102-j7200-pcie-s2r-v3-0-5c2e4a3fac1f@bootlin.com> <20240102-j7200-pcie-s2r-v3-1-5c2e4a3fac1f@bootlin.com>
In-Reply-To: <20240102-j7200-pcie-s2r-v3-1-5c2e4a3fac1f@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 Feb 2024 22:54:59 +0100
Message-ID: <CACRpkdYSw5_70H4k5ZX-stCU=CH=v_0Ggm+R+FSBhdbk6mnhOA@mail.gmail.com>
Subject: Re: [PATCH v3 01/18] gpio: pca953x: move suspend()/resume() to suspend_noirq()/resume_noirq()
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Vignesh R <vigneshr@ti.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-pci@vger.kernel.org, 
	gregory.clement@bootlin.com, theo.lebrun@bootlin.com, 
	thomas.petazzoni@bootlin.com, u-kumar1@ti.com, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 15, 2024 at 4:18=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:

> Some IOs can be needed during suspend_noirq()/resume_noirq().
> So move suspend()/resume() to noirq.
>
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

