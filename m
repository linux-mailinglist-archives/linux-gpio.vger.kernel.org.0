Return-Path: <linux-gpio+bounces-5048-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C131896DB5
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Apr 2024 13:09:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 337F11C258B9
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Apr 2024 11:09:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E4161411ED;
	Wed,  3 Apr 2024 11:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LpGzvPrl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D8F6E2BE
	for <linux-gpio@vger.kernel.org>; Wed,  3 Apr 2024 11:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712142567; cv=none; b=bfi28GfyUSIf1Dvm7hrvyz/hrbYfGCbJvn8qchISLF3prikZI1OS1nPIcXOtSHt26WSfcGQZu49qTg1/CkQ6fSzW55m9T1eGrbNEVVf3nKFVBQBtwimF3ub0/rJxT6XRLtx1zg0yUVXjiP7MBBKTroE9Z3goE68l3oONXIT+cHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712142567; c=relaxed/simple;
	bh=vMMeEdF7q5Dslk3ESkUVY4C2xbbVVOS/LDLiQqYUrzE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vx5eH0W6JqXw8b8YyQh/kklvxLkI+wQFf2TrerQ96+Yc7GY1lBwmT0I6zOUcJaCqHr5aFOy7dd392MosNZSs7FJqzWOxdHR3kGNVjhEJk7dSxjpQbWN7SPodcafkAlju08rkiBUqQXGmuG+qtqN32UfxlGV2874P9QY623aN7zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LpGzvPrl; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-513d717269fso7405896e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 03 Apr 2024 04:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1712142564; x=1712747364; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vMMeEdF7q5Dslk3ESkUVY4C2xbbVVOS/LDLiQqYUrzE=;
        b=LpGzvPrlS13OoUqmgHOaTiqK7sYd2b3XHXwWCIjK44+dTBhv4aIRWjyw9u8RI0WW44
         hNvN2IoNtKUzMxAqrO0RjEHvZPfvLvCUb/WcK38jwV86gCY5f1ZNn2wz6jP3oaAfcOaZ
         JEM75pTC2jemuSfai9r4/mbrawNB+Ah+ntyNjtPY1m9MnZmFXoS9FQNQl28mwDVIi6yp
         BYBDa+6AhlXCLUFZJiIknKkU/Yzd19luq5LZVPG6Za02HjRQQZg8Kx9Ip78I1rZhKSeg
         5X/2a3BL+uDd+mUqNdsTW/8aNI9Gy1oqUQ85odQB9c9SEZ8gQpCRvECtdkBmi5pNyY1g
         TDYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712142564; x=1712747364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vMMeEdF7q5Dslk3ESkUVY4C2xbbVVOS/LDLiQqYUrzE=;
        b=UH5nLRjADP0zoJ97wyunHMoExvGt8iht2Xl/nnTpd13yTiRO3UyEgysz2qdMpC3ssl
         NXGSCOdLYQYJ7KixTLn27ZI5XM/V/IRF1XrqEoL8aun1B3692t8YqVIEikRuvzixVQ0L
         cZl7U6CgSjcLwtFT3MxX88UWhIb5nG72C4kugD9Emt+n4fyIByYeNZUei4m1i6Cu8z+L
         cUdg3DCAkqKr4WlJKHSRBZpe1iUUGGuAoBjnoY1jAEZbILJdiXr1ylgpqUYy/wW8DsdC
         lZGCf5CzQ1XaIQMkKKxW8pOoFo2nq6w9A3zTfNrpAYBlGFuKjeaiT5Xwy4MmLmxFI4ki
         wzuA==
X-Gm-Message-State: AOJu0YzilAgXYAgIhZnf4o2MIkmymnvnYt0ruJrMadwYlyWjeDlJgkg9
	u4ubyXWvTaCcu8zLpkBABWoeZUh/UdWYGKrKUb49QI90Cew24wP+gB9zU9a27i8HX2J6Xd6Z0We
	zr+EIoj1YajFKNVCVdgJxX34bYWeUu7gd6TrtAA==
X-Google-Smtp-Source: AGHT+IE+KSmXFhVMcyJZLEkbye0ZYJjFaJcaj51lNhC7WdFyAu+ZtqEyfZmnsslyKb2iSISSTnL1654PSvzdq5Z6Gns=
X-Received: by 2002:ac2:41c8:0:b0:515:95cd:6802 with SMTP id
 d8-20020ac241c8000000b0051595cd6802mr9184531lfi.64.1712142564017; Wed, 03 Apr
 2024 04:09:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240307135109.3778316-1-andriy.shevchenko@linux.intel.com> <ZgxRzyQGeSAl4MzX@smile.fi.intel.com>
In-Reply-To: <ZgxRzyQGeSAl4MzX@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 3 Apr 2024 13:09:13 +0200
Message-ID: <CAMRc=Md_81qY02=XPmQA5_EWRC1eU0zYAjRwjbAGxvGg2kOL+A@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] gpiolib: Get rid of gpio_free_array()/gpio_request_array()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Linus Walleij <linus.walleij@linaro.org>, Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>, 
	Yanteng Si <siyanteng@loongson.cn>, Hu Haowen <2023002089@link.tyut.edu.cn>, 
	Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Russell King <linux@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 2, 2024 at 8:43=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Mar 07, 2024 at 03:49:02PM +0200, Andy Shevchenko wrote:
> > There are only two users left of the gpio_free_array()/gpio_request_arr=
ay().
> > Convert them to very basic legacy APIs (it requires much less work for
> > now) and drop no more used gpio_free_array()/gpio_request_array().
>
> Any comments on this? We really want to get rid of the legacy APIs.
>

I applied the patches, they only touch the GPIO part in legacy
platform code. It's not very controversial IMO.

Bart

