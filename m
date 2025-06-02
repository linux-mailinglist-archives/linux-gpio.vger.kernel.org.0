Return-Path: <linux-gpio+bounces-20872-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 261CDACA9BA
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Jun 2025 09:12:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 874527AA9BF
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Jun 2025 07:10:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8D921AA1E4;
	Mon,  2 Jun 2025 07:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KToXxxLi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC511A3BD8;
	Mon,  2 Jun 2025 07:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748848325; cv=none; b=Fd0GsNksw7XnlkvrPbdUqjFAYBVfD4uA7Ysvln3KHtqUoQ51owvoHrKpi37s1kzeseMIoXGzVk5A36qEiSSAwmhZWP2og7zJJg3HE3rgeieiTI1zWuiA71kTgW+58BFz1HGT+9m6WFAflZX/hSWW7f0ErWnKhMTfMi+Pexek48U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748848325; c=relaxed/simple;
	bh=gzyTPYdHZDzfpiv/PswNbInUHCIWrf5/1oG/SU9KQw4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BdxkJXYwEK4EVKWe19sfwtD8cyqIaBVIy3T6s9pmW5DIV0alsfuB0EHV5gGr7pRP4SSABSDFZVlbKDljgbzJOixY1JKe6zojc4PF4Z0bwCBnTgpW1xB+F8e4UGloptKpavM5enK8s2VYLp1uCPPUXsaKlP4nBH2F1DKjx9YXxK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KToXxxLi; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so43030245e9.1;
        Mon, 02 Jun 2025 00:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748848322; x=1749453122; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=72mYwzhVoJtQVSUnhs6gBBr3Mq5AOdDOWPdFx3kmhrw=;
        b=KToXxxLi58OqEj2KO4zjtH+5VfxLyo+SiTl97fw6cIDbWTO4KUN2NX9TMU6VLgCDZX
         vvw1ki3JsCu00dlKnZN5Mfv4+h4Gv5F2YBl4Bx9yXCx+6peLtBKbgs5CKhFse638f0I4
         KebqlPVQJnRqAT0HR1svjME3JcCkD9zPqDvnY/nkOM1xVCoPmIu4k6nVA9r9zpcLxFVf
         8ltFaty6p3lU5pLbDD41/xgzxmZbRQW0Jxb/9B/roL6Nrog5iGRYYEEAO1VAWVEKhC2H
         N2x5ZDyoA9rC7/k52eoMxH19m9L2EhfWBr9yiQpI/uK2hvhi3GdGCI9h9KK2+WLdkGmQ
         NVZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748848322; x=1749453122;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=72mYwzhVoJtQVSUnhs6gBBr3Mq5AOdDOWPdFx3kmhrw=;
        b=HZEy2EchVdMgRUzWndrkx1VyQe/hbNVCIea04GLnK7DKAeFVPt0vt+72wRgIXW8GV+
         4Os3vK5UtQ8uLa8DWmIenY65sW3vWMvkS0w1p6Vuid4JNRhU1XCS0Ep9Bz5ApZnW7zrs
         +6yrw/Hi5WGtaVcYUsx58BvS+IBHDhPawEPPAZSqq15UhhkpeD9V4Fo9mke3PkqKXhSC
         7b6t/6WqEwUs4ZXHfu+EY3S2Fk0YeFAFFlG7H/qW8eLAJ/BEEkjDqRwDZM0dR4Xh2U3h
         Ex113OZUJGuI5HGtq+tSmdSt3gyoOgIoLmdc/iAiQjEPBRwYFI1HUz4t+Ze9NWIL0Z2g
         jNHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFrDysxejMorm02lmNuZ1UfRasvSSIBLTXGSC27oP/fksdsyKz6qNjZs6+Md+AurxiU/8Cwk75PfG9TA==@vger.kernel.org, AJvYcCUrw+xCfQK5nXKGKXG+uITEPsJ4F2tuPE69ROds8VptA68jGDC0+Kzq11gPWTFvtn5R3kPWsn2pFO/3XnUyp0NXxgM=@vger.kernel.org, AJvYcCWlj0KVVqZRjXRZ0DCAeUuHMCB+UCr7l8T+aCIYURUGwEtkSTaBj5B+kmQsgDlstaYjEdnoCAmeU7Cm@vger.kernel.org, AJvYcCWxvdOItkGHpyCI2P15AuFTjf5YBUclTuFK8QXXxyBPD4jMHTI4bvWpfbYdmU18WDVxA+E0LIstnr0o+f3m@vger.kernel.org
X-Gm-Message-State: AOJu0YxTsJo5NtQDasjK/ZtadQz+eQpc0u96iMwhwnDfwFk8ZhHj9sYw
	GOw6xXDw4/z4Nm9hgD+S/4QXVnCJ35XXnuaQluSkoSL9LMCjxkfqeMaIgtTxccpTYqv/uiWABNe
	7g58pVbQbIuR7+LhvXHBY4ElYT3kk2WWyH5Bg82Y=
X-Gm-Gg: ASbGncuEqVAzdqc4Uo38TIB+I6DXr374cVOoe+RC2+/j55tqGQhsQJaw22z2ptr6k+t
	eowBZBaJHW3U9TkMfeC8zW7vg/x7+PshQR7MMsDYEuWaVUfkY2ctvExnuBGe9KsrJbd1RmVG3k9
	Eomumu4MyE2gFIN8Jyp95i+E9TBv5EHW8f5tE=
X-Google-Smtp-Source: AGHT+IEvjvcJreu2EylKqUuP9bGIMVmp7sVOy5gNvC0B0qpK3MUv6d2yQwiHqi91Lcx69Z+J83R1Rv/Y3AGQ8zDMF/s=
X-Received: by 2002:a05:600c:6a93:b0:451:df07:f437 with SMTP id
 5b1f17b1804b1-451df07f5e4mr5438805e9.30.1748848322001; Mon, 02 Jun 2025
 00:12:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519215734.577053-1-thierry.bultel.yh@bp.renesas.com>
 <20250519215734.577053-2-thierry.bultel.yh@bp.renesas.com> <CAMuHMdWHUuLiwG+-znzGxqWzYHo3Um7e+yrTJeb-Ei=SQ8TjGg@mail.gmail.com>
In-Reply-To: <CAMuHMdWHUuLiwG+-znzGxqWzYHo3Um7e+yrTJeb-Ei=SQ8TjGg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 2 Jun 2025 08:11:35 +0100
X-Gm-Features: AX0GCFvUyf9j2te3EZgU8S506Vd-eL4yBbI1uCeiv99mIgjlZLA932YJpQeFppg
Message-ID: <CA+V-a8vDMon-cHLYr3PknWvgT5EJ_4d9tv-J+iapst1iiPo0Ng@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: add compatible for Renesas RZ/T2H
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>, thierry.bultel@linatsea.fr, 
	linux-renesas-soc@vger.kernel.org, paul.barker.ct@bp.renesas.com, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Mon, May 26, 2025 at 6:03=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Thierry,
>
> On Mon, 19 May 2025 at 23:57, Thierry Bultel
> <thierry.bultel.yh@bp.renesas.com> wrote:
> > Document RZ/T2H (a.k.a r9a09g077) pinctrl
> >
> > Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
> > +++ b/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
> > @@ -29,6 +29,7 @@ properties:
> >        - renesas,pfc-r8a774b1    # RZ/G2N
> >        - renesas,pfc-r8a774c0    # RZ/G2E
> >        - renesas,pfc-r8a774e1    # RZ/G2H
> > +      - renesas,pfc-r9a09g077   # RZ/T2H
> >        - renesas,pfc-r8a7778     # R-Car M1
> >        - renesas,pfc-r8a7779     # R-Car H1
> >        - renesas,pfc-r8a7790     # R-Car H2
>
> From a quick glance at the docs and driver, adding support for RZ/T2H
> to this DT binding is a not good match, as the RZ/T2H PFC hardware
> does not have the concept of pin groups and functions.
>
> Using separate DT bindings, as for most other SoCs in the RZ family,
> also allows you to use the preferred order "renesas,r9a09g077-<foo>".
>
Agreed, this needs a separate DT binding file.

> > @@ -194,3 +209,13 @@ examples:
> >                      power-source =3D <3300>;
> >              };
> >      };
> > +
> > +  - |
> > +    pinctrl: pinctrl@812c0000 {
>
> The unit address does not match the first reg property.
>
> > +            compatible =3D "renesas,pfc-r9a09g077";
> > +            reg =3D <0x802c0000 0x2000>,
> > +                  <0x812c0000 0x2000>;
> > +            gpio-controller;
> > +            #gpio-cells =3D <2>;
> > +            gpio-ranges =3D <&pinctrl 0 0 287>;
>
> GPIOs without interrupts?
>
I think the intention here was to go without interrupt support for the
initial series and when later support for ICU is added we add this
property. Hope thats OK?

Cheers,
Prabhakar

