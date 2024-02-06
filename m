Return-Path: <linux-gpio+bounces-3022-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAA284B40F
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Feb 2024 12:59:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2FF7FB20E34
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Feb 2024 11:59:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D5F4130ACB;
	Tue,  6 Feb 2024 11:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="XxfL1v8u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D031D130AC8
	for <linux-gpio@vger.kernel.org>; Tue,  6 Feb 2024 11:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707219798; cv=none; b=TRG8eKh7a3hDPhgIGz2rpVNtzUhmjeacpMOaNXuWaZN1GsfereA500CiwrujLHY/aoA22qyD4uAZ2pRhdWWdKc74UMBTW251+wvXqWUJvmuMiDaekFPK9v14qWWDJqvDcbuhikETnF2F/IzGMDt+3Fxskhb/PEFAjFh104mzJTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707219798; c=relaxed/simple;
	bh=EPQ+cVqCjVdYYihQHuYeCKtcklYcUa9mjYhu8zX/BuA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZClpp1XE7FQ+bl02LSwR0MXmjqPN9HbMLX13ce2OGDV1NRP1rDacvGw6jb1osNlSA8YcSZQ+QDJTKINnMsPkF6ZdPniXY7n/rr/l9+sgxrZgobEgZ/9zRUuXtO6gyhuO4s+zXwP9g+s3rvI1K/SlB+j9yd8wACKiKhwtsvaSA7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=XxfL1v8u; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-7d5bbbe57bbso2213594241.1
        for <linux-gpio@vger.kernel.org>; Tue, 06 Feb 2024 03:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707219793; x=1707824593; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EPQ+cVqCjVdYYihQHuYeCKtcklYcUa9mjYhu8zX/BuA=;
        b=XxfL1v8u6sMsN9nrWxz3yneNDrNHQiK1GCEXJleB+zkH9ivp4vIaoCy/aeV0UEN/lS
         GYFCud+hl8sYHjlh8dOJd6a1yuMQXFx4WQXo5zx/tBDTrGdtGYeeAitR1hDJ3J/hHNsE
         0GQKfRlYYg5yoFEegSPdnAGXyS6yKFUBAihKFKMi2LgRtjjdZF86xTcOSbYYIlxlrtRQ
         luZ1FUTTMosqss19s18XiGgbSELakyIH/IXr8GAbs1+HZ8pVj9v6iaREg9NDHXTR1kT3
         +3sm4Pn2mSS/uOfUfRjzEpJ+UzeyIFbAH+s/kyxecIPLN5ltRIPvuere8tgQfQcnizfg
         UGmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707219793; x=1707824593;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EPQ+cVqCjVdYYihQHuYeCKtcklYcUa9mjYhu8zX/BuA=;
        b=l4UxKQAtYulV/Ywmlz4FAj7qV17IFZu0xePExBZ4KN4uzdLzHy+B/ksfUAtGhEo4Pl
         o3/fO1teb+D7egwmsFexKBMzSFKNLc9yKE0MAyx3HIT1mBaOT5GSkBLShAFptFj0VoQm
         iWAfcWd7qVdvy9n/V6W1Md89BIsDmNklJb8SDxLXRpyOka5BER/XK54RGTEitPCzkaMs
         Q0UJH2PJuzYT2QR/K5Bv2jbGoKQNu3CxNhfltSLLle+MYTfocRTYV2wndekxo6Vg4QvY
         g1TSxMBtbGFAJJWgJhpxjYaUImIaSUOFBN48SqxzKAB/0n0iruEgijUhxneYibve6dQ6
         igJQ==
X-Gm-Message-State: AOJu0Yw5Rw4nMVQJNX9/FiGJ6uN6+dNC5H0OJDRlxUfLPL6EAMIAw4mt
	KOnyiVwBzVkuQXGL+va8GXst3RAh3ShSjnkqNpeapdURw96yuQn4/diyXZBoxlBo00aNF9ZGnv6
	XOh7WIiSxZT0Nxrkc2CdVg2BmxzwTwtQAIY5ebw==
X-Google-Smtp-Source: AGHT+IH/ty3l4JaUHzTYH22M32IOVtgJQ3dBcaWbXhnfjFajbREEFj3DCVA1V0Yyjmd3nXSfVWqfldaOAu0sdOIdccE=
X-Received: by 2002:a05:6122:1b0c:b0:4c0:1edf:f29f with SMTP id
 er12-20020a0561221b0c00b004c01edff29fmr2291037vkb.5.1707219793602; Tue, 06
 Feb 2024 03:43:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240130105515.30258-1-me@kloenk.de>
In-Reply-To: <20240130105515.30258-1-me@kloenk.de>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 6 Feb 2024 12:43:02 +0100
Message-ID: <CAMRc=Mdb+=aHyyMZCf3ALWot-QY=NZ_mR=bubqofwHRV4srG3Q@mail.gmail.com>
Subject: Re: [PATCH] gpio-mvebu: no hardcoded timer assignment for pwm
To: Finn Behrens <me@kloenk.de>
Cc: Thierry Reding <thierry.reding@gmail.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-pwm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Heisath <jannis@imserv.org>, Yureka Lilian <yuka@yuka.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 30, 2024 at 11:55=E2=80=AFAM Finn Behrens <me@kloenk.de> wrote:
>
> Removes the hardcoded timer assignment of timers to pwm controllers.
> This allows to use more than one pwm per gpio bank.
>
> Original patch with chip_data interface by Heisath <jannis@imserv.org>
>
> Link: https://wiki.kobol.io/helios4/pwm/#patch-requirement
> Co-developed-by: Yureka Lilian <yuka@yuka.dev>
> Signed-off-by: Yureka Lilian <yuka@yuka.dev>
> Signed-off-by: Finn Behrens <me@kloenk.de>
> ---

This looks good to me but I'd love for Uwe to Ack it before I pick it up.

Bart

