Return-Path: <linux-gpio+bounces-16358-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 66099A3F1C9
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 11:19:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBC8A188C318
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 10:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08B112040A9;
	Fri, 21 Feb 2025 10:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="iLUV27g9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD5A204F6F
	for <linux-gpio@vger.kernel.org>; Fri, 21 Feb 2025 10:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740133013; cv=none; b=VRoHamRADmzwfmUtkHpdlO7KNUcNINdz+1eSI13lwfJy0R1ev15Mf7kQ6pEVzHNxLQ1PVqN46F3NGAixOmqqLUznLsaCWRnjKauaPEPYUVizvIje83gdftXGc9dP+ngFh3N42bSPOQc7wLVOIHKFaGLZix3cOFnxzE8tlrrRotg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740133013; c=relaxed/simple;
	bh=UTINVZMTqQKEFsNcbRAVygzNBAPGaLoYvIEdFjkNc58=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pKmRVdDT+vkfxR98eqh8INIJhZmLK31FYu1XHH3sz/sybSTvCAk45emRHy3s4MBu+TvSyIspqTa6he7nrvIOCIht8hhPC/XAINpJfWqmQEanntxxKoLrZ0Tzl+pMk4YiBpflxK27x+QDnarvcSOWErvyjNN+rGhpetzCRquMbJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=iLUV27g9; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5461b5281bcso1720286e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 21 Feb 2025 02:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740133010; x=1740737810; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UTINVZMTqQKEFsNcbRAVygzNBAPGaLoYvIEdFjkNc58=;
        b=iLUV27g9J0z6jT6KjhGoL3AsllPrsTZKOWthUMYlvYeUuEC85WVVBjI+cJZgjXBXIG
         KZTd+OkFaKieb58Cs0f1HOi95jTMUhTXeKkY0ZJhsHCtlQ9COioLL6q2BmC8tnQkCj+H
         cScE/pC9IMAemWfphAcK6FWxe3Hbp5lI6x8dj67xa15C9W/J3lulf7FhGQ2CfpmPMFKD
         fjA8WteRlK8CgRguAC+OF3Y5ddOdG9LO10FT//8O87AB4YNwvi1tUNtzfAWthyMyY+Tp
         IZQIpmt9/PLK14YaYplZNUqfYadTE2rOQjOjNrK0UvRT5Wc11XdomifAA+AGhSX04sDZ
         F14g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740133010; x=1740737810;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UTINVZMTqQKEFsNcbRAVygzNBAPGaLoYvIEdFjkNc58=;
        b=TcuDe9JcZm1yUHqPcfNkSPmmABYeXC/i0HAe3vjGERRLGu0rweBlTz0zV1HjAAv0n5
         XFsyuOKEVME7pCUHTxqRZXCXuX7BIEIBcUzDzXyf/NaIdaZRoVc4r1k+XycatKfbLnVg
         vB8ROgJj+RmKdO2cob5GrQX28bQ37qxCjk8pTbtiIUqvoDLrVUv64Qj0Onzw4C1PoF2O
         aN1bQ6+Fr/QNh/ifrnOTBxjE5lpA5gdLA4QuuSWO/FT2mxjJTbTFa9n2bEglyf6G4qSf
         4aIK38OnKXvYeNvLDcnmeTdvyBGwyccOt6Vq1zV3YLaw4Un8nFCeywvaVJgeM5qNuIMr
         Cx6w==
X-Forwarded-Encrypted: i=1; AJvYcCXTstH7tivEvNKFEEZnWAgbuiyyR6K4QJ5IFKuzYLn5SgiXCQL4/aLTspuaEwpTPTH1F2RW/14AzWqf@vger.kernel.org
X-Gm-Message-State: AOJu0YwoZchJht+9ChP35INUP10Pde6FY2wOcPioe3hxM2tQtYDlubTl
	TwfX5Pq5SOjASesttSegySewigjR/kMmSC5mmLJ+2Vfv9UnDgP12vsTtZZB/YUWNIbOpEBhMtDb
	p16t4fqcB9dtFuEa4TN5ZwMFle0dJ/ljLmdXQkw==
X-Gm-Gg: ASbGncu8Ai4GQSRcPgSJ8IMRJxAcoC6IJxZe0k4bZTgM+g+Y50Mn5uPA8ezpq0zNeHU
	OxzRVSzeLfOna8zaxA0bT+1JShNmiYUeDkI1s5hjAv5j/NPVA0JseVxxhhKNy8+oZShiCzctTug
	KEapY7/wuHwTokU5l5cG3FvP0M1YfjYe84oHhkiUo=
X-Google-Smtp-Source: AGHT+IE/gCc1zLKC2/FilcQfdgIA0T+E5scTEtijMf0nqtHAyEpZfuAyp4sTq0UHdySyk7VSMerkvASxHmIm3yoQBtg=
X-Received: by 2002:a05:6512:6cd:b0:545:16f0:6ca2 with SMTP id
 2adb3069b0e04-54838f59c59mr770995e87.42.1740133009861; Fri, 21 Feb 2025
 02:16:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250219-vf610-mmio-v3-0-588b64f0b689@linaro.org>
 <20250219-vf610-mmio-v3-2-588b64f0b689@linaro.org> <DU0PR04MB949620686274212D9E6F074190C72@DU0PR04MB9496.eurprd04.prod.outlook.com>
In-Reply-To: <DU0PR04MB949620686274212D9E6F074190C72@DU0PR04MB9496.eurprd04.prod.outlook.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 21 Feb 2025 11:16:37 +0100
X-Gm-Features: AWEUYZlJoEMlrwzsFjs-mxx4Wt9euGaU3C9izJ8NvcmysPIXr5T6ol2ihAVtTwY
Message-ID: <CAMRc=MeGUGssqNhUCeprEXUf57pmeyw_zc8wtZG3iLqXrxQ_7g@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] gpio: vf610: Switch to gpio-mmio
To: Bough Chen <haibo.chen@nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Johan Korsnes <johan.korsnes@remarkable.no>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 21, 2025 at 4:58=E2=80=AFAM Bough Chen <haibo.chen@nxp.com> wro=
te:
>
> > -----Original Message-----
> > From: Linus Walleij <linus.walleij@linaro.org>
> > Sent: 2025=E5=B9=B42=E6=9C=8820=E6=97=A5 5:05
> > To: Johan Korsnes <johan.korsnes@remarkable.no>; Bough Chen
> > <haibo.chen@nxp.com>; Bartosz Golaszewski <brgl@bgdev.pl>;
> > imx@lists.linux.dev
> > Cc: linux-gpio@vger.kernel.org; Linus Walleij <linus.walleij@linaro.org=
>
> > Subject: [PATCH v3 2/2] gpio: vf610: Switch to gpio-mmio
> >
> > After adding a pinctrl flag to gpio-mmio we can use it for driving gpio=
-vf610.
> >
> > The existing code has the same semantics and the generic gpio-mmio, inc=
luding
> > reading from the data out register when the direction is set to input, =
and it can
> > also handle the absence of the direction register better than the curre=
nt driver:
> > we get the direction from the shadow direction registers in gpio-mmio i=
nstead.
> >
> > Since gpio-mmio has an internal spinlock we can drop the direction-prot=
ecting
> > spinlock from the driver.
> >
>
> I test on imx8ulp-evk and imx943-evk board, gpio works fine. GPIO interru=
pt also works well.
>
> Reviewed-and-tested-by: Haibo Chen <haibo.chen@nxp.com>
>

Please don't do this, b4 doesn't pick up things like that. Leave
separate tags for reviews and tests.

Bart

