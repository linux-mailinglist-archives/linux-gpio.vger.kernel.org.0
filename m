Return-Path: <linux-gpio+bounces-7489-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2AF90A900
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2024 11:05:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4E8EFB26588
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2024 09:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5310190679;
	Mon, 17 Jun 2024 09:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sUfLy9y7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4501836FC
	for <linux-gpio@vger.kernel.org>; Mon, 17 Jun 2024 09:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718615133; cv=none; b=GUS5mg/8q6Iaa1e1wW0m7hN7Vk3I5T8FVMCkY3fAVL9nFa1b8s/4rtTAep4wlpbiUxQeAr/PtLZG61zPGmL8qXBHPnOrdP8DXwxDLrZos9qPWWOvIKLbbEGhMLA/wlUrzhA0iSpsZWH4KN5VMNCsW+qiHT4+M01SdEznetbsMws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718615133; c=relaxed/simple;
	bh=2qd1Mei1wwX0UchPRM4mXyaYSq3Wo5xLlDbZaNpwJO0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DuP9z0QIBWM9E55KFG1JoDr1FJOyIo6RXWv+PKdTtEayz70kNyuwueQX5A3+wfaN3xy8ciGZZOUIDZNJfvcDmVSZIsD68s4gJUPfy5s/umhJ/2tksU7B1t+7/9PEqcrnmZyPLRHBT4cavjJ0qGY6R308n8MqxJiTibuIoADjz8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sUfLy9y7; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52cc129c78fso87875e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 17 Jun 2024 02:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718615130; x=1719219930; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q9O5LByFtt+Rn6r33us7uUE4ujAvZTYRT1CSnvr94pI=;
        b=sUfLy9y77sQnqBZcMVIOFugZTW8FrhkUmBMo+PZghFrZNiaksytlMoEszccsGqDr6w
         Kenue1Vqp3cbbSpiCTZiFjVj53KU26Ldr1enKc7HQoXg5fC3KZZYjuHX654diZZ9c5Pg
         NRRafm7zcvp281ISy2onaOJG7YREmw5X4cawN8VUjaPDRy8tsieDjnyJA1Bwf0iB7/Yr
         aOBuHH/MFDt9+gfULU61apdyuxcDy3uEIHYKTKB5kbDdwWOUeeZuNZM7/OHn4GaQf3ND
         IlAcHJ/bgR6jVKiFgIsv7BkMhQaDE/NlayGSDgrjfFBHoOqTqkwMmwdxtSr4birAueJr
         2hcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718615130; x=1719219930;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q9O5LByFtt+Rn6r33us7uUE4ujAvZTYRT1CSnvr94pI=;
        b=LUCZ/9CbryEdqWWMkF1alYC0DtN7u94QqsDuf7WLYHxtbCOyDlDcGVs5ZkBouO3oim
         bguOjKMfLQ425UoggeNkHLTMjAc/QXjAs3KA92jzy+tncbB4U9enrBKCruru+bMm416p
         YUO6e1bf12ViVFM6CgNNvRRrliRIMSCSbkCYofXWD4krALxB1ezJ9nDK50JstYLdaW8s
         3Em/jJ+BELUdChee7d7ncm+Ay1psHkoCAwddknKffn/t/3zOY9I0ECqWRqNh/OTxHPrH
         XpL8mWJFjbnsmwViiVIwDoKBTMJJqUqyGEbx8Sb7qTObfoBa2UxoWNjMDhvr5Rc5qLmX
         7aCA==
X-Forwarded-Encrypted: i=1; AJvYcCVehpUJbRFfSWvCC/HeBf7XMHxiZBHGqzWBppKCtsIfHGC6qxvak2rd2RfsyrryOj+FLkNYZijdN4vWuh0WYelL/777EPEu7tTX+g==
X-Gm-Message-State: AOJu0YyRPuUNXDsavY5XZlLMDDYPgsztD6ZlOlBq2SYOeUKrsqH0fd+/
	JvyMcErP+ePDJt86d7ssBCLsjwizOI7jXUVIxUexlZ60l16NT/R1ysT/KD0uMRTmVbXrYEvw0J5
	pkhAxzDKkQPBmdLA/Qwyw4I9f58jwzi7fLjwWsQ==
X-Google-Smtp-Source: AGHT+IHMsMz6Eo93MZVW9ro9lb8sFRbRQ+Qzq2zOGX5OgV334DV6V5CjQlHXoAN7v+2vSTKGhcDPNfKioSH3n866QaE=
X-Received: by 2002:ac2:528c:0:b0:52c:836c:9ce8 with SMTP id
 2adb3069b0e04-52ca6e5506amr6350972e87.4.1718615129907; Mon, 17 Jun 2024
 02:05:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240611171509.22151-1-asmaa@nvidia.com>
In-Reply-To: <20240611171509.22151-1-asmaa@nvidia.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 17 Jun 2024 11:05:19 +0200
Message-ID: <CACRpkdYJyeOYYraBn6GKrCmRGO1L8eFsWPbhsEqc0OwXUWVorg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] gpio: mlxbf3: Support shutdown() function
To: Asmaa Mnebhi <asmaa@nvidia.com>
Cc: andy.shevchenko@gmail.com, bgolaszewski@baylibre.com, 
	linux-gpio@vger.kernel.org, David Thompson <davthompson@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2024 at 7:15=E2=80=AFPM Asmaa Mnebhi <asmaa@nvidia.com> wro=
te:

> During Linux graceful reboot, the GPIO interrupts are not disabled.
> Since the drivers are not removed during graceful reboot,
> the logic to call mlxbf3_gpio_irq_disable() is not triggered.
> Interrupts that remain enabled can cause issues on subsequent boots.
>
> For example, the mlxbf-gige driver contains PHY logic to bring up the lin=
k.
> If the gpio-mlxbf3 driver loads first, the mlxbf-gige driver
> will use a GPIO interrupt to bring up the link.
> Otherwise, it will use polling.
> The next time Linux boots and loads the drivers in this order, we encount=
er the issue:
> - mlxbf-gige loads first and uses polling while the GPIO10
>   interrupt is still enabled from the previous boot. So if
>   the interrupt triggers, there is nothing to clear it.
> - gpio-mlxbf3 loads.
> - i2c-mlxbf loads. The interrupt doesn't trigger for I2C
>   because it is shared with the GPIO interrupt line which
>   was not cleared.
>
> The solution is to add a shutdown function to the GPIO driver to clear an=
d disable
> all interrupts. Also clear the interrupt after disabling it in mlxbf3_gpi=
o_irq_disable().
>
> Fixes: 38a700efc510 ("gpio: mlxbf3: Add gpio driver support")
> Signed-off-by: Asmaa Mnebhi <asmaa@nvidia.com>
> Reviewed-by: David Thompson <davthompson@nvidia.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

