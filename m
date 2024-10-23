Return-Path: <linux-gpio+bounces-11821-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED429AC03E
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 09:30:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE1001C22929
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 07:30:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3068E154C0C;
	Wed, 23 Oct 2024 07:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="BwE5wB7C"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BB013AA31
	for <linux-gpio@vger.kernel.org>; Wed, 23 Oct 2024 07:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729668636; cv=none; b=Ag1n3AYKaNe2nspWlxSCVY4Lk3ZUjgqzZFv4jccCbVwo94vBMPbDK3yoSnWSbw+te4fmKHwO9SPS+fEJoF13FVM40mlE+nioO7b+LrZahZZ9S33PCU3lcmjn9XOZSKFX75LQ4Mqh6y1oz4yvyQZ7iFcprzCz8JUCxZjcC3MscK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729668636; c=relaxed/simple;
	bh=n739nx2UN/NZUZKONL+XuhvZ1JZzuzJ0nufrWP0ptmw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ll/LT8r86qoIWKXBSM7m/YFXXa5FRhWHsAG70TSlQEj1u3ajokPckn19mKzi18vqwRX3+xYdoEl2qwuK5lzBPXj3vLfPsc5O3LD4PSTV69nxvwtu+9S/Wwp1um7ktwDt77u+picIeSjSXkKzWTR/YXhf5BIXBxqBCeJ0eBeIEyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=BwE5wB7C; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2fb470a8b27so5097711fa.1
        for <linux-gpio@vger.kernel.org>; Wed, 23 Oct 2024 00:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729668633; x=1730273433; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n739nx2UN/NZUZKONL+XuhvZ1JZzuzJ0nufrWP0ptmw=;
        b=BwE5wB7Cri/jVgzmZDwe4ZNkcxuhE9GnIGsUEO82h/sbNcfuit0+qiYkzGGapY5a8k
         A1zL89884XHlhvq8Kam6KSHmy7py6o91k8CfkgqdPFwYqAIAxdpay1GKXH4fe9xBh1WD
         GWXUTPKrQ075uDVi7J6mqhD3RF+9uFG/DzzuIUUoYf8tZ1COAC9qlWpgr3Uc92MOk436
         4LuIVPZIlB5HqFANG5UoUXm6HyWXqLPyEPIOueeMt2DFTHWiPON8ujLHje9z3zBgTgtp
         sHnVK1HyJmTPc11RBV+dONRW1hrXi88EvTeHOUdo+L8u+YzlRWlJb18gHuDnIk36fIkw
         f6Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729668633; x=1730273433;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n739nx2UN/NZUZKONL+XuhvZ1JZzuzJ0nufrWP0ptmw=;
        b=CiiBpAUyFiLO7nUT4CjWY7iAOYVESOXVylu/lhFMbJzl2rkkbP5UlDNukZNwMnKYr8
         uc3LRiuTxexRal55vDPdzZM4Wkgn3I4ya0qtx4QKWjuL68L1XT/GSkn8wx43HgUZx7Ut
         kFhmtmg5peSYKGuU5TisbO2nk9T3ZlyPo9/edjUwo9xTzoIgLOaEVHHMv6TskP+inidf
         XaUK8JlvaPJgf6dDflu8/5I8qv6UopYZUN90D0NjLb7gqlupKSfguS3+oyfa06lHngOg
         02wdCnMoygoH41gEbQTwuFSAnSOnU29xc0h/W7fNPvUk+4wsNxly88CC9N6cEk4/C51Z
         Ln9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWuztMBZLIQ8e4O4kY0hUf5f3uaXSQAYhInI3am9vcCdzODk+UwDjwgxHGRHwLKyklNVmOg9tUPsftJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzsxGtG8Q2wAGM5AvpSb/j/j6Gq8c1ydyl4k2jwm1PrNFU2jLk/
	VBF/FH/di4/lQZv7L280s2FoRcZLmOEMmYUThdKobYoNi6iK02lArlUTA825f6IpQcEW4K8lzx1
	moPC2eprr35PV0c3CipeJoSAaZq3qZxjJykIKDA==
X-Google-Smtp-Source: AGHT+IEva4wXnakfKjcvafWbhgQwJmgwA5fWu6O1TBp2BSbKq+o1/SacVwJJ50gzLu8hzdCHr7hbC09FfJcgamvwsSA=
X-Received: by 2002:a05:651c:b0a:b0:2fb:49d7:8009 with SMTP id
 38308e7fff4ca-2fc91af1dd4mr19424311fa.3.1729668633091; Wed, 23 Oct 2024
 00:30:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241022194624.34223-1-surajsonawane0215@gmail.com> <20241022195432.35700-1-surajsonawane0215@gmail.com>
In-Reply-To: <20241022195432.35700-1-surajsonawane0215@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Oct 2024 09:30:21 +0200
Message-ID: <CAMRc=MdL2rnCG1ix_iTKAZ5+Oa9bC7P5BmKzYCZtQuyrP2DZGA@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: fix uninit-value in swnode_find_gpio
To: Suraj Sonawane <surajsonawane0215@gmail.com>
Cc: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2024 at 9:54=E2=80=AFPM Suraj Sonawane
<surajsonawane0215@gmail.com> wrote:
>
> Fix an issue detected by the Smatch tool:
>
> drivers/gpio/gpiolib-swnode.c:78 swnode_find_gpio() error:
> uninitialized symbol 'ret'.
>
> The issue occurs because the 'ret' variable may be used without
> initialization if the for_each_gpio_property_name loop does not run.
> This could lead to returning an undefined value, causing unpredictable
> behavior.
>
> Initialize 'ret' to 0 before the loop to ensure the function
> returns an error code if no properties are parsed, maintaining proper
> error handling.
>
> Signed-off-by: Suraj Sonawane <surajsonawane0215@gmail.com>

Please add a Fixes tag too.

Bart

