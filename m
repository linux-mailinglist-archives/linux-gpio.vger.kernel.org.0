Return-Path: <linux-gpio+bounces-14661-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B158A09304
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jan 2025 15:10:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 998AF188B1E6
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jan 2025 14:10:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA36120FAA7;
	Fri, 10 Jan 2025 14:10:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA2E207A15;
	Fri, 10 Jan 2025 14:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736518207; cv=none; b=CZVrg9zkUe3xwLJAJpx/eiF/ST1jQFCKVBdacyg+x9UQuj6CQTR5jegzoNQ7+LX4kUeYiTbd+jMw7nf6LA2cALYUtLXYdF3l1khBXWCu6so0H8FQ22hOd7Gz4hz4z8zYK0omONllLGnlHHS+IQd40PD8q8nNvx+jA/NYlrEmgss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736518207; c=relaxed/simple;
	bh=VrJW/Msg9cKcKQeHP0xMzAnaj+mPc/7eBP8bzgfg2pY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BAae2KOZyrJRqtgxSyqiiUKkDLKboawQRZuoL2VbSycmElK8q85rOSHzSPYWvG0gTrDOhxxXMH+FjEPLmAfmJStTfdednS3TRzBB6buWdteCQ7CO2FI/5HNTi6S42wJvDZoh9EFZSwFI2wM4jjTNkhgeVrwRzxxc8ZLI5Dx8iyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6dccccd429eso15577756d6.3;
        Fri, 10 Jan 2025 06:10:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736518203; x=1737123003;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GDyk57/J8HQ3yVwzMvPhMpXmN7YUAwR/lulQQxt0euo=;
        b=IFBdL/vrb5GMhPIDa4ucaDCmVO+FuUSYV8f6aUJgmJLAwm0IdrLR5fzbJAAUKVRkgK
         Lw9uFlsiuxSCa2Ojl65hOO3Vv5AC2SZJecFKAr4Srwrfk5V5yhuvSegK5Npo0WWIh8VO
         daf8jgEftd6pSAGqtzgjb66H+vKnXqox7n6er1KrnFbsmedhMq4icy1q7P4HCcxJfe+b
         KxovdFw/wCIL22Fxkt1R1waHrm4g/QzypSk14xMopzZpWVQOXg/uQ1P/cyywPXDa1Ik+
         AyDLfDfTyb5WXesW+yOrrs3wR3UNfkIIQAscH6Jct7Qt2pnd48r/aA061Y+lUFiprQIf
         CABw==
X-Forwarded-Encrypted: i=1; AJvYcCUw/YVy7dLJbbpy0aPJeMbEKttucRddVIyHtrOAZQ3/vuWSoK5Z1OmkAyMjJ5chUXp1WpgRpb3wxoZu@vger.kernel.org, AJvYcCUwaQHjKk1wZeZpTIjBTwvVgPgRlzeLRb//5rKqNs5E10b76CVMxOT+b9PbZAN2oE0TG0PmKYmInNGFPg==@vger.kernel.org, AJvYcCVo8+3fK515xIG+rJbd94O2G3lrJuu9OthzKQ2DwAVaB+mGXTgajCsX25quJsgRNCNXwOW97lcQKY4G2Qza@vger.kernel.org
X-Gm-Message-State: AOJu0YyxK5T5BQPRm+s7V0pFehXAleVWQ3jpvQuM4IOiwaeR2gSV6k6H
	I25USIJ0Mve9HpbpKVslLgbkBBigGralN0WA8qEYTAYDGe3zW6BLi5do2xW/
X-Gm-Gg: ASbGncsiy0JFntzzzyNXurvQWbMQtCx4gzSRVArLn8BSDQviDC0F5klNkbIGC8jImBx
	gWyDTYwH3jcEANudweRUjXCShmcD9nbk3yB7NkOWOJ1j9j9EVrcIEDAj2jXgWE2RUNeS47Xy1IE
	m3L6KUyq4XkxmI2GlZ6RID5rsNQGUcehXNkuJk/RFXLFqTwlP8CgPeECYZJ8BncICo0siu3GNa5
	wC/8VuBOaPs3vqrqXt12QpqQO+usP3IxsnS+KN5Xo+BvvECxmrQFflB+JbwpNC7D16/tZfQ3V1a
	Crv8Mv280/FuJb2GUoXe0xw=
X-Google-Smtp-Source: AGHT+IHy+H/vYgNkSdCvHfdbX7xnIJDqe3JLN4r5wVQVnoHFYNff/u5iu6OlwaMMhAzGiE+1PKpzvw==
X-Received: by 2002:a05:6214:3112:b0:6d8:a1b4:b591 with SMTP id 6a1803df08f44-6df9b232915mr201071566d6.23.1736518201654;
        Fri, 10 Jan 2025 06:10:01 -0800 (PST)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com. [209.85.160.181])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dfad85f658sm9524546d6.5.2025.01.10.06.10.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 06:10:01 -0800 (PST)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-46792996074so19120311cf.0;
        Fri, 10 Jan 2025 06:10:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV2ox5VTusqHJYm+2X572uXhPsI7NKXXYCog89ybUYIPyTwXE0zC7ZfZXyDKqAv5N3TN0Hat2CIwy8wT8RN@vger.kernel.org, AJvYcCWdaiPnZKjpsddXHVUDKhlh3wGsi9DRE4gAPmXroi45Hfd+4sAGYTHmXG64K40JhPgahb8JYGIasjTt@vger.kernel.org, AJvYcCX8iDphDKU20IJbcIw2LGSOhnNbx8c28WZjyK3t40NesAko547YUEbB2BiHZA3gYdwAmuJSxenaI+1eMQ==@vger.kernel.org
X-Received: by 2002:ac8:7d8f:0:b0:467:45b7:c495 with SMTP id
 d75a77b69052e-46c7108f867mr165009211cf.15.1736518201275; Fri, 10 Jan 2025
 06:10:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250110130025.55004-1-brgl@bgdev.pl> <de6b70f2-8fd6-4e2a-a6c1-466698be8a6b@prolan.hu>
 <CAMRc=MckJfEBK_ZUZ31hh7SMdbr4a-vZLtTGDCFttGK65wbXdA@mail.gmail.com>
In-Reply-To: <CAMRc=MckJfEBK_ZUZ31hh7SMdbr4a-vZLtTGDCFttGK65wbXdA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Jan 2025 15:09:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWhEZ0No8mXdymE8O8+rMCkD2SXAifZwReb1BbfYASOeQ@mail.gmail.com>
X-Gm-Features: AbW1kva3r81VnGwR0hoVjKuOvjAbpVCjw3rRXMh10wLDbHLY9-8QeHpWdyHl4p0
Message-ID: <CAMuHMdWhEZ0No8mXdymE8O8+rMCkD2SXAifZwReb1BbfYASOeQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] gpio: 74x164: use a compatible fallback and don't
 extend the driver
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, =?UTF-8?B?SiAuIE5ldXNjaMOkZmVy?= <j.ne@posteo.net>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bartosz,

On Fri, Jan 10, 2025 at 2:38=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
> On Fri, Jan 10, 2025 at 2:32=E2=80=AFPM Cs=C3=B3k=C3=A1s Bence <csokas.be=
nce@prolan.hu> wrote:
> > On 2025. 01. 10. 14:00, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > There were other suggested solutions (for instance: just use the
> > > existing compatible for the On Semi variant) but I figured the most
> > > common approach is to use a fallback value for 100% compatible models
> > > and this is what Rob suggested as well.
> > >
> > > This reverts the driver change and makes the "onnn,74hc595a" compatib=
le
> > > use "fairchild,74hc595" as fallback.
> >
> > Is there any reason to introduce a new compatible name at all? Does som=
e
> > pre-existing, widely-used DT blob use it in the wild already? If not,
> > then I don't think it's necessary; for any new boards, their DT's
> > authors should just use the pre-existing names.
>
> I don't have a strong opinion on this and will defer to DT maintainers
> but a similar case I'm familiar with is the at24 EEPROM driver where
> we've got lots of 1:1 compatible chips and we tend to add new
> compatibles to DT bindings (with fallbacks to associated atmel models)
> just for the sake of correct HW description in DTS.

At24 EEPROMs differ from '595 shift registers in that they provide an
API with multiple commands, and some commands or parameter bits may
differ among different implementations (but usually these differences
are called quirks).

All '595 (I'm deliberately writing it like that) shift registers
should be 100% compatible, modulo some electrical specifications
(voltage levels, maximum speed, power consumption, ...).

Interestingly, the driver is called gpio-74x164.c, while no '164
compatible value is present. Most important difference is that the
'164 lacks the output latch, which is used as chip-select with SPI[1].

> > I'm especially against introducing a new, vendor-specific (On Semi, in
> > this case) name; if we really want to introduce a new compatible, at
> > least make it as generic as possible, i.e. `generic,74x595`, or even
> > `generic,spi-shift-register-output`.
>
> If anything, that would have to be the fallback that the driver knows.
> The first string in the compatible property has to have an actual
> vendor (I think, I'll let DT maintainers correct me).

For the inverse operation (parallel in, serial out), there's just
"pisosr-gpio".

[1] https://www.ovaga.com/blog/transistor/74hc164-vs-74hc595#simple-list-it=
em-2

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

