Return-Path: <linux-gpio+bounces-3504-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6267785BB40
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Feb 2024 13:00:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D3451C23B22
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Feb 2024 12:00:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7216667A1C;
	Tue, 20 Feb 2024 11:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ny77wEDb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A566931B
	for <linux-gpio@vger.kernel.org>; Tue, 20 Feb 2024 11:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708430346; cv=none; b=OUGiaYLeBt0CUpBjET3gxFSuG61vZuCULMi6zsztyCAtnFOLajMxHg5+9lO6Kdc6Q5IeJWdHjg5RgCq1RSqu2bP7cSkUB1SlhO7n895GxFMpKweE+9bAO0BYqWbPylXe2bl1hRRMfh4SHAWJMN1yLWwkAl/lQWBc6v0wLPnEHtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708430346; c=relaxed/simple;
	bh=ou4SOvZ0nJuj/Fby+vbm23fNfuXezqxN+Ty/sNcx7+c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gUP3o88LMXTCOOE56QxJ8hwgXujssKAX1DrC+PpfrYnEyz3oKkF3etWLctBA2NFNJmbtjyecPPxHbMwxxZ7qEu6Uczkn4vJik7Yo36j66kKq7R69qeenmtj4i1G3HiTCjcK6jr/OKGnp1CbyGqLlM9E4+pgVm+ApNGKDH1mWmic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ny77wEDb; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-7d5c25267deso2599035241.3
        for <linux-gpio@vger.kernel.org>; Tue, 20 Feb 2024 03:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1708430344; x=1709035144; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ou4SOvZ0nJuj/Fby+vbm23fNfuXezqxN+Ty/sNcx7+c=;
        b=ny77wEDbIcQeSJHrd2PCuBzSBwJ+CHfXUIIAD6U4MelHjBfSNDPXNs7CdYcqYjhKLD
         g1XX1yvRwB8HMARSCvUVy3DL1iu6Mpn+lYhfWysynYbVo2D8lEf2yuX1urJjCV3kFO4Z
         f7n5a0J8IBUkINv1jmUsWYo1i5o+nCMcZhlmQftmSLCzFBqaEfV0VYCZxAiPBlUMZdD7
         omrlp1eRKC8naEOdcITCO3h3xL5lhQsjRxPwlh1VGYl48jJBOIfrd2iJ0nptmn2yJ/J5
         RyYX2gzioy7Nx0S6qS5paqPQ1Cz3JL9gFT7i9gLEz8+bYSDFx3npTNQ+8TZSrpprTxoM
         Ja3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708430344; x=1709035144;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ou4SOvZ0nJuj/Fby+vbm23fNfuXezqxN+Ty/sNcx7+c=;
        b=pK75L29UfPPV4VIfUGJObsNCe3slTe1lVd1yWgQqrYf68Fm3nPajmlPRs8tf8htMxM
         veXdeawdxofR/D2fZ/AdfCOWmdk37g1s/WAj25hlx7aHCtKU9q+LmI+DgQ2CsdIlWVCp
         hnDYPRhDHH1P+aMBuBsj5yEvf+11Yygl/pMCsgDhmLZ1HC7HiISjaeEuacxUehR51Buv
         z3AryIJ9jJZR4dWPTsvdXMbOqk7nvdjyDUqeXWRnbhgIJawh2NQDjvMLX21Rzrh+iakq
         A4niT0GF+r++k4qfFgPkWQc8Cc2emaJL/MC/9y6Xs1L0xUKJLgJNXc8uDRBzOvsaC+BM
         ofTw==
X-Gm-Message-State: AOJu0YwbdBeDvmqMj4wvkpKG6raySm8FZTv6EM5Ve9I0lnJiRBozwxhx
	E+QVhsNPN7dz/HYv1MJp2rL1SlcnkWN+3J374d/Dh5wN/dChcqaF3Jd/16Tq1xEncH4wdkvWlLA
	o9G4yU3HVvdWPCpCKGp10ZPQcDuszK9DcenWA/w==
X-Google-Smtp-Source: AGHT+IFsheJadATu9F2D1gHV5H/CRThe3RxZBuE3+9m2ZTfxOu76x399GP9u5Rw2BicXdqTNdYynhcPvQLac2HGeIC0=
X-Received: by 2002:a05:6102:11e4:b0:470:5106:b256 with SMTP id
 e4-20020a05610211e400b004705106b256mr4960263vsg.30.1708430343589; Tue, 20 Feb
 2024 03:59:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240219172514.203750-1-emil.renner.berthing@canonical.com>
In-Reply-To: <20240219172514.203750-1-emil.renner.berthing@canonical.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 20 Feb 2024 12:58:52 +0100
Message-ID: <CAMRc=McL_+nDEfERUt4fNHvqzQM54pBOS-y42ip-EJH8zeNiAw@mail.gmail.com>
Subject: Re: [PATCH v1] gpiolib: Handle no pin_ranges in gpiochip_generic_config()
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Walleij <linus.walleij@linaro.org>, Jisheng Zhang <jszhang@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 19, 2024 at 6:25=E2=80=AFPM Emil Renner Berthing
<emil.renner.berthing@canonical.com> wrote:
>
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
> ---

Applied, thanks!

Bart

