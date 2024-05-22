Return-Path: <linux-gpio+bounces-6547-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9788CBBC4
	for <lists+linux-gpio@lfdr.de>; Wed, 22 May 2024 09:14:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F170E1C20F6A
	for <lists+linux-gpio@lfdr.de>; Wed, 22 May 2024 07:14:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50FD37BB15;
	Wed, 22 May 2024 07:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nCo5Kpl8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD657BB06;
	Wed, 22 May 2024 07:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716362054; cv=none; b=I2878wXc2Eco237WnPt8VpgINa2PuvqxhQeaf3O3QVSw5OrKvD9Jkwd0grcBi3SVkbf9Hr1M0FPkGXVttnCxQZq55Gl8AZMzze+/Fs8VwNSE0EDlZcUqaq7lyrUX6jeoRFnAEk7V+Qx6KXyLnDeAz1vTtuN42TEHCvVESIqyBEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716362054; c=relaxed/simple;
	bh=TlQ0uuVIHzbHxyVEL3n6tWns0j3sTNIMm88GfvOupfA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cZpojh45O6s96FLqwN7OuwOzQ+mEG4y0ega0JW1xI2DWmWkHB0Qf/EBZU6oqtZ1a9BYga6lrdLKbIxFi2BxHDeFsnSw2v3waNEro7SLyDDWmKYM4B1ufYHq3nndMBKdW5mUtMxTAm6u4ue3U7KH/yFr6TlMmYW+WxG9wR9SLeB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nCo5Kpl8; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a5d67064885so499399266b.1;
        Wed, 22 May 2024 00:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716362051; x=1716966851; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kIdChEw5DvBFSfSpnHNPUpxstFzR4q/9Q7FfD5YW1qs=;
        b=nCo5Kpl8Fc+kIrTNuH+YNv0p01Cs5iAvWsVM5UBHcDxyRiQD6c2vZSQ9euazVar53D
         0UbZ+i/Io3L8w7HI9V4R33vAHAfSIWHxQIN7iCbftzHOFSHiJT8uBq78yfAQqdnHJH8R
         thXSZtEgR90dbd0IS2itPrZuVwcroPsos5Dok2wE8sPsLuPoKUPOgVHOjFcVlW3OBgju
         GbGQb04YzlRv+x/+D50XMiFw8ugXVBNO3vEVqskhA1g/8J98E2Y395NAZ5E9XCqjQjW8
         TLrID+/1E6HQ+zQ8a5XFYlTGRbv33ZFYpMd/PLABazj9g+inK5r9xHdcgb9PNVBJSdBX
         GdqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716362051; x=1716966851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kIdChEw5DvBFSfSpnHNPUpxstFzR4q/9Q7FfD5YW1qs=;
        b=qsdRSrn1TiyFQ5799tCDezgE6oivQE0Gm5U/1iBvUxsdTzI9A8MRfjjeRzltH/3A1p
         fMpl/a/oJmj+LnxDWR4LDBhksHUqKZkf68XG21pXPV2ycz45NpMKosCf3a/hEpxyJcrI
         s854H15+uP7EbG66MY+kmgTnr14ZYjtc52hV4OyN4x92Z4bkDWIXFYRF7OxzCMJufrIH
         Pff1lqvBM+t5r64DxSjj+OCccYlfO/3Ag/jAKux/6WMFTkFgCSP3SjmHjgLYJv4Uzigf
         ac0zpQJGv5+LXBqhKX2z2CUQgD4gn++W6G+SaGpkSYPFDQOlWx8SC/3KxoFZTaiywzn8
         1N+A==
X-Forwarded-Encrypted: i=1; AJvYcCVVAzKLes1RrNTgLwuAr+wlBYas31OwUEifMxjOyfQ+AimK9rdPh3xUZAU54mqWZMnrEaMN9uQQzbRwT5f/1fohSaMjsL1vZjyukNUJAOfhlCKhsNeypzYwJyoKXQBmWtyJIHAdWLSWxH39yel+Av4RPvhj0nfBSjHJWchbfUCXI27ElnzGot1eLwgNSbQWNdtZDZ/di+01eXmxf+wzmfEhg7Zi
X-Gm-Message-State: AOJu0YwjA9FEvCuoaAFcJpiwBo/DqjVHAzc9v5QKbW2oH66WSEuMQPY/
	1g3GWeNisDPG+So/Hm5eUgOb1KV9oFJJ3J1uk47tUGYYMHDlAmGowhhRhL/xYD6ZpbMZisq3pzB
	BeIAmA5yj7i0p51ahqpPg+XNlTc8=
X-Google-Smtp-Source: AGHT+IFT21FczkEAvOPstRxTfY9A4JXSOIuGuffflPE6NOhSwYFu+h1M0zhqA2RK5KD36M+OtRmfX/EDdu2IzgO9xXk=
X-Received: by 2002:a17:906:31c6:b0:a5a:7d28:54aa with SMTP id
 a640c23a62f3a-a62280d6175mr117645766b.23.1716362050534; Wed, 22 May 2024
 00:14:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240506150830.23709-1-johan+linaro@kernel.org>
 <20240506150830.23709-12-johan+linaro@kernel.org> <ZjktIrsZS-T7cm-A@surfacebook.localdomain>
 <ZjyafGz_1pY4J9C7@hovoldconsulting.com> <CAHp75VfP2AB45mn6gB3suCAO9iT3bOWZ=7m9U7E087Lac0P3gg@mail.gmail.com>
 <Zk2VX5JRzmePxG4N@hovoldconsulting.com>
In-Reply-To: <Zk2VX5JRzmePxG4N@hovoldconsulting.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 22 May 2024 10:13:33 +0300
Message-ID: <CAHp75Vcs3DvBK3P058gU6L-24Q9PTrPg_hLujxaUGHNB=JCW0A@mail.gmail.com>
Subject: Re: [PATCH 11/13] mfd: pm8008: rework driver
To: Johan Hovold <johan@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, Lee Jones <lee@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>, 
	Satya Priya <quic_c_skakit@quicinc.com>, Stephen Boyd <swboyd@chromium.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 22, 2024 at 9:49=E2=80=AFAM Johan Hovold <johan@kernel.org> wro=
te:
> On Fri, May 10, 2024 at 04:15:43PM +0300, Andy Shevchenko wrote:
> > On Thu, May 9, 2024 at 12:42=E2=80=AFPM Johan Hovold <johan@kernel.org>=
 wrote:
> > > On Mon, May 06, 2024 at 10:18:58PM +0300, Andy Shevchenko wrote:
> > > > Mon, May 06, 2024 at 05:08:28PM +0200, Johan Hovold kirjoitti:

...

> > > > > +static void devm_irq_domain_fwnode_release(void *res)
> > > > > +{
> > > >
> > > > > +   struct fwnode_handle *fwnode =3D res;
> > > >
> > > > Unneeded line, can be
> > > >
> > > > static void devm_irq_domain_fwnode_release(void *fwnode)
> > > >
> > > > > +   irq_domain_free_fwnode(fwnode);
> > > > > +}
> > >
> > > I think I prefer it this way for clarity and for type safety in the
> > > unlikely even that the argument to irq_domain_free_fwnode() would eve=
r
> > > change.
> >
> > If it ever changes, the allocation part most likely would need an
> > update and since devm_add_action() takes this type of function, I
> > don't believe the argument would ever change from void * to something
> > else. With this it just adds an additional burden on the conversion.
>
> I was referring to the irq_domain_free_fwnode() prototype.

And I also referred to that one. The release callback, i.e. the type
of the parameter, is solely defined by a caller of devm_add_action()
end friends, and in this case it means that if ever the type changes
(this is your argument why you want to have explicit line for that,
necessity of which I oppose) the devm_add_action() arguments also has
to be changed, it can't be done _just_ there, in
irq_domain_free_fwnode().

> > > > > +   name =3D devm_kasprintf(dev, GFP_KERNEL, "%pOF-internal", dev=
->of_node);
> > > >
> > > > You are using fwnode for IRQ domain and IRQ domain core uses fwnode=
, why OF here?
> > > >
> > > >       name =3D devm_kasprintf(dev, GFP_KERNEL, "%pfw-internal", dev=
_fwnode(dev));
> > >
> > > This driver only support OF so why bother.
> >
> > Sure, but it makes a bit of inconsistency.
>
> No, I don't consider this an inconsistency. Again, *this* is an OF
> driver, other subsystems need to deal with ACPI and use fwnode.

OK.


--=20
With Best Regards,
Andy Shevchenko

