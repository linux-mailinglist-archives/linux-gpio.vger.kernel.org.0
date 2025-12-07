Return-Path: <linux-gpio+bounces-29345-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1837FCAB185
	for <lists+linux-gpio@lfdr.de>; Sun, 07 Dec 2025 05:55:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2DB3F3004D04
	for <lists+linux-gpio@lfdr.de>; Sun,  7 Dec 2025 04:55:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5B23286408;
	Sun,  7 Dec 2025 04:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b="SJYEXw6R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailtransmit05.runbox.com (mailtransmit05.runbox.com [185.226.149.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70A429ACFC;
	Sun,  7 Dec 2025 04:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.226.149.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765083351; cv=none; b=S73R59Mbu23pl26jm0eq+eFb/1X3B0FR7AFhQ3+8Ag0ozLzvmY1T7RWfxerF9h//hZPBCHINl6gMpJrw/W/2mqZizIb/r5JfHKYeDEUwJf6eh6pnRJp9lvgj5gXrzEwCKIUHcLwXQPc1i4+I7dOvul2R/gACEjnflnhKPlBPQqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765083351; c=relaxed/simple;
	bh=eIbZpW0h4gmswp/sgYs1uWHS5jNlsy5y89CVJ7h3Rrc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G5JR89ni0u+9gWB/WeYsdY31QpbgLL7AEK5Cdkj9kYECbvR6W5i+qXLtgbrVwvCV2fe7e+yp+dk5Ho/TELAWd9llJjEPhPDXlmbPpXDM12zRQVtJBUaxoy7/flKLtIdCNqkFjVMFrNQOiMKPiN5p2jgZUdJpt3g71ve8YWMuTDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh; spf=pass smtp.mailfrom=gibson.sh; dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b=SJYEXw6R; arc=none smtp.client-ip=185.226.149.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gibson.sh
Received: from mailtransmit03.runbox ([10.9.9.163] helo=aibo.runbox.com)
	by mailtransmit05.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <daniel@gibson.sh>)
	id 1vS6nt-0099mk-84; Sun, 07 Dec 2025 05:55:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gibson.sh;
	 s=selector2; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=Mz8gl+LQ+pQXR9Vk/AIbLOn/Re0FlMVXlpYXdJtawpw=; b=SJYEXw6RUAfGmey+ZE0ON69ptG
	ApnwIKXCuuRKS5epUGcCa3lJ8QodjtAQqioS7UiZaBOgf6yeb2env2p8Q/ckG5aT2gRQfMGAJ4Iru
	0Ym7i9aP5iywvQblFr3kSZp0MT0w88J9RuLRP1Ode0LTR7ynbPT55gaKgpI4f1ixNkKuQ7n3tOQeS
	F8sCAJYRQL74hkt36DuINcIp7+ynG023ctqdbDEqC7oBQePeoWWD+oO6TZyEIU1fZY2DDKixHuRBW
	Ujqa4OTIQvzSUJlGWix5YSVxxWKEF24sMXWlonq7hMIFWqPWKIUOIp+vea5fgff4Yft5Ehwc6N2jH
	/EjrXyYw==;
Received: from [10.9.9.72] (helo=submission01.runbox)
	by mailtransmit03.runbox with esmtp (Exim 4.86_2)
	(envelope-from <daniel@gibson.sh>)
	id 1vS6nr-0003yn-Id; Sun, 07 Dec 2025 05:55:23 +0100
Received: by submission01.runbox with esmtpsa  [Authenticated ID (1104311)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.93)
	id 1vS6nk-006ssX-8F; Sun, 07 Dec 2025 05:55:16 +0100
Message-ID: <bd0a00e3-9b8c-43e8-8772-e67b91f4c71e@gibson.sh>
Date: Sun, 7 Dec 2025 05:55:15 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/12] gpio: it87: use new line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Linus Walleij <linus.walleij@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Lixu Zhang <lixu.zhang@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: linux-gpio@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250423-gpiochip-set-rv-gpio-part2-v1-0-b22245cde81a@linaro.org>
 <20250423-gpiochip-set-rv-gpio-part2-v1-5-b22245cde81a@linaro.org>
Content-Language: de-DE, en-US
From: Daniel Gibson <daniel@gibson.sh>
In-Reply-To: <20250423-gpiochip-set-rv-gpio-part2-v1-5-b22245cde81a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,
I got one nitpick/question about this, see below

On 4/23/25 09:15, Bartosz Golaszewski wrote:
> @@ -249,7 +250,9 @@ static int it87_gpio_direction_out(struct gpio_chip *chip,
>  	/* set the output enable bit */
>  	superio_set_mask(mask, group + it87_gpio->output_base);
>  
> -	it87_gpio_set(chip, gpio_num, val);
> +	rc = it87_gpio_set(chip, gpio_num, val);
> +	if (rc)
> +		goto exit;
>  >  	superio_exit();

Are you sure that superio_exit() should be skipped (with goto exit) in
case it87_gpio_set() fails?
After all, superio_enter() above (not visible here) succeeded,
only the it87_gpio_set() call failed.

Of course this is kinda academic because currently it87_gpio_set()
always returns 0, but if it ever doesn't, this might become a bug?

Cheers,
Daniel

