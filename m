Return-Path: <linux-gpio+bounces-13972-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0941B9F4EFC
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 16:13:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13AEC16A531
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 15:11:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A36AF1F666B;
	Tue, 17 Dec 2024 15:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="C7mNXYFb";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="gumdJh9x"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337711F707B;
	Tue, 17 Dec 2024 15:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734448300; cv=none; b=NErd4h22sXXXrNYdOuJwPzpWd5wQ1yNWad50KvI6Ren3j64W2c8wl+Q23Cu1kRLfxjqVFbktJZO3nHBvMvR+W+bCNSEYFr0m3K9oKsJx9Tj3N65Dg6y1koz6dkl6rjeHvBrWKfHO+sGVtPZNDzLH+TsxQHFIzLgFJaiCYH+TdC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734448300; c=relaxed/simple;
	bh=HgWFrRThS1EJjsYl2+VhctLbx1TCjQPBSmVxEhg+yuo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hR65BOjygDetcKjfx2Kyk8tHpgFDFC6+imaC0w3uDxh3u1hBDBjvckezhRl+BkPbefZN3X7/TQ6gr/KDGo4LORQnM67uqeMXZOasDBWSLlXnc1AroaBwAD/r0m2Q1v0zkoDK6TPABYOhzybs9g6DPajpyclrQnXt6WSRBIOVcTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=C7mNXYFb; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=gumdJh9x reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1734448295; x=1765984295;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=yNfaGYFnv6BIlTzP4HCPWJdc/LG9GV/wGm5yHHoCOt0=;
  b=C7mNXYFbkjTtghhG2tD4Bbt1JPRR85eQ003FA9Ci9iW1/UHWWAb6LWNW
   aZ4GuD9p5epqG56rnS7U08eACQoIXO6gEEwP+plawcJm12p5FUhNlvqnR
   KD/GOGC/0NiA/cgc9OADoB0i1EGBFklfcNEZF1pVRHhBrrU5HHfIKY5RC
   tc6GFn0f92VC7B0Cr9xfWPnSgjMHjg21qZH/dkW5+D9SY50K8/FPD8yOZ
   QFfL4wGxDWfkxuTslC0kykv6jnBDGLlUkW2ZlhA6K7LyuoRZCN47b09/j
   Up6hYW2Ewy1yVFiHX9JR8EEnt1JOt+Gj7IcIrg/M/n49/GvkQWwV5nX0L
   w==;
X-CSE-ConnectionGUID: vbbCW5BFR7GHBUPNvsDHPw==
X-CSE-MsgGUID: 4dFVnO89THuyr+Ves4oyqw==
X-IronPort-AV: E=Sophos;i="6.12,242,1728943200"; 
   d="scan'208";a="40657413"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 17 Dec 2024 16:11:32 +0100
X-CheckPoint: {676194A4-B-3E9838BF-EEE9C5D3}
X-MAIL-CPID: 49A65E50A1FDA9A12C6C60518638081D_1
X-Control-Analysis: str=0001.0A682F28.676194A4.00D3,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F0CF1177ABF;
	Tue, 17 Dec 2024 16:11:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1734448288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yNfaGYFnv6BIlTzP4HCPWJdc/LG9GV/wGm5yHHoCOt0=;
	b=gumdJh9x5azXLE6W/iNBrqSAS5r88ULF+7UAKxaXvhbHopztoQadbPuNks4w48v/fLYofA
	d2GpELgz2WBTi0fTP6oSD0I8GG6DedbhLnKAJD8PpQydc13EThuZpRDU0bhhUlMnKMoQir
	8f/8LOBnqmyzlx4oXKpyp8ZqwCxon+lYnBX183xrNv+ajphrfP3+/NFWQzdJCpaLsSVkEa
	ABoRs8xGoIsm2mN2+qyN32/NDpmdb1wfQ3nC7HuCUaogZsnjrb5cBWJz2h59h6XnDG+gMq
	LgeMp1vISVzTqsjeiOwJMreNYbuMQ1+BhCGsSGIcYnPVJbkkd6D6YuQAY5DHUQ==
Message-ID: <dc83bbd1cd960f8a5daa7ad687f419609f5e14b9.camel@ew.tq-group.com>
Subject: Re: [PATCH 3/4] gpio: tqmx86: introduce tqmx86_gpio_clrsetbits()
 helper
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux@ew.tq-group.com, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 17 Dec 2024 16:11:27 +0100
In-Reply-To: <CACRpkdbRdT1=30DNyn_=7rfqsnppfbdBr5QXCfWyM0f+FzLjgw@mail.gmail.com>
References: <cover.1733739697.git.matthias.schiffer@ew.tq-group.com>
	 <a7b98f12da735f735b33200f6324360fc380e6d0.1733739697.git.matthias.schiffer@ew.tq-group.com>
	 <CACRpkdbRdT1=30DNyn_=7rfqsnppfbdBr5QXCfWyM0f+FzLjgw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3

On Tue, 2024-12-17 at 15:16 +0100, Linus Walleij wrote:
>=20
> On Mon, Dec 9, 2024 at 11:36=E2=80=AFAM Matthias Schiffer
> <matthias.schiffer@ew.tq-group.com> wrote:
>=20
> > +static void tqmx86_gpio_clrsetbits(struct tqmx86_gpio_data *gpio,
> > +                                   u8 clr, u8 set, unsigned int reg)
> > +       __must_hold(&gpio->spinlock)
> > +{
> > +       u8 val =3D tqmx86_gpio_read(gpio, reg);
> > +
> > +       val &=3D ~clr;
> > +       val |=3D set;
> > +
> > +       tqmx86_gpio_write(gpio, val, reg);
> > +}
>=20
> Maybe a question that has been asked before but why are we rolling
> a set of tqmx86_* wrappers that start to look like regmap-mmio
> instead of just using regmap-mmio?
>=20
> tqmx86_gpio_[read|write|get|set] and now clrsetbits can all
> be handled by corresponding regmap_* calls (in this case
> regmap_update_bits().
>=20
> Sure, this driver is using a raq spinlock but regmap-mmio supports
> raw spinlocks too.

A while ago I did have a WIP version of my patches that used a regmap, but =
it
only added another layer of abstraction without simplifying anything:

- I introduced a tqmx86_gpio_read() wrapper around regmap_read() to avoid
  dealing with the indirect value argument all the time for an operation th=
at
  can't actually fail
- I also kept the tqmx86_gpio_write() for symmetry (just wrapping regmap_wr=
ite)
- I introduced a tqmx86_gpio_clrsetbits() wrapper around regmap_update_bits=
()
  (having arguments for set and clear was more convenient than mask and val=
ue
   in a few places)
- I was still handling locking outside of regmap because we sometimes want =
to
  protect a whole sequence of accesses or other driver state
- The TQMx86 GPIO controller has a write-only and a read-only register at t=
he=C2=A0
  same address, which I understand not to be supported well by regmap (at l=
east
  if you also want=C2=A0to use a regcache)

So I abandoned the regmap approach. If you think it's still a good idea, I =
can
of course work it into the next set of patches again.

Best regards,
Matthias


>=20
> Yours,
> Linus Walleij

--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/

