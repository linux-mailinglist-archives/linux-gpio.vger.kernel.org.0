Return-Path: <linux-gpio+bounces-14662-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B25EA09324
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jan 2025 15:15:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8B6418898AE
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jan 2025 14:14:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 039D42101A6;
	Fri, 10 Jan 2025 14:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="qph8c4NQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B362101A7
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jan 2025 14:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736518460; cv=none; b=rb19kF8xJwdKmijpKkMvyLQouNLaAfhCpAHHFySzDtN/OGGXY8islqmRxpyH+STET6hx6oLO3sHAOQbT8n6d+CBSK4l6/DQKviiVeCW5ka9D1sZFz4Icldj0n2mR3j7GJeyXrWZeNbZ+ZVedZ1tJJVUU3jqkCshEjbkEVAOiL1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736518460; c=relaxed/simple;
	bh=8I3v7VZnwG3yJtmmte/m5ikbbyJCFVAui04XhklcZMc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WUAu9ekc9bKRXxWmuOPh0A/4dQwlIFF2IFFuV/Lm/kT2gUoICvB33oADqlxBxV5JogkpGaEhawv4daC5X/ENrPPjkKxl+2Y1h/kedZrlIIkxSzvxN/YVqeiEPXHFZFS8z90kqMILjWU4OFsABxqIHNC8VX/+Jv3lDQU/rSN4gys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=qph8c4NQ; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54025432becso2000249e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 10 Jan 2025 06:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1736518454; x=1737123254; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8I3v7VZnwG3yJtmmte/m5ikbbyJCFVAui04XhklcZMc=;
        b=qph8c4NQt5OeUCph4uxtvRBEEe4pFoNwju2yoDgV2Xee0MaVZeH7WPGOyNwK6ZVDHc
         RXRPKBaAE+oouTzBiC7xFQkluCBZhoSvucnGCaSGgjQo468YCXoOpPHE4fBIUp2kTRYp
         CXPGlHwJhOAA72gEezQju7O9W1uFA/jRcxzUZR+ANrRNsnYvhBM99FUtjdgt6WhDRFMz
         4QZeVnkRqfgngw5740CkMi314rEk95AluZwgxsYQtlE4dUcQSRC2m1fxTLXfqoTCxL88
         sOTQ0a9NfiCwQjpmQ+S5Z1NCChWMomFtd1yeA7EEhI/Eq/msiMN7MK3EIH/nPX7A48/j
         BYvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736518454; x=1737123254;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8I3v7VZnwG3yJtmmte/m5ikbbyJCFVAui04XhklcZMc=;
        b=RLxXM9ZI0V7567L2Pvn4eXwgjShssVnPKibPof8RmH6aKdJavs6fpBLXTkIVpiUKkl
         zDYGKkM+ZHzqVPn8UUN8cwXnT7eTLOypWZ2uCf5jlNi2KixduuImB3h8btNlvDtIOM2v
         sKO+6Iz5IuWviEBBhQJ6E46ce2VQXdVKLsJpA51Xt1PDW8/k4/bPPZjocj0ITcwkRsdF
         P6QZpm1KtlJP14lA9KtYKBhUaSWOqgiHL5Kr6JYYdufjHLtldyB7I4Gw6FkG91sWzjJB
         7vX/6dnSIGa8hpQGI7ARB+/cIu/NUDvpFCphZT9ybFXdm7WF5dNZSiaCr2iQXyk2FYyz
         UVaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYM5YwM6Ek5gsTAgAp/HQUM5Q9IukISakdDzzEMNvC3LsT3HopIpFuJLvDi9oXgVpFzxzOrd0Nuc0j@vger.kernel.org
X-Gm-Message-State: AOJu0YyNXRbpoSH8+MXZHWhfMO6dmg+ZwcDAmgNlT+OIEM0CoL1b2Ri2
	qun3xxZ9C9A+TRcT4wj4HUAGMpk+PLjjQi38TC2Qqs67PCoF7o8X45ZIfpuvpHXErv5mbhxEDRK
	y0J+pL7gqLcifZbqy/HTGztDUnEq36YkvUibIOg==
X-Gm-Gg: ASbGnctbKyKDO3j+93FMcxUsfSNOrMdm3J/SC/B+ssctDXHh2s+rcArn/NG5LyMxpJX
	tLuEFeqRcjouyb1Sqe4YLaDDNQLGwMOScvqDBmeOxK7hSFCqhblgEFdX77RWyjZ82u6ll
X-Google-Smtp-Source: AGHT+IF8d6s3rBxAFTGyuIns2Nn52yhlp9rng67dFXsb3y4itQ58MfWXZn3JMkdbszQnpF798VB4w9QdWTVvaXLyU80=
X-Received: by 2002:a05:6512:3082:b0:540:2122:fad7 with SMTP id
 2adb3069b0e04-542844f6933mr3281624e87.6.1736518454247; Fri, 10 Jan 2025
 06:14:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250110130025.55004-1-brgl@bgdev.pl> <de6b70f2-8fd6-4e2a-a6c1-466698be8a6b@prolan.hu>
 <CAMRc=MckJfEBK_ZUZ31hh7SMdbr4a-vZLtTGDCFttGK65wbXdA@mail.gmail.com> <CAMuHMdWhEZ0No8mXdymE8O8+rMCkD2SXAifZwReb1BbfYASOeQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWhEZ0No8mXdymE8O8+rMCkD2SXAifZwReb1BbfYASOeQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 10 Jan 2025 15:14:03 +0100
X-Gm-Features: AbW1kvZiIcaLZ1SjcnNuC6Spd3ghTXmzaPyefVUbdK3Rljxg68KY4qnj6f-FAQI
Message-ID: <CAMRc=Me+syDKW6sycGZ86rBJysaccsm3QUYd1+5cnfzRCo6P7A@mail.gmail.com>
Subject: Re: [PATCH 0/2] gpio: 74x164: use a compatible fallback and don't
 extend the driver
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, =?UTF-8?B?SiAuIE5ldXNjaMOkZmVy?= <j.ne@posteo.net>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 10, 2025 at 3:10=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Bartosz,
>
> On Fri, Jan 10, 2025 at 2:38=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
> > On Fri, Jan 10, 2025 at 2:32=E2=80=AFPM Cs=C3=B3k=C3=A1s Bence <csokas.=
bence@prolan.hu> wrote:
> > > On 2025. 01. 10. 14:00, Bartosz Golaszewski wrote:
> > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > >
> > > > There were other suggested solutions (for instance: just use the
> > > > existing compatible for the On Semi variant) but I figured the most
> > > > common approach is to use a fallback value for 100% compatible mode=
ls
> > > > and this is what Rob suggested as well.
> > > >
> > > > This reverts the driver change and makes the "onnn,74hc595a" compat=
ible
> > > > use "fairchild,74hc595" as fallback.
> > >
> > > Is there any reason to introduce a new compatible name at all? Does s=
ome
> > > pre-existing, widely-used DT blob use it in the wild already? If not,
> > > then I don't think it's necessary; for any new boards, their DT's
> > > authors should just use the pre-existing names.
> >
> > I don't have a strong opinion on this and will defer to DT maintainers
> > but a similar case I'm familiar with is the at24 EEPROM driver where
> > we've got lots of 1:1 compatible chips and we tend to add new
> > compatibles to DT bindings (with fallbacks to associated atmel models)
> > just for the sake of correct HW description in DTS.
>
> At24 EEPROMs differ from '595 shift registers in that they provide an
> API with multiple commands, and some commands or parameter bits may
> differ among different implementations (but usually these differences
> are called quirks).
>
> All '595 (I'm deliberately writing it like that) shift registers
> should be 100% compatible, modulo some electrical specifications
> (voltage levels, maximum speed, power consumption, ...).
>
> Interestingly, the driver is called gpio-74x164.c, while no '164
> compatible value is present. Most important difference is that the
> '164 lacks the output latch, which is used as chip-select with SPI[1].
>
> > > I'm especially against introducing a new, vendor-specific (On Semi, i=
n
> > > this case) name; if we really want to introduce a new compatible, at
> > > least make it as generic as possible, i.e. `generic,74x595`, or even
> > > `generic,spi-shift-register-output`.
> >
> > If anything, that would have to be the fallback that the driver knows.
> > The first string in the compatible property has to have an actual
> > vendor (I think, I'll let DT maintainers correct me).
>
> For the inverse operation (parallel in, serial out), there's just
> "pisosr-gpio".
>

Ok, I admit I don't know the correct next step. I'll wait for
Krzysztof, Rob or Conor to chime in (on the subject of representing
reality - the actual manufacturer - in DTS) and then possibly just
remove patches 1-2 from my tree.

Bartosz

