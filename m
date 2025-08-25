Return-Path: <linux-gpio+bounces-24915-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE98EB33C16
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 12:00:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A54F916668B
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 10:00:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CF992D0610;
	Mon, 25 Aug 2025 10:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="U58yHuRf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24E222F74F
	for <linux-gpio@vger.kernel.org>; Mon, 25 Aug 2025 10:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756116024; cv=none; b=gtEVFYyzhwjX4Qf/WJsFgju1iQQixqf2Hs+s6ydkLCQVQkTaZTazvk4sHWl6shT9KvuODGb/DQgQthMxMDhf/RuDc8+NJ/6xOvZHzkfNdFQTKo2fZdSFgACKyrQTKY5JIHW6bOjiWH5ab8piJXEvZ9y9xsf7l0N8uf1EkdIhT10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756116024; c=relaxed/simple;
	bh=wxd1C9NmIuG0GH6DNDBUAnY/nN4ImOhyji7flawOOL8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kKScc3OWo29SVXMR6vJ6tpWSZKilBtvJ2TA3ynZw2uDs1bosbFpgtvr6dYrx9sjUucvwf5TFy9HdmmSUwGO8ON4xzWhoQNGL1HCuVd7icgf8LyvzlpHsJCpsW5NWps4Jc867Dsv8Mcb2arcIo+4UB6Bgu2iTAzTXtvYSd8SOTRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=U58yHuRf; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-55f44d5e6f8so615170e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 25 Aug 2025 03:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756116021; x=1756720821; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eJ6AWb1IvRBO6bay4aNSpk7sMubJEIQ+ss4WOdc9//U=;
        b=U58yHuRfvRe2FRdugymVTh6CcEXeuVfqZLnbJ1bb3aQL6NqkkVji3WsjJI3UEbdAUA
         SrFasuJfP53xutiX5MGilguMJJ1dG9yjG7s+tDDCoHNpO01SbmWwmOxdsX/4RBJt3C00
         hx7QSiJ/wYfAfDfeDnEjKE3Ae3pshpTnPl0p4eDploTxTw6EXMnpaICCoxI3FILiJtau
         9f7UvOria2WI5DDY3QU5K0a2qyRUBuLAQ9gXL/NJiVVNbxw8JFeZLrxUqRouJixk0fbU
         3JGUb4ZFkkTlCH1flGQ158pJdKd8wHh4O/1xF+cZwcqf+/yNE8yZfd6Vyg015ZafWJom
         Yj+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756116021; x=1756720821;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eJ6AWb1IvRBO6bay4aNSpk7sMubJEIQ+ss4WOdc9//U=;
        b=DZ7IrDhG6avCcOIxPeQZQC1NRGJmaIcDalRvFold9+45vDXgDY0srQZcHcVKGL+Okg
         nSPle65mLLJBERmtUp4Zzc30Tgc86UxMdotPRmIWtDqwYnljoJtt8Ng/BzPRMbWsJrvi
         ycUzL3iJYHo6zPrjHv0tFb+9HpVAO+lYlKMZT5cMl/caJpkDe4/VsrthIfBKEyE3AmBv
         iOSLa4KZbwAxBouJxZVQ3QZiVEuuYyju/bu/0UVMvzqdol4nxNq5p568oHk+tC4DS0Ks
         helKCtPckOxEWMCAMfFgRSSUjkRg2fkYpcQuSA28prKhCRVgcdAXeVV/tDRkzMKaP6XI
         1FVw==
X-Gm-Message-State: AOJu0YwDubkyKHO9RXUM1vue9/8iK1d3B0HN/DSeM+IYAjMK6gqM1a3M
	t7M0RPdVpzNXb62A1d4N5VmYDDg+i0euvCbLVlSuvwt3Lx7Im3NN9WCzUlD5D4Uc5D7HPvKdtto
	/rEXuO5bJXOs047/z70o1ueuDhvQ2ojQvyrjl5fhekg==
X-Gm-Gg: ASbGncvFq2O0SlXenXg1o+rKV1lOaCnip4UXl2uqIENfb6UPCI/N9Vfop8OS4KDBrcA
	8qLpvR+AvnhdBr5R7wXaXQygBCY3y1I2swGeCEOE+LACEtYWE17Y+ZGy31+2XjBvoL8TkxneRpC
	0HMfL1eAA7WV8m81RAhdxFk/5bpENtm7kerRrppnJaY34cuNHTcESRVmAbK5Fn2E6SACxEBfHpc
	C/wiqtvmGKYQ1CvvJqmi9/XLvEA4/GqbE/ZVKO5cdqr82fgzA==
X-Google-Smtp-Source: AGHT+IEm/27Fjesp8I1iWaRVfRS4o6ubuyYXLf3VGmJD68g+F+2NqcP7oTbMplKzgA4i6aEsqRoV/RmDLiZU7vv5W1M=
X-Received: by 2002:a05:6512:260a:b0:55c:c9d5:d341 with SMTP id
 2adb3069b0e04-55f0c6f6e83mr2791627e87.4.1756116020888; Mon, 25 Aug 2025
 03:00:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250825-gpio-mmio-gpio-conv-v1-0-356b4b1d5110@linaro.org>
In-Reply-To: <20250825-gpio-mmio-gpio-conv-v1-0-356b4b1d5110@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 25 Aug 2025 12:00:09 +0200
X-Gm-Features: Ac12FXzlFRD8xnoHzxDbgloRnldi4vgsYITe61pwJ6-xPGt6zuFYA_t_OLE3l4w
Message-ID: <CAMRc=MeUuHMjvKtsK+oC2L0VPRBY=dbiJetzX8D+pBrxFNZ3=Q@mail.gmail.com>
Subject: Re: [PATCH RESEND 00/14] gpio: replace legacy bgpio_init() with its
 modernized alternative
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, Hoan Tran <hoan@os.amperecomputing.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Yang Shen <shenyang39@huawei.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 25, 2025 at 11:48=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> Resending due to some patches missing in lore.
>
> This is the first round of GPIO driver conversions to using the
> modernized variant of the gpio-mmio API.
>
> While at it: sprinkle in some additional tweaks and refactoring.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Bartosz Golaszewski (14):
>       gpio: generic: provide to_gpio_generic_chip()
>       gpio: generic: provide helpers for reading and writing registers
>       gpio: hisi: use the BGPIOF_UNREADABLE_REG_DIR flag
>       gpio: ts4800: remove the unnecessary call to platform_set_drvdata()
>       gpio: ts4800: use generic device properties
>       gpio: ts4800: use dev_err_probe()
>       gpio: ts4800: use new generic GPIO chip API
>       gpio: loongson-64bit: use new generic GPIO chip API
>       gpio: dwapb: use new generic GPIO chip API
>       gpio: amdpt: use new generic GPIO chip API
>       gpio: rda: use new generic GPIO chip API
>       gpio: grgpio: use new generic GPIO chip API
>       gpio: mpc8xxx: use new generic GPIO chip API
>       gpio: ge: use new generic GPIO chip API
>
>  drivers/gpio/gpio-amdpt.c          |  44 +++++-----
>  drivers/gpio/gpio-dwapb.c          | 160 ++++++++++++++++++++-----------=
------
>  drivers/gpio/gpio-ge.c             |  25 ++++--
>  drivers/gpio/gpio-grgpio.c         |  87 ++++++++++----------
>  drivers/gpio/gpio-hisi.c           |   3 +-
>  drivers/gpio/gpio-loongson-64bit.c |  42 +++++-----
>  drivers/gpio/gpio-mpc8xxx.c        | 102 +++++++++++++----------
>  drivers/gpio/gpio-rda.c            |  35 ++++----
>  drivers/gpio/gpio-ts4800.c         |  39 ++++-----
>  include/linux/gpio/generic.h       |  37 +++++++++
>  10 files changed, 337 insertions(+), 237 deletions(-)
> ---
> base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
> change-id: 20250728-gpio-mmio-gpio-conv-623517c3df74
>
> Best regards,
> --
> Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

