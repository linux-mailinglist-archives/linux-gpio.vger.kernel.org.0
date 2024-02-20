Return-Path: <linux-gpio+bounces-3484-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5762085B59B
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Feb 2024 09:41:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A28C1C226A9
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Feb 2024 08:41:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA19B5CDFF;
	Tue, 20 Feb 2024 08:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NcO0biqs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DCD5C901
	for <linux-gpio@vger.kernel.org>; Tue, 20 Feb 2024 08:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708418494; cv=none; b=msU1gIkK7oGtHsTiek6uPc5r1Dt2wGB/3qhymqiqszEoXATSPdOtDXI81dryAbli6hmuazZN+0nqtgZWwhj3oYRKlzwmdCM4PjS8U6dl92sYbgxHXbwtX4/8NYx1xmCg245RhzgzeyJiSiKdQsk1bL7HVtNhfKUef/dO+ZhhN4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708418494; c=relaxed/simple;
	bh=9ekC5HPUrNoy1GRhN2rh+bxhzXxfKFqMFqA2kvueEWI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LqWYnndqOu3FB4vbzlv7MrFJ92FIBZ7VlpW0EKqtOcF/IDeMJqGX5iJg6KhzKcUkc2bAVioeWw8mZRPJwyAOrao4K143V9M7sPtKwiTUO/nKqowcWHuU+BwCq7B/m2PN1UIF59O29jo0MmSpf+/E8a6p3o0EioWAIDnlwMkKRbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NcO0biqs; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dcbf82cdf05so5780204276.2
        for <linux-gpio@vger.kernel.org>; Tue, 20 Feb 2024 00:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708418492; x=1709023292; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3dFgumD1yW7PVeRFLqgU/aWZ41UsZ2fN0lPKRULxgCQ=;
        b=NcO0biqsEW4dHVNnDhtCyWagLTGXbJ5qy6N+NIrYT80hhK7T71IuPAIOvc5YL/lPjr
         Zl7npLToWb27NRhfBYJxQ7BbQ0x7ayrCVc1tuvnjGCCDdN9B5EIBCAW7gXxFkVDiUCkG
         TOnYsm9dv4yhgIdMi+XGaHAk2vyqGzS0J+JLcPqN6U1m8fk3h2gvo8Obbv3wC5QtVoWT
         /cCSLqHFx+sz9GSUDpvQed5KkzWQg5OoN/lpFZnSg7Yh2a0RbDzCb3LNwYsc1blCxa7C
         YVveebZHEH1uwencX3ZuIaLOTipmd5xu2+H03NA/Lzv4wPlbmLYs9I2enMrgDSl0L9VI
         OCvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708418492; x=1709023292;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3dFgumD1yW7PVeRFLqgU/aWZ41UsZ2fN0lPKRULxgCQ=;
        b=C4omrIOAbqxARl+MKOljfz3LX7KoJqWXSFLb06Xm/Uby2z/mFfRIjCpCImh61852Of
         wlA0HFi9iAG2k/9gZwhZwWHbPpGxz8Itvg2KN0DbVi3adqQbRcsqMDJ5rg3xqTPdGQTa
         /pYTw7a/HV8W/QDzTtkXh8TK5W0K1QgZSl7iUDwZeHBZUC0nuBWjZdZF2DeknmMmV3xC
         jNpmN8U94F0q1G84jxDmwZTcuc/Z7EXMVEvB6rDlAh88VY4AoXK8UxIwTizqTgVe//qj
         c2ZXPki+Cn5eD/zeF9mBy1gB5eIBGhlpFv+KOfT6V9smZex6vmJtGnvXmZvru7ct4Dqk
         yl8g==
X-Gm-Message-State: AOJu0Yyj1PGp9uGXWvHXiV6wh42EnDcNzHwTRhar7dAHADdeztgXKljJ
	NSvoJKFsRBV377w15I7mKt30LO3TtdZyer7R/WXhAYMWJxioAYANQ7GV/b8ra9OCKv7UFTIvBKP
	FC0zx8j1NsdI9SBd6Xb/JxH9nZ741gRd+J1lgmSp2pwujrN0R
X-Google-Smtp-Source: AGHT+IGkyNRR+Ep1c+zqGzNk1FdvaWZCNuQOs62IuTTBhudvJEy8KFTcyFT+jHplQ6yoG8h4Pf4T4W+DiwE1IXhV5T0=
X-Received: by 2002:a25:e0d5:0:b0:dc2:470b:887e with SMTP id
 x204-20020a25e0d5000000b00dc2470b887emr14147504ybg.21.1708418492204; Tue, 20
 Feb 2024 00:41:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240219172514.203750-1-emil.renner.berthing@canonical.com>
In-Reply-To: <20240219172514.203750-1-emil.renner.berthing@canonical.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 20 Feb 2024 09:41:21 +0100
Message-ID: <CACRpkdaS3oEyQjuHK2LVKKGws8CEdgzhWVGEfjJPY+a0ndt0-w@mail.gmail.com>
Subject: Re: [PATCH v1] gpiolib: Handle no pin_ranges in gpiochip_generic_config()
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Jisheng Zhang <jszhang@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 19, 2024 at 6:25=E2=80=AFPM Emil Renner Berthing
<emil.renner.berthing@canonical.com> wrote:

> Similar to gpiochip_generic_request() and gpiochip_generic_free() the
> gpiochip_generic_config() function needs to handle the case where there
> are no pinctrl pins mapped to the GPIOs, usually through the gpio-ranges
> device tree property.
>
> Commit f34fd6ee1be8 ("gpio: dwapb: Use generic request, free and
> set_config") set the .set_config callback to gpiochip_generic_config()
> in the dwapb GPIO driver so the GPIO API can set pinctrl configuration
> for the corresponding pins. Most boards using the dwapb driver do not
> set the gpio-ranges device tree property though, and in this case
> gpiochip_generic_config() would return -EPROPE_DEFER rather than the
> previous -ENOTSUPP return value. This in turn makes
> gpio_set_config_with_argument_optional() fail and propagate the error to
> any driver requesting GPIOs.
>
> Fixes: 2956b5d94a76 ("pinctrl / gpio: Introduce .set_config() callback fo=
r GPIO chips")
> Reported-by: Jisheng Zhang <jszhang@kernel.org>
> Closes: https://lore.kernel.org/linux-gpio/ZdC_g3U4l0CJIWzh@xhacker/
> Tested-by: Jisheng Zhang <jszhang@kernel.org>
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

> I didn't add your rb since I don't think
>   if (IS_ENABLED(CONFIG_PINCTRL) && list_empty(&gc->gpiodev->pin_ranges))
> will work when the pin_ranges member is only there then when
> CONFIG_PINCTRL is defined and it seemed like your rb was on the
> condition that I used that.

I was wrong about that!

Yours,
Linus Walleij

