Return-Path: <linux-gpio+bounces-22767-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 694F5AF82EF
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 23:55:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB126583FAB
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 21:55:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 363A324C06A;
	Thu,  3 Jul 2025 21:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DIAXaAw/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457B023909C
	for <linux-gpio@vger.kernel.org>; Thu,  3 Jul 2025 21:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751579733; cv=none; b=by7JUNKrvVMc73ByA+TT9HMonrHcxYjvZCSgXruCGiJ20ZKTuJdt5V1RbN2oQvcZBDI34FqD9s5m+nFhTUngJz4p/cafl5T1Y884mz8usFwIN0wUvDOtgq4qNTom0FQl+sqGmBwKJCz0hQvDtBsns/cPVHpYthRVqcLHwbK8S8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751579733; c=relaxed/simple;
	bh=YGEkDXVNOX9wPiYmSwP7ApJGABwjYWXqzCX16ikn5to=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MJ1IyNGoNzLA2sCUrEE/5H8IvslGwcxzxBCug19yl/ByxSz6JJyawktngXo0MZ9wi07wgiId6SyOgEmVqSd0JesofCi+LvM4C+P9wVgg16brNtJVhHsWZLKM7HBAgBGFywn1n2zJ6EwDUBfs2GQ0LrLBZ9e+ajXD6TiN9Z1L9ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DIAXaAw/; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-553dceb342fso374633e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 03 Jul 2025 14:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751579729; x=1752184529; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YGEkDXVNOX9wPiYmSwP7ApJGABwjYWXqzCX16ikn5to=;
        b=DIAXaAw/6jCpCnH9WPVnrT/smB2pxpu+nlrVZoInw5ey/7TuWTs6qBXdapRzgHkW/h
         42bhO4PjsEiejJ2YF0SNFtlrn7MsnicwNqQKZNceyyQPHszXZnf3KchjnMM/nEJ8htzI
         3lzEbB6Z05wHBLjPBpcETp8ZcGQTLsaSBRMAku1M7pHHIrR4f6E5nAmzng2srkBPLkd7
         oCzX76UChjCdTQPS6SZ91RloCyyEMAyBKT7vLYtyKIbB0ZPFpAFyKgtuDHXcRtj3ViIT
         DIu9Ol+sOfOwd53mrz1SRV4n3S92m7U75qzLaT1Rjt3jwaB4Gt7YLr68A9Z3Ywffad5v
         Y+9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751579729; x=1752184529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YGEkDXVNOX9wPiYmSwP7ApJGABwjYWXqzCX16ikn5to=;
        b=N+y65+iAb+w0sBA3brT705tjkUYLlRRMg5x0w2zOJ2hGbPJ3H3T4tamXlLwa88XfBz
         R0yap8NtE5fVf/dMCWprP0RodOfTl2tqMdWTArvgq8Wa1TRyoPxHfAcIljn5gmBGGkAD
         mzzTD34Vk3uFlNvzsqZGICN+Wwysm2MyDTR6J0qOn48VBbqwN9Lp9N3zIycO2oSZsXif
         e9II4IgVm3HKyI49fzYXR+v2gKLZBdJR3+5JtEoWnsDD5ntFvyOQ6/zZ//0qxO/UoyGm
         a/7bAY6RxaXAlrTFZUjuFJu9+jyiovderPw28Q3c15wLOPRg7pl071S9QhPdXqixppla
         26xg==
X-Forwarded-Encrypted: i=1; AJvYcCWqXYgu36Gm+z/Q6RchpPYutJb48m9VEYETpB85rzONupgddYA5Jg/73MFO02YOsQNtt/hdkPgfdZoI@vger.kernel.org
X-Gm-Message-State: AOJu0YzgPzKlsiEhQeq7YDxna+SLR0E5BIKya8ADW0WsEnWz9jHZew6m
	8X3sVu8H9NVeanovnIoUrb2xAfxRI71lcgWB2kiiXas5v7GV3gE0ZoULyFO9QNPtJ7C0dpcxi4v
	ZadzwtuPrwntixZEi6VyKQDKnAVSWD2lkk+siSfjMpQ==
X-Gm-Gg: ASbGncuHWz0rGUa0ayH+v60O6MCSKyh+A1whRBrgI8lpw3N16g3Q9ovDhxrx+ulV4WY
	IWJPh194b83lWDbuLvp4FAkSCGHnjApDmpDmkrZa3PNlcRx5W5u9jjFLasC7GEfeKLmobG4TqKV
	JSiKZqilBquu8zcmti6IKo619RnvAvEkk1lHW3GsK/Kp/d7tnKg9mwkA==
X-Google-Smtp-Source: AGHT+IHy+6VU1NwR5hSQKpWzK3RCXChUuB9Un+z3AYwhqdaiRedo471AkDhodxUcy7i+LlhTDM6edhCtprSC1oAz8MQ=
X-Received: by 2002:a05:6512:ac1:b0:554:f7ec:3b23 with SMTP id
 2adb3069b0e04-556dca2b8f1mr22283e87.15.1751579729319; Thu, 03 Jul 2025
 14:55:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
 <20250625-gpiochip-set-rv-gpio-round2-v1-8-bc110a3b52ff@linaro.org>
In-Reply-To: <20250625-gpiochip-set-rv-gpio-round2-v1-8-bc110a3b52ff@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 3 Jul 2025 23:55:18 +0200
X-Gm-Features: Ac12FXzOS746MKEQ8T_6q3redzT1OE7J4o6V1m0jt5q39x7cc8PQ_RL8cK-Gjdc
Message-ID: <CACRpkdYgx-XGu+yg1u421Pwb8o+7OW7xBgCkcP1KUzRUz6dUuQ@mail.gmail.com>
Subject: Re: [PATCH 08/12] gpio: stmpe: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>, Andy Shevchenko <andy@kernel.org>, 
	Thorsten Scherer <t.scherer@eckelmann.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2025 at 12:33=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

