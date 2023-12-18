Return-Path: <linux-gpio+bounces-1597-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 495028168E5
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Dec 2023 09:57:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C75A1B20D07
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Dec 2023 08:57:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18C1010959;
	Mon, 18 Dec 2023 08:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="NX51YVLU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF15611703
	for <linux-gpio@vger.kernel.org>; Mon, 18 Dec 2023 08:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-7cb029c41e4so594122241.1
        for <linux-gpio@vger.kernel.org>; Mon, 18 Dec 2023 00:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1702889835; x=1703494635; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=17D/zMMs3UzynS8HWi3MOrbxqrb14UiBDYKCegQyFWE=;
        b=NX51YVLUiIJGQJFcp+2ugTi/oPjM5Doo8jvqGOSEne3Cmgc7t38AN1M0Bk1j8CAZAB
         Y70bP23TKLTNUZoWg67wd0/B5nIAZGLXho9qj2XGa8gLcPKlApP1H2rroNQuZBUOhV0K
         7wWf410I4gFA8Vr3I83aDzFU4Aes0+bP//t+60zsTKn61iA2fMIdysm7k7b4gwns6xR0
         sLqHYdgFlwEnAXpfrlxGfojdXYYKUpxAqixfaRmJAVDZU4Gkp9L8jy/z7HIlqNX3P99F
         x7oZMyIrFUo9JG1TlmccNE5cNlGZLoOosDzzOsp7GknB2hlB2G9qulzoBbzP2LSaxnUa
         sISQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702889835; x=1703494635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=17D/zMMs3UzynS8HWi3MOrbxqrb14UiBDYKCegQyFWE=;
        b=oIKSdp3SnXRqO2SpQy5qNt39ymwJ2MHBsyN5/qDifLBqZs0+JRZbKHRX8ZBNWozLdp
         4nzFaJb+c3git9UhsGvRtuc/CXRiG0RvImny3NGw+0jXHCsgz/QZwA4euovnwxuouvH/
         UVL3Gx76o6Gl4b4JLUhflqX/VjqQjuYuLjtkBxyCPODdLEvLYJg4VYYKd4jzfCvaQOKp
         MoYZbr0rVEFAtzFbWn+ElRuVlpfbDrSKwH964P965tO7V3QifUEy0M+B20tFJki2mdJb
         F1fytRW2Wa4ckUJ9ZZ/Nb6bt8i+UwSkwLjexiKljaHaYZiemngvZ+CP15vshdSIwK4hm
         T0mA==
X-Gm-Message-State: AOJu0YxGew2RLAnKJ2A8lnV2YdtDCOVHrzNBozt0uQDqPByYbNe3RJAw
	8v1eSy63XE7Bo9nY6YfGMQw6n3G6mcD0Tll5lhY2dQ==
X-Google-Smtp-Source: AGHT+IEkkiWpnT1KZH/A3fVZqFmGcDxBtnUuOpzWRupdIdhVTl0wERHKwlcQacb7d0q9VfjTJlYZWZo4QyMC+dvAt94=
X-Received: by 2002:a05:6122:36a7:b0:4b6:be99:4acb with SMTP id
 ec39-20020a05612236a700b004b6be994acbmr679692vkb.16.1702889835600; Mon, 18
 Dec 2023 00:57:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231215090943.9245-1-brgl@bgdev.pl>
In-Reply-To: <20231215090943.9245-1-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 18 Dec 2023 09:57:04 +0100
Message-ID: <CAMRc=Mcc3+c7mfEPd+_SsS4OSeOHeYh8RKK8oOLxcrhRvnBTOA@mail.gmail.com>
Subject: Re: [PATCH] gpio: xilinx: remove excess kernel doc
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, 
	Michal Simek <michal.simek@amd.com>, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Marc Zyngier <maz@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 15, 2023 at 10:09=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The irqchip field has been removed from struct xgpio_instance so remove
> the doc as well.
>
> Fixes: b4510f8fd5d0 ("gpio: xilinx: Convert to immutable irq_chip")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202312150239.IyuTVvrL-lkp@i=
ntel.com/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/gpio/gpio-xilinx.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
> index 823198368250..7348df385198 100644
> --- a/drivers/gpio/gpio-xilinx.c
> +++ b/drivers/gpio/gpio-xilinx.c
> @@ -52,7 +52,6 @@
>   * @dir: GPIO direction shadow register
>   * @gpio_lock: Lock used for synchronization
>   * @irq: IRQ used by GPIO device
> - * @irqchip: IRQ chip
>   * @enable: GPIO IRQ enable/disable bitfield
>   * @rising_edge: GPIO IRQ rising edge enable/disable bitfield
>   * @falling_edge: GPIO IRQ falling edge enable/disable bitfield
> --
> 2.40.1
>

Patch applied.

Bart

