Return-Path: <linux-gpio+bounces-21051-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C22ACF0C0
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Jun 2025 15:35:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E674B16507D
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Jun 2025 13:33:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B1BF226D09;
	Thu,  5 Jun 2025 13:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OIS1TQBZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4747B1E1DEC
	for <linux-gpio@vger.kernel.org>; Thu,  5 Jun 2025 13:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749130363; cv=none; b=m//svenyyH8z+kkccBRKsSytGrlPRIFbv2Hs5W7i8MolS4txhKa6ZshwknAC9TqEpguTHLADkBjUsRz0w39yajUJyaFoORjAuf7uYjo6GMwerD8v/3YNyEDgdG+YH3LHBfQoRnPD5QbBitaqbvCcddnPMVqw1QRtNAPseH5ULEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749130363; c=relaxed/simple;
	bh=pW1iugis4xtG9s+eETnQ7bIIF6wv/OD2/0HPPVI9f/g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pHtUF+96+rgjQqCFFzkHey2Ud1INaZVlDRxJ+jwffxQj3M5ZSUJ4ge+/fprxKYr9iQ6vN5UoIKYgCezkaqz28GhdGslfKV3+n8k+UWVvphyTGVqPsalrMhzXBfMtTHnENx+GETEq0/RNo90gtR5ZSIq1Z8Sz+dB9wSTJZ34Uoww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OIS1TQBZ; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3106217268dso8205011fa.1
        for <linux-gpio@vger.kernel.org>; Thu, 05 Jun 2025 06:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749130359; x=1749735159; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pW1iugis4xtG9s+eETnQ7bIIF6wv/OD2/0HPPVI9f/g=;
        b=OIS1TQBZ0ipBOOKp/z9Jt1KYUhmFwZo7Ffj7hpRRd7nw7Hpb94SJmCWr8qwTi/LRZa
         6lu2WYwxzZRCuriri//E5nyRF+Mkln3QzXuMHkcnKcoOy0X51Mo/pWn5txWD4wxr1Wco
         ukeZTzf4DavZfHfDSFT+MVIvJHgXNudEf7ztKV3TuDwWxtnt1FfyqQV8GtebXLY46OfW
         MDbaSPFgzj1TYboMccVFYYFcLomG+y68oUOPowKVJ3uWqoFR1gnTRiDsen20ZoKfgenU
         PUyBLE4e2W1nlTN0SmbJt6UtjOElBmROO2+VGfESiR9kf5Wgjy47S0sZ5MJ4EzpDdolc
         WbJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749130359; x=1749735159;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pW1iugis4xtG9s+eETnQ7bIIF6wv/OD2/0HPPVI9f/g=;
        b=UkkVEI+NsRccJp28lDED66MJWYD+IIASOauepni0QlJYbD6y4OFDp9fLdQsCunGs31
         HWVBwAcrytMZhoB3xnhmpW8StJjKB55q81tzts4korkz7YVld5PBwgWwsqgBMFaeV8WO
         0/UpQ6eagdEsM345+E9rl03iTWg+GCsRYfpnKb5Ow8ygsC4ENW1DzmVkdChdQjI9Sd9X
         RBX9KXtK1a5EHgAXH74hP6a10PYUkZ5Gjf0DgDlQZTiwW0EF1r9jG0A5dorPR6R67ebT
         I/b624uD+XPLo67BAKla3NjxLSg92vUZNO4UdAKY3BBCY4uaGeVYUO6EyC3oqCgvo7lL
         a/Gg==
X-Forwarded-Encrypted: i=1; AJvYcCXWWO3ruYihI3Bd+oCS/t01Wz5ObfQKtFR6eds1gY+dbktjKMzwrz1tYerbfvEcXzqC8lboUKZjUm2o@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1W33BNMP3E0/JCTX0ORXAw6bjJ2tLJ2JBDfI+Y4qMQWQWCUaJ
	O7pLR4CmIT8TSUuZqMrhrPc+E5t2uKJ9YNkxVf/knCRBghZriD3kzBzbBg2BTTa2ZzjtuBIdy4E
	OMPlxKzvP3ESe/45fZqimZrwyAKTJg2qANktkUwZq6A==
X-Gm-Gg: ASbGnctzdD9dNme4C7ZZPLdeCkNedRGzfeHFTi+Sl2WC73EcV+WhhRv7IveK4jiUUQs
	JEONEY6a2IlSWxRWpb2qYWB17MZF2Zlz2RJzX5+zUS+xEUCyfFsuDmTwbBZ0gdsGRjwe6lgPup9
	+fLx2svYHtBWaVUmqgtM56R6xRbvMNtRAw
X-Google-Smtp-Source: AGHT+IE6+QQHxCcMPWQQTqK9V5d4sWGLTrbxqyQTR9ZbF5NR1Ou/BeZZfqyxjXMAwgIBmogu6upkqYbLcvT4mZAdS3Y=
X-Received: by 2002:a05:651c:2106:b0:32a:7315:fff3 with SMTP id
 38308e7fff4ca-32ac7275b96mr20992861fa.35.1749130359252; Thu, 05 Jun 2025
 06:32:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250531195801.3632110-1-andriy.shevchenko@linux.intel.com> <20250531195801.3632110-3-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250531195801.3632110-3-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Jun 2025 15:32:28 +0200
X-Gm-Features: AX0GCFsxCPT2i86_1t4bwbeQABv1RKSRClew8rCWJzzT5hSg_V0_R-wqdU9burc
Message-ID: <CACRpkdZo8K1Dffr+TNkM46B44oT=vtHc7Ty=H9teAqzLzwaVrg@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] gpiolib: Move GPIO_DYNAMIC_* constants to its only user
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 31, 2025 at 9:58=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> There is no need to export GPIO_DYNAMIC_* constants, especially via
> legacy header which is subject to remove. Move the mentioned constants
> to its only user, i.e. gpiolib.c.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

