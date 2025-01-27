Return-Path: <linux-gpio+bounces-15072-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE17A1DAC9
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Jan 2025 17:46:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9A883A72F0
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Jan 2025 16:45:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D81A57083E;
	Mon, 27 Jan 2025 16:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lb8Xx7FY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203A917548;
	Mon, 27 Jan 2025 16:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737996353; cv=none; b=L23JMjEM7SSfvII2zy6JIKP7D8cD2TRY5yZzB1WQdYcAN/6ikrRnkpMBchmTGgudkgTMc6IvQ0WlonQHc1K9mdg7/cG9nJFM0xTKYJgN5xrcI53qc/fMy6KB6AR4ALQc+d21pi2zA43HQqs97RY+VGiSfHfv31Kd1+Ahldf4z3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737996353; c=relaxed/simple;
	bh=4/XHECN9e2hApu7kgEwh13xOGLR5PQfL33AGv9tc84g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PRW9rLTzCLxgE6kMS/XqAWSGuysYV/XygTDe5AxGUP4Wi89hWA0vWUKqgwg28pNPK+R7/OlGKMsxoNmjKEC9Othx+dwsurZ6ZV0RSG5RYpL/XgHLlASNBHRWC8xSuXKypewTypYU5nGQ12M5qQjv9CWkIQiq9b9BVBddm90qt0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lb8Xx7FY; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e39779a268bso6873596276.1;
        Mon, 27 Jan 2025 08:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737996351; x=1738601151; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4/XHECN9e2hApu7kgEwh13xOGLR5PQfL33AGv9tc84g=;
        b=Lb8Xx7FYbqrRmsaprGrYuJkTk9M7uYjYIQrmPPMlh6Z1R6zNIjPGMDhvX8MWDzY/RQ
         pmbYfhUCBuKTVHOQn4xdN8AY07X6eLbYhhNTdCzlhz9hUlcjLrv9p5zfzllaYUw4vLhv
         8WSANqPh7Q4v0BoGw71mtjUTy+Cp/ef2CrM5mKrJW99ml1gDk4EvElBnRqDbJSecod5x
         KbdrCgCHG8n3RZrT9TnI7TcbJRfCu8hAeVo5eOwU7TRzobsffrU0zT3Tc4eTk2njf+iG
         i7Biz2h5C+aofRf6MsPARGoVzGoRLHUgXj1rjus2T1mHlKPIcBM0izgHz0xFjft7jtPM
         IkRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737996351; x=1738601151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4/XHECN9e2hApu7kgEwh13xOGLR5PQfL33AGv9tc84g=;
        b=Erm9hDGAW0xeZPPNi5LJPOXalWDCS9Cdv9YZPlqP9BxTjPNwjpPR30iQyW1TNbwXuC
         Kq0X4ZiMnCE5zkjBZXhZujWLVZQ2JTkZepT8bolNDiSeG51lLdg0GVYqUwLqI5CiJ2k3
         KDL8oYlW0Cr0ElgJKqckRanjxsT9J5XVQeXnXhgfMByZLFulobLsqVi4EmXJSl44ezq5
         Iu+JM1F3yvBaKtzvpTYEfn9rRIO+5oOqszNeCNn1aHQqpmoXVXmJb8Wo8XRthAmCQfCS
         1WIY/DEMVif3PgZq4mJSOf3IBOq4NUBoka90GTBIeSxuTffQBA2H4RZs91RkWh7bgvzA
         EwWg==
X-Forwarded-Encrypted: i=1; AJvYcCWUIzmNL2KfEoA6EGaPIJhoPvtNL6TAFyTaCDDvUDJDARJEgqS0HLmMOhGFb2TvYXCNllgpXtssxzSf@vger.kernel.org, AJvYcCWgI6ybGtzperrUelM/ozusP/Xo/TQQp27+qjPQO2C0lp68OqACdR3fFvpoFPLYhFJUZC324ABq9WwFuEzO@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd/ioTNDtzWdxKLoVRpCRo3tKPoLEOgmKkRSYs0xfMpqFrE5iM
	BGUt1r1D5GWXsJE+ycu2b5SCQSA2X/cF8TTw7OPezpeC2dtK9JP0nXEBA4s6tYt9Ump8Di6O34g
	AkjFKHIJcSLrGSqFaE6w+J/gg35s=
X-Gm-Gg: ASbGncvsGbOKoo5rmbeV0bhoZcNpaFOb3Yt5kOSckzwCCKsjYNsoaE5LecU8QmLDHQr
	xKqjBGir9ks677SIhJFmZnKRAgPcN8zFXoo0MhAIzd7Ze4TIXlPlVymikxx1S8FM=
X-Google-Smtp-Source: AGHT+IEMxmq7nPsKbBbyOkoHy04xTApNftdv7is2fl7rbj/+e/mRO6dtO0+sCV0o4ER/bMzcACyyKBsrHU3iSvkmVAg=
X-Received: by 2002:a05:6902:1544:b0:e58:1ef7:2470 with SMTP id
 3f1490d57ef6-e583c156a2bmr13389324276.20.1737996350966; Mon, 27 Jan 2025
 08:45:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <e407b7b58c966ee35e023618ad428a21f979e761.camel@alliedtelesis.co.nz>
 <20250113220221.13545-1-koute102030@gmail.com> <CAHp75VeLyacKo3rY5iyq+kZnLjEQsBN2eOJExHrqHuesaVyTQQ@mail.gmail.com>
 <CAHN=yabQB5jYDd9iQ7s1dMWTScRf3c_zuNtXL8U283+vvenfNA@mail.gmail.com>
 <CAHN=yaaZ3L23JbsQ+fugG-iXdtt9dOss0pe7yT5EG029nsfXFQ@mail.gmail.com> <CAHp75VdCwyJhYD9rtxf8H5mi5AfcPOhvSYx2MOqw3==3mnxoSg@mail.gmail.com>
In-Reply-To: <CAHp75VdCwyJhYD9rtxf8H5mi5AfcPOhvSYx2MOqw3==3mnxoSg@mail.gmail.com>
From: lakabd <lakabd.work@gmail.com>
Date: Mon, 27 Jan 2025 17:45:39 +0100
X-Gm-Features: AWEUYZkgkhNF6sjr5H7ygl6R9YFE0gg_jDBKswI5kb44RIRCvyVyITrIBIWFdhA
Message-ID: <CAHN=yaaYiyPOM6-T8_126N=rBdS-Qzf7_yAg=oWB_DxBsg6fuw@mail.gmail.com>
Subject: Re: [PATCH] gpio: pca953x: Improve interrupt support
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: mark.tomlinson@alliedtelesis.co.nz, brgl@bgdev.pl, 
	linus.walleij@linaro.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Abderrahim LAKBIR <abderrahim.lakbir@actia.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> On Mon, Jan 27, 2025 at 09:47:17AM +0200, Andy Shevchenko wrote:
> > On Tue, Jan 21, 2025 at 12:12=E2=80=AFPM lakabd <lakabd.work@gmail.com>=
 wrote:
> > > Le mar. 14 janv. 2025 =C3=A0 16:44, work work <lakabd.work@gmail.com>=
 a =C3=A9crit :
> > > > Le mar. 14 janv. 2025 =C3=A0 10:37, Andy Shevchenko
> > > > <andy.shevchenko@gmail.com> a =C3=A9crit :
> > > > > On Tue, Jan 14, 2025 at 12:03=E2=80=AFAM lakabd <lakabd.work@gmai=
l.com> wrote:
>
> ...
>
> Okay, I have read a lot the datasheet (PCAL9535A), and while Fig.12 shows
> an example of what happens in practice, neither the schematic on Fig.6 no=
r
> the description of the interrupt status register doesn't clarify this
> behaviour. The bottom line is that the latch helps only to keep the input=
 data
> for longer and doesn't anyhow affect the input change on another pin whil=
e
> servicing the one that asserts the interrupt. Basically what they should =
have
> said is that the interrupt status register snapshot is made on the very f=
irst
> event and doesn't reflect the actual status anymore in case more input ch=
anges
> are coming. Hence there is no practical use of the interrupt status regis=
ter.

Indeed, I came to the same conclusion i.e., if reading the interrupt
status register doesn't reset the interrupt line it is not practical
and can be considered a HW design flaw.

>
> Seems to me a good candidate for errata. Does anybody inform NXP about th=
is?
>
> Meanwhile looking into the code I'm wondering why we can't actually use
> just input port register data with the logic as for PCAL. Nonetheless thi=
s
> can be optimized later. I think Mark's patch is good enough as current fi=
x.
>

If we accept Mark's patch there will be no difference between PCA_PCAL
and regular chips in IRQ handling.
Looking at pca953x_irq_pending() the process for non-PCA_PCAL is quite
slower; there is one I2C read in addition, plus multiple bitmap
operations. I think that the solution I proposed at least helps in
keeping the leverage for PCA_PCAL chips.

--
Best Regards,
Abderrahim LAKBIR

