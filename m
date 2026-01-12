Return-Path: <linux-gpio+bounces-30440-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 47341D117E2
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 10:28:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 45801303D692
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 09:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D5C534844D;
	Mon, 12 Jan 2026 09:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s7zNWMvc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9923469F8
	for <linux-gpio@vger.kernel.org>; Mon, 12 Jan 2026 09:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768209917; cv=none; b=i7go7YWwYT3rVo4+GQe2VmAewrWYIxnUKj6zZ2uVqrlL+KM1mqrm718b87P0oIMoFnjp4JxnlJjLoIaGJQvCiM0wj7ktGBsl321u/cJTlHGWgbqV/pQmOXQIQgKwynK/mnwrzoTyASLGkI/fhDqZNPh6GkqbIGWwixoA49I/OQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768209917; c=relaxed/simple;
	bh=08XXE+26RTU+pR1xU1Z6JUXo+p5jXypPMhdd0x3NdSQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BKHy0w5o9kRw5biP4PHKaZ+FhemirGK1+1hqNue+Iy1CVZcQ1ZVE1rGySE8+xL7OLeEylJ/LDKPn7494b3I7iNkC3wY6qagk8jp1Jd+V65UI2GX9D1W1gxb4uwzuFy4fRGcs8pkEY2eya3ofr6c6orgjV+fWO82f6Ru8or2vG/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s7zNWMvc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AB1AC2BC87
	for <linux-gpio@vger.kernel.org>; Mon, 12 Jan 2026 09:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768209917;
	bh=08XXE+26RTU+pR1xU1Z6JUXo+p5jXypPMhdd0x3NdSQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=s7zNWMvcHy0ucLnhMplsYm17FJ0Blvxgh+SkHLxAsPQveeSFneGdl6X7z6MewPwHF
	 Q1w2ET1rQS5bvx3G9z9RBU47Rl0/UYjZqm4/Tcsb0AloUfZ/UmCMifRuGFhIDApH0H
	 Az5Z4HStPonWNPWFWRvNHNH1dpAJBcOmF0kjf22TZZbLI/0lc14okQy7l2mL+774kd
	 xDJLGUuy9qAAurbE+ietvFZkMU7uVW4CsnN1yJjEjp2q9bwNUEiEFyqnIn3Ws84Me7
	 SuK4Nhtp5xFeb04DUtTfbaHy25BYNCjMtViNSxg5ETt++Yo2dnRyewoGKu+I9BFuLr
	 NteP3+9TSWmUw==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-59b76844f89so3775088e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jan 2026 01:25:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUTHkH64tUHka9lckH9vLrWJmbk/rHNLcTLFVSb2HStdHDCE5vrWDjnMm2TRGuawRcMJ9umG66IFkAC@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq6wgrigruD7vVBoIGiv0zN9X67ilpiFICwvJKTPellQhMUQ83
	AeoCyScEgpWMFrknLzlsQ2R5/MMcYX+174AaJH3l02+1Kri0Dd3w9kgGyqbxxJFhUM2Vagv6Cg0
	JWFKimITQICu1llYWVmlwtAqsHuh7uC1QWJNQ5f39Cw==
X-Google-Smtp-Source: AGHT+IEhZ9gvmqO+R4MYhOxoy6KfZhrYcqix1J1BV48y2+l8C0iThj5+zW+kkno/ryYX3tJSpLVXkv2T6Sd+udEX2Tk=
X-Received: by 2002:a05:6512:1458:10b0:59b:6f39:9b47 with SMTP id
 2adb3069b0e04-59b6f399cb3mr3565428e87.32.1768209915797; Mon, 12 Jan 2026
 01:25:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251217080843.70621-1-shorne@gmail.com> <20251217080843.70621-2-shorne@gmail.com>
 <CAMuHMdUaO_PwWygW8qss47W_ErB4pm1Z2HQ+edvw1-x7ce7oKw@mail.gmail.com>
 <aV9o1LL0Ahip0O3-@antec> <CAMuHMdXYCNR0ANn152ghFExpWY_yZ5+kyFGGRwA+X-EFUvxZXw@mail.gmail.com>
 <CAD++jLm1u9ChqsftwvbOptiG3Qo2KWxPjqN2snOVuZDYuVST5Q@mail.gmail.com> <aWD53y15NuxrKGxf@antec>
In-Reply-To: <aWD53y15NuxrKGxf@antec>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 12 Jan 2026 10:25:03 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mcq256VgbKf82DBrvPhyYfUioCnfBOg23L3RkA6X8qSGA@mail.gmail.com>
X-Gm-Features: AZwV_QjnmRgpHIATQEzA27V_76IQIV2WP14llS-N8XDAawW-cKB-nQQCcqtsy0E
Message-ID: <CAMRc=Mcq256VgbKf82DBrvPhyYfUioCnfBOg23L3RkA6X8qSGA@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: Add compatible string opencores,gpio
 to gpio-mmio
To: Stafford Horne <shorne@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	LKML <linux-kernel@vger.kernel.org>, 
	Linux OpenRISC <linux-openrisc@vger.kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 9, 2026 at 1:51=E2=80=AFPM Stafford Horne <shorne@gmail.com> wr=
ote:
>
> On Fri, Jan 09, 2026 at 11:07:17AM +0100, Linus Walleij wrote:
> > On Thu, Jan 8, 2026 at 9:41=E2=80=AFAM Geert Uytterhoeven <geert@linux-=
m68k.org> wrote:
> >
> > > > > What is the rationale behind using brcm,bcm6345-gpio?
> > > > > Given brcm,bcm6345-gpio has 32-bit registers, while opencores,gpi=
o
> > > > > has 8-bit registers, I doubt the latter is compatible with the fo=
rmer...
> >
> > Yeah this needs to be fixed/reverted pronto :/
> >
> > > > I switch the size from 32-bit to 8-bit using the reg =3D <* 0x1>, <=
* 0x1> setting.
> > > > Also the reg addresses of "dat" and "dirout" are different for the =
real
> > > > brcm,bcm6345-gpio.
> > > >
> > > > brcm,bcm6345-gpio. Example:
> > > >
> > > >        /* GPIOs 192 .. 223 */
> > > >        gpio6: gpio@518 {
> > > >                compatible =3D "brcm,bcm6345-gpio";
> > > >                reg =3D <0x518 0x04>, <0x538 0x04>;
> > > >                reg-names =3D "dirout", "dat";
> > > >                gpio-controller;
> > > >                #gpio-cells =3D <2>;
> > > >        };
> > > >
> > > > vs opencores,gpio Example:
> > > >
> > > >        gpio0: gpio@91000000 {
> > > >                compatible =3D "opencores,gpio", "brcm,bcm6345-gpio"=
;
> > > >                reg =3D <0x91000000 0x1>, <0x91000001 0x1>;
> > > >                reg-names =3D "dat", "dirout";
> > > >                gpio-controller;
> > > >                #gpio-cells =3D <2>;
> > > >        };
> > >
> > > Exactly, the register space and register widths are different
> >
> > ...as proved here.
> >
> > Stafford can you send a fixup or revert patch?
> > (Only need to revert if you can't make a fix quick enough, which I
> > think you can.)
>
> Sure, I'll send a fixup to the devicetree binding and a update to the dri=
ver to
> just support opencores,gpio.
>

I assume, the v3 you sent is *not* it and you will send a v4 with
issues pointed out by Krzysztof fixes?

> Hopefully, that can be picked up in time by Bartosz who has this one stag=
ed in
> gpio/for-next.
>

I'm ready to pick it up as soon as Krzysztof Acks it.

> I'll send the 2 patches as part of my series for OpenRISC multicore fixup=
s as
> the devicetree's I have added have a soft dependency the patches.  After/=
if the
> patches are pulled to the gpio branch I can drop them from my queue and I=
'll
> just have to make sure Linux merged the GPIO changes binding updates befo=
re the
> OpenRISC updates during the merge window.  Let me know if there are any i=
ssues.
>

Sounds good.

Bartosz

> > > > The opencores,gpio setup does work.
> > > >
> > > > Now that I think about it, would it have been better to just add op=
encores,gpio
> > > > to gpio-mmio.c compatible list?
> > >
> > > I think that would be better.
> >
> > Yes this is better.
> >
> > I should have seen this, I guess I was sloppy :(
>
> I should have also thought more, but I don't do this often enough to reme=
mber
> all of the rules.  Sorry for the head ache.
>
> -Stafford

