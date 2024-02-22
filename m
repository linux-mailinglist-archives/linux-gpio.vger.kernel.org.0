Return-Path: <linux-gpio+bounces-3639-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F25A85F9CE
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Feb 2024 14:30:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1565A1F27568
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Feb 2024 13:30:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F0B750A98;
	Thu, 22 Feb 2024 13:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="OgK2Bcdk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028D512EBC0
	for <linux-gpio@vger.kernel.org>; Thu, 22 Feb 2024 13:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708608616; cv=none; b=ZTW4uOX1VJaDV8GI+ZseV8yLyRqYzbU+7jeZ2E3Up5FArXm0rQvj6qxaYvDYvzo50jSyD/LWttUms2RetQgGLo1unmGN9PLjqq5ka22d1dtYYhH1MRhXtHCSsDz+oyKJULqFWHqUK3lW45TyVOQ2F/nH/OJl4z7fLU+wJmUFdFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708608616; c=relaxed/simple;
	bh=CCCDVfjOdXJUfj4abfYUhg1XpYqlkNzhg8HjSIrRepQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ShpN+4ocJ/l8fLt8MViW8Nj9hvd2+amZmcH2oKgXr2ROvGDbDWXJEzamrhufOQb4sPXvJeUp83tthDbGuvUWSLmCtNgy4T6cmfZwyMw03TnM+J+wpWSGb/IKxPVUbQR62mH+N5Z8dZoXywQ8+THgmIn6eEoNoDDcTBdeyLjX6hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=OgK2Bcdk; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-7d5bbbe57b9so3816489241.3
        for <linux-gpio@vger.kernel.org>; Thu, 22 Feb 2024 05:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1708608614; x=1709213414; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ZS1HiPVKUfAHyltRnTHESSwTY1uCLLaR3nEKiiJ6YE=;
        b=OgK2BcdkrufgiUFsd9LZftjYuFaQHRmFuQZJc43Ymm+cukXYZooRRqf2ft9yBO9+D6
         07vxz+DR+o8N82O0UxuQJH9fnlQPGzBot+bFuGISFJmMudljmbcSSFC+PEK5G/n8DSPS
         lWMkKa5t3pdpq/5D7DF/vHPb8aBjBwkuGv6j88W8OiVMkfaSlcwULSCdYXQFmfAeAPeM
         cX5Nh4W5gkuSeZXOBbJ/ccc7VFAwQMIogOp25p8zA3Bod00I/u6kh3bJGvTJ/MlMKEzf
         Y3NX/58A4988aXB4UsapMCff5d5cTuofZMbQ8Z73dmaweyYP8mj7Dfu9ePnOOha3I+EN
         oKzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708608614; x=1709213414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ZS1HiPVKUfAHyltRnTHESSwTY1uCLLaR3nEKiiJ6YE=;
        b=qXvtPDHACIcbTRQ5r74ptfM4JdeQVa36RDXJ0U2wX3UnGVcqX0BQ9675+pOypBrLzz
         UU7+OuA2uMdbWbbUQoc6+gUNSaRdTcU+QAL5PYvJAoy1VXILYlbutPPdee9jTu0JY2vw
         USlMFYhJF5ZJrVGsckppU7Qw7wbr+okwCBd+g6Nug1uArW/kDwo9YDWh3QVlDLY2TFz3
         1SJDT3kUDpxHem9Zhv1SK5vhxEHUOrGWgw20iTUyjQ7uOAUc7mopyMgHjU3SYMGtBXz1
         nbC7fwrp1yRWIv8uicLtTieNpL97+cK6j02PAGnM4OPMadx+nSgc1xhZfXlCULL+412s
         uCaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMXOVXvzLrgTBACxWRL9YSwx96UkHOaSv4b6sxwJyB06BsOtWcIw9t85GHTS2mAWqMYRPk9FiW3Rfwt390GUNxLJZwrUFGZsRVlQ==
X-Gm-Message-State: AOJu0Yz/5TpRvv1y0C6GgbNYpRRAskpD5AjXXBxM4DP0n63fe+qOHAUw
	OaDeKSwCgKIdcaoT+DNaszcMhjTF41ldMaVXS9/h3WhyBJNf0SIeKZFXb0oN7PrYbV7PGCkfa3+
	Uy/0sbE064+zJZnUbTUZ9fzCwe5OYev4wpudOH24vqZSY/pwP
X-Google-Smtp-Source: AGHT+IGTU97g9Jf/2v5+mWOkYTyqn/V5nIeZiiSxBuquPKjPl5Vuf6KJd3ahpcqNQG6gAH6OfM2TM3ziLHElX2nKI/U=
X-Received: by 2002:a05:6102:cd:b0:46d:7523:1fe with SMTP id
 u13-20020a05610200cd00b0046d752301femr10082224vsp.30.1708608614014; Thu, 22
 Feb 2024 05:30:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240221193647.13777-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=McECxKW+uS7fQyGtYVfcSZQaAJZFi+s+wNMoRiHxef0zw@mail.gmail.com> <ZddL7L24RXoqR7sN@smile.fi.intel.com>
In-Reply-To: <ZddL7L24RXoqR7sN@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 22 Feb 2024 14:30:03 +0100
Message-ID: <CAMRc=Md6d19hhySFti+vSLV9pfyzuHNUDmHN_XYV73uCWDAY7w@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: Deduplicate cleanup for-loop in gpiochip_add_data_with_key()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 22, 2024 at 2:28=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Feb 22, 2024 at 10:48:00AM +0100, Bartosz Golaszewski wrote:
> > On Wed, Feb 21, 2024 at 8:36=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > There is no need to repeat for-loop twice in the error path in
> > > gpiochip_add_data_with_key(). Deduplicate it. While at it,
> > > rename loop variable to be more specific and avoid ambguity.
> > >
> > > It also properly unwinds the SRCU, i.e. in reversed order of allocati=
ng.
>
> ...
>
> > This doesn't apply on top of gpio/for-next, I think it depends on one
> > of your earlier patches?
>
> Yes, on the fix with error path.
>
> ...
>
> > > +       while (desc_index--)
> >
> > What about gdev->descs[0]?
>
> What about it? :-)
>
> for (i =3D i - 1; i >=3D 0; i--)
> while (--i >=3D 0)
> while (i--)
>
> are all equivalents.
>
> The difference is what the value will i get _after_ the loop.

Ugh of course. But the first one is more readable given I got tricked
by variant #3 at a quick glance but the for loop says out loud what it
does.

Bart

>
> --
> With Best Regards,
> Andy Shevchenko
>
>

