Return-Path: <linux-gpio+bounces-28865-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E82CDC7283F
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Nov 2025 08:10:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C87DA4EA4AE
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Nov 2025 07:02:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8FBB287258;
	Thu, 20 Nov 2025 07:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RuBBWntj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2330619992C
	for <linux-gpio@vger.kernel.org>; Thu, 20 Nov 2025 07:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763622147; cv=none; b=Ej46eqHa5b9li9VA5261x4rKD0z5Sw+5+PasiQ0EPf26jobN0xWMVNSHXp3relJGbpUTtgwCS2i9lepAUFbkOSqc32Qwi9O/VQbNEXdcfxdNez/H9fSuuZ9vOoDfGGTAv+69JIGl4QycpOsCsUMyB6k5CSaEgIAbHAVIBBaE1Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763622147; c=relaxed/simple;
	bh=FeRA2kTQ08WgIcIeI0fy+LW6nUxIdYMKBFF0bCrOYKE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZOxNzQGL0u083R/URxfVLzE/sTE5BuU60bJDjqqd0Pzw7cK7cmeEpBfTTYlf/mAqRBCf/8Q8ENQbsyZpEbM1CexEzJqOzS69OY3gXLZ8iW10v0mJ+LCko2QKj/jLdxCQTM2ydUrLKI426MhVjFgeSb+ISxbRyqT66U9xG/KV10Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RuBBWntj; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b73b24f1784so94735766b.0
        for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 23:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763622144; x=1764226944; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h66YPwiuusOoOHGuoiDE/UsCsZR1/DmojPL2kq1y5BU=;
        b=RuBBWntjrg8DioXZvOKEYAQfltSAB+H2V/pJEjEV8/Dwvy9nmj9+l/JtCxq1PJuVgc
         EwdDhkTLqPvPLJFlRpG0m4c4V9+xvWKvuPd4Gc3Ck+6k+t0MnJoakdYRKrHAXOAksTB4
         PQmOAups1G4IQ+xXbgxtGU05vyt3m0Z4U/zM71Z2bemXKxs3a/Tw2rEkJ/CWIRqo/HY6
         QmOXRIoUHIbz00fpYbasSV2mBDKxd3pyjK4GfZmMdg2Ob+XXbFBbE5pvdFeDbBKB6xZY
         htAOxk1fU4VR5XoR9YPTqwHXL2A21IWPWvGyZ7NGwU24SlaYFVHMaBL2t9NdLVPsHbSr
         NH7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763622144; x=1764226944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h66YPwiuusOoOHGuoiDE/UsCsZR1/DmojPL2kq1y5BU=;
        b=Rw4gh+QM2mHLd9aA8b2HXTGBo0Qnu5JbV0UvSx3nte7f26MuP8PR5gd6D1L8dwtbtw
         8g+VY9PN6i9bFdjiZ000wtKk/Or0EOlXztRwJGg2mQ8D8thOcCvjvscJi/+muwYLxnma
         bCXMUHtyxQ/Pfh0eHiStBsxsVGT2B23qo8IaNgukwKl0gD3JMdW0EUOcbg3wbked8lHO
         4sc/+KbBLV6O9wSltYSbAeZ2CIAjnf9vELqBvsBbiovWrurOdRBMC59vM97iGpr+NLPM
         QYnW5IYgl1GjGCELpg/9eIkiXmEs2qdmRi5z2Fm2D1POvzsC/EbLis9IkTA4plbUPg/B
         xIgA==
X-Forwarded-Encrypted: i=1; AJvYcCVODdk6taug52cZKqfKagwH+oTLMr7xl/eSzHE4WrTlnSKtuEdSG+HZ2JnWUvv/Z59TY+z+IQuFuCpY@vger.kernel.org
X-Gm-Message-State: AOJu0YyrQAyGpMnEqo8cQuMooPyEJAeSTX0hSoDT7BjLBElYjnBh+3VD
	YCJvYGB6RlsBR5pSJ5WuhsFoC8Ld4bnSK9NIRu/vewJNqnMpgi77cCfuO2u5oPUiQTpsgNQ8UKS
	FBxIUj7grWNntO5yQvhgfYeabpOu6nQg=
X-Gm-Gg: ASbGncsBZqXboH2R4LGle2E42sWf5wY8cQwPvbx6z27bLhVaUzkQdYlgqZf23flKEtZ
	1SI1wzzSlOtmeLv/JzFx3Qre3sgyzrNWtbW1DaTu1SNWSEqxjnwGK5d0tqanIAdf4Cf/XfK55sN
	0mIPxlwzvHea3fVX5T5im7bcTFtglAaN422zDZLB2KeBqxq7dYD/lj0EGgdle2ganvcnW1dYLMX
	W/AC8Zfzip3Yox5+mGLMnB/8IyVq/Py8zWJnGK9ksxEsGT1YyWONCAHcJsgu0VzesgpB6++0vSS
	BvAw3fcGvSSmAR8YDF5XJRKAxPN9kpbxYq85yn3hKzUyu35RX4xepsw0rZr5Szk/djtYem4=
X-Google-Smtp-Source: AGHT+IEk3RIdmZAd32vyrP20JestktT+itI+PPN3KJuXUupqYUfp4iURjkSs5UCODIk4JVUsGFSxVopuxLJmiq4qA3E=
X-Received: by 2002:a17:906:ee8d:b0:b70:d1ea:2748 with SMTP id
 a640c23a62f3a-b7657172ed1mr165753666b.11.1763622144146; Wed, 19 Nov 2025
 23:02:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251119163327.16306-1-jszhang@kernel.org> <20251119163327.16306-6-jszhang@kernel.org>
 <aR4BWLo4BdyKhnlI@smile.fi.intel.com> <aR5fwvGYqf1MAbq7@xhacker>
In-Reply-To: <aR5fwvGYqf1MAbq7@xhacker>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 20 Nov 2025 09:01:48 +0200
X-Gm-Features: AWmQ_blKOKHefxeqx726AC27OYdlPCxDej14EKybN8SCdR_1tmXYwtbtFauUs6U
Message-ID: <CAHp75VdW1JDPmFm2Vt=j20BKf7V+yOdoaQG=sBYKdL0OGj-Bzg@mail.gmail.com>
Subject: Re: [PATCH v4 05/15] gpio: pxa: Use modern PM macros
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

On Thu, Nov 20, 2025 at 2:42=E2=80=AFAM Jisheng Zhang <jszhang@kernel.org> =
wrote:
> On Wed, Nov 19, 2025 at 07:41:44PM +0200, Andy Shevchenko wrote:
> > On Thu, Nov 20, 2025 at 12:33:17AM +0800, Jisheng Zhang wrote:
> > > Use the modern PM macros for the suspend and resume functions to be
> > > automatically dropped by the compiler when CONFIG_PM or
> > > CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.
> > >
> > > This has the advantage of always compiling these functions in,
> > > independently of any Kconfig option. Thanks to that, bugs and other
> > > regressions are subsequently easier to catch.

...

> > >  static struct syscore_ops pxa_gpio_syscore_ops =3D {
> > > -   .suspend        =3D pxa_gpio_suspend,
> > > -   .resume         =3D pxa_gpio_resume,
> > > +   .suspend        =3D pm_ptr(pxa_gpio_suspend),
> > > +   .resume         =3D pm_ptr(pxa_gpio_resume),
> > >  };
> >
> > I believe this needs to be thoroughly checked and thought through as
> > this is *not* a dev_pm_ops.
>
> pm_ptr()/pm_sleep_ptr() is defined in pm.h, so I think we can make use
> of it for syscore_ops as well.
> E.g This patch makes use of pm_ptr() to optimize out .suspend/.resume whe=
n !PM
> while get in them when PM. Thus the same result can be acchieved between
> before and after this patch.

At bare minimum this should be mentioned in the commit message that
you were/are aware of the data type differences.

--=20
With Best Regards,
Andy Shevchenko

