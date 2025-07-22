Return-Path: <linux-gpio+bounces-23624-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 623C4B0DDF8
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Jul 2025 16:22:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2A53B7B5F23
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Jul 2025 14:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CF1B2EE28B;
	Tue, 22 Jul 2025 14:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=criticallink.com header.i=@criticallink.com header.b="cthboUTM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442082EAB7C
	for <linux-gpio@vger.kernel.org>; Tue, 22 Jul 2025 14:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753193813; cv=none; b=pIeIM85fCA6tnCcjrDAgmuXZu/7suWeNl7loRGLGCPXKhQIhu2/FX1MXwwKvWAMNI/8cIIg3Bg6ehEG5SwbUmdoh2E+h6lzzq8wVMmnRMemt0JogNZuS5HNnuSBw11UVmzBpJVxceGJEdgGDazYgZ0ylg95xbEuGgcCcXwqVDak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753193813; c=relaxed/simple;
	bh=VgF3YVg7j0A3Z4BF38oA80AX3KGiFBUsUIcqgCgCx84=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l013F5Xr5b03krf4IbV86UVmoI/64FsohdtAi/4S1eAArNS8bnGEyuwoaH0VGsGC3KTkEwFzSNc4uL+HQ6AWm1KVd5P0G3SbcMA0PvPEuEa1M7lqZkMNQE31vit9Wx2yIXpoRwY45geeYknwb0dVLVSk4DOJa4ZnVwswq/BWQxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=criticallink.com; spf=pass smtp.mailfrom=criticallink.com; dkim=pass (2048-bit key) header.d=criticallink.com header.i=@criticallink.com header.b=cthboUTM; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=criticallink.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=criticallink.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-718389fb988so53520347b3.1
        for <linux-gpio@vger.kernel.org>; Tue, 22 Jul 2025 07:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1753193810; x=1753798610; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DLLBhbPdBkBAifwS3c4NzxbMRa+Sqhs2OsCY4dOuxvg=;
        b=cthboUTMsrb+mP0TN+DgeYEfTFmid9tJ47+DqYkMCugKpDsbNLaTEj5pMocSI3GWky
         NBrm1hkkKnZRbi4DaNHFU0yhEBxLq3sgRbM1TOu2O/tTds6BL2nXCyoZEFTp/4fNENHm
         6CY5l2m61AGhvY+pr4GKeFU1lfO1Io5a+G+mNGzKs2aLfgCrhEdDUWDI18aksljzJ+3U
         33RL6D/NKTk/4onWUvUxID099yvjBXuXrott06Pfrzi//BaLmE7frZuhzijJCYPtw8Xy
         ovwjz2vcHuvnbxEJfUsG0x5aEkOpYr9t/dZq+/QzD1SfFNwWBf4bAM/cY/O2lSPbUZeq
         OoYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753193810; x=1753798610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DLLBhbPdBkBAifwS3c4NzxbMRa+Sqhs2OsCY4dOuxvg=;
        b=qYcuK02XQVGLJtd0+IviWtJstad2tHn11EX9FkH9PkCOYc3KqgQxehwnZmaJARXCAm
         DdOOjiJZNJ0pwVh2yHQ8fIZSMYKQ5Z2VN7ACsPv4BeS3S5YiWsXCrOsTQOZQn7i1KG+7
         AIe4Jvaic7J0JgQVxV1y2F95rDWPr1skdstFtADz0JC8FWlhbcrmvm8p9g5sL28DE/uB
         xiT0cbyxQBgGaHALibv2MT+63jDDoorqpznkgU60JpFiIvmoeAx1RkjtxblEGc4iv/dZ
         FtpIl0qWSX2QBtk4Z3q8DkqpHtthhZv8eCt0LljGtpIGuH97L5O6qJ/n+QtjzJXVZfFY
         5sFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUN9il7JLmYEHcgRra8sLWFgHoIH4NXoi3C31XZmW9y59rkP0+MP3z7+9zVqO1TtTVDYfb0/eRxk5fB@vger.kernel.org
X-Gm-Message-State: AOJu0YxyxEFKk95Wp5IOLREfjssuVIxI67becFusxYbAB/W2Z2dd5TqP
	9W6auiWNFWTUg0WY8D3xfujRZB62svwreny6VcrIh69sZIMYZEhc5JC1TrcnNiVhn5HRic0KaPB
	NLUz3b42EP/aF8CsnTDVK0D2RIKT2HjwZU+UblykL
X-Gm-Gg: ASbGnculWvZQb4YQ0cBR10bcgGn6iX4turCqpfYuw7Nq0qMOGtITZh2APDKuHuj2hOk
	m1DTb8OI6rFbZV3NzmK8X2YICQZfDJop2vr+yb4vzUJco8pSsgcmilOA2YVf8AHHxbAZTE1dhLS
	GOqpffH4rG/y31a/cIuienoOGnMcD/vMAduYIkg+wJFMqnrQodn2r805OmvEg7Weup+PCutCdYR
	/uri/rjSkIb55il
X-Google-Smtp-Source: AGHT+IEAusMMRxJv/4kenS4u2xWRco7tvJDmOmg4xje0HYxpNUnbtf8FDEI6YDJTxu6Nqtvrz384/0PUMhVHK8NdTDU=
X-Received: by 2002:a05:690c:9a8a:b0:70e:7503:1180 with SMTP id
 00721157ae682-71834f363e9mr354128567b3.1.1753193810048; Tue, 22 Jul 2025
 07:16:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250721233146.962225-1-s-ramamoorthy@ti.com> <CAMRc=McTJnTn1sf6Kc42yePvUyP87h1utJ7B_ynWjUxxm0E4Lw@mail.gmail.com>
In-Reply-To: <CAMRc=McTJnTn1sf6Kc42yePvUyP87h1utJ7B_ynWjUxxm0E4Lw@mail.gmail.com>
From: Jon Cormier <jcormier@criticallink.com>
Date: Tue, 22 Jul 2025 10:16:38 -0400
X-Gm-Features: Ac12FXw6Zmlkt5j8dq6rsx00GEtPhx20EHVdwU2_nlr4qMv2Js3WQIT7UbtZmPc
Message-ID: <CADL8D3YaF4zt2Wu0Vv1=8W9e9n5BKM+2npgfVmLhJ=wz-jHMKQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/2] Add TI TPS65214 PMIC GPIO Support
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Shree Ramamoorthy <s-ramamoorthy@ti.com>, aaro.koskinen@iki.fi, andreas@kemnade.info, 
	khilman@baylibre.com, rogerq@kernel.org, tony@atomide.com, 
	linus.walleij@linaro.org, linux-omap@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, m-leonard@ti.com, 
	praneeth@ti.com, christophe.jaillet@wanadoo.fr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 22, 2025 at 8:33=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> On Tue, Jul 22, 2025 at 1:32=E2=80=AFAM Shree Ramamoorthy <s-ramamoorthy@=
ti.com> wrote:
> >
> > The related MFD series was integrated in mainline during 6.15 cycle [0]=
.
> >
> > TPS65214 is a Power Management Integrated Circuit (PMIC) that has
> > significant register map overlap with TPS65219. The series introduces
> > TPS65214 and restructures the existing driver to support multiple devic=
es.
> >
> > TPS65215's GPIO specs are the same as TPS65219, so the "tps65219-gpio"
> > compatible string is assigned to two devices in the TPS65219 MFD driver=
.
> > No additional support is required in the GPIO driver for TPS65215.
> >
> > - TPS65214 has 1 GPIO & 1 GPO, whereas TPS65219/TPS65215 both have 1 GP=
IO &
> >   2 GPOs.
> > - TPS65214' GPIO direction can be changed with register GENERAL_CONFIG =
and
> >   bit GPIO_CONFIG during device operation.
> > - TPS65219's MULTI_DEVICE_ENABLE bit in register MFP_1_CFG maps to
> >   TPS65214's GPIO_VSEL_CONFIG bit.
> >
> > TPS65214 Datasheet: https://www.ti.com/lit/gpn/TPS65214
> > TPS65214 TRM: https://www.ti.com/lit/pdf/slvud30
> > TPS65215 TRM: https://www.ti.com/lit/pdf/slvucw5/
> >
> > Tested on Jon Cormier's AM62x platform with TPS65219.
> > GPIO offsets remained consistent and functional.
> >
> > Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
> > Tested-by: Jonathan Cormier <jcormier@criticallink.com>
> > ---
>
> This doesn't apply on top of my gpio/for-next branch. Do you think you
> can quickly submit another iteration rebased on top of it?
Maybe this is a basic question but is there a rule of thumb for where
to base patches to be submitted to the mailing lists?  I've generally
been basing them off the latest tag in linux-stable/master.  I suppose
this might be one of those it depends on the subsystem things?
>
> Bartosz



--=20
Jonathan Cormier
Senior Software Engineer

Voice:  315.425.4045 x222

http://www.CriticalLink.com
6712 Brooklawn Parkway, Syracuse, NY 13211

