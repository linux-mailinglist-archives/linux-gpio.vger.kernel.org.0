Return-Path: <linux-gpio+bounces-30322-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 342ECD087BF
	for <lists+linux-gpio@lfdr.de>; Fri, 09 Jan 2026 11:16:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 797F33046D91
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jan 2026 10:07:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3415833506B;
	Fri,  9 Jan 2026 10:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h94xtsVu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F182F6928
	for <linux-gpio@vger.kernel.org>; Fri,  9 Jan 2026 10:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767953249; cv=none; b=Db0TLcDSUxqEddSKPIMXskUhab2yBUHSx0R0DbbBPpvTGB7ZenK1sgOosKg1S9Qs9lvH6R+Rz4gBHcJQ+vP73lychS+cRR2ujRLTmtM0Ha7aKHKkJVdZ1CZrH+zeB+ZouGijjvmKvg5Xi6/P37QcQ1RmwgmqBoFH6WsWEVY8v3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767953249; c=relaxed/simple;
	bh=riYk6e8Dd3Mlz7Rg0OW9jG0C2dloU+TtN6raRtCEDzE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s7KlKBk8GG7cNHHLEwrjWCEG4QNsJvFo7rkYaozc3Ixt8fkIT3RY3kpvRkI/gBhNYUj2fH8xg9a5yVZ/gk5HZTop2xpPr23+kzyAthjFMfvOafVdoKbgTwIOThUeVrWq3K+q5mOJwG5qCrKmx+L/vHcMgLt1inw2FB6Pm02UirY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h94xtsVu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A14F4C19422
	for <linux-gpio@vger.kernel.org>; Fri,  9 Jan 2026 10:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767953248;
	bh=riYk6e8Dd3Mlz7Rg0OW9jG0C2dloU+TtN6raRtCEDzE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=h94xtsVuiwJwpeajC84ICPNrMguGqpOSsSc+0bro1fvBnKfpW29OwXb2uVl29PNvf
	 76ou2YxV6bRA3YwP6eZzY/dK2HwY5QPpg2b4ZHL/3RhAVaVRROt8TtVOHjTHIjOCKL
	 6Pp2z8QpxoTWSzEvcCZRxdS/IOCGYbFocx7VQXy5p/Qs5AiFtL2cWGJrCTOlh/NKx/
	 yow/vuIu2CPnawBJfldZgIlgg4rvvcII9xAoTA1hKvLJpnkhs6LtMd0CKWBHcFaj1e
	 9ngpxN9LzN4kuWc4iWYfAthE1KVuZjG2kzFBiscWuxbC8fPmho3ZuRT73iPAV0jtlW
	 tpxBL5C+ah2eA==
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-78fba1a1b1eso45305037b3.1
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jan 2026 02:07:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVHNoDSkbmzgsj0HoW2CNvPLC8Bv2drLKL0mMzh5AQSjUVpAtMkCO4FXifUvj+H1QKYBnn39yAJ/Zh/@vger.kernel.org
X-Gm-Message-State: AOJu0YxyTPK3j0/NkoK98N5yaR6661d+CP6+bJdHR53B8qwrpJ9Lfk2T
	HyJrxxXZODCK7UPz94e3i0IxZkNUszV8XvWqdMGGfBINKC3IOveOMRr0hf0FlJyFhSiACflcikM
	M40RPSXqZFpiUGOErveNz7pwP6HEefGs=
X-Google-Smtp-Source: AGHT+IFtop6NgCgOGI2H1Tf/ZLX96R4DPoeTPeexiIWoM7CJ9zqZb3ZUELl4TWvlqDYKeuVlYNTkL5bIobNwleTDJaU=
X-Received: by 2002:a05:690e:1699:b0:644:60d9:8661 with SMTP id
 956f58d0204a3-6470d3164d0mr10216937d50.45.1767953248025; Fri, 09 Jan 2026
 02:07:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251217080843.70621-1-shorne@gmail.com> <20251217080843.70621-2-shorne@gmail.com>
 <CAMuHMdUaO_PwWygW8qss47W_ErB4pm1Z2HQ+edvw1-x7ce7oKw@mail.gmail.com>
 <aV9o1LL0Ahip0O3-@antec> <CAMuHMdXYCNR0ANn152ghFExpWY_yZ5+kyFGGRwA+X-EFUvxZXw@mail.gmail.com>
In-Reply-To: <CAMuHMdXYCNR0ANn152ghFExpWY_yZ5+kyFGGRwA+X-EFUvxZXw@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 9 Jan 2026 11:07:17 +0100
X-Gmail-Original-Message-ID: <CAD++jLm1u9ChqsftwvbOptiG3Qo2KWxPjqN2snOVuZDYuVST5Q@mail.gmail.com>
X-Gm-Features: AQt7F2pnPTebbIFltdZPnHxWAsTxQNpdBrfUBhaGeXTwRyFgKEPvC4aG4NGA5cs
Message-ID: <CAD++jLm1u9ChqsftwvbOptiG3Qo2KWxPjqN2snOVuZDYuVST5Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: Add compatible string opencores,gpio
 to gpio-mmio
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Stafford Horne <shorne@gmail.com>, LKML <linux-kernel@vger.kernel.org>, 
	Linux OpenRISC <linux-openrisc@vger.kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 8, 2026 at 9:41=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:

> > > What is the rationale behind using brcm,bcm6345-gpio?
> > > Given brcm,bcm6345-gpio has 32-bit registers, while opencores,gpio
> > > has 8-bit registers, I doubt the latter is compatible with the former=
...

Yeah this needs to be fixed/reverted pronto :/

> > I switch the size from 32-bit to 8-bit using the reg =3D <* 0x1>, <* 0x=
1> setting.
> > Also the reg addresses of "dat" and "dirout" are different for the real
> > brcm,bcm6345-gpio.
> >
> > brcm,bcm6345-gpio. Example:
> >
> >        /* GPIOs 192 .. 223 */
> >        gpio6: gpio@518 {
> >                compatible =3D "brcm,bcm6345-gpio";
> >                reg =3D <0x518 0x04>, <0x538 0x04>;
> >                reg-names =3D "dirout", "dat";
> >                gpio-controller;
> >                #gpio-cells =3D <2>;
> >        };
> >
> > vs opencores,gpio Example:
> >
> >        gpio0: gpio@91000000 {
> >                compatible =3D "opencores,gpio", "brcm,bcm6345-gpio";
> >                reg =3D <0x91000000 0x1>, <0x91000001 0x1>;
> >                reg-names =3D "dat", "dirout";
> >                gpio-controller;
> >                #gpio-cells =3D <2>;
> >        };
>
> Exactly, the register space and register widths are different

...as proved here.

Stafford can you send a fixup or revert patch?
(Only need to revert if you can't make a fix quick enough, which I
think you can.)

> > The opencores,gpio setup does work.
> >
> > Now that I think about it, would it have been better to just add openco=
res,gpio
> > to gpio-mmio.c compatible list?
>
> I think that would be better.

Yes this is better.

I should have seen this, I guess I was sloppy :(

> > If so I will can revise this patch and add patch to gpio-mmio.c.
>
> DT maintainers: Given gpio-mmio is that generic/simple, is there a
> specific reason there is no generic "gpio-mmio" compatible value that
> can be used as a fallback, avoiding the need to keep on adding new
> entries to gpio_mmio_of_match[]?

I think "gpio-mmio" combined with compulsory property of
bus-width =3D <nn> (as used by multiple bindings) would be
generic enough. So a schema that accepts "gpio-mmio" if and
only if bus-width =3D 8|16|32|64 would be acceptable.

Yours,
Linus Walleij

