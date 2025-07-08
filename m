Return-Path: <linux-gpio+bounces-22908-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D3504AFBF39
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Jul 2025 02:32:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 324524A47C1
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Jul 2025 00:32:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17DF31494A3;
	Tue,  8 Jul 2025 00:32:12 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx.socionext.com (mx.socionext.com [202.248.49.38])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5B1239FF3;
	Tue,  8 Jul 2025 00:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.248.49.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751934731; cv=none; b=HkcVVlwq7GlgzdeBKMVW+HX0/iazDBRD4lPOWm5CP8ddcPOjdPqiGnt3/wDw51Q593Wu1eSYfZFqTH8GiND7AucqkoN8G8G7G+6Qjj0Acu5tX3bsikoS8lRlB2ydP9LNFG31W4VZ6rtTD3toT5+wJxJkiUKPlBTmE8NeKHN+fKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751934731; c=relaxed/simple;
	bh=lpBAjx+9OIWwohLyRF71S4GHKzadfqw3ME6fZ9/uARg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AtJgp05yBNPIsVrYSVV00ZQ5UPRarqSN+ytdqEKkOzucQRVmdDZFq9Dvy/otmucARoSjyB7suL1Z1lSQP6A2Cqfe06OUcOrp09TxsDvYyJlCB9tktYUPzvu9ggRYQB4h3mf/mhezjJ5TelzuZFKOXITnGH+qL7EnDEPkdov/XfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=socionext.com; spf=pass smtp.mailfrom=socionext.com; arc=none smtp.client-ip=202.248.49.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=socionext.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=socionext.com
Received: from unknown (HELO kinkan3-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 08 Jul 2025 09:31:00 +0900
Received: from mail.mfilter.local (mail-arc02.css.socionext.com [10.213.46.40])
	by kinkan3-ex.css.socionext.com (Postfix) with ESMTP id 34C662069FF1;
	Tue,  8 Jul 2025 09:31:00 +0900 (JST)
Received: from iyokan3.css.socionext.com ([172.31.9.53]) by m-FILTER with ESMTP; Tue, 8 Jul 2025 09:31:00 +0900
Received: from [10.212.247.77] (unknown [10.212.247.77])
	by iyokan3.css.socionext.com (Postfix) with ESMTP id 3CC7B10D84B;
	Tue,  8 Jul 2025 09:30:59 +0900 (JST)
Message-ID: <c300d168-797e-4812-b957-1b761e40ea44@socionext.com>
Date: Tue, 8 Jul 2025 09:30:57 +0900
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/12] gpio: uniphier: use new GPIO line value setter
 callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Viresh Kumar <vireshk@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux@ew.tq-group.com, linux-arm-kernel@lists.infradead.org,
 virtualization@lists.linux.dev
References: <20250707-gpiochip-set-rv-gpio-round4-v1-0-35668aaaf6d2@linaro.org>
 <20250707-gpiochip-set-rv-gpio-round4-v1-10-35668aaaf6d2@linaro.org>
Content-Language: en-US
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
In-Reply-To: <20250707-gpiochip-set-rv-gpio-round4-v1-10-35668aaaf6d2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bartosz,

On 2025/07/07 16:50, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>   drivers/gpio/gpio-uniphier.c | 16 ++++++++++------
>   1 file changed, 10 insertions(+), 6 deletions(-)

Looks good to me.

Acked-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>

Thank you,

---
Best Regards
Kunihiko Hayashi

