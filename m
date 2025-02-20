Return-Path: <linux-gpio+bounces-16312-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62529A3DC37
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 15:12:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A5013BCE77
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 14:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F359C1BC073;
	Thu, 20 Feb 2025 14:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="E9Cesglt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19AE41C3BF1
	for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2025 14:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740060678; cv=none; b=bmJUOrfmAms6mDXVXj7tUO0ALk64ISi1Ktqp2wrA2LurVT1EGBRoTmnr8vGFcQ2kKRsIMDOqeT1NAcK0oMaj6+ouegdn7Gb4i/ns/LlZ49G96Ix4wTHz4KAHT8oHoMr+PD+/QoeUUWVnLOJYkMiEx/a+PdVL/cvK7asIiJnEV98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740060678; c=relaxed/simple;
	bh=D84La+FZX+T3BhihEP6KqrPV6UfjhGT/+lhO0X5r49E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u/gAiLijTkhf3Mgn9KevzYD1UtNniGt5bOZKfYiTsqkWkv/evJs9Gist36U8xN5NysnacO+vckGTQ9UsomjjtmkmzFY3HtwcfLkGbauJkPCyqjEZOfe82orFghbR8HiVhEW+dl/0SRftBlWbALEIXdovVd1o3gFVyUadWRjQvXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=E9Cesglt; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54626a71b40so975016e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2025 06:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740060675; x=1740665475; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D84La+FZX+T3BhihEP6KqrPV6UfjhGT/+lhO0X5r49E=;
        b=E9Cesglt93werXtv0olMlcxKqy/jD+FjePWfRktzJk1E41WnsETJIqSxi5lqIuajmA
         BMGSOn4uUtohd+sVHjWAd2WUmHyZtGsBjX3tknMOJcjiKRkk/gbCfAvkhAQ3xjDglJ21
         i3qnW7FpRXumw3WCtwZkP2SkMGrumd9boueaFQtA9SjP9zXRFWN6XXGvDE/rHtnOkJjp
         5lfYjrfQ4zS01Ci3TgTV8787Y4CRGukrkBX+nooPjk4s0+Seiu4i1dCDdroGdgOfwv8l
         YumCSAyS4l3GsIRbIOGfi9BJU5MJwW5qxuQBTy2tsf8jLhDDLi2cMCMTxrJKaQgYa4y1
         A+IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740060675; x=1740665475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D84La+FZX+T3BhihEP6KqrPV6UfjhGT/+lhO0X5r49E=;
        b=ErKTnnckgKD3WQfYde8l+DJCtGFXqZ7//tbAy2H3Z49T+wos8sPpr+6rM8LECOsR6N
         GlMsiHROgq+wR95LLFT2o+ZxWizEthzqUxp2w8jl7WrEZjXyfIHjNwbCThbQuFCGuY57
         5HfvVq+swDpAaKhbrzgeus593uM6co2r6csB9kPuCbZdK4m8iZEfVAjliQQrYuBBzXCQ
         4PqOVxoJoYghgrhZ8MEmMxvAuhr9hXDG3s0Ecy978+9sYwzt1D+VQE11JSirE4+vRTQN
         8WFI+RTADABSU70dldHTBLuCRv/VHyUhztqV4SYUIQTF8ot7gfD2VMJIc50gj8cFz6aN
         FnYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEzKzoRrD+A4dBJkdq9ucxuxjj5LsoXBuiI4aDpTpeTU0Fu/jIo0eXDNXNOcR33p1LcNTfv7erOM8r@vger.kernel.org
X-Gm-Message-State: AOJu0Ywaug5f0OglEJDe/nmGEjbsNX9Wr/JGHeRnR/OJ2iY7+9C7gKKD
	pzlE9EcwNU/vFbU/z2JgXAECdlvr7C9tIwXmYa6bqKhfFe7AgB+ojoHcZf36sIbG8Y0NQUF7fcC
	4TzoBQAHqyOLHL0F5Th8sVdoaMnbARrM4DnhxAw==
X-Gm-Gg: ASbGnct89htOG4OAq4TeXzsoIY94olRd/Wv2uASVgY15gxFi3b6Hpx5FUfhkwnk0DAI
	5dP9qlDEwm4YTmc0qC64GDVsthZ7TL305JUH4geh5S4jD58yZi0pFuitMszXU6NeKLoqi3TFOJM
	IQ/x9pcCK5bS9UVavC7Zt4+gV1LMg=
X-Google-Smtp-Source: AGHT+IFX7TS5KlNJP6wwwhX+vEjDQzGBHd5DUoKERp4YFmcW66414sQ/5EW6kjCkFYSw59mRMeSJu2eYmY92sjQ5ZDQ=
X-Received: by 2002:a05:6512:b0a:b0:544:ffbe:cd22 with SMTP id
 2adb3069b0e04-5452fe8f8bfmr7169309e87.46.1740060675084; Thu, 20 Feb 2025
 06:11:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250213195621.3133406-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdao27pu+9qFH2LBYNwYkBbWq1B-hE9nZGfTTCnQxhTiAQ@mail.gmail.com>
 <Z7crrgl2iFn34gck@smile.fi.intel.com> <CAMRc=MfSn6xB4eNkFG7E2gQPiF+AmnaidO5=FbvPtvW0N4iDjQ@mail.gmail.com>
 <Z7cwv0gxRFFGBjR1@smile.fi.intel.com> <Z7cxGOmwMIkkTRLs@smile.fi.intel.com>
 <CAMRc=Mc0gaRxOBDFXf2WB2_mNxaQo+UjCc6oTM-azLzV=c3VgA@mail.gmail.com> <Z7c3IhC115rPbTMw@smile.fi.intel.com>
In-Reply-To: <Z7c3IhC115rPbTMw@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 20 Feb 2025 15:11:04 +0100
X-Gm-Features: AWEUYZn0SG982QrT8tRmd7an762Y3uM2rOO25QY3qtqimqDOvruzsJbqzs3FxM8
Message-ID: <CAMRc=MeBCQrm14TiH99a-xLo5PMah9W05TO=8mzsxfXFXGjazQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/5] gpio: regmap: Make use of 'ngpios' property
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Michael Walle <mwalle@kernel.org>, 
	athieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2025 at 3:07=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Feb 20, 2025 at 02:42:26PM +0100, Bartosz Golaszewski wrote:
> > On Thu, Feb 20, 2025 at 2:41=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Thu, Feb 20, 2025 at 03:40:15PM +0200, Andy Shevchenko wrote:
> > > > On Thu, Feb 20, 2025 at 02:22:29PM +0100, Bartosz Golaszewski wrote=
:
> > > > > On Thu, Feb 20, 2025 at 2:18=E2=80=AFPM Andy Shevchenko
> > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > On Fri, Feb 14, 2025 at 11:50:53AM +0100, Linus Walleij wrote:
>
> ...
>
> > > > > > Bart, do you think it can be applied?
> > > > >
> > > > > Andy,
> > > > >
> > > > > I really rarely lose track of patches. It's been just under a wee=
k
> > > > > since this was posted. Please don't ping me to pick things up unl=
ess
> > > > > I'm not reacting for at least two weeks. I typically leave patche=
s on
> > > > > the list for some time to give bots some time to react.
> > > >
> > > > I see, I thought your cadence is one week, that's why I have pinged=
 you.
> > > > Will try to keep this in mind for the future and sorry to interrupt=
!
> > >
> > > Btw, if it's easier to you, I can just combine this to my usual PR to=
 you.
> >
> > No, that's fine, let's stick to ACPI-only PRs.
>
> Hmm... Is the Intel GPIO stuff should go directly to your tree? Seems I m=
issed
> some changes in the flow...
>

Ah, no, sure, intel and ACPI and whatever you did up until this point.

Bart

