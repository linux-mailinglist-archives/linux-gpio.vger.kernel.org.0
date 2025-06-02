Return-Path: <linux-gpio+bounces-20873-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA10ACA9FB
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Jun 2025 09:38:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E08E83AECDD
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Jun 2025 07:37:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27B911AF0BF;
	Mon,  2 Jun 2025 07:38:09 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43BC2C324C;
	Mon,  2 Jun 2025 07:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748849889; cv=none; b=UHHlr+rIeEtAWUXQKpm+0E8MYtin3m3fhazfOM/vrUM/VBStC33vi2RDNBcmyFfYMRFs8uSHf8OReLcEXTS5DihyfVCXvAzjhyaGsyBuCGwUmPlY8wExGoSj+5xosnLQXekHfSF5GeaH7Z4zQQVlAldUAhMEOsS83DhXwj4J8bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748849889; c=relaxed/simple;
	bh=z/azy+31HbVsK3NrQuQsrL3BzDrnWedg01lhHJXkgHg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e/K23R84aibVbRFYq4wxkEbJsmhZFF9TnqcQKvSFzz1U/Ssx2RUeoLGZwpmeYeYLrr1QxxL5tqb9u2+w1SMFbGMxspcON48Rx1BAr4AotJ1Hl/dm+Bnhj34bdCIrryrdk2ntGCQtP/a3h8laFAsHwYjrWKv0p4qGZt5X3SU91lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4dfa2aeec86so1749303137.1;
        Mon, 02 Jun 2025 00:38:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748849885; x=1749454685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KvF+qF++Ju4HjkLFrv9Tlh68BJ2ssPJrJXD0AyUXDac=;
        b=IsffXbb6pwy10LLWqQPy1CEkPffz4qzZkBFFhj3fKl5AATj5nu03PLtniwBgg541sF
         PUFzzw29U8NVF+JEawCFyxbTAW10IeF9sQn6/82ZR91DaarJNXPOc5+LDhmkNcE0d/fl
         5vANJ/cQh5KKWUljmQ61l7BGi9NHzvizf4C9Ju8vPB0P3fyqUmMuOOTQQgL9UcaU2ZO/
         9o0yYkQq4ljYsPHeGysQNSwx5MNSxA71Z9NKhgm2eT9eWPyi/2Qf+0hHLRFHGpR+NPx3
         OeLmgpwaj+NfV09ln7aYFZa82RBnsvO1Y4zwfj1e9qLAHMtUx7FDgmA3QoENSusMs9GM
         hxzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJ0wlB+LPpfm8Spo3YP5btDzrBapzQC22cj51+Z8pNh50O5Zx2BXj2sCAaDXHRaOnLhDkcj5NkKccRGwPU+/O8b/s=@vger.kernel.org, AJvYcCVMAxuK1nMNfpDo6cu254o+V/FEs1NzsBV/L05/y4KSaxW8NPByhdVcjTPlWCaiuc0qNMCr8F9y/D7C0g==@vger.kernel.org, AJvYcCWQots3uZjZhILCgzAbNaPfdvbiQH91fOMmRD8BuPzquRiEVuWF+dSiTZqUNgobX1B6MW6Ta27IZY2S@vger.kernel.org, AJvYcCWuKuxLR9+mMRwR+d6fvU+VnaxpO9ANDAhUyd1x95KYoNrZ+MYjr7wmXcadWL2mlH2o8eYElnhuEj9ksLwc@vger.kernel.org
X-Gm-Message-State: AOJu0YystoVgl7DWhJ7DvPCEJjencSgABbgJU56B8+CZQHUJQOyIftkI
	DmAO6+qpwc4qN/NYsDOGBoq7S6KNTRWEwkSBt6og7s6QOO+IQqJbgxDHKMCRcPb7
X-Gm-Gg: ASbGncsylB6dv75aaKIhbnVLwL4jkxbin8PwLQmmg15AG/k+IlgVeVUMfc+c8i6cXD9
	xPsQVqY1rKjOmB56Vz+KuVICb0fGopGeDhsaAOseT/reTLQr9KUGG6Phh9guYaOs8N55mkxltD7
	XCYqnWQfXW19Q7qIhg7besQL2JMaxsVE1scdt/1XCHFcriBXxRREGjtiDMrcTFjbFNKx9lQOrnl
	pQZYp381gWfcKEUJYUMm4clM/23Sus1Lfzo7Q5W+Er/nccXA3vCHww3P8Er6kVARE3Lj8rwukEJ
	PKTvqVCu/3ZAj4uEJbmFbgjrsUJi5t5VWGG5yQDm311HnvhyGybthhn1Q6HB08CENGlqmaHf2c+
	mebFC2Nw5zT4THw==
X-Google-Smtp-Source: AGHT+IGoQh49bLD7mAb41upUfLsuK/uirwnIDPQ1+qdF0F3eZUINEucXabOrg90uyU8y94EZ/vRIGw==
X-Received: by 2002:a05:6102:41ab:b0:4e6:1a8c:13dd with SMTP id ada2fe7eead31-4e701bcd515mr3722156137.7.1748849884947;
        Mon, 02 Jun 2025 00:38:04 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4e6444644aesm6956659137.7.2025.06.02.00.38.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 00:38:04 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-86fbb48fc7fso715382241.2;
        Mon, 02 Jun 2025 00:38:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUF7ruovotgD7iXeZtg8NYtA9SXeLphVWjCpXakW73obNZUSe4fF3uFvoc8/FKkcgNsb5xzet+ar11M@vger.kernel.org, AJvYcCUSC9Q2aCCISgm7/rSznQ9uBIw0jzSM8cbLPqqTOgAEyiYXZ/sKKKrFDmyfi9/CVlB7lB4xIOOYBsf07A==@vger.kernel.org, AJvYcCXKwhI3iyzg/7UGmAAel3isENSMGlCob7BUWwFCPlnXPptq2UDKXuQZa5bHAP06NjWF4dJWt4imMboWkzAq@vger.kernel.org, AJvYcCXSQl16M1gZpSfLTRGMvJEFw12MYNgOQb7O28fSBoEzKYZ+jndPvEUTmI6DW8jrjrKoZY+ZuKb0i/7UjYO48lWxOTM=@vger.kernel.org
X-Received: by 2002:a05:6102:cd4:b0:4e5:59ce:4717 with SMTP id
 ada2fe7eead31-4e701bd47dfmr4263071137.9.1748849884043; Mon, 02 Jun 2025
 00:38:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519215734.577053-1-thierry.bultel.yh@bp.renesas.com>
 <20250519215734.577053-2-thierry.bultel.yh@bp.renesas.com>
 <CAMuHMdWHUuLiwG+-znzGxqWzYHo3Um7e+yrTJeb-Ei=SQ8TjGg@mail.gmail.com> <CA+V-a8vDMon-cHLYr3PknWvgT5EJ_4d9tv-J+iapst1iiPo0Ng@mail.gmail.com>
In-Reply-To: <CA+V-a8vDMon-cHLYr3PknWvgT5EJ_4d9tv-J+iapst1iiPo0Ng@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Jun 2025 09:37:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVebPgJP5wp9J-kBJERBFdvrSObXoSbGJ4tRFGU_4UrXQ@mail.gmail.com>
X-Gm-Features: AX0GCFsij9B8ceLPh_XqmZWRKnVD9OsdXPDNAmXIT94jCXa0CeV26CPPbpztW_Q
Message-ID: <CAMuHMdVebPgJP5wp9J-kBJERBFdvrSObXoSbGJ4tRFGU_4UrXQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: add compatible for Renesas RZ/T2H
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>, thierry.bultel@linatsea.fr, 
	linux-renesas-soc@vger.kernel.org, paul.barker.ct@bp.renesas.com, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Mon, 2 Jun 2025 at 09:12, Lad, Prabhakar <prabhakar.csengg@gmail.com> wr=
ote:
> On Mon, May 26, 2025 at 6:03=E2=80=AFPM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Mon, 19 May 2025 at 23:57, Thierry Bultel
> > <thierry.bultel.yh@bp.renesas.com> wrote:
> > > Document RZ/T2H (a.k.a r9a09g077) pinctrl
> > >
> > > Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> >
> > > --- a/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
> > > +++ b/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
> > > @@ -194,3 +209,13 @@ examples:
> > >                      power-source =3D <3300>;
> > >              };
> > >      };
> > > +
> > > +  - |
> > > +    pinctrl: pinctrl@812c0000 {
> >
> > The unit address does not match the first reg property.
> >
> > > +            compatible =3D "renesas,pfc-r9a09g077";
> > > +            reg =3D <0x802c0000 0x2000>,
> > > +                  <0x812c0000 0x2000>;
> > > +            gpio-controller;
> > > +            #gpio-cells =3D <2>;
> > > +            gpio-ranges =3D <&pinctrl 0 0 287>;
> >
> > GPIOs without interrupts?
> >
> I think the intention here was to go without interrupt support for the
> initial series and when later support for ICU is added we add this
> property. Hope thats OK?

Yes, that is fine.

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

