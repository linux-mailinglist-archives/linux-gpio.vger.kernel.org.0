Return-Path: <linux-gpio+bounces-14314-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A129FD5E3
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2024 17:17:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8027D3A28DB
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2024 16:17:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BE031F76B5;
	Fri, 27 Dec 2024 16:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uxDuwG3Q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946B15464E
	for <linux-gpio@vger.kernel.org>; Fri, 27 Dec 2024 16:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735316253; cv=none; b=e1KCUJaIyxuWHP5cJYKoFWtHciGEJcRYUshgTnLTEkPwAQEklIsfvKzRQv0uucGjIsUaO+0662XsLsbbEx112HoQpJ257NwHOywuLzuHyLEdHlZXVubfNx0jgKXhZISiuIkoHzR7vxn7M9QFm0yrqEmtthR6jpLfD8CEuzu3Ifg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735316253; c=relaxed/simple;
	bh=j4hO2aF42y/9l/AfT9xVgBVjby2APvfNVO5fytJbCn0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GC7Pgt18P5gg4+YwXFnjeqwvy+IzB25HDA1Zp6VvC6Ld6IPazfBoF6AjmOmWQWHc9Vcv1ya8v6sYaNUn8Ir3sgVaGIysSfvRE4GZ9p5Og3wGl4JGh0O5eUWJGzSzwjbDH3lNnnahGGpSyoFRUJ4A2YUbQBTULvS1QCz52unBotw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uxDuwG3Q; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5401bd6cdb7so8282886e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 27 Dec 2024 08:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735316249; x=1735921049; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j4hO2aF42y/9l/AfT9xVgBVjby2APvfNVO5fytJbCn0=;
        b=uxDuwG3Q2/KBvnNTXYE828gFGWIZwEQPb+4ASgG5K2StLwhz79VEn2Nu9c7A7Yj1f4
         JYcRb34UCLDpAqmgUXjx5gqFTgD+biZjfDS/t2FFQx6LEy+RamIZedCKDKc7GklNEQin
         sJSbbq9RBXvnxmSmLkgzhqBvZS8N/ZRqe3PrFmn7iGDoSKbSbv9Po9H6ogKTjqfDspia
         5/WgyAshfNqX6oTgXLCztdnMJacGiQgdYtR3tR9YDkFZKH+aPgvPbXTWMhSeZuft9nTr
         t7GSsJ4qkHoojzYVKZyebbGhWFEXJMuqsjemZuxtlyVRXcNQTa1v06jt3xG/nxFloNTt
         jPTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735316249; x=1735921049;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j4hO2aF42y/9l/AfT9xVgBVjby2APvfNVO5fytJbCn0=;
        b=PUFG13MH8GLS8bfvt2F9Jts44+1rlAP6KHt267nHM3KKljP9GStDzTqVD6ZHMTMZuU
         CFiE+nM9WxwYCUrCM2FfZkZU1PqeY0kaBB/WRxkQdlK4fdHtOmGXJdQKACEg9CptTkJG
         LYQzq27NXYKE/yaY0P63K4LreIwvI23PV8PFyIIY5NKtF+xTDjvhNp6R/4D5TYI4TCgj
         sC85L2vN0Qe9KSxhMHjdkQTuGzhLfK4amQRuuqBBhzBMkIi8ifqfDHjbrNm5ZTiHyKsn
         8lBcHfRUdwIwQbfU29mE3cZJ+9MpflVCfiIXLIg5xaMoFA1SD7fauiJHOL9d1199RC7j
         Jvyw==
X-Forwarded-Encrypted: i=1; AJvYcCVMfSFN2cXh0jJeFjM82NKcOiycycNEt/TyCU5SonGxu+fII8DvGABs3K+i5mN1rmTbOCJjw5DvbxVK@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4GTePiTW7lVlthCDjyWmQ4HLbmmVgiNejwHyKh+ogIU2m6T81
	jzMCb9w9W3tEsWozlnt8aux5sa7LxdpqmMB6xLovnG05VIo3HD0xLGH5P5z9uLAirhnc6kRv/EU
	ry81FQp1pwHFE5/3CZQ/Ls6VjTdaB3nFB2TWC0Q==
X-Gm-Gg: ASbGncuziBvJmk6sx7x8KVJ1D+nGZlwoLFFSP7hui49ptAV0RbfZn6MhWZeHGmNa4/y
	ou8q9QjbtZeFKBeGx0ff0KzZ2B5fpiC37bwbA
X-Google-Smtp-Source: AGHT+IG85zWFKSuD1X54JFqeOEX2n0RtyYlC6Vmm5DBS3P1DQ/HFDw7z6GsAkmCJZbtSzsjnBieipxx8ESIFcIDCunI=
X-Received: by 2002:a05:6512:ba8:b0:542:28dd:6b7a with SMTP id
 2adb3069b0e04-5422952e7fdmr6285806e87.13.1735316248790; Fri, 27 Dec 2024
 08:17:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241207223335.17535-1-kylehendrydev@gmail.com> <20241224103645.1709996-1-noltari@gmail.com>
In-Reply-To: <20241224103645.1709996-1-noltari@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 27 Dec 2024 17:17:17 +0100
Message-ID: <CACRpkdb=kD=sOeUskOZEYHJGbEaDRNyQzyHWGx=dAs7HYE+31Q@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: bcm63268: add gpio function
To: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: kylehendrydev@gmail.com, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, "open list:MIPS" <linux-mips@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 24, 2024 at 11:36=E2=80=AFAM =C3=81lvaro Fern=C3=A1ndez Rojas
<noltari@gmail.com> wrote:

> From: Kyle Hendry <kylehendrydev@gmail.com>
>
> There is no guarantee that the bootloader will leave the pin configuratio=
n
> in a known default state, so pinctrl needs to be explicitly set in some
> cases. This patch adds a gpio function for drivers that need it, i.e.
> gpio-leds.
>
> Signed-off-by: Kyle Hendry <kylehendrydev@gmail.com>
> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>

This looks right to me, but can we get some review from some
of the Broadcom people? (Hm it's MIPS so I guess that means
Florian.)

Yours,
Linus Walleij

