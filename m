Return-Path: <linux-gpio+bounces-1956-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDE3821D6C
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jan 2024 15:09:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 24BBDB20C22
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jan 2024 14:09:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 874AE101CF;
	Tue,  2 Jan 2024 14:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="D94G3bI0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1578110942
	for <linux-gpio@vger.kernel.org>; Tue,  2 Jan 2024 14:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-4b739b29686so3541772e0c.0
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jan 2024 06:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1704204533; x=1704809333; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v3/TcTf59yCKlhBwfePED33XQK1u2+3OwuC0dhtXFfo=;
        b=D94G3bI09QnqJEZ7p5y1rRpuV47Sdxq0pPpKghJ+y3JHyN5qi4ioPzvt637CZ7K0kv
         Y1wc1Uc1Ov5qQuAM+mT5L7UTj1r7tA9MCwYF6RKOY7vqFkJgNd4oEKnI1AfgDTO49j8G
         AXjtYRYGHNmogLGyHJa5S4teRae2DPOK3YMAAlANvS3inGi0asfVJWsy4nQTMoEKc7DH
         1AoKC5BM7HMr4nd79UVZ31P/Vofnov/DnDhxqzYK8CbjdhsNyDOiiVVAk7s2AGCPr8DA
         i3YNZBv+OCMej1dZbmbm6O+9aMGbKo/BYjQn4A2KUPGPnhUHEg9smovBvz0yjwuhXLE0
         iJNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704204533; x=1704809333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v3/TcTf59yCKlhBwfePED33XQK1u2+3OwuC0dhtXFfo=;
        b=GoFPxbr9/MhP3lriKU8m5/R8j97rNRZfSTA2VLTJaivVhixF/wO9YpIt+KUWBnO26g
         gy+Oez2CTn0PtQXgvwj8SKxkzntrlxw4czu1BusLd2pGGSQqCi8w7mxoOWlXO4/ZV9xr
         ibH7VTx6gVVknJL80bJr0ImiKDs3DItey7ZdgaEznVkqoJCApyoaLlyHc3Ja7ZUODNYH
         BBUEn33VP0eAgng0MLHPWG7ZOP0xHHRyazkKDRld3qknsF8xS1d5XHrS+bvQ5U98dkD9
         eO7wvohc6YlGlyJVcf54vDtL6YG1ey8G8Pm6Zl8E1K+yPTHxWxAmkLpgZYG0ckq92myV
         qsRA==
X-Gm-Message-State: AOJu0YwlV/lxh/XtF7wpg/mSpoVstveMYOHbceSfd9J9NE+vm35fclh1
	H5+We0vz/vMGnBcEll+OzPF29v4ZKuJmX6cdpbEwQGScSnRqCQ==
X-Google-Smtp-Source: AGHT+IHr0aaCvuOS99dA2QaIGd+irGhNDMMqYcMP9p9RsbJNXAgZi0RO/+5dHJwDvkIy9Sy7O7AdSyAopQQ8vizPvus=
X-Received: by 2002:a05:6122:3681:b0:4b7:2c26:4de2 with SMTP id
 ec1-20020a056122368100b004b72c264de2mr7940375vkb.10.1704204532938; Tue, 02
 Jan 2024 06:08:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231229093328.62366-1-warthog618@gmail.com>
In-Reply-To: <20231229093328.62366-1-warthog618@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 2 Jan 2024 15:08:42 +0100
Message-ID: <CAMRc=MdPJYGY3tOLj=sL53g95UxB5nX9PYJTeonqcXEjLrHX5A@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v2 0/2] gpioset: improve help
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 29, 2023 at 10:33=E2=80=AFAM Kent Gibson <warthog618@gmail.com>=
 wrote:
>
> A couple of improvements to gpioset help.
>
> The first is another swing at improving the description of the
> behaviour when gpioset exits.
>
> The second patch better describes the zero-terminated
> sequence behaviour in the toggle option help.
>
> Cheers,
> Kent.
>
> Changes v1 -> v2:
>  - fixed the subject prefix.
>  - added patch 2.
>
> Kent Gibson (2):
>   gpioset: reword note on post-exit behaviour
>   gpioset: improve toggle option help
>
>  tools/gpioset.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>
> --
> 2.39.2
>

Ah, this is the v2 for the gpioset patch. I applied these two instead.

Bart

