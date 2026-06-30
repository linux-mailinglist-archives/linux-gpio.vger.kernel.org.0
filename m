Return-Path: <linux-gpio+bounces-39249-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FYueM6roQ2qslQoAu9opvQ
	(envelope-from <linux-gpio+bounces-39249-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 18:02:50 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D27186E6387
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 18:02:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39249-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39249-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8C3A53019B29
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 16:01:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4ACA472776;
	Tue, 30 Jun 2026 16:01:33 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D026F472771
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 16:01:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782835292; cv=none; b=aAOaCdTQg824j3nJx/++5jRS4RCAre/OHiUmMKAHaqlmQyNIHLlbQVLqG7BiY3rQoV7gR8G1t9yaOPFseELLXt93lGxwhF1nKQPULtkGLGILnMhxhclF07KVJWJ5a9dqwfacoiXtmLRiKTqiXz0whQUQydtjTsE99Eimc4knOD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782835292; c=relaxed/simple;
	bh=y9uuZkEeJae++MbeR+TNLsbet2X1rPdv40pKLNu47dg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PPXHX9rQFkHGEDP8p0m+R3V1HV1890EWvDkAC7i8rOF+I7BAVaEoPeG6BLQzLJj9R0ukLgG2sq3ZN2CV8uMEcp1RMBzmVbc8GqpuUJDMB22c35RZf2vTg+VllU4CPnpj2KdO5m0L7tEkgxIGTpW/4sIi5eRQ6yirE2Jh/dkNl68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5bdd0779366so37901e0c.1
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 09:01:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782835288; x=1783440088;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vqnNDF5VKQ+E0vRBcJ/LtO+JWbWwBxQUs2IGvWvjH/Q=;
        b=pLVqejmm4AkNgLq+wLlsefvxLc/2lynkKhKcbAcy1CEL3H/FUF0j1i+P+aPEYtCu2N
         uG7URX0giov82iISIyxhXTTIfvyLh6BjuAatmhIKtQzkMvpdioc5HZrjhRPUDG+cIgyk
         JUv9vxobSOk1ZnN7Ba5Vu1rosx25hbtnVlHVldWIVVv1dICT064LTQIZCtUgO2cQjHS7
         RCbOdQHtpmTUXDIxB3QeBPWssyiHgn3HXDf1ZJsKbPKUyXtT9EwkjH9vAINfxkZaDFdu
         KMybfrp9nRW1RG5WHCrGKeVaVL/Oqwj2pRmEV6oGBr1wjpNV0aDHFtVrn5nlXoQK806P
         0gGA==
X-Forwarded-Encrypted: i=1; AHgh+Rp8hyw/Nihw+n1iwX9ZQKcXAdSgzfkietbrEulEx0ojD5rWukwNuNCvq512fKiMImi3hIUKsImovoRW@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5x/1LHtqFoj99reETcpdvHed13SHMonAweRQvwHtEtua+KrZO
	kA+54meZGOppuIoRfs+wyNmdnhmOa1iA2mP/VdIXH8LJZf4dAOLCo8ehRH3QuUDZvVo=
X-Gm-Gg: AfdE7cmVQPyrHCSgErMs26BJVqsyCXFO7L71OBf4C2xyiRxq2pZzwc8Orq2Ir6brRMa
	rlW2MRjPnKkAXIsx8QAoO3HRLIU611qPSljsQ1ZJ6NNXnnWsEXmA27QEwGE311QxJ1sLqV4wEFC
	8cMVpNYqcLmKa2Ukg66TsS1F69aFEHXqWxIjPfQ6s8x5Z6yglPolBmkdAE6P5+X7pn0wZ+2918X
	VUsR4TGE79PAPeQ1P1Hg2HHBz0u23v+y4HFnjFMHq1cdyGoRZmcXugocFbYeG0zNUcKwWNRirtG
	TnPKlhpIkenuRwRcgh1s15nPR8rom9mkqGFXTKsbZ/SVweLXcPHSIAmq7CPj/ZXVcENGxZzQCJG
	8E+C4EGNUpAASLOcrxAke1JVPyJuefx88fx8vxj/aGV7CT97Purb8sfOVbCqWJX7PbamL1dPpzK
	By2/LUk46hV0DUHBQ+Us/zu54IhAix57YHJjG9k/N1TUUluktAs7TaHk5AUHg5
X-Received: by 2002:a05:6122:1686:b0:5a1:19d4:a363 with SMTP id 71dfb90a1353d-5bdbec601c9mr1772035e0c.3.1782835283012;
        Tue, 30 Jun 2026 09:01:23 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bdc1a8d959sm1652327e0c.10.2026.06.30.09.01.20
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 09:01:21 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-9696319e14dso473529241.3
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 09:01:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrkeTie6SdW9UNuts7xXTs4fNtQ/qQQuq/czRHDAiyeVSPWwDs0JILL/Ebq7uRZaArHFI8/pkSRlshM@vger.kernel.org
X-Received: by 2002:a05:6102:598c:b0:738:9dd5:9b03 with SMTP id
 ada2fe7eead31-73a38838db6mr1792608137.20.1782835280090; Tue, 30 Jun 2026
 09:01:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629135917.1308621-1-arnd@kernel.org> <CAMuHMdXhsM4JzArRuB=A46N-Ogbn2Fans+PVJVA-hEytFq=DeQ@mail.gmail.com>
 <ff4d7043-1929-4fa1-ba5e-f28403ad6fcc@app.fastmail.com>
In-Reply-To: <ff4d7043-1929-4fa1-ba5e-f28403ad6fcc@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Jun 2026 18:01:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWhv8i6tkmOJU_ee9LAV7mMcQHe9FXgqTHCjGiEMWvn8Q@mail.gmail.com>
X-Gm-Features: AVVi8Cc-rLKbwzFvmIKs2_rpHMNLxVULzvudUQINxHMw-KOr8IArAqRSnLCM1D8
Message-ID: <CAMuHMdWhv8i6tkmOJU_ee9LAV7mMcQHe9FXgqTHCjGiEMWvn8Q@mail.gmail.com>
Subject: Re: [PATCH] [RFC] gpiolib: introduce gpio_name() helper
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Andy Shevchenko <andy@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Ulf Hansson <ulfh@kernel.org>, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, dri-devel@lists.freedesktop.org, 
	linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-input@vger.kernel.org, 
	"linux-mmc @ vger . kernel . org" <linux-mmc@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39249-lists,linux-gpio=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:arnd@arndb.de,m:arnd@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:marcel@holtmann.org,m:myungjoo.ham@samsung.com,m:cw00.choi@samsung.com,m:geert+renesas@glider.be,m:andy@kernel.org,m:dmitry.torokhov@gmail.com,m:ulfh@kernel.org,m:linux-bluetooth@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-i2c@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-pm@vger.kernel.org,m:linux-usb@vger.kernel.org,m:geert@glider.be,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,samsung.com,glider.be,gmail.com,vger.kernel.org,lists.freedesktop.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,mail.gmail.com:mid,linux-m68k.org:from_mime,linux-m68k.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D27186E6387

Hi Arnd,

On Mon, 29 Jun 2026 at 19:54, Arnd Bergmann <arnd@arndb.de> wrote:
> On Mon, Jun 29, 2026, at 17:29, Geert Uytterhoeven wrote:
> > On Mon, 29 Jun 2026 at 15:59, Arnd Bergmann <arnd@kernel.org> wrote:
> >> From: Arnd Bergmann <arnd@arndb.de>
> >>
> >> Most remaining users of desc_to_gpio() only call it for printing debug
> >> information.
> >>
> >> Replace this with a new gpiod_name() helper that returns the
> >> gpio_desc->name string after checking the gpio_desc pointer.
> >>
> >> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

> >> --- a/drivers/gpio/gpio-aggregator.c
> >> +++ b/drivers/gpio/gpio-aggregator.c
> >> @@ -758,8 +758,8 @@ int gpiochip_fwd_desc_add(struct gpiochip_fwd *fwd, struct gpio_desc *desc,
> >>
> >>         fwd->descs[offset] = desc;
> >>
> >> -       dev_dbg(chip->parent, "%u => gpio %d irq %d\n", offset,
> >> -               desc_to_gpio(desc), gpiod_to_irq(desc));
> >> +       dev_dbg(chip->parent, "%u => gpio %s irq %d\n", offset,
> >> +               gpiod_name(desc), gpiod_to_irq(desc));
> >>
> >>         return 0;
> >>  }
> >
> > Before, this printed:
> >
> >     gpio-aggregator gpio-aggregator.1: 0 => gpio 589 irq 188
> >     gpio-aggregator gpio-aggregator.1: 1 => gpio 590 irq 189
> >
> > After, this prints:
> >
> >     gpio-aggregator gpio-aggregator.1: 0 => gpio (null) irq 188
> >     gpio-aggregator gpio-aggregator.1: 1 => gpio (null) irq 189
> >
> > Same results for instantiation using sysfs or configfs[1], although
> > the latter does have optional support for specifying the name.
>
> I wonder how many of the other instances have the same problem
> then. Would it be appropriate for gpiochip_fwd_desc_add() to set
> a name itself to address this one?

I don't think it would be appropriate for the GPIO aggregator to set
that name.  What we want to print here (for debugging) is the physical
GPIO that an aggregator's GPIO is mapped to, not some consumer or line
name (which is not guaranteed to be unique).
E.g. "<chip-name>.<offset>" would be fine.  As gpiod_name() can only
return a fixed string or an existing string, it can't return such a
formatted string, though. And consumers don't have access to chip info?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

