Return-Path: <linux-gpio+bounces-28662-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E405AC697FE
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 13:56:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 498DD368CED
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 12:56:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F113F257854;
	Tue, 18 Nov 2025 12:56:10 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D0D24BD0C
	for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 12:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763470570; cv=none; b=XbeRBWwgqjYvO3PeaKEeAMbvVaxepMjb6CMDOhpkWSCMh31gca54WeD4Fyut7rx6aXw4z+IOzBh2KAGJTTJ1kvS33Y001G8kAENFAVw/l2JWVOgqgwk5EBkDVy3eeTL1y7i42sxDgMUMOasTZmePJr0xxEVAUZyFvd0hA6ath0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763470570; c=relaxed/simple;
	bh=/zVQ3caVQJG3gQBJgK50MyXyKcMooS7fUfIbjJLVF6Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tCgIdI3wozsD/6e18Jvl+T/a6ZZ9W9+l8wUS4y1iwmkCRcO+ynT3ResAjfHdQkyET5Gc1aEmChFAyik8xRBplX3tqqBzb4mX+PfWOcqx1c66eJBCu+b3IQ1LUdjXzA396YnTlEQO71i95wXKFNYJgwDPh9DWSskmRXm0BtxzoK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-55b302b8369so1864234e0c.0
        for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 04:56:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763470567; x=1764075367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XMYcwyn3PU+pOgxTORp/4U9I/0iJwsVP/bkqLPdjG54=;
        b=pNfocgY6+I9+HcFasjlqNVpQ288LVlFsRnYFR43Qq0W5zMKYFSSb7TjcMGrVo2EVeY
         56qdWB9zvVp4EPwZs94jCTv9EFtYyRPCPe8H/xwERWWf6uHQokqkiMKmJhIp0Ro8RQk5
         P+bzx6LiQCazFZ9+ObjcQx1PJwdKJE/moSzQ+wZFT3bdkGmB5NhM+NU1POJPWrZvSkaq
         xUFLt5gOcScxQWQORi2J+xvw7YKX0yUAsqFTYFa53lWV1n5Uhasx824ChagFJ43CP9iU
         S+pzGowpjAxlt9lyG9efLNGWxJeIXja6dwdnrMk3QYq8BcaIkIR6rrZpuaG9Q0x92CeW
         pzDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcl7CTkclDQfb2f5P1kTWERCYPVv3RixgD2csZMaoG6E4kiE1MObWIdfwc1VhT+wRFizGpHgGSn3GD@vger.kernel.org
X-Gm-Message-State: AOJu0YzbZ/EpkBqlxq6wt40wAImwVxWNdkLH15LOFnUyNMzqhzpngWek
	OKbxRUIF7Ecj6/gOgEDXu9rg5pVgpd6SU2hl3hGMfO13ZFClGZUTM8EJ9w931eNL
X-Gm-Gg: ASbGncvWrP2aTGczcv6RkJysa6k4nssWCKlMEZvW3eHlW8X5NQB1SCjtaoga4kd+3ad
	eyScabsISbHEXHD4PTLkqUb1Fc4jyMF9z5Po3clNxP4JhQBdH5+qoiZ1uUHTOhGogRLW6EFK3xA
	QZG6DMBdS2dZJWghd8KnybFgSW8f/KypjJxIlJZzsG8J706dxxpakxogK5hSbv4sPGFUI8gd6dI
	M2pQfZPBcv3W47Uv99CsuFDuz6wUPUX+xYd+OLQgFxmQrn0ho4fIMOIByWz3aeP5E+3I2Lexpd/
	H+aO/kjb0cffUJMFj3Kil+3hyA1kWKmAtfSCLKzqYETM4woWrwbWj8ULbR1eQVgNHjOPO3o89X9
	Hrpw+T1CH6PmFtPL0mdSPU1caGbvS+x/ItvAeCo370RwXxzMXK+0swXbqivAJ9zBLIkCUrrHEny
	RWG3SUDL9So76nRzu6e5+rGiBw0vP1U9IzPDlgtHhtuaL9ll+kpqRZkFCJLC0=
X-Google-Smtp-Source: AGHT+IEMDic0Vs7vIK/UJH1uyjref/zmfHplXgZEOzxwZ1O1FzOhNzZ7Z+LdSxZ/SqwhA7g4ROhNDQ==
X-Received: by 2002:a05:6122:3114:b0:554:b32c:6f76 with SMTP id 71dfb90a1353d-55b1bf40b82mr4950200e0c.15.1763470567365;
        Tue, 18 Nov 2025 04:56:07 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55b0f359f5asm5282711e0c.6.2025.11.18.04.56.06
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 04:56:07 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5dbdb139b5bso4587143137.2
        for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 04:56:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVq1HkN6kCyUH8sBvNozrKSRC8sxpl8Tu2UH7CDgGQ+cNPVLG83ZTBdx0H/gJngT8tXNorYukGrWVKf@vger.kernel.org
X-Received: by 2002:a05:6102:441e:b0:5db:e0fe:985c with SMTP id
 ada2fe7eead31-5dfc54fcc32mr4842088137.10.1763470566608; Tue, 18 Nov 2025
 04:56:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <CAMuHMdVR9Z70+M-SqHYrHiC6H_yw=VRuDOOg=YnXSNKjPnx3WQ@mail.gmail.com> <CAMRc=Mdo__Yzigqoy4xKt0LWSvES5Jse1HeXkePfhiWyiz6tBQ@mail.gmail.com>
In-Reply-To: <CAMRc=Mdo__Yzigqoy4xKt0LWSvES5Jse1HeXkePfhiWyiz6tBQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Nov 2025 13:55:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXpySSvjgju2LXr6puVXzHMR4ckpaKEWK_S4spTWz6B-A@mail.gmail.com>
X-Gm-Features: AWmQ_bkC98gq3Hx-nk9zI-w6kSG9BC0TZLZ6VioIzu7f0ulaeAjNY59_KJ5q6hs
Message-ID: <CAMuHMdXpySSvjgju2LXr6puVXzHMR4ckpaKEWK_S4spTWz6B-A@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] gpio: improve support for shared GPIOs
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bartosz,

On Tue, 18 Nov 2025 at 12:55, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> On Tue, Nov 18, 2025 at 12:16=E2=80=AFPM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > On Wed, 12 Nov 2025 at 15:05, Bartosz Golaszewski <brgl@bgdev.pl> wrote=
:
> > > Bjorn, Konrad: I should have Cc'ed you on v1 but I just went with wha=
t
> > > came out of b4 --auto-to-cc. It only gave me arm-msm. :( Patch 7 from
> > > this series however impacts Qualcomm platforms. It's a runtime depend=
ency
> > > of patches 8 and 9. Would you mind Acking it so that I can take it in=
to
> > > an immutable branch that I'll make available to Mark Brown for him to
> > > take patches 8-10 through the ASoC and regulator trees for v6.19?
> > >
> > > Problem statement: GPIOs are implemented as a strictly exclusive
> > > resource in the kernel but there are lots of platforms on which singl=
e
> > > pin is shared by multiple devices which don't communicate so need som=
e
> > > way of properly sharing access to a GPIO. What we have now is the
> > > GPIOD_FLAGS_BIT_NONEXCLUSIVE flag which was introduced as a hack and
> > > doesn't do any locking or arbitration of access - it literally just h=
and
> > > the same GPIO descriptor to all interested users.
> > >
> > > The proposed solution is composed of three major parts: the high-leve=
l,
> > > shared GPIO proxy driver that arbitrates access to the shared pin and
> > > exposes a regular GPIO chip interface to consumers, a low-level share=
d
> > > GPIOLIB module that scans firmware nodes and creates auxiliary device=
s
> > > that attach to the proxy driver and finally a set of core GPIOLIB
> > > changes that plug the former into the GPIO lookup path.
> > >
> > > The changes are implemented in a way that allows to seamlessly compil=
e
> > > out any code related to sharing GPIOs for systems that don't need it.
> > >
> > > The practical use-case for this are the powerdown GPIOs shared by
> > > speakers on Qualcomm db845c platform, however I have also extensively
> > > tested it using gpio-virtuser on arm64 qemu with various DT
> > > configurations.
> >
> > Thanks for your series, part of which is now present linux-next.
> > IIUIC, this requires the direction of the GPIO to be fixed?
> >
> > We have a long-standing use-case on various Renesas R-Car Gen3 boards
> > (e.g. Salvator-X(S) and ULCB[1]), where GPIOs are shared by LEDs and
> > key switches.  Basically, the GPIO is connected to:
> >   1. A key switch connecting to GND when closed, with pull-up.
> >   2. The gate of an N-channel MOSFET, turning on an LED when driven
> >      high.
> >
> > Hence:
> >   - In output mode, the LED can be controlled freely,
> >   - In input mode, the LED is on, unless the key is pressed,
> >   - Hence the switch state can only be read when the LED is turned on.
> > If you have any idea how to handle this, feel free to reply ;-)
>
> How is this done currently? Even without this series and using the
> GPIOD_FLAGS_BIT_NONEXCLUSIVE, the descriptor has a well-defined
> direction so it's not possible for two drivers to request it as input
> and output simultaneously. The second requester will override the
> previous settings.

We do not handle it yet:
  - arch/arm64/boot/dts/renesas/salvator-common.dtsi describes only
    the keys (key-[a-c]),
  - arch/arm64/boot/dts/renesas/ulcb.dtsi describes the first key
    (key-1), and the others as LEDs (led[56]).

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

