Return-Path: <linux-gpio+bounces-16792-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8759CA495FB
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 10:53:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 415591883F53
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 09:53:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C40CD258CE4;
	Fri, 28 Feb 2025 09:53:34 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2D31FDA8B
	for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2025 09:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740736414; cv=none; b=naJdR56Tn5pOPWG4uVzL2EcT+r077SptWZmKRhNG0gA/KatlXfb3QZaMGGszcEb5OgXjBh5Tn0iS6FwF7sq4cxukWaY9tpTUDdEvUV5OlRcSR/VqWxpMNut55mO2rXahK829e4+DUkrVltuFtqnpbAB6aRS8R25n3HN7eDLeyXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740736414; c=relaxed/simple;
	bh=HD3h1ngRIMEGjSTyvGr4QE4UKE3Uw7zUm8P2uGscJX4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gMKCpz78pWM5zJx6DeG6K9V56/IOEo32MGKqMy2rTKdmIS2vPu8B9C05zGdrQN6nd52/J1SF9y+I3Lwf93UqAgOtdlOWIQRfZeydHRQtE9CiNFDk0XJ57/DfYPpn0E9a2GXAFnfXSswUlG5d+n/xBU1iEMElWIOvarPvdzaH9fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-52364925cfeso177068e0c.0
        for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2025 01:53:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740736410; x=1741341210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Urp0DothUuULu6O/qAKGb/7MRWY6JHLjcJaYhr5l87c=;
        b=vDKiWFsbouMK+Y/8bkbCafruGRxQFuBuAogN22X87xouSbkoE41fw8aVEcl6EM+BzE
         84qzLX3ivySQY4z+YFqY5aiYF+vAOecUQAeHw7xSFdY/OnaorEMHrmQEt14Aj7ZKDSEJ
         pBk6e9pcGfdPVjoGQtkv7AvrW6f/feSx6WRkeXpNdXCWxv3cBIafWVp31sSVOwWihQiX
         otDkr9CjdPOdwqnwnntxiYreIC7aqNdCf+238d4NtS9M0B87h0QPU0rO3Y9E3fv4V5hp
         CUJYdf8ksK1dRMHEU3Z9QjzQF/raB1mB05vjJg1Rra6IyZCSZnYByf0uDk5Jklu2aaY+
         97FA==
X-Forwarded-Encrypted: i=1; AJvYcCUJmg128mW5ecpN5D2MUs50i32yMzzPmsnC9C+g2ireXU8j+LZaJE6wK/3pNjlGuy/vH9tWXUEWBTKV@vger.kernel.org
X-Gm-Message-State: AOJu0YySz1k0MJ+FA2CDHoqs+i4plonDXuwLCoON4q0AAnIie7f8cIR+
	bFcuSvGYlqRL3/nGHlixiQHpX13D+lDw0ES8ChDf4/NLFDHpDjKIQlkcEVTQ
X-Gm-Gg: ASbGncudPc3QHTZ9MiE6dHsvKChRKNPZV5UfMFEhHno+tJJScIWVTaQuVlLXvA7I/KS
	pJpoTBR9Sg5cnWOB6WEcRbSDTn7OSncr0bdqjNk3/m060mbfJpEF132ampe3LS6fFGKXAyoYl62
	BWMptmS7x6JT9HjUZKQ/7UaflP7M4915Qc4qUL9/xJZMtQuEXqh2i+sLoCmHjBq42Np+gk78SV6
	pLSfnHmimjP99BFErLbPTKfj8X0Ouye/9VX9ivqHj6Uzls5i33/9aF6ce8PkthIYjFVazescKGX
	A0707T6o2lFL8FLgqZ9GM11Ey5wgksNL0uG6bGE6H5BMGe/lH9PVfgp4rI5GD266sd2q
X-Google-Smtp-Source: AGHT+IFx0X93ZLoxJ6DzqRdvg3fNzMyybPtW3gwSL1SfD4G6aOvesV//RJkR4WbK7UANdR3CfRvvLQ==
X-Received: by 2002:ac5:c38e:0:b0:521:b3ee:4970 with SMTP id 71dfb90a1353d-523495a8720mr3523875e0c.2.1740736409655;
        Fri, 28 Feb 2025 01:53:29 -0800 (PST)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5234bf41809sm523694e0c.24.2025.02.28.01.53.28
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2025 01:53:29 -0800 (PST)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-52364925cfeso177032e0c.0
        for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2025 01:53:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVOWpuiSaZ5GMXXeSEax5UM8IsGgYP80bcg8Eq+I1VjSwV6o/BEQRw7IxZKATdJYZgE7Eg8piVvOav1@vger.kernel.org
X-Received: by 2002:ac5:c5b3:0:b0:520:f35e:1a42 with SMTP id
 71dfb90a1353d-523496fa272mr3158493e0c.4.1740736408591; Fri, 28 Feb 2025
 01:53:28 -0800 (PST)
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
 <CAMuHMdW=bttP01Jigtn1DPyzVzTNr3GguNTo4Kw=NOBhhhthRA@mail.gmail.com> <CACRpkdZ4XOrcSOawd551tNx7qzexOguzboaA_6Z36QPfK7a0vA@mail.gmail.com>
In-Reply-To: <CACRpkdZ4XOrcSOawd551tNx7qzexOguzboaA_6Z36QPfK7a0vA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 28 Feb 2025 10:53:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXbY6J9HGM_WP+9tJ8LDaZP0=XrE3dciWX8Qmiss2spZw@mail.gmail.com>
X-Gm-Features: AQ5f1Jq6a-YcbJZbLyEgBfvgmGVFzjjG2tQnRR0KcK6jTvzcVdq9Rj0anR-wlKA
Message-ID: <CAMuHMdXbY6J9HGM_WP+9tJ8LDaZP0=XrE3dciWX8Qmiss2spZw@mail.gmail.com>
Subject: Re: Replacing global GPIO numbers in sysfs with hardware offsets
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Marek Vasut <marex@denx.de>, Bartosz Golaszewski <brgl@bgdev.pl>, Ahmad Fatoum <a.fatoum@pengutronix.de>, 
	Kent Gibson <warthog618@gmail.com>, =?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Fri, 28 Feb 2025 at 09:56, Linus Walleij <linus.walleij@linaro.org> wrot=
e:
> On Fri, Feb 28, 2025 at 9:50=E2=80=AFAM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > > /sys/bus/gpio/gpiochip0
> > > /sys/bus/gpio/gpiochip0/gpio0
> > > /sys/bus/gpio/gpiochip0/gpio0/userspace
> > > /sys/bus/gpio/gpiochip0/gpio0/value
> > > /sys/bus/gpio/gpiochip0/gpio1
> > > /sys/bus/gpio/gpiochip0/gpio1/userspace
> > > /sys/bus/gpio/gpiochip0/gpio1/value
> > >
> > > Take a GPIO, shake it, give it back to the kernel:
> > > echo 1 > /sys/bus/gpio/gpiochip0/gpio1/userspace
> > > echo 0 > /sys/bus/gpio/gpiochip0/gpio1/value
> > > sleep 1
> > > echo 1 > /sys/bus/gpio/gpiochip0/gpio1/value
> > > echo 0 > /sys/bus/gpio/gpiochip0/gpio1/userspace
> > >
> > > So we can always "see" this GPIO line, instead of
> > > exporting/unexporting there is a knob to assign/unassign
> > > it to userspace.
> >
> > Why would you want to always "see" all GPIO lines?
> > What is the use case for that? What am I missing?
>
> Because in the current ABI the user has to implicitly
> know how many GPIOs there is on a gpiochip in order
> to know which lines can be requested, and that's not
> good.

Doesn't the ngpio virtual file tell you that?

> You know you can probably request gpio 0 but can
> you request GPIO 104?

I guess most people who play/mess/... with GPIOs directly know by
heart how many GPIOs there are on their gpiochips (at least I do ;-)

> Also sysfs is explicitly for topology and this is topology,
> by the book.
>
> > If it is recommended not to use this interface, I think all GPIOs
> > should be invisible by default.  Hence I still prefer the (un)export
> > interface.
>
> I think the whole point of the thread is that this so-called
> sysfs v2 is supposed to be recommendable because users
> want something like this.

Let's keep it simple, and similar/identical to the existing API?

Is there anything in Documentation/ABI/obsolete/sysfs-gpio
we can drop? edge?

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

