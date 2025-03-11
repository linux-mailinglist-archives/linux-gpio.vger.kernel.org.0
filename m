Return-Path: <linux-gpio+bounces-17416-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB8DA5BE40
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 11:53:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F01716E78B
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 10:52:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DBFD2505C5;
	Tue, 11 Mar 2025 10:52:56 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0752D2505AF
	for <linux-gpio@vger.kernel.org>; Tue, 11 Mar 2025 10:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741690376; cv=none; b=is6Hz52j2v+WyR/0JkYo1uIuy611DTxkqB1uJ2D3NllhzWWX6J66MHCyx8zg8NHUfhq4XIycAiSMGVKFCLU+bjroRDOqwtrL75ZLDXJ2Q5zE6uTHD+xE31QvFtwZdEpWaWbWAwX1dwjhtIQofq6SYTN2CmZZqfJ+lmCN5euOkPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741690376; c=relaxed/simple;
	bh=gmNI7VVQha7Z+eFdYoMLyllxBH6ItQ/ta4/T4rcGPqk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kQY0NYVfAcq+Li7xyhZCLSAxgEbEqTTgzdyb8C3Ob/TIVUb4hwF+k96ppwaTO5xwge/IcOlJnr/HvgiLI65lWwIKMJ62VS3NAw+0sJuIm2eIqAu6U+JUDsh7t/q/uE+gl/9BBHw0qkxpiySXLwhAh9eZAPYU2OYFslCC4nmB3z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-51eb1a6ca1bso2170300e0c.1
        for <linux-gpio@vger.kernel.org>; Tue, 11 Mar 2025 03:52:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741690370; x=1742295170;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fGAHl6tMue89g5EW7kXwynu+8ote30GHCobzq/hXjLM=;
        b=Juskrm05DYFkzC5ADTFRKRoO2ZyiQkjltvlUcsCtRWZErBPcRSyG3tgGOLLsxa8FXl
         /rWEHpvP8wWxdVJg2CsLZF0Wta+4w4QiWLfP7tNgV9LY0Ohmcn8+/prDF1hw4D4rgHFJ
         IwKvBrbRLpw9CvwxSfMu61ykqHjd6RP2YPY0dNlgZBclnfrfj1towDsydsxArykJTlvZ
         GlKCXk2fCj5hFNNMBOcH53c4YYvuccpFuDf1Nw/wEqPSXH/1JRV1E6W0cFBfWRnAZVDH
         C9ZDaPLCVGjjlEpX7ZuNZWWDFsMNiM01qLpc9TXQ6hdvwtrd6znNod9HrxKmEKgrLEgE
         b8tw==
X-Forwarded-Encrypted: i=1; AJvYcCUpPcH/WaEalVWw+720YD1Mub862pMuZHDzO5Rtp5nRvBnwcwkau00Pks7NAaSNC+OaeLSx+nWQtgN+@vger.kernel.org
X-Gm-Message-State: AOJu0Yw62xEiTIsshO0GoU5GbkPpGheihJZ6YDPFsySSVlK5UfooteJD
	3jQ7zBUThGnTjtAl4mGKIYNrrI9J99SwSKhIy0552nzHlSckp07afOI0xRRM
X-Gm-Gg: ASbGnctxSQLE4EIufwoOrP5rF4vtxsoV9NbR48rTb5mcq64ga5oJRwelZuFnj0jnqk7
	nbRg2taLZ8l+M/fIHfd1qFZbTg0RdFAklTR3mppTYElYEoEcVAthDsxArqUjd9D2WOftSnjEx43
	Sjgoh7/PkqlVpdgjl4ydxKlayfxiCqkIXsSiisIgZs3px16DxMxHsoO8EiHd29UTvpUOL4UQEsT
	V/Ceq2P2LZPNUuvFTuE/2i09FuvU07HmeGR0KC0dIKdKbY5imPZu1x0dyma/PrfMj0vDT6RXTDp
	wuOYCmloWpirEmCEprZUoLBjm6M6JVQX4h4rolvA4U7ciiuBc+TrR30sjbPirAEZhl9CLsmyR/m
	iV9HRLkc=
X-Google-Smtp-Source: AGHT+IG6tdRNrf3Bk9nFQbGsABIQMauXPWKDTViXpOs1GamimglB5cmKG4IlAtWEDUAEwmJ66c5shg==
X-Received: by 2002:a05:6122:2011:b0:520:42d3:91aa with SMTP id 71dfb90a1353d-523e3ff118fmr11267106e0c.2.1741690370075;
        Tue, 11 Mar 2025 03:52:50 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-523d8ac1ec7sm1748677e0c.11.2025.03.11.03.52.49
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 03:52:49 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-86d5e3ddb66so993752241.2
        for <linux-gpio@vger.kernel.org>; Tue, 11 Mar 2025 03:52:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW/0aBCYiq/uXss3eamfyQmVfz3yq/0UT8f3mmbkPF59MkgI/gBMyFmPJ24RTHuTj47Anos9koSWHkd@vger.kernel.org
X-Received: by 2002:a05:6102:1606:b0:4c1:9cb2:8389 with SMTP id
 ada2fe7eead31-4c30a50195bmr9794872137.2.1741690369014; Tue, 11 Mar 2025
 03:52:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMRc=McUCeZcU6co1aN54rTudo+JfPjjForu4iKQ5npwXk6GXA@mail.gmail.com>
 <CACRpkdZXm9eFJ2nzb5Gsm_ddirt6XZTQyu2G+vX2FB+=L6Lttw@mail.gmail.com>
 <e5bdcca6-4d1b-451c-8fde-990db9db23d8@denx.de> <CACRpkdaGeV3v80QuWwus5rg9GfKkT_gzhvRgfOobnDMUO2cPEQ@mail.gmail.com>
 <d29f36d1-53e0-42d3-beed-cc228553f658@denx.de> <CACRpkda-0+9u1mu8gJPwE_2ykY0TeoDS3t2_D-HoPgUQ45gfiw@mail.gmail.com>
 <CAMuHMdW=bttP01Jigtn1DPyzVzTNr3GguNTo4Kw=NOBhhhthRA@mail.gmail.com>
 <CACRpkdZ4XOrcSOawd551tNx7qzexOguzboaA_6Z36QPfK7a0vA@mail.gmail.com>
 <CAMuHMdXbY6J9HGM_WP+9tJ8LDaZP0=XrE3dciWX8Qmiss2spZw@mail.gmail.com> <CAMRc=MeqG9-15-KCpXc2NCqj9X3Hj2m1rjUmPWLNV3Kdzv_Sfg@mail.gmail.com>
In-Reply-To: <CAMRc=MeqG9-15-KCpXc2NCqj9X3Hj2m1rjUmPWLNV3Kdzv_Sfg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Mar 2025 11:52:35 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXbEQDdgDie_EDbF8RrNejkXQrPxNmpvKaQcaAQFxWeNg@mail.gmail.com>
X-Gm-Features: AQ5f1JoUAWEmKfsClIp5BphmG-bTdTWLFHq1ge50O3fwIu3v0b9svNIBL3DTTHo
Message-ID: <CAMuHMdXbEQDdgDie_EDbF8RrNejkXQrPxNmpvKaQcaAQFxWeNg@mail.gmail.com>
Subject: Re: Replacing global GPIO numbers in sysfs with hardware offsets
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Marek Vasut <marex@denx.de>, 
	Ahmad Fatoum <a.fatoum@pengutronix.de>, Kent Gibson <warthog618@gmail.com>, 
	=?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bartosz,

On Tue, 11 Mar 2025 at 11:28, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> On Fri, Feb 28, 2025 at 10:53=E2=80=AFAM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > > I think the whole point of the thread is that this so-called
> > > sysfs v2 is supposed to be recommendable because users
> > > want something like this.
> >
> > Let's keep it simple, and similar/identical to the existing API?
> >
> > Is there anything in Documentation/ABI/obsolete/sysfs-gpio
> > we can drop? edge?
>
> I would like to object here: I really *don't* want a fourth interface
> to support. I don't agree to a "sysfs v2" ABI. What I proposed is a
> backward-compatible *extension* of the existing interface and then
> gradual removal of unwanted features over time.

That is exactly what I meant: do not invent with a new sysfs API, but
remove from the existing one, and simplify its backend where possible.

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

