Return-Path: <linux-gpio+bounces-799-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 582927FF8C2
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Nov 2023 18:48:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8897D1C21196
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Nov 2023 17:48:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86B71584CD;
	Thu, 30 Nov 2023 17:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="a23VC6LJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com [IPv6:2607:f8b0:4864:20::935])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B56EB10F0
	for <linux-gpio@vger.kernel.org>; Thu, 30 Nov 2023 09:48:17 -0800 (PST)
Received: by mail-ua1-x935.google.com with SMTP id a1e0cc1a2514c-7ba9bd62fdfso357163241.3
        for <linux-gpio@vger.kernel.org>; Thu, 30 Nov 2023 09:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701366497; x=1701971297; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oAqtBHG2ahPg5et0K/yKBX8zslm3S7ar5aqhS7JNnys=;
        b=a23VC6LJ7xky3km6XILT2ffBS39z2zuT6/FPuDsKKLKvNsbABtyNHQZ57RfCOZGadd
         v+vjLsALhcK99PuKkRnwPxmsE2YRqYLo/Zx607Rs+wO9U0GN4cHZwtY2KOcuGszSzaXC
         PqII604hCcXRKZ2KEVc7YvZv0av8mQvphK5VJvt6b/iYapg/Q0R35mCHv6bsGhxMoDyl
         NGCJxBBKF1pxgnTlNLGtG3lZsIMR9+tCIBW+8D1tOKBGYUaUDI65B7R3yuLtHJUNWcHM
         WYfUBhrqLRRjxVuTp6qvwzmKfy0bByWofl7ORdk5e/Anv7G42ft1IrrUw0SqzzZURJzJ
         8WuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701366497; x=1701971297;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oAqtBHG2ahPg5et0K/yKBX8zslm3S7ar5aqhS7JNnys=;
        b=b82RdJl9ee81DmPJg2y2CY9WJhsrtofBuvA3DB6on1PWJ1mfAA6zJvsbIptNxV9cGd
         p7/yZf8MsY6eyWua3wBB7KWtsKFBo1G0Rwbh0VL/YH6ZAE16goy/vMRdzooHxcJITzqh
         GxogqKh+u2nMf8CsYPamW9exCX2Hw57/tfw6PuL0GEnB4eudfgQpK9MjT7RwF9inMl7P
         O+hweYaYwD7LTUYF3jtqitnpix84iXz0ww/JXKeBgp96VLktvoKQGGoTdiVlFYjK9gsV
         rs2CFtXuhzcF3V5Mn4cAhgcWVvDXALrxOQgw5P4l71VHfsT+NgEzcDEi+Q70kraVYF7x
         WBcA==
X-Gm-Message-State: AOJu0YyPXPUhMdR/iiSY4ZRMCmBomTlLO2QbeyAgc+uT7wWzQ+Kg+faC
	+l3c0LQkCiY8J4VRV6KiDy237I1t2H1qBKbeekEiOn+zH2gvFau+NaM=
X-Google-Smtp-Source: AGHT+IF2+CmHFYiITNPkWwNX+XZDajoQkvaNMM0+I3x0956b2qIpjPDXTvMJ9Il6fvgxD0jQwOlna5HS4Im1nwmUfOM=
X-Received: by 2002:ac5:c301:0:b0:49a:a773:fe80 with SMTP id
 j1-20020ac5c301000000b0049aa773fe80mr20894517vkk.2.1701366496935; Thu, 30 Nov
 2023 09:48:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231130134630.18198-1-brgl@bgdev.pl> <20231130134630.18198-2-brgl@bgdev.pl>
 <ZWi34tkzNsvkCQqi@smile.fi.intel.com>
In-Reply-To: <ZWi34tkzNsvkCQqi@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 30 Nov 2023 18:48:06 +0100
Message-ID: <CAMRc=McLyT9h=VGPwserUgwmXOtNx4k2Za7j8VEwAqu7ChXZzQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] gpiolib: provide gpiochip_dup_line_label()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2023 at 5:27=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Nov 30, 2023 at 02:46:21PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > gpiochip_is_requested() not only has a misleading name but it returns
> > a pointer to a string that is freed when the descriptor is released.
> >
> > Provide a new helper meant to replace it, which returns a copy of the
> > label string instead.
>
> ...
>
> > + * Must not be called from atomic context.
>
> Put the respective lockdep annotation.
>
> ...
>
> > +     char *cpy;
>
> So, why not naming it fully, i.e. "copy"?
>

Ekhm... let me quote the BigPinguin :)

--

C is a Spartan language, and your naming conventions should follow suit.
Unlike Modula-2 and Pascal programmers, C programmers do not use cute
names like ThisVariableIsATemporaryCounter. A C programmer would call that
variable ``tmp``, which is much easier to write, and not the least more
difficult to understand.

--

Bart

> --
> With Best Regards,
> Andy Shevchenko
>
>

