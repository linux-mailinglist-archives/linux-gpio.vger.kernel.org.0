Return-Path: <linux-gpio+bounces-2838-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 499ED84489B
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 21:16:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D66CF1F23F6E
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 20:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 180CC3FB1E;
	Wed, 31 Jan 2024 20:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uFLOS68i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E10821101
	for <linux-gpio@vger.kernel.org>; Wed, 31 Jan 2024 20:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706732192; cv=none; b=aDW98mMU081Dl0y3tBdyAaixvLfJ5IBOmZTj/M4hWw1VaJwKIWfN4isk+8DeEpTMZYqkGACJb8+p4PcN71aIJJeIEh/wqz5JKjrYYoC0FZAcReQVdbTJk15FcSWOToQh3FxdbKCkOnRqGEqpfy2mwEGwX6FMB/yWfzJGh6glA+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706732192; c=relaxed/simple;
	bh=JbKC+73posjGFpYb9gcbTa9LruZ7n6Vqx9LSCaLAvaY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BWVKSwRyQEkjBxUTaaqpusA81+Y1uiTl1s9jdGGxl46Rqy6m1C0W3Q5z9eGiGxE0Or7qNiMgSk609zIjBGPbil9glZ8tz81w4+fIeaa37Hw+fL0HyQ53LpRPgxUa5ZKs7G30+7wL1taDi3AfAFJmaZHxyKx3FqoV3aBo7uWB0bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uFLOS68i; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6041779e75eso1817977b3.3
        for <linux-gpio@vger.kernel.org>; Wed, 31 Jan 2024 12:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706732190; x=1707336990; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JbKC+73posjGFpYb9gcbTa9LruZ7n6Vqx9LSCaLAvaY=;
        b=uFLOS68i/yyrVqC7VDAnP6ksgbG4HLyLifc/V0kmd2Gi4kvUcbqagat7WEUvA5eYNf
         vUE4zX93cyvIn79qtesy0ZwQ7z0N8cmuca3ucB5HFk/W7XJgBezZmI9f8Iv9QaRe3DGO
         Ir2nnCrWKhQiu9zEfXxYutSBXBH3s+MS7+Yesm/Wi+0s7w/YtAqcbnlTj5ZNapUwDJT0
         /9vj2LXQbyiLD+iS3lPP4NnVmjvPCPfxFL9Te8fcCjJ7AXDto+emsliwu9q/rmTi0UJo
         zfhXQQsR4mKj8emMjuypeyvpmxzUTyXqpKhO5kcc3r2gbuJJZ2HnbmviU5sBcHwZuTHU
         hCeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706732190; x=1707336990;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JbKC+73posjGFpYb9gcbTa9LruZ7n6Vqx9LSCaLAvaY=;
        b=JBS31uskKVb0/gUhu2eXEltihMbzZbZyzbKR+f7aLg52/vhQkL9LkNg3hBT2Bk0KOW
         ac6ywCa+lVw4+G3PO3e4yyKG3vAlTGflepF04xEWkXpv5l4kxt9JQpxU8e1WTeWVaEnR
         xlzJp3lf4W2MS4oqnsbegBPlT4N4nKLvfioWd85l/QoqrxDGpZVuoSR9YxWvGUyBW8TO
         4r413LAklEOOlDwURlTM8nctAnan00WJ2J3m/wETpQu7mu3yBajdWLJQyazJhI2XnqZ2
         LhJLaGuBrZOA4pvdMsiGa87HGvRP3oxM7GnH3BPFpmAL0TBTUr0Yc2NuxkV/G0Z7a1Nw
         SXTQ==
X-Gm-Message-State: AOJu0Yy+HrTuNf3i749sLew6GVmfnxNnNhSIxa5b7U5v5OAN8mzvk71h
	RVVKS12aIUp4EZfubfOy71gcMLJE/+UC2/xLzXa6x19p/kcGKK/xHQ8jtkjdFZp6WLfiJ5JTfgj
	NZ+AHhxOXs3M6eaLNHltPLHCrWJNc56bg1jESoA==
X-Google-Smtp-Source: AGHT+IGTOhv4lmVR+cLSWJktEaFcD/NzFyonVYAm8q2ESuuHXU+x0IeRbHQ3KE2sm5LhZkzlbQEePXGUJDnai2ccI8k=
X-Received: by 2002:a0d:d60b:0:b0:5ff:83f7:57e7 with SMTP id
 y11-20020a0dd60b000000b005ff83f757e7mr2547764ywd.31.1706732189732; Wed, 31
 Jan 2024 12:16:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240130124828.14678-1-brgl@bgdev.pl> <20240130124828.14678-17-brgl@bgdev.pl>
In-Reply-To: <20240130124828.14678-17-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 31 Jan 2024 21:16:18 +0100
Message-ID: <CACRpkdbCBe+HH5uuh94tx9ezV0xtBO-=DZp22bUBbbYuEtJ3Vw@mail.gmail.com>
Subject: Re: [PATCH 16/22] gpio: reduce the functionality of validate_desc()
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
> Checking desc->gdev->chip for NULL without holding it in place with some
> serializing mechanism is pointless. Remove this check. Also don't check
> desc->gdev for NULL as it can never happen.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

I don't know if I agree that it is pointless. It will work on any single-CP=
U
system and 99.9% of other cases.

On the other hand: what it is supposed to protect against is userspace
doing calls to a gpio_device through the character device, while the
backing struct gpio_chip is gone (e.g. a GPIO expander on USB,
and someone pulled the cable), i.e. it became NULL, and this is why the
error message says "backing device is gone".

But I want to see where the series is going, maybe you fix this
problem in the end, so I can come back and ACK this.

Yours,
Linus Walleij

