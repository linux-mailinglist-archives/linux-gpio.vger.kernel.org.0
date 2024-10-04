Return-Path: <linux-gpio+bounces-10837-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DD1990278
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 13:49:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C80D28145D
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 11:49:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B3DD15AAB1;
	Fri,  4 Oct 2024 11:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T9CU8R5T"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D6E15C15A;
	Fri,  4 Oct 2024 11:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728042486; cv=none; b=Zs/a3jEzGz7drufQvnrovn9aMgQSVMMtBIpzQxv9q4FkiNSrMhb+Xu/Tc1j96i7bph7QRXHdUBGrKb+VzMiIwL6Ub74NYpG2TWnuOMWeqOEnNnyqr4jmS+qko44cWuzc/rPLJjxixUyHMLMEk9EbFEjYrOL9bNkChPpn4IEdsT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728042486; c=relaxed/simple;
	bh=28fDmlUX5NjGOYHp9tQ2SOIUz7KVqVCbQL0VHomDVEs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I9cfL/a+EFINoIp4kP1zfP0lpPJiZKdfBudVaLSAaQ68E6zdzMqmgR28vVXy3AFvZdjKQOp6xURRevGcPhuqo0wZjsdPOUUWXKJbeOookamNPpQKOpDYZ+gaQgxtXerWSCxF9MPzzvBLcv6X7YniyRBWP6ujGq43o8JrKc6pZCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T9CU8R5T; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-505a9e521b8so651233e0c.0;
        Fri, 04 Oct 2024 04:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728042484; x=1728647284; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t+J+o8bA1sOwgxomCtJnrHlAGu038hdKn1LQii9U8Ks=;
        b=T9CU8R5THIYmfbWvglTtqqoPvdvv1FVG4mfUniVuPiEAX5jfGnlGw+kh7BGgnOiPAp
         NEPjj8GBbiEiVclzYwMJ1nOj2GgsRBqa+7F/23haPKUZmhJvkX8o4mp5g7pys2hd6QXG
         xXB2AnKXUn27q1iuVgEdvNdE7t4m/jYsuXM6DC5IF9GAR4yV06SMYbvm9mTfqc3pZfd5
         f0dSOqiQcrn1WSRDOkYMyrA1OvmwoJl1645iD+VKFSgOhbNahdsqhfTW1Q9+NKVoR89D
         zm1VxY3BduKeOBqrOls7woGJgqhvfHPh0u1kOQFutmdJU3L1MZRQuUazk4O6Q+7isYU3
         zZlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728042484; x=1728647284;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t+J+o8bA1sOwgxomCtJnrHlAGu038hdKn1LQii9U8Ks=;
        b=famfdH4b7kw4xxkrHtXuX7RHHWKj3T8xh3nSv5OcLU2WCjMLZB2L/TgnMz82w7+avk
         xetULGe+5ZOWXY9Ueno5sf5KiqFvoc870Tlb72WhH0we8QnUoW8779bYc0i5unbRNo5a
         K1NhfRoworao1HHnqQaxViL2sK0AQgYNZlQ3sQOd/qEeAm6omCvZY2vfMAq4VLjQlUE5
         491Z79K4Dog34r6WCSvwSpaq25wznWLlzOz65C6rSKCrluypPt/oGF6DThsYpgN2+GHG
         En69sZdoFOBK4HvNGt/zTvG8ZV4aEgGaPU5K7foH+aezA5vHC3oT1EMuMHi0I9gvjQtM
         78KQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYATFLAYkGnwSpbkf3kSUMPrn1sduAaEshpulLfFUDNCQPTqpG3eRaDHZHc9s2Tk743xuVMeqFfl/Z@vger.kernel.org, AJvYcCWIuSxfCMAoVEbmWpm9YwHd9cAGdrqTV0zMDA7WSiTPTJsQX/XAp3FiBz5pcEYD4f92pkoTFovhN/gqGPEf@vger.kernel.org, AJvYcCWUTxsBR8Lz6Ew3yn6EL6h5pB9jlFfhn9CRgVTiRGPZn6zZ/cq0z0LLUZMs3NQdAyVAz99jAj4b9JTiDzaSnZ8XU/E=@vger.kernel.org, AJvYcCWgj7P3+ETdMdRDtWEZW3SEeSkOQsp+IByvimuhoBftt0J151zPBuO5PxlN5rUqCVQO15qgiOLzG57YtA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKEel8h4r9Wrtpwre/XquN0AYJCePxv9RFHj4nRc9mw6GDlG+I
	ogxaWkafLOnkSOmwP9F6oZ8dnXkckLAj9IFlE03XNSI+Uvxx46k4nLGUY4fPm4F5hgXgLZpZ5Be
	cClAs/eCbsskT1lst66MrUwo9y0c=
X-Google-Smtp-Source: AGHT+IGdvmFCkBqF4SYCEoULbl/hYtOCQsXaZoLmC5cMXPmEqUZLKHUpPK6yOPB0dkrKn1mSJ2YWX60pe2g2EClXDqk=
X-Received: by 2002:a05:6122:3c4a:b0:50c:55f4:fbb1 with SMTP id
 71dfb90a1353d-50c855b087dmr3002092e0c.11.1728042484221; Fri, 04 Oct 2024
 04:48:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240918120909.284930-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240918120909.284930-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdW6OqLEWSyRZg_EOWoFJgEBVSLfuDJNxs+c_ucZxXwebQ@mail.gmail.com>
In-Reply-To: <CAMuHMdW6OqLEWSyRZg_EOWoFJgEBVSLfuDJNxs+c_ucZxXwebQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 4 Oct 2024 12:47:38 +0100
Message-ID: <CA+V-a8uF2Ajh-X27_tqpT1VK_bzxOJbFQNhkXsfcGNkz9aX4Dw@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: renesas: rzg2l: Add support for configuring
 open-drain outputs
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Fri, Oct 4, 2024 at 8:56=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Wed, Sep 18, 2024 at 2:09=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail=
.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add support for configuring the multiplexed pins as open-drain outputs.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> > +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
>
> > @@ -1466,6 +1477,13 @@ static int rzg2l_pinctrl_pinconf_set(struct pinc=
trl_dev *pctldev,
> >                         rzg2l_rmw_pin_config(pctrl, IOLH(off), bit, IOL=
H_MASK, index);
> >                         break;
> >
> > +               case PIN_CONFIG_DRIVE_OPEN_DRAIN:
> > +                       if (!(cfg & PIN_CFG_NOD))
> > +                               return -EINVAL;
> > +
> > +                       rzg2l_rmw_pin_config(pctrl, NOD(off), bit, NOD_=
MASK, 1);
> > +                       break;
> > +
>
> I think you also need a case for PIN_CONFIG_DRIVE_PUSH_PULL,
> so you can disable the NOD bit again.
>
Ok, I will implement PIN_CONFIG_DRIVE_PUSH_PULL to disable open drain
and send a v2.

Cheers,
Prabhakar

