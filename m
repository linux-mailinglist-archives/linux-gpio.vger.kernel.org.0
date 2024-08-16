Return-Path: <linux-gpio+bounces-8765-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6618295460B
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Aug 2024 11:47:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 15FD1282148
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Aug 2024 09:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A3EE13B593;
	Fri, 16 Aug 2024 09:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Dsae4XQO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5909685C5E
	for <linux-gpio@vger.kernel.org>; Fri, 16 Aug 2024 09:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723801598; cv=none; b=Mko143V4SDmRUDB8UGArod+LMNVOpyCrvA+tHMsmwmHhr83VavmQ0YTwPvJHTU7Ldc/I7/mlUveKgDrF7NiQd69ce8uH1qANKY8Bi1u/aj8c0ILjd/CObHZ3NtdfXGVZ47Od9mHpa612HVRG6SkvEmPYkIdeCyTsrn23Qki0h1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723801598; c=relaxed/simple;
	bh=W8HKJXZt0TN3Tj9q4TYFeHZ4IWMQolPAsG4dzs16Wo0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UEO3oJeB8HsY4oUZ3FnaStub76L+jiwX02McL6gHMFlMDB/FPdGVG0rM4l5eDwz1XsKAVVyrrvRBEu7LedRWbGu1sb4+A+YiBGXsn+shXr5InvO4fdM0Ry56BwdByRD5H6QBuuMT3d5fqMIH61k5YceGM4JAC0/h3IzVtLGHmcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Dsae4XQO; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52f025bc147so2104381e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 16 Aug 2024 02:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1723801594; x=1724406394; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K9FPDpC98yx9w2tg8hr+an2980Cz94S+kQLAPpDLRKA=;
        b=Dsae4XQOtQm1E4S6uv5+cSfopQh3nvjF77wG9E/9+OpoM9yg+utHEpdq2MMdgsZM5Q
         GGhwxV/KhfjWozXioGp/8r2yRZX6cASSi2+DD2lNbW4pndYZzpn6YjrUo/qkPi8t6gyG
         VO6WJAs8kYnJZGs/f18+REmDOFjRl0HWlrOI/8plWzhOChgXg0Yfw+P1ftxmyl62RxWr
         CsCuJnkMk+kkORenP+PicDKoMgUp7tFz5+YUzFAOw1jysZIsqOpkkWAizyhICwCKVxCJ
         yO3i2ioNayWkxmGVF+WHYr7I+Cn0B4ToVkVc6veiUJDwMx6oFnJ0ySV7RtKCvyRrcmd0
         uZBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723801594; x=1724406394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K9FPDpC98yx9w2tg8hr+an2980Cz94S+kQLAPpDLRKA=;
        b=GeQzI8UGvUNAwOfV3hu9825obiUrlWvSLOkb8Gs8ClUvah1ejpPfcJ+lXFg104HJaW
         O4EhB2Uf/EzPondjMlxa23uAoJw9qNBDfax2J+BrI28zvEZIqlr+QfUpri8mukEeR9d9
         q9NEOfgZi8j6jESKeAYZZ6QJN9LLIjGtFzh9hqdSlriXceJZxdKnH/BM37knoPoAgwLu
         AXrSOososiYp3c7HvNCTQOOqLBM9VYGq6pFne7PiZEqe7qpbS1erJtukwS5ssbT3BtOc
         KCjZ88K7FVurb7uOBLFxvBB7w8Ah82/HEHXvPLLhnoMtELJu28mbpEkWqZopYT1wE0en
         VX+A==
X-Forwarded-Encrypted: i=1; AJvYcCWku64eF/REQm8Gr8TK/iZwVzW7Q+zYlAoEQ52OxJl5hDirdayi/sT8zr4jAfD4BRkWc594ce3AEvung+3z1XJ/LX7pHEDFjCRX2w==
X-Gm-Message-State: AOJu0YzW4wafVNGoz2ohviRv6AQKnfxgyvLIM5sdOs867dqECrUNe00Q
	BIZ/Newymg+tTbLKi5WD542DdoXi6uHuczBFP1vsB/oGO5L4Sw27I7cG/Hek/eVxDZE/RwJnrUK
	w+PGFFZuKPPLNRwmnwG+gvGfBDrx6/xKl4nhS4w==
X-Google-Smtp-Source: AGHT+IElPnoMlGEFeaYa6XJMX42p2RFjCrFohE/fSRX4wJDpOl934ILAd0fjz1CAkQ4BdsJ8KwsBja6aeGlxue7xk1w=
X-Received: by 2002:a05:6512:2528:b0:530:d088:234a with SMTP id
 2adb3069b0e04-5331c6ede52mr1482287e87.54.1723801593845; Fri, 16 Aug 2024
 02:46:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240815071651.3645949-1-ye.zhang@rock-chips.com>
In-Reply-To: <20240815071651.3645949-1-ye.zhang@rock-chips.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 16 Aug 2024 11:46:22 +0200
Message-ID: <CAMRc=McL-ddFd8foH=cXW8nNvX=FVY+PwErYkh_OO9t0K=a_AA@mail.gmail.com>
Subject: Re: [PATCH v1 0/5] gpio: rockchip: Update the GPIO driver
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: linus.walleij@linaro.org, heiko@sntech.de, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, tao.huang@rock-chips.com, 
	finley.xiao@rock-chips.com, tim.chen@rock-chips.com, 
	elaine.zhang@rock-chips.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 15, 2024 at 9:17=E2=80=AFAM Ye Zhang <ye.zhang@rock-chips.com> =
wrote:
>
> GPIO driver support acpi and new version, set input direction in
> irq_request_resources, fix division error and debounce config error.
>
> Ye Zhang (5):
>   gpio: rockchip: support acpi
>   gpio: rockchip: support GPIO_TYPE_V2_2
>   gpio: rockchip: Set input direction in irq_request_resources
>   gpio: rockchip: avoid division by zero
>   rockchip: gpio: fix debounce config error
>
>  drivers/gpio/gpio-rockchip.c | 286 ++++++++++++++++++++++-------------
>  1 file changed, 180 insertions(+), 106 deletions(-)
>
> --
> 2.34.1
>

Please Cc the GPIO ACPI maintainers on this series: Mika Westerberg
<mika.westerberg@linux.intel.com> and Andy Shevchenko
<andriy.shevchenko@linux.intel.com>.

Bart

