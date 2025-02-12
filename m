Return-Path: <linux-gpio+bounces-15879-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 162A0A32B91
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 17:28:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 848443A53BC
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 16:28:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2CF5230D0E;
	Wed, 12 Feb 2025 16:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="czNW84DX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7D02135A1
	for <linux-gpio@vger.kernel.org>; Wed, 12 Feb 2025 16:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739377698; cv=none; b=CGz0HslC8c3Mae5TUIvJVXK6DW9XmJq5cg6IC631lCyqhTjwKIdx5I05Tq5Bs9AOIJPMvMYyioOeovTSQMn0uRVkZEChhQJwOOtmA53eaIIhN7ir60bqwGYex5nGjK8IGz73D4N9B/yuxQ6m9yNPjlwD8mXoCDtme0tOr/FEoCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739377698; c=relaxed/simple;
	bh=TZuDBz/MQSCI0W6Y1MIlb4k+WX79YX+OdPUXe7FESaI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HyCfgSS8rPviZn3scQWJkJAtgxMyl0RNwBaLKro4JP7p25m2tGWIrYuWHIrYoOgc5dkllGMjUKyyd4wD4qUvmgz26hK2pCJDuc9Mih9QUidczZGXo+YoF8APIrpqrPhqTaGDpyLP3otesQ+nQmtiEE+I9bN7aX7yaVD3vLvwVGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=czNW84DX; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5439a6179a7so1078962e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 12 Feb 2025 08:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739377694; x=1739982494; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TZuDBz/MQSCI0W6Y1MIlb4k+WX79YX+OdPUXe7FESaI=;
        b=czNW84DX6cY+yVs/pwpa1BrTEzcOVrtnwMtkfLqT+0qsCcUg53SJR+X4RjRB6p+wDg
         onjT1c+4nRlSWkoxeAx4iEB0Env7rUYhnYyA5gSOpb4CnfsfphgcWzgkjv9XXXBY4fho
         od83Kj6b4y3U4oxRw6xM1pasbDjRoMzHIVCHSMxhOo1PMTtE77N36dUt9emmXrVMnsBw
         1l7Tkk1NWXTaRdDmoP3MLzD5dczqBXY2NWKClgiBFaAywX+NHrZ/7Fj3SPBCvyhwaASO
         pprfmmTx9ULDkJiK5CecYEphtVj1+1bb97tRtZeLhjWbtPCW/ZTIsDVa0at7gBUqpq9C
         Calw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739377694; x=1739982494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TZuDBz/MQSCI0W6Y1MIlb4k+WX79YX+OdPUXe7FESaI=;
        b=O1o2KyAPR0sHFd+veGhHN2gkJvyMx8HxA8jdwsAeYmRWZ+2dYvFwNLDG9A6vyvdLDj
         NB+kOptlKwN0d+zXrv7KZjHQxeL/OLor8aJEBhjPmP08NWRki08Miomxe9lVGDZXkWO5
         48vcC9syNGxdPNP/U0XBCcdG5iJXypRwMlQaBsVgmsqKO9CAJhtl/2Diq1PBc/2NRfvQ
         8SeK9pRLPb60tAQGOU5aegjhk7oCDlqNMBLF2jgw4iwQMztLFSHBbMSpznazvtkTbANy
         w7slU8npznIEegJib7/h8RZU/oCxoD2fvELpRpEYk4t4iHv6ROWyh4A7NonIEwrfHoQt
         po2Q==
X-Forwarded-Encrypted: i=1; AJvYcCU6btTqZVpUVjX8RVArUs6KwDlyT6uy8PMpHcyvQpROn0wm2MjkmNloeHGSEpYr5v0VoISGpMD316X/@vger.kernel.org
X-Gm-Message-State: AOJu0YzWM7dcd0eZglwhgaQacn0wqJ7kFzncTeSoh/SeStqlDYXnCA51
	z+9gLHKSFR4kWux77LwwGMrgeQrmBDKQUm86IgHQXaHToyN4TAIrP4t/39zCBLnP4gU5Fepv7Oq
	80tyzptUj7+HAssJFoiFF8tY29bfHFXU1wduigw==
X-Gm-Gg: ASbGncsb1ey0w7tNcn2u1tECkbJeF9GZARCABmd3lgKpR9mgwL3qTnTy8Om+zMg5PIm
	u6aoqSVuSMRVe/HS1ufP5aF49S/xQDr/aHWfnjQvLBHWTYGu1Sqrd1HWwXmlHHDwWZySni9Q92U
	S8/Tf5kEVO8bStTpBOE7GYEkslOqUv
X-Google-Smtp-Source: AGHT+IHxOU7el76O6ARJgH/qSyoLSVZhpVM8aMA7Z5L0zSG1UJuAQdeZ/CLEIaRjM80ZHRoBtF9ivf8u/8H5ppM7Ojg=
X-Received: by 2002:ac2:4886:0:b0:545:16a8:6a5d with SMTP id
 2adb3069b0e04-54516a86b7amr1230558e87.2.1739377693855; Wed, 12 Feb 2025
 08:28:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250212-kernel-upstreaming-add_gpio_support-v1-0-080e724a21f3@blaize.com>
 <20250212-kernel-upstreaming-add_gpio_support-v1-5-080e724a21f3@blaize.com>
 <9442a87b-ab61-40e3-bbf0-caae87c5731a@kernel.org> <259dd121-8c49-44f7-b8f6-e0b68ab88304@blaize.com>
In-Reply-To: <259dd121-8c49-44f7-b8f6-e0b68ab88304@blaize.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 12 Feb 2025 17:28:03 +0100
X-Gm-Features: AWEUYZkIVdRopbQJY-FCVehpC4ahYO-92VDY2yMNzSqT804kqps9s9wQ30KQZw8
Message-ID: <CAMRc=MehUWAsBO6YWvwOsexu0yj6S5-g_ydS8tdX12iA0KER=g@mail.gmail.com>
Subject: Re: [PATCH 5/5] arm64: defconfig: Add VeriSilicon GPIO driver
To: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	James Cowgill <james.cowgill@blaize.com>, Matt Redfearn <matthew.redfearn@blaize.com>, 
	Neil Jones <neil.jones@blaize.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 12, 2025 at 5:20=E2=80=AFPM Nikolaos Pasaloukos
<nikolaos.pasaloukos@blaize.com> wrote:
>
> On 12/02/2025 15:25, Krzysztof Kozlowski wrote:
>
> > On 12/02/2025 14:46, Nikolaos Pasaloukos wrote:
> >> Add support for VeriSilicon GPIO controller.
> > You enable not add support, but still the main question is: Why? Which
> > devices needs it? Why this cannot be a module?
>
> Hi Krzysztof,
>
> Thank you for your fast review and apologies for the typo. I forgot to
> mention on the commit message but I have mentioned in the cover letter
> that the driver is needed for the Blaize BLZP1600 CB2 board which is
> already supported on v6.14. I will fix the commit message on V2.
>
> This driver enables support (controls) for multiple peripherals on
> the board, like Ethernet for NFS boot, SD and eMMC to load modules from
> these media. Without this driver build in the kernel, it will be hard to
> mount a filesystem and load modules.
>

That's alright but typically you'd want to have something like:

default y if ARCH_BLAIZE

in the driver's Kconfig entry.

Bart

