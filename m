Return-Path: <linux-gpio+bounces-7568-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F06E290F8E3
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jun 2024 00:15:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 54446B22955
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Jun 2024 22:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1C177F7D3;
	Wed, 19 Jun 2024 22:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V3XGt1WT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42CD74068
	for <linux-gpio@vger.kernel.org>; Wed, 19 Jun 2024 22:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718835295; cv=none; b=H3OpAz1zLKK/D7ReApqbJnz0PAd4OWRZaU7tgE+a+iGLwOJrxMM7YFiFL+AzLOV8jKnnj2U8DyZwVF0zPXS5oc+vz0njr4TS2nlzSb8xj13WbmRr+qcQq0rUI3ZOOPcW7xFRXjK4m88vuCz9aakPVDWVReZ/lNX8aCVdFLVGxps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718835295; c=relaxed/simple;
	bh=dj6Nsz28vNju1uQAVmnbRM3gkhFQ28vgZ/khAr1X4iQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F3FCxvKJDli54FBRMisEz0aAO5ngfxy+XbRBK3VuZhITINq2lRL120tjexqC9cNvwlTFhkunhYgE6d517clZqt0BMzJr4cL7ckhZT5FvorKv/F/IGrcGItYyfRQqsuT7DGlkQqw7JW3OFlTrhKibvJ4wv6He00zcWwIit3wBKXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V3XGt1WT; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52c8342af5eso264509e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 19 Jun 2024 15:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718835292; x=1719440092; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dj6Nsz28vNju1uQAVmnbRM3gkhFQ28vgZ/khAr1X4iQ=;
        b=V3XGt1WT0eKKhJh93U5rwj9XhS/whXls82QEdnYXCJ3zw5U9CtRyXrAGEEKhFoQ5GY
         285QSx4VqgwogkWU7cJyBDxLVYJ29h+ngAyPxKK4a1xaGwCPzW0fu/aOtCD8+SMtV2Yw
         pYk1IVO8MNBgUwy900tixNEHjuCnQ0Xs6dXU3Oubx/YWfIiZEIA4XtXvtNR7ENcILy5X
         yBl69ie151xENuaurXvQp/Lg+5Rq1u605YL8OBvHYbmdk9Kn4M0cjOyr2EVMlmXoNkG6
         Y9/nkLS6eFc7Xiw6cPUQ5et9F71m+Iyw35K939FpduliTE5Z0io9a/+6ChL9U5o3c0iA
         102Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718835292; x=1719440092;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dj6Nsz28vNju1uQAVmnbRM3gkhFQ28vgZ/khAr1X4iQ=;
        b=BNTxlIakJPbke6gQEmckxfVgZK7Xu8QUCwegp00GyjcG2nqVuHfL7OI05dXIQG3xpY
         ZEVt9bF/wINDerh1TfMuv/JVYWmUOT2jp/ya5iGdBvq6VOu5JOqfS5Sh8ffHnmrgXkmw
         Tk8DEuFo7iRJxaKzGU0G9TUFr+1s9mwNSkiuaNAqhKRLwoP7Y4PB491AGcdYFbQIdBJW
         +QTNFTLWY+tz7TPJ8bCxl0m370JWXWRuNHFRfC5AGlXWGFmalrVI/YCCa10b2z9vKLDQ
         LD14VM5iVDAtUlG9KCu1N0wHmBY2EXvtpACoAAEv7jhgzlTMIQoW6wVRXgRH+bj2Rp8n
         O3VQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLdvkGnYnrpOx0IkZXRePjNg2w9XBM6DZ3UHATFPwYUo6lCiw7SedExrP6gADVsTW0nV4rkAnZtsL/ZWW21OfvyMbwQ8uYa2lcjw==
X-Gm-Message-State: AOJu0YxAnV+azEFadOQuk5/NA5UVnjxq8XMB+9jWOgFMIW140ppFe8uK
	kYiFwc0MgaOjm4lH07tWp5oXFe1Fgh/h3RwvaUGXxpM1KNzTOMEt09SMM84G+n6x5iqv1sh2NTA
	8vD1tf9Ww6/xd+k4g4MrDwNKTIgI=
X-Google-Smtp-Source: AGHT+IFtKo+rjhbJeSNhMWzchpB59htKhNsvAbsq2onNPY72PiWHfP5yvSg4G2ex+5ZHtcpf2RBVaOIF4cIQvCgUWJ8=
X-Received: by 2002:a19:f017:0:b0:52c:81b2:ad2a with SMTP id
 2adb3069b0e04-52ccaa32dd1mr2107583e87.24.1718835291339; Wed, 19 Jun 2024
 15:14:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFNQBQzOZhOns6EfO9XJP3f=e0h8E=PBVxFxaC3QZsbBqiRh0A@mail.gmail.com>
 <CAHp75VfGW8by7UW04x7ciqQnVPGL_nOKHrEn7vhb+WC40pWm3w@mail.gmail.com> <CAFNQBQyg-oR+RZVCWnGCLRC922ZET0AN-44BWd-695BBvjeYiw@mail.gmail.com>
In-Reply-To: <CAFNQBQyg-oR+RZVCWnGCLRC922ZET0AN-44BWd-695BBvjeYiw@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 20 Jun 2024 00:14:14 +0200
Message-ID: <CAHp75VcfgGz0wb0Ce5HPdntmZKtupXa87w4U_Wj6YvMi-iHkww@mail.gmail.com>
Subject: Re: Wrong GPIO mapping for Alder Lake U?
To: Andri Yngvason <andri@yngvason.is>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2024 at 11:36=E2=80=AFPM Andri Yngvason <andri@yngvason.is>=
 wrote:
> mi=C3=B0., 19. j=C3=BAn. 2024 kl. 19:18 skrifa=C3=B0i Andy Shevchenko
> <andy.shevchenko@gmail.com>:
> > On Wed, Jun 19, 2024 at 2:31=E2=80=AFPM Andri Yngvason <andri@yngvason.=
is> wrote:

> > > I'm trying to use GPIO on an Alder Lake U processor with a ACPI devic=
e
> > > id INTC1055.
> > >
> > > Commit 0e793a4e283487378e9a5b7db37bc1781bc72fd7 added this device id
> > > to drivers/pinctrl/intel/pinctrl-tigerlake.c and states that Alder
> > > Lake P uses the same PCH. However, I am having a very hard time
> > > matching pin names from the schematics that I was given with names in
> > > the source file or with names from the dataheet for P-PCH 500.
> > >
> > > Based on Intel's web page [1], I have been able to ascertain that
> > > Alder Lake U has P-PCH 600, for which the pin names in the datasheet
> > > do indeed match what I see on my schematics.
> > >
> > > Is it correct to conclude that this is simply wrong as is?
> >
> > TL:DR; Do you have any issues in practice with any of the GPIOs on
> > this board? If not, then there are no problems with the code :-)
> >
> > The Linux ideology of device drivers is to avoid code duplication.
> > Since we have the same IP, we reuse the driver, however in the
> > original one the pin names were used for different PCH. So, if the
> > issue is only with the naming, you need to find a mapping between
> > schematics and the standard form of GPP_X_nn (where 'X' is a group
> > name, and 'nn' is the relative number of the pin) that is used in all
> > of those chips. You may follow the comments in the code which starts
> > the groups of pins followed by the pin names and numbers. As long as
> > you know the basic (or "normalized") form of the pin you may easily
> > associate it with Linux pin number via the source of the driver.
>
> Thanks. I can work with that.
>
> Maybe you've already thought of this, but if the pins all used the
> canonical names in the first place, they'd be correct for any PCH with
> the same IP. Of course, you can't change it now, but it's an idea for
> future pinctrls.

Thank you for your input, that's what has been already implemented in
pinctrl-intel-platform.c for the SoC and PCH starting from Intel Lunar
Lake.

--=20
With Best Regards,
Andy Shevchenko

