Return-Path: <linux-gpio+bounces-18931-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE930A8B448
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 10:47:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 686BC3BB57B
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 08:47:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38B0723237C;
	Wed, 16 Apr 2025 08:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QaGjG/WL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39512221572
	for <linux-gpio@vger.kernel.org>; Wed, 16 Apr 2025 08:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744793244; cv=none; b=g62rMvVFlD+/u+UrmHzVvkNA+rv81w8YDt8HIprytRDl1/ZHgTk4DRnnPq59+P8SqaKPmiySh3ZPIjX3K0DQriSu5RixrXnnA2PIEUlOuwHslkWQ8BezQ/W3RnibpdSYx0XayBmIfYh8SYqizbhvnsN8wtHyUK6ONXZjSmZHQ9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744793244; c=relaxed/simple;
	bh=DVijI2dxiTZi9DSjzLlQHoIR5BS/mftcsULF5DCiaCk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bM5OS7rQLt7OexsVkJQ5F7W+rMjoNdCKODC9MQrCfAFN3a1tqlqNhjrIbIskVcisEAwWt9mBX3cBYuF/5oc1XY23PXAPhH/Cso4mMbU0s5IsWRg7GUkrHE7yFI2pk0T5GvnxNlwzXt0gRvt9KEJ8V/zxxiykXR9FB8elahVrvs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QaGjG/WL; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30db1bd3bebso61854441fa.2
        for <linux-gpio@vger.kernel.org>; Wed, 16 Apr 2025 01:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744793240; x=1745398040; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DVijI2dxiTZi9DSjzLlQHoIR5BS/mftcsULF5DCiaCk=;
        b=QaGjG/WLT7reWecVBbGUvzQ41xDqv3UYENLHtF3rv30voMVweU0jBOGJbMjXknWPjR
         Gd4Gc9NtElIbtj0hDLG/dtchFKpQ1dfS3P5I7h48+Ck4pn5YCHjsPM96kSFaEydU/DrB
         i9W7MlH7MxtfJBxy/2+FlIVZL3Ie2UWO7XPOpT3WdE2UzT4eigpzW3PplSIICf99RLe4
         aFU8lBCwuLJKUcQnGVLMl4jWkZINgNUz5NoxwcW5mTP5022PVeTH8liYNrx5ezI6KE+G
         1Vd9+fxyD7iAzc5gbnnX245kZBzqjBDmTSg/uS7RT2IQp6/l/FC9XFRvqHPvHzChI5lE
         MhKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744793240; x=1745398040;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DVijI2dxiTZi9DSjzLlQHoIR5BS/mftcsULF5DCiaCk=;
        b=HADm7gP8Cl48LV6fdbKXRVzFT0m0GdEobvoIMf4iMCF/GKNFynFJduVlEns9nboCO3
         LHyKu8zqldH6vD+pB2PbNwLxt6TUsN0Jfx0yvDCRSzxItxA5aYMHGF1yrmEMChR/sYVF
         mYGoaB/t/524s6vposU5irS2hBkuFXyLJEQGFl3aRDLNbjpKGuFG0rW0mgMHfpiZlwFd
         7rVqN0cUonDaG+HvQ1hc26eUkGCqAScH6h1Oqml7Gr16EfvLZrTmhWDOa4bqjQwLcOub
         N1xtZBlTFYiBRLUzM0gb1DZDp//5wlPRKyyoPFt1gV1pWA8a45gW+Hja7euG9yRGRonn
         i+gA==
X-Forwarded-Encrypted: i=1; AJvYcCUHon5hD15spbav0+P4J5uzOrr8f2lDMIpOG4qD9hHgtOHBCbvcXg3og182eMJtHmmAHUOm4nIG5/IJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6utpvwQXWLVJy+Yu45Y0oLelRJJMmRJBFuz48L9L3uvkaGSUn
	PHs6fs5b2DIUmmYpfV6uF+4sym5p4UsbQkv8tqB/dR0yE+EAO69KFgewG8LBm8xCSPVTqQaU7wn
	TzgfQS530pF1hOPMq/FM6etJJTePGGix3NR9k7g==
X-Gm-Gg: ASbGncuRnraMu6x5UOp7fzWcpSNMWTDiYGKPSh+BTqMH4bTlXy5XwsUYBi9hlXBneB9
	A/kVxIYlQ5c3aseZ1gsLOEYNZWSKy4H/n7Z2iuUAZc8WhsgSblFhZ9bCYv8MXIq8HtD1YM1H+Mh
	2ot9AHFrR7RAD53a9NKrJqZw==
X-Google-Smtp-Source: AGHT+IGndggoz2F6Itcsl8+fV3DcF5DQivHsEWse1FrEpMgliIiN/YyIss9v6nK+v8EDcLYxaKNk0ELkHKV4PVUZgsI=
X-Received: by 2002:a2e:bc29:0:b0:30b:f42b:72f6 with SMTP id
 38308e7fff4ca-3107f719e11mr3603631fa.32.1744793239503; Wed, 16 Apr 2025
 01:47:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250415111124.1539366-1-andriy.shevchenko@linux.intel.com> <20250415111124.1539366-8-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250415111124.1539366-8-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Apr 2025 10:47:08 +0200
X-Gm-Features: ATxdqUFc1UKbPNYO7BKvMq1Wj623kn4RUC1cwQ4D_X6YnwRJCLcLeq9fPH1GBYc
Message-ID: <CACRpkdarwJy9KtuUDJP8TqmKXjrgCC3RxZxRHPQzra37Jo4b_w@mail.gmail.com>
Subject: Re: [PATCH v1 7/7] gpiolib: Remove redundant assignment of return variable
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 1:11=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> In some functions the returned variable is assigned to 0 and then
> reassigned to the actual value. Remove redundant assignments.
>
> In one case make it more clear that the assignment is not needed.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

This is actually really good, because if someone goofs up the code
so that assignment is actually needed then the compiler will
complain. (Arnd told me this.)

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

