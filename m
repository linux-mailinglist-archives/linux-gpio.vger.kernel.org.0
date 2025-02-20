Return-Path: <linux-gpio+bounces-16310-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2588A3DB88
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 14:42:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C51C617B285
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 13:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64C271F8BCC;
	Thu, 20 Feb 2025 13:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="QIjnlpuZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901351F76C0
	for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2025 13:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740058961; cv=none; b=drri/L1OsxKQZ9beuZJ44mBDodahX33VQZYzhVoZBgPOwiLySF1xMNtIkJjQtq5p9FemZ4Byhy4gMwxj2Xd/IjbwaS3nuimgwpxIQoNHCp1/TgW37HexWXUdJg4KkmUimqxqIo0GckGow47s4zzPEWh/fga6BGKyZx0Lnr88y2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740058961; c=relaxed/simple;
	bh=D6ilmU1e0gmJQ4XQmzFLPc+miX+i/mTkflP7SE2H/e4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u3rsFqQgnH07vHs5bdI1ymaKdeYSsELdnK4ms7eNXB52iFQRID+XfyCxhCIJ7vDr3xEyN6kdqmmrx6xpM9J0Z6vRvLFxJUZ0zKfen3B5esiohdRMC2w/l5PZo+7CvV0mPkzKfkU0rkZdyt9UOYjGEuOwPdGHp+NBciXIYExpHxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=QIjnlpuZ; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5439e331cceso1053343e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2025 05:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740058958; x=1740663758; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D6ilmU1e0gmJQ4XQmzFLPc+miX+i/mTkflP7SE2H/e4=;
        b=QIjnlpuZ95kgaJ5CQqDPYSshx35VPid2Xn/upCjT1NdAT9cN679UxP/8peYNnOmZlT
         2rPvbaW9V1bUmY5EFKevWkonvCBaRj7E/TT5nwFhGPOeq+LUEznPVP7On8zZcv6R2E4I
         SIZTf4dPiP6RawNmPaugi1fu4qhlRoWsyqPlwdEzmKQxbh9ejn8P8FNNxn7aG8gUDqnb
         D84e5syTO5GdDaGdLsyXDai1Ax22uXFgfOFZvpwlM/St5XshuVX2SYE4LEfjF2jFwb7Q
         i4FC8dmIz11zuIHXAd9zFssa60TcZpyRx1hEDUow1ZqKEdcrIpLDbjwBZD8k8mOCFHLM
         Mgaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740058958; x=1740663758;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D6ilmU1e0gmJQ4XQmzFLPc+miX+i/mTkflP7SE2H/e4=;
        b=gvI0dZy+F/V30r0QBg9y0SBnTH/+0t7nncPj+EaZtN7FyNtcAU20HJsnKlYuJcLrZv
         O6dTIL+g0Sl2VMa7O2Hot6mfkdpAoSwizkqw9ZOB5VOtk8w5+IkBJ+/x/DHHj2XbZZf4
         blj14/Wm6bVPy8IoW4/m/Ak53rpHMkLjAwlG+IM+aPzVG57FFLpVD5iqTo1MyVwD4eP+
         pyDVO3KCvJtPQem16eZndnszgQHch4f/RaqNwQqsppo9YeHT6ZNWxaRYX4yaCl4MvpKG
         Qi1jqCMPqg3bIpSA35XLgeqtEfV8dyRqbzOdHLAOwicllvcMqbYlCztv8+E3ZhGbipVM
         F/xw==
X-Forwarded-Encrypted: i=1; AJvYcCWzzgCWPiOiOPMbOQTPf5kB94FNN5lH1R1pU9m7IQzdX1pMfQFzZvYcUTTjzt3+Yb9yfbJMMeaXFQAJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzRQ6WIlIhQSrbq3nPangC4+WulZmKBHRIn2n493nKhYcYKjPIo
	NzaiGiJqseuYr7gw9UVz21jKQDNX4Ua9Wwc75NKYdIP6Cnq8bDEmb5SFbfNHP0gWulu2oEihEY7
	lzeZidvsm+A0WSzGNCC9gjdsi+BaZwhgpIUOqdA==
X-Gm-Gg: ASbGncsw1D+QauJYpGgQlnqe7xUNWOKnTAIyidYhS1pLfyYHiEQw0uh2IW3aaQms71m
	2VbibZqd6hGdhIwdHGaS5La3jbfZbibuFEBawcJvQtArcfCSk8FbVSyYVhZNiRhNUY7JQuS/xJx
	LFC+VRpIc4i75aFJREhYJABSHZsXc=
X-Google-Smtp-Source: AGHT+IE/QljvxqQOucYkKkwJsqN1S8vDsR+44Cm6ZQGIEf/EuvBZuQI9TpJokvET0ulMZPKCYxVR86kKaprszD9K74A=
X-Received: by 2002:a05:6512:3d0f:b0:545:646:7519 with SMTP id
 2adb3069b0e04-5462ec7d6e7mr3495227e87.0.1740058957607; Thu, 20 Feb 2025
 05:42:37 -0800 (PST)
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
In-Reply-To: <Z7cxGOmwMIkkTRLs@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 20 Feb 2025 14:42:26 +0100
X-Gm-Features: AWEUYZliCPB3V_r_oONc5tJdN0FzpW2Pf5o6wREFCqkcv8bP8WF1k2YFby64Wmo
Message-ID: <CAMRc=Mc0gaRxOBDFXf2WB2_mNxaQo+UjCc6oTM-azLzV=c3VgA@mail.gmail.com>
Subject: Re: [PATCH v1 0/5] gpio: regmap: Make use of 'ngpios' property
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Michael Walle <mwalle@kernel.org>, 
	athieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2025 at 2:41=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Feb 20, 2025 at 03:40:15PM +0200, Andy Shevchenko wrote:
> > On Thu, Feb 20, 2025 at 02:22:29PM +0100, Bartosz Golaszewski wrote:
> > > On Thu, Feb 20, 2025 at 2:18=E2=80=AFPM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Fri, Feb 14, 2025 at 11:50:53AM +0100, Linus Walleij wrote:
>
> ...
>
> > > > Bart, do you think it can be applied?
> > >
> > > Andy,
> > >
> > > I really rarely lose track of patches. It's been just under a week
> > > since this was posted. Please don't ping me to pick things up unless
> > > I'm not reacting for at least two weeks. I typically leave patches on
> > > the list for some time to give bots some time to react.
> >
> > I see, I thought your cadence is one week, that's why I have pinged you=
.
> > Will try to keep this in mind for the future and sorry to interrupt!
>
> Btw, if it's easier to you, I can just combine this to my usual PR to you=
.
>

No, that's fine, let's stick to ACPI-only PRs.

Bart

