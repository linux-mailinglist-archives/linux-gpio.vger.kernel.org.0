Return-Path: <linux-gpio+bounces-2846-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C14E8448F9
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 21:34:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F2761C22CE6
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 20:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F23820DE0;
	Wed, 31 Jan 2024 20:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pa0c6tSJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69091BC49
	for <linux-gpio@vger.kernel.org>; Wed, 31 Jan 2024 20:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706733198; cv=none; b=pCN9C5heFlzz87GeZKzUBKXpCPgQuGjmxo1uX/S7yxPgrYw67PQUwgPL0+wO1DqJo3rC1SynKnHNpyjj9zuqs4q94YFQ+3Wmt2nbTmMTB1QcQvo8vboNOtTHDMK86yp8jU905EIkrpRI7LROIIlA8o2OMsERDE8n0HM2Itvb7A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706733198; c=relaxed/simple;
	bh=PEG4Ld+AtGTNTLFPgHDAafBKQu5vURreqFDAZXVNuHQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Eb/298GMCG6fSCdqvJgOz0srkmbgqYl/T+pks49r4QhAy4pbgdX7AHXvxD9+/0lNbVaG1V9d8koHXjnrcb1N+ETG4lUPB+KhWZ7dSAZ0IgrqfjDxLVNtbMCPGLYF475X8ouVLKTvgyz/iDn5aZQRvh2goxqifd4TAED+T3IHIbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pa0c6tSJ; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-604123a7499so2005227b3.3
        for <linux-gpio@vger.kernel.org>; Wed, 31 Jan 2024 12:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706733196; x=1707337996; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PEG4Ld+AtGTNTLFPgHDAafBKQu5vURreqFDAZXVNuHQ=;
        b=pa0c6tSJ4syUsTfhN4y1XHX9Oj3flkFRKdyaQUUJp1yqBpZrRKxUIRXZewlXoE1S7X
         wnVyB/f4dv77swiirbVUz49r1U/0x7UFPhzLtxXvOSiorcDVkEpQblqdmeAq75BJ0u9f
         EuRxQqxa331tLX1vyQrm/5SrPDJW5d20OIhmHrM0pVlUs4E3yr/vuyDtbrXxBBgl8f0f
         wRsfKVe7o1Qw3HXq6kxx5uW7HPACokwxGAoI5qr2ONwHWqwjgDwXZ6W2ofUxkBw68C8L
         zDpxagcyjwZqjRazLB+rH/sk1wFYhCeMz3qLNj4hM2NMZUwy7QSsK5S4/lz/WUhYyeAv
         31oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706733196; x=1707337996;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PEG4Ld+AtGTNTLFPgHDAafBKQu5vURreqFDAZXVNuHQ=;
        b=C5G/gLd1qDnMspGm5Zss9/yrIINBk4rqsVjKQvnQmabJLd8xwjyOs+fx72m5+gQVFx
         DaTYec8BQqo6VjSShTwJ/cwNme6K4E+e1Q9uR8Pedpq3sxFnUfpzU7raWA16ZYXCcKFS
         jJRDYx9wN085Lcx/8fqtC/MMxxcSapNCg/Dxet/w56aib6YqwlMisZ0rtfFfNIYIcKHA
         u6xCdn1Fcb3bI1Kl0fmV1TLNanziEAAQIu/6dbCI/8vs+zdq+VvjU4elbuxeC5kTii7f
         Sci/R9Yy4/lDVa1aVv5u+Ms6fxC5lGIsMxrNNGtQ4q9tQSa8BPFRggZv79ltm1CUGQkv
         pcYw==
X-Gm-Message-State: AOJu0YxQhJyJCX/Y1xZEr1dl+gug1lRRy2f8HtLVWlAucfxcgTHYvEwj
	RdZz7NeJV7X5iaod3Z3onPdlXGs8LwOl2xCChSJ9ZDBLqjXt1HvcawE8VkwDQDxwUrlbUSpl2WO
	YomB+IY6CQC+d0JpnhgrLH/LZHhRyEKb9NhKpFw==
X-Google-Smtp-Source: AGHT+IHmrB6n5qB/8tuWJSSAuPQDzn8oyTpnFyIj3OifGmba9y9gO2ZsN5mXO42A5fRLIu0WjZDX+p6fjadkX21U6Mo=
X-Received: by 2002:a81:5248:0:b0:604:bf2:ad78 with SMTP id
 g69-20020a815248000000b006040bf2ad78mr2832729ywb.20.1706733195800; Wed, 31
 Jan 2024 12:33:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240130124828.14678-1-brgl@bgdev.pl> <20240130124828.14678-4-brgl@bgdev.pl>
 <CACRpkdY_9=2Uqo9=ZEDrn+RFGdPkq73ZRYLVCbh6BLMzU9LZ_A@mail.gmail.com> <CAMRc=Mdh5f_hrAh8BO4P9s0o_t9cT8FdfiY24-PQnPVz7QRZFA@mail.gmail.com>
In-Reply-To: <CAMRc=Mdh5f_hrAh8BO4P9s0o_t9cT8FdfiY24-PQnPVz7QRZFA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 31 Jan 2024 21:33:05 +0100
Message-ID: <CACRpkdYkFwU3xPX1J1H-eJqaQ8thPSbXGvyBHW5iwL-SraPMjg@mail.gmail.com>
Subject: Re: [PATCH 03/22] gpio: remove unused logging helpers
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kent Gibson <warthog618@gmail.com>, Alex Elder <elder@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, "Paul E . McKenney" <paulmck@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Wolfram Sang <wsa@the-dreams.de>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 31, 2024 at 7:08=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
> On Wed, Jan 31, 2024 at 6:39=E2=80=AFPM Linus Walleij <linus.walleij@lina=
ro.org> wrote:
> > On Tue, Jan 30, 2024 at 1:48=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev=
.pl> wrote:
> >
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > The general rule of the kernel is to not provide symbols that have no
> > > users upstream. Let's remove logging helpers that are not used anywhe=
re.
> > >
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Seems unrelated to the rest of the patches but OK.
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> >
> > Yours,
> > Linus Walleij
>
> It's kind of related because I'm later modifying the logging helpers
> so I'm saving myself some work.

Yeah I realized that later. Maybe add to the commit message?
No big deal anyway.

Yours,
Linus Walleij

