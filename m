Return-Path: <linux-gpio+bounces-3251-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3052D853E54
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Feb 2024 23:14:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 550881C22A8F
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Feb 2024 22:14:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A66456168F;
	Tue, 13 Feb 2024 22:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="e4nBPnnz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808836169C
	for <linux-gpio@vger.kernel.org>; Tue, 13 Feb 2024 22:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707862070; cv=none; b=cMOKa2Aag229w7UgFdORhbiZwt3IVaFI5hhmfzeNa6r/V9Dqz94Gumoo8RypCgcTzngZ35VuhogqXXS/jVEJp6YERfAmfOpnEnOwp0zfN7SSOiWwzsSjssx7sTE1rsS/txrCFZQZ2JZhGNFXy/JMRHlwhTP7RD8mgk8VeGNkw0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707862070; c=relaxed/simple;
	bh=I/uARFo1HG9Om/3xVnmq2t+dMzDRcFi20kyN4x4ChYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kdOLuBfc3zbfSTCa3kQXvraA/OSv5tUAsys9dcC3nlwEvDjxVJ6Me6N9WYubo5EB5Ad8kHvm60JDvdNauAofhYvWMeGaPJ01p9YIUjiy0SY9je9ft6GjywPOvpQKtFbOjYvLu2/t5QYRSiTUAn+ADjnfb8YG3mHIbFFyMjYstSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=e4nBPnnz; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-4c021a73febso1015470e0c.2
        for <linux-gpio@vger.kernel.org>; Tue, 13 Feb 2024 14:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707862066; x=1708466866; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J1wJKFlN7OIkY7esmW0iWECJFJKqRiecGTzecJbejAs=;
        b=e4nBPnnzTY6sWHLUnb79FYnSQ7g2I75H6OQ7+6SU0mjBKep5zw1OHQbWD6KZ+Lb5MO
         Z9MWTFItvCioCd4P3iRQVoOJHET4qFrDPBV15gxpJroqdGuddq0pdkJsvt2Dkbein/7j
         xOZ12q2anZFxSPQKFYaqXFODyuIUqEyvyfEj0m5/UknxXpl4BBkl0aejQvyYVJBsndLh
         J5XVP02GToptfOKnpcoCnTwfP0L8UwgvdRZH/CinVAtx1PkkLb/woZ66qhv4CVMaihfK
         QOa5fNbC5Us9ZUPVCzC8WB3OgGGNqTFYN4FJb2GRatp4dan6oEq3uXPXX6Yth1MEVRlq
         DXzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707862066; x=1708466866;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J1wJKFlN7OIkY7esmW0iWECJFJKqRiecGTzecJbejAs=;
        b=wUWcMUrJ99UKisH/KRMf2KA/paHXg8ZxNGLViPOdraKD7aXQSfR/dAaBLsr2QptHjV
         pOgOO+p7r852rfNxahETP3MI5O4x7NQRkpet5fJifDgazlsHCI7hdyquzZVXcZ06fvSG
         aH7ufTI0QNQ3oQJhJpWTYWMKfWV2PmaUPXybFhubr4336rXYnx8P8qSpwbV2Rc/qJrKO
         oSHezfUA0xzSlfRx1LFkASz8IZjZhqP3JFE6Bi5OyIbDgc4ZA6bbhg+MdUEJoX6XmPG9
         Rp//DfOha6kCPu+YTHM0T0zudpusJGKdzJ9E1FSvetbCL67heJCUDLqKrp4PrmYK9sm6
         1/9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWUqCVHuQLEtdz7tD0ZRHh1PDUSvd1VdYKIQq8I2UMXhQcSn9y52+K3vBMSdnSEUZqp/ecMOngeFFF6oD7q+5MpH3S2CTkhtYLM0w==
X-Gm-Message-State: AOJu0YwxeIiYpbSVi2f4gI/VGSVcWyhaWWioEPKnyTRVB4gaU4GW93ZP
	oJZvLi0RPYaU7SykrmZnNZyS6ntUWIFFG1lCMYHqBI6isf74nkI4eJcH/j7y/OFdVDJLVrWmQ/W
	dq57R7Rr1RgkvAIBcCc5stJUI8q5eIesV3BxapQ==
X-Google-Smtp-Source: AGHT+IFmATBBUMnAhjpovq5a0YkF67Mq6ymx40IJVzMIqFP/i4r7I5YovB5g1rWslKA/Woao2EiIW71lcQ0q8ist5XI=
X-Received: by 2002:a1f:ed83:0:b0:4b6:d4c2:61d3 with SMTP id
 l125-20020a1fed83000000b004b6d4c261d3mr982119vkh.0.1707862066171; Tue, 13 Feb
 2024 14:07:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240208095920.8035-1-brgl@bgdev.pl> <20240208095920.8035-8-brgl@bgdev.pl>
 <2ab076da-a4ea-46d5-874e-854a7d6efb69@sirena.org.uk>
In-Reply-To: <2ab076da-a4ea-46d5-874e-854a7d6efb69@sirena.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 13 Feb 2024 23:07:35 +0100
Message-ID: <CAMRc=MeBMWjx3sfumj-SwPHZ1nmE3KjkkBC96a11yBumGD_GQw@mail.gmail.com>
Subject: Re: [PATCH v3 07/24] gpio: protect the descriptor label with SRCU
To: Mark Brown <broonie@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	Alex Elder <elder@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	"Paul E . McKenney" <paulmck@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Wolfram Sang <wsa@the-dreams.de>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 13, 2024 at 10:16=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
>
> On Thu, Feb 08, 2024 at 10:59:03AM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > In order to ensure that the label is not freed while it's being
> > accessed, let's protect it with SRCU and synchronize it everytime it's
> > changed.
>
> This patch, which is now in -next as 1f2bcb8c8ccd, appears to cause a
> boot regression on imx8mp-verdin-nonwifi-dahlia with arm64 defconfig.
> We die with an invalid pointer dereference after registering the GPIOs:
>
> [    1.973513] gpio gpiochip3: Static allocation of GPIO base is deprecat=
ed, use dynamic allocation.
> [    1.982467] Unable to handle kernel NULL pointer dereference at virtua=
l address 0000000000000078
>
> ...
>
> [    2.161467] Call trace:
> [    2.163915]  check_init_srcu_struct+0x1c/0xa0
> [    2.168284]  synchronize_srcu+0x1c/0x100
> [    2.172216]  gpiod_request_commit+0xec/0x1e0
> [    2.176496]  gpiochip_request_own_desc+0x58/0x124
> [    2.181205]  gpiod_hog+0x74/0x140
> [    2.184529]  of_gpiochip_add+0x208/0x370
> [    2.188456]  gpiochip_add_data_with_key+0x720/0xf14
>
> and a bisect appears to converge smoothly onto this commit.  None of my
> other platforms (including the i.MX8MP EVK with the same SoC in it) are
> showing similar issues, I've not checked the CI systems and haven't done
> any investigation beyond checking that the commit does look like it
> could plausibly be related to the symptom.
>
> You can see a full boot log at:
>
>    https://lava.sirena.org.uk/scheduler/job/579038
>
> bisect log:
>
> git bisect start
> # good: [7b17b1384cd6454c4ea2744c8e8a06de0d27b5b3] Merge branch 'for-linu=
x-next-fixes' of git://anongit.freedesktop.org/drm/drm-misc
> git bisect good 7b17b1384cd6454c4ea2744c8e8a06de0d27b5b3
> # bad: [46d4e2eb58e14c8935fa0e27d16d4c62ef82849a] Add linux-next specific=
 files for 20240213
> git bisect bad 46d4e2eb58e14c8935fa0e27d16d4c62ef82849a
> # good: [f85363faaa040a9b9ac6502464a8b1ed7f711eab] Merge branch 'master' =
of git://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.g=
it
> git bisect good f85363faaa040a9b9ac6502464a8b1ed7f711eab
> # good: [0ca88723ff14aa0a28d31772ef330f3eef97cba1] Merge branch 'next' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git
> git bisect good 0ca88723ff14aa0a28d31772ef330f3eef97cba1
> # good: [c9545b54561efbedfe184a97dd07b4cdd8176146] Merge branch 'usb-next=
' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
> git bisect good c9545b54561efbedfe184a97dd07b4cdd8176146
> # good: [4e22a2de97fb3b37e241058a4f9b91f3245590ea] Merge branch 'for-next=
' of git://git.kernel.org/pub/scm/linux/kernel/git/tj/cgroup.git
> git bisect good 4e22a2de97fb3b37e241058a4f9b91f3245590ea
> # bad: [903a65bcdcda676e86b1504f909c6565b1bd9df2] Merge branch 'pwm/for-n=
ext' of git://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git
> git bisect bad 903a65bcdcda676e86b1504f909c6565b1bd9df2
> # good: [a3468cca30fe896b58f9f7b3bb5484f079010a12] Merge branch 'for-next=
' of git://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git
> git bisect good a3468cca30fe896b58f9f7b3bb5484f079010a12
> # bad: [7fe595b3c3cf3f9b8f21fce72f1f48a2cb41522e] gpio: don't dereference=
 gdev->chip in gpiochip_setup_dev()
> git bisect bad 7fe595b3c3cf3f9b8f21fce72f1f48a2cb41522e
> # good: [f57595788244a838deec2d3be375291327cbc035] gpio: vf610: allow dis=
abling the vf610 driver
> git bisect good f57595788244a838deec2d3be375291327cbc035
> # good: [ccfb6ff4f6c0574e01fb16934fb60a46285c5f3f] gpio: don't set label =
from irq helpers
> git bisect good ccfb6ff4f6c0574e01fb16934fb60a46285c5f3f
> # bad: [b6f87adbacfab9001d08e56ac869e1c75734633d] gpio: remove unneeded c=
ode from gpio_device_get_desc()
> git bisect bad b6f87adbacfab9001d08e56ac869e1c75734633d
> # bad: [2a9101e875bc3aa6423b559e0ea43b2077f3be87] gpio: sysfs: use gpio_d=
evice_find() to iterate over existing devices
> git bisect bad 2a9101e875bc3aa6423b559e0ea43b2077f3be87
> # bad: [1f2bcb8c8ccdf9dc2e46f7986e1e22408506a6d6] gpio: protect the descr=
iptor label with SRCU
> git bisect bad 1f2bcb8c8ccdf9dc2e46f7986e1e22408506a6d6
> # good: [be711caa87c5c81d5dc00b244cac3a0b775adb18] gpio: add SRCU infrast=
ructure to struct gpio_desc
> git bisect good be711caa87c5c81d5dc00b244cac3a0b775adb18
> # first bad commit: [1f2bcb8c8ccdf9dc2e46f7986e1e22408506a6d6] gpio: prot=
ect the descriptor label with SRCU

Hi Mark,

Thanks for the report. Patch fixing this crash is already on the list
as of this morning. I'll queue it tomorrow and next should be fixed on
Thursday.

Bartosz

