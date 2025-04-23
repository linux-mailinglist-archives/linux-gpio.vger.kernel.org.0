Return-Path: <linux-gpio+bounces-19211-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D480A987FE
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 12:58:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43FEF3B2581
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 10:58:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F323526C3B7;
	Wed, 23 Apr 2025 10:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UHdBjfPg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0068C2BAF7
	for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 10:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745405912; cv=none; b=Cck/zQwm355VLDXBUr5ZhrBA/WYhECXpAv6E3HBEhvBazaJfjSnF/V4fiflszaUM4WjkqKnnpnogRKwcMfwqVpToSrPYbcikHHiMcXvD7VB+aNpAw+ohstaoMXfq1Fe3KL+L29RjBVwfPhMGHHuYx4mqGDPxDdyX7HwmaIwnyKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745405912; c=relaxed/simple;
	bh=uwmcdLotwKHbSyuTnYS6H751riUvBNfPKy6nA7rv0do=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HDrfmsclV49iv2wiGDaePainHGFtdPlTdDFyCaeaoTgxIQnNZf6W4Zv8wBrHei7u9ROrY4BWzdy/7QzCeDOjOsm0Q8QpzmADTNDvL8wA2aB51YeP9sC1bGvTSf1vg8G3JmP2YhzbngVm8eDG/hhCRQDYz7p6Zp3InUrhx4LAO74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UHdBjfPg; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54298ec925bso9178634e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 03:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745405909; x=1746010709; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uwmcdLotwKHbSyuTnYS6H751riUvBNfPKy6nA7rv0do=;
        b=UHdBjfPg5P1zHNPre//FyPAD++IeWIJjK45MNc6nIm+WWgGVThu7O21Z75HIGiq2f1
         +2iY+SqUAOOmO8Fr5pTHIMZfyr2DbF5QbDELNDPh+JvVbFhvvf/qkFa+G2rm7JMYMsvn
         ySmxoJM79xSiJDgB2b1lzA5ATdBgPrZW4bPvbe0/5XaHiKW7USYm9TcW353agdy2ZPsc
         /lpf6rKlz5n/bsoSOkZsPRtjxTIXtSqTNWYzkOfUH6+DuweQZNASPG+fY5tUGvQdd/xm
         2qaWEcXq3f1zpGenk+g6zA/l4ZNQOm76u3zAGoCHwj+6I1G+J//dc1/cJeRxyAWHmxVF
         dQFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745405909; x=1746010709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uwmcdLotwKHbSyuTnYS6H751riUvBNfPKy6nA7rv0do=;
        b=THkGnnRcrnhyBLXbqdZCI9iDcu3IF/z3zL0tAYnHZyPh31ZTzDFaikwQReIYjUzpk2
         jKXpI6XePQ9FBi/QItbNC8MfRL3mrU9tppne+GjaCAfay0Jfjc2hAn8GUW6pMZpen9oI
         DuGnr4tQO8pEt66CPJFaRPVaNE2I3OVPiPM8y3/5lysnBgd/iQqmxAUmL5WsVlpOYpgj
         pe4m/eSJ4muuWTzGPC65idj7lOAlxue41zsdm0BZYhMHghHYHYYtvxI0C8+3lFcEB0Zd
         w+a8mKlKKLC1DgF81P7Sdj6g89DsiaLeQW88rCLEDSDzx5hiUVqpcUldtQtBDnropB9u
         4EUg==
X-Forwarded-Encrypted: i=1; AJvYcCVE5x3CojYr/wrZMtuQOAP4N4ZuyF1+6e07KzXD8iFpYA/X+n62Y3SXCTVf3LALgadoKgc05xKKSba1@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg2uHBYL7KsqCDl3Yvqg0TkKcVRFU75KRLe9+bKUbij/LmmiYM
	GHtyM2OMrjlLKk3mMn2c60i3L2M+sdEzsqBJQz43SbVG1PQq6+wZ6wasYOI5MKpuiPHnO4FU4WX
	JuDvG3PS0GFuiA4G5NwzFKW/ZXkWZE1GonRLdu0dmUCYOcq25
X-Gm-Gg: ASbGncuLs662xZF9e0JuQUrkmIMyRWwzGJSRileLHGmfVFcfbL2UAuWSjEtfeDiXA6n
	1SqTHfNbFDIVzX3mqSkD+LHdxi0Q14wKXQJB2ef2kdnkCnDNiXlCVXzZFHn8y7O7rtF17n0AA2i
	9XTV8aTW7xORk2kH/iXdiSWiZxrK2O0FkM
X-Google-Smtp-Source: AGHT+IEjS24jEIugO55xavRjGHILXYER6m4q0amlIjqOd7Xvxl7wCjNSGFGR0t0e9qberyDj3AV0pmDzW61zJwcHqaE=
X-Received: by 2002:a05:6512:ba8:b0:549:6cac:6717 with SMTP id
 2adb3069b0e04-54d6e6629b6mr4831840e87.53.1745405909021; Wed, 23 Apr 2025
 03:58:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423-gpiochip-set-rv-gpio-part2-v1-0-b22245cde81a@linaro.org>
In-Reply-To: <20250423-gpiochip-set-rv-gpio-part2-v1-0-b22245cde81a@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Apr 2025 12:58:18 +0200
X-Gm-Features: ATxdqUGeqKFeiJHfrdFM-E1Ot1VyXqrfMLSq32rxhf_gi-bzXxhhSJyFayC6FXQ
Message-ID: <CACRpkdYVf9C+QZjFZZ9J96FRtoS8mowzyrmCcYmvV2uGTgcmzw@mail.gmail.com>
Subject: Re: [PATCH 00/12] gpio: convert more GPIO chips to using new value
 setters - part 2 for v6.16
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Lixu Zhang <lixu.zhang@intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 9:15=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. This series converts
> another round of GPIO controllers.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The series:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks for your persistant effort in fixing this!!

Yours,
Linus Walleij

