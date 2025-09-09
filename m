Return-Path: <linux-gpio+bounces-25836-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B00B4FEB8
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 16:06:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75F1118959EE
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 14:06:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBA21340D85;
	Tue,  9 Sep 2025 14:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="pJkEPVMY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F64340D83
	for <linux-gpio@vger.kernel.org>; Tue,  9 Sep 2025 14:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757426756; cv=none; b=bj2oxBn4X8H/D6sPiaxX9qE5ibZ71dpCt0ypaflAQ1E1gtwxOZdY9ss2jMeZfGJ1L03aL0OtHXq+gBq8CkbtOF7D9+HsnT2HzxPCLlPumPlIWCIh2tWYcX0zWRmIRVgVqCOkfywD511e1oBWgp2XYcx9kvr4x1swvcGgQuVzm+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757426756; c=relaxed/simple;
	bh=vwHR1FgOXXSSp2VsIjgAXKNRhzqoSYPvwttSy5YEpHg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oTdevX2W0wq328MQWfwPs6NzeP2pHOAscflY8oRHQViFqsEW/waj0EIbl5x7oMMTeaZ4uZ7J71kf4gvONu9u3t2p0hGbLlUzf5o6DD96p2lS8+BWrhCnuvdL/uIozjVGwYYcMsuhMHXtPNsVISAn3ZaFcN4JewewWQ+auD948pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=pJkEPVMY; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-55f7039a9fdso5797678e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 09 Sep 2025 07:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757426753; x=1758031553; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vwHR1FgOXXSSp2VsIjgAXKNRhzqoSYPvwttSy5YEpHg=;
        b=pJkEPVMYcYyGrKCWpIdIdsYemX1+edMoeK8dfB0h6epJDltOW+qyW4gtxHE3bEkTle
         Hgi7LvvcW5+jq/WaEol2CJBs1dUrEAlMOhbZQg315laBjc/up8VmZpoeVh+2VIc+cmgu
         Mkj50G4pop64g6/Yca1j8m5tqEfMzPhIjYs3o02NfZTRkGa6mNSPGUyNGoRUCeuJocP4
         7khfVIbhscclQw7ANbbsJ9j4jSIcF5mCOQ5aUgwxgCRP5ys+O8QkzGzNLhNY8BOHcrWF
         4ACnK017d0NcMVDnO7uXzB85KniCDb7LlmUqt7Tq0EEdE8aION7GqY92E4JsfxemflnV
         Glmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757426753; x=1758031553;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vwHR1FgOXXSSp2VsIjgAXKNRhzqoSYPvwttSy5YEpHg=;
        b=kgsyAPmC8v1R0pCY1Y0gyrl73h+UX47qM6UQ4EFMJDekkEj0wxBZgV0OvrJIZu9gvy
         0P6gzq4c8+vdUbC0ehzKgQ8lJXqw71mKknS8KKstsBJXmT+GWuwMOskpFKYCjPKgc+C9
         FxXLYYLY7/LTc04ABPvkq+gNvpZUvwIHjZnENhaRJOxdIdTkj4SrCGerTOyz5nR5YlFG
         hul6fWKPndxHK69MMkYGylYg99jXyNax/op6wQaehxoTZSJYWrROjuF/htJQwG66SGTg
         S+ONpGfRLSwo0CVYbibQcn0Ogps8FHplPqfELmHBGcyLZDH7GPiuht9u3KvdFonCIlIe
         HpOQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2cV7CVPIvtMJFJaG4C7akfoMDOsgS+tAQz/Nw7dSVPXCSQpqOkY603Pfpw+Pqz9EsaKpcywqTxBxE@vger.kernel.org
X-Gm-Message-State: AOJu0YyMSf0QY5IVXzEEGeg2TnbuqdBhHgSmmWWzjZ64IcpgibFXw6w/
	75MmuguL83vzD25xRP2CNmiEqQE6FPcpjVbNpEheh785OtqCx7SL5QSNC1CBV0WHQ9Eg2U7P+xT
	cKNRLf/4dxAualb55yH6crO2aXa6qtUR6ROjoXhVd/g==
X-Gm-Gg: ASbGncuFUJFZ3NsaIvClFgXHKYsygaO2N2JxzSyOdWAlezwBIaXOPIeSEtpv/Wjww8r
	P1j5DXZdLcNDLncI/oKraHZqEVKMy7DnzTkuj8sn48kLqO1s9vUndS6dHzeQDjCiEebOoif1LEg
	ggA3BvIDSY+T52hgjs73JVZWUkvaWXovB8Kjj45pnvNhA3wsIEm/XOn4XkSdse2Cg1vKsIVNAtC
	n6bHqt+Q+XSJ0XJ2n8q7kVsAsXHEByzy7q7wX0=
X-Google-Smtp-Source: AGHT+IHxbtPyFzNpPyeaiiBaisDmRYDyXY5HX06QQvzN7rQqg4ycDBS5H9rZi94hP+dpGNYd7MLd29QcT4mULfuZ6+0=
X-Received: by 2002:a05:6512:108a:b0:55f:4db1:e450 with SMTP id
 2adb3069b0e04-56260e3b836mr3230997e87.22.1757426753065; Tue, 09 Sep 2025
 07:05:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
 <20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org>
 <aMAP9hAWars0T83r@smile.fi.intel.com> <CAMRc=MeLTGq8Qu2aT43tkt3vaYCSaJPJPLmaUQ1SAyD_OgVr_g@mail.gmail.com>
 <aMAn4MM_Fs8q8qwj@smile.fi.intel.com> <CAMRc=Mdr4oW2d7XZ90rRr_fKC7WToz72v=_kW-s8=Urd0g8k3g@mail.gmail.com>
 <aMAve1MbONmKVjjg@smile.fi.intel.com> <aMAv3STeZUdSQ14p@smile.fi.intel.com>
 <CAMRc=MeA87p0QAzq_3MACQM90MhN0eRccr7u-VzcfyP8b90AaQ@mail.gmail.com> <aMAzZAbNwrRTgFi-@smile.fi.intel.com>
In-Reply-To: <aMAzZAbNwrRTgFi-@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 9 Sep 2025 16:05:41 +0200
X-Gm-Features: Ac12FXw1RLq4MdeG1hkRFaIkCvacYp3h7kbqz23NMJgO5kiwlT10dViDUNZvzbs
Message-ID: <CAMRc=Mfn7atHTqKc9nMTQ19ZserqeNi3skb-QhG3CVdEhmr0gg@mail.gmail.com>
Subject: Re: [PATCH 13/15] gpio: sodaville: use new generic GPIO chip API
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Alban Bedel <albeu@free.fr>, Doug Berger <opendmb@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Yixun Lan <dlan@gentoo.org>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 9, 2025 at 4:02=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Tue, Sep 09, 2025 at 03:56:41PM +0200, Bartosz Golaszewski wrote:
> > On Tue, Sep 9, 2025 at 3:47=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@intel.com> wrote:
> > >
> > > TBH, I think those 6 all made the same mistake, i.e. thinking of the =
compound
> > > literal as a cast. Which is not!
> >
> > What do you suggest?
>
> Write it in less odd way :-)
>
> foo =3D (struct bar) { ... };

I don't get your reasoning. typeof() itself is well established in the
kernel and doesn't

foo =3D (struct bar){ ... };

evaluate to the same thing as

foo =3D (typeof(foo)){ ... };

? Isn't it still the same compound literal?

Bartosz

>
> > And are we not allowed to use C99 features now anyway?
>
> It's fine, it's not about the C standard number.
>

