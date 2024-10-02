Return-Path: <linux-gpio+bounces-10717-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB9B98DBCB
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 16:35:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 233AD283B97
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 14:35:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 998EF1D150C;
	Wed,  2 Oct 2024 14:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="HI1XCDhw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1121D07A0
	for <linux-gpio@vger.kernel.org>; Wed,  2 Oct 2024 14:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727879371; cv=none; b=QJw5MMj/l+jHxnib50j6RPKHPXFom+GdE+jytFBDWBnh3S2JeseEYB0DvdOmFuMVJywN9appTwPOceWOThMKXLIjaYtk79zcspG7JOskWJqyvnh8LrIjA9W14Qjhm3dc0hYMIsh+DQvQtuDeaGLOaDveR+nIqO6R5r3hRvUsrqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727879371; c=relaxed/simple;
	bh=pjv/M8Xe8+4wBFfa2hTQ7iX9Xr7mM83ZazM2h31q1jU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TbYaTFBafqYhUHVuEAJx6UHJEEZ87Dokgm9QV5wqJMLaP8WGf7NfBWh6TodJbi7/ky7uvemZNlnN2ITMAKdNPdGwfc9J2WedCxmdYbuy5UjFnWXs/UH6yFDPZdDgPGKbSuomFMWomhvGuPBsSIFiw1/QufcUm0Fi67AFmEQqbDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=HI1XCDhw; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2fac187eef2so49422561fa.3
        for <linux-gpio@vger.kernel.org>; Wed, 02 Oct 2024 07:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1727879368; x=1728484168; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pjv/M8Xe8+4wBFfa2hTQ7iX9Xr7mM83ZazM2h31q1jU=;
        b=HI1XCDhwP8xanjXVk7pOPvN/3MTBpK5SXAksZByGZTsg1vA9htRjfCybP1l8MRwwky
         sL6CjxsxNpIlS4RrEZ7YzxZ6jCsQpfdQYSU64UMEn0Lyy47LDv4KW/PD+55XB/Z0tdl1
         qOqIcJlCpH+Gq2/B6PuiMJVaFNmDXlcuFJ3F2Xw0KbFNe6OwPwG22rUViChcBb5PAtt8
         KJyc92S9YGkEhulUaaDZQfG72xfYpMVAyQQKa6hXv2xdSk6nNiVGdPKAs2CqjV3f5vrX
         YNDtI7QKCwB5O9yVUdATIJEdMhA/18ZIVf9Y3VruNZWwnBG0anrqRUoryXvjl/j9xgna
         JbeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727879368; x=1728484168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pjv/M8Xe8+4wBFfa2hTQ7iX9Xr7mM83ZazM2h31q1jU=;
        b=TxdtyNLNhvoCeEucXfQLO4A9IiF+6Uk9A45zH6Xt2Tpmw1GCdc1mqzxfRXMGbAWpOq
         yW7Ktxe5Inl9/L8JyHxHS0jOynRXrerqYARKYHP+8JpE+X/evZN/Cwf05UZ/LlcBAmLK
         nfQ3SsLrgaWAj20/RRzlwL1C/xbnXXTLJ+AR440KzICj1gKRQN4IrkkMbOBO3YF3Eblq
         /HFAezcVbCedZp5cY4wn6PPX1ddGGZkXRKU5EduxiVIOaz+LC/H+VM/s0if/rorToRmF
         uMvGqWac5NFqbFPLo3ReC5cB3RNCvieaZAbLe9y09OKHoPfEuZkkfNG7bdkIOdCgO1n1
         NLIw==
X-Forwarded-Encrypted: i=1; AJvYcCVLA9TPTu8eic8n8VCZBEyiwiNy0UQIJ+e1JY6Q9lenUzODc9usLFL5C9oYM384SoTJFzEGwodadVUk@vger.kernel.org
X-Gm-Message-State: AOJu0YxyS4/OP9gAV+Y2VAyBHdSYZU9FxkA5c20ESg47Ri/cUwJx93Z4
	Rj91nNteSkPdmJT6oUDy9XVv2xCr9hcuR2t8du3ktmHJukDxJ4Lz3BRJBHAAPY6vtaEGomhbEw8
	N3A49qEUToZfivB8+jl23zEEwBJueN1epFOJyfg==
X-Google-Smtp-Source: AGHT+IFIVJNOA1oP83Aj+T5Zrw/WE5zLmnqvwk26nk7xKgoVs1gv/df5sQK0bRndsYhAtG4GucohoOiOnGr7sCMZej4=
X-Received: by 2002:a2e:4e12:0:b0:2f6:5921:f35b with SMTP id
 38308e7fff4ca-2fae106dff4mr17322521fa.27.1727879367990; Wed, 02 Oct 2024
 07:29:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240925173504.1906872-1-robh@kernel.org> <CACRpkdYh22c08kLWDJ3wmK+i9-C2ngXdJwhg-kAXfdy2+mcB0Q@mail.gmail.com>
 <CAMRc=McdAwEUCDouUeOENt36LZ+d4Fd=yeqzm9dn83XSqZpQFA@mail.gmail.com> <CAL_JsqK8HxEYicNKu0zhfWKY8Ui9657PWEDFr8maSWKaeJijXg@mail.gmail.com>
In-Reply-To: <CAL_JsqK8HxEYicNKu0zhfWKY8Ui9657PWEDFr8maSWKaeJijXg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 2 Oct 2024 16:29:16 +0200
Message-ID: <CAMRc=MdmXRiJuF2kAFg4VKDkLqG_Hg+RAh5QUBmDkrQROgEAOQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpio: st,nomadik-gpio: Add missing
 "#interrupt-cells" to example
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 2, 2024 at 4:22=E2=80=AFPM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Oct 2, 2024 at 8:32=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
> >
> > On Wed, Oct 2, 2024 at 3:04=E2=80=AFPM Linus Walleij <linus.walleij@lin=
aro.org> wrote:
> > >
> > > On Wed, Sep 25, 2024 at 7:35=E2=80=AFPM Rob Herring (Arm) <robh@kerne=
l.org> wrote:
> > >
> > > > Enabling dtc interrupt_provider check reveals the example is missin=
g the
> > > > "#interrupt-cells" property as it is a dependency of
> > > > "interrupt-controller".
> > > >
> > > > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > >
> > > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > >
> > > Can you please merge this into the DT git tree?
> > >
> > > Yours,
> > > Linus Walleij
> >
> > It's already upstream. I learned it when I tried picking it up. Rob:
> > any chance you could send b4 notifications when applying patches to
> > your tree?
>
> It's not upstream. The ep9301 one is because Arnd applied it.
>
> I do send notifications when applying things. Not using b4 though
> because I haven't converted my scripts to it for that yet.
>
> Rob

Indeed, I confused the patches. I picked it up into the GPIO tree.

Bartosz

