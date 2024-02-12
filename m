Return-Path: <linux-gpio+bounces-3187-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 47207851032
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Feb 2024 11:00:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED5721F2137E
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Feb 2024 10:00:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 429FB17BBF;
	Mon, 12 Feb 2024 10:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OVlArfF9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554BB2837E
	for <linux-gpio@vger.kernel.org>; Mon, 12 Feb 2024 09:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707732000; cv=none; b=eJH8fpUINYtG6WX9M2nBUciUXySNyCSxfFOlGEw1OhvKQVUTstDt640xxYgGiH71J8mDRN0Kh1Z+65/ri5r8/cvkkgXtfqmRZZnwuTVZ3FuF4e13Buv3ZvH+WpOeTb9H8K3UhVwCwndaL0vM3jlhGcf84Bn97fFvlWA1dWHJjYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707732000; c=relaxed/simple;
	bh=vDtolkGdaMWAyiegRfRrHs/H2BrHfAsixEXypYInEIA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cHMGO1APBxIdjJdhO0C9vJDbkwfh5zFNDEhUVYUpzazLRiayPoAJPTY9i9GsATpa8JAB+cwa3LLtaiUxSdwDeovq12R86ee9okGuddMESF/itWi01H1xxUnBBiQ5bEK6eumbTSDEm0+Db9gb18VrGfgwcaOuGWCSdE1fVZciJ0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OVlArfF9; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dc6d9a8815fso2984780276.3
        for <linux-gpio@vger.kernel.org>; Mon, 12 Feb 2024 01:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707731997; x=1708336797; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8EUAKADpIIShD8988Fj+XlVtzUoRcV54qiXkH80IZQA=;
        b=OVlArfF9CHwHv5SJHsClLdyDfcg0xLHzPqRo6PpFxUg1EiBi1DWuo19SPZwC/XSdhJ
         Ni9Cf94/iAZtTS24RvCGgBoFVITXySBO/g/rp1ttRMGkPzRzet7omX1oygYxcbQj0uUr
         vSVQRCcnmzHf81A6vpFRd5CQDEmqX7ry0fNJx7WTzPR2iN87nXthqBHGbBlo7R2/rzO2
         SHCBhemZ+FfAHUyiZyXmvKQqo3n1w9/hJ+AJaeDUcux5Km72DBERxFgjMNtVa2Lke1wl
         Uq4PsASbfEBakMxprpB0HoazNv5GNsQMu4P2SvbMf0IOZicTFkRgZ2ghhIGUH3/0U1LF
         9LXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707731997; x=1708336797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8EUAKADpIIShD8988Fj+XlVtzUoRcV54qiXkH80IZQA=;
        b=FORS+rSSPXJUFwjqvv1EuehPtKbu3HMczfEPirQDP/c5EX7pVCqHMtTRiYEeFQ0YsS
         ksdrEJutGN/uYxImL343cFNsMCgOknh3FJlncCwjIrR15FYljRBNEQ9OZlayDw9zgilD
         hMLU06bNLKy2iUEV4rInxPwJASwFAzCIiWxwL8FMSECYCzwnqCM+Q/VENdFnBDX6o6HW
         VI1EQDdlAd6la5i0f6WqWgpGiusfYUWT5sMPaZ9BW1neYxxXQ2BTAC+Fdh4JZgswAxCp
         VS701QhLUSy/fJpLf8v4J1V8G7+h0Kssbbe8LKqbsdLDYnbdbRQBPpdIs9J0BJ981vUX
         xRYw==
X-Forwarded-Encrypted: i=1; AJvYcCV5zesQqRovfXH1vFyTkOqKJkIeX4TN9HjXyR4AlCSUZzu7d0d26Q5xIPe5Vkn5sCDmae3neDdYxJc/N6CHKmL4k4mhca/d0lvUew==
X-Gm-Message-State: AOJu0Yy1ezMSjFaoKLSIyXQDaJyLLDNH4tIkC4kjT0z6hJq1E4WvXmyv
	q8aBmv6aSd85VoAJjA8TTufPZYkvLombOwGhk4FCG8cE6Ru1HaAY0sPychqN7c/PSn4D95HHKe6
	UXMqj04+HjwmcvVAzQIunTFsNX31vonWFwqOFdeO3mQfqhnLe
X-Google-Smtp-Source: AGHT+IEkE9Hg5jeZfD1Tk+QDSD6mWDX7W383XCB8OM5NDOZ5+ZDEaDz5sVK+FINKgigTa1URH3madrlxVrJc3kmUHhc=
X-Received: by 2002:a25:2943:0:b0:dc6:d313:62dd with SMTP id
 p64-20020a252943000000b00dc6d31362ddmr5102056ybp.61.1707731997192; Mon, 12
 Feb 2024 01:59:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240208095920.8035-1-brgl@bgdev.pl> <20240208095920.8035-24-brgl@bgdev.pl>
 <20240210053730.GA187163@rigel> <CAMRc=Mcq2Obf58=iLHpm5B2_KkHCqRevFWupbBuKmNs_BV6i2g@mail.gmail.com>
 <20240212095722.GB388487@rigel>
In-Reply-To: <20240212095722.GB388487@rigel>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Mon, 12 Feb 2024 10:59:46 +0100
Message-ID: <CACMJSesy79vtjcywfZU8=irZF9DR535BjTGXahE0xzyHhC5fDg@mail.gmail.com>
Subject: Re: [PATCH v3 23/24] gpio: remove the RW semaphore from the GPIO device
To: Kent Gibson <warthog618@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linus.walleij@linaro.org>, 
	Alex Elder <elder@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	"Paul E . McKenney" <paulmck@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Wolfram Sang <wsa@the-dreams.de>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 12 Feb 2024 at 10:57, Kent Gibson <warthog618@gmail.com> wrote:
>
> On Mon, Feb 12, 2024 at 10:53:07AM +0100, Bartosz Golaszewski wrote:
> > On Sat, Feb 10, 2024 at 6:37=E2=80=AFAM Kent Gibson <warthog618@gmail.c=
om> wrote:
> > >
> > > On Thu, Feb 08, 2024 at 10:59:19AM +0100, Bartosz Golaszewski wrote:
> > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > >
> > > > With all accesses to gdev->chip being protected with SRCU, we can n=
ow
> > > > remove the RW-semaphore specific to the character device which
> > > > fullfilled the same role up to this point.
> > > >
> > >
> > > fulfilled
> > >
> > > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > > > ---
> > > >  drivers/gpio/gpiolib-cdev.c | 1 -
> > > >  drivers/gpio/gpiolib.c      | 4 ----
> > > >  drivers/gpio/gpiolib.h      | 5 -----
> > > >  3 files changed, 10 deletions(-)
> > > >
> > > > diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cde=
v.c
> > > > index ccdeed013f6b..9323b357df43 100644
> > > > --- a/drivers/gpio/gpiolib-cdev.c
> > > > +++ b/drivers/gpio/gpiolib-cdev.c
> > > > @@ -24,7 +24,6 @@
> > > >  #include <linux/pinctrl/consumer.h>
> > > >  #include <linux/poll.h>
> > > >  #include <linux/rbtree.h>
> > > > -#include <linux/rwsem.h>
> > > >  #include <linux/seq_file.h>
> > > >  #include <linux/spinlock.h>
> > > >  #include <linux/timekeeping.h>
> > >
> > > Shouldn't this be part of the rwsem -> srcu switch in the previous
> > > patch?
> > >
> >
> > That other patch was already huge. I figured this should be separate.
> >
>
> To be clear, I mean just this header removal, not the whole patch.
>
> Cheers,
> Kent.

Ah, then it makes sense indeed. I'll fix it in tree.

Bart

