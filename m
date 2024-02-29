Return-Path: <linux-gpio+bounces-4002-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B39CA86D5D9
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 22:11:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B20691C23B7C
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 21:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B95BA143730;
	Thu, 29 Feb 2024 21:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R9cM4npi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6E0143725
	for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 21:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709240572; cv=none; b=VmXJWWwcEQiOW0N7ehGD+k7ZeOWh4+ifNkEzxUPp6Bynx/jKerr9Bk3USNuMyjq9o0fTWpgWTfd8RHUVuLD+I49hlRlCF+zkRnvZLIxGxMJSlA1HpUUkDqsbgKHhUnuw2ntKFGXrxpC3NfTb5dF98elUO3tQ8J1obvmCHqbIto8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709240572; c=relaxed/simple;
	bh=w8Goakld9blZJd9/ya/yCd3Qk4/5VBb72qWNnFBC0g4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HU+Z4s9vOKSTCL+OQhdZ6p3VXfuNOn2Qwi9l+hoEdxrqRqK6QQgYpKzyca/Jw4Xl8f0l6zT2aEAjRW1ypDT5wSOYDQe2emhYCiB/PVY2qRONrjHUv68i/GfOPawELzvXOM4ip4LX+h62zZQ5VG71ReGhHZ/y5nFXlGW2r+luER8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R9cM4npi; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dc6cbe1ac75so1120546276.1
        for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 13:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709240570; x=1709845370; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RzH42Le6JLqPTnrmstPPgkRIyy1vLFZ8cAEfYjhK5wU=;
        b=R9cM4npi1EypKIfskw8+XO7V1LVb9YUy7YPLmnpf7/jfA8v4sfFWsDOdI6pfXnF92H
         xzq+FkNLU8QNPe0pw761/O2RWjgQXvEjFjBN3i9+kNIpJWqSEO9ZCQJjPFOymOQyYrvH
         U1Yxi6GUanaiyzYHZ3oGhTW7a8CwrtWnJ7KhPQiohYXmbTISW6uabaJsMNJ1JFvHze6r
         6y0ZD18SY3N4r0omVczT+vlOVKQ5FmGPEWjK2F6cyVHnb9/8be+dphiiOEqZTlZrdzw4
         s5NBmmAd6ih+Kd2kmugOQJpcN9UKlkwboL0ZTOtFscUokSzPWXkagZAA74qCsLoPJicl
         F6vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709240570; x=1709845370;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RzH42Le6JLqPTnrmstPPgkRIyy1vLFZ8cAEfYjhK5wU=;
        b=ZNo7b0NARzJ+7X4Y9PlZDnVZj61xQzC2ZWR8L1EWt6nrPY481N3wLdyr1HXudlCnKs
         Y4VcXs3V5IKbYKYAyfwz8SXZmWMq56zgdCkMVyfUBOZ+CJO1wfiJehECMNuLpWlI/IP7
         iM2s2VGc0jdqHRpuT1ZdKh7KmmTi43rc/V6POwX0AV5rPwXtzrW8Swjtasz9vYA1e4Yn
         4q6aRA8oBJb0W2xNjVydl/OBqIweeTIahmJ0zTVG0kA2ixLndT6cyjU4q+EUTjEHKCFU
         SFHlKRpHqDP3RzjajACJ4UHIrTjNq3yy7aLKuE4ZC7ScS3qO4XyE943Tyecbc4gO3xdI
         uX5A==
X-Forwarded-Encrypted: i=1; AJvYcCV3w4IKGw7pYxgWrIz5QUJEcWiPMOMqADhtBofVbkkTHyAGKfq8wf9ZcLuCdlpZ+3CEV8OLbj/cBWuR05qXerwTbzc5PQ4Zk4wCng==
X-Gm-Message-State: AOJu0YzW7zDLSukdq3fFe2BBEZTtcX7QR/pa5BUCRJ+ybLiqY6gPhqIo
	W8DNkE6/VtJseSlfLWAzuNXv3yc9UCHHhbhP5A7AyYqXUEoJ0w4K37tlmQ64HdsVCCksM+KtNzW
	JvUeKkJ+R/XqrImJc4uMz6+gIvdV+sqUwVkJgcw==
X-Google-Smtp-Source: AGHT+IGrqHZZfmk+QgMoq6cpaifJe9cFgRnyEqezfeLGnwvG4l4U6/5Wq4g1VkIDnrBaM3IK6DsIiSkau/poL+aahCE=
X-Received: by 2002:a25:d696:0:b0:dcc:2671:7819 with SMTP id
 n144-20020a25d696000000b00dcc26717819mr2486052ybg.25.1709240569561; Thu, 29
 Feb 2024 13:02:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240227-mbly-clk-v8-0-c57fbda7664a@bootlin.com>
 <20240227-mbly-clk-v8-5-c57fbda7664a@bootlin.com> <Zd4moVd_-bY6Z_kL@smile.fi.intel.com>
 <CZGX0TSYLOH4.DZHG351R9KFZ@bootlin.com> <ZeBsAbPRr5IPkVZj@smile.fi.intel.com>
 <CZHNS29NK9RR.13G019Y9ZY6IO@bootlin.com> <ZeCjk9QgtCWb8Ecy@smile.fi.intel.com>
In-Reply-To: <ZeCjk9QgtCWb8Ecy@smile.fi.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Feb 2024 22:02:37 +0100
Message-ID: <CACRpkda-6jZUH5jDwPhyGgO-h8upRbj1z_4nT_gUisSQO9X8cg@mail.gmail.com>
Subject: Re: [PATCH v8 05/10] pinctrl: eyeq5: add platform driver
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, linux-mips@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi folks,

lots of discussion here, lazy Reviewed-by from me, but Andy often (thank Go=
d!)
catches things I just miss.

On Thu, Feb 29, 2024 at 4:32=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:

> > > The rule of thumb is to make modules if, otherwise, it's not so criti=
cal for
> > > the boot process (and even for some cases we still may have it done a=
s a module
> > > with help of deferred probe mechanism).
> >
> > I'd call SoC pin control a critical resource for the boot process.
> >
> > I also like the simplicity of builtin better for such a resource.
> >  - If we tristate pinctrl-eyeq5 and there is a bug, there is a bug (in =
a
> >    context that we have no reason to support).
> >  - If we do not allow it and there is a bug, there is no bug.
> >    Plus, it makes one less choice for people configuring the kernel.
>
> The problem is that you reduce the flexibility. Nobody prevents you from =
having
> it built-in while tristate. But completely different situation when it's =
bool.
>
> So my argument still stays. I think new code shouldn't be boolean by defa=
ult.
> The only exceptional cases can do that (like PMIC driver or critical cloc=
k one).

I think bool is helpful for users if:

- The system cannot boot without the pin control driver

- The system cannot mount root from a storage medium without the pin contro=
l
  driver. Initramfs doesn't count for embedded systems, many of these use t=
hings
  like OpenWrt that does not use initramfs the way Debian or Fedora etc doe=
s.

This SoC is obviously for the deeply embedded usecase. If this SoC has root
on flash or eMMC and cannot access either without pin control, it is helpfu=
l
for users to have this as bool so they don't shoot themselves in the foot w=
ith
Kconfig.

> > > > > > +     if (WARN_ON(offset > 31))
> > > > > > +             return false;

I think I asked for this code in my review, because I felt unsafe about off=
set.

Maybe it's not such a big problem, but, this twoliner is also not a big dea=
l.

Yours,
Linus Walleij

