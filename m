Return-Path: <linux-gpio+bounces-21991-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D03DAE3709
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 09:35:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AAE7A16E3FD
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 07:35:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AF97201270;
	Mon, 23 Jun 2025 07:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="gxoLlVjq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74EA91E7C2E
	for <linux-gpio@vger.kernel.org>; Mon, 23 Jun 2025 07:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750664035; cv=none; b=Xjj21gYAbNdoZMLOPfsfpEpyytPQhGwelZQwGyPSQvJ1w9SkbPfWey15C2BSk4vAktGojM7tRLXtr5RrC/YSSVrkoEaQLMRHNR1IZugbSghoarE2ORydvPrrTA6nlWidxKa4VJtEb/QMWdnwnV6HbHGkX6hJcnkITtakg8TOfyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750664035; c=relaxed/simple;
	bh=hZqwKFrQ22pH+J6FCqtPgcrjFb7CkKy8B23+PKK0y8Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OUP6HJ3+NF1JAoHicQ1s71aJUocxcAI7x0vo1dJKoCgJwlncxpK/ROKt0dpliYBOvDzwAOnXmIg2U/4hXYqpd71VBS5XbqvLPHIV+FXDwHQILRL4isSEKd/1YhsAGCOz7jgfCtzNwP4bs5ELfSA6C2qQ/naUy5fRVezI/OFhVfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=gxoLlVjq; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54d98aa5981so5114965e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 23 Jun 2025 00:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750664032; x=1751268832; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e/FmDVYFDGwW5KMGc8hcV6hExdC2WI6OVDkBnOBtebc=;
        b=gxoLlVjq7UAq81SKleh0Z67563NNike1VukXSYueZBWksTROPOITfzXDsexJQXB7UE
         gsSWZFUfYxakoUtIqjb1aOGlpIX5thWlq2hFxnjFf1d85FzqvnA5k7EgOqcmAU50coQT
         G71FSEG7TNaIaHswOgiYYAUYzg/UhHfuG7ZwWrJW5Cuwi2v7YjFM9wF6iIGt4Q9fKot8
         zoNnFnIhFB677I+/avdqujD4Y+n2+vjYzpg8QYb11ZyFWvjEHsZxUI5nhT2M/22yp8gU
         Q7JrCPV0+FvEhPMegJ0Xd7sE1yQ3oObfTAxeLviSNoMa4ZbHlgvTe25pMdutOaL9b8Rt
         EK+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750664032; x=1751268832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e/FmDVYFDGwW5KMGc8hcV6hExdC2WI6OVDkBnOBtebc=;
        b=fRkqCmK2ExIQ03rYxkZA8AClq1zC9TmH5RE9JDxbU9JbejeX5NTGgyH6eFzyHmj1/N
         9hZVihnWQYXZodDK20elYRWz/zZBwcZLIBRKAXkqI5005FF5m2lmnnVnoE4mlMOYPU2H
         KK62v46ZUPxAgjTqYCrqR/7zkZpudchevg6T0d2Cx+XFaqRUM9TYZWcgABFzHMRJX/F3
         W+kZjZCIX5ENgsRnD2jb0OiaEizALIVmVj8+TbCr13sJ16hpfpVflNmdpN7KhC+uCHSb
         5ox2OtUxI6tVLBcE6olRvzof24L1puiQn6rtsKHR3ZxvfOow7Ob9llfkXUjQ4CUImNaW
         0qMA==
X-Forwarded-Encrypted: i=1; AJvYcCVMCkZM0n+8BDp9tTSlKmlMimszf+S36YWdnYwDv1zGH6PI+xBb9qpARdLyWzBi1xYDx8qEYUCaQnxS@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi01p3Vj/t1lByt8xkki+R8h6LIE5bZ05iXyZ7Kg4GBehdS4Qa
	1hrp+xPRQ+yDTuEwJ1S4DA6XcgZRXklHhTv7EppKjnDGpvhzJx1XfVHYlVMlc4Mhp7BUOizWmzI
	SE1xoO8nzIUwe8iD/6TVEVyje2wrW3s7aVRAwhi7EkA==
X-Gm-Gg: ASbGncvz4NqNRBP4rrTR0wHDCtgzIjVVXMxb7ScBbdA9wbiUkwwdZ0G8GCbucTxdxlE
	cqdEJKUjzSNFLCkC6nqCCsGgi30UQZhY3+AXeYobHsoaJ1G9VEDzDvh9hTOk1N/jKyRKZPhES9p
	ZCFGd8rqXQVd1r8T1a/39NB1Tv+zMbzrs+c3ZpixCzZMgKugCEpljMirNI8mIVLoDbCPTbQFl08
	w==
X-Google-Smtp-Source: AGHT+IHXbQ1G61S6XTmap3R9KFxqdYburMPb7gYbxhsdAd+vhJ5pZrPzhPGsI5r9CHk6R8GllO6W7NbS7Xfzhgc6R0U=
X-Received: by 2002:a05:6512:1153:b0:553:a4a8:b860 with SMTP id
 2adb3069b0e04-553e3af3b66mr3432565e87.0.1750664031428; Mon, 23 Jun 2025
 00:33:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-soc-v1-0-1a0c36c9deed@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-soc-v1-0-1a0c36c9deed@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 23 Jun 2025 09:33:40 +0200
X-Gm-Features: AX0GCFvZI7j6aCfaYMvSqKv_YVgtIm3etGx79fDwp0jhT33AUgmaBnK_549jfVI
Message-ID: <CAMRc=McVV=VBw0DRiz-4tTjh7ZtRLWg=N_LQ2-7O1sKyW30rxw@mail.gmail.com>
Subject: Re: [PATCH 0/2] soc: use new GPIO line value setter callbacks
To: Qiang Zhao <qiang.zhao@nxp.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 2:38=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> values") added new line setter callbacks to struct gpio_chip. They allow
> to indicate failures to callers. We're in the process of converting all
> GPIO controllers to using them before removing the old ones. This series
> converts all GPIO chips implemented under drivers/soc/.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Bartosz Golaszewski (2):
>       soc: fsl: qe: use new GPIO line value setter callbacks
>       soc: renesas: pwc-rzv2m: use new GPIO line value setter callbacks
>
>  drivers/soc/fsl/qe/gpio.c       | 6 ++++--
>  drivers/soc/renesas/pwc-rzv2m.c | 8 +++++---
>  2 files changed, 9 insertions(+), 5 deletions(-)
> ---
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> change-id: 20250523-gpiochip-set-rv-soc-14e1d9414f70
>
> Best regards,
> --
> Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>

I see Geert queued patch 2/2, who would take patch 1/2?

Bart

