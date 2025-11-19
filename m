Return-Path: <linux-gpio+bounces-28726-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 371CBC6D1FE
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 08:31:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 71FE84F286F
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 07:30:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACEBA325716;
	Wed, 19 Nov 2025 07:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wCirnxAo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA1E322DA8
	for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 07:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763537396; cv=none; b=D9C6oX/UsVgnFbi1FtSxiDeI2ezjjBRVqxFqDkL4mKWz3e51bB6G1SM/1Iv9TZHoN3nzYQ0ltIGgUNhrsBZ/S1FqPUDE2oGTCK+0+LkL55w5SiYwWpd4m8WNR4dPsjmD7TsyAVSJ+hKHtshVvHV8eIvuWvdPGe6LOE4l1By9f6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763537396; c=relaxed/simple;
	bh=+x0dUrenumZ0Aa4scDAS4MJoWOK7CsOZz8OM7C6cxKo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kStfMDyWH/CHpOOvH6qL0EtFsPxCiYwuFo0EmO5HlD0SVQzxYjmL9Lq1xHmxWjbosVX/O6kTUDZFG0YNugTwFmU2Dahio/5/268en+ZqQoCGfVBbct2XOj9O+W7N7n0Q8D3qK5x0FveJFVqU4lordfAbaz4/rAL22rVRcMDoQm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wCirnxAo; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5957db5bdedso6000552e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 23:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763537392; x=1764142192; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+x0dUrenumZ0Aa4scDAS4MJoWOK7CsOZz8OM7C6cxKo=;
        b=wCirnxAoCRbW/A/hLi1roGd2K0NC2ZgtVnHovjh8p/izvaIgjXUJo7EQb4TDip8yT4
         scsTieTaQHfBiegmUicqUGIzKAsE6YZqe0uODlZ3tJuYdwofUvmfc2bWI5zNlYpVlHcX
         ShbZJr2m09h3tP+n/qD64G9yj921PFzH5qur85NmbeJtzXPoI8FfKrfVi9PZQnI+epxq
         08oXeEsQzVt+XLmtqGWLwWxlUBslVJqM/ThGWyBKt5vSBsdhmbHwOVKPICepqD6dCMG3
         zd+r7vuvQlzco4nvwXQbm60ew4kePf18laTCItPCsvaoqlHi+28nI1UFGS4lcSPKJGzv
         5Ftg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763537392; x=1764142192;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+x0dUrenumZ0Aa4scDAS4MJoWOK7CsOZz8OM7C6cxKo=;
        b=ksn5+dUJwI/MA/z52385LiIFrwzI6RpEBPZLPOoo5f2EUuSFghRXMMiEHPxiRrJ5jd
         T/roWq0HXtF9cv7hUWhjUy7a8Jr2BQzuoTxy8pplz7FbmeWvWHtQAhwqN7trlaRWPple
         NgbFf+xBVm7FsQOhfgeKgP7w5v4jTow6yrwo+RMrfMsgEpmUH7nV3AucZzFWcOlMo0Kz
         bubVteIISflKLvSe+i+KWDaTrOvkY5Md20/8clFO7iYPAnPuP3Hg0isZSOUG/WQAUOaM
         lA96DgcWBh+g+WWbDiT8EfH1tyjnfpueUJd7GaENszWwRGyqmihmYb1UGPPmSk2HNkXd
         8BsQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5wONKFhNZ7igosNR/OCZl61vRmS0XhBYEekygb9AUW2EHwwPqPOwROU2oZfMgV2FHP1vUfE7/P9Xk@vger.kernel.org
X-Gm-Message-State: AOJu0YwiH/JldgQ9AYuP4j2iygx830oquvxrFTkqjptRNX9Nz+eInJXH
	UeFMrc2jCZ4bAhDivsX2czQJcxhd+uc9PJyN82a9vN7ZKO2PmXZtoQDO3/kWW800X0cgTWWAM2I
	dNyckvZN2GYJ2nVJ0swwphwfiaJbB6nAB522kEmGwJw==
X-Gm-Gg: ASbGncsFL7epuYfBg8GTBsZofABG8rQfOEmPND/29Ae2eqkZv9FtX31sEZEBpk8AfyJ
	h8pGXz6Bq/fAcrjrIs580CSJ9Mdl6a+P0kjW25b1HjBlU3cbVwzgPAy4uHjNUnCorVL/4bVqbop
	PE3MDkmZ9FMs+4CsBO2q6l7yT/bDp+px3Ha/SOV2Q6EQYR9oEfnygxKSJ3JEBvR/YIrMSduGiqs
	zFtF8pUoGJ3C+pty/aUDiILggKt6MZtBCMBwLGA1CG2bqp2zbwAV0K5Mr1bOCGUoozSa8yUOvg8
	1+1tevCtUOBclGWf6/GizTY9ChE=
X-Google-Smtp-Source: AGHT+IGCXomYNdi6CNzjGIUnxDGEZ04I7YljUtIzzVstmjRa9/Iq1zUEHk5Dyz+5zPtmVbowf3ej/MMTa2u10vG0OfQ=
X-Received: by 2002:a05:6512:b26:b0:594:37bc:7b3e with SMTP id
 2adb3069b0e04-59604e3f4efmr609160e87.33.1763537392350; Tue, 18 Nov 2025
 23:29:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112034040.457801-1-raag.jadav@intel.com> <CAMRc=MfYZq8vKxb736RRc17Ufu1A+6YDMuKDSME3Ly73y1ZRvw@mail.gmail.com>
 <aR1mWeLBlahs6RG-@black.igk.intel.com>
In-Reply-To: <aR1mWeLBlahs6RG-@black.igk.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 19 Nov 2025 08:29:38 +0100
X-Gm-Features: AWmQ_bkZoulpMAAbqEl3nxDO6Rzv18u54YV8pIOrtIad2H30_1u5suuqPGo8RKY
Message-ID: <CAMRc=MfNY0RH4a-9PFvxuhYA3jSp3hfLkR6PvH5NqRKTd2ixoA@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Introduce Intel Elkhart Lake PSE I/O
To: Raag Jadav <raag.jadav@intel.com>
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com, 
	andriy.shevchenko@linux.intel.com, linus.walleij@linaro.org, 
	platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 7:40=E2=80=AFAM Raag Jadav <raag.jadav@intel.com> w=
rote:
>
> On Wed, Nov 12, 2025 at 04:14:11PM +0100, Bartosz Golaszewski wrote:
>
> ...
>
> > When this goes into the x86 tree, can you make it available on an
> > immutable branch for me to pull into the GPIO tree? Either just patch
> > 1/2 or both of them with my Ack.
>
> Anything I can do to move this forward?
>
> Raag

With an Ack from Ilpo I can take it through my tree.

Bart

