Return-Path: <linux-gpio+bounces-1318-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD8280F413
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Dec 2023 18:09:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0980A1C20CA1
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Dec 2023 17:09:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 426A57B3C6;
	Tue, 12 Dec 2023 17:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="rAWyGhEl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com [IPv6:2607:f8b0:4864:20::933])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C31EB7
	for <linux-gpio@vger.kernel.org>; Tue, 12 Dec 2023 09:09:12 -0800 (PST)
Received: by mail-ua1-x933.google.com with SMTP id a1e0cc1a2514c-7c5ed425e8bso1517239241.2
        for <linux-gpio@vger.kernel.org>; Tue, 12 Dec 2023 09:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1702400951; x=1703005751; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=upBnebOqwsJ597ZlmCLWx528Yzi3Wcu30Pu2fcleukU=;
        b=rAWyGhEl5QZfENy+2tW1KWXOJt9iy4tJAm3F8/l0IKbulyyqMgyS5WlFH2XYZN9ph4
         yXM+LTOPpboux6iMsqxOlKiI2A3LOrn2aAwpdOph9tJ51eptXZcBkYw3VRH5TZYBIjk6
         IwiPxV0dn9/wKrj8bOFzpxKiLuy+ZIQjz7owiV2GbGoh/HuaaUBmNtndOZiHUtqBYOIJ
         RufYfAN/rbvMYFxEXcThRSGZf8qGSERM2mMEomhH9WBcbMSaYCdXCQQ1RHmJ2gMAp3z8
         qaC1Ucy4rN79qHxJCz9pxxqkwB8NOhICKOR+i89PxyuUzPBczjXki6m6OT/VDmMcUoSN
         7iAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702400951; x=1703005751;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=upBnebOqwsJ597ZlmCLWx528Yzi3Wcu30Pu2fcleukU=;
        b=k7X9PYbHbhQ5b+hJ8e+Yix4fCq8oD8vmjrPbglsnNiwlvFZr1V5DJvDGORT9sq0+0l
         TDV7g+LDUcheGsqwvJF2qW/UsMyhQ10YfqWAfVlfE52L1VyozpVnj21meyR35YJRMWoh
         W0gulfrsvnp8KIjHZYGBCb7Z2n9V6iidLZjcfBCssfaQu9cIpdIrMDucDNDkwHCQsCow
         +MDxsmUEeBZ95mDBVRUZbJMKutIVyYATfv+uMqbBaVJf4DAJeTmg8etD6zgOpip+c4uy
         1I1vrqTqdXLi4vWHxiUoq3b03mtw7RqZw7QD0T5RCLtYNZO0LU1w75GJTVt2ZPltT6xS
         y+RA==
X-Gm-Message-State: AOJu0YyDii0ZFjR9eI/oLc9imuMDyqrY/cTe3lTBNkj9VNhK3P1FRCdf
	Tp3ajNshMwOvvrSlLqLCI6072A8Ca6N1gi88g8BLWg==
X-Google-Smtp-Source: AGHT+IHWPQk3/S1nqdVFY2SvYM4mv4RMcFM6GJosPjrDfPNXU9stefweNMroytoNPvvl5pcUN2P754MhzBIe3u4BaAY=
X-Received: by 2002:a05:6122:2897:b0:4b2:acda:e1e4 with SMTP id
 fl23-20020a056122289700b004b2acdae1e4mr5776460vkb.6.1702400951144; Tue, 12
 Dec 2023 09:09:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231212054253.50094-1-warthog618@gmail.com>
In-Reply-To: <20231212054253.50094-1-warthog618@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Dec 2023 18:09:00 +0100
Message-ID: <CAMRc=Me90Lu7Duc8-4xSfDcHQd6M7+0t0O8FAa6jiizp-OO5=Q@mail.gmail.com>
Subject: Re: [PATCH 0/4] gpiolib: cdev: relocate debounce_period_us
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linus.walleij@linaro.org, andy@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 12, 2023 at 6:43=E2=80=AFAM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> This series contains minor improvements to gpiolib-cdev.
>
> The banner change is relocating the debounce_period_us from gpiolib's
> struct gpio_desc to cdev's struct line.  The first patch stores the
> field locally in cdev.  The second removes the now unused field from
> gpiolib.
>
> The third patch is somewhat related and removes a FIXME from
> gpio_desc_to_lineinfo().  The FIXME relates to a race condition in
> the calculation of the used  flag, but I would assert that from
> the userspace perspective the read operation itself is inherently racy.
> The line being reported as unused in the info provides no guarantee -
> it just an indicator that requesting the line is likely to succeed -
> assuming the line is not otherwise requested in the meantime.
> Give the overall operation is racy, trying to stamp out an unlikely
> race within the operation is pointless. Accept it as a possibility
> that has negligible side-effects and reduce the number of locks held
> simultaneously and the duration that the gpio_lock is held.
>
> The fourth patch is unrelated to debounce or info, but addresses Andy's
> recent assertion that the linereq get/set values functions are confusing
> and under documented.  Figured I may as well add that while I was in
> there.
>
> Kent Gibson (4):
>   gpiolib: cdev: relocate debounce_period_us from struct gpio_desc
>   gpiolib: remove debounce_period_us from struct gpio_desc
>   gpiolib: cdev: reduce locking in gpio_desc_to_lineinfo()
>   gpiolib: cdev: improve documentation of get/set values
>
>  drivers/gpio/gpiolib-cdev.c | 257 ++++++++++++++++++++++++++++--------
>  drivers/gpio/gpiolib.c      |   3 -
>  drivers/gpio/gpiolib.h      |   5 -
>  3 files changed, 201 insertions(+), 64 deletions(-)
>
> --
> 2.39.2
>

Patches 2-4 look fine, I was about to review patch 1 in detail but I
thought I'd just throw this one in here before we commit to a specific
solution.

For some reason I thought this would not work but I'm now considering
it as an alternative approach: is there anything wrong with adding
struct kref to struct line, allocating it separately per-line when
gpio_chardev_data is created, referencing it from struct linereq when
the line is being requested, and dropping the reference from
gpio_chardev_data and linereq when either is being removed? Other than
the increased number of allocations?

Bartosz

