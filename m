Return-Path: <linux-gpio+bounces-28708-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D0088C6BE8E
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 23:57:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 874DF2A270
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 22:57:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC00730F535;
	Tue, 18 Nov 2025 22:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mh62jC+5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED5E2EC57C
	for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 22:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763506633; cv=none; b=hrRmDxZZ19qtwPzp0683Q8jdPA/7hIeDoQGEhIULEpfIwfv7frIddOj3H8Eu93adaHcgGTDZylrpY/7p0t12jEw72jxlmM8Ozc/lut8n4A3LyeYARofA+9Xhp4jSFWCDmofYB3y+8GcCmGx4zZyRGcDCt/l7torBsVPuE28nZG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763506633; c=relaxed/simple;
	bh=PEswP7/MKNvIoy73Ay/lXRuLoHFl3pV0t8k8v6H2HB4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MoLSrana+ff7Q5EWzHJPVW7cO8TfOHv33IR2wTGBhjj6kKbFb7gnV9mzn5bkOZsDgVibmgGst3hI7SG0x8rK29MPPJT+VYxaXDaiycZpvLtveZk5IcmL7UtBGHBsg2ErmBr8e1cUXHuW4YtjLnfU3nRrPPXdGx5/BQmwiu4aatM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mh62jC+5; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-594285c6509so6355752e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 14:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763506630; x=1764111430; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LJz8nG5sN3FDh1IyOGPvk5xFa+/J/sOHL6LWJMvknes=;
        b=mh62jC+5aCZ1hNUvoZ0taoS4hNxGj9+2+DVHCOUgKgzh2uJnwSqCZ5zhBg7TseVWHS
         /BkpHfx0FiYGQtPDKaAFvQrt4++TorSk0X1TOLu0xwNIKFOTq4KDs+MepJkCFeBrQaJE
         sUodA4SGJj9ZqvYSp41KkSekTwcUNVeMZUPffxn0DhwHHMHwu4ikr8JJuxVBDncK4L7j
         15ZsjyEeeuuaa36tx7S2AftAtIaNZFah6OdmbwBgz9/V9j0+LlgE8Bhw0lmZtEKQ+Ozy
         KMM7MwttL32pGYzUAaGxVbIjgwq6r3dD2MUwSIQWTpcYRlyFHso+LueIZVKXt5aH+Mez
         Cz+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763506630; x=1764111430;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LJz8nG5sN3FDh1IyOGPvk5xFa+/J/sOHL6LWJMvknes=;
        b=WrML6r7+2fxD6Pz1WY1ayEWRd9M9Ch+O5C/8Fx2dL8Nb5FH3iuAZGEUQd+XfZZ5SK/
         wT44Ef8non2Dm0Gk0+XiDq2Wmn8B9kuoZ2IMnc+9h2TKUrvGTrEHTrFM+Vtr+bS1mtp+
         CxO4mVLAkNDfgO5/0NBLY91YvdKkfX1CtOAMD389GRxru7nDgXivCaBh3sCG0i8Oy6og
         l6vdBVyiMZyY08OLmDgo28heIFvoszBOIIvu/XrR1LI0FsnGOmNl4c5vrsJznC9IHzgC
         hQryEt2f5TGw1mnr0+1Qigsmevg5pQSP533CsvaHD/+Jbc19HKRMJrKAgzgOR7KQKTnG
         Rl9w==
X-Forwarded-Encrypted: i=1; AJvYcCUzuBxWtBbuDkyMUOwU1zTC/iK+OaV4rdR3+o0tEjpltG1V5Jt998Qgz1ulsXmfyS+NO+sCOJeE+u32@vger.kernel.org
X-Gm-Message-State: AOJu0YwprJxsygqXcNJ/bAofqgg8mZ7ZmPzyVSmz2ZTBeOWuKqiQ11ME
	yX6xW86y15r7lfVTLTAKifMoxDHN6BoBiH9AFQs4ggXiD/5QRgwXEfxNEGAggQSsixnkiTzjMXM
	GC1t/ipZskxTqVZWWhi5hJ47VbvucR3beDphLmXOHYA==
X-Gm-Gg: ASbGncvtkAiqnIM/dBWjYWauCWsCBJC73e92Z9KvwZMFfM00famQpsAnckEJgzvbjRj
	7oO8c/bd8gcvMfDnKgSfSS7mh71jg0x7OElztVYqf6yK6qIh9WKT4IYQcVv7lC8dcUcsoU+NIVy
	hDNB8TfQohs2E6bjIfYJoUIUOG686t35BnLQgrbTxA26NkclGAvGIcM+Bl671br/yY7AdLgXlgi
	C2OYeal2CklOBAil1Rf3USwO2W8g0wl8ManQaRmfDwPXal3jMRpKkOMYeASiBWArHnyoUdSKZlS
	tyjT4A==
X-Google-Smtp-Source: AGHT+IHwZcAFMZS1bHsxU68eV9rOlrn8WFmX9PzE9NTh+PzIlvHiN2PvE8KkV7wfG/e63Wzo3GxckDVJu03pQm+3a6o=
X-Received: by 2002:a05:6512:3a86:b0:594:74f9:3b3 with SMTP id
 2adb3069b0e04-595841f97abmr5327733e87.29.1763506629914; Tue, 18 Nov 2025
 14:57:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251111-pinctrl-s32cc-alloc-init-v1-0-071b3485b776@redhat.com>
In-Reply-To: <20251111-pinctrl-s32cc-alloc-init-v1-0-071b3485b776@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 Nov 2025 23:56:58 +0100
X-Gm-Features: AWmQ_bnwhWkIocYT7e_LII6hlp7UoALS4YCTtfLZFvQ5s57acnTyw4Y1jo6l42k
Message-ID: <CACRpkdYfNyAGdFpq=92UKBkScHq6U58N6XtwjJOJ3HAbBvFaNg@mail.gmail.com>
Subject: Re: [PATCH 0/2] pinctrl: s32cc: fix uninitialized memory issues
To: Jared Kangas <jkangas@redhat.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 11, 2025 at 10:55=E2=80=AFPM Jared Kangas <jkangas@redhat.com> =
wrote:

> This is a small series that fixes some uninitialized memory issues in
> pinctrl-s32cc. As an example of how these can affect the kernel, when
> probing i2c-imx, a memory allocation may fail because of the
> uninitialized memory giving a junk allocation size, which prevents chips
> on one of the I2C buses from being detected:
>
>         # i2cdetect -l
>         i2c-1   i2c             401ec000.i2c                            I=
2C adapter
>         i2c-2   i2c             402dc000.i2c                            I=
2C adapter
>         i2c-0   i2c             401e4000.i2c                            I=
2C adapter
>         # i2cdetect -y 0
>              0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
>         00:          -- -- -- -- -- -- -- -- -- -- -- -- --
>         10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>         20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>         30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>         40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>         50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>         60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>         70: -- -- -- -- -- -- -- --
>
> Compared to when no failure occurs:
>
>         # i2cdetect -l
>         i2c-1   i2c             401ec000.i2c                            I=
2C adapter
>         i2c-2   i2c             402dc000.i2c                            I=
2C adapter
>         i2c-0   i2c             401e4000.i2c                            I=
2C adapter
>         # i2cdetect -y 0
>              0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
>         00:          -- -- -- -- -- -- -- -- -- -- -- -- --
>         10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>         20: -- -- UU -- -- -- -- -- -- -- -- -- -- -- -- --
>         30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>         40: -- -- -- -- -- -- -- -- 48 -- -- -- -- -- -- --
>         50: -- 51 -- -- -- -- -- -- -- -- -- -- -- -- -- --
>         60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>         70: -- -- -- -- -- -- -- --
>
> Signed-off-by: Jared Kangas <jkangas@redhat.com>
> ---
> Jared Kangas (2):
>       pinctrl: s32cc: fix uninitialized memory in s32_pinctrl_desc
>       pinctrl: s32cc: initialize gpio_pin_config::list after kmalloc()

Patches applied for fixes!

Nice attention to detail here.

Yours,
Linus Walleij

