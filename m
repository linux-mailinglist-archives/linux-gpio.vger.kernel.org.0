Return-Path: <linux-gpio+bounces-27404-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1BABF74DB
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 17:24:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35381467765
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 15:24:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0863342C91;
	Tue, 21 Oct 2025 15:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="EWkGTyCn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050F4342177
	for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2025 15:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761060228; cv=none; b=ZBreCxz0dj2Tl7vqbsulSQ5UTTo7JC+7t3wPnR/xkqaheXsTbo3K0PfKpcJS8DAHfXh0jp9AsjSSXR1AzXc9eOVWzmkHkSirjLxwvXRLUbY14zbaAQ5GnUG1m+4Xp8wynLhCY7Dgo7uv9hLcjNUecnKfAivC/hpiy+xP+8GD0dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761060228; c=relaxed/simple;
	bh=LranUERPcQFVX4C3LPo4yvi6i4EnvwENiJ5DOAMZJo4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hSHdQW3PPQRqx0m30vu/zpuuRPoPUbqE1nsK4anug70RKW5rDj17DdI1YGP5nczkBCusQSszTDWQQMVJxwqnCCEVaMDTD25L7CeuciW2Qp5z083osdr2T1J3DUAycIeG99FxqBmnGDQ/aTDuH4ZkFL1CJCEP7vf7pRv0K8jOYNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=EWkGTyCn; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-37777912136so55743081fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2025 08:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761060225; x=1761665025; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LranUERPcQFVX4C3LPo4yvi6i4EnvwENiJ5DOAMZJo4=;
        b=EWkGTyCn6lVnAVAl5gMahiqmt0QU9adOiznVYX4MZed7J6op4KygdkGeZ9kbt55rKu
         QaLNRJ1b7+RBmZblY93o+ZIB2E1gVS5K6mA8RXI66wQeeJAqWpsM74OR79qC80p1It+i
         9Eolzy65Bn4vQ0zf+EYtFOkq0sSep6IoNgKgUcXeq9P/RfbcEDCEg/i4ae9GXZLvzc74
         wctnGjw4GT8hXGUPOsPApN4c9QMODYvbvzpqDE9jgo9lfmH4dTEcgDYygXlCTyA0Ervm
         Ut910gGBRTu0r1HXcLyDUJEtnmOuvj0I9LqlsqmwOSg+9sc47iLAAmx445MMsxKpwdx9
         Z6Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761060225; x=1761665025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LranUERPcQFVX4C3LPo4yvi6i4EnvwENiJ5DOAMZJo4=;
        b=q+5MKkUGmpYqjMZRpPh6PhrqxOLVZ5Z3ycq9TcZSQKXidPslEqqI6qZRfZK6iQx5NQ
         qzsChCxNW4HrLeocIce2oA4CDTAv4DRLQW7PxUVHnmqKLCEPpFX0H7kW5SQwXkFCIr6s
         aZf6o3MZJOhmWSlP4SfG6dQksI4uRrtkOfFb6yuD6FhLw8ZNNf08L5INwTYWdxaOy9sl
         EK7UqR534iGItc4JBbXT62AQQDAC66o2gtUiiW3UfiHEzkcMVPK/eUG97MOd/wVowq8Q
         +tiZUmzA/9oVcG6tS/IZAWLNGj1dOz4syTmPF/hPn33Rq1WtPiXyaE/W2BphYYv16kBy
         +FLw==
X-Forwarded-Encrypted: i=1; AJvYcCWoTV3XbDijk29aEHEu26y33WirRSNSuz9N1uVB5/JTpblI/F0zVjT4Om+jnP5GpG27aPAJn/owqpXJ@vger.kernel.org
X-Gm-Message-State: AOJu0YybPJVCgZ5FA+hitvNwkAuwe4mOd286oB0l9rdzb0tGMLL1mrLl
	gbATob0gpiMET4w7wqog8evKRis5KHQnmpdbt450JLHETyCD7p2WOSrsIwXoTfcIb20t3SgLAD1
	/c68W5wbN6tLtmLK9DIovIFhwjvRKjKNpLgFBTOmaVw==
X-Gm-Gg: ASbGncsS/3PSpFo1rN8dTHN5eDXLXVyMEBx5GEcuERYdCx78bGekO4Uzw7S8fNLFLPH
	TCRhGHjlhV28CkIt63Mz/ARzzvOz/tFP1GZvWb4njQY04ILiewdPtvihkTXt1yXaboP/PFqw5Aa
	D0aVChF0wUtPEp7MQk3YmNbpsd1uVvZFtIZHYFy2Mk8vir+EJT37plB6t1TOU8Sf5FI1CKaJ8IT
	t+QGxdpXi+g3LD8sZNW45NploU8Tyyq/7kH1hh4RBcnU8XPhstS2LI+HerdT//9sIf8RNmlZr3f
	0OkgR34H+2TOwhYgRYVjTI/GZKY=
X-Google-Smtp-Source: AGHT+IGgc9KeMCqsp0M9361FU4xtXnSdpuEq/15+MfSP4MmOYfHv0qjJU2f6NUqRnqHECXUrME8KkqIWvVWDw8pMiGQ=
X-Received: by 2002:a2e:b914:0:b0:356:839:56f with SMTP id 38308e7fff4ca-377979419dfmr34052621fa.20.1761060225159;
 Tue, 21 Oct 2025 08:23:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251006-reset-gpios-swnodes-v1-0-6d3325b9af42@linaro.org>
 <20251006-reset-gpios-swnodes-v1-7-6d3325b9af42@linaro.org>
 <95bbec130437846d4b902ce4161ccf0f33c26c59.camel@pengutronix.de>
 <CAMRc=Md_-mO=HqfncD-vJS6XzPJ+aTcBjSjtkxLH_h1=pNjCcg@mail.gmail.com>
 <075a4511a6ae4b047599757d41b559c6b7cf9d0f.camel@pengutronix.de>
 <CAMRc=Md4DUSuwv07EuBVDJbY1Uzezq+TONxyCvLtOHD=iFXrcQ@mail.gmail.com>
 <050d74d7619bdfdf5ca81d8914a2a8836a0d4e2e.camel@pengutronix.de>
 <CAMRc=MfPqRLFHPW988oMry7vVoTgtQHrxxND4=nr_40dOa5owg@mail.gmail.com>
 <aPeexuA1nu-7Asws@smile.fi.intel.com> <aPegyVyONkPWRgi9@smile.fi.intel.com>
In-Reply-To: <aPegyVyONkPWRgi9@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 21 Oct 2025 17:23:33 +0200
X-Gm-Features: AS18NWBXrVCB06tyTpBmVdEBjowWLVzdXt71bqZY_QqEoblKCiav8MRbM9cW_iY
Message-ID: <CAMRc=McPpFEmg7dpfiYWJaPR4yMynOaU5Hp37E7rTzWSCNxBuA@mail.gmail.com>
Subject: Re: [PATCH 7/9] reset: make the provider of reset-gpios the parent of
 the reset device
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 21, 2025 at 5:03=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Oct 21, 2025 at 05:55:02PM +0300, Andy Shevchenko wrote:
> > On Tue, Oct 21, 2025 at 11:39:41AM +0200, Bartosz Golaszewski wrote:
> > > On Tue, Oct 21, 2025 at 11:31=E2=80=AFAM Philipp Zabel <p.zabel@pengu=
tronix.de> wrote:
> > > > On Di, 2025-10-21 at 11:27 +0200, Bartosz Golaszewski wrote:
>
> [...]
>
> > > > No need to convert all existing drivers right away, but I'd like to=
 see
> > > > a user that benefits from the conversion.
> > > >
> > >
> > > The first obvious user will be the reset-gpio driver which will see
> > > its core code simplified as we won't need to cast between OF and
> > > fwnodes.
> >
> > +1 to Bart's work. reset-gpio in current form is useless in all my case=
s
> > (it's OF-centric in 2025! We should not do that in a new code).
> >
> > More over, conversion to reset-gpio from open coded GPIO APIs is a clea=
r
> > regression and I want to NAK all those changes (if any already done) fo=
r
> > the discrete components that may be used outside of certainly OF-only n=
iche of
> > the platforms.
>
> To be clear, the conversion that's done while reset-gpio is kept OF-centr=
ic.
> I'm in favour of using it, but we need to make it agnostic.
>

As of now, the whole reset framework is completely OF-centric, I don't
know what good blocking any such conversions would bring? I intend to
convert the reset core but not individual drivers.

Bart

