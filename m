Return-Path: <linux-gpio+bounces-3427-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 30351859160
	for <lists+linux-gpio@lfdr.de>; Sat, 17 Feb 2024 18:44:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 31F621C2031F
	for <lists+linux-gpio@lfdr.de>; Sat, 17 Feb 2024 17:44:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 776C87E0E3;
	Sat, 17 Feb 2024 17:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="c+Q4Ob/r"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D478E1E515
	for <linux-gpio@vger.kernel.org>; Sat, 17 Feb 2024 17:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708191881; cv=none; b=JfSdBRBXXHqV7aJWol1dToljjQ/6Gg2YteJq+kOI7TPfITJxBp2YzAm0P9TSeL6zFiQjh/KmG7xyxQCEZxB5XLMaJVJEVZJJKlTQ72mSAmvmoqWeTIZ0nnde9QtnHHs4SSzDMMUMfSr3qqkefqA/lMkr8r8dbTBFOTAkMNufUjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708191881; c=relaxed/simple;
	bh=CX1u0lykeSga/DiDNtxquoMPqdU3LaqhG1zIJl+j66s=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pq+4B+MhmORf13r2V9L840u/aodybS2Zp9uTiz8jXL7KGtPdAEqfScFFo1rBCka5RvdvJt6y5gsQTfB0qORiL+TSWQ2hmucIJmO3xFag2XD5aqKdSJozUiOkNr1VF6UE5lIQfCw5owVDdvfrd2v6vIKjEI93I7w1D3B9hfphcvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=c+Q4Ob/r; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 9FD7E40C7D
	for <linux-gpio@vger.kernel.org>; Sat, 17 Feb 2024 17:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1708191869;
	bh=K1I3Xe6qMPJRuxkw9XV0vnDH1h6TWduWqAabd4p6cd8=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=c+Q4Ob/rvN1ncbR1YDftnf9UNuCMXBzHOySnVLXVUnXhpi+T6vVTCplNFqmFF/02/
	 An8qQU8H8lxljRhqvlQRYNGnIIHjdnallSfvETHfUD/7nNeWRIDYKCKssB5Lgeezck
	 9rheVbQu+WOnUkejCvITtSkUlSYfF7mU9S8Dx9c+w3/wS01eQxJe39htOLRsZ6GgAO
	 E9eCno0vrLUEejXILEA2TkZzlrTqatWrcf9m51ViyVbp6Hxa/IzxEIM8BTHm09rQ0Y
	 jQk37wzxChaVksiOgCEf0XoIB2uSdb/FETkp4WX29ZmJlcP5i52P9IFPatux0bJQg+
	 L7PuwiEKbaZcA==
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-6e2c678faa3so2065254a34.3
        for <linux-gpio@vger.kernel.org>; Sat, 17 Feb 2024 09:44:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708191868; x=1708796668;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K1I3Xe6qMPJRuxkw9XV0vnDH1h6TWduWqAabd4p6cd8=;
        b=HeK3bJkkN4HD4AJ02SO7liwb+xm0AjjmP8/S3qDU35IyA+p0FtoGxQphQIuCgQLbRu
         ELXy89FK1jxJvFtkzBJ1iEXajrKoJ/qfegzWYAQC+6o+sQQpHrvDE7uHpD7WGKGTAVlA
         6d35nuSKi47YXU6vMhx37CaYiGzwA/k5FxjaT7dD5BJwxdnlQW9pxWkr25yen+vq86qN
         +1GL80Rm0LUE6VNJ/mjgMwUmqrpQRiMjErDphoJz6AkPIFACwCahkiPwejV4YgDD/7lP
         XCH2Ui4eN2E6lQcG1KxQbdZE+nFmGvWdnFgZb8KJffIPB1pkzlGp60JcetRzkR9Lbo9f
         SLYw==
X-Gm-Message-State: AOJu0Yx37Y61g91H59zniQnOURa7w0PBvf+4jyI3uPyIEG/68NEM4odO
	v1dalHBCr4TYZj1xRjIMHVvpibizibLXIuhPPQ34Rlknc6OOycGx+xZN1ti3KCLPT3VCf3sAfOm
	wISFMPKRBQsf3LZA7s29Eo9HwLFxfH5GKTRlsuvRySNMJJqo5rQos0xSRe9DUQ2htUkk5pALs+R
	fyjl/7dGQpfwr7nnEgGVmuh7dvSu6Fi7ctrT5FDwEgd3jjvD7dWg==
X-Received: by 2002:a05:6830:1cc:b0:6e1:7b0:fb99 with SMTP id r12-20020a05683001cc00b006e107b0fb99mr8292112ota.21.1708191868249;
        Sat, 17 Feb 2024 09:44:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH1c/Q8v1VsSZFiCSUMkcB0Mp+pfSmBlYWI/cfD/c9vVTlEeIuj5fm4wWpojkiZlGtjZz+W8u85E1uWYJLfwwA=
X-Received: by 2002:a05:6830:1cc:b0:6e1:7b0:fb99 with SMTP id
 r12-20020a05683001cc00b006e107b0fb99mr8292101ota.21.1708191868045; Sat, 17
 Feb 2024 09:44:28 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 17 Feb 2024 09:44:27 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <ZdC_g3U4l0CJIWzh@xhacker>
References: <ZdC_g3U4l0CJIWzh@xhacker>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Sat, 17 Feb 2024 09:44:27 -0800
Message-ID: <CAJM55Z-t9e8L2_iFfdbCDpOzi7UxQao6-L6VU_W9OGBciJ46bA@mail.gmail.com>
Subject: Re: commit f34fd6ee1be8 breaks current dwapb gpio DT users
To: Jisheng Zhang <jszhang@kernel.org>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Jisheng Zhang wrote:
> Hi Emil, Linus,
>
> commit f34fd6ee1be8 ("gpio: dwapb: Use generic request, free and
> set_config") breaks all current dwapb gpio DT users, for example, getting
> cd-gpios will always fail as -EPROBE_DEFER. Before the commit,
> dwapb_gpio_set_config() returns -ENOTSUPP for !PIN_CONFIG_INPUT_DEBOUNCE
> then gpio_set_config_with_argument_optional() will happily ignore
> -ENOTSUPP. After the commit, dwapb_gpio_set_config() will return
> -EPROBE_DEFER unless the gpio-ranges are set in DT.
>
> The key problem here is: almost all dwapb gpio DT users don't set
> the gpio-ranges DT property, so I guess current dwapb gpio DT users
> have this problem and the commit also breaks old DT compatbility.
> So could we getback to previous behavior?

Hi Jisheng

It seems like the gpiochip_generic_request() and gpiochip_generic_free()
functions have guards to handle when gpio-ranges are not set that
gpiochip_generic_config() lacks. Could you try the patch below?

Otherwise I'm also fine with just reverting the patch if this is not the right
solution.

/Emil

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 8b3a0f45b574..e434e8cc1229 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2042,6 +2042,11 @@ EXPORT_SYMBOL_GPL(gpiochip_generic_free);
 int gpiochip_generic_config(struct gpio_chip *gc, unsigned int offset,
                            unsigned long config)
 {
+#ifdef CONFIG_PINCTRL
+       if (list_empty(&gc->gpiodev->pin_ranges))
+               return -ENOTSUPP;
+#endif
+
        return pinctrl_gpio_set_config(gc, offset, config);
 }
 EXPORT_SYMBOL_GPL(gpiochip_generic_config);

