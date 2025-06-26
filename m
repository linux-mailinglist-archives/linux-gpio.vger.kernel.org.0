Return-Path: <linux-gpio+bounces-22246-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5BCAE96E9
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Jun 2025 09:37:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 479983BDD1E
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Jun 2025 07:37:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C269423B634;
	Thu, 26 Jun 2025 07:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="lImaWJrK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF9E2264B3
	for <linux-gpio@vger.kernel.org>; Thu, 26 Jun 2025 07:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750923443; cv=none; b=XARQPwPFybaUIIEJXokiokXMnhTiY5kbYzhbRevc934wJAQHwTtLV/ywxqtjtEE6fDqACk8HUQM/zS7qD9Lb+E/7NwN7cktPYvMVMP0slUaceHPzEsQ9QrLHx8VlKsqOzqXBFwGTzgSkQG/jnE8V0jvmvLUESsaZ8OkYcCFpUSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750923443; c=relaxed/simple;
	bh=QXhMV10Wz7CqqQXpjApUdNy2bQisjRPjJ/tBIS+0GIQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GwfMPIydI/tBadSx2JQxWB+TrNM8rkrHyZ9Y9sux3tw0vQT/bGPUnKtUctda+r09L/JGrn1fp5pZcvB0hpmOCzHzytAXBrGzCzaRjN0Q8t2lYBLCzOSn3mAYdEFYR8cxw7Bykmvk7Zp0jgbL72gbJT5jqAWHzeGegCQ5AH7IaCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=lImaWJrK; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5535652f42cso718190e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 26 Jun 2025 00:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750923440; x=1751528240; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U5xgDDRdnL1An5NcO2D/hjwiAvuotn8HK0mys4ZOVaY=;
        b=lImaWJrKrwv78Rbe2rYJ5FK0E9G4mJYwwZa1QWTWhdLlEIOnP9rU3KP8dtc/timITf
         tAC1uT9Y+8LWqIFKDZknRM/TUTdsbQlP8lxO05OB5O1DTD3J4PHW9WcC98FoZlij6AaU
         3WFCHv/OlzU30OqUNUi1RrRwDSOGkCT2HGKq0Ab3oSqSi6gm8wDKYd+BRjW0A6fMHLxm
         P8pgNKM8ieFOtJybuxDD2xtDBVLPvLz4tNuDX1kHvZE1vJWAYbIL6dzH7DI93tDncW7N
         QpSqlA3IWn4vjy0D0+iIi3rq1LSgCq0QuFT1dHsKQkxOXD9jUBYzqyLhMcnR2oelwvcP
         oSvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750923440; x=1751528240;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U5xgDDRdnL1An5NcO2D/hjwiAvuotn8HK0mys4ZOVaY=;
        b=ejlPhx63MM0zEHUet91Y5d/mzU68EDyNuXH352PI0BEptAK7v9SYRR28tHG5QT3zVj
         R7M4WWFWzA7WNWwBgxX5zYUzIVxhwDYIZ+LnAmVODGO6W01DyKyxl5bAwX1z0ZDifkwu
         71K0cSzd5rGgkagZbLt22Ceub+A3Xnun4A8x8+pNWuxrDvNluN+Env0IVYz+JjLDRQj4
         QN/r0d0lYby4N9lOp7QIWDkMi6/8wyeLBQYmwk5njLRYwnRjUP0sRVEK7QBrtYYZtrr9
         aqm515FUKoqTxhARgCDxO/UbbCrPqHfxgJ9HTHq6SRrfLflPdIHM0caym6BWE68th4Xp
         fmQA==
X-Forwarded-Encrypted: i=1; AJvYcCWTg4NmwKqWVUUdeDny0h2KwzL6xTegXdK2RmGmasOaUa+rW8DRIdoIns7+JjWMMrhcMHmazNrFwEx+@vger.kernel.org
X-Gm-Message-State: AOJu0YxAFcEsh+kFUpUtoZ6vTwGgpYaOVHlRqsfnax3+549jR602g1A3
	K4nuPUBC7hdsVeqVrHnJS18tRiDSKgiVExoPqVgeXZa13ydHXi6N7SkNjye4qOSyR18VpK9C0Oe
	bzbf0dLoMqgIyF/mfoeVinQcn4BDH1P6TJ8/5PBFy1Q==
X-Gm-Gg: ASbGncsbGgZohjL2O+xLKaX0K0RlfafzIfwZcSjgiGm3dgOoBdDZwQaOMkQ6SvEZw5z
	LzGDfSsxiBfPDNzK+XgTpw3vIFFrZt+R12FTQT8TDJ5qdmSiYk35cqZGhOSHs3fxHyOHGQh8nSA
	YWZzZpMJCYWxIXLEIGZi7vT+hOJTEVL9gF9GwqJdrTsIGW9cDO3F+ksE32kWoYgPTzaXt2TtoO2
	A==
X-Google-Smtp-Source: AGHT+IEnopA5Q1Izmpwb+jTucL/e8LSFIj7aeHFFtAUYPniTSHEVm5lKk5y1psWqfA3oZ97UXMJWOISXfGaVI9jovD0=
X-Received: by 2002:a05:6512:ea4:b0:553:a64a:18b0 with SMTP id
 2adb3069b0e04-554fdf63a59mr2194133e87.42.1750923439549; Thu, 26 Jun 2025
 00:37:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-input-v1-0-5875240b48d8@linaro.org>
 <CAMRc=MdAKpmVNQe=5yrGkVdmbfZ-Bsh_0p3-mrifEF2x1SVBhw@mail.gmail.com> <7pl4kxvzfo3nra5lubfb6tgmaqxex5oylw7coaadz6v7mnx6x3@cole43kvvmx5>
In-Reply-To: <7pl4kxvzfo3nra5lubfb6tgmaqxex5oylw7coaadz6v7mnx6x3@cole43kvvmx5>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 26 Jun 2025 09:37:08 +0200
X-Gm-Features: Ac12FXzsmncwi9WLdhFOoYQmmkcGONg-k8AblqHNV1hmV2Az6X0QpaHZFtAuzgw
Message-ID: <CAMRc=Me7dm7BmTSW1U758oCJ+4W4p6ixU30D5YStk3nyuu8rVw@mail.gmail.com>
Subject: Re: [PATCH RESEND 0/3] Input: convert GPIO chips to using new value setters
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Michael Hennerich <michael.hennerich@analog.com>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 26, 2025 at 7:54=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Bartosz,
>
> On Mon, Jun 23, 2025 at 09:59:07AM +0200, Bartosz Golaszewski wrote:
> > On Tue, Jun 10, 2025 at 11:40=E2=80=AFAM Bartosz Golaszewski <brgl@bgde=
v.pl> wrote:
> > >
> > > Never got any further feedback on this series last cycle. Resending f=
or
> > > v6.17.
> > >
> > > struct gpio_chip now has callbacks for setting line values that retur=
n
> > > an integer, allowing to indicate failures. We're in the process of
> > > converting all GPIO drivers to using the new API. This series convert=
s
> > > all the GPIO controllers under drivers/input/.
> > >
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > ---
> > > Bartosz Golaszewski (3):
> > >       Input: ad7879 - use new GPIO line value setter callbacks
> > >       Input: adp5588 - use new GPIO line value setter callbacks
> > >       Input: adp5589 - use new GPIO line value setter callbacks
> > >
> > >  drivers/input/keyboard/adp5588-keys.c |  9 +++++----
> > >  drivers/input/keyboard/adp5589-keys.c | 11 ++++++-----
> > >  drivers/input/touchscreen/ad7879.c    | 11 +++++++----
> > >  3 files changed, 18 insertions(+), 13 deletions(-)
> > > ---
> > > base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> > > change-id: 20250331-gpiochip-set-rv-input-bc12818c5732
> > >
> > > Best regards,
> > > --
> > > Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> >
> > Dmitry,
> >
> > Could you please pick these patches up for v6.17? They already missed
> > the last cycle and we're on track to complete the conversion in the
> > next one so I'd really appreciate these going upstream in the next
> > merge window.
>
> My apologies, I was hoping Nuno's conversion of these drivers to MFD
> would be accepted and these versions be simply removed...
>
> I acked all 3.
>
> Thanks.
>
> --
> Dmitry

Does this mean you prefer me to take them through the GPIO tree? Do
you want an immutable branch?

Bart

