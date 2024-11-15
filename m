Return-Path: <linux-gpio+bounces-13044-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C006C9CDDEB
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Nov 2024 12:59:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85F7D282D2A
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Nov 2024 11:59:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65CA31B983E;
	Fri, 15 Nov 2024 11:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="cZvkPU1F"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509D73BB22
	for <linux-gpio@vger.kernel.org>; Fri, 15 Nov 2024 11:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731671944; cv=none; b=tJ+E/hWVIO1Re+GArdyCf2LXmtCBt3OwHi0RKiGVc22Hx9WBnI3Z9ISsLEfbwt9F5cYrDsQ/s81bZwpgBZV1SYxg7P/bMjqfhF8zkK7O6xeAECOZxEsAMjLrezQMvMrjbO8osrYwtoRQgYezvk1LHMXed4mkvy8YYg96OFJCPj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731671944; c=relaxed/simple;
	bh=HTGuyqghFMpQLRstslb57s6VUDSp1VzcCf57gtfUdOA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y+VXOIXLgDOHX04UPo95YxKzrOZomzxnMP7wjwePumAeP0+ux3S6pZF9Yvw0ti+79ydb1Obsy2kMkstVGAZgdhEw94DqWPQEOMp6e19NvAPyqQz8PgkGmgFBX2sAsQP1N5asPzv9+c6SKdkqeTUzrqR9mb44s20C3AKsQ6veYKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=cZvkPU1F; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ff550d37a6so17697171fa.0
        for <linux-gpio@vger.kernel.org>; Fri, 15 Nov 2024 03:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1731671940; x=1732276740; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EXwHEadxWmCoxLkoyLtprE1vuyARVAjxnpelz5IPf9Y=;
        b=cZvkPU1FRN0JGdn1zTkNB5pY0cZE9x5uqvH+miAewaZ69n2gjpjzh4a8XifDO8ERIx
         ADrmXOWyieSFa7Nr/13hRw1Ur1dfBuix1nYWNNLK22z6EqpoJvmcGNV7sp0ClfKb/WgL
         AgYngDJvCD9nJWy9cLjS30W8+C0VpXDx6MOAjspW32zjmMa/RKwSs43UmV5ajGIK35jj
         Z2Belk8hFVaf/z8AmnJQ8fdhh9p9jVi9npgKiZROteaM/zRxLQP6iU+Sy31M5tDjWsRy
         Be0NNxdep34p8v96mn3dzZ6b/JLCDAucHRRF1wIO7eyNA3lWqoW/WzrELfyJbOE6Zgxa
         VgiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731671940; x=1732276740;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EXwHEadxWmCoxLkoyLtprE1vuyARVAjxnpelz5IPf9Y=;
        b=hax0T1oblyRcxg50tjBKO6w7583i5xGX4wSVqpZwJx7Def69KjGsgkQOJ3Ha7Z6pOS
         O3O8vRcZKArqV5lponDYCO36k/00FEZuf8a9RA97DP1Om18PMhdg4FqlZOcJ3Z9Ny1tJ
         JPhB+SWmpWMnp7UyPCmc4EeMbh7mw2j4oNU6JOe4rcNdz0tX8SliokKZMKCbktCOr1E2
         cZvBWr0NigcwelWu42cgoUD5/q4ZcORQQEKbWpGia5K32w+jIoU7n78mzcTyqjj4T0mV
         sThK4uZjX3vB/tsts4WMtNM1aqTpf41c8e5eSGv4fMBiwhKeka8AxIvbX7Mgcoe82JNl
         6Tjg==
X-Forwarded-Encrypted: i=1; AJvYcCUg2e6eWnr6XpkSUUeafm21RWQG0av2wO57myFNREvKPF9LlbzbsApIdxkgwhF3PkWbJ2xKEwnWvsK6@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ/rA6ZkP7Bvk1uDCTddQxh8s4eu2/A8tymCelAdq1lpFP9Pva
	Li4CGy+MTkrbTf0jHQe9xXi+qW4Y8LxMj17iY56sQ8K+HYYjmHj+vVX8ZRWdKUYySlujqFhPbc4
	nZXreOXetpCzChjPok8V/C9+PRUwxkDSIgL2OdQ==
X-Google-Smtp-Source: AGHT+IF0nsR2k8u6MoTlNgkeSprRNolHD2YJ9vJ829LyOHGCWai/LvnLaLM3UhO2dd/h8Cvtta4ugz2CwMMNB/wzaxA=
X-Received: by 2002:a05:651c:2212:b0:2ef:21b3:cdef with SMTP id
 38308e7fff4ca-2ff609a6c1cmr15902051fa.25.1731671940255; Fri, 15 Nov 2024
 03:59:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241112201659.16785-1-surajsonawane0215@gmail.com>
 <ZzcWGJxqMJVYd4Tp@black.fi.intel.com> <f9daa71f-cba7-4086-a523-a2e6aa526ff3@stanley.mountain>
In-Reply-To: <f9daa71f-cba7-4086-a523-a2e6aa526ff3@stanley.mountain>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 15 Nov 2024 12:58:48 +0100
Message-ID: <CAMRc=MfuC8rfag-8vxFqJ=qsXzsTpoBfvP+xWS9+rBdj0H0epQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: gpio-exar: replace division condition with direct comparison
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Suraj Sonawane <surajsonawane0215@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 15, 2024 at 12:55=E2=80=AFPM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:
>
> Uh, I had to think back...  I had forgotten that I actually published tha=
t
> check.  I can unpublish it.
>
> I wrote it based on a real issue, and then when I looked at the warnings =
quite
> a few places wrote code like "if (x / 4)" where they had intended to writ=
e if
> if ((x % 4) =3D=3D 0).  So it seemed like a good idea.
>
> But in the two years since I published the warning, it has mostly been fa=
lse
> positives.
>
> regards,
> dan carpenter
>

Ok, I dropped this patch from my queue. I typically trust smatch so I
picked it up without giving it much thought.

Bart

