Return-Path: <linux-gpio+bounces-28798-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 55623C70127
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 17:27:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 171EC3A034D
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 16:12:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDB3836E54F;
	Wed, 19 Nov 2025 16:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F5i8edWn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97012327C1B
	for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 16:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763568757; cv=none; b=kLLWHUKtJ6dPZSX4T8kVpNN0a4e90ZSt2Cs6APZQBCwkWiicFt28yK9yA7DFue9zT3OS9TPuBY3PlUhHbIsYqSWZVA9dD6mTr1rpTOf2Iz61M9j3+CdEfxAyt+WgFY7rKYVMCwfUi3GkDrfKnjLg51QQS18G3VPaFrOj7VOWQZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763568757; c=relaxed/simple;
	bh=9Gr2VQ71su53ohKJqUPje0t7RDNtY+bRSBclS5p7Zgg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UWCWahAYdVFKxWPf2DYNFN/MEPi0c3SxMsqCdOf048i4f3Z36OEr0j5cgoQx97av3WHcHMVJH4BEGBWIEps4s9noLIEXEvmu8kb5YeBgk26o4mO1bYHqxeFWIrjgiolum0YJPb3WIyn/g1BkHkvmJTN/HUbxDYNDanQC2TRD+2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F5i8edWn; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b736d883ac4so956494766b.2
        for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 08:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763568750; x=1764173550; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ns4j4RIwbKPHEpeqvUPwTPGh7I+0wclJE3dPKxiT3aU=;
        b=F5i8edWnwtV7ObY8k/bavpj9AUFPJg8hjUAJSKXV1D7puh4Ae4MDEcIcY/SC+i/GMo
         ox2OuGe+Kbmd69y0/fBNoNlWmvarCEyToV8gzxFPghrKjI3q8kBq6ExvcfXYbK2BlFMT
         hFCCfKABpfQECfi0m9z8FRaDvZQQAnz8lRPxYN4521SXOJciCm8EZdCZk77kNmqiNxaM
         ujGrnKEDJHK+kIdP6zJFxy9Jpvv4xquYfTPYLe08tZNgxjiG9HRoJuwB5qixYqBYOqNc
         FfwjDwQ4AJtyz+fC8JH+pOU52UjT80OhgcTntRvvKV4jK5ISYG9q4VxIXaJI3s+hfJ7F
         lyrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763568750; x=1764173550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ns4j4RIwbKPHEpeqvUPwTPGh7I+0wclJE3dPKxiT3aU=;
        b=baHmCAQ8EBojzX3c9So4Hd974HhmWo4mv91FatmO5ZSm22EG64JcsI0rXMEygZjXM9
         kYwOS1eu9yFdBCsQuHNouJw7OqZ+Rp5rOD7nG+D86uBUpO4HqVTsAZToZpX0zB0orANU
         bpfeF0TEXEV9C+LfYzrxckWBuC6dVgCDNS3jENO7A/D24C90BsdQpZgsrDfMj4QZ/yv7
         RegYdCr/JDtUNt4tDg+vi/KJq2vh92KrislBVMHNM+iejP4JrlaGIYJbyJUJqhgwLoBd
         RNWUbeqMc8Ch//4eEuyikGof59J6PWKM4LR98WTmXVx1cds9Mp0POIoA+ELwaY3M0mKs
         DgCg==
X-Forwarded-Encrypted: i=1; AJvYcCWCTZUVMD6W0PwVe9OLGPrM9ow3i+iM8fRiw7uc7ZXHW83pyuEVv1wHmGYdlp6rN2rHHJTXdbyUmQXu@vger.kernel.org
X-Gm-Message-State: AOJu0YwiH/bMROMUTM+zpu3PfxNUfgXGTcxXhmPwvhwPs/efEzRRS9Qs
	ZabWSmkYbwZRI/gZ/yKeXbd3EQGPJn8J54OlnIf1dO+cINKPrHPykIZ7b1ShClbuXHLyCjAFafe
	i/d3t4nYXpHO9lQ7lTWllmbSzLio+k1Q=
X-Gm-Gg: ASbGncs4At8t9t+OrjvumuiEO5M6I5LJ+wBbYMNKkjLv4sZTvLWMO9ssQuoUppvopRe
	Kg9F6We8IlBdu7ZUdlF7AEA/7cWORI37pe/s6lnDvpuYKVXelTIFeL0G/xugYz08LseL16PtqkK
	ZCa66NYTXCxT8rITM7lH2gFzNF4z7DIzMijxFa6CPdhK+rz2WNxOsre+0skVjzgv/94egpzR58D
	5gPB45H1Q9HwbY5CoMnqH/eEvuNxeiYr8XxqNniUlmBlrw2R5pyVPqqL6qmL7DQGDd2ndnSH0fW
	ulgY7e2uottnyLZ+FutCbgVLcps8xU6qATKRxxxkpCD8kX7706LzywXQkIzw1FiBivZKz06UHZ4
	/+S8/DA==
X-Google-Smtp-Source: AGHT+IEXnOnIcDL+WQPyI15HzjNbUj9gMlbunsDk2m6BU1IUUvprig6gWCBeiXxf00hfMEvBu2U3Puz8te32xqRBXh4=
X-Received: by 2002:a17:907:97d5:b0:b73:b05b:1f9c with SMTP id
 a640c23a62f3a-b73b05b204dmr1059457366b.14.1763568750356; Wed, 19 Nov 2025
 08:12:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251119144327.13345-1-jszhang@kernel.org> <20251119144327.13345-2-jszhang@kernel.org>
 <aR3lg0aNaoT-_7SM@smile.fi.intel.com> <aR3niy7_jwzQSJ33@xhacker>
In-Reply-To: <aR3niy7_jwzQSJ33@xhacker>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 19 Nov 2025 18:11:53 +0200
X-Gm-Features: AWmQ_bnLpUh6jMo81CBBtcjYva5xbsqWCBG913Ja6bqzpLYkudT9viHeiSVVbZs
Message-ID: <CAHp75VcLjknMLZ60b7mUPqL2miT_x8EexQPhCFueua5vDg6uxg@mail.gmail.com>
Subject: Re: [PATCH v3 01/15] gpio: dwapb: Use modern PM macros
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Doug Berger <opendmb@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Andy Shevchenko <andy@kernel.org>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, 
	Michal Simek <michal.simek@amd.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 6:09=E2=80=AFPM Jisheng Zhang <jszhang@kernel.org> =
wrote:
> On Wed, Nov 19, 2025 at 05:42:59PM +0200, Andy Shevchenko wrote:
> > On Wed, Nov 19, 2025 at 10:43:13PM +0800, Jisheng Zhang wrote:

...

> > > -#ifdef CONFIG_PM_SLEEP
> > >     struct dwapb_context    *ctx;
> > > -#endif
> >
> > But why this? For the PM_SLEEP=3Dn cases it will give an unrequested ov=
erhead.
>
> the pm_ptr() and pm_sleep_ptr() can optimize out the PM related
> functions, but those functions are still compiled, so if we keep the
> #ifdef, there will be build errors.

Is this an expectation or you can share the error, please?


--=20
With Best Regards,
Andy Shevchenko

