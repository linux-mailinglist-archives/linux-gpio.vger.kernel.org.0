Return-Path: <linux-gpio+bounces-8877-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A174E958C11
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2024 18:18:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 14BF3B21717
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2024 16:18:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D80E4194145;
	Tue, 20 Aug 2024 16:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PSmUHbZl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1EF3F9CC;
	Tue, 20 Aug 2024 16:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724170723; cv=none; b=GPywtRBE500RLdFKQA0I9ou3Q6KxMqkO5t5FbLZYtHvXetwHiwOZTcM4KCJCHJr3AtY9Vz1TnhjXaEOgKWYdMwnP61BlVhpvSY7eMJUYZXAqecLWgCFo2Qwi2xY5iVZdJuhbtKXkAVMrNf2CuucxB2OJhNUOsq0dfNX1A5A1jJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724170723; c=relaxed/simple;
	bh=GwHcNLghiWzz7Zhh/ycQpyABHYaHtBC7z8dJ0fYp28k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WkCDzQyeNuy5Zn3sXonTtfcO20ldOZ2jUYmfPh+B5HxCuvkwRfbcHzyPkI7rLT1oOblMXZVVMfdQ0pCoOGdOHPz1YU10m6xLqamhZUSgHf/8g+8UOrzM1nio8B1O4DgKxBsnlKOcW2URH7w+YFafpe61fQ8S3WabV7nsLDxcK30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PSmUHbZl; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52f0277daa5so7283491e87.0;
        Tue, 20 Aug 2024 09:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724170720; x=1724775520; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GwHcNLghiWzz7Zhh/ycQpyABHYaHtBC7z8dJ0fYp28k=;
        b=PSmUHbZl2zNZOv+0+6i7nDhN6lPgPzTgUoNC7YoCHZUlrBfD5NlN4QsV2ZGVpmX5B1
         gtBWi59uWbuyyUod2ZtIJ9tFiZRI9WACpgFeBijOv2JxfXHIF0mZiSYGpa3PjKsBmzWw
         msyqklvI842H1pmPydGPsFHuwdS4zwy0QBcuNCSGZxy9Oq2kIUF3tY84mgl+Yw9GYj1Y
         2IEalSnr2nakzTTPynAK1tBjQrRHaUok5ZLrqHXyCuXlxheRki462hv7d2swy1kf7X2v
         Onxj7/zoi+0nJi2ODW6SFKsCU7dqIms7cpu+WFZwTGR3tR1o/evc+YOr0h11HiwnvwGL
         mxQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724170720; x=1724775520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GwHcNLghiWzz7Zhh/ycQpyABHYaHtBC7z8dJ0fYp28k=;
        b=Zty89iepT4ma+vTbghTbt9pmx5vfRCDn89taio1LuxqoAwWW+mKrHr32Y6TW/Mi+oy
         biQaVKlmyYyCZYYr3fgS1qZCfZmT24xUz0ymEl3gsNALhvxlOAUgbyx2Fr+BbamXd4O7
         jeeEPGTe492S0sIId0KhAZrdshAX4ttOdr3lkF9qJKGhdOvmxRnMcA9Q1HqlKzDdR1FR
         YbkPHViLtSe3IVVWC3qCVhEAF9eKdhHnNCvzLWSEfxIZlR/MI+pw8NUs4pbKx254ae4h
         tH6Y+Xyq3CVKlsetUAzY3/jzR8T7Ln0004yZhj3pglsjOxUF3nARKs7sItlPTjEV4+zs
         BkOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMu9hAKmic8IW9bfTGJ/TNeuWApOv3LZsixZsKaWE2pFfwcqz1bwh9oytuzEbawjHgIcbsZU6hRx5T0Jp14rRrrAAZDTZoxhSrCaIvz85i1fjcEZGg55gCIW6NJTA5J1zI7nk98G8Qfw==
X-Gm-Message-State: AOJu0YwluJqjpPiXK+QCp0ArHUvZ0fOSo/n1yf74CGkN3VEYZc0gys2Y
	DdexDgnL4WnA3oq2MiqPYWbfonXYrPXMcv+iNvCUuvyMtT/MgMyNnWEzHC3iXMi15yvx1Qv7psJ
	zk6bv/ciRTifNbEGi+FteiUDRXdE=
X-Google-Smtp-Source: AGHT+IF+6LtMSMWEY/Ao8mJroKKMrDoN7E0WZ1Mj++6KXYuF7ZJYgX5umtjKZYajSeJthmvQrhBhSTsl/XYG8AJ5XL8=
X-Received: by 2002:a05:6512:2386:b0:533:97b:e272 with SMTP id
 2adb3069b0e04-5331c6dc80bmr11274705e87.41.1724170719833; Tue, 20 Aug 2024
 09:18:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240521152602.1097764-1-patrick.rudolph@9elements.com>
 <20240521152602.1097764-2-patrick.rudolph@9elements.com> <ZrYH8QlXH5Gfvnz_@black.fi.intel.com>
 <CALNFmy38aq915Oj7x4q27OWbiympDU=Vjo=7anTYx7w3E=F2UA@mail.gmail.com>
In-Reply-To: <CALNFmy38aq915Oj7x4q27OWbiympDU=Vjo=7anTYx7w3E=F2UA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 20 Aug 2024 19:18:03 +0300
Message-ID: <CAHp75VeHO-=fs232ZRyTsnmTyZsigwmTihKRUGLtX4mdBxPgaQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: cy8c95x0: Use regmap ranges
To: Patrick Rudolph <patrick.rudolph@9elements.com>, Andy Shevchenko <andy@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, naresh.solanki@9elements.com, 
	broonie@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 20, 2024 at 11:30=E2=80=AFAM Patrick Rudolph
<patrick.rudolph@9elements.com> wrote:
> On Fri, Aug 9, 2024 at 2:13=E2=80=AFPM Andy Shevchenko <andy@black.fi.int=
el.com> wrote:
> > On Tue, May 21, 2024 at 05:25:58PM +0200, Patrick Rudolph wrote:

...

> > Besides above, why virtual start is not well aligned? I would expect no=
t
> > 0x31, but 0x40 or alike. It might explain some bugs with cache you have
> > seen.
> >
> I didn't find any rules on this, so I used the next free index.

I don't know either if any exists, but here is just my common sense.
When we have the offsets being aligned it's much easier to decypher and,
depending on implementation, may be more robust (in case there is some
bit arithmetics is being used, I hope not though). That's why the 0x40
or any aligned offset seems natural choice to me.

> > P.S. It might still be bugs in regmap core, if it is the case, they
> > need to be addressed.

--=20
With Best Regards,
Andy Shevchenko

