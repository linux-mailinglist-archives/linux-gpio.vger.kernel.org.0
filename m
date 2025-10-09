Return-Path: <linux-gpio+bounces-26927-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 07647BC8674
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Oct 2025 12:07:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 872C34E6CED
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Oct 2025 10:07:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46AE52D73B9;
	Thu,  9 Oct 2025 10:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="BSWel78a"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391A41EF36B
	for <linux-gpio@vger.kernel.org>; Thu,  9 Oct 2025 10:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760004437; cv=none; b=Y8xIOKOJtSYSfyk2k5rcrvPfTjk/h5EjNv2eNflkn7NmQqoT0dYHijPO/D14E8c6o0qiGAcTvAaxvILO9xQXzWzfN8hILQvISduG58wxTLv9VitRiP7RULELFlZqcE0xHBWmx5yHUxNYkrMUZadQXx8tm3n/Kma2qiymFVUMBzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760004437; c=relaxed/simple;
	bh=Z6fCQhdk3dr0h5KNJ6z6nOfj/2NAXHn2Z28Tx2ssQSM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cm33g+SID/tTUMpvtym3KZifLhOi6oC4Vvyur8yU+p/PbxpNgLzgtoXhYvk8CY/MlXIrURlZBPDpLPqD/VUGMmY8+jhmMrqz6+5ZJV3ZpQM0yx9WNx+3G+xEayjCB+bq0oX/8wDwv1pH0EG7uNzfLBExpqFpzw61xHjkTFEyCHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=BSWel78a; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-57db15eeb11so936467e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 09 Oct 2025 03:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1760004433; x=1760609233; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qTdm+WQN/IArP6uzK/anYh69/F3/JcJMhmnKnGbESXs=;
        b=BSWel78aY2+7NF9UHBh+KZ2IHaDit0m57yLyD6pSgnOEwEcnESWe1u45jgVgDAmlj7
         XJrhvA0M7+ELzQZwfYk6ZzC4Z1f2AAeAzevBCTXYxqT+/AYb0v4sCW1Yw+C9HndcHUGI
         aNi1G2k9l82tG0sqrqhf5nhDmUUag3lLat4nMT41GknPfPdWIP2oBNTrCFtJzaknvsgD
         pZHQHaeJpoe8qiGGaywiBZDInA210UoR/h60Oj/aIk4vjx04pjUrGJO+BjvC0rZsaR9L
         tXWEerokmsrSbkiLd9b3uhlP/jeT1cDGQ5dskd+8QIa4DSRbLIsN5pRO+0vToiXNebtO
         p8HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760004433; x=1760609233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qTdm+WQN/IArP6uzK/anYh69/F3/JcJMhmnKnGbESXs=;
        b=i1tvx/d0wLUa7DSGt9n4XqzwchYVxo5Hls6fi2YWdfWoFllSlS+4AcQVDcX8NzAAb9
         FbXA9Qrhqq6J3uQj9UZQrHtZxDMwDVAu+Q4WAHe7uKEdy3vdddOnp/QH21P2pHOJln2b
         sQFU6XtKHLNjcrBgaKAuWFlyQn1LfETTYdU0VlOO73mLkwmoaKkpW4iw+Wdxq1U+Ng4U
         Vsn9yOdBrpdiukBxhkipCZvxTgo/TnHdZQNBu8AZaB3SXJl6blzaxcvnE529IKKCI7aR
         GWHOGgQtktyYxwTq1urhCCklXDfneCi2kXZGS4dhV0HrBG8X9cv4wDDKfCvW8n+VicKD
         sZeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNEsP54stXUoEtn+9aEAVzWwYfjlR6bB0tcmW4sijZMgBhJK70S3GaveK3g2zf/p0iH5BDR/9EowI5@vger.kernel.org
X-Gm-Message-State: AOJu0YyHtMzpJuePFmlx4edy4+kC7n/2wJAP/eVpNvRF2o1UdXftEgYV
	g86EAet6bNbJNjpufeIkwfThOrxT+4rPXLoWFCm61THkxX/f+Tfl4uKcWPgbcFztl+8mc54e9nP
	52Nzc8ZRnMIuDPcei8jgor+vt+lvIf7uwrGZ2Fa/EEQ==
X-Gm-Gg: ASbGncuJv/uyt0Ogo39BRgf43wzWXgq3zIFGyqlxV7qbF9JHulNKkZHidVu+GmGYJDz
	HSUvoJX4XB0R+t0u61WVcTFtJqAdpqIkLGXgiMoPSBsB6imMJeOWtZ+V98VDJ4i4Vn/scWtfwdl
	6eqpyJc9qbd2u+eWx5cU7ppXl72d9a6DfIl5LcyNM8y3AYUCDrdjLdcKZQyvDLRzks0zm4/0FTW
	i+eJkXUFFkT2LMXspStM2zvT4ssA7abV9MHKzVEaSRf1iPiJR9FcspZSGUGgoJnKE/bhfQF
X-Google-Smtp-Source: AGHT+IGDdNeze8LYJjC0w9X4/tmvn9bfTMHPkMojDzQaWsGrmkgUhXZlakYkQXFLaJe1+0eSO9i7NPOD2qru7Dz+8yg=
X-Received: by 2002:a05:6512:3e03:b0:55f:6c08:a15a with SMTP id
 2adb3069b0e04-5906d8efa49mr2043976e87.32.1760004433205; Thu, 09 Oct 2025
 03:07:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250806091531.109861-1-stefano.manni@gmail.com>
 <CAMRc=MdfjuSSsD=LWDpUroyf+fxC7jQrJDtZJtmj_YiQYQjAuw@mail.gmail.com> <JZ0U3T.53FSIQ97H39F1@gmail.com>
In-Reply-To: <JZ0U3T.53FSIQ97H39F1@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 9 Oct 2025 12:06:59 +0200
X-Gm-Features: AS18NWDTzj0xfRlNNs2NBR-OnxUMd1ZPijaWjphbF82EwZLOrH-PY_ZJVlG7jvQ
Message-ID: <CAMRc=Me6cRLPsz9-DLMyFXVn8AXExWRP4fwHaN3=8HuHR6+VGg@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: pisosr: read ngpios as U32
To: Stefano Manni <stefano.manni@gmail.com>
Cc: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 8, 2025 at 11:28=E2=80=AFPM Stefano Manni <stefano.manni@gmail.=
com> wrote:
>
>
>
> On lun, ago 11 2025 at 09:56:51 +02:00:00, Bartosz Golaszewski
> <brgl@bgdev.pl> wrote:
> > On Wed, Aug 6, 2025 at 9:17=E2=80=AFAM Stefano Manni
> > <stefano.manni@gmail.com> wrote:
> >>
> >>  If of_property_read_u16() is used instead the value read
> >>  is always zero.
> >>
> >
> > Please state more clearly what the problem is. This sentence is quite
> > garbled,
>
>
> the value returned by of_property_read_u16() is always zero, if
> of_property_read_u32()
> is used instead , then the returned value is the right one contained in
> the dts.
>

So please put this into the commit message.

> >
> > If you're touching this, can you switch to using generic device
> > properties instead?
> >
>
> what do you mean with "generic device properties"?
>

Functions that allow to read properties through the fwnode associated
with a device bound to a driver. In this case:
device_property_read_u32().

Bart

