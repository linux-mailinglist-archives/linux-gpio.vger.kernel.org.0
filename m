Return-Path: <linux-gpio+bounces-12868-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF8A9C5856
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 13:54:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AEA39284856
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 12:54:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3505770831;
	Tue, 12 Nov 2024 12:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="rKpaRSP6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701A570817
	for <linux-gpio@vger.kernel.org>; Tue, 12 Nov 2024 12:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731416043; cv=none; b=G1JzIugEgaDg/5BYmg1WZmZBLcYR99Xib+DWLoixOnmZ1I3FTNGJjR95NTrIFjlLTUi19PMhn0HCDSgNso/X2xDZPJTh1v4uTa8skw+6nAeyejWaYSKeASotbH9yUh9cYjHbSHOJ6F9HBWs6q5G6P3B2rakA6H9hjuegT41c7jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731416043; c=relaxed/simple;
	bh=M9hxsmKDBDKSSi/jW2NU++UBfd3Bt98xWitaVEtQSBs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c4UPhDmuVmRjm9qFu0z+rCICpbf+vM1RBIsO8hXtHYkQ8rZUyB5sa/duUB8oh+SSX1Uk0yGzBjWp2AEXeVHK0r8n0ZQDWD8TtVp5Xll4nxzc//HFKyP7AYu5VnN7EtUM3VJ/dOHI558VkEx1gUKIXqE6E7/QjoZNnFioA1n41I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=rKpaRSP6; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fb3110b964so46811361fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 12 Nov 2024 04:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1731416039; x=1732020839; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M9hxsmKDBDKSSi/jW2NU++UBfd3Bt98xWitaVEtQSBs=;
        b=rKpaRSP6dpqdU37CygyceB8O9HmbypGxrdUcZ3qfF+c+/zdi6Dwe26y/yvBJ45daTk
         NpBhsRVxmEa1O8Zrd3KJAMVXz2cEIfbG20wpEo28ETXi4LVLL/xbV/6OLNSX6MRQe2xI
         rNSlRi5i67gAEcAIcp6E/mEigs42syVVlVZ+rsDMvt274E0Rc1XvzCVxkBz2Ox3NwqAK
         Eu9HDSG9NQFZfeVXireRWXK+Zdn+02RG0fn47+0p40QLDGtEeSxyk/cvXXt1ALy8IDSE
         qzNAPOMSetEwaMtLY6Ah/D2w/wlVIpuP4hZNnrfcI7DjaZeL/kOLSEIbANn20IKryum7
         zCRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731416039; x=1732020839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M9hxsmKDBDKSSi/jW2NU++UBfd3Bt98xWitaVEtQSBs=;
        b=ZsYYE83AxWXueldRTMqbjt9F2MWD9UiKzNJ9zaKfku+S8ErbxBgN5hGnr0Tp3YJj6k
         a0EfVqTEE7vjdB7nBe0zs5A2vnayty8AnB7T0HhFX/h3XZ/QuOxI8HZ7o4kN0hGYPlia
         SqkRu3Qs/w7OYW4ga3fWmCMGpjWK8mSEemNGrPl+kkBMd2YH4nRnkFuTf6bRtJZJo5et
         MZhnsZ25Yn/g4oI51x1BVCLWjLfkwN8eeaN9Mv++/+EklER4FUumY7iQQOOATzrLxcL5
         Q+gb0YBcgMRvpxPZaq7lUDogQCFBW1ph6KQWabKKs77nMp/JKIS0nORKdWaWjb8bQVnL
         RCSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYi312vtoHjyNqMCPdJlpRvkWfUZSNPCIH3Mvp/y4F5qQUfNjwRrK3TYaG/QzSB/1mu841Pg5MRl5g@vger.kernel.org
X-Gm-Message-State: AOJu0YypI6PXoo9IKXGpiHZCXbKEypCCbSSpdOnuzt/6SNaqGoOWirmg
	O4x1ijRHZaZruahy2pELU0xVn9P3wQK4y7epJYI0fkED13NzorxkDPTb0+slxkmWjRCn8/SRMPD
	aCfBANWUrkaKHwj0CsciLfEFAyUw7cDgVjkNzag==
X-Google-Smtp-Source: AGHT+IGbmE0o5QthwRBQiRAF+JVGWtz10N60VDzpRavWFxo0o78BzJrNfw3tuJBFoTaZr9DjOr15SEHztRHupcY74Sg=
X-Received: by 2002:a05:651c:1542:b0:2f1:a30c:cd15 with SMTP id
 38308e7fff4ca-2ff202ad40fmr80832201fa.36.1731416039490; Tue, 12 Nov 2024
 04:53:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241112015408.3139996-1-ye.zhang@rock-chips.com>
 <20241112015408.3139996-5-ye.zhang@rock-chips.com> <CAMRc=MfTmpLSEUVTXSu8jf9tyTfQc=iG9NpovFem-qSDOCnagQ@mail.gmail.com>
 <ZzMwh2GMP-bE7aLO@smile.fi.intel.com> <CAMRc=MePqsQatxNy7p5c3sE4z8RepjjLeFgpppKgEctCU3jAUw@mail.gmail.com>
In-Reply-To: <CAMRc=MePqsQatxNy7p5c3sE4z8RepjjLeFgpppKgEctCU3jAUw@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Nov 2024 13:53:48 +0100
Message-ID: <CAMRc=MdY1idv1o_nZFb1fKLpM5DHCPmEu5t5MMa_kV9csLgQWw@mail.gmail.com>
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

On Tue, Nov 12, 2024 at 1:50=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> On Tue, Nov 12, 2024 at 11:40=E2=80=AFAM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Tue, Nov 12, 2024 at 09:48:06AM +0100, Bartosz Golaszewski wrote:
> > > On Tue, Nov 12, 2024 at 2:54=E2=80=AFAM Ye Zhang <ye.zhang@rock-chips=
.com> wrote:
> > > >
> > > > Since the GPIO can only generate interrupts when its direction is s=
et to
> > > > input, it is set to input before requesting the interrupt resources=
.
> >
> > ...
> >
> > > This looks like a fix to me, do you want it sent for stable? If so,
> > > please add the Fixes tag and put it first in the series.
> >
> > Independently on the resolution on this, can the first three be applied=
 to
> > for-next? I think they are valuable from the documentation perspective =
as
> > it adds the explanation of the version register bit fields.
> >
> > The last one seems to me independent (code wise, meaning no potential
> > conflicts) to the rest and may be applied to for-current later on.
> >
> > --
> > With Best Regards,
> > Andy Shevchenko
> >
> >
>
> There's another issue I see with this patch. It effectively changes
> the pin's direction behind the back of the GPIOLIB. If a GPIO is
> requested, its direction set to output and another orthogonal user
> requests the same pin as input, we'll never update the FLAG_IS_OUT

I meant to say "same pin as interrupt". Sorry for the noise.

Bart

> value and I don't think any subsequent behavior can be considered
> defined.
>
> I applied the first 3 patches as they look alright.
>
> Bart

