Return-Path: <linux-gpio+bounces-27246-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D53E5BE82C6
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Oct 2025 12:56:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5955535C9E5
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Oct 2025 10:56:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C84F32AAC4;
	Fri, 17 Oct 2025 10:55:20 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7645C32AAC3
	for <linux-gpio@vger.kernel.org>; Fri, 17 Oct 2025 10:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760698519; cv=none; b=Hzs9WPvUZAAF9uwTZmEKJWGebQZQib2wFounJY/h5Oj9qHGVCPCnlK50VzkVNg8tn1SXlGLg7ye/ycqbCxH76ltTZvvkJFCuCfDk2c3qYaX8WFmMaxg/cbCIrqZTvapjT7cuzh+NHJBryQXL6xJkNNre0UDLV9dh/QbpMJJ9mNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760698519; c=relaxed/simple;
	bh=7roeWK5AtO/7ZwDK0dlN3Uu9wiMocaa5toCTUlYqJaM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iOvuBTpgg10q2oMhXI9iYCf7BL08K4M5KeMlCq2sIBmRIYQ/luooaOL+WzdGevOGcJi3j3Ce0R5sffg9yjukALWluqmqmJZXyUM7JEqBhGb9gzHvMjNBbLClyo+AC8RZN0I3UUVFO2zQKzOUDHYRTx2sii/qwBHi3Zo8+sYFc+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5a3511312d6so828572137.3
        for <linux-gpio@vger.kernel.org>; Fri, 17 Oct 2025 03:55:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760698516; x=1761303316;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zPE9WHNZsdRI3QmdRcH/wWeYzKksV+R5Ry8aWltKbjU=;
        b=N24jvxKnE79Fhgk3Irk4YOw0LxA0AmQvCBJSD93JPxwB2qxlxmkj97daKMe0PCMtk0
         HU/Rxe9Nx+T+9VsX3j0wzlfiAKGq3KZAiIVLY6bGyuW5RQt90qPlEn/glhsBlqKoA1LU
         IXmlwb2nA++WIVJ4x9usKLchk63iL0pCXYMKqHZfCb+MretS4JcYCVPPpRuNXXt7R7Rc
         HH65Iw0/QM05v/PFHs++tJEHOrKVekbEFmdc3MkJjm9GCs8CpXuV30YeoW89pa53qubv
         TJE37QqHgOVBPpFHT548XYlF7Mmhrq1Kis8LSopxlU+dMSr7it90zwfFr9vBTtDWg12S
         32Rg==
X-Forwarded-Encrypted: i=1; AJvYcCWf3LMGmhKz3pScwlZorvHrLMoEwjFENCGFlNDibD7VEPfZdZUQMkGYFD96vDn13vUocJ06y/OT6s/b@vger.kernel.org
X-Gm-Message-State: AOJu0YxDHLOs4PdqS6zdK+vKVAIgiYAm7kYVXP6genmnc9FKqLxK3jXB
	cxc6mJYZVsqAwyDhJodZoBZVPSv3uZ6acaUtHr9lXYIVmx5tTT+qmyNGcGqNsPQL
X-Gm-Gg: ASbGnct4YnJnsgxMczayXN8wQgulf/ssP6NZANWReLRCRGhEoaYxGHd9TefSMCLhj+9
	dvI5C/bF3IYvnPQR7FVDjz6EYJyEQnhflG959Z5vCLkoGtYd1k0WXsR2D12/djimniqwxnSFSAl
	J9ba8Bo5yo1VfB58jADdhc3+jke7P3yQy/nWtB1kNheREIvu4ASqoND4M0lFAFhe+klqIobX2nB
	L5ghaTrUwcJtyW0sy6hVH1Wm2h8ykQw8stQ9aJoTD3eJUyLh3N/HjeclSfvD4NMntA2+g5F2rn2
	SF4OxjvJukc6GocMTkVll+wYYsiw3f1k0oKDgZuQxeiJvX0ik0D0280v0U5xxj/qN9JHqqh8lne
	dvQUeCzFvGIMgntTiZ2sgO13DP6d68HdT8oytOkP+LVEsn3K/AOaIpDr+u35PnnvJD/mGB722FL
	w0zc4apWP2I2cK30cmiEY5zMU41ouW/lnzSzIwSA==
X-Google-Smtp-Source: AGHT+IGUQpjkrDgQUnHLV7pVDffCmIAxo0DSPNuTwcN6hTEHjTzsJ9/eEoRE6wI3KRZs2lCmY7e5Ew==
X-Received: by 2002:a05:6102:512b:b0:5d7:bc22:f9af with SMTP id ada2fe7eead31-5d7dd6a5227mr1098812137.25.1760698515794;
        Fri, 17 Oct 2025 03:55:15 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5d5fc713dbasm6947164137.4.2025.10.17.03.55.13
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 03:55:14 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-89018e97232so406969241.0
        for <linux-gpio@vger.kernel.org>; Fri, 17 Oct 2025 03:55:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVdZ5aDqaCwkd2FWzdOEJDX0nY4frG4CHdpeoaOs2n0QvS6ZFNiiLSdXwOTkNOQKbYnJzMJjaEzV50O@vger.kernel.org
X-Received: by 2002:a05:6102:5111:b0:5d5:f766:333e with SMTP id
 ada2fe7eead31-5d7dd5934demr1126362137.15.1760698513447; Fri, 17 Oct 2025
 03:55:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1739540679.git.geert+renesas@glider.be> <2d30e5ffe70ce35f952b7d497d2959391fbf0580.1739540679.git.geert+renesas@glider.be>
 <20250214073402.0129e259@kernel.org> <20250214164614.29bbc620@pumpkin>
In-Reply-To: <20250214164614.29bbc620@pumpkin>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 17 Oct 2025 12:55:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXost7vL5uTocMGtrqhEk5AY3QUWvyP5w7_hBtf3MkMfA@mail.gmail.com>
X-Gm-Features: AS18NWAcP6voBjoIoEi-7RxJ0pdmzXqhfe5FdHBNP60R0y-DyUBofdEL44euygw
Message-ID: <CAMuHMdXost7vL5uTocMGtrqhEk5AY3QUWvyP5w7_hBtf3MkMfA@mail.gmail.com>
Subject: Re: [PATCH treewide v3 2/4] bitfield: Add non-constant
 field_{prep,get}() helpers
To: David Laight <david.laight.linux@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	David Miller <davem@davemloft.net>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Crt Mori <cmo@melexis.com>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Jacky Huang <ychuang3@nuvoton.com>, 
	Shan-Chun Hung <schung@nuvoton.com>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Alex Elder <elder@ieee.org>, 
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-crypto@vger.kernel.org, qat-linux@intel.com, linux-gpio@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, linux-iio@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Fri, 14 Feb 2025 at 17:46, David Laight <david.laight.linux@gmail.com> wrote:
> On Fri, 14 Feb 2025 07:34:02 -0800
> Jakub Kicinski <kuba@kernel.org> wrote:
> > On Fri, 14 Feb 2025 14:55:51 +0100 Geert Uytterhoeven wrote:
> > > The existing FIELD_{GET,PREP}() macros are limited to compile-time
> > > constants.  However, it is very common to prepare or extract bitfield
> > > elements where the bitfield mask is not a compile-time constant.
> > >
> > > To avoid this limitation, the AT91 clock driver and several other
> > > drivers already have their own non-const field_{prep,get}() macros.
> > > Make them available for general use by consolidating them in
> > > <linux/bitfield.h>, and improve them slightly:
> > >   1. Avoid evaluating macro parameters more than once,
> > >   2. Replace "ffs() - 1" by "__ffs()",
> > >   3. Support 64-bit use on 32-bit architectures.
> > >
> > > This is deliberately not merged into the existing FIELD_{GET,PREP}()
> > > macros, as people expressed the desire to keep stricter variants for
> > > increased safety, or for performance critical paths.
> >
> > I really really think that people should just use the static inline
> > helpers if the field is not constant. And we should do something like
> > below so that people can actually find them.
>
> Especially since you really don't want to be calling ffs() on variables.

It is not that bad, as most temporary architectures have an instruction
for that.

> Much better to have saved the low bit and field width/mask.

While that would allow some space saving (only 10 or 12 bits needed to
store low + width), gcc would generate quite some code to create the
mask (even on PowerPC, where I expected a single instruction would
do ;-).


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

