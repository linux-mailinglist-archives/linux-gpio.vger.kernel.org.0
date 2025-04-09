Return-Path: <linux-gpio+bounces-18599-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7437AA82CBD
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Apr 2025 18:44:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F3AAF175D5D
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Apr 2025 16:44:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 363BB1C1F07;
	Wed,  9 Apr 2025 16:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="gd7VRII0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F225125E838
	for <linux-gpio@vger.kernel.org>; Wed,  9 Apr 2025 16:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744217041; cv=none; b=cgnbcqWd9tF/JC+iZwMcEXoc6xahr3ZyyT8NOyVZPPm05UvnuW/JSw5l1ou15xCepZj6mwRLlUGiv7J5HJh+dV7YkH1kckCK4qqSyNOUCyzJM3qwhJdtd9UKWsiuXytKW7HlH1NgGEagdiOoF6Awy9s4H6NlaEMHBJCxnKFV/QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744217041; c=relaxed/simple;
	bh=T1UOxjhpPsPhSQtw6G+iRKDta4RLFuAj7TRD1IXXveo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hQlTdy9AbzVR+E+8aU3WDYKfhQPhtVGTi4rqryIgfxX3+dkaoFujwkgEr+tD3zhnYIKrdQX8aXoP35MLk3fj8QgB1tBuZTPgo8v0NhLOhajexmqvFRV0g2o99t5W+EafFrb2znehguhe+afl0dVW/EOwm657FQIKc+swdpwIRMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=gd7VRII0; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54afb5fcebaso7788027e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Apr 2025 09:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744217038; x=1744821838; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T1UOxjhpPsPhSQtw6G+iRKDta4RLFuAj7TRD1IXXveo=;
        b=gd7VRII0VB7hhUaD5AsdkLlob5qBs++5+9ziNzuGUGwjY1pRVRWACIYmEOhf5IYPVO
         HpOZJD1xz7OKZ4bYktpPdUHmht+HQfjc21ulmYEQBB8MRdutCPpDdJb8cNNC/WglbELF
         isCCisr8HMV94sHYsv/37Y0Xdq85SwJ5UJPgfCjI36m0LVUfsPQoj/qeG0bFpP7qp0yq
         DtmdHYSJzcQkjmNnbwDP4HXHbzBmnut/7NSTR0FAcCvN0iu2uFrTiE7tO8075SqwydcP
         jCezFrrGzF7B/xZ8x2Bjoe3VH6d2bF0RSAheUpeag/jopILjjpdxRWHIi2MfZE7NxxSj
         O51w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744217038; x=1744821838;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T1UOxjhpPsPhSQtw6G+iRKDta4RLFuAj7TRD1IXXveo=;
        b=jbnTC0GAg57BDvbMkYWyHuClk0SUkDZSXnc5uEZ3w2wedk3TH70zsBFcszbKuBtyTU
         igYyJYuHfb/Puhs14Ojkgl8MFYPu3NYa6xCX+9cT2dSSOhWfQNV2SISp5kd60KsD0DH2
         OgC50cjNUyw53mVvvkXt10GSMNpLw5VGeULRNxLNc0mfjDMLWk/thEr0C2R3Yr+aGPa5
         bm25pPs+OgeDPvVvrSJ9IweCSoJAWJQajwXb+DKdKMJv2qDDt4QgFCGZsmhcImBRanTr
         GW3VDD1Edphgntb4qusa3CvP186A3A3S9aBW1fRs9tidxHRGtcDeylPXbO/Uni17zPc0
         dbCQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9LvDyydqA2URTxqXG1sAhWOVm/NCB2Oym2bBrHKrzP4aUbrAg6/ZmmPty4eBmHpoXMCxLH5Ap52Ia@vger.kernel.org
X-Gm-Message-State: AOJu0YxppX7mNsvU0Ioqher4PwUVYF+Ktvao+MadrlviT8qMeQ8i2DlD
	KajybxrZC4jsByo+tnPP5s4N2Nb+hSnbGy7NzMc7LeJp8KJFP/b6GATsfOoMC/wTnshBwxQNUBJ
	JeJkjuxZ/Xs1fVQ0b3jXl6a+A+yL2ZAT6Lzftjw==
X-Gm-Gg: ASbGncvc8dK2QEtvz8t/JN/UsC0s74kijUXVEjBUH1TNT8YxKzFpmbokn+ogKYWr7dn
	WlyIkE837ZKpOkZRsNaA1tRVamPfEsL05Q/9Scu94FLjI2nGWZxy8ld8Q6DYiih/pza3PCWIEXd
	AgqcR5LRcLlSPHq53wvo0TT+HQbpAxVTphgXtOgpHvvhOtZ/5tlvh0dw==
X-Google-Smtp-Source: AGHT+IHhkAgu3QjROCGUJXTB4kW4wwAYSm8J2vtOKbqbIo+dJ2n+TEanaH7n1VTiK2H21P/9SxUOmXw5m8Let4mT4vQ=
X-Received: by 2002:a05:6512:3d92:b0:545:2f0d:8836 with SMTP id
 2adb3069b0e04-54c437b480emr1159242e87.40.1744217037919; Wed, 09 Apr 2025
 09:43:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250311-gpio-set-check-output-v1-1-d971bca9e6fa@linaro.org>
 <CACRpkdYujYhF8VP-_6O4Bt2tWL-NO-GgQPr=DeqE9QwCq12gqg@mail.gmail.com>
 <CAMRc=MdwQZMDaHn15n4zgCujtDRg=UUwz3A9ZUYY9Uv7FFgz2Q@mail.gmail.com> <Z_aGZqsUXq2uyQfC@black.fi.intel.com>
In-Reply-To: <Z_aGZqsUXq2uyQfC@black.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 9 Apr 2025 18:43:47 +0200
X-Gm-Features: ATxdqUFMPhXHk7lQUf3DMlzg5Y5WXAkfdazwddpm-cxwT2Q6grS3dEAYZSF1S4A
Message-ID: <CAMRc=MdsRWNVT0XC1DvwBdhZFsVZO6DeMrVePKgiF4Mj_Ryykg@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: don't allow setting values on input lines
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 9, 2025 at 4:38=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Fri, Mar 14, 2025 at 11:35:21AM +0100, Bartosz Golaszewski wrote:
> > On Fri, Mar 14, 2025 at 11:33=E2=80=AFAM Linus Walleij <linus.walleij@l=
inaro.org> wrote:
> > > On Tue, Mar 11, 2025 at 3:20=E2=80=AFPM Bartosz Golaszewski <brgl@bgd=
ev.pl> wrote:
> > >
> > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > >
> > > > Some drivers as well as the character device and sysfs code check
> > > > whether the line actually is in output mode before allowing the use=
r to
> > > > set a value.
> > > >
> > > > However, GPIO value setters now return integer values and can indic=
ate
> > > > failures. This allows us to move these checks into the core code.
> > > >
> > > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > Makes sense, if there are regressions let's smoke them out
> > > in linux-next.
> > >
> > > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> >
> > Thanks. I decided not to queue it for v6.15 for exactly that reason,
> > I'll pick it up early into the v6.16 cycle and let it sit in next for
> > several weeks.
>
> As far as I can tell from the reading of the code, this will break the op=
en
> drain emulation. Am I mistaken?
>

Could you produce a call trace where this could result in a breakage?
I tested open-drain and open-source emulation but maybe I'm missing
something.

Bartosz

