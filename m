Return-Path: <linux-gpio+bounces-1765-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 707A181B25B
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Dec 2023 10:31:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D6E828882F
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Dec 2023 09:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 293844C637;
	Thu, 21 Dec 2023 09:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xVuVli6c"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F764CDF0
	for <linux-gpio@vger.kernel.org>; Thu, 21 Dec 2023 09:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4669068a20bso94533137.1
        for <linux-gpio@vger.kernel.org>; Thu, 21 Dec 2023 01:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1703150774; x=1703755574; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gk+0buIHnn5B1pDfrVBgAlFPQ+p7oDkf5Qf9+5+b3Xs=;
        b=xVuVli6cVwjdD59LyTzVCoC1pYuQ6CL+1o+SD7udSoJvwfAShNtw1p5u22AGkhZRN1
         Bryhz/hpW7q9BMNccSRummkrSxKaPPMvmsuFqamCzJBgE3+SLAbd57P6eF9iPXRXq4we
         NNLIN2cGVwFx452zs2xzMST/Dxt+cdSS3Ns4fyopeSQpLb8ZOpBsoYoZnGUswWwZpq71
         k2Nw9LQ/46AWgULMPFhhUtiNefOBa6dwGphWGMVLdPg5ldZaALHVYWwJTQDEIrSQwPcd
         v3lFAYzOdnyKTxg9ZN7um2iec0TQlqHvtFlsbaMAFijzjZuPZJjyz28uvjR8mQfnFdpS
         wsSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703150774; x=1703755574;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gk+0buIHnn5B1pDfrVBgAlFPQ+p7oDkf5Qf9+5+b3Xs=;
        b=RjYGb3lP7GhPTcjHzfddAY3/HM8q1dArfDAxyaTUtACPAp5VVGygyom1f+HK5mSOOs
         GhW2RqotXBo6nJZS0cxlPo01mLUFh7cDOy45JahJTsb8N5OeDAI9kb7gbBmwKBiyTd4v
         uV7df79zPuyQvgeBB5+41dsO58Bz5gEOlnJyorzPC+vKi1JqyoTUPd7Sxlt+H8hx/F9g
         R1kOCmDHE6F5q1UCehZZygNIToHhB2bPZ71yNeVLe4umC8VzHJ1nSZjAn06syrKk61XX
         QrXAfnQGwqURDpOBmk66sCBqAu1/knPRjvtInLyWPygIoKU1Av0pzs+D5RmxW3VbjRt8
         nv6A==
X-Gm-Message-State: AOJu0Yy5569AYF/go3kBEDpMIV8xY14mUpQpLDRwUcD312b1JGDZ3bBP
	BphJvr1qYjMOIQVJJBMSho7xeKRV0OwSqYOp+Q/dPA==
X-Google-Smtp-Source: AGHT+IGTihQckbMQHTNC3UcJXcLAVe6JnYF0NAspcuEnOya+pEHOGU76yy8KCiIq9oaidV2vNVq4Amrg23Je7L8rcC4=
X-Received: by 2002:a05:6102:3712:b0:466:8743:5ed5 with SMTP id
 s18-20020a056102371200b0046687435ed5mr802212vst.53.1703150774506; Thu, 21 Dec
 2023 01:26:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231219201102.41639-1-brgl@bgdev.pl> <ZYL0MWAQ-frYLnZq@smile.fi.intel.com>
 <CACRpkdZB-5DN5NYJNGheDJnNWRt8x4LwgOQpL4NDyX2JSn+_9g@mail.gmail.com>
In-Reply-To: <CACRpkdZB-5DN5NYJNGheDJnNWRt8x4LwgOQpL4NDyX2JSn+_9g@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 21 Dec 2023 10:26:03 +0100
Message-ID: <CAMRc=MfLXxfzhKDc9e3jRF9mdVo=9UnC9O+i9s-uGm2pEa7vMg@mail.gmail.com>
Subject: Re: [RFC PATCH] gpiolib: remove extra_checks
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Kent Gibson <warthog618@gmail.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 20, 2023 at 4:28=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Wed, Dec 20, 2023 at 3:03=E2=80=AFPM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Tue, Dec 19, 2023 at 09:11:02PM +0100, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > extra_checks is only used in a few places. It also depends on
> >
> > > a non-standard DEBUG define one needs to add to the source file.
> >
> > Huh?!
> >
> > What then CONFIG_DEBUG_GPIO is about?
>
> Yeah that is some helper DBrownell added because like me he could
> never figure out how to pass -DDEBUG to a single file on the command
> line and besides gpiolib is several files. I added the same to pinctrl
> to get core debug messages.
>
> I guess Bartosz means extra_checks is =3D=3D a non-standard DEBUG
> define.
>
> Yours,
> Linus Walleij

I think this patch is still correct. Defining DEBUG makes sense to
enable dev_dbg() messages. CONFIG_DEBUG_GPIO is used by one driver to
enable code that can lead to undefined behavior (should it maybe be
#if 0?). So the Makefile bit and the Kconfig option can stay but I'd
love to see extra_checks gone.

Bart

