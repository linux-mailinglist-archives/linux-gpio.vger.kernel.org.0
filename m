Return-Path: <linux-gpio+bounces-22786-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1611CAF8B75
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jul 2025 10:27:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1BE98B42272
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jul 2025 08:21:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48C44302076;
	Fri,  4 Jul 2025 08:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m7Dxg61r"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64A8302047
	for <linux-gpio@vger.kernel.org>; Fri,  4 Jul 2025 08:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751616371; cv=none; b=o73h4u1uC9AGURfNsJDwbKtpAQ7f1w1Qg/cahnxEyPi8Pot7qijakah7yX+n8GFRj2FqNYtIpk2zxx5qodBhwcSW4nH4pcJVbHNIrzPgyk6LEwyw3oMdDw2MKhIpy9vbKo28b4lyPmv1bVf9XYhCdWqNhDSvxomA9vjXjwpmoRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751616371; c=relaxed/simple;
	bh=iYjHFLywNzV7OEwa4CTvdElL7MT4P4TG7dHCmKKDGj0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J16fk3ocqYH/RzZQHZ4PM/V1S8bGC83JKba/CclII6xkFPnY7xzEKxB+uy8SatPapsLOalItaJuBmpJy9vf/ZlwmwoF0qar/J3bupUMlqQQ/u/E1qgn7txiTpMagwhe9F4iO4n6vI/D/Kd7qjz0iizppRjyP0uwcilN3OLqccUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m7Dxg61r; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-555163cd09aso665499e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 04 Jul 2025 01:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751616367; x=1752221167; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iYjHFLywNzV7OEwa4CTvdElL7MT4P4TG7dHCmKKDGj0=;
        b=m7Dxg61real4fJueBgaPfG2/AADLuxUCOuhnDiusCVpU17bM0s/Jdh2zpU1MbTEKva
         J03l81O71o9+e+t1DP2Nf3n4GN+QFJ42jhkwxl3L8Py4XyxorjD7MdpmzUh+OMadllou
         N+MWsBZcRqNYZTNckUyuk0EVEGaI5dR9nytOb9R8l5vobGymJ7RoV0E3qCpaCsQpOb8N
         FrZS1cE3mK6Q2v6x1a/sHoH8HwdxtakE+9pu8FkDyqxjCjayV+X2zZ9AbcL4qeSJgmdr
         ck01HYfxE17uMrrIWQOHAAVlKuXLoLwEAplA2KVo9Z/L6rQIF7Qyn8ClhqWvjJFR/sJv
         NZJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751616367; x=1752221167;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iYjHFLywNzV7OEwa4CTvdElL7MT4P4TG7dHCmKKDGj0=;
        b=hLj4cPXlEZ97bJH8oXsyWRyEnB0RA+LsmfSK/X8/1MAdSBoGhOhtISCIgd42yNz40D
         r2hoD9jzec5qfX9HywmX6gwRCY74vXCKdR7lEYL4NMrT/TVXH1xOYyQeGanYJnZxuleC
         aFJVGWfFdXhBqJQg+nhnng8l/3cklMPae1whbJkWKTLdY3Hb4+BInJ1/w/0+XehtEhaD
         odmUhRA2kVMJ5OIcUiZ0KIpcgeW2zdVdAUfljVcqwOr7JxyM58hVV9FVQK8WlFBOd/1q
         r05vFiTTLWvdRhG5dIhOZdI3Cshma7OGx56ajv2+wvedRhmBGl+XkEo3hvWQLBGEepKz
         TRrw==
X-Forwarded-Encrypted: i=1; AJvYcCUmj9cForJKhP1L+p2l5WNx/1KnyzmV+/WRxM0hE2PO9M85FMVfKP7qlOrf04g8X/SP7fW9xo5kI26n@vger.kernel.org
X-Gm-Message-State: AOJu0YwzJvjvMX20boGLgk33AL1Z6a4BGxhZLvnyOh+RAnbPdNHIzeCZ
	XkCzdaCwBSmxZS8uHSzYNEsAYlSAyq2Bgc3VR/mRSk8yuhE+lhu1GyjYoeb/JCw6KuHo98IiQ1K
	Gxx9toTpYoDiomiPoWflMxG6CyGNh1NLfT7Dq+Ub5PQ==
X-Gm-Gg: ASbGncuyvsUCDqXXeDlHUiXmJz+u9AA8kbQrygejK/yDoi7m0+9TyjncqEhij7yuX6Q
	DCjYTbBgvjpM0C5Yqjs1+ffGNG/2Lyd6u0fffiUgS26x3IqxnHjP0AVZwTRDM4uubC17KV3QTYv
	QLG6v6pWnfzGvminXkBK4RVx91TjEjmG9HLGAW6uk6LBk=
X-Google-Smtp-Source: AGHT+IHIdKRqrobIs7JkcY2DmFJK+DrHWeLwNL32NlyqRbJB9YUEeji6aqqcPI/LdM/czsecMqh3fHpNhbAd4cnlP08=
X-Received: by 2002:a05:6512:1589:b0:553:2e37:6952 with SMTP id
 2adb3069b0e04-556e73fd335mr433200e87.55.1751616366867; Fri, 04 Jul 2025
 01:06:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250630-gpio-sysfs-chip-export-v3-0-b997be9b7137@linaro.org> <20250630-gpio-sysfs-chip-export-v3-3-b997be9b7137@linaro.org>
In-Reply-To: <20250630-gpio-sysfs-chip-export-v3-3-b997be9b7137@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 4 Jul 2025 10:05:55 +0200
X-Gm-Features: Ac12FXx4FWu-wxT4lMUgSqCnMbYqNhJBpHAH0TrYnyEPKzhBOIXHuwpVv46xut0
Message-ID: <CACRpkdb26XOnUyNm8-8=iz4YDynkGp__jQi_kvnX6KgVNoAyZw@mail.gmail.com>
Subject: Re: [PATCH v3 03/10] gpio: sysfs: only get the dirent reference for
 the value attr once
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, Kent Gibson <warthog618@gmail.com>, 
	=?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, Marek Vasut <marex@denx.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 2:37=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> There's no reason to retrieve the reference to the sysfs dirent every
> time we request an interrupt, we can as well only do it once when
> exporting the GPIO. While at it: change the name of the kernfs node
> field to value_class_node ahead of adding a second one for the
> chip-local GPIO line value attribute.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

