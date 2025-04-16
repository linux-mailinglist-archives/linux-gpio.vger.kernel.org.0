Return-Path: <linux-gpio+bounces-18930-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CE5A8B43D
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 10:46:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5F3B1895FF3
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 08:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73AFF22FF30;
	Wed, 16 Apr 2025 08:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pQIxtCD7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE191B808
	for <linux-gpio@vger.kernel.org>; Wed, 16 Apr 2025 08:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744793169; cv=none; b=QTuK9Xha9WznWxSMakv4iTEEZvTCzhYF0g9KJzrnAJ+bcE8+wCgDMgNF4yTrF00Zgclo26jeFKWCv6eFGrXeR+hhUsZwaO+OhOtMGkm+Qhq8ETPR9TkCgSkESsTWmkibY0KhsYDQlQ7mqs7tWAMp9DIsymZ9QTKT+3g/Ps0dDwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744793169; c=relaxed/simple;
	bh=dJWpmPmeZz2KNsdUSgiti8HMS2NRCkbFkDayLtPJquM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NorgdHNsAgAqeMJyRb1PUlQpJb5mLy00uMJqliheMeHruz/fG41ZmILgwirg3QUIs5htGpUsmM/ySgrO728dKibBKwZ6vyu8djWVNNkDjihUfqV92+aXUFCWn+txNDFWZhRbcG2zV2o4bfbEV/aEAgOrcr26oYmj6yO+S6nefqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pQIxtCD7; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-548409cd2a8so8500291e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 16 Apr 2025 01:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744793165; x=1745397965; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dJWpmPmeZz2KNsdUSgiti8HMS2NRCkbFkDayLtPJquM=;
        b=pQIxtCD7c28GJQND7ElsXZSYxd8K7U0k641enIdJwSHbYCVuyXcSKAoUVlQf1jhPjM
         I9rgHSHgsE3O7aaHkPSMax6H3q87D2NV8BjclLu8b9s+g0bF0rMemv0tRbvtjWq+qbeY
         vURAppp9nZFSIxbKzsxLAWM4T4iSFG2t4nRKNZru61OAHW3buEaJhg0DOx5B9LAyhC30
         a3k+AEdKWy91facoYasDSw4hkaZ4iosGtatyf7aLWOVkGibNg8w4ZiTxW9GwesfjrRIB
         0it5vs58XbA5+kB6XoJ9vMlgahC2k+hUppQ5OTRan8BiBCEEiIvJ2Dko9EVht81aNjo0
         C2uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744793165; x=1745397965;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dJWpmPmeZz2KNsdUSgiti8HMS2NRCkbFkDayLtPJquM=;
        b=BmlYUzZ28k7FXGCO56gUIxoeWOxkjxl8xW4Q8RNzBk2knYAvVjoCTOguVdJcnVaefn
         +C/NWM7b+AsaRBqV7yts+b8bAkzCXKW+82In3CEowNwykmETYXEb8EFWUzFc+FLVsntJ
         dZOcXs5Jj4bSpdCYHWUVqac17kcak2fPX8NZDsqHuUwF2W6J6bl6vP70S7Yu8dDkvTxV
         FvCEzQQ4ALeh0mAHTPha69lLyay0p9mCShxlWeKgJfDS2Xs91YZ6E87nyNN4UijpQo2O
         MDCnOsRe5lrUd0Y76kFsnm1h5oTXNfYMR/Ya2x/OHqLY/GG0L4i7KoopW+/hKNb1HqeA
         lcKg==
X-Forwarded-Encrypted: i=1; AJvYcCX30HEwTeym7uqCBazhfVpFv7pKimf8UC/btCPpHrZDDDzOC2igUivM5oFg872Ynb+hzQgAh7Yf39Jb@vger.kernel.org
X-Gm-Message-State: AOJu0YxzQLPrVUeXu1Fim3V/XFo9jug13voXC9QDpP2wZ2iuBqyPGvCe
	a+z1q6Rrhau6OViQYB8XD+G9kBhzVJuoG5586+aw4umV09BHFsllYtkIy8ezsInzYxJXpCV2pBK
	Ok3MgnbtdbsD0zUgf4paTxbTxMnvrXTxapznf1A==
X-Gm-Gg: ASbGncuPBa9S8QO3gNJhPpR+avRdt0SxB9hNQW24+eFKYtGW3VEPKNQ4nfTI/8B47Wj
	xeETTguYnjkR1GdX7Q3pre85oOgzYxhdz9YjvdFwE9kRPmk+oDdD1qSn6m0L9AVpSGkQ+cAGdIM
	aK9B8GRuiOB0RWX+F3exQeQlTT+t5pYwLX
X-Google-Smtp-Source: AGHT+IHER4G1YW/HfugLB0RhEmlqCUXgsHRN71mbKyITUVzly9VKf5bLZAouG/qB8jIC3heoEwHvRcEVYlxmXDpX/Zk=
X-Received: by 2002:a05:6512:ba6:b0:54b:102b:af56 with SMTP id
 2adb3069b0e04-54d64a7b607mr299899e87.4.1744793165426; Wed, 16 Apr 2025
 01:46:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250415111124.1539366-1-andriy.shevchenko@linux.intel.com> <20250415111124.1539366-7-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250415111124.1539366-7-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Apr 2025 10:45:54 +0200
X-Gm-Features: ATxdqUEeHb7bVJDEFYNrc_akyxNXE7o78pfUAhkyDtfdhV5o7_0R7syCdQ83ur0
Message-ID: <CACRpkda=5pj63VQ3Ga+JR9Hp29Hkt7reBx=NzM6mXMNFUT_OrA@mail.gmail.com>
Subject: Re: [PATCH v1 6/7] gpiolib: Convert to use guard()() for gpio_machine_hogs_mutex
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 1:11=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The driver uses guard()()/scoped_guard() for the rest of the synchronisat=
ion
> calls. Convert to use the same for gpio_machine_hogs_mutex.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

