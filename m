Return-Path: <linux-gpio+bounces-30589-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B910D23B59
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jan 2026 10:51:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 630CA30AB156
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jan 2026 09:41:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3214935B12F;
	Thu, 15 Jan 2026 09:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V7ZU/0sE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA46930BB85
	for <linux-gpio@vger.kernel.org>; Thu, 15 Jan 2026 09:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768470083; cv=none; b=B5H8g0aObdlBrpTHIGZA2DVZIFLKWhu+LFe6Z1aqIVoWvbkn7N2xQsTi8ZZxLo4eNrXls4vRZ5slZnH+NPYw/sgFkRH/FdLGupaPUVCklq+BedoB2IFCaoNUY0vG+DvKrnXgB2Q1of8ODTUy1HTjixbzTYAsMKrKuZZrrRq5Gig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768470083; c=relaxed/simple;
	bh=yEGm9RFMlmgKJa8KW+APYhq854bMc9EZcrULIMlFx0o=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=PdlAhx9f3A44p5UKQa7JGpA312DR1fTCHDZN2CtQ6NHbG+zuh0MPbNiIwhzPJjrwCSQbDTjx4j8SGAf+/VN15LeFGlEX3m5bfEGvsjiOmMC9OiQWvd3eRkCbA2cPP3DGXqR8+rg9Y9xympt+CYva2uoql0SnsEQYM6NXXcmf51A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V7ZU/0sE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91205C116D0
	for <linux-gpio@vger.kernel.org>; Thu, 15 Jan 2026 09:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768470082;
	bh=yEGm9RFMlmgKJa8KW+APYhq854bMc9EZcrULIMlFx0o=;
	h=From:Date:Subject:To:From;
	b=V7ZU/0sEPStPbRH5WyJY44K1yVpDEr09ePf4R517AA1i71UI2D2WIfGOlRfBz38Ss
	 XLtgxXlxNetXmBaDe7Koso/HxTuuipfjhXRxWdYOHV45/1/WPS2lkS3ry+I1rmL8di
	 tJYw+GaoCJe66O+SEZ8Nfy/zDOtFZrodIvSigWhaqKx12BAF4yBMar/d/zjdTtQ/UK
	 ZHEik4kuKX9Cqb8lEFUdZAZKSaYs27kP/AFT5hfzeJFfIzrcKQsqJM48e4GIJI0RKx
	 qkPcmO4ROcObJtgmcxFxv4861JKOJmEeeXRau+tQakrAm0qZ0evdXB75o2gQRJHfyv
	 0+xICuRTBkAqA==
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-6467ac59e16so514620d50.1
        for <linux-gpio@vger.kernel.org>; Thu, 15 Jan 2026 01:41:22 -0800 (PST)
X-Gm-Message-State: AOJu0YwB4fLTDmKQtwI+RuuWEQ8hViGvnAEoY0/wwzLi3t6HmNyGRvDY
	0FPm+9Gurqm3OmCOGMv65ZG4P9BDGEvvDNNJRvWX9X3UdC/PwijKbc5xgXBnk0jpGKiKk9vaV6U
	DHEn2OpCqUHvofpfMsZw5zSkimVe5Sb4=
X-Received: by 2002:a05:690e:400f:b0:645:5b0e:c914 with SMTP id
 956f58d0204a3-64901b0fb91mr4114395d50.66.1768470081764; Thu, 15 Jan 2026
 01:41:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 15 Jan 2026 10:41:11 +0100
X-Gmail-Original-Message-ID: <CAD++jLkJfyhmpepkanMyvLc_C0v_XZeoEKj8XJ3bw5fJAqJYyQ@mail.gmail.com>
X-Gm-Features: AZwV_QhbLnqGsXOwwI27BwqEcYZXxdB4cCSQ9QkbscWqfjHZvYAPj2LGsDZpgqc
Message-ID: <CAD++jLkJfyhmpepkanMyvLc_C0v_XZeoEKj8XJ3bw5fJAqJYyQ@mail.gmail.com>
Subject: GPIO direction problems in gpio-shared-proxy.c
To: Linux pin control <linux-gpio@vger.kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Hi Bartosz, Andy,

Andy is good with problems like this, so I explicitly address you!

A review of the I2C core brought this problem to my attention:

we have the following confusion in gpio-shared-proxy.c:

dir = gpiod_get_direction(desc);
(...)

This function from <linux/gpio/consumer.h>

if (dir == GPIO_LINE_DIRECTION_OUT) {

This define is from <linux/gpio/driver.h>

So we need to move the GPIO_LINE_DIRECTION_[IN|OUT] to
consumer.h if you want to use it like that.

But we don't want to include consumer.h into driver.h or explicitly
into every driver.

The I2C core and any external direction user looks like this:

/* FIXME: add proper flag instead of '0' once available */
if (gpiod_get_direction(bri->sda_gpiod) == 0)

So this needs a proper define too and it isn't a driver.

Shall we create <linux/gpio/directions.h>
with just these defines and include that into consumer.h and driver.h?

Yours,
Linus Walleij

