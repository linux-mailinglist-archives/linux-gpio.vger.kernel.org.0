Return-Path: <linux-gpio+bounces-12463-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2029B926F
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 14:49:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8B9B1F21FC7
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 13:49:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41DD219F101;
	Fri,  1 Nov 2024 13:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0XOcss8C"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B284319BBC
	for <linux-gpio@vger.kernel.org>; Fri,  1 Nov 2024 13:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730468887; cv=none; b=VSiUjxOH6fGQk/Zu1FYvHMWjtRbOx+0U3aergaI3DnYRBEaAG5QFI2FwJJ//gjr2lyWvxA7z/KHXi8TblZazGSjuir6fq+ox/WSqcKGp/NpryqSSSK9OmqxhiMCUYWK5eSUoCocNNSo1R2/x8AlvezVqAN5lri1bjb709TDW+UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730468887; c=relaxed/simple;
	bh=FqLyVhOuPp8JIIydVMhKjUKrQYLSokcHBY0iu16xY+k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gQP8oln+QdvFRDni+sqa7xQMWeEeXHfEv1s7vxcww7AnFKjsF1nRbI01TMmq/aR3wzfGkYRW3V5VoEmvZ6O6T08Lurgj5NENb6RRXKa5BOTPZ/2siT5rvpQccfQLpbNEHaGkWPhw9ghMMu+bcrd5gUiqmDaSqqaLqULKENNaeBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0XOcss8C; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2fb5638dd57so19872091fa.0
        for <linux-gpio@vger.kernel.org>; Fri, 01 Nov 2024 06:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1730468883; x=1731073683; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xetm6M2BJI4/H9D1aD4ntXCH/28k29iwKGVFLSyiHRs=;
        b=0XOcss8CR5SsSlHZ18bfy9XkjsyhXNfFWjY8JiNPaLYAfUn9MTcfYWcGhdDA+X2zdw
         Gs/d9I1sh8i7u6BZn+pBRZ5x06eezhRZteGCOhNmqIz88mpKDNlayt7pjJ9ZHREBPQxX
         TieJ/p9UTZtB6LepKUE0bJQKL9M6KEdOik1LQnGuORSjCTEUTpuwL0BbTvEnj7Yf9KE+
         mpn7yqETVa2JkYQ7KDISPadYvzW2YtyEHdhdckHN08aKB1+tOdxnk9DeCv6jJU2gwRCL
         bmC2tppWUH/6Y1myjPcMYrAR2fpG7lA7XMJb8fseuhV0ESnXXqrJoGCEVJKl+1OFD5kU
         NmZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730468883; x=1731073683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xetm6M2BJI4/H9D1aD4ntXCH/28k29iwKGVFLSyiHRs=;
        b=A4wpaXHEINhRnvaHQ/qEqQ35EhPnovgA7X4fKMH5W3vsafAN+BX5WRP9WTvA1Vo9Gy
         YvDai6T6arZxILUL2NQmYoZNsdizd2Y0y68WNBX16ZazvFfo51D0oQjA6Yxfes3d2KDA
         ABqGeUsGSrZR1XFJpus1dU651LfXR9kourNm2QgHaJDE2TsCVcRmkoZPkvmOhW60L7by
         /65nAkgDWu362mAcZXqoySHSex1U3BEExAX3dx9FPVxiVRkJ16e4vcjsnXOXNsDD/HMh
         Nr/+EnmMbwzavSDsnbuPuLPQ63mio3PT4ykGcPCa4mBn2ijKELh08NYSKRSwgYMuhdZ6
         dTfw==
X-Gm-Message-State: AOJu0Yx21xCdATkAVDWYmFZTis7n5WxL3SOo9qDjl7pi25nEREHSGzdi
	uhvlbG67kYt69LP3nxgirH7TA//UUf++mcuF9Jwoy1wcIHL4M3LmZSzqF3aVSLXc8fDGaKbG4ts
	8HobE9xrAwf8MDJCqWwn6FgWl85m01Rm82BWwgqDV7QAlxGpreXI=
X-Google-Smtp-Source: AGHT+IFj8FXwxyPVgmYMUnMdFD5PHQCbM8KBagQh08B8Gt/miZ6rsv2defpXnSYB1Y+6cQCyTZAKtMOjL5ank8Tq1i4=
X-Received: by 2002:a2e:b8c2:0:b0:2f9:c337:acaa with SMTP id
 38308e7fff4ca-2fcbe0b4047mr102221871fa.45.1730468882757; Fri, 01 Nov 2024
 06:48:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241031-scouting-earmark-6b4dfc6bc6e2@spud> <20241031-appease-purse-55145b5dfba4@spud>
 <CAMRc=Men4sxFdSVR_WaJEG1UM7dXeGxTbw0=M_y3NsBmEOZzmQ@mail.gmail.com>
 <20241101-cadmium-speed-78ff7577347a@spud> <CAMRc=Mccc2tD2ZNQWpf6_wFt76p1ckyAqw-u6DBObgJV3n50CQ@mail.gmail.com>
 <20241101-affirm-evict-bbd862b08832@spud>
In-Reply-To: <20241101-affirm-evict-bbd862b08832@spud>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 1 Nov 2024 14:47:51 +0100
Message-ID: <CAMRc=MfSOUCFBjqeHwyMgKmNWb4==4=kwdT+aUtPHWKuiWm0aA@mail.gmail.com>
Subject: Re: [PATCH v9 1/1] gpio: mpfs: add polarfire soc gpio support
To: Conor Dooley <conor@kernel.org>
Cc: linux-gpio@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, valentina.fernandezalanis@microchip.com, 
	Linus Walleij <linus.walleij@linaro.org>, Lewis Hanly <lewis.hanly@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 1, 2024 at 2:37=E2=80=AFPM Conor Dooley <conor@kernel.org> wrot=
e:
>
> On Fri, Nov 01, 2024 at 02:09:06PM +0100, Bartosz Golaszewski wrote:
> > On Fri, Nov 1, 2024 at 1:17=E2=80=AFPM Conor Dooley <conor@kernel.org> =
wrote:
> > >
> > > On Thu, Oct 31, 2024 at 02:00:22PM +0100, Bartosz Golaszewski wrote:
> > > > On Thu, Oct 31, 2024 at 1:04=E2=80=AFPM Conor Dooley <conor@kernel.=
org> wrote:
> > >
> > > > > +       mpfs_gpio->gc.direction_input =3D mpfs_gpio_direction_inp=
ut;
> > > > > +       mpfs_gpio->gc.direction_output =3D mpfs_gpio_direction_ou=
tput;
> > > > > +       mpfs_gpio->gc.get_direction =3D mpfs_gpio_get_direction;
> > > > > +       mpfs_gpio->gc.get =3D mpfs_gpio_get;
> > > > > +       mpfs_gpio->gc.set =3D mpfs_gpio_set;
> > > > > +       mpfs_gpio->gc.base =3D -1;
> > > > > +       mpfs_gpio->gc.ngpio =3D ngpios;
> > > >
> > > > The "ngpios" property will be parsed by GPIO core so no need to set=
 it.
> > >
> > > Are you sure it'll work here? I tried dropping the ngpios parsing, bu=
t I
> > > get:
> > > gpiochip_add_data_with_key: GPIOs 0..-1 (20122000.gpio) failed to reg=
ister, -22
> > >
> > > That's coming from the device_property_read_u32(dev, "ngpios", &ngpio=
s);
> > > in gpiochip_get_ngpios(). Checking against the bluefield driver and t=
he
> > > code in gpiochip_add_data_with_key(), it's not immediately obvious wh=
at
> > > I am missing.
> >
> > Does dev have an fwnode correctly assigned? What does dev_fwnode(dev) r=
eturn?
>
> It's not a null pointer or something obviously wrong by virtue of being
> null-adjacent, it is a virtual address but not one that %ps can identify.

This is an OF system right? If you do dev_of_node(dev), does the
returned node->name show the OF node you expect? Does it have the
"ngpios" property? Can you read it with of_property_read_u32()?

Bart

