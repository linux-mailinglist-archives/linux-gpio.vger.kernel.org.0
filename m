Return-Path: <linux-gpio+bounces-3254-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E92854416
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Feb 2024 09:35:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4519F1C26826
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Feb 2024 08:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27A411171E;
	Wed, 14 Feb 2024 08:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="NKqaNivg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1E2C2C6
	for <linux-gpio@vger.kernel.org>; Wed, 14 Feb 2024 08:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707899730; cv=none; b=Mg7AIKx025WF+UbmitltN9EOa5WC5haRgHnjryWdyEQ6aPPJAEHKOxjkly4IJJXoqqTCHe/PLcT6JFxR1LzVfgUY9UZR30Ib/S1fmi7RLXXwpCkwB5T+nGUkU+BocSXfTc4D47ynsbHwrFFryfd1yxr3TbHXTdrsd14GqPBwcIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707899730; c=relaxed/simple;
	bh=spAaQ33xPje2OqsiKs/awtX/+IIiYcK1RW5TzaBy/xI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hDJwofEOFcAJC/a6GxlFMSF+lRtBZic4JofN4CHn1ALcWT9Wk+yTyJGLduq01Ao8CeD1gHqyJXQCM96nCpApaS2MKoYG3E9xaFwnTjxjDyLeLWk0b8/AjTC3/+oDU8rGRGsNXkcUApvOFVYdSd4mRRF/oCsoQww1tcpIgqPVTtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=NKqaNivg; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-4c01ac04569so1839184e0c.1
        for <linux-gpio@vger.kernel.org>; Wed, 14 Feb 2024 00:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707899727; x=1708504527; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=spAaQ33xPje2OqsiKs/awtX/+IIiYcK1RW5TzaBy/xI=;
        b=NKqaNivg0KjM6W9lTTHK+HdUuEN0RRlvbkJK/U5mhQ4Mkg5GHe9qTsDDNcAveiMtOF
         tld0bhDIrZtmMJG/Yy7g56Bf3TdyJFoA/0EfCkh1nzos9wwzkp72TeOy6CfqpM8vi20m
         l8PLm7p+J5VMJFlVC074FSjylWY3XNaFsxk/YgR+j2m+3V7PD+WR/XaQqkBWmGb2vrit
         7qNrsMU2mdgebrB20xBy122gR6StLqWLs03S4j3wxfxHtnMCJrCFUrgNSE6a6D3StBXy
         V32eob31VS1U4Ek/kXiLGOQ0q1d+73LYUn12SVSNGK8sIUt7fIpweDZHBUDbV/RWmPXc
         6eWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707899727; x=1708504527;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=spAaQ33xPje2OqsiKs/awtX/+IIiYcK1RW5TzaBy/xI=;
        b=r/vKVFQEES/sz4b47+7FuwLrLorK2fpN+UhrRBbsg3OHpqskyP4PBee0JGffxp+gCY
         X23XG1jl5j3rrnefVnVj/RNoAyJSL7tfOD6AN8qlNeQjLXG2n6G81yYcQV+VG4EaAmm5
         /HKdak3UmNURGCoMxlH5qA2kavcwCiBuUI09S27/iGaj9Q8NtPN5Kf/AfXQS+5KH1YPK
         0uKmMpdo+Q/5zV/jmhrWQvsQL5fymYAE1QhIvTEkSYSmpqshGB0gkd4dGNfnqHfRB/FX
         ijbNc1pNO69tONyuKM4xlS7bVFVurwfMk/UJitQg38wjaevESU3jJAkR9pFn4tiK54cC
         VPtw==
X-Gm-Message-State: AOJu0Yy4JOrK2eRG+1/ta6eBEF73AOcX4NzthHlhcAxrlMjQPxFamk/d
	dlzYA0gltb1RMVhnLY3iTdNDG33mABUlCEJHTptJFxP/VJHJugsvbkQqQp1cWRIbRBtEDNGcOs5
	WrMkBmq8IkW9AjfnU0lKCGNf8QaLwJDrsSyBqPA==
X-Google-Smtp-Source: AGHT+IFF2OcVq7TWCcduOwbVchpiVcxoN9Ug1PYQo7B7Q/m1Q3Y4AuMWWytQeBy48lsVK4wVrNr4w2yQvkRjtjlp4xU=
X-Received: by 2002:a1f:6d84:0:b0:4c0:7041:77a9 with SMTP id
 i126-20020a1f6d84000000b004c0704177a9mr1834631vkc.12.1707899726915; Wed, 14
 Feb 2024 00:35:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240212213920.49796-1-brgl@bgdev.pl>
In-Reply-To: <20240212213920.49796-1-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 14 Feb 2024 09:35:15 +0100
Message-ID: <CAMRc=MePuzxBvRk5=5b3vQL=pF4eXfC=PqKsuqEBG11+5FbPvg@mail.gmail.com>
Subject: Re: [PATCH] gpio: initialize descriptor SRCU structure before adding
 OF-based chips
To: Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	Alex Elder <elder@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	"Paul E . McKenney" <paulmck@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Wolfram Sang <wsa@the-dreams.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 12, 2024 at 10:39=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> In certain situations we may end up taking the GPIO descriptor SRCU read
> lock in of_gpiochip_add() before the SRCU struct is initialized. Move
> the initialization before the call to of_gpiochip_add().
>
> Fixes: be711caa87c5 ("gpio: add SRCU infrastructure to struct gpio_desc")
> Fixes: 1f2bcb8c8ccd ("gpio: protect the descriptor label with SRCU")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-lkp/202402122228.e607a080-lkp@intel.co=
m
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

I'm queuing this quickly because next is currently broken for many platform=
s.

Bartosz

