Return-Path: <linux-gpio+bounces-2828-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9F184481B
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 20:38:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E91BC28715A
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 19:38:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D83063EA9E;
	Wed, 31 Jan 2024 19:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YJEUKwz/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5D33F8EA
	for <linux-gpio@vger.kernel.org>; Wed, 31 Jan 2024 19:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706729921; cv=none; b=ZAPKLwTKAw+yEXBpaywvHSehwFI5sa5C54xA8SjdC8JcoHlZKfFnDTvtI89huGAa4or4H+Be3AeNYxh9LQzgDRZRytpFTjnXRcYagPH5NjmdM7O6ct5zGn9f6JCuSMIsL4z0Syuv98aucL+AM+6MvD0jKEghRrI85H831ClxtwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706729921; c=relaxed/simple;
	bh=QviVwlCtPxL741z85GFt74Kgvol/xfIlxszz4+9WTG0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kVmSIvsndhJ/f0XiE+zqGTV5q0Jpadb4kxEJcZzeUrquSUUqwFh9x5aVr9GVbsDIK7MomFl4+N03E+lrQgL+Z9zIBPQVAQEJjYF7CJJ+SdRAKQspx1Fli8fq5H95WYh515sep5BJC6eo/bApwdgOKVHQ3xPW4Bv8/vFi72qi+fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YJEUKwz/; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-60417488f07so1525047b3.1
        for <linux-gpio@vger.kernel.org>; Wed, 31 Jan 2024 11:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706729919; x=1707334719; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QviVwlCtPxL741z85GFt74Kgvol/xfIlxszz4+9WTG0=;
        b=YJEUKwz/3blRZX5CT/lVTFSee81+oebXQmbGogmgqAKshns1OOG4wgTuudJXd3DP8B
         RIJMnoGb7V3pRtcnS82b1FNYgURDV9DOaQrZjbu9/F+iWJgkLfEVwUROZ3vtv6uoNU6W
         Jkc+xSaOBAV9LLXiJl7fCdlLsMJAi5J80fr9k6Xr51HiQYIV8pRsWdTx6B/W+3iihxjS
         vujB2YCufFpiObziC2Dh7C9b0RN2ZU/MayJWheTnk+fCdlQArzLuDFPh/qdKGdtIuuRu
         gJ0g2um62MzT7EuO1Etofs21k5Q4jn+Kr1JD+13WDC5wCMvokaqdKf4SegrmUU7DnN5L
         oRAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706729919; x=1707334719;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QviVwlCtPxL741z85GFt74Kgvol/xfIlxszz4+9WTG0=;
        b=mQIgwtJL0b0UIa5gJWy/9uMWzgB1G3Cv5BwH6vSJggdxRQ8k+KAlgKiXTYtQSAAVTU
         g/3eRHN6juR9dr/I6wAVhyqUWa3YypMWDLf0DAcf+N4dPc/Elz7x1f0znFcUlMMHA2GR
         ITLh7HifLaHKX4Eb1HMmfOU2dGhZnciqZ+1/CTkBYt+ZXq78MS+zQMbJR1mlByVtbZEK
         I9LPsn/q7YdHD31gCM/eQtW4DgRdye1rCjNd87LY0Mtei3/+PL4oZILtK7iRlDLXPxix
         dcx4iGSu4zD1nvYJnnicthfgnzQ3Lbk9V/rX0jtUrsSBnv6toNrqcU0Vx8OOOxzQqDn3
         RFRw==
X-Gm-Message-State: AOJu0YyJ8uJX6Nvn+pdmDckBrT09VHRDi6m/VwuMJgIOen/1p2ewDuAC
	eFVEDvSg0+dwZb8ilFqHeU2QLzokiz4Pqaatx860Wm4Sgm2CQ749aY1BJD9C0KgQF5XIAiKs4K9
	EqsQbodp5dp5S1p7raxBb3CIXgrFhigJksGWbEg==
X-Google-Smtp-Source: AGHT+IE1bwCo+lTq+kZ2LEwAoLTpkfJgcmkTSIwc2DM4UD4SWWJ3+uIxRoC7Ul3Ik2TVh13Fy6VkddKvwDwMElPrnmw=
X-Received: by 2002:a81:ad53:0:b0:5ef:463c:8eea with SMTP id
 l19-20020a81ad53000000b005ef463c8eeamr57839ywk.20.1706729919050; Wed, 31 Jan
 2024 11:38:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240130124828.14678-1-brgl@bgdev.pl> <20240130124828.14678-6-brgl@bgdev.pl>
In-Reply-To: <20240130124828.14678-6-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 31 Jan 2024 20:38:28 +0100
Message-ID: <CACRpkdaEuJw5JfM0BUB9XKWe3jK_Urcce5MufLORc1c6gLLztA@mail.gmail.com>
Subject: Re: [PATCH 05/22] gpio: don't set label from irq helpers
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kent Gibson <warthog618@gmail.com>, Alex Elder <elder@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, "Paul E . McKenney" <paulmck@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Wolfram Sang <wsa@the-dreams.de>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 30, 2024 at 1:48=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> We will soon serialize access to the descriptor label using SRCU. The
> write-side of the protection will require calling synchronize_srcu()
> which must not be called from atomic context. We have two irq helpers:
> gpiochip_lock_as_irq() and gpiochip_unlock_as_irq() that set the label
> if the GPIO is not requested but is being used as interrupt. They are
> called with a spinlock held from the interrupt subsystem.
>
> They must not do it if we are to use SRCU so instead let's move the
> special corner case to a dedicated getter.
>
> Let's use the flags of the descriptor to figure out whether we should
> use the special "interrupt" label.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

I would refine the commit message: what you do IIUC is that you
simply avoid modifying a string, the label isn't set anymore,
instead a const string is returned and it is selected from the
state of an atomic variable (ha! smart!) and that is how the
atomicity is achieved.

Anyway:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

