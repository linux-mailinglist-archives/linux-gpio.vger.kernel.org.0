Return-Path: <linux-gpio+bounces-21859-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F87BAE00D7
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 11:00:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6FA819E1F30
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 08:59:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C7FB27935A;
	Thu, 19 Jun 2025 08:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="syAzda4n"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB3A265CAC
	for <linux-gpio@vger.kernel.org>; Thu, 19 Jun 2025 08:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750323515; cv=none; b=l8NsY6kLdakLYwH7Ya2i1UB07bux26jgSwh++H9pFK8Smwn/0+P0LH8W/c2WK84KyGrmjaCkJqesAnjsvItdObs6ZsLtx6zLHFk/mI32LjhmSXWtnPFg6oc+QWG7I8OFWJgN/iMwF+kgdoP7j4fskgMTjLxHamZSiSYxS+xbJ1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750323515; c=relaxed/simple;
	bh=YQQ3Ad8xd/gXzhSgWbJo7HjFzyCo0MZmJJg+rjfMpiA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=becshZcQFlmgqwrEhlSJCIwrmiwz//KUYSqhlPgh6EFzgfws4TFcdUs0oUAIdyNWvAi08Ejl223DUyE9GYhNef1kl+La8aVyitbBgYO1q2OPnMCDi5MoAq3FYo9gGD+o1TIBCnCJrZDonC29TEZIvmqfBUsAyw3Xw6iHFEHqPps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=syAzda4n; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-553b16a0e38so572342e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 19 Jun 2025 01:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750323512; x=1750928312; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQQ3Ad8xd/gXzhSgWbJo7HjFzyCo0MZmJJg+rjfMpiA=;
        b=syAzda4nUuFCXxkOwFO1PtX+6nURrXJAvwVnHPX8U1QHHTm1gVVjVGybPEIX0sm4jZ
         b6YMbsSjk1yq2ondBPURwYByC/C8n8XB5vPCouw+GJQtd2T9b7FEE0vpjfK8GPCgFkLf
         HP0uDiga4lRV12XbHvlY3A8t65CL9XhpszVg2/ikjtALSvUCzk7c91SfLsUIEpduifKi
         2KmmhY6mrTEP75sSMXwi8QJEQrvXOnxQ0jGCU4xYSsPxv0FvGhrvFwqbrZb4t10Q8WaE
         iJlZCg8cIQA6wQA8KWQxicorAzK2kfXv4HFruS2NKDIPw3PsH7hG3goFOlwqoitiQ+F0
         gQhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750323512; x=1750928312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQQ3Ad8xd/gXzhSgWbJo7HjFzyCo0MZmJJg+rjfMpiA=;
        b=orzQpw42WL5KBs7EnKQxuW6mEFPl28D9GffgCzQfkOrZK10fYZFwbFd/ZzjVL2j3ll
         6SIrz/w/Q2kJz1u6x0OaVkDx70HsF+QyNMzTX4EWukmKPHgSrOM5ng/ndg4zvgMoUZeN
         veV3hmI8P6RVuxaYFcFD6xukBuzgnjInpTDcJsz3uUlD1e9rVmai+pOSDHj+JlXB7R6j
         bRwCs5PptJ++Tf8Dihl058dMWuuizlsIwQtHQamPgXmzx80VmmQpCdCnZCwrXez3O2iJ
         P1D9Ba6cc4Mo6bl+qdXmleOHwJxaVBe4Zxt45YUObdieyS5JRk2UgU491y/dmwm4zoyo
         lX7A==
X-Gm-Message-State: AOJu0YznUScEclikIspJbz0KyBpHqGyfUlEJdZcW35o0Lyf2bddu5fKX
	U2sR+cnAa03rkdtuqnjb0OgJW/6s0ogzHep89LjSQ+UVM1RHTiSWFKRTTOOVYW0r8wy1VIVB89S
	LxO0TSqIM9u9xLWRT0bOJagt8hl4eTSMlv19699zCgQ==
X-Gm-Gg: ASbGncsB+LOOJ15BDglEeNHjnTCba37DzWg6vVACuGz8pIqGEDB8CZFW8XQsjUb07oX
	clXnh8FE+8KaJY8NmFbn+U+mEWZBgKQVmQqoPZMC0IZWyKNLMMG6sovSUhEZvFFbbdX23bI51E3
	rhJLUgIT8dyNK4iR9GkfES8o2amfvj2Gt4e45ooEInMRAbGXjxE8vXkSDQw2RsoEnyd2m/lvxvt
	8w=
X-Google-Smtp-Source: AGHT+IFdD/1jTvO6x1IgzidwZt2XK0VP7pgS282orlNSuUnNeGDtt9tznwgJaV6i/23DDXdw4QcbDmhWF5puBYWdpsw=
X-Received: by 2002:a05:6512:638b:10b0:553:cede:6a9 with SMTP id
 2adb3069b0e04-553cede087cmr2038325e87.55.1750323512059; Thu, 19 Jun 2025
 01:58:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250619-gpiochip-set-rv-gpio-v2-0-74abf689fbd8@linaro.org> <20250619-gpiochip-set-rv-gpio-v2-5-74abf689fbd8@linaro.org>
In-Reply-To: <20250619-gpiochip-set-rv-gpio-v2-5-74abf689fbd8@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 19 Jun 2025 10:58:19 +0200
X-Gm-Features: AX0GCFvFwqdMku6Ga1EUw2bxcWk7yA8B4y-QiGMepH4vtYQKsxYzuxQuOLrii5k
Message-ID: <CAMRc=Mdrg+0xUcWnvk6Z8bDP9JuU0ZoVfD3kfaMv+a+dO4AzQQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/12] gpio: pmic-eic-sprd: drop unneeded .set() callback
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Shevchenko <andy@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 10:33=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The lines on this chip are input-only. GPIO core can handle the missing
> .set() callback so there's no need to implement a dummy here. Drop it.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>

