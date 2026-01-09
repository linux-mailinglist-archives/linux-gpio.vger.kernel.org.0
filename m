Return-Path: <linux-gpio+bounces-30325-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E1DD08817
	for <lists+linux-gpio@lfdr.de>; Fri, 09 Jan 2026 11:19:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D22AA301D322
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jan 2026 10:19:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81FBE32FA24;
	Fri,  9 Jan 2026 10:19:34 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B60B3358DF
	for <linux-gpio@vger.kernel.org>; Fri,  9 Jan 2026 10:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767953974; cv=none; b=CFTsx5Oz2JAQQUKVHA+2z/rE9+yn1HlLt+PnLketNl9VMp+g+26YT+Ar/sBk9i5zz9ehEr1vRMM+AJQKb1c//0PerFsel3gL/SNUtrZR6LaPhYbCkqrheRnNFIgDZaxhbdZ4QKZAbuzs3OWX95sWAZseimXl4BL4RvmQP1T7rD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767953974; c=relaxed/simple;
	bh=iBgJn4Oei4MSF7wX/YOhYnpZ1nzYzLulaCt82baVuLA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IY8DLGxznr0hl20QRLi/WbzfLHFixd9hrDJzipd7V3Jd7JpB3GDrTUrWw6u9roIhqu2vGWE5yz9evfC6MiF0yrnJZlG5XMfHCsBxHCJrWpByHB79iAM9suEUQzXIHOgUgWCU/+Ok1xKBE5y3haVkwWLv7Hbv+CQDz/j4fGNjrx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5636274b338so685958e0c.1
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jan 2026 02:19:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767953971; x=1768558771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=68fD+2d6dtiuvezPQdm8X6562nqf1sN2gN86wHzPt+o=;
        b=MaOxZAXcxjiRN1jEgkkMJMsdPnAUnnn9b8u5MZVS7OBoPsdHFlb6io+LzyQEn4DFqq
         z4g5TbAcnr41Xv+69aLt/jocDVayJ8FHH95SbolvGc/DZ7hWpdXpjQ8cz7DL/lOM+NOb
         ucAF0bROa7w8yfObLS6DnUD9tza/HTzRS8Bj4zVK+lav0bPOzWN0GQqceFXXR50RfCfB
         kmjgUzVbnuzOMapPPfKlpInsX/L28U0EGpClVOmq+VR60c39BvXlTQ2SwFIN/IuGhRzJ
         8Pja7AyW1ewfAETMwPpRPWNdbMMk9PiyRNkD9VuIqR66VJgMUIlr28fHrtrnMGfL8Fp1
         UlWw==
X-Forwarded-Encrypted: i=1; AJvYcCW4DcdwcX9j373WdO1XrnGh+s9HId2Vr15J+VI5vQnBkAXQhZKpaQKXrnD+LY4uVyg2ZS9+1jN0zTyt@vger.kernel.org
X-Gm-Message-State: AOJu0YxBalZFAl4/1TCsbeZgbWB1CXlDKdZXXdPpmHzAQhXXw3koWgll
	ncZW+s4LBY45EJvjBKD801w+BBEGD4Eet6mVhm/qMju8gjLcwvxFTxHKI1IMKb7N
X-Gm-Gg: AY/fxX5a8fyTn4B+e2d+/bspBUmjpkic1Bwurm6jENgkSTPiFUxrBGssQsswC+Eps0m
	Cvq3Or2od6PdJndDgr2lJPzJ4saZJKjob61rzYvoNy6sXcOais8J/Zxgl9GHSBys3mAVjrVsS9I
	A0MJ5tTq6cER3QTg7nxjcpDUPxxDvvEQuUJDMfinHpIWZCT1+EjL34UQ33VpsQaAF9ccnP1fNIc
	DiYkFY1l2KYYaKrTQCtbqr+BwNaGBfWJuHxRnhgt+7aslMfO+0HWah8SEbpHY+Ho6pFigquvv04
	oTxsLdviHHJ6wsVarIo6iRuISQndicAO+e73rCuvFPib4wuRLyb9E4T9FTa5L/bC1eQhm8UakjQ
	OeiH7t5wmdMGd6Z4Sh9UMHVdV2IpjR+rIxXlPCm43GoHwIDEGL3/NLimceBPmLo9kV3BtVsSdjn
	UV38Rs5wnJZDTfhUcNYd5FJQRdIHZsw6slE6NtjjImOD5VfcbK
X-Google-Smtp-Source: AGHT+IE/xm8wi5hII4TMuf4OTgfSC+tnAOgYbLVXzYoKjWSfR+mF+l0KKj2pB4AerP1ZhiRpdX/kDA==
X-Received: by 2002:a05:6122:660c:b0:557:c734:ee5 with SMTP id 71dfb90a1353d-563463a0c22mr3822969e0c.8.1767953971545;
        Fri, 09 Jan 2026 02:19:31 -0800 (PST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5636c753392sm308239e0c.6.2026.01.09.02.19.30
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 02:19:30 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-5ecddf73062so1938193137.1
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jan 2026 02:19:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW49NHLIr5rHL1MucwK3zKUYshSHuROKXDMy3OmGOaQJ98ts9D5TKFzVhz43sTkTFzuKT04h4Dj6N0L@vger.kernel.org
X-Received: by 2002:a05:6102:5490:b0:584:7aa3:a329 with SMTP id
 ada2fe7eead31-5ec7556654emr5715287137.4.1767953970208; Fri, 09 Jan 2026
 02:19:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251217080843.70621-1-shorne@gmail.com> <20251217080843.70621-2-shorne@gmail.com>
 <CAMuHMdUaO_PwWygW8qss47W_ErB4pm1Z2HQ+edvw1-x7ce7oKw@mail.gmail.com>
 <aV9o1LL0Ahip0O3-@antec> <CAMuHMdXYCNR0ANn152ghFExpWY_yZ5+kyFGGRwA+X-EFUvxZXw@mail.gmail.com>
 <CAD++jLm1u9ChqsftwvbOptiG3Qo2KWxPjqN2snOVuZDYuVST5Q@mail.gmail.com>
In-Reply-To: <CAD++jLm1u9ChqsftwvbOptiG3Qo2KWxPjqN2snOVuZDYuVST5Q@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Jan 2026 11:19:18 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW_DUyo=uarCpceKcEq9Hx+q+DHgfHW-m2DOjgAQ5R79Q@mail.gmail.com>
X-Gm-Features: AZwV_QjdcUI-7Z-N_pZ99To6fYeZb0GuLnE25cbH9PblaUhBL8UbvvWFR6RVNjc
Message-ID: <CAMuHMdW_DUyo=uarCpceKcEq9Hx+q+DHgfHW-m2DOjgAQ5R79Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: Add compatible string opencores,gpio
 to gpio-mmio
To: Linus Walleij <linusw@kernel.org>
Cc: Stafford Horne <shorne@gmail.com>, LKML <linux-kernel@vger.kernel.org>, 
	Linux OpenRISC <linux-openrisc@vger.kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Fri, 9 Jan 2026 at 11:07, Linus Walleij <linusw@kernel.org> wrote:
> On Thu, Jan 8, 2026 at 9:41=E2=80=AFAM Geert Uytterhoeven <geert@linux-m6=
8k.org> wrote:
> > > > What is the rationale behind using brcm,bcm6345-gpio?
> > > > Given brcm,bcm6345-gpio has 32-bit registers, while opencores,gpio
> > > > has 8-bit registers, I doubt the latter is compatible with the form=
er...
>
> Yeah this needs to be fixed/reverted pronto :/
>
> > > I switch the size from 32-bit to 8-bit using the reg =3D <* 0x1>, <* =
0x1> setting.
> > > Also the reg addresses of "dat" and "dirout" are different for the re=
al
> > > brcm,bcm6345-gpio.
> > >
> > > brcm,bcm6345-gpio. Example:
> > >
> > >        /* GPIOs 192 .. 223 */
> > >        gpio6: gpio@518 {
> > >                compatible =3D "brcm,bcm6345-gpio";
> > >                reg =3D <0x518 0x04>, <0x538 0x04>;
> > >                reg-names =3D "dirout", "dat";
> > >                gpio-controller;
> > >                #gpio-cells =3D <2>;
> > >        };
> > >
> > > vs opencores,gpio Example:
> > >
> > >        gpio0: gpio@91000000 {
> > >                compatible =3D "opencores,gpio", "brcm,bcm6345-gpio";
> > >                reg =3D <0x91000000 0x1>, <0x91000001 0x1>;
> > >                reg-names =3D "dat", "dirout";
> > >                gpio-controller;
> > >                #gpio-cells =3D <2>;
> > >        };
> >
> > Exactly, the register space and register widths are different
>
> ...as proved here.
>
> Stafford can you send a fixup or revert patch?
> (Only need to revert if you can't make a fix quick enough, which I
> think you can.)
>
> > > The opencores,gpio setup does work.
> > >
> > > Now that I think about it, would it have been better to just add open=
cores,gpio
> > > to gpio-mmio.c compatible list?
> >
> > I think that would be better.
>
> Yes this is better.
>
> I should have seen this, I guess I was sloppy :(
>
> > > If so I will can revise this patch and add patch to gpio-mmio.c.
> >
> > DT maintainers: Given gpio-mmio is that generic/simple, is there a
> > specific reason there is no generic "gpio-mmio" compatible value that
> > can be used as a fallback, avoiding the need to keep on adding new
> > entries to gpio_mmio_of_match[]?
>
> I think "gpio-mmio" combined with compulsory property of
> bus-width =3D <nn> (as used by multiple bindings) would be
> generic enough. So a schema that accepts "gpio-mmio" if and
> only if bus-width =3D 8|16|32|64 would be acceptable.

Each register is described individually, and the width is derived
from the register's size, so no bus-width is needed"

  reg:
    minItems: 1
    description:
      A list of registers in the controller. The width of each register is
      determined by its size. All registers must have the same width. The n=
umber
      of GPIOs is set by the width, with bit 0 corresponding to GPIO 0, unl=
ess
      the ngpios property further restricts the number of used lines.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

