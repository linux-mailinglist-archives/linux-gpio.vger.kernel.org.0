Return-Path: <linux-gpio+bounces-21653-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BD5ADAA36
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 10:05:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 958DD3A1D4B
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 08:05:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38D98207A3A;
	Mon, 16 Jun 2025 08:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="JJefz5RG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7AF1F3B8A
	for <linux-gpio@vger.kernel.org>; Mon, 16 Jun 2025 08:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750061127; cv=none; b=KQyh2bJJXbzo+Fld22sM0koMUfQcsp5yM8ZWII1mf+S73hyj9WzLwWAcCdJkhS1NdBd7kVcyxY/RQAQQ2Z9ovQVzIyouwxlnRGqeF7KXVIYus6Lb9vl0ErPxciqccawoqeu7kJ1d3VYBsH8kXRn8TpdYZjTeP7XAvNHLASwktv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750061127; c=relaxed/simple;
	bh=nyf2g989nH7J3pvCSN0gr3wDLJxFEUoowOZ4vMGp6J8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iVyaDPmhAjkzuHjx2+7HLt0oqQruemQd+bQOXSKQSt6kmExk+iANINXkOfvucpPAiqPgPZj8jSKiLKpt3psR07wuqF0bY7SYXgkGWVetoKo8QoIWUmG0yqdlH/0FkeSf9s9GumNgfRLMHPuY+z5lrjqJ3hiMVGX5WJ+Cc+/tWEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=JJefz5RG; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54e7967cf67so4248516e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jun 2025 01:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750061123; x=1750665923; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ywH8Dejsdq3x0VdIrtMd2wFdmECbqVFAg+zOSDofJ2s=;
        b=JJefz5RGZlrQY03Wq03TJ94YFJyignEWyGXHKpL+FwbygEHUAj9a3rxUI9EhYnTHyQ
         wAyDY7n45nN0vHunGupFGfpKW1RXIrMYZa0uQ6brESkicX6ngQFf+mW+tTX67My81c7V
         0qYpUlrs2TPt3I8tQxTV0ko+1218f/64A9QvZ44h4hW4Fnmiy5yVv0nFDUA7TOj0gz5t
         1a7twkvo3jWhrGqPbQ8DUrkziGQeMeySx95fpptSTlMJAwTW+BHDPxY4FSpQPCWzFMkC
         cOPETOxTx2QcvGBu6FTWIvgda9ggHLXmZgxFYoUtkrzHYWWRHti3EStFHzYiRemKgrIP
         ZHWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750061124; x=1750665924;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ywH8Dejsdq3x0VdIrtMd2wFdmECbqVFAg+zOSDofJ2s=;
        b=VTFG3/8jlCDpWp0SUOSvI3IkVzwjEl/BvGfCD+kKRdFd8S7ncoNVUweslGtd7BB4Gq
         Fr81GhSnbrk7LlBMnt0d8HumKO7aaxb4PuSVGwJfE/f/H5GRTYfU1Kh+Q1YPFG71vicU
         AvEkAluyG1l1+G5fRUPWoLROccDY8YgMWIq4YWxETznRK0ZfSsfBRMG8g16Hfq8chPTx
         cWcK5Lca2pe7ePx26XaOUHdL15vdXskzeUUi8grkc5ttnIZDX0TfbKbJT/GSRufYyMU5
         BuRt2jsfRV5NrUaEPQKI18+KjI7MGajedY2UWNds1vkRU3Pqeob6kHI0qIo0c1KGUT/v
         Fekw==
X-Forwarded-Encrypted: i=1; AJvYcCUcsvkaACxtkarJGY8pUHV5rB/n0STNV0DkoIlNaMnxSD8+kdxvjXZQm6qm7HtltvWzpIany+lKzgt9@vger.kernel.org
X-Gm-Message-State: AOJu0YwCo+pS7LeYZs1FQjS1t8t5KFxm6HJMxrYjZZvwTvq6OfwOgfoP
	BWU0eS2hadULY/Q+8Cc0nuHISw9W3QWcsINyqMV3dnX5oWqZsobDv4c+WK73JHwZVYDJcGbgGf8
	krcXrMaPlEQW95FsZMUYLgXTRE46YA9KoenonStru7Q==
X-Gm-Gg: ASbGncu56BLWlJOiGCt8qcC4jkswjqnx/MuEjgjG3jZQXXNUWKKLlBHMi+vBU/YF3so
	plv6WopF5xNoeN4uXP2KnKzevSeiX6TPLPYycJHOPfSmVFQ6yVhmUeYFJQE69NvyH5mDVw8IueZ
	ZPAzVe9y3WYEB5DtnwGAcnso9Lbd3X1KcSpeaIjyeyJVWdkHZRHi1psl8iQD7bt1yn6oVKfXltB
	H4=
X-Google-Smtp-Source: AGHT+IHui39rGOe78ZVv1GL/qozjTCuN+gIRPTaD2LzbbRuwGK+ExSJGXv1lf4f3l/OzpiTJL7GG+3gb2jdEJtZBUck=
X-Received: by 2002:a05:6512:3e07:b0:553:2fa8:8405 with SMTP id
 2adb3069b0e04-553b6f4f34bmr2175898e87.56.1750061123552; Mon, 16 Jun 2025
 01:05:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613-hdp-upstream-v5-0-6fd6f0dc527c@foss.st.com>
In-Reply-To: <20250613-hdp-upstream-v5-0-6fd6f0dc527c@foss.st.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 16 Jun 2025 10:05:12 +0200
X-Gm-Features: AX0GCFsKseF3x4tMXUWhM7GW0aQJySrNOOS0VJu19t9Ohnme0LPMU6-HMe9h4i0
Message-ID: <CAMRc=MeTmwgbHv9R_=GFmjkAV4Nvc-SeSCOz1k6pnGUrF+R9Mg@mail.gmail.com>
Subject: Re: [PATCH v5 0/9] Introduce HDP support for STM32MP platforms
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
	Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025 at 12:16=E2=80=AFPM Cl=C3=A9ment Le Goffic
<clement.legoffic@foss.st.com> wrote:
>
> This patch series introduces the Hardware Debug Port (HDP) support for
> STM32MP platforms.
>
> It includes updates to the mmio gpio driver, the addition of device tree
> bindings, the HDP driver, and updates to the device tree files for
> STM32MP13, STM32MP15,
> and STM32MP25 SoCs.
> The series also updates the MAINTAINERS file to include myself as the
> maintainer for the STM32 HDP driver and adds the necessary
> pinmux configurations for HDP pins on STM32MP157C-DK2 as example.
>
> Signed-off-by: Cl=C3=A9ment Le Goffic <clement.legoffic@foss.st.com>
> ---

[snip]

> ---
> Cl=C3=A9ment Le Goffic (9):
>       gpio: mmio: add BGPIOF_NO_INPUT flag for GPO gpiochip
>       dt-bindings: pinctrl: stm32: Introduce HDP
>       pinctrl: stm32: Introduce HDP driver
>       MAINTAINERS: add Cl=C3=A9ment Le Goffic as STM32 HDP maintainer
>       ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp13
>       ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp15
>       ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp25
>       ARM: dts: stm32: add alternate pinmux for HDP pin and add HDP pinct=
rl node
>       ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp157c-dk2 b=
oard
>

Patches 1-4 and 5-9 can go upstream independently. I suggest taking
patch 1/9 through the GPIO tree and providing an immutable tag to
Linus to take patches 2-4 through the pinctrl tree. Linus: are you OK
with that?

Bart

