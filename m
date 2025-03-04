Return-Path: <linux-gpio+bounces-17016-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B45A4DB46
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 11:48:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5BD33B0AC1
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 10:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9DFE1FF7B4;
	Tue,  4 Mar 2025 10:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="mRXN6/bR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E0E1FF7AD
	for <linux-gpio@vger.kernel.org>; Tue,  4 Mar 2025 10:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741084916; cv=none; b=aOlicv1JEoQw5VIaC8MM799x3a3KnHHS0S8P92nos5bbK/rssled8J3i487cAaOzXbaGPYfrh6vZ714Wp/jtnXXSebsCkgpz4hrv4vo09M4LjnGIL8YZ3sLsf4fB5e7puDpxzTtk1Afxx4p11EEvttGY515ZWDT01d0AERrxoDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741084916; c=relaxed/simple;
	bh=5eAsQdrocIwsuEZIEV2Bk/wteURhMPFY7Aeo37o/jJE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JCO7BmWWFNcoOidpLB3kChB4LhkoKfNo2mAFPTFzJgszD3A8kZf+N+VWVo9asDsE0ncqrL+wbi4C8qr7SUbGbxlMUcdtojCSpfuDhzWjD8ZFwSCMbMgTOCPYihui3WNTZmW9ttcWWORdPhSdJoqrIJkP24XGY4Zq+k/IVJiyq50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=mRXN6/bR; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5496301c6afso2377857e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 04 Mar 2025 02:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741084912; x=1741689712; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J+CLe9wyo94MK43cR0KkLcVm2hrSOi/FbrLlXKM/n+c=;
        b=mRXN6/bR1i4T3/VBrnDcfW/caVKxhkYUzYG3l+EQE7aVbuo7VSuRoVH0lhy1LtC7Vt
         dPDI8/GavowU/sxF3iiJSVuwFmqH5JN3lqvkcAyeZ76ahL819BoVnJqww6M0pxG4YnJr
         tZ4sZEe4knfmZNnLz8eEYS0oqtU/C4C225LH4WEv4fMJoT+Cfoa0jCgE7rqF2QBgeDuU
         iYjzGCvkY2ivIEo+i7EMHX0ZMZ3u+DkbXARG+BmD7D+VCjAHtHmk/6j7xpt4FNA7BRli
         sHRBQHadiE/j3jeqLQZSKzca6Z3WR0zqlTi6RH1jCoRe9jvgNiL12ETenLOTeTbj8Rmi
         cSYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741084912; x=1741689712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J+CLe9wyo94MK43cR0KkLcVm2hrSOi/FbrLlXKM/n+c=;
        b=q6DThXIDKZFxpTCIStync+cv1DvLxYz49NZTIyaN6tACDVzaWjVmKM22NRsiOq4hI1
         QugIUIOIr0i/nSEdmTyYxCGQ2PM+tyQA6DdeDAV488d1UOlmCrzi9FuMFWcZeQXUOVpg
         1adxO4bHK/s+us/i3wpvm+nHKDZBf+d0SQoATozFeDjEv/ul93b5AojtMYi/9MD0Zu5C
         v0hLjq3SFCZ89IxK4wC/seF5FrmrFwTuYVmdFUIfSMI2I2gTnoBDzDjNQqfUU7rXldAC
         xUi8pR4yC/axXsAOpyITTYcURU0Rdfr7zE92YGOjF5d8JSmarEJkPZ9IHD/qkj6Tm5nQ
         4taw==
X-Forwarded-Encrypted: i=1; AJvYcCVr4Beketa6y+KCtYDzXcAnzrJTxV+W4cszaGY0MjF8C1v/r+PcKaReJ4urqrG/XmWghChquaDZ+jIU@vger.kernel.org
X-Gm-Message-State: AOJu0YwA+kfOa0MoHtYUfnX3/jUlmTxrVQSftNZ3Zz8EojE5N9Z+glZi
	OG8IzrZ8+Yq2185UZY0UX6y8+PoIE/yHcYJTl9bBo4N4Ns/MLfycDaaqP0gObhvzHfeJOKIb5fe
	mevRY96yc1FMlP+1ciVTx+5a3I0qe0PPXb/AdfQ==
X-Gm-Gg: ASbGncvWWTaqyaU8PUCJObBc715MMPwYtXbWLiacP4fLLkNUfqlLX1cjgnYKQHiG5Tm
	r7gCU787O9XcrT5iOKO8hcpJD2yYzCNx48R9zzc/WuI8sVltVBO6S95/5nQasLyKJgb237UDY8s
	DKkgwYkl5JBFLDT+0CLHoM+qQ/5rO72aa0pfhpz9vGruFpPMrH8xDXoRg4AA==
X-Google-Smtp-Source: AGHT+IFW1dwugcBOwVBAmZrS6CMIuhv8KAFq4W6OW9+G0v4HXawDePl2UapUTtV4ZF3rFz9ZUUYtAhog6ikYaHBlhNI=
X-Received: by 2002:a05:6512:a93:b0:545:dc8:9376 with SMTP id
 2adb3069b0e04-549756bb8b2mr865753e87.5.1741084912286; Tue, 04 Mar 2025
 02:41:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303-samsung-codecs-v1-0-56a2299dd928@linaro.org> <20250303-samsung-codecs-v1-1-56a2299dd928@linaro.org>
In-Reply-To: <20250303-samsung-codecs-v1-1-56a2299dd928@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 4 Mar 2025 11:41:40 +0100
X-Gm-Features: AQ5f1JrTREE44_9-N9d1KpC5QVfqU80Q79Wuacg5Co0HVa8QMpwM4g47c1JzBGY
Message-ID: <CAMRc=MevrFnw4BGRgwKrg+wj+saEmVmk+diGj=+sveE2P_hwYw@mail.gmail.com>
Subject: Re: [PATCH 1/6] ASoC: samsung: bells: Drop unused include
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 3, 2025 at 9:41=E2=80=AFAM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> This file does not use the symbols from the legacy
> <linux/gpio.h> header, so let's drop it.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  sound/soc/samsung/bells.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/sound/soc/samsung/bells.c b/sound/soc/samsung/bells.c
> index 365b1aca4855c885e0b59a1101475d8edb86374f..b4c0857ae35134b58a125b074=
6af07a5fff040fa 100644
> --- a/sound/soc/samsung/bells.c
> +++ b/sound/soc/samsung/bells.c
> @@ -7,7 +7,6 @@
>  #include <sound/soc.h>
>  #include <sound/soc-dapm.h>
>  #include <sound/jack.h>
> -#include <linux/gpio.h>
>  #include <linux/module.h>
>
>  #include "../codecs/wm5102.h"
>
> --
> 2.48.1
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

