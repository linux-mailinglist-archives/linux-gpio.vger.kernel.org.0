Return-Path: <linux-gpio+bounces-23841-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60581B12A6F
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Jul 2025 14:24:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07723AA4408
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Jul 2025 12:23:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27C93223DE9;
	Sat, 26 Jul 2025 12:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="PJbGAiU0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8AB41C84D6
	for <linux-gpio@vger.kernel.org>; Sat, 26 Jul 2025 12:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753532651; cv=none; b=YL9x5o83ySKWTY7TbPaAwmDm2wT+WE1xyJambAG7T0BGJ+5M5TxzKYa73cl3MzsNCDxlMnYG8IY3iJXpZrgx5wqHt0NElJ76V3tVSx1BxOpNu39o6t05ETsjk2ik1R4n72fi3n6swa6i5vbltLYpFDSPQhdVDbdkx7XxSFhUB/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753532651; c=relaxed/simple;
	bh=4RO+X0MCjEa+OKFRKc8CjfHHv0wAiDV9NUkqZ6BX2Ro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nZjSD6D1NrHEkv9SVyClkn8MYEFRKW/eshD/pBACJOnOD2I3EdcTVPoph9X1viMXN76yMbRlMLXd5dTAxDGGQlxYRC2i8Wru6DOaCv7cYFbPucuKjxRZedowrUWVYIE43K53qoiSCsDwufgLqd7yShaLOI7WEyhaJhZd30jknzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=PJbGAiU0; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-55a10c74f31so3248401e87.1
        for <linux-gpio@vger.kernel.org>; Sat, 26 Jul 2025 05:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753532648; x=1754137448; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JZamO6uSuYHqsGewjp3Z4H8PqpofAIlsY9yfSvX7Viw=;
        b=PJbGAiU01wFxghIcLuAaXT5duALNePzwhHaJEAhBG48LsMalfn8q3kpIMuP0OByzwU
         EDOnxujt7SHCshOf0TQrRaxM/BRh7LxlzfJU3gbOJ/3lcE3YzifW9URp0di/1/ypbq2X
         p051M7FSnWnyjI7QRyKI4ZmUj/TnbCtouthUcg4dWVwDBjhVZ+Uw5Yo0CJvmXdRKmSey
         buM+pkJuixfJHVXwPiSMRRnn0G52jTg1P9imYhMFFf3IWGXCc8O7Gu3NxKOgjKE6okEp
         A3gwkRvpicsRNy4OFOlST8rZ6lWvohURjdXdBloIT+d9za8vWd1TyxIJs6QHNW1ARSR6
         hvsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753532648; x=1754137448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JZamO6uSuYHqsGewjp3Z4H8PqpofAIlsY9yfSvX7Viw=;
        b=F5tgqScUPiXRGDOv7Ly5jlQMLUXsqByi8Xy5RqDwLczQhyigrNkgni456J0opO8qdB
         HlWB1D9uneTnNRG2BB7mIJpxKWgfB7opLfR3wlVCUnWjB0Vnh2Jbqj4ml1yZLMN1k2vZ
         LlYGqlOBDvx47WX+3kFM6BrBOIA/iCqC01DIGDQ5Yp/f3npN72vGS2AVwg2pirtkxD9a
         BM7hLR7cEiR9zLZvHrBy+UpE9yQ4IyM5EtGAHh4Af05e5PHzOO98UQZ3qFTqmz+zhob7
         pUI/gXYEhT8UC4Q90UQQY6vIxufTL5IW+bRVIPm4AtqKRIttEmKq7iG5YjMULI5KZVqV
         2L+w==
X-Forwarded-Encrypted: i=1; AJvYcCXuQKo9rNOAVfI01yFdwJYmpaaUcW0+r2Sj0CVq8vgwEV0KVMzraL6fGLGcJhULwxS59TrGwd8L/DSq@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj32PVnJe/a+7gUXjYB+bMN1086ZxkBW63oUub7IjQWPtU5Kna
	5Cn1DgEp/lpp5g0t/2+8/geTIoUNZ8lu7TrypCvaFKj74d/XLv56aaBZqy6tvU0QOV2Z2epmXR5
	KcX8BycZud1AiiZh0YU0+dpE3dSOFBJd3uhmw42xP+Q==
X-Gm-Gg: ASbGnct9eV2FDwBrcLKP5vLR7w5qlA8FYCA+GWJBTCF6d0Q+3TZOUCQy7pWfKtox8K8
	rtab5DbpsOAlT+keE51PJomS7np4WcMKxqA9SktBuSgSLwTAYGFvvGmjIObUOJmeow43JhrF1Zk
	lY097uCTkhKPQYD+VI/zZVI9fNQW4eyRirE5QjLAjT1vGNeZy78dTz8Zhxej3jA1y3Ap5InPO72
	UsS2iLic+m9SpeBMGaN9ZzKS1TdNgnaeglZ
X-Google-Smtp-Source: AGHT+IHAO2HpUiicTjB/e7lp5YYcq+3bearETShDDIE2Hj4VKla6gTWJ399wpgZnZHYCukcyPgZ0pyiK6hL5SLKjmvU=
X-Received: by 2002:a05:6512:3ba5:b0:553:202e:a41c with SMTP id
 2adb3069b0e04-55b5f4c86c2mr1359964e87.28.1753532647715; Sat, 26 Jul 2025
 05:24:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202507261934.yIHeUuEQ-lkp@intel.com>
In-Reply-To: <202507261934.yIHeUuEQ-lkp@intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sat, 26 Jul 2025 14:23:56 +0200
X-Gm-Features: Ac12FXxav7BPVEwUSpS3g008iRm910sqnc5pYM_YTF74VKIYK1ExRFPB-KnDvhw
Message-ID: <CAMRc=Mc95SMBBjndi9EPUd+d0AftGaovfn0-uhoWQ+cf7SJ9Bw@mail.gmail.com>
Subject: Re: [brgl:gpio/for-next 4/5] drivers/nfc/s3fwrn5/uart.c:147:15:
 error: implicit declaration of function 'devm_gpio_request_one'
To: kernel test robot <lkp@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, oe-kbuild-all@lists.linux.dev, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 26, 2025 at 1:10=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gp=
io/for-next
> head:   4740e1e2f320061c2f0dbadc0dd3dfb58df986d5
> commit: 678bae2eaa812662929a83b3de399645e9de93ad [4/5] gpiolib: make lega=
cy interfaces optional
> config: um-randconfig-002-20250726 (https://download.01.org/0day-ci/archi=
ve/20250726/202507261934.yIHeUuEQ-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250726/202507261934.yIHeUuEQ-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202507261934.yIHeUuEQ-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    drivers/nfc/s3fwrn5/uart.c: In function 's3fwrn82_uart_parse_dt':
> >> drivers/nfc/s3fwrn5/uart.c:100:14: error: implicit declaration of func=
tion 'gpio_is_valid'; did you mean 'uuid_is_valid'? [-Werror=3Dimplicit-fun=
ction-declaration]
>      100 |         if (!gpio_is_valid(phy->common.gpio_en))
>          |              ^~~~~~~~~~~~~
>          |              uuid_is_valid
>    drivers/nfc/s3fwrn5/uart.c: In function 's3fwrn82_uart_probe':
> >> drivers/nfc/s3fwrn5/uart.c:147:15: error: implicit declaration of func=
tion 'devm_gpio_request_one' [-Werror=3Dimplicit-function-declaration]
>      147 |         ret =3D devm_gpio_request_one(&phy->ser_dev->dev, phy-=
>common.gpio_en,
>          |               ^~~~~~~~~~~~~~~~~~~~~
> >> drivers/nfc/s3fwrn5/uart.c:148:37: error: 'GPIOF_OUT_INIT_HIGH' undecl=
ared (first use in this function)
>      148 |                                     GPIOF_OUT_INIT_HIGH, "s3fw=
rn82_en");
>          |                                     ^~~~~~~~~~~~~~~~~~~
>    drivers/nfc/s3fwrn5/uart.c:148:37: note: each undeclared identifier is=
 reported only once for each function it appears in
> >> drivers/nfc/s3fwrn5/uart.c:154:37: error: 'GPIOF_OUT_INIT_LOW' undecla=
red (first use in this function)
>      154 |                                     GPIOF_OUT_INIT_LOW, "s3fwr=
n82_fw_wake");
>          |                                     ^~~~~~~~~~~~~~~~~~
>    cc1: some warnings being treated as errors
> --
>    drivers/nfc/s3fwrn5/phy_common.c: In function 's3fwrn5_phy_set_wake':
> >> drivers/nfc/s3fwrn5/phy_common.c:22:9: error: implicit declaration of =
function 'gpio_set_value'; did you mean 'pte_set_val'? [-Werror=3Dimplicit-=
function-declaration]
>       22 |         gpio_set_value(phy->gpio_fw_wake, wake);
>          |         ^~~~~~~~~~~~~~
>          |         pte_set_val
>    cc1: some warnings being treated as errors
>
>
> vim +/devm_gpio_request_one +147 drivers/nfc/s3fwrn5/uart.c
>

Hi Arnd!

Will you be able to address it quickly or should I drop this patch
from my queue? I would like to send my PR to Torvalds early next week,
Wednesday at the latest.

Bartosz

