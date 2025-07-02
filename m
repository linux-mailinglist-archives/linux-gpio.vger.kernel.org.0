Return-Path: <linux-gpio+bounces-22596-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4D5AF1076
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 11:48:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3709F17F226
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 09:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69A2D25A338;
	Wed,  2 Jul 2025 09:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="t2VQyLw/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8389E25A630
	for <linux-gpio@vger.kernel.org>; Wed,  2 Jul 2025 09:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751449517; cv=none; b=V5LYgVOhRDx3ysvIJJpM/LM44Gq4rkjQWu1fK9CveKWI1dR1vdhsLfTA+vJKQwOcCgzuen4hBgSV7VxgHpURCFMtLE69w099mWiyZIuJDH0DoeRCrsle+FkSRFiYcr3NbpoZzRxudmjF0Msa5YphMXaBjMMwE7NNyBvsOKh28bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751449517; c=relaxed/simple;
	bh=S/Gi5LeZyzcplGlcKQbBKNkO/XhokSlE8LgOXcbKviY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cAV3B55IgHTSQnQ5hZ2GI+1G1QaQwUUYVHVl/QISKgfuBDs5WgZ9cBgop/ariv3CY62DfHPPI4wOd4ew2x+EldxM0R2TZ793gEKj4DtmsN1KZ6vtHM0Q4tuHtnzOnfnwwIFtClHW3MIM1IshgJtviZcMQvTY1nCycMdc+3tdUKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=t2VQyLw/; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-553d2eb03a0so8334887e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 02 Jul 2025 02:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751449514; x=1752054314; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k7z1rGy5kwDJc130oRSONcDs2Yqk/KXeqwp11/pB9Ug=;
        b=t2VQyLw/DFWahyXBS9z1gsSFz9SrekW5NRoSEXsDlfdw4hTF7P8XgNH2ES9Tqqy1CD
         Is8ZnSQ2IHqOmHgvgdpi+XjnJetZ2TiJLluwOmGdJWPLJUwL5cRwS3wMHTeh3+6HqZ5k
         cmWA3holCNtAeMWX3SDF5BsAxRt1tzL80TPesb56ekcFnyK0S+28PPE7+Bg3JEFkC6CD
         2XDnvtu+338qNARkPz42PeVlJWzP9nkhDOir6RLPZypPrGLIGMZtVFuT6GxuXHmgh5us
         tto6EPX1K/2KFgyGqyzuQ+GfUgdKhAw84kkB+P3wUwI/NaZL+QWjGJEunT25tdcpjJov
         2FnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751449514; x=1752054314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k7z1rGy5kwDJc130oRSONcDs2Yqk/KXeqwp11/pB9Ug=;
        b=sMcULpU7jBaf/7fyi0DdzF3OeNb618QAM5noYHnykrhXdp21hSejYruIOoV9tgPPPd
         4l3TiexbnjGmmZOHVC8ElNNjDv8ijPB/38HZe6ujmQVDWpogtk22uFe3TeuVCFUTwzYo
         LIYLjC0QxOKP+XWAz/iehjv3UckeebIsWrVztXkjSz0TWz4+GqY9P/d7YMtEBK3znyB7
         RLZL5/mf/8rb5+WspnGNfBNFe0pIbHTVQyPaOE3MxkpBQBtGwyURuDLej2+TzIxbAsqW
         +QxGP0U7/6JgfKbIDbmz47kFuG9RGrg77Oi4meSlUh7bkLn8+ZWFe87IyBCAP7fXSj1t
         hMLg==
X-Forwarded-Encrypted: i=1; AJvYcCVQpVUuzlib7vJrQgGigwXRESCZWWSm5I3CeRerXA00z9FCrfBywxVYkJTOfCb/dZ+W9ZIA3xvlchTe@vger.kernel.org
X-Gm-Message-State: AOJu0YxXlHghLwB+gKRAzWE9R32IXqVvbmeELmG4/l0oTikWOk9kGQdU
	myJnp6HUlxdw224GPYxqUz3qsDMhrRUiCmFUpiURP2dfRBZ9nTh3R+qAb5lNUG4UIP71Cs1XLnm
	CwY9chGmN0i96I1bC3/IUjV4h3tGLxYK/Oeyoi6ruAg==
X-Gm-Gg: ASbGnct0F711x/7xnL53rwzMDm7TjVA1wrfAvhjiDZsiDES8Wif24jmXVf3J96y+Dz4
	ecV5J9kWuUUkHg+AtXJjdUKt1LvoO47UdiBbPdKYNYWGyJP+ri03KK7hdx/PVWjAJUA9eVv4oGA
	s9nXNgGC8pRAPHvO41seQkZABPe09BXhqCAIn++xEAOCfcuAQyqqNQey+d2dbfcK4upAPe7eRjQ
	YFZUturXoE=
X-Google-Smtp-Source: AGHT+IE8W4lgL/E900nn9WZMrFeXvo0A1wUnDIjQRF5OvkEGaEQBoXV2VKS0H+V3dh3c1ZzkiuNZt46BZHhi2UX/HrE=
X-Received: by 2002:a05:6512:2312:b0:553:6961:f6b1 with SMTP id
 2adb3069b0e04-55628e945f3mr642886e87.11.1751449513608; Wed, 02 Jul 2025
 02:45:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250630-gpio-sysfs-chip-export-v3-0-b997be9b7137@linaro.org>
 <aGPrFnDxG4W7S9Ym@smile.fi.intel.com> <20250702035439.GA20273@rigel>
In-Reply-To: <20250702035439.GA20273@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 2 Jul 2025 11:45:02 +0200
X-Gm-Features: Ac12FXz-JnZMJjVFwkOV6LI85mHiP9ErZQPrWOCnEMfYgX5hOeAbNbHmgiBBoQg
Message-ID: <CAMRc=MftawBB4rtj4EKS_OwMCU9h53sA8QxcFq_ZY0MRg2OLag@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] gpio: sysfs: add a per-chip export/unexport
 attribute pair
To: Kent Gibson <warthog618@gmail.com>, Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, =?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, 
	Marek Vasut <marex@denx.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 5:54=E2=80=AFAM Kent Gibson <warthog618@gmail.com> w=
rote:
>
> On Tue, Jul 01, 2025 at 05:05:10PM +0300, Andy Shevchenko wrote:
> >
> > It seems I never expressed my overall opinion about this. I think the p=
oking
> > sysfs and making it working with a new schema won't solve the issues th=
at
> > character device was developed to target. If so, doing this just brings=
 yet
> > another broken interface. I would be happy to be mistaken!
> >
> > If I am mistaken, I would like to see a summary here that explains that=
 clearly
> > that the new sysfs approach does not inherit design flaws of the origin=
al
> > implementation.
> >

You cut out the link to the discussion that preceded this series where
a good summary is in the very first email. Anyway: the gist is: people
need to do some basic GPIO fiddling early on from initramfs that may
not have any tools other than basic shell utils from busybox. This
series is not about improving or extending the sysfs interface - it's
about removing its reliance on global GPIO numbers. And that's about
it. We don't add any new features really, just move the GPIO line
groups into their respective chip directories and make exporting use
the hardware offsets, not global numbers.

>
> Indeed.  I've already expressed my reservations about supporting the whol=
e
> of the existing sysfs capabilties, but I've otherwise tried to remain out
> of the discussion.
>
> To reiterate my position:
> While I am all for maintaining sysfs in some form to cater for those
> rare cases where cdev is too heavyweight, IMHO it is a mistake to
> support the existing sysfs capabilities in toto.  Take the opportunity to
> remove the parts of the sysfs interface that don't work well.

Doesn't the last patch do it? We cannot remove it without giving
user-space some time to switch. This series does everything in a
backward compatible way and then isolates the old bits under ifdefs so
that when the time comes it's just a matter of removing everything
guarded by them.

> The new sysfs should only provide the features required by those rare use
> cases, which IIUC would be basic sets and gets, and exclude those feature=
s
> not required, particularly warts like edges.
>
> If you need more advanced features then use cdev.
> If all you need is basic sets and gets then sysfs is probably fine.
>
> If that isn't the case then there should be some explanation as to why th=
ose
> sysfs features are being maintained.  Treat this as a new interface.
>

I tend to not interpret it as adding new features. We really just
*move* what exists under a slightly different path when you think
about it.

So what are you suggesting, remove the `edge` attribute and polling
features from the new `value` attribute?

Bart

