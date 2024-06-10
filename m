Return-Path: <linux-gpio+bounces-7323-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F23309025D9
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2024 17:42:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8A120B28482
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2024 15:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6D5D137747;
	Mon, 10 Jun 2024 15:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bGdcck0n"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1852A953
	for <linux-gpio@vger.kernel.org>; Mon, 10 Jun 2024 15:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718033519; cv=none; b=bG0Geb3pz80bn3kO2l7TBRUiq9SqPIr6+vL9OYC8bji+jLUf6i7riEUb5iNK+ZCRdMkdRylJ/7wHH0vuW1+hoh/KtnMNmHxZeAgCvoFx0rTdXQ/mfpeWRIboWWFqYXqAZLOpvdvCxHcXhcRQNLmRoqV8g+RIZt8Th6iXIL97pbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718033519; c=relaxed/simple;
	bh=LH7CkPUe4TLzm+MhcEbpCny1djMnHoviw+ltVt8clu8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m0PZKmaSyKdlj2D3YM+Mp39/2eyutYC9jppGbd4Ua3zD/xytEBcJGgqRlLtRWjr/iSh+jB4KCxAAku1fIU/ztjS2q94x+fR1tnsNYxd0pLtafKbJre0BGWC6oaDJB6GMifRdU+7JAgh1XiAPPwamaCzQBIgfLvgu9mkduHtEq1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bGdcck0n; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ebed33cb67so837821fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 10 Jun 2024 08:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718033516; x=1718638316; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LH7CkPUe4TLzm+MhcEbpCny1djMnHoviw+ltVt8clu8=;
        b=bGdcck0nAt6IY26I8MRj1EkT2CnWtAg7Gn2bvgK6O84/rJoCQHzGcyouH3RNKs2MPZ
         9EmB5ETO6wUYggZTGZ/gQQJMIJdsPpf0127mntGRBmbQtvXbCl4hqUOiWSN0TpNBrzVt
         zv0aRYZm+ef18a4Ri5Xu+juyiLIYC4oaoFsQV7dYgNvixFCsMpmItBwaQV3g3Ewf/+lS
         MESwLOpXgsNUVzaW/u7LwI9+0GyUpQrUwIhxuRGPiViZ8XEw8yy1ZlnvNWb0xrnPL9EA
         KLGOHyQdKRtDWMBTwW7Awjnj29IWAH1zYes3gELpvfALc4+X0FPvjx7wOJHAURxeMVIC
         KFCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718033516; x=1718638316;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LH7CkPUe4TLzm+MhcEbpCny1djMnHoviw+ltVt8clu8=;
        b=rAU5xPDjB8KPns863VlnB3mUR5MLr0gNEvc56NiSagf0hqC58KbQTOJZhhSWPFekpF
         ZRqtIA5ELibDwizxVv43C3jF3wI6ZD6JWvkMOuHq7XR1DdKhqK57xZciMarty1tzw3c2
         +UYnuwGg+XmO6ATpioMEjEfk16mdlMjGGXxBbci+su/DF5zEL+ubAOiQvSDWYUXl8Snb
         Ke7KdlGM1NFEN7qTlMdDP3hsiUfDVjdYbdPV+yIYBQyk4f+KfSR/HJwXlKJ1o6p5Qhjk
         1K+x+bNx9VuBp5irnzTL2uxbc7AOCktRdPQJnJUh9hMDv1EYHbVksmGI1osLMJzVHDWP
         yXrA==
X-Forwarded-Encrypted: i=1; AJvYcCXtd/Mk2xMAbkum7uq1ixdsHNbCr5WKJL255yCgwmZXnkAIjBfsWd889cOn9KpYKUVHwI0yK1LyaRS9cgx59miDQ1cmBj2Yn/h1Yw==
X-Gm-Message-State: AOJu0Yy0C17lkOP/5D4KJOJG1b+2UzisDIJZ3xfIPc0k3NloqNOLj3rf
	SEYATqcBHpT4Xgugog3rTu3qXO/wdB7kCHOVu0mFga/zLRpUR9RRqKJVPveV3VaihnYeKhuzNn2
	4rijHlblllNnvu5jdBcrL/5QqO11DvXoITgrcvA==
X-Google-Smtp-Source: AGHT+IHt56foHYbztiRQh26pF9sjT2Cdgbl29gsKoWGNRwhvCdGzRV/upJZIYfjgtzdkT1n5RncPmsnKstFG+L6O74g=
X-Received: by 2002:a2e:98d9:0:b0:2eb:e8ab:7d40 with SMTP id
 38308e7fff4ca-2ebe8ab7d96mr15522031fa.44.1718033515892; Mon, 10 Jun 2024
 08:31:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240610140548.35358-1-brgl@bgdev.pl> <20240610140548.35358-4-brgl@bgdev.pl>
 <CAHp75VczROHVKwAi8j4fxR=L3oKJ_5om6rEAriDNFxh1dMRxRw@mail.gmail.com>
In-Reply-To: <CAHp75VczROHVKwAi8j4fxR=L3oKJ_5om6rEAriDNFxh1dMRxRw@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 10 Jun 2024 17:31:44 +0200
Message-ID: <CAMRc=Mc593Zgt-jkx7T_D4s2gAFeccA9SdguM4vtFc9H701bUQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] gpio: sim: use devm_mutex_init()
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 10 Jun 2024 at 17:24, Andy Shevchenko <andy.shevchenko@gmail.com> w=
rote:
>
> On Mon, Jun 10, 2024 at 5:05=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
> >
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Drop the hand-coded devres action callback for destroying the mutex in
> > favor of devm_mutex_init().
>
> All three LGTM,

Can you leave your tags under the cover letter in such cases? This
will make b4 pick it up for all patches automatically.

Thanks,
Bart

> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Thanks!
>

