Return-Path: <linux-gpio+bounces-21337-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A96AD4E5B
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 10:28:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78DBC1BC16AD
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 08:28:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F313723ABB1;
	Wed, 11 Jun 2025 08:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A3EkL1p6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3B223E359
	for <linux-gpio@vger.kernel.org>; Wed, 11 Jun 2025 08:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749630478; cv=none; b=Odxbb38nwA+tPWVdkBSIuvUXeoDWA/54D42tj1H1hMTXJ+JiRQ8+Dsm8huPN+beAh9b6rBo8xfXYXAmW9IyMy77A/HjAxI7wbyYZBWpS6yFyvK+KXpibZls69sB7vtUjlLJnzYOjPn4NyHQ751RWHlP4NE2EF8hzhTlE2LRdUjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749630478; c=relaxed/simple;
	bh=BD9LHPkDVStugrsPWLu1TAtW7O6vEYf/8WnFBw7eLDg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kVlhYV57gn2FDwtXPvZrdGjJxVE7wLtcCnaCxuj/qyCEMUY0J1+ddYVJ6guS30aedw0A1dAcg4eIwSu1vQNoh5xQ0lRcdRufDZ5/d0X9+SjzBy1m1s/fmvH5RzRcUONbdFcHfAgjrTy1cX0Qr63c3wUqPefEcZtjyI1A+4D2WZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A3EkL1p6; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-55351af2fc6so7672418e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 11 Jun 2025 01:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749630475; x=1750235275; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xLi4O+ULvnfNtNg6xLD2oflA5RXAT9+xlh/160huRoE=;
        b=A3EkL1p6CmMB5cplUEGzq906ZyukjpOSbUy3rUp6+CqDhHzCjm1a0DIq1sJ6t25lDG
         C1/z82enN+BbxGVDv6FnsUzOMsZZIgxiDqc2NmcauciibMEMFwAs58op5HMCOIDzYc6U
         X7jK9kVxx1LyHCgxqoccNIUgvdjVw04DyN1DLIfaCdDKWzhpN7Tzm6nrIVlrQPvAiryh
         9LyxTBRA17PkGmlLVfr28/eGSb1RoLQPxKHI+BIXCzXhy3yUUmn+GDQGRROso+yjTqCZ
         fWJlRegAG/fzrLfppm1TeyzsXyP0Fx0GzOIw9TCw7YzJUgOWst1PsZl1m50PNOdZ14+4
         iBzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749630475; x=1750235275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xLi4O+ULvnfNtNg6xLD2oflA5RXAT9+xlh/160huRoE=;
        b=KkRglwQBP/pJV/zB+V32D2/Qy131TNXhfUgsaEA0A2zN7L9e6TYJp9ANOzxLHLqIbe
         u5clmZBKXq7D7q6E2TRfom9ng4L9QYkgxrib+4w19p5L66cnFqCZy5UAXIRjXO8mdJ2r
         qAJ6IgUx7BrO5JKvfoZWXBILVicLAv5ga2gEKlR/cB6KSRWiwtR0f0mPdDXUQtgBW2Sa
         SNfQrz2a85eKbDmZghmpke4E9xlYgK5ahEGMoIOs1dZ6VKYCm4qf+viDIg5jsIQf8e65
         f5a8jP/zIGLQs6qfRDb1L9cvRyKDSjFLMYRJYkYAVgRKsWHiQG+K0hKeiHYP0iLcglAC
         jVcA==
X-Forwarded-Encrypted: i=1; AJvYcCVNb90J4xTERGzVqEO+U39dbQXwtaD4Gw4QOgDSufZRRBKPfnm0O70S9VdtS7b7wMCMtVEgROPdhUKj@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3+ZIEjT91SCJtSuh2uzp1JgXsE0O+LDwjw+3gzkNSiEfKxiwd
	EvqMZalVVjIcqXF76NAaLbH7yVZpM8lNSN7/PotBK8BMNTxtsI9L1JecNJf5bviQhmaEYRkX7cY
	xSgg8fzq80QxDUSx9z/E2vqME1r+c/9VgFPbncTz7Xg==
X-Gm-Gg: ASbGnctk9vhtO4Hu1gwowExT4pcJYV7elCs+WQmiFr0Ch0/k+MRIS3JGmRdbWKqjZ3Q
	jWcdOG6Axm7tK95q50sckYXkq1KAMfpuR4BVlIr7q4y7boWwXaMAjRRFnbmv/GZ2sZL2H5Mx2rS
	YGCR9jt0I/NA8Yk3xjIPoX+BKkSeJnddrC0wmsfiV6GHs=
X-Google-Smtp-Source: AGHT+IGVZtOP8nKK2uYkpXDsoOHkEA3isqGOHWU2CiAMMjjrEpXLEP/80KjCyKC1JkPTolJziM77YfGezg1MoCsfb8M=
X-Received: by 2002:ac2:4c4f:0:b0:553:659c:53fa with SMTP id
 2adb3069b0e04-5539d4be3f5mr521706e87.5.1749630474846; Wed, 11 Jun 2025
 01:27:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-gpio-sysfs-chip-export-v1-0-a8c7aa4478b1@linaro.org> <20250610-gpio-sysfs-chip-export-v1-7-a8c7aa4478b1@linaro.org>
In-Reply-To: <20250610-gpio-sysfs-chip-export-v1-7-a8c7aa4478b1@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 11 Jun 2025 10:27:43 +0200
X-Gm-Features: AX0GCFvGsgMfVLX0X7q5zsPx9ZinW-WrALwB7s-SxhW2sNmB_lJFCYUU2-ulULY
Message-ID: <CACRpkdZ0W10E7UX7KDnej0SX_Jtuo8r1xSTJsGmXDrDYwArO7Q@mail.gmail.com>
Subject: Re: [PATCH RFC/RFT 07/15] gpio: sysfs: add a parallel class device
 for each GPIO chip using device IDs
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, Kent Gibson <warthog618@gmail.com>, 
	=?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, Marek Vasut <marex@denx.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 4:38=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> In order to enable moving away from the global GPIO numberspace-based
> exporting of lines over sysfs: add a parallel, per-chip entry under
> /sys/class/gpio/ for every registered GPIO chip, denoted by device ID
> in the file name and not its base GPIO number.
>
> Compared to the existing chip group: it does not contain the "base"
> attribute as the goal of this change is to not refer to GPIOs by their
> global number from user-space anymore. It also contains its own,
> per-chip export/unexport attribute pair which allow to export lines by
> their hardware offset within the chip.
>
> Caveat #1: the new device cannot be a link to (or be linked to by) the
> existing "gpiochip<BASE>" entry as we cannot create links in
> /sys/class/xyz/.
>
> Caveat #2: the new entry cannot be named "gpiochipX" as it could
> conflict with devices whose base is statically defined to a low number.
> Let's go with "chipX" instead.

That's unfortunate but it's good to separate them, and
gpio/gpiochip is a bit tautological so this is a better sysfs name
anyway.

> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

> +       /chipX ... for each gpiochip; #X is the gpio device ID
> +           /export ... asks the kernel to export a GPIO at HW offset X t=
o userspace
> +           /unexport ... to return a GPIO at HW offset X to the kernel
> +           /label ... (r/o) descriptive, not necessarily unique

Not necessarily *globally* unique, I think it's required to be unique
per-gpiochip right? Otherwise it will be hard to create these files.

> +           /ngpio ... (r/o) number of GPIOs exposed by the chip

I like this approach, it's a good compromise between different
desires of the sysfs ABI.

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

