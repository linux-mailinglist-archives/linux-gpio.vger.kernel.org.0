Return-Path: <linux-gpio+bounces-30169-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C78CF4FEE
	for <lists+linux-gpio@lfdr.de>; Mon, 05 Jan 2026 18:28:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 71DDF301D307
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Jan 2026 17:28:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D29E322DC1;
	Mon,  5 Jan 2026 17:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="bBO9/wRN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF172DEA86
	for <linux-gpio@vger.kernel.org>; Mon,  5 Jan 2026 17:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767634116; cv=none; b=vFqqHPkXOgReTPu8fewRgEUJo1V0Gli4k/uKThHmq8+Yzp5FQEHdCaF7ZqY26HDd+drfBfqn+6ortpJNA+ICRZuWOb6HTxvxIxbIr+aUYwFCOymoRrcbyg3SS+9uib8jnvmh8OihjPVA1oDgGoRjKCbaVsh4gldyGvh+OO5AzQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767634116; c=relaxed/simple;
	bh=X+w4qyFtEyMwzhhxgFY/CtE0PdRwRP2uvw32cpV5NjY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vu26QSVvg+/srRtdKczXjUpV+I88Th+KGjUapsoR2jigRhOymWHVlS01FEuFHqLpVC7YMVp6S52FOs7hvABCwC8QLregecXDi92g91xDxFyKlbnUCCGO5u7/xQmEMYcxGw2BKhxYPEwekm2Y5ZAIjosiPrIRze5bwRHuEb3NiaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=bBO9/wRN; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-29f1bc40b35so1789505ad.2
        for <linux-gpio@vger.kernel.org>; Mon, 05 Jan 2026 09:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1767634114; x=1768238914; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y/1XjgDM2zvwUKqTXN8xIQijd7DIn4lsKVtfgTVJNUw=;
        b=bBO9/wRNMv/MaOa3XFvMlFYfyO2Erv3AR+KkhTmok70fewjn2iap2Tfg23rk/mlSTO
         H3YwOa1r+gdwJTVpYuP+PCd/si2gEVaLOrujAf1RAh/2R6WgIMCnosGIDgJRqpCHV7JK
         QYSonb4bxWrdRqF9ypC7y03LsbQFgW3ogy4XovMJiYNCylZjXR6v5bQ45M6GsICOu7aN
         L0AHyFDgSDoXBSlMJT1OsphByVoufnwLh/AILI1VV4HIBTXG/1Yb+bXx0vv0mLIepysi
         oHuEP8VHStRzuBu7yN6jUEDfyv7qhKXlEbGhEuOs1nuv4pb8QBVLoJ+TWofGxBbQZ6Lr
         +a5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767634114; x=1768238914;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y/1XjgDM2zvwUKqTXN8xIQijd7DIn4lsKVtfgTVJNUw=;
        b=JmCdQB0jB+nUbUznKHLNpuKIjyXEDSRfaeUxbWHggWF6Yvleu9mLOV3LYSUtEa2MH6
         pEUNYX+N/KOEjAVOTFHodC9Rzk7wAjcahhUYtaEohyZiBWvgUS38SsR7PvLRhjJd6bbu
         PGOP9xKavc88yT1MGhS/O9kjdqHwPfDfCdJ+5Gve9JIj32m5CP3hqwGYjxtIKP+4P3Gr
         /4AayYgoT1DOZVuBasjIJ2lwo9gBFIO3nJk44W6ssoyYhiRX/4RKjWu+IYmo+XY8/vXX
         RzFSe9B3FAPBXZiwgw/vVQjd8EF+5ZJhIsyfxcI4MA2nAh4MkIGM9ammcBchZuMlI0ih
         K76w==
X-Forwarded-Encrypted: i=1; AJvYcCX0ZUE3tGW/7jj2Tui607bJwCLSR+i4Kr7TdmSZul2KqBcT8xKBji66nII64P4nFvabIEeL1+ffogHo@vger.kernel.org
X-Gm-Message-State: AOJu0YzdI0WmkVCDhdfKNEaXM+XUC9Wd5Lx4in52zEIxQIoMLYckErrn
	SObbNorKhkEe8vyn3LOfcNJ8TK0eZ1m6VmXuZnWK34VniRQ4rGeLZwWavdSqtFtV5zx7XZgo2Hz
	WTZPPnbcWROxxE6KPzycwClL0krDUHE0=
X-Gm-Gg: AY/fxX6yrdP5bpZTbdhD1sdZAaC8vqjpWKnItyKlc5GK9a0TOn1dTrULiYU1+8Mluxr
	D21eXQQtBeB8lA0qEVcbclz1grwlcO0FdXD9lHzxI+IOR5fFmV4u2v2xdwn+WwLUGe2d+xSuI0P
	D3yfwTLzakIK3bfxDuvyvtZ9jK45iO6Mnm0nqx6xw77RVsklTpMIr9duyVv/6HEYjhC5Pc8basX
	n7mnd32iejgdHgpTtWLhdPnPhJBYz+6NXDlVg4+sKnGUh6krVhir9qEHHdtT9MWmDambeNJGkIS
	cPMnMshlPCjYDyHOwuX6/6XGn64C
X-Google-Smtp-Source: AGHT+IGpy3FSTV06PFzbySqT0GxE+YkHmWqyF+kpdkmaFPx4+wxyXnjiYwrYZ6SYwKhEXTYGmchl6zZMo9euRvgtVx8=
X-Received: by 2002:a17:902:d547:b0:2a0:d692:5681 with SMTP id
 d9443c01a7336-2a3e2da7892mr3742555ad.24.1767634114320; Mon, 05 Jan 2026
 09:28:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260105150509.56537-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20260105150509.56537-1-bartosz.golaszewski@oss.qualcomm.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 5 Jan 2026 18:28:23 +0100
X-Gm-Features: AQt7F2r1mVRbDaQh2zFy4l3agObZCNqWz_Ifa4aviOfolqOQgQGGMy9JJh7ZWmA
Message-ID: <CAFBinCAc7CO8gfNQakCu3LfkYXuyTd2iRpMRm8EKXSL0mwOnJw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: mark the GPIO controller as sleeping
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bartosz,

On Mon, Jan 5, 2026 at 4:05=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
[...]
>   mutex_lock_nested+0x24/0x30
>   pinctrl_get_device_gpio_range+0x44/0x128
>   pinctrl_gpio_set_config+0x40/0xdc
>   gpiochip_generic_config+0x28/0x3c
>   gpio_do_set_config+0xa8/0x194
$ git grep gpiochip_generic_config drivers/pinctrl/meson/
drivers/pinctrl/meson/pinctrl-amlogic-a4.c:     .set_config
 =3D gpiochip_generic_config,
drivers/pinctrl/meson/pinctrl-meson.c:  pc->chip.set_config =3D
gpiochip_generic_config;

pinctrl-amlogic-a4.c still has:
  .can_sleep =3D false,

Are there plans to send a separate fix for pinctrl-amlogic-a4.c - or
was the intention to fix "all" Amlogic pin controllers in this patch
(which would mean that the change to pinctrl-amlogic-a4.c is missing)?


Best regards,
Martin

