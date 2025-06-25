Return-Path: <linux-gpio+bounces-22125-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF42AE7A03
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 10:26:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCB3F17F264
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 08:26:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0C1426A1A8;
	Wed, 25 Jun 2025 08:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0BLatIBb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77FE20B801
	for <linux-gpio@vger.kernel.org>; Wed, 25 Jun 2025 08:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750839989; cv=none; b=Cl6FtINcGHP4prNzJisIdc9Fwa/e2w1BEzPXoTPEpt9j/4weJqxuxIvR1XUXTtgJ5F8Qgjm66gUlgHeLoM4mzq4fnLYG9zjMRsuSIYQC05whVqcwsubjdQv3D4qLmbq0cOJ5qmSuloXBhtrSE8nxQp1SKm2wD+2TtPJxT49NCxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750839989; c=relaxed/simple;
	bh=HS4wAnVjCQeW1rVCh4eHK2uX9ZfsLA1faWghmR3VJxs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dAVE3CQahKqetRqL8Qc/9et68INY/dwWkoBgtqnYIlD2UZ9SeWzBsuSTQQW/gSp0m5Nhab+IxqbJ9XVShJo6WeOBm/eCzhsg/sfpPhMsqHUDTZXzezyXOIPhiecVI7Hw+HJqoC/X7+CUKuLIKViYzXkDGR/5g0l3LA/tT4bgeD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0BLatIBb; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-553dceb345eso6887388e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 25 Jun 2025 01:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750839985; x=1751444785; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HS4wAnVjCQeW1rVCh4eHK2uX9ZfsLA1faWghmR3VJxs=;
        b=0BLatIBbTusvOWQOSK2PRieumkTqt50JsgYQ2iR6BvfU+C8OIp3zErrUw7Dwzwzkpr
         +Kc5ucHXVpkO38Pfg158KUcESXu9+NKloZaLAmr49eyvV+Ux4t9CpD7QmbdQlM2c0bws
         Luytt4puuoQbSU7UNjmYPxBUD11LCXRUTiyHuyjAW7UT5nn8a/poqCm6qtCZoNMRzW1O
         hNTGT8iYxq67IYUyhjm9O8ejiT8lTsZoXQQ+Pb2j1NfpELfsv7mVhG88tG9GoGniAFDS
         RUJ+eqOPyTD3zdcYb/XFZCNjn4tc6HRSy+5rN8VZzvQEalc/e2YGSPVrqd9EA19cCUFF
         VKxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750839985; x=1751444785;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HS4wAnVjCQeW1rVCh4eHK2uX9ZfsLA1faWghmR3VJxs=;
        b=ZSMmzXdb4yW2uTeixcV0ktWJ096VsuCgzlK5KZ/Y+tkfsF4a68y7lKXXq8V6uHqF+j
         csiBlZG58Hmny5GTTEBVSf/wkYexYHzw9hdMGEdOj+4o4eAkCFDnbGCEGtkKAL5EtJR+
         qFmHD3uqIdDERDx2rdYmHUx4hQD4ZZ8DcV6fYG1PIol5erQBe+mcmycfyik54RV+wkjD
         ITUbOG0r1sdRXci+3OKHm8H5fft4rVgRR5ljjzV3RWKQOmc2KADjbSoxQA6YiBNsLsH7
         GjEkQmx/npSY8jEGqq36zOM/CqwfOGRJ/OGu8+0+pjtE2zkCCyFIOJZPD31ZDKJcLbOm
         msJg==
X-Forwarded-Encrypted: i=1; AJvYcCUiVrmRjcHLlUKeSqyGIET55bIsx3cQt948Q+lancTv+YZqc/gk6NsHz96WNaA8qAkS2NC0Wm1EqDK5@vger.kernel.org
X-Gm-Message-State: AOJu0YzZEebIEQ/9cgpRgNQVfWuN58188/35J6Ge3Wk2rXuZgEWXyA1n
	UUJWLngtZzuXtfBDMk/toKL2I+xRgzw3X6ZqYnOEVg2NbcTv8Bm1oymTtQmBleSaxg3MK2ykCdt
	4LRk6ZoLqh1IO8o432eLzHn2bVBXViDFZfaqtESCu7Q==
X-Gm-Gg: ASbGncvh0/rjdkp3bE1fkPGXLjhFYtrnD/bDMlO9yL+TaYVg8tvZv4ERZSmz+4gdRz+
	X8kDjU+RuIvSGAJyAtkTIonTThPsLE69G3V+0J9A5oFaIIDNnOBZrKnNYcIJVfzJ9JZBbbNONcv
	EDlcRx5THRH/AKSgP+2D9ZsAjNWOgG9kHSI16jsSIVe0clPMZRvERXSCKVfpcJTC61cd52EMAh2
	pQ=
X-Google-Smtp-Source: AGHT+IGpMxg8o/chcnQe5MhULiua6yOTHYM+kv1EqdYOqZzH7FhLx1vYLQZI7NUn33/FILfroU1k/T45xBu991cKMZg=
X-Received: by 2002:a05:6512:3055:b0:553:2868:6361 with SMTP id
 2adb3069b0e04-554fdcf5558mr547065e87.18.1750839985044; Wed, 25 Jun 2025
 01:26:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611-aaeon-up-board-pinctrl-support-v8-0-3693115599fe@bootlin.com>
In-Reply-To: <20250611-aaeon-up-board-pinctrl-support-v8-0-3693115599fe@bootlin.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 25 Jun 2025 10:26:14 +0200
X-Gm-Features: AX0GCFt4ItqCrsm7oeOr_Iat7x8NjoEMSLW9yiH4e8zUF9RBY6CHWLkj4pkFCt8
Message-ID: <CAMRc=MfS5Em65n0fwbu8JtJsc3rTgQO5cv+PymSonJtf6_zRKQ@mail.gmail.com>
Subject: Re: [PATCH v8 00/10] Add pinctrl support for the AAEON UP board FPGA
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 11:00=E2=80=AFAM Thomas Richard
<thomas.richard@bootlin.com> wrote:
>
> This is the eighth version of this series. I just added a missing header
> file in gpio-aggregator driver to fix a build warning reported by a kerne=
l
> test robot [1].
>
> [1] https://lore.kernel.org/oe-kbuild-all/202506092324.XqSwWl1z-lkp@intel=
.com/
>
> Best Regards,
>
> Thomas
>
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
> ---

This series looks pretty good now, any objections to picking it up? As
usual - I can take the GPIO patches and provide an immutable branch
for Linus to pull.

Bartosz

