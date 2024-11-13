Return-Path: <linux-gpio+bounces-12937-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 887829C708E
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 14:26:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6905BB27CBE
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 13:25:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F22171E0E09;
	Wed, 13 Nov 2024 13:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZMSfxy1J"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9501E0B7B
	for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2024 13:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731504326; cv=none; b=DyOS68na6/6PbHFY3F1whYyyn2vAhLqUe3z+ZaG7Jzt4Z2Apcnjph/SlRRYs/bY6cELgmXUxDrHaU9n4sZroV80mGk46WOQysPoTaSkV7PSyBRQEa+kYY+wwjtAks7/2EJaRd6lt+20jKPK8sDM7zeSbPGP0GdO+2bqv55ZFmJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731504326; c=relaxed/simple;
	bh=tdm8/Adv+5ZGDymXWImoKTuoeLBiyC6kmUm06DeTBBg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kmVWQZiTrndEQOXL164nefqDAFa1En+kp0+em8plh3XMQZXtVfDkC6tMZXXNw6XeKedhkC8UsXfD37in969Qz/zK1kBb+9NwglOPxYdafx7Evf6Y01uEXiqgCWxn3UeLETNv6JqCWApeuxzYekol+/ZQhdaLQO8ZWESsWIpFw+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZMSfxy1J; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2fc968b3545so61680721fa.2
        for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2024 05:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731504323; x=1732109123; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tdm8/Adv+5ZGDymXWImoKTuoeLBiyC6kmUm06DeTBBg=;
        b=ZMSfxy1JTsbmg4qE5PXwmnmHtp9WZnLl2sATgck7XMFp1elK++P0LEdIJXhh4HRmbV
         Ufg4bj6NXxGW+XUpQ1xkWGGFvQsnDm7MXqv+oUaPBAQg822JJ4U0844R3S5NXIE6HW90
         tC7f6Auh+3Lu9ZX/v+FHyla95yyj4Rd2xshrsXQHTjX0lOvvRq0bNMvFd5JIWd3DvrTu
         d8ipHONVSyvsqpXcdW1BnudjPBJWDvDoxWave+gSd4q3YDdvFPhOPdedm9Gy5USLVo9Y
         gjDtGSmyoE/333NxeYv3bPm3nnzTLJvkb0O/EuTLsNtN9HlgIcDQ8xPVHAxkA0Xrq8NE
         dhgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731504323; x=1732109123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tdm8/Adv+5ZGDymXWImoKTuoeLBiyC6kmUm06DeTBBg=;
        b=WCFng8e2MVSyDVjftKfdD5Y4rKKAmkVZFkOHWW3mhJeLlw8MW6LnBiqLJo6aZI1Yj/
         CBbwqGTr2LvbZdY2yPvJE4JI7RIWKCaaJrSSFuQzLY+buqq2c2I3IqOx3FuVyS4JZHb/
         zgiwn51OPKyBVPkIb92CXhP5Q17iHgGzphsfzpDU+fsR7dbMqEy7vhla0l4fwdKx7FdD
         SASkUNYgNwQlj1vKL7WLRKSvlCs8IqjkY8CEVplKubVz+87Yfm6ljFydvjC3F8OdA8Id
         KVOcWr7a9Z5/kXfhx/n8/Fyh3JeaT/7+bUDLH3E1kqrGPO1vK0A+MirHup2kBVSi3Ymz
         gZDg==
X-Forwarded-Encrypted: i=1; AJvYcCWPIIJGebym2jUuKS+UcoocinFlSgVqN6Px5v/HwUD8YiKkkAtuR/RiwsPl2is7e8LY4zxh5eCAbWn9@vger.kernel.org
X-Gm-Message-State: AOJu0YyQyW44PdGU/GYI7DuKJrtJ9Wk/uNqNF6JUo+uFRf/TgGgkONqd
	sUt99WnB4F0/B0aZDAikpNKxSXtIObhX0MbXLxasO5uP/luwrfEFQVqa4PqJ4yTHe7rxU0pMmI4
	5pPts10rJv4JHXHMK+4BYOkEmT72WijKvd7hHOw==
X-Google-Smtp-Source: AGHT+IHX8+zHy2cRQuozOk3orjfKceKGL6x8ZLfWGh9apX7pumtVpc991puIgqUN2OLaLTkg6vBcgQb/2f4+fVGfe7I=
X-Received: by 2002:a2e:a90c:0:b0:2f3:f7cf:2f01 with SMTP id
 38308e7fff4ca-2ff4c674adamr15664021fa.41.1731504323148; Wed, 13 Nov 2024
 05:25:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241111023412.3466161-1-ye.zhang@rock-chips.com> <20241111023412.3466161-5-ye.zhang@rock-chips.com>
In-Reply-To: <20241111023412.3466161-5-ye.zhang@rock-chips.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 13 Nov 2024 14:25:11 +0100
Message-ID: <CACRpkdYSBTvMdQtJrLza2=--dz49Xz667h7p15P+5zVm5nji5g@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] gpio: rockchip: Set input direction when request irq
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: brgl@bgdev.pl, heiko@sntech.de, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, mika.westerberg@linux.intel.com, 
	andriy.shevchenko@linux.intel.com, tao.huang@rock-chips.com, 
	finley.xiao@rock-chips.com, tim.chen@rock-chips.com, 
	elaine.zhang@rock-chips.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 11, 2024 at 3:34=E2=80=AFAM Ye Zhang <ye.zhang@rock-chips.com> =
wrote:

> Since the GPIO can only generate interrupts when its direction is set to
> input, it is set to input before requesting the interrupt resources.
>
> Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

