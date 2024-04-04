Return-Path: <linux-gpio+bounces-5085-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA033898732
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Apr 2024 14:22:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 26555B259DA
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Apr 2024 12:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CF5D128378;
	Thu,  4 Apr 2024 12:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="CEQ+1Vah"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317AA84FDB
	for <linux-gpio@vger.kernel.org>; Thu,  4 Apr 2024 12:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712233235; cv=none; b=X3JgpiL2ABwcXf/o6mh5ASY9HlTCHrY7xBry97pLsa6HMZYUXbWkU2JTjpKnRJQSAbJA7+JOm7HMC0tpDuwxTGysfEGgM/Hj5+2dEo8924yzVE4bHpiPf2nNvArrrrjxTjltfuYcUcgCGFfb3UanEdH3mvKJIayAsqmpHp2E6z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712233235; c=relaxed/simple;
	bh=H3f5IYJ1QWgMCxp8QqRnm74odB6YZNBaYMyZ5mE9B8E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vADGXZAe8hrdA/odoBvNrLBCcEfCQarFzaMiua9/v6eISl+b/bdxd87JGHFyXP5hyzDrRYhBmZ1328RjS/wcLUXUrSFR6Jxz2SkHiu1IBpqIpxaKeUmh2XtfDke36wGkjWnDMXUFDwTu/I7XV33sXzRcbBwtTKgIBe3p/Sw4/BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=CEQ+1Vah; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-516d1c8dc79so62987e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 04 Apr 2024 05:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1712233231; x=1712838031; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DUbfvRaTdYI6FJXs+PUDsLKnWz2I5THsnSsWjhmBFSg=;
        b=CEQ+1VahHY1lnHONUcj2WZxOs6Qkp/iF0KkGR/SZ1mL2VsVRudtZAR8laVgyetoym0
         uD4x4KSK59RSy8umCfC5v4WN4lqKep7557O3xU7+jsDSCMlgCNvAqjIGOsgEGh5o1jgT
         7Hx1eBySF4pWlM/uClIfHE/7pz2sGTgc5cQoh1y7adb9/tg6e5vh8fgc3fgpLNpPLR3H
         YAR9V8qqF/33Kcs/P63IWE7bFNjbH+EV9PQw6NnJdLuv1s82+rDJhhJNfPP92enfetXa
         mSfcaw6Ar4jcFjcBfnt+JEijmLotomS2JCLUDF8KYwkyKhdrGp/jKan2j9lhOUd2La0v
         vXCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712233231; x=1712838031;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DUbfvRaTdYI6FJXs+PUDsLKnWz2I5THsnSsWjhmBFSg=;
        b=ZlbL7zmSu8kGT85ke+jBn68genFfk20cvTJCHIHbtU9EPjZ0H6jGxS9/eMPf+D3Op6
         i1OEw9uq4sFIMCIucmSeprh/ORvHjA2WWACzoj0wAk2o83aGlCIEuHTT5qP10DVuwKCX
         yBH8e/XFRF6r1ceeIPpqUVDRiQmkake6NIo3nI5VmVPHAojQnu/SLwZYXKKFu6KqXTdV
         kwfia7Q1C+MuwxzpPxWchoROA0s0v2QRg79aS9NgY0a13MiAjRP9mikZp6c3e+Zi4D2G
         pJmmx8CWKtEU5sO2beEqk0GT4Hq2wRo/HsoPG3kVAlKQdLFye4vF2Pv4xX5/ah4zINB0
         2m/A==
X-Forwarded-Encrypted: i=1; AJvYcCV6jeiaj0tdgmCAw/T9TU6zsXiRrXvaDBoUztT/WfqDRI0sfeZ4juY3yLeqIJwt8Lk9UDoj5Q2u6MrG9WcDhGFtbofC0Ba6o8Mm0g==
X-Gm-Message-State: AOJu0YwVjoCy9BLYDvgeHVskHl2MGXG8Pju0tPI+J/ve+MnMgmfV2o/u
	kkCUDQC37s4vtylZTFE8E5nUEJStOnHlDwtlF5p1WT0w890jHRVI6jBPDpuVQCb9arS11UyyMQJ
	JVraVkPxzAjs5S/b4aw1VxfWWOm5QGNzsgjRYWA==
X-Google-Smtp-Source: AGHT+IFXuY19yD67Vs0YeBOAYv5IS0ycYwSWTF9HWesGz64hK8qtn9PkV2yqkWQlXtSA4rvLO2hBr6dSTjjx6khY+oo=
X-Received: by 2002:a05:6512:60b:b0:515:d038:5548 with SMTP id
 b11-20020a056512060b00b00515d0385548mr1623137lfe.31.1712233231216; Thu, 04
 Apr 2024 05:20:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240403131518.61392-1-warthog618@gmail.com> <20240403131518.61392-2-warthog618@gmail.com>
 <CAMRc=Mf0DPN1-npNPQA=3ivQd-PMhf_ZAa6eSFjmQ26Y8_Gv=g@mail.gmail.com> <20240404105912.GA94230@rigel>
In-Reply-To: <20240404105912.GA94230@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 4 Apr 2024 14:20:20 +0200
Message-ID: <CAMRc=MeOW6mcYFR6GL5c0hyfH_ZvqmLqKFSk50jKa-d+4aa4iQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: cdev: fix missed label sanitizing in debounce_setup()
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linus.walleij@linaro.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 4, 2024 at 12:59=E2=80=AFPM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Thu, Apr 04, 2024 at 10:20:29AM +0200, Bartosz Golaszewski wrote:
> >
> > Now that I look at the actual patch, I don't really like it. We
> > introduce a bug just to fix it a commit later. Such things have been
> > frowned upon in the past.
> >
> > Let me shuffle the code a bit, I'll try to make it a bit more correct.
> >
>
> The debounce_setup() oversight bug is the more severe, so it makes more
> sense to me to fix it first.  But then I my preferred solution would be
> to pull the original patch and submit a corrected patch that merges all
> three, so no bugs, but I assume that isn't an option.
>

Nah, let's not needlessly rebase it. Most I can do is merge the two
but they are really functionally separate so I'd keep it as is in v2.

Bart

