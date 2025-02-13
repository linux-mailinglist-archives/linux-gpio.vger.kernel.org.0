Return-Path: <linux-gpio+bounces-15969-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 807DEA35202
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 00:08:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8810F188ECB4
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 23:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E8D720E011;
	Thu, 13 Feb 2025 23:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EikaFbs+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741A32753F3
	for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2025 23:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739488119; cv=none; b=QmST9bMpY0ljmh0Jf07ozsnMlM/YvW7+hs7QHHBc/uBKFExxZT4D+igppPIIL12d/2z6kyuFZ0ZlIVi6O1/RmFIsaJ6XL34SPjoOCl9ZSV/C8V1qFrjtbn3csfjb+5HO3LPi5vKwW40jPj6PIRZU0s52wkPXJivEOJhy9vVZNGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739488119; c=relaxed/simple;
	bh=pw5Trl6WSOLmRGktW/AyhNkYVoRUS5DcJhxwkCT/3YE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hSoR8wK9WoDf7FHSsl2sOIDTDDaqok2GugwK18+NmhaX0G2kwLJvpnnrX9W9kNJzSarDCP1CCRwLd/5mav7jWeDE8m8aaV4Wuw2a5jZD12oJmdjvAoE1d2vgr2yfSOP9Sn4CKrOmpQGAo5Vgqx8gcVXMM4W3agconextodPZtak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EikaFbs+; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3072f8dc069so15429411fa.3
        for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2025 15:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739488115; x=1740092915; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kUBjtT51s4wV2MPoudnhQZ28ji68QbGJUnDNgh8IAN0=;
        b=EikaFbs+MAfIWSSJosK/rs06gLAoHLMYJdIeAIpx+hLbLGbhxA9b7CE8t5fg2h7sfQ
         jZM4XPmDV5BiUEIZDfvuzSlMJZcxaKHXcNApNDSvWU+PZZ+xCGQQJWuj/pW+zHlfBCRX
         xk/p0xbnigPzM7CRS9oUnA58rn2IzlKjx7/fPFYxWdUqRXu0ZA3f4WUZOjSlLxcJOQOC
         /S+byqgKWxA49hP8mHJhqjzUSDVpvIgv1mEzws9bUBssONdyNovFSHQEk7xJiRtHHtbA
         SoJRBA9QGJB7BhpDlvod3Ct8JJUuPi81eOiq3cKLCgu+BO5HLebMgKpuCXP/65ycNsxX
         9F2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739488115; x=1740092915;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kUBjtT51s4wV2MPoudnhQZ28ji68QbGJUnDNgh8IAN0=;
        b=afWGaaD2jssSH4uH5x4ar4HKqczf6mlUwzTN8y4/W/KLbsPfA3lznHNt64HFrTqrcE
         bmXAufEgAbpAT90hl9dwFtWaNhngNfXmKuyHyZI610U/rD06TQK4KHNUcL9FHq866elq
         qgvk751fqOJMyeACZq/gtAX2AMEMO5mDiWvLTyhWlyu+Ru8vn9SNIqg9HHg5lCUkrFKk
         IqVd45zEorgpxV5+P2EMFhPi6bR2VPjr3+9u63cHZQJPz7PRS2V+zf072bptNERdfQSv
         DohDTXcwfEQ7wHWJXNh8h3SSmiUguEKCgMBd9i863herxICXJPglWd1kwdG8Bqkwe/zK
         LGqw==
X-Forwarded-Encrypted: i=1; AJvYcCUb+otfTiltwkWpM/C97FkUVDxcU0mSLIXiA5gohlNeoojF/nhoGGpUJOc477P5QJKIy2bwIGS93a2/@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0us9rByoBDjO5BA5LcOSWMOLDypowtBi3WP/gstRZiALJL47/
	787DOJYcka25zzIblQwGd17cnDAwvFEqcNLXCGFqZRczcdAxZi1ChwaU0ji6mS9X6/+hwXAw0TE
	RvzkQyR5s+rg58RgJQfRyRC2JfULNSJrQQzLjtA==
X-Gm-Gg: ASbGncucLcyOldCBl4NOIG2utmOLNFJEP39W8Zs/sl5N1FvkOhOBf3/KNlR3RidrTSR
	Jpf8dwJ1WjR5w4vnzT6cZezOAA45mYNZdXysRAeFvX7Q1wcqAdTg/Pscp9mHwhGwF00tRkG86
X-Google-Smtp-Source: AGHT+IEVWXCqJrvxsHxcZL4ZxvM2GsuebHsyj7dz5JO7/xqltXyqdp/l2Ux5PURb/ieBVbdSBfLPkgDfAXIrq8+S/4E=
X-Received: by 2002:a05:651c:b23:b0:308:f479:5696 with SMTP id
 38308e7fff4ca-30903654242mr35095691fa.15.1739488115501; Thu, 13 Feb 2025
 15:08:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206181714.417433-1-johan.korsnes@remarkable.no>
 <CACRpkdaNDJrGZ4Y2PPUWQfm6BprfNACYWD7srs3sYHMEsdX1Ew@mail.gmail.com>
 <DU0PR04MB94963632094E71ABE730631990F12@DU0PR04MB9496.eurprd04.prod.outlook.com>
 <CACRpkda7ZRR+1_6bJN+qgrsb=GQyyujg81uie6n5rX_U3tAynA@mail.gmail.com>
In-Reply-To: <CACRpkda7ZRR+1_6bJN+qgrsb=GQyyujg81uie6n5rX_U3tAynA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Feb 2025 00:08:24 +0100
X-Gm-Features: AWEUYZkfplyaRnifHzEv_qQadNa-hUxm_UQdgzSoGXyUPeH2JlW8BW7iNBD2UjI
Message-ID: <CACRpkdbCDOPGJ7wzicYcE+HA8vLVKoZLfNB2BiOY9KbYH93=rg@mail.gmail.com>
Subject: Re: [PATCH] gpio: vf610: add locking to gpio direction functions
To: Bough Chen <haibo.chen@nxp.com>
Cc: Johan Korsnes <johan.korsnes@remarkable.no>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 13, 2025 at 10:45=E2=80=AFPM Linus Walleij <linus.walleij@linar=
o.org> wrote:
> On Fri, Feb 7, 2025 at 7:21=E2=80=AFAM Bough Chen <haibo.chen@nxp.com> wr=
ote:
> [Me]:
> > > I have no idea why this driver isn't using gpio-mmio.
> > > Not your fault though, just pointing out obvious improvement opportun=
ities.
> >
> > I check the code, for vf610_gpio_direction_input()/vf610_gpio_direction=
_output(),
> > to let the input/output really works, need to call pinctrl_gpio_directi=
on_input()
> > for vf610/imx7ulp/imx8ulp SoC.
> > Refer to drivers/pinctrl/freescale/pinctrl-vf610.c, it implement gpio_s=
et_direction
> > callback. Also for imx7ulp/imx8ulp pinctrl drivers.
> > This should be the reason why not using gpio-mmio.
>
> If this is the *only* thing you need additionally from gpio-mmio
> then what about just adding a new flag to bgpio_init() function
> in <linux/gpio/driver.h>:
>
> #define BGPIOF_PINCTRL_BACKEND      BIT(7)
>
> That makes gpio-mmio call these callbacks when setting
> direction?

It's easier if I demonstrate.

I wrote patches to do this, will send them now, test it out!

Yours,
Linus Walleij

