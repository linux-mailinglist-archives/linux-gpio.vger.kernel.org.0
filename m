Return-Path: <linux-gpio+bounces-2395-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 78835835D8C
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jan 2024 10:03:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DE7528459D
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jan 2024 09:03:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 163A53717F;
	Mon, 22 Jan 2024 09:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wSblBoNJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA9B36AFF
	for <linux-gpio@vger.kernel.org>; Mon, 22 Jan 2024 09:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705914201; cv=none; b=Rc5gvkynrHj6s+PXQhj3/vIDbQUx/vSSBoZv2O9JbSG+odNdJG2bNP06M8E0vIG9o2t2GkAz9BSKBVXy2jeOa68x4QNEjQ8J+24Bs4X+/eu+V4XxwrxSj3WTZWcmQfckrUVqvK2ld8Q/JaE6h/vEDU9lvyJPE/mboh31Pmv4/3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705914201; c=relaxed/simple;
	bh=+njKJ5zGoAf/8uWsGPVwc5bDkUZxyqOXYFLHFAW/f6c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hUk2rpqykJsLKW2zEhinSNSyYuI4X7beYxB06G36lq3P6PugGTacy4xftm3XXY6wc1ULuvfK3FVC9tvex9I1tjGmmgzAj5/llCdFi9ndF45hsfr/LiWLXeXS4tDWhMI7m8bH482F5+/rObqLQQji+NCUdJTGHyyUxman+h6awuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wSblBoNJ; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-466ec3e942bso621707137.1
        for <linux-gpio@vger.kernel.org>; Mon, 22 Jan 2024 01:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1705914199; x=1706518999; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TUR27c1+iHU3ojrC4LDJ/zTx5jkFmb+9moT9azuGDlQ=;
        b=wSblBoNJyUW83Q/Yh72CAloigRFzMjBMMeKhkZhDx1d89IRjoJkvYwtralFbjHMP9S
         jPjBgAZVVSU5Vk9raNUNQ4YJpKDSHWVVBuvCN/GNqmt/owdpKdWNOaciwhLtSXRgx/fa
         U4wKy12nS23bbtMw0clkkJPRLOdgQaiROW88wf4vV2n+A80H8ZAmyGVimq5L2urIm4lB
         PwvnG4swZ39ILrqqfesdfGpg45vb2Off8zkVkeAie+PGFiS1V/iCt0V5k2kv+omvHsP2
         KkcK0vGhXwvPUiLlIiCCECmjUEAwx0htMeu52J38Ib34S2mghP9snj+CYavaR23bYAGc
         RCYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705914199; x=1706518999;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TUR27c1+iHU3ojrC4LDJ/zTx5jkFmb+9moT9azuGDlQ=;
        b=Zcqh9NFHNuk8+Mm/SBlkGgWzEiShKOtNJgZKh2BgvT0Z+JVey4ZpkHjb+IuJuNzuMW
         Ye0hIIwfPVbHoyZdHRaQIkD3eMUaqlgthjpHs2o+w9bLOzNiuJfpPQHaOLcyoKxUdopt
         HBL5NbAb6PviSCVX7UtAS4fBemLfdDa7vTigHeDXzm1nSYZJrsqhXs8mfE+Qo+k5NedR
         z7rAA3y/RK/aCfn/eHch5TYMS9s5L3zCAdiEBEVC0f/2XA+ikVlh87nPP3/W4AhdVrA5
         OdZxSbPqeSw9kjrKOpRhau0zpex8DJ/itTVei8OlR9FiPo1sTp+i2zrtobsBj4jEKij7
         WNmg==
X-Gm-Message-State: AOJu0YyqT/8n3rGQeSL819dc8gA9cXNOMFkELhmA4DGwB2D1i5jMPvyC
	voUJ3pX1IV/xAg7chVypRV4rZRZpLtu/DglRWgxc2KrMdCv/zuzwXgdqIx32Ts/cgtCYYbtX2Jx
	OQNKnxJqjejgDNcLpxmXHjXMfllNES/Y/tCBWRQ==
X-Google-Smtp-Source: AGHT+IF8eESa41mI3oLuxHCHoMGVzbxUohIHKsVJ3gDU5CR8DvIfOpEJ9idSlUMF5+qSgs2hZ8AeLuwh28Hnrkt8UMQ=
X-Received: by 2002:a05:6102:2263:b0:468:1cc5:ed88 with SMTP id
 v3-20020a056102226300b004681cc5ed88mr550502vsd.23.1705914199051; Mon, 22 Jan
 2024 01:03:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240109140221.77725-1-warthog618@gmail.com>
In-Reply-To: <20240109140221.77725-1-warthog618@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 22 Jan 2024 10:03:08 +0100
Message-ID: <CAMRc=Mc+FseBCD8h9T8=rYUhOJ7QC4FOxH+ePULnyf_8mKJMrA@mail.gmail.com>
Subject: Re: [PATCH 0/5] gpio: uapi: documentation improvements
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linus.walleij@linaro.org, andy@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 9, 2024 at 3:02=E2=80=AFPM Kent Gibson <warthog618@gmail.com> w=
rote:
>
> This is a series of minor clarifications and formatting tidy ups for
> the GPIO uAPI kernel doc.
>
> The series is intended as a companion to my character device
> uAPI documentation series, but makes sense on its own too.
>
> The patches are self contained and trivial so not much to add here.
>
> Cheers,
> Kent.
>
> Kent Gibson (5):
>   gpio: uapi: improve description of fd fields
>   gpio: uapi: clarify hte references
>   gpio: uapi: drop trailing period from one sentence descriptions
>   gpio: uapi: document possible values of gpioevent_data.id
>   gpio: uapi: clarify using v2 rather than v1
>
>  include/uapi/linux/gpio.h | 52 ++++++++++++++++++++-------------------
>  1 file changed, 27 insertions(+), 25 deletions(-)
>
> --
> 2.39.2
>

Series applied, thanks!

Bart

