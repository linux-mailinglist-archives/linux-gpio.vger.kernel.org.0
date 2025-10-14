Return-Path: <linux-gpio+bounces-27115-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A96BDA41D
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 17:13:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B25A150525C
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 15:08:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 849D1302CC4;
	Tue, 14 Oct 2025 15:05:23 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C9030277E
	for <linux-gpio@vger.kernel.org>; Tue, 14 Oct 2025 15:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760454323; cv=none; b=ZLOms05jXpHpZj9XrLRQqXBtyXrb551UbR4LKLpyUtIpYQDcFXJ6Zozzb/1L/0cdDzmXIFOxgEPffQKvmMcbpnnRz8A3c/nyViWfzQng7ZtBpN2cI427FXuAoBSfv+TZdtGigEao3SI4rrWr6PX/d9UFp1qlrC28SBXRo/us9ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760454323; c=relaxed/simple;
	bh=8cdcfvLKZRVy5zVyqP8q5Amc6eLxZmc3401QZxpkFVM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IqaByKQ/x9IpntBXwmAfc+x+kjJPK0DvIDoXN/gMWwc9N9Qb3BZUx8QcWYrLI/Df8uS1Myia7yXynstATGzL07ltSg5ZEaCMyRPvm5K/ADbRFSQ8ndAfHkI5pprhMkHxHXHn8o+CwVjCvc0z6WDHbPdUylWdPKY0mR4pr0D/GXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-42f6e0bdcf7so44212375ab.0
        for <linux-gpio@vger.kernel.org>; Tue, 14 Oct 2025 08:05:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760454320; x=1761059120;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bFM6fq+qPomTw5SLmg+mdn/T0EKmVQHgVT/LIsQW4L4=;
        b=JFAIHwmQc5L62/HICzzNs1kJfh0RfwenlO5SX2jQWjUM94+I68fNCpveWpZrn+TKqm
         Gv1uTgFxFFozQ+ISSS3miLD27pmPmgCDz80vnWi4FpwUVfCe9/gGpXakYtWX+AKvJLjv
         cbnI0eMRDkZYbblt7egbglAwEh5tojjUkHM003GABLK+jYcrilk8abTSdgCLhAAmA9WT
         csuGPw8r6QQbDbh1/gy8Te49ePVSYXcuIlUITXs5bcxD9I5GuHX5LNvTmP+hfuZED2On
         XT660fEnNZ52+mAOxSFAGaq4nM/Of7ASh4lwJsOH+ltcdkt9Mch833pCezkic3AJWLqY
         vOwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqBjK2bmpawzQLCo5DDXYdMXlKOz6GYzPBBA3Wqb+bNUY01uF9JWWKX/5dIs+Oof58DvzeffH0HLkn@vger.kernel.org
X-Gm-Message-State: AOJu0YwvEouOg4z21ZhYavmAlPB1TnTj9dsur1JBXprZSvAksIzgQXPN
	JeB5ih7/hhSKinDUQlBVyEg5bf5A3W9mJ0ltPoOUsS4lVQ9Is0Tx9iSbtRecDKNM
X-Gm-Gg: ASbGncsWpO0qkMULnpybc+iXzw5kuClb1Uz/9zRtzicHToYTFCVaMJvw7oZjRhvZlcR
	5VcIsrxdn60theZfVIb8ppKXKqrkcPdCkWZjOwOvRRW3iAq7wjdu37jhMyCEpDpr9ustQ1Hd28I
	WKomu5x1Cx4xShDbpOgJqolsqXeqXjNPLsegyIJ96IfBqz0idLsT9WS8GMZplt6nEqyTTuvQnbd
	C4yLVDFIzDXdSDmmU2QToZ1yMTKwTF1vDZheTG68MTxeuyQdEz4LdH8lam0RuJXAUHmj2FTRWe3
	aBgaPZDiZDURJd1mjEe084CgGv5+zaCqmOndFJmodMQwxtg9H3yA9LrB4B1yqVvDMEM/EPWX3NW
	EQ9nmLfBz6+1vRrQ5qSd8fm6DAaMELioXc7vOd2unu0rAoDIrTOi9hcet9di2oBME40i2VFxszE
	VRQ200CTPwvs0=
X-Google-Smtp-Source: AGHT+IHEbaa/jaC1tRdTNGnOSLxcRDpsH47ibrVsaCZWh49VUdJGVL69EevHf/qXVqfrE7t8k8fj9w==
X-Received: by 2002:a05:6e02:1709:b0:430:a4f0:899a with SMTP id e9e14a558f8ab-430a4f090d5mr23957175ab.31.1760454320081;
        Tue, 14 Oct 2025 08:05:20 -0700 (PDT)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com. [209.85.166.179])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-430a3a6df8bsm6501575ab.3.2025.10.14.08.05.19
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 08:05:19 -0700 (PDT)
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-4242bb22132so51968405ab.3
        for <linux-gpio@vger.kernel.org>; Tue, 14 Oct 2025 08:05:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVRYeIT6210/0JYmfHm6TE+MotJlEYFqQ/6+8KDmQiBTsDgLN3oSEGaYHkb1WzYJ5+ryzsbzxr5OAgl@vger.kernel.org
X-Received: by 2002:a05:6102:b0f:b0:520:a44f:3ddf with SMTP id
 ada2fe7eead31-5d5e224f3f9mr7315982137.10.1760453949213; Tue, 14 Oct 2025
 07:59:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918104009.94754-1-herve.codina@bootlin.com>
 <20250918104009.94754-8-herve.codina@bootlin.com> <CAMuHMdWNErzjfqXXgJZOn2viPYmGeuJekY_WLDeK6vzYZzdJmA@mail.gmail.com>
 <aO5aIoCEL-XbpBTp@shikoro>
In-Reply-To: <aO5aIoCEL-XbpBTp@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 Oct 2025 16:58:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUkx+qQRDertFmW9nLzGJA+VETWLvaA_VoS17-WhJJvXQ@mail.gmail.com>
X-Gm-Features: AS18NWDaYL53l1nt58YG7qpvuDTebR9eFnGE4nr9xDBH40Jra_ZU6YkKi5yFUO8
Message-ID: <CAMuHMdUkx+qQRDertFmW9nLzGJA+VETWLvaA_VoS17-WhJJvXQ@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] soc: renesas: Add support for Renesas RZ/N1 GPIO
 Interrupt Multiplexer
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Saravana Kannan <saravanak@google.com>, Serge Semin <fancer.lancer@gmail.com>, 
	Phil Edworthy <phil.edworthy@renesas.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Tue, 14 Oct 2025 at 16:11, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > > +static const struct of_device_id irqmux_of_match[] = {
> > > +       { .compatible = "renesas,rzn1-gpioirqmux", },
> > > +       { /* sentinel */ }
> > > +};
> > > +MODULE_DEVICE_TABLE(of, irq_mux_of_match);
> >                            ^^^^^^^^^^^^^^^^
> >                            irqmux_of_match
> >
> > Interestingly, this built fine for me before, presumably until commit
> > 5ab23c7923a1d2ae ("modpost: Create modalias for builtin modules")
> > in v6.18-rc1.
>
> This should be fixed in v4 already as a side effect of my request for a
> better namespace prefix.

Thanks! Sorry, I really thought I had the latest version in my tree...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

