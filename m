Return-Path: <linux-gpio+bounces-12865-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6119C584B
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 13:51:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38B3B1F22E92
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 12:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D069770820;
	Tue, 12 Nov 2024 12:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="qn9Z+O8g"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE73433CE
	for <linux-gpio@vger.kernel.org>; Tue, 12 Nov 2024 12:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731415841; cv=none; b=apvnQUSXR3iH9qkuBIgLa4NjaB/DBB61JMei7p/2NvA3RteJ0gohOe83TuVqHW36QTeRF5TKCxJ3m7vE9dhlCVOGvHWcpx803ojfBq4sACHvpJV7qcSiQbou9ij+paBS5KuIzXBu7i7N+Nj4sOFhATTVrUZcgrgk/VY5woyTlR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731415841; c=relaxed/simple;
	bh=GeBVO2GdRfYXq00Svo2kHoFq/10dwtalChSI8IIjQwk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cOc0UPKLk+Dcn5mLyb0FkGSvKEIhsTcXYUYs+ngo3AG+00IpSckQu3l9WUAhifsvtvcudg18Xt9DXhy1UEYD2v2SXNIXF0XIcEHz0uFxNiQWt+zfnBc/GPMhbxZL9p5ti+Ix3f9TYvbQ9m7eb/ovfXqAtC3GtHNTounHe8fLD3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=qn9Z+O8g; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-539e63c8678so6532693e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 12 Nov 2024 04:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1731415838; x=1732020638; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GeBVO2GdRfYXq00Svo2kHoFq/10dwtalChSI8IIjQwk=;
        b=qn9Z+O8gIjogLFV6vYK8dzmjtdvbEY6SOthap/weA5YfzvIYoWIAt8W8zO2gZpU0iJ
         cktCUDTKiVPVGyDxiRUhEeGUVGOOwxKPpcsgkMM1YaPnMMQsFzg6cFbvXqsIodI9FC6B
         R74Fmw0PVsqVVOzw+4j8iiJEZ8Q9g4ts1WXk/pLLL7bFrSGopNkCvnlwmJd8QyofEzxC
         MaHC94M3bvfIHI59l4sTcTYlLUknu4AhAd9qj9Juy3VS8NYE3WYCYPQUyy+wNwGW4VAl
         7BuA+1J2JB0UK+5OvlGDnetxxEeT8PBZ0pQVF/ooKW3wpAeWY1tKQxNgP4k86dTH4oJy
         invg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731415838; x=1732020638;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GeBVO2GdRfYXq00Svo2kHoFq/10dwtalChSI8IIjQwk=;
        b=BS2V+Vj/1LKkXi0vw371V0XUiEkS6DbetDBzkNhCD3bz01aB8PyD3VhP6sXyTbYYmW
         6Q63v2vRBP7uAIsg8B3Pz+XuordxDISmEKta6sQia/UXirbe3HH/fJJ3lH6sbvREan8u
         SEyNFzyI1QQwZrhxWZHuaTQmAlhQ1DFReWoa+DTZntLLIOMCWfQ/JF5CV3QwEukjqzf3
         65jfAWB9X1fJkM+KDfnrlf83P6Wcxg0tnCaZ/foAqX4U1ttfp8Kr6faw1HHrhtr8xoNa
         TMC3+flhh/8wBXfbgV5X+Nse6KzwM2/8Yg47khHybR1tFooBODtiDTsXoh+KlDH5wiIO
         aM3w==
X-Forwarded-Encrypted: i=1; AJvYcCWw4q2OvBOknJzQL1hMiSxsfp2EAi0mCzUcpU2vdGe6iYqRqi5aHhiR5JgBKgrMnSBchXQCAqnTkFUH@vger.kernel.org
X-Gm-Message-State: AOJu0YxCaoLILSRl4j0FKmAUq5S1xJcjs/FdjRPd/eQYFf+oZI3ihafp
	SYtBmV65W7+9h6u/fHxswCNJaKpe1VaHSQ3F3LNHJjW1V6nDDHsGD73j8Z2JGdhrmV06ubkAbU2
	3Kim2gPUbMdNTd35epVCFoyvHD/tFU+Q+2n93zA==
X-Google-Smtp-Source: AGHT+IHO77pCoCjWkW3UGcaVkG+6FA9QyXrg8cZvhES5N7tCaKkkDgEAed2uIgWOEd1zU7CLBorSuTYdULgmPsy61b0=
X-Received: by 2002:a05:651c:2109:b0:2fb:6110:c5cb with SMTP id
 38308e7fff4ca-2ff202ac51cmr71186881fa.34.1731415837857; Tue, 12 Nov 2024
 04:50:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241112015408.3139996-1-ye.zhang@rock-chips.com>
 <20241112015408.3139996-5-ye.zhang@rock-chips.com> <CAMRc=MfTmpLSEUVTXSu8jf9tyTfQc=iG9NpovFem-qSDOCnagQ@mail.gmail.com>
 <ZzMwh2GMP-bE7aLO@smile.fi.intel.com>
In-Reply-To: <ZzMwh2GMP-bE7aLO@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Nov 2024 13:50:26 +0100
Message-ID: <CAMRc=MePqsQatxNy7p5c3sE4z8RepjjLeFgpppKgEctCU3jAUw@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] gpio: rockchip: Set input direction when request irq
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Ye Zhang <ye.zhang@rock-chips.com>, linus.walleij@linaro.org, heiko@sntech.de, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	mika.westerberg@linux.intel.com, tao.huang@rock-chips.com, 
	finley.xiao@rock-chips.com, tim.chen@rock-chips.com, 
	elaine.zhang@rock-chips.com, 
	Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 12, 2024 at 11:40=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Nov 12, 2024 at 09:48:06AM +0100, Bartosz Golaszewski wrote:
> > On Tue, Nov 12, 2024 at 2:54=E2=80=AFAM Ye Zhang <ye.zhang@rock-chips.c=
om> wrote:
> > >
> > > Since the GPIO can only generate interrupts when its direction is set=
 to
> > > input, it is set to input before requesting the interrupt resources.
>
> ...
>
> > This looks like a fix to me, do you want it sent for stable? If so,
> > please add the Fixes tag and put it first in the series.
>
> Independently on the resolution on this, can the first three be applied t=
o
> for-next? I think they are valuable from the documentation perspective as
> it adds the explanation of the version register bit fields.
>
> The last one seems to me independent (code wise, meaning no potential
> conflicts) to the rest and may be applied to for-current later on.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

There's another issue I see with this patch. It effectively changes
the pin's direction behind the back of the GPIOLIB. If a GPIO is
requested, its direction set to output and another orthogonal user
requests the same pin as input, we'll never update the FLAG_IS_OUT
value and I don't think any subsequent behavior can be considered
defined.

I applied the first 3 patches as they look alright.

Bart

