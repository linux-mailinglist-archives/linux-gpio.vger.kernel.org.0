Return-Path: <linux-gpio+bounces-2407-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B0E835FE6
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jan 2024 11:43:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 321A9B26D3C
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jan 2024 10:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 663B73A1BE;
	Mon, 22 Jan 2024 10:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bnCvsehv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E995E208C1
	for <linux-gpio@vger.kernel.org>; Mon, 22 Jan 2024 10:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705920190; cv=none; b=LC+YXE9lvoDYUh0aedvH4ujtTNqxfPEtgQnP/h5lldEr7pERzLw3KS1/oDJAan85UxnWHCVYpQanG9f7ypCZgtZyMgcCx6JBfnwX98zU/ZcgRsDsKOBsdq7B+G1Cq7didbG5QbiAHIeLGSbTZYm2JWaJZhe7iTHo3Xu2X3cS/Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705920190; c=relaxed/simple;
	bh=5oqYQROB0Kj2f8NSD92TqgIP99V4g9fCFB4CjLVyyV4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GKJhsaaDp0YSo6ICGnkJmaL5iCbjRbaNz4+SDE5QHD4ddejBVxM3BB8qkv3BM4lXHClua7tjROR5wVCB7Yy+mVujGUtSghAAwVpL0imu8L9uXsfCooJ0n9TJ4ClzbSp4r8PNDd0datgMQvSGqyy4AtZZyteaHyNDlTVbbdKkO8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bnCvsehv; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-7d2e022ae0cso305851241.0
        for <linux-gpio@vger.kernel.org>; Mon, 22 Jan 2024 02:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1705920188; x=1706524988; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eZ55j/ic0rlHf/Ykc3pQwAhrvY4/zhXCceLbvJQAmvM=;
        b=bnCvsehvxEoBF5LmcVhP8uirvA4ngWAmg2rnk0onf3bAuENo3HVNp5Dikn1+7QpiCw
         dttXHjMAhsBOES80Zmavh3pXt1N1c56+DPM83Q493gTWExiFa32SUB8QtqyiiVvhaE7n
         XTCaOlmj5ClUVnWooQyfrgv4jd4yxxz16KbS0+Bou3BFO6A0+PbLXW0F+lgb0AMKHL2u
         muXlyGlJK6i2aYftSntivhucnD+R2K84lAFEzaJoDhVEVuXLCaGRigPLg8/stk7whaZf
         GLKYy8+K0d5btkkcj6V9lV4DCzMtWD3y/B6LW8HhPaE4oUSw3Gc7ekLNu5xg6UAJiOQb
         RrVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705920188; x=1706524988;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eZ55j/ic0rlHf/Ykc3pQwAhrvY4/zhXCceLbvJQAmvM=;
        b=m5KO3Qk3E2h331E7LH2giMXCNwkB/vna7GHDh+g+kOOU+r1IIZX4WJVgMdO5DEuutz
         1YJqxXYzlJf6YbsXcixsSo43IpbhdVfo5FTJHbk3rQTpHguhVe+Cj54YiGVhahMIg7sG
         waeVSGsoCk/uv+a6ajEcTYuP8gw84BD84GVSqmNPVtT2Hvd82lFHlQQUo7igfbtQgS+y
         WrxKQym+8LT98qf/a843SYba+dLAjmWS6du9Hn2IsONk3eDbcsxyG7xYUkChzJab0Cak
         TvwnB2rFnnFL844si3Y+XbFjJGVAFIXaq/8bwPzuMIZPS4qhwy/6WweDFOlQ4wqsN5jH
         j/Zw==
X-Gm-Message-State: AOJu0Yx+usRbDTjTjAWQRp3UWv5K5ZlXgNC3+JwWQCnOqK92zslayY7u
	OfNg9AoUo5aVMmkAKKQPsXV/GPJWeCHKw0C6v60wBfkloI/3HvguhsNy2eYR4qko/iTV2iVjFnY
	W9nNDcd/nU2mbD8Mo8ZLwYC5S/Cp3+UupQz3dYQ==
X-Google-Smtp-Source: AGHT+IF1TIaX+t9YjEAstpv56CbaerSKTUHPfO230BN/T3RswE0B36KNdIUciwzmYxJsCxfuy7UdE7RTQ9m1WbEgsd8=
X-Received: by 2002:a05:6122:3bd1:b0:4b6:dccf:72f1 with SMTP id
 ft17-20020a0561223bd100b004b6dccf72f1mr973391vkb.7.1705920187881; Mon, 22 Jan
 2024 02:43:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240109073849.10791-1-Wenhua.Lin@unisoc.com>
In-Reply-To: <20240109073849.10791-1-Wenhua.Lin@unisoc.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 22 Jan 2024 11:42:57 +0100
Message-ID: <CAMRc=Mf+UJN3BXBMrQxqLqRJrbmgoJ4kU_B5Mr+7MHvYt_aYvw@mail.gmail.com>
Subject: Re: [PATCH V4 0/2] gpio: sprd: Modification of UNISOC Platform EIC Driver
To: Wenhua Lin <Wenhua.Lin@unisoc.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy@kernel.org>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, wenhua lin <wenhua.lin1994@gmail.com>, 
	Xiongpeng Wu <xiongpeng.wu@unisoc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 9, 2024 at 8:39=E2=80=AFAM Wenhua Lin <Wenhua.Lin@unisoc.com> w=
rote:
>
> Recently, some bugs have been discovered during use, and patch1
> are bug fixes. Also, this patchset add optimization:
> patch2 optimization the calculation method of eic number.
>
> Change in V4:
>
> -Add Fixes tag in PATCH 1/2.
> -Change commit message in PATCH 1/2.
> -Add clearing interrupt to debounce and latch mode in PATCH 1/2.
>
> -Change commit message in PATCH 2/2.
> -Delete SPRD_EIC_VAR_DATA macro in PATCH 2/2.
>
> Wenhua Lin (2):
>   gpio: eic-sprd: Clear interrupt after set the interrupt type
>   gpio: eic-sprd: Optimize the calculation method of eic number
>
>  drivers/gpio/gpio-eic-sprd.c | 42 +++++++++++++++++++++++++++---------
>  1 file changed, 32 insertions(+), 10 deletions(-)
>
> --
> 2.17.1
>
>

Applied with Acks from Chunyan.

Bartosz

