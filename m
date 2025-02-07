Return-Path: <linux-gpio+bounces-15581-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDC1A2CE2D
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 21:33:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F5171691F3
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 20:33:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63A661A5B98;
	Fri,  7 Feb 2025 20:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Yw+B2VcT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4C8194C9E
	for <linux-gpio@vger.kernel.org>; Fri,  7 Feb 2025 20:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738960397; cv=none; b=Rq6J0zAkEnNJxZE3LhK6DJ9AjllseOfpmqOWRl0LiA/p2OG8Q1gvoqbfaPSKwSDVw0SzhE8HARtO9mdFKcZqHuyK957jTkO6QVvTXlK6/bVoEZQAqP3xvEclGX/OKFEmb5cJop+KnTno9oCJNJh9lwyLN2Q4GK4X92FqDulgN6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738960397; c=relaxed/simple;
	bh=T0i+T8f/fGXbZDbRjptinB25bnQH0CfmcAFBJRxvNRE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PcO69iboasg1zrg5qEMt4gpq7b7YJTvvlTzJLljUZopYSu/fEHJa7rKZDaDYtrTwQM+KncYxy60Pjd5Lh9IhJ30sHAdbXu2QhmMnSTK5z9LfAwX+BHxoPUXmgNXQVjno/UYKLW2W1lVpBM7JUINRdPVNjUE3drTI1IPb05oETNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Yw+B2VcT; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-543e47e93a3so2694876e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 07 Feb 2025 12:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738960393; x=1739565193; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wW2vOgB6bgDG5mmgyCSvB76L98jFgeTMFmrfO8s1Z6k=;
        b=Yw+B2VcT9uLjmAa9xQiYjEqTE7nykO5ygDR9UR/ne7WESsuclgCRGSpz4gV6SOBi9x
         Tmeez6WbXnDTspPHt+hkLmV84ixgMFDXNITAGmNhtxMAklDKuvPnifyftaYvTQ8wuPCi
         eiIfOYd72xRHoiA9EwlwzhwSwqOh352I4fziVxROXoAPNEG3MDSSDit5dUl90kcmZs9H
         DNtBEgDUASIb4vakwMWnxCazvs6UhetkFyJnj6ROKvW29fdKu6Vd5bis87xCA+phpmWW
         jva9Lp/vIjkyMsaDyk1VeghKN3cJjTFYJVlw8Gj3LBj9TatbFVDJaErSNj6ZBHr5n2oU
         qfUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738960393; x=1739565193;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wW2vOgB6bgDG5mmgyCSvB76L98jFgeTMFmrfO8s1Z6k=;
        b=eDBy6IcNV9wo4iWXveVznN2vB7svDEI8rdjb+ZKmZsBryG/U3zyFhqt7rbKLvZa7NZ
         SIsy82uHgMOqS7/lbf5p0Cq46rbDm1Tcv7ll72PQYKIz5plUTvA+iuTvRJa75c3LtMQ6
         ioR4K76ompD+1/5EsUQciVe2sc62JMr3cXqaLxMHMBkKdTAHVAlUxxaKaEnXWq+lKZC5
         noLvOpaCLPxGwG48LRyoS76KuEGKiRupfTAWRvpz9ZS3EfRTsqsuNy9Jj92vD+zGUoPY
         rkZTmvioeOOvKjcMaybl8APsgme4oE9Dj0kbn2Hphse2Vzls1cpa3smMMqYZ/ZPmn0DE
         Y+mg==
X-Gm-Message-State: AOJu0Yw8sSCtVeO7DmxnMN8bYsRqHv5a/6zzUiZP8dqD/fQiPMmqgA5y
	1//LIof9qSOYIgubZgWO2dpd0l6DJ/t91JJGRl0G9iZQUvKb9vkC+EU6ODHwJMY/lK0y4xwup6l
	f8w6MP9gTk0bIyhZ+0kfByop8/WJMVVYDKHbAQg==
X-Gm-Gg: ASbGncsA1Aq0GHkOD9m+yJBOEvF95SmZdJIMbDV+FK6fCvbSkn+g2E1NC7gHDKqKXvL
	YhskVziebHGo1OIomJlgvLwyd+XfxisCkJKoQgjNnm98K6AclNPw3xXTy4U+89Aliem79HOIor2
	JMLerffIrNNqWcB7hm5mqrKBsdcMQ=
X-Google-Smtp-Source: AGHT+IF1IrGAtJdeeEHIkfuTVjmO57+6voLGDlLEPmeCMVPqcpYupKtXRcE7wRdLsw8262YSbmFgdCwRyTc+m/xBfYQ=
X-Received: by 2002:a05:6512:3ca1:b0:545:48c:6de2 with SMTP id
 2adb3069b0e04-545048c6f8fmr62951e87.13.1738960393528; Fri, 07 Feb 2025
 12:33:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207083030.17698-1-brgl@bgdev.pl>
In-Reply-To: <20250207083030.17698-1-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 7 Feb 2025 21:33:02 +0100
X-Gm-Features: AWEUYZlP1D4GyPf7liRrgYL26q5AaSQQ2fCUIiqVJnjpqgQs7J9PvQ3GnLGOYBI
Message-ID: <CAMRc=MfSr4CN_3GABi_NH0W4ACg4UU7KUBJ-NoUdXQ6Ou-FboQ@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: add missing include
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 7, 2025 at 9:30=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> With some randconfigs I'm seeing the following error:
>
> In file included from drivers/gpio/gpiolib-swnode.c:19:
> ./include/linux/gpio/consumer.h: In function =E2=80=98gpiod_enable_hw_tim=
estamp_ns=E2=80=99:
> ./include/linux/gpio/consumer.h:557:17: error: implicit declaration of fu=
nction =E2=80=98WARN_ON=E2=80=99 [-Wimplicit-function-declaration]
>   557 |                 WARN_ON(desc);
>       |                 ^~~~~~~
>
> Pull in bug.h to fix it.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  include/linux/gpio/consumer.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.=
h
> index db2dfbae8edb..0b1acd014186 100644
> --- a/include/linux/gpio/consumer.h
> +++ b/include/linux/gpio/consumer.h
> @@ -3,6 +3,7 @@
>  #define __LINUX_GPIO_CONSUMER_H
>
>  #include <linux/bits.h>
> +#include <linux/bug.h>
>  #include <linux/types.h>
>
>  struct acpi_device;
> --
> 2.45.2
>

Ah, build bot responding to my CONFIG_HTE patch made me realize we
already include asm/bug.h for !CONFIG_GPIOLIB. I'll rethink the
approach here as we'll need it for the HTE stubs too.

Bart

