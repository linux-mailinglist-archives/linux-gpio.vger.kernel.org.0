Return-Path: <linux-gpio+bounces-17435-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 129FDA5C3D5
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 15:32:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A61D16FD22
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 14:32:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 567D22580DD;
	Tue, 11 Mar 2025 14:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="cHY8ImlW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE23158A13
	for <linux-gpio@vger.kernel.org>; Tue, 11 Mar 2025 14:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741703567; cv=none; b=YOtSNE3gssmhyKNCKNVFyClM17Lz8fxK+dqyRTkF8O/mMNGXwQtYxMEY16szLKyZJCZ7BGRXyAVTXOlstVxluoXkHbGEeYxDSN36jXc8OJBWNXbg8zlwJswDIcnf1UNd6u3rq/hvlJhEw3dQ3pDaYS7rAODoshQ7ph+QaOINKMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741703567; c=relaxed/simple;
	bh=Zr6WgAlS6R5yGOn9CKEM1IoFRIXy8zA6M9eSlXDYnpU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u2Q9pWYTj+1akTQD7Tnwxp6NGChpR+b/jIkDZDYDkMx9n63rZdm44zEfhAzcDUgFM6bNsey889QW484qDeCbFIqOjGDFFBdv7VFwFv7N3b51i2U/rFd3lJp82WCVqaJR79mlZ+PcJ2YP6uGa5XWmibXqrv+61aRLis3WpSQWF3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=cHY8ImlW; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30c05fd126cso27427641fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 11 Mar 2025 07:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741703564; x=1742308364; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zr6WgAlS6R5yGOn9CKEM1IoFRIXy8zA6M9eSlXDYnpU=;
        b=cHY8ImlWfn1KKucrOuLSvRQJkROEQ8NPIPwNcEOlG4K9VBdUNsngaABubLvMZqF/mc
         smgDyFfmtOY3pWTyN1HaRjGcRXmd/eP8M4tx6fg6TRQGoCsGc5frhYajUKvE4imld3SX
         l1ppS/GScSELEbXWsXZddIDnIjpVJzKE2r9sHIWtmkurLp+FFT/IiflU8BJIL9oLHib3
         tay/C3oQYtgNt7+zK3OKT+zxcH2HDJ5hs+RqPLvfKaGO5LjEW8KXfPguxhzQdboAMxbi
         geRcWm93C3WoEhfyFRK6tHsfzzeaRjcm64SGQ/fQ3BoOonWFX/K8rm+mXWVlqGojEWO+
         2J0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741703564; x=1742308364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zr6WgAlS6R5yGOn9CKEM1IoFRIXy8zA6M9eSlXDYnpU=;
        b=t8+yK87SfSj3wjP9y5o3BcYskUHFcqM21u51T81fgoYf5ULWkcFTPH9RpBRlEKzIeY
         XB3vB3iNDqln3yVhNvTeV64iPIbH+zLOG8LsNVuNOY8BBAodpfq7Vxh6aj5W8pYrF43o
         LqAmGhvFlUgSngxvtp9lyBLI9oX5eXps/jpkU7h0gVFSPGqhIJWCjYAq8Cv71IZSLkFQ
         Qg1KDM3yQ4+xyOQEyeWRx7KmfDTPqOLZgIc6+UqriHY2pV9ElMyOzHvaCTg3hLjE+T7O
         CWeKGMCkf61juBLO/khVDnhSlNTlYKhkmeRQoTJGPM3/vyShwWOya0Q6F+AZLrI+jlRJ
         La+Q==
X-Gm-Message-State: AOJu0YzB36thbTE5cS3/SHVxokvqXezWZqS07gxFLsT0j5Yw+zwdn3vK
	ER70qEzji4m8oVaGYO/E2EQndMkSpjq4RW7q7i8lxB+lBBYJ9o2ywOGqixdkhDdye6rm5DRtOQB
	CU/boeA4egQl3yRAXZYBB+CCCz0sNm+BX41UBWA==
X-Gm-Gg: ASbGnctnevkCU/Uydz/kdluJljAn/9FvXfGiMT3Ue22MTxgH2EnCV/WkwDWuJwM5fW2
	ktWPjHa82WeRjujkwUWE5xoXsz5YpFympNJQatFkSLxAHP9S99Jl716Mz9gqgtUBf839KvNpCq/
	3ud4R/37uWIyrR+nMQxYduU4HHw7bj0NiNxx7arqMVdBndVgSuXuSykhiB
X-Google-Smtp-Source: AGHT+IEisI8Neqlj/Ik9FhV+05dwHOtFWei1CfbzlpUHAJT3kEAwnn1YOghnbkv8ficWwHYaID9U7+mw+S4I+MdiIko=
X-Received: by 2002:a2e:8752:0:b0:30b:be53:bdd4 with SMTP id
 38308e7fff4ca-30bf452d00emr56997631fa.20.1741703563437; Tue, 11 Mar 2025
 07:32:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250311-gpiolib-line-state-raw-notifier-v2-1-138374581e1e@linaro.org>
In-Reply-To: <20250311-gpiolib-line-state-raw-notifier-v2-1-138374581e1e@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 11 Mar 2025 15:32:32 +0100
X-Gm-Features: AQ5f1JoL2IvysYQ6AfSqrcf2OfHt89YRbBogJ_WeAFJSM_ju5h8hWF3NagavEQQ
Message-ID: <CAMRc=McJPStp5UcvRN23yHWL3LHuREvOtQVe2iodeQj85KCojA@mail.gmail.com>
Subject: Re: [PATCH RFT v2] gpio: cdev: use raw notifier for line state events
To: Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, David Jander <david@protonic.nl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 11, 2025 at 3:31=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> We use a notifier to implement the mechanism of informing the user-space
> about changes in GPIO line status. We register with the notifier when
> the GPIO character device file is opened and unregister when the last
> reference to the associated file descriptor is dropped.
>
> Since commit fcc8b637c542 ("gpiolib: switch the line state notifier to
> atomic") we use the atomic notifier variant. Atomic notifiers call
> rcu_synchronize in atomic_notifier_chain_unregister() which caused a
> significant performance regression in some circumstances, observed by
> user-space when calling close() on the GPIO device file descriptor.
>
> Replace the atomic notifier with the raw variant and provide
> synchronization with a read-write spinlock.
>
> Fixes: fcc8b637c542 ("gpiolib: switch the line state notifier to atomic")
> Reported-by: David Jander <david@protonic.nl>
> Closes: https://lore.kernel.org/all/20250311110034.53959031@erd003.prtnl/
> Tested-by: David Jander <david@protonic.nl>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Ah, dang it, I didn't drop the RFT prefix from b4 config...

Bart

