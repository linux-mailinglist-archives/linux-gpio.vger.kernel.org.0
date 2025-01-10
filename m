Return-Path: <linux-gpio+bounces-14653-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F14A09235
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jan 2025 14:38:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45EB23A3B30
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jan 2025 13:38:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D23620E309;
	Fri, 10 Jan 2025 13:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="nM+L+GcP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87E620DD6D
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jan 2025 13:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736516313; cv=none; b=IKyGH9lfM3QF2rktME3K+kdD5ss1TYRcN99H5zwxZ7tcuQCjIJr64LxLytcilZKp3B7UBCpuJ/FhsPuYPxXyno25ZuqBTvZosBcpOj2DK5rrAIt6d7I+b9ebjnWo2JpGUbv+rd+EGtRmvBKPRm30m8vnFgZ6rkzf6Y0CMSkz2Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736516313; c=relaxed/simple;
	bh=kzKpy1Sjp/SvWpHSpsmUjkEIaLMqjSa1M28GhpvJCz0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qrTj9mANkSqHMfOaYQ4tvcNUeU4NzYtUCjP+4OKpCeuYuxD/DiRdJRmhVmH0BJnEG5i/7adq6bhXsS2lwQGdx5ijsIjj/qumgHGPRu87giMpRV7DU+M+K0aprhcwjyqJ1qLoxPb9kYrrj/NLFUJuK1vPW7XkX5AUbLmsaF9Fm/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=nM+L+GcP; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54024aa9febso1961845e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 10 Jan 2025 05:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1736516310; x=1737121110; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JWsGafOO+0FzGsoN5Au+l4iQO+MU0TJ5sFUvbzRMqhg=;
        b=nM+L+GcPnMBNpBXnY9p4bMam2A7EUCrGisFHres477XdpLGwgRgu470MQB4tln/z74
         6XsE7REoc70Qnw2QWZSN7v6KC0520ULzYbr7fbaPTPCW9vb5jwrHLc2AfLBfFTke5fMC
         oQ0fyGxq0wnrNyQTkZU1Q/nsFsJv2sNhvQI89WnEiSVBNL6DyHs1RQR8/roJQyAbSyZD
         bPASWdlMDrk8JLiIHXAKoJ2wvDcD0+WEtbwoapPSza3eq7RCvFiZGzYN+AW80O+6VVCH
         yORK+F/cbXOye3gB7O0mu2W7WkoUcj6bgrlK0RyVj23cZ1+U4e//vkkFiO7j7Xg7Kgld
         BLtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736516310; x=1737121110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JWsGafOO+0FzGsoN5Au+l4iQO+MU0TJ5sFUvbzRMqhg=;
        b=nZwIfwPKvUuAvpyEeQynuwFXpb3tYJunLl2gsuiGAuLu5lwv/n6clhGsd2HlCau2Ls
         U7eCoZKmo3N1DWpXUB95DoP3VVI2xrq789jjy05xZqeLoPMbyWMjsvAhUA+HL0HmQzbi
         lPdNus00YV4jZVj9gk3xMsQStHX+F8ycGgC8XDYrSZCX24FsCmESvFYHFKjHFq+27RNG
         J4rVbb4rfLuKCAdakuc0fkRFisC34HDw5fMRTdZPrlt+r8037xVw0WkMfgE5Cjp1d1uo
         Lb3sHr4AlPX6s6QYOYO5NCdo2I5aGR57suQ8Upb4lWEuBI77T2Gs37hGSotS7Lov5Gm+
         Be4g==
X-Forwarded-Encrypted: i=1; AJvYcCUy0ZSYt9hXJnOf4h7IASnbG9OvhW7IDaHYK+fTVEZAu9WAFCOO9B/jBJ7UbhcVQ2O69jlVo+afgUxj@vger.kernel.org
X-Gm-Message-State: AOJu0YzKcjwanRkHbRQSXc7oKd3PoF6v7t7EUKfnjFgc7GeEWyCa6gSA
	GxuiCPRlP8ijEJ/LhcWAWP+AzJWHi3ols27ZAJlUv5hLm2NskJOh7IPmvkZ90wO/Nhqk25r/L5l
	HEg/LfV9sutOXPDrDJbuhZGjRhXJvveh4ZOn/gOohE/97HemK
X-Gm-Gg: ASbGncv9rXB63soc5kk8rhmOONKMFJZY7kka5aUBIaRLMoerCnwSHfZXvDHcRW/k4Xt
	1ORaFO6XqLB5/ciq2wTeHw4u+uel7P8lX9RLrRhMsIDDz+wETdtgJwE79vFgS3a4+8UUX
X-Google-Smtp-Source: AGHT+IFNqvdmFuTkcp6aH+pBfg7KRtBkZ8KfO6HRQp2EORO0iiILKbIm2reemzaUqQs4Vd3gqJXs3eaJO1hOKGwiADo=
X-Received: by 2002:ac2:4e0c:0:b0:542:2e04:e9b8 with SMTP id
 2adb3069b0e04-542845af12emr2933720e87.8.1736516309749; Fri, 10 Jan 2025
 05:38:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250110130025.55004-1-brgl@bgdev.pl> <de6b70f2-8fd6-4e2a-a6c1-466698be8a6b@prolan.hu>
In-Reply-To: <de6b70f2-8fd6-4e2a-a6c1-466698be8a6b@prolan.hu>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 10 Jan 2025 14:38:18 +0100
X-Gm-Features: AbW1kvYL0TyL-1cDsiHr5pCeW2-Sp93tIsM4Q28XJyxsK7hP_dwoKrlFKGssujo
Message-ID: <CAMRc=MckJfEBK_ZUZ31hh7SMdbr4a-vZLtTGDCFttGK65wbXdA@mail.gmail.com>
Subject: Re: [PATCH 0/2] gpio: 74x164: use a compatible fallback and don't
 extend the driver
To: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, =?UTF-8?B?SiAuIE5ldXNjaMOkZmVy?= <j.ne@posteo.net>, 
	"Geert Uytterhoeven via gmail . com" <geert@linux-m68k.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 10, 2025 at 2:32=E2=80=AFPM Cs=C3=B3k=C3=A1s Bence <csokas.benc=
e@prolan.hu> wrote:
>
> Hi,
>
> On 2025. 01. 10. 14:00, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > There were other suggested solutions (for instance: just use the
> > existing compatible for the On Semi variant) but I figured the most
> > common approach is to use a fallback value for 100% compatible models
> > and this is what Rob suggested as well.
> >
> > This reverts the driver change and makes the "onnn,74hc595a" compatible
> > use "fairchild,74hc595" as fallback.
>
> Is there any reason to introduce a new compatible name at all? Does some
> pre-existing, widely-used DT blob use it in the wild already? If not,
> then I don't think it's necessary; for any new boards, their DT's
> authors should just use the pre-existing names.
>

I don't have a strong opinion on this and will defer to DT maintainers
but a similar case I'm familiar with is the at24 EEPROM driver where
we've got lots of 1:1 compatible chips and we tend to add new
compatibles to DT bindings (with fallbacks to associated atmel models)
just for the sake of correct HW description in DTS.

> I'm especially against introducing a new, vendor-specific (On Semi, in
> this case) name; if we really want to introduce a new compatible, at
> least make it as generic as possible, i.e. `generic,74x595`, or even
> `generic,spi-shift-register-output`.
>

If anything, that would have to be the fallback that the driver knows.
The first string in the compatible property has to have an actual
vendor (I think, I'll let DT maintainers correct me).

Bart

> > Bartosz Golaszewski (2):
> >    Revert "gpio: 74x164: Add On Semi MC74HC595A compat"
> >    dt-bindings: gpio: fairchild,74hc595: use a fallback for Semi
> >      MC74HC595A
> >
> >   .../devicetree/bindings/gpio/fairchild,74hc595.yaml    | 10 ++++++---=
-
> >   drivers/gpio/gpio-74x164.c                             |  2 --
> >   2 files changed, 6 insertions(+), 6 deletions(-)
>
> Bence
>

