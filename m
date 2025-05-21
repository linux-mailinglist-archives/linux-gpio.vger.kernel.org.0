Return-Path: <linux-gpio+bounces-20393-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA7DABED0D
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 09:29:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD7493B4FFC
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 07:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8566235354;
	Wed, 21 May 2025 07:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ew0hBRMw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3D323505F
	for <linux-gpio@vger.kernel.org>; Wed, 21 May 2025 07:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747812590; cv=none; b=snS6UggCZq20C5zAcZ6+DVGk9HP7ZSJ5odlXe6PyobSyS0oGy8zca7nvWFgS0feZ+O/5SCdUDrCQhbx63hiAuojO//UsKg+gEyes81IXabib7BuFSGdZryCxUzHlJD0U3ksvvSIjoUjlzrkKaVKQukl4V6Sf8DYrOp4DHL/T4FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747812590; c=relaxed/simple;
	bh=5QOEFujNAU224Hj3QqjjAu8F3cWlAhTNz/g3jWicV+8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DbLNgZ4KLLW3jeOeMY3mpV1FLaoc/an5TKgTT59ZOT/sVMeC+WpBTi5H7aHbovNpXM/hD0gu3HbCiZsu25Lbz3itkQNnmXdV6UAm3qQ6MgVKdbqKnha2kJc/CqO4M2p+aqOpHM8Na4QVYT42OBsBF42cxD7x9H+QYidAJ4Hplkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ew0hBRMw; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54b166fa41bso9813279e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 21 May 2025 00:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747812586; x=1748417386; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5PH6FcCTvcCsGA3pEC6MGqn/kU/j9G10vtPXCblGsYM=;
        b=ew0hBRMwWqQfrWBtC+6CDjFA4CU5xUx2DgehQ0p8CYG+buN8XvYpW1fj0l4k1DDWS5
         r20rxGmpooM+p16oRF5zY+wMNiW1ear0FL4bcocNSXvl6/fdxQV8J5SYa5lw13iHmuHN
         kTKfebRVmOoGhQAgEGJMIcIodqSEvryZzcGRiQ04yYaKinC+ERH8wZMSCej37VpzLc+y
         VyH13dJhCHZHFazy7xs/NGsupNjwv8vT9vm69P/hvR4rVYylbOSdhmPoKyNw/g79jJCp
         DMKdOTOHvpzdHAtcL8/+GrRwbIK9uQKh3FwKNHg3ywrZB/3fCDANbmOMFNFnYE4NAPSN
         dosA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747812586; x=1748417386;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5PH6FcCTvcCsGA3pEC6MGqn/kU/j9G10vtPXCblGsYM=;
        b=IYjbvfMwLeCuTCefZNm2sOQiFqroEXwWNKWZb123GvmTq3kJKdgU9FZe1/DaSJxAMk
         L3YenWNPsbgCwP+7T1RQovDhS8TGQWKyn59d0RT2QK5xrLV769B+u3jYjhlm3fxqOW/c
         W9PTsBm488/9WqDH7qj+ChTIl/lNKinY8Clru/oO7PLb5RsBFfgrYhKaX4IemYNoHwnC
         X9gRhinhVLYnJqRncEpzykbfMmVd6wapkAdWroJ05DksHkYOC+EjiVZHCAUzv6hvQ20k
         8vkR0g+mjev6LF3kccwZIGleE+eY8haftBrmzBBvbtCFQ2kzuGW/QqgtkhdzQ73RO4KQ
         nTew==
X-Forwarded-Encrypted: i=1; AJvYcCVEr/OosRVRYh9p5KbKxKhvNU5MjuIe/jZAH/9L6BznNVzzbgpHVTATOTu7MIPON7KjF/SxGJgPtomJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzzHbWhiqhZ8/Q2PTBC6G00F6Claft7rL3LWxm/hoWzl32liK4z
	JUuDrahkxlz+lUi7/4O3LHNwdsnOyonvOmenQfXW13nls/k1/b6sl9SI+49cKFiLkPDJHq2z7ag
	BzTOblrndLNrVTvOXyojVR5D93mXaHPWdFbLs8PXmaA==
X-Gm-Gg: ASbGncu3ZW3ZxlKEwDFqUddRjUSDlkWPoLaVZ5VCZPWTGvBXvvCSFz8RQBUflIonUqX
	ExEK9P/5yXsbdzScWTB7LC+8jL/ogcvypwXucVm0+Kkzy3UH+URXscySU9AjSLQl0hsrNvJK6c0
	LGPDA0HGehohHBBbDyyU1r58LLvisLYN/x+kyzw41+xJVAlly6JDMJgvkZbaj6NJgJ
X-Google-Smtp-Source: AGHT+IGi+hlDlFryu83MUl58HnzanyHhkItUmquYyNR0YbZhFjMMynLVndB6XnoFry/M/qE8qsetk+tJQInM0Vftoe0=
X-Received: by 2002:a05:6512:6c5:b0:549:b0f3:439b with SMTP id
 2adb3069b0e04-550e71bfaffmr7680730e87.16.1747812585795; Wed, 21 May 2025
 00:29:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250521072048.1053190-1-peng.fan@oss.nxp.com>
In-Reply-To: <20250521072048.1053190-1-peng.fan@oss.nxp.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 21 May 2025 09:29:33 +0200
X-Gm-Features: AX0GCFuARv8NTEaBZbmAi5mo_wX4qtDCQAqZq8myL7yOFqeC3xBU1D2u36DDp2U
Message-ID: <CAMRc=MfbQMebHDa4_=79ZaFRf_0V47wQHh8bP+MQh1Qj=wjOyA@mail.gmail.com>
Subject: Re: [PATCH] gpio: davinci: select GPIOLIB_IRQCHIP
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 9:22=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> This driver uses gpiochip_irq_reqres() and gpiochip_irq_relres() which
> are only built with GPIOLIB_IRQCHIP=3Dy. Add the missing Kconfig select.
>
> Fixes: 3f50bb3124d7 ("gpio: davinci: Make irq_chip immutable")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202505210606.PudPm5pC-lkp@i=
ntel.com/
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>
> Hi Bartosz,
>
>  I follow same approach as you did.
>  My last build using multi defconfig was not enough.
>  I tried build all arch/arm/configs/*, no errors with this patch applied.
>
> Thanks,
> Peng
>
>  drivers/gpio/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index a559d5bb8249..c3465fd82b08 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -253,6 +253,7 @@ config GPIO_DAVINCI
>         tristate "TI Davinci/Keystone GPIO support"
>         default y if ARCH_DAVINCI
>         depends on ((ARM || ARM64) && (ARCH_DAVINCI || ARCH_KEYSTONE || A=
RCH_K3)) || COMPILE_TEST
> +       select GPIOLIB_IRQCHIP
>         help
>           Say yes here to enable GPIO support for TI Davinci/Keystone SoC=
s.
>
> --
> 2.37.1
>

Ah, you beat me to it by 2 minutes.

Bart

