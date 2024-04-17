Return-Path: <linux-gpio+bounces-5633-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E778A8D40
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Apr 2024 22:49:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 262581F22CE0
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Apr 2024 20:49:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93BD547A7D;
	Wed, 17 Apr 2024 20:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LKnznURn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0BB3D967
	for <linux-gpio@vger.kernel.org>; Wed, 17 Apr 2024 20:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713386936; cv=none; b=NANI87b7bsWzEKkkbt0xsodEmZivjcL1OOEyN61jSaqgjqLO08TuwbeYU1P1PFDLY/j6ui8YZvGGy51rr1m/+0tkMztCx361uPbPQNphXfTUd/M3B9hwHLeHm4olKDH2Q+BZ72DNsVupoD9U/5lfvOrTZNESRL0imqpbSbn30nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713386936; c=relaxed/simple;
	bh=ORYpKCCPco9BsZmLehTJC39f1aThfzW07CoeCNcrPq4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kLmWwmVzMaVf4XACyxzM4Z9Pe0qmY77u7NikyIBe2Bw6UAGK7u5fCSLaevXDSjP3xhweS1rdXH89qrGAhMd8743AUL33shOR8/08iZaAeHrWzN4XHTS8cgAsWgsbCOnJ/+FuOLz6xMAZ4j2ua5ZE9RZlVnj6FKjAbisoHHNsmqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LKnznURn; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-519661ebd59so234112e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 17 Apr 2024 13:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1713386933; x=1713991733; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mjgmJRjeO60SRDB0oJ2Pp2K9Z2QIcWbq/4i6csP1QjE=;
        b=LKnznURnoL28TOv0yeK/tcJvFMB8yFUwDxtvNm084/Yi8bJH0xw/zS0U0SpeEbUgWz
         g3IHucYwvGPfkWcLCSlLnKMYDT8xtcMMgTwU9tNJbQ1VRUSV+Xp1Q0ggde8Lso/IPXCM
         h6vc1o8aL2QseKcwy0l5089IVv6OjbHUVq2fJRaufLkNLcNJQfV7t+qQnIMMUa/a+Vxg
         ETcFOSNl3AkB6+DhNDVFdmFYUg22xPS1PHZ93x9rtkLJKsAtNQ8k5Cwm8zfIT/TdvLMW
         bxfUAeWSKRax7VFpYNbSKU5NkRRAF0Pi3FSPamt+7N2bKnfJ6Ee9E/p910wIXRqcMIiw
         X89w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713386933; x=1713991733;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mjgmJRjeO60SRDB0oJ2Pp2K9Z2QIcWbq/4i6csP1QjE=;
        b=UHZDpidFniLTGDhxSVVbQiWCPbXxlPK5hr5igRpoRDThblct+RD+IJzjoVPXwFZL73
         hSvrhiKdkqADh4nolJbz/FhXPNIo00jmrTTnChKhhH0Ndlcoe+UhqRxr/LtW3EyhoRQR
         3BmFNQA6GSDK1gqZRUxxFxOLhnMfbdPsdtDDNhB4xqVbASiN3O4sGGZgEcjtzy48lbCg
         3NQpx8jZN9O6q+Sp7M/7vymEiFtm3WUP8mU47yHwjsDBKJvxCHF4o7RnkJjGWIej2jEh
         3tyt0K3BrspHccMG4q9qL/iu+R5sT8z664wo1nYW3uxGSmQc3W8VbEYaYZvPUM/C22G6
         8q+Q==
X-Gm-Message-State: AOJu0Yya6YHGLf5mRnMmh4hDJrvTnVkpI6Uo+IdK9rdK4qnR5h/I0LxF
	VOAbPxtc2wMPrEXW6RcpfPeCCyaa2Bfl8tHlViSakRloxohAU7noSrPw/HS7oJhWDzPStmX1kpS
	yeVhzlmcLgEzcdTRwxjG+T7KL6EwSVZEmmo094g==
X-Google-Smtp-Source: AGHT+IHcqxh9ROeyHiMPpqEPKTaldD80WfMEcSrhIQuy47rBkDPzOmHiCobO3e/Ek32Xp+msA0OAPMdRC7nTfy3Fpyg=
X-Received: by 2002:ac2:48b0:0:b0:519:1c25:7759 with SMTP id
 u16-20020ac248b0000000b005191c257759mr66768lfg.1.1713386932915; Wed, 17 Apr
 2024 13:48:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240417141914.2905621-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240417141914.2905621-1-andriy.shevchenko@linux.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 17 Apr 2024 22:48:42 +0200
Message-ID: <CAMRc=McqBBFEHksn70wraWy2Oh20Scur6KQzRvhuKr=ja-_sRw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: swnode: Remove wrong header inclusion
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Walleij <linus.walleij@linaro.org>, Charles Keepax <ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 17, 2024 at 4:19=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> The flags in the software node properties are supposed to be
> the GPIO lookup flags, which are provided by gpio/machine.h,
> as the software nodes are the kernel internal thing and doesn't
> need to rely to any of ABIs.
>
> Fixes: e7f9ff5dc90c ("gpiolib: add support for software nodes")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  include/linux/gpio/property.h | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/include/linux/gpio/property.h b/include/linux/gpio/property.=
h
> index 6c75c8bd44a0..1a14e239221f 100644
> --- a/include/linux/gpio/property.h
> +++ b/include/linux/gpio/property.h
> @@ -2,7 +2,6 @@
>  #ifndef __LINUX_GPIO_PROPERTY_H
>  #define __LINUX_GPIO_PROPERTY_H
>
> -#include <dt-bindings/gpio/gpio.h> /* for GPIO_* flags */
>  #include <linux/property.h>
>
>  #define PROPERTY_ENTRY_GPIO(_name_, _chip_node_, _idx_, _flags_) \
> --
> 2.43.0.rc1.1336.g36b5255a03ac
>

Applied, thanks!

Bart

