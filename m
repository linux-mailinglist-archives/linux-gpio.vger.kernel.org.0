Return-Path: <linux-gpio+bounces-13482-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CF09E345A
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 08:45:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A4747168205
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 07:45:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C45CF18C907;
	Wed,  4 Dec 2024 07:44:33 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E09018C018
	for <linux-gpio@vger.kernel.org>; Wed,  4 Dec 2024 07:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733298273; cv=none; b=L9fxbekoZ7wMw5JwVlp456/ewO5EeIYNuBoJkkMbFoWi7kSmNrLwomL73J+hYfbA2a2Yvevc5oEpLOZo9QJUuDM9KvjHocLulqYdKdlH9cDvp5jlR8ymozwZMB9L900DfjdIOqtNo8C/2/rKN9b2/1AEJDSVS/Xi6U/gDrVieic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733298273; c=relaxed/simple;
	bh=nQwun8gQeIulYObus+ufiUfKKMTtuMYa/H+rS48IiqM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g628KoYchDT36ntSHu/0nnH+1eV5Cya8P5eWWNf29IkZJfWKQnMDj8MSd3/D5V7Pw63gWl/fr4NTFQjJEDcaAADeokCLlGHI6E7HYv2B1Qh/Y+J9hPjHq7qUor8Ht00kiYH+hksmKlvL0h4Kx2XfelY0gd2DDlNRAZElVVp1xsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-85bb13573fbso1060334241.1
        for <linux-gpio@vger.kernel.org>; Tue, 03 Dec 2024 23:44:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733298270; x=1733903070;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H/icQyzmGHz1TzMA4Cqp5hMi0/miDynHZBXtehJraUg=;
        b=bHWGBvN+Y9eT/3ZDP5uLWmPNQqEFIwWxLeNZaWwIb0nsMnVageA88Om9RplBIaxLQ9
         mE8vbEje+tMYqbvnyeEK/lF8zrLIGtxvH9V9MkS/BdB1g7iqPWzILrdmw7NLbwfSRGtP
         sh3JlcNylwi3pvguArbo4If3d0YC8YHoddEuCdX5hRF9DeWjsuPKCn6pPZGupeGkexpg
         fEvsCzVaG/vD1r+N6Hq+RqXHMBoXV9Hm+7XFRfyn9T3oPi9+tnQO5QPzimmbqq/59Xph
         JJG9z1vuyZTzgf3D3wOhFKPNiEYvi1jORikGFlS1QisjFcu4Jfz83kx/KM+jE9Zd5BRD
         2Y6g==
X-Forwarded-Encrypted: i=1; AJvYcCV8L5wVQGfIYGcmGn25dzCF8A3IKSeIkyQPSVJM6rvLXj7LuIKB88DBJcnhO/7nvFJl2c4j+MalKY20@vger.kernel.org
X-Gm-Message-State: AOJu0YzRDTBGmKqq9PCMI0R8T6B5E5Tv/NsaRpiAy5vAp8ej1qRMYs1Z
	274KmdLrzfKYweSuj57sGxy0AFwU6iHR1ggZT48+RmcwSLx0pmJJuy+t1jLU
X-Gm-Gg: ASbGncuYOAZwzd3led9/KuD9aNITqsuHP58y/nhfHM9+GwnSv3mu2TCxSbTEveZ8msb
	vrkA1pip1dB8MKjTuhyyLr8Id4yQu7eo0L0mdaja7LKeyyyxzJ774SoJyCXh3oDocEFx+qcEewS
	7BY9RumXY72C2F2fqFpT2AfLqeDRtdlbfHoJ9gKQypNR9NOa57SlLtXxCPLgDVsQTm6vfHlW9k5
	YNHJHXzRDD5BwCr+QywXp6QJGyij1ZRjWCDIIGlIsFDxTFShanVrQuVjJNmZhSPxaL1+NX9h/Mv
	aAaNJzKFHxWh
X-Google-Smtp-Source: AGHT+IGBKiCA4EzIzbQNL14ATbjd0tw312cR0OcpPbc4wrSzxeqUpy0utbw476IOzVEWgnfHu9h6aw==
X-Received: by 2002:a05:6102:290d:b0:4af:98c6:c60e with SMTP id ada2fe7eead31-4af98c6c8a0mr6663115137.23.1733298269748;
        Tue, 03 Dec 2024 23:44:29 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4af590e724bsm2347283137.9.2024.12.03.23.44.27
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 23:44:27 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-85bb13573fbso1060316241.1
        for <linux-gpio@vger.kernel.org>; Tue, 03 Dec 2024 23:44:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW9cAEMF+OWqWU5iCyLnAtXJAb9unw4KEG3PI5giuvJVdtCyRS8lopZLucKfRPMOtjiXFD3FNsCUsty@vger.kernel.org
X-Received: by 2002:a05:6102:41aa:b0:4af:48a6:79c4 with SMTP id
 ada2fe7eead31-4af972eaa24mr7774024137.17.1733298266923; Tue, 03 Dec 2024
 23:44:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6b9e55dbf544297d5acf743f6fa473791ab10644.1733242798.git.geert+renesas@glider.be>
 <f552b813-1817-4507-9699-fae87575a762@lunn.ch> <CAMRc=Mfh5Rv8OKWOcPVzJp-_e_bXgywT2=+N2cF1ONT3kiw7tQ@mail.gmail.com>
 <44126f2f-92ce-412b-ad9d-e0e0ea28d36d@lunn.ch>
In-Reply-To: <44126f2f-92ce-412b-ad9d-e0e0ea28d36d@lunn.ch>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 4 Dec 2024 08:44:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUaPkpSzrkqPRzZZfj6Npmj-8Ax5dXEGbjKXAyCW_DLXA@mail.gmail.com>
Message-ID: <CAMuHMdUaPkpSzrkqPRzZZfj6Npmj-8Ax5dXEGbjKXAyCW_DLXA@mail.gmail.com>
Subject: Re: [PATCH] gpio: GPIO_MVEBU should not default to y when compile-testing
To: Andrew Lunn <andrew@lunn.ch>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linus.walleij@linaro.org>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Tue, Dec 3, 2024 at 9:59=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
> On Tue, Dec 03, 2024 at 09:29:02PM +0100, Bartosz Golaszewski wrote:
> > On Tue, Dec 3, 2024 at 9:13=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wro=
te:
> > >
> > > On Tue, Dec 03, 2024 at 05:23:16PM +0100, Geert Uytterhoeven wrote:
> > > > Merely enabling compile-testing should not enable additional
> > > > functionality.
> > >
> > > Sorry for being dumb, but i don't actually see what is wrong here.
> > >
> > > There are 4 GPIO drivers which have
> > >
> > >         def_bool y

None of these depend on || COMPILE_TEST.

> > > COMPILE_TEST is about building as much as possible, in order to find
> > > build bugs. So i don't get what you mean by additional
> > > functionality. No additional functionality within the MVEBU driver
> > > gets enabled by COMPILE_TEST.
> >
> > No, Geert is right. I have been yelled at by Linus Torvalds already
> > for too eagerly enabling too many options. COMPILE_TEST is really
> > about making it possible to build more things with make allmodconfig,
> > not necessarily defaulting to y for everything.
>
> So are you saying COMPILE_TEST should allow something to be enabled,
> but should not actually enable it?

It is meant for relaxing dependencies, i.e. to allow you to do
build-testing of drivers that cannot possibly work on the system you
are compiling a kernel for.

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

