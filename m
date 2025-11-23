Return-Path: <linux-gpio+bounces-28979-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B9DC7DA67
	for <lists+linux-gpio@lfdr.de>; Sun, 23 Nov 2025 02:03:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27FDB3AA969
	for <lists+linux-gpio@lfdr.de>; Sun, 23 Nov 2025 01:03:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C17913AA2D;
	Sun, 23 Nov 2025 01:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="hgfYmAUg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B058B1F95C
	for <linux-gpio@vger.kernel.org>; Sun, 23 Nov 2025 01:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763859824; cv=none; b=aojzOHaFc4cDQCsD/65Q/09oZKkUPGbgliO4AW7M8Nqpi/0y7D4XCuEwwY+1KFZla7Wb8tnD3y+JKc7KUW0/di3oSgvio7C7Ygns9QSSvlxrfJRycXaHDMm6LIWXeiAqPL9+OeYtV/3tpZUhRXQuDFCg60l75sAI1Fj+dB3dqmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763859824; c=relaxed/simple;
	bh=dZBWnqeEycXsRUREFq0jWuippb2YxWsp6CSsVp6xLvw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GnuiqRtKSrpeZfWEMN/sXMesWsZxz/DKLunu61kt4sdg8jURm/9aYy+B9c8qJx9AlmYIS+g0/qd6CKke++7HAkM3oHgF3ReAF5Wy6bimbjPGApKqbQGcw3G/LcmejIGRmyv0XbFVUvxLeX8l+dQJJdpCAEYl9cH0WyFNvnh/80s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=hgfYmAUg; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Message-ID: <be7fd390-e81d-4e93-880a-1b6404398408@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1763859810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X7CpocbKPf/Xhi8PfqxX7iziEvBwa5pcU2xWDfn6WUQ=;
	b=hgfYmAUgJXuz1yhx6Xn2xpXGWKFOTblILxmqyzuXTpb2s8nI15SiL23ezFk2+Nj8MSQrAa
	vS4pnRwvdJkg/xwiRz3BcT2Hx4nHXRkF0Vj/6z0SOxJGzkqDDQvAKDHRY3u48rvo8x1Us/
	IYx0ccAOVYeyCrgr2eiB10R9EA5Fk2a6INnDWsRnG+og1pmaSMRV32RmvhfLKt5OjaAuEM
	2WcP0MG8atQZLucUsm7xlxLaOl9nI5bpyJ4jp6S/eCp1FSzNu7CfhjHy6whi0DwUrhOrIu
	16rncN15ExKAsKGZjp3TA9m1+I070nXdJX3EtoW7WrqbBossFVmVhWoQVUAotg==
Date: Sat, 22 Nov 2025 22:03:19 -0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] gpio: shared: handle the reset-gpios corner case
To: Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof Kozlowski
 <krzk@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20251121-gpiolib-shared-reset-gpio-fix-v1-1-cf0128fe4b47@linaro.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <20251121-gpiolib-shared-reset-gpio-fix-v1-1-cf0128fe4b47@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On 11/21/25 10:46 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> There's an unexpected interaction between the reset-gpio driver and the
> shared GPIO support. The reset-gpio device is an auxiliary device that's
> created dynamically and fulfills a similar role to the gpio-shared-proxy
> driver but is limited in scope to just supporting the "reset-gpios"
> property.
>
> The shared GPIO core code does not take into account that the machine
> lookup entry we create when scanning the device-tree must connect the
> reset-gpio device - that is the actual consumer of the GPIO and not the
> consumer defined on the device tree, which in turn consumes the shared
> reset control exposed by the reset-gpio device - to the GPIO controller.
>
> We also must not skip the gpio-shared-proxy driver as it's possible that
> a shared GPIO may be used by one consumer as a reset-gpios going through
> the reset-gpio device and another that uses GPIOLIB.
>
> We need to make it a special case handled in gpiolib-shared.c. Add a new
> function - gpio_shared_dev_is_reset_gpio() - whose role it is to verify
> if a non-matching consumer of a shared pin is a reset-gpio device and
> make sure it's the right one for this pin. To that end make sure that
> its parent is the GPIO controller in question and that the fwnode we
> identified as sharing the pin references that controller via the
> "reset-gpios" property.
>
> Only include that code if the reset-gpio driver is enabled.
>
> Fixes: a060b8c511ab ("gpiolib: implement low-level, shared GPIO support")
> Reported-by: Val Packett <val@packett.cool>
> Closes: https://lore.kernel.org/all/3b5d9df5-934d-4591-8827-6c9573a6f7ba@packett.cool/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> This is targetting linux-next where the reset-gpio driver is now using
> the auxiliary bus and software nodes rather than the platform bus and
> GPIO machine lookup. The bug is the same in both cases but the fix would
> be completely different.
> ---
> [..]

Tried applying only this, as well as this + 
https://lore.kernel.org/all/20251120-reset-gpios-swnodes-v7-0-a100493a0f4b@linaro.org/ 
+ https://lore.kernel.org/all/20251121135739.66528-1-brgl@bgdev.pl/ (on 
top of next-20251120) and the issue is still present.. am I missing 
something?

~val


