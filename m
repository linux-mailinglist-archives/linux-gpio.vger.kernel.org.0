Return-Path: <linux-gpio+bounces-27329-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F516BF3C9B
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 23:51:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 035C9427EE9
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 21:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89DDA2EF676;
	Mon, 20 Oct 2025 21:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Iqr8XXxg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713DF2E7F11
	for <linux-gpio@vger.kernel.org>; Mon, 20 Oct 2025 21:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760997104; cv=none; b=bWFH6gF+5T3WqDynibTtljrzXQcx/tkP1xT847MNFiyRx/sVMDTB4RoKfwlR/qtwhXaPSA3WCuPz30BqGsBJyHqnL5uZEHqndyeTejUAqngfNFC0lUVoDfWPVsadcoOuyDpQG0HsJOuf8x7FuvIpGxXZstHkKpCZ0G/msAVk9SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760997104; c=relaxed/simple;
	bh=aX/9JxdC1TRA48rktBau1D7ApsTGPEIpWfYv5Df8iIU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mxDLQRJC/6r4OVTJtoSLz/zoqYXUgMb3jMalPHGLqfKsOJZM1IPpFlzTqfubYNsEtSAkvK707wozn237vywu/XH7q0Yg4oCmENr65wFiuNetckIVuELcb1Abx+ZlhsmWWvCeayIQ6W2u0r06Ht4SiHiFSrK9YalQ4piF88S+YKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Iqr8XXxg; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-7836853a0d6so71171567b3.1
        for <linux-gpio@vger.kernel.org>; Mon, 20 Oct 2025 14:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760997101; x=1761601901; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aX/9JxdC1TRA48rktBau1D7ApsTGPEIpWfYv5Df8iIU=;
        b=Iqr8XXxg9A9KMBZkUGrV445aVZi2OJINE0ZsyknPJVrxS60bpVb/rnh0vZBGMeWgi+
         5Tg6AHwUat1iL87kkN6dlrVIJBNrVimlrpj2xo7LJvBjiJuSKNGBTq6qybi+j0gbIuaK
         W2SflEJ9fCaPzd7z1lhp/DK+iT/4scPvD3as1ObyKUSb4wHKjtiFKi2VM62Fd6IcOLkx
         aYDYxIbvpOGJ4xnpK7AR+0yEbCNJTsVDjsry5bjK3+hUxZ+iqTsZd26ST6YnLECmp8K5
         DcrF1nR5CbLre+M1mspn6SaZR6SldS4vb8eveiEV4uOPvo58UXRz3UCMSUXadghucz1/
         E1pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760997101; x=1761601901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aX/9JxdC1TRA48rktBau1D7ApsTGPEIpWfYv5Df8iIU=;
        b=EG3oF018WFa1StQ0V9ThjEwfnu2q4R2aWHjdO/2jIVY789FaVBUkpwQEutYrVFAr36
         5kQyb7m9+6fJX3vf7ALk2LLXJezfp93yBncCrbLoRgqQgNgXUV2Hh7WxqSK6Dv2SC5ka
         9fuNzDRqX6CfN6ForJpF58DOrjuFH2f/UdLc1G6pFZm+vERds4wfoWh62cE4A42Gv2ur
         UKltpBD7AEhBYrd8E3yYJbyCL0r8jbobAcWI5dS06gtBz7pljy1yWvNBJtQyFWF0kwk4
         TZ/FnqzRdkGExhdYH+l/SZMkRBqyd6Uq7s9Mnpey5RCrHWoi5YZEfIjxhMwLrY/mceLP
         G1xA==
X-Forwarded-Encrypted: i=1; AJvYcCWRQ2GJwcPFtM7w6z0SNFmZvV4PDYa4iZcWBM2PpwiMa35cBLnTwrgQY5HPsp0TorA2IyVzO1XyJMKO@vger.kernel.org
X-Gm-Message-State: AOJu0YymBI9Ti8taxGroI7SXYqsY6tRLmSSg+zvtJG6LOArJJzUUqESn
	IZ1RKFzMePLoAjBbRYMzG95KBI9yPqtDIiOtQfBTNcuMGacBLJPzuYV5zRDmDyObb2BPZPZ/wU/
	3Xrw24oE+XBIUSJLZD/D3s7rvzRLaJ+8DCqvdnKKPHg==
X-Gm-Gg: ASbGncvYNi1eIquv36CwehNUMSQWZMzbqp0jOwx44trJq1ej3UWUSVxzk415Oiacvgz
	/N2MyWnR/QIM45YVqeGIHRJkq+rp9iZ2i+gzmkAWqgzQ0XsyG1T4GznVAORzZ4fyZUXZ2lAO8OB
	utZaGUbnFs4tIlsR25CIdQLdHnkzngLgWcBHbKUHoX4Kl+BlewXMWzYwwy4lsNTNJkFanVhxwm0
	To0EgxxD9AypO+PCyAmEFRA26/k1q6gFpuc2CdYgDuEirR8VFs33dqq5RCZ
X-Google-Smtp-Source: AGHT+IGRaOydtzDQqQLvW6se3/Vk6k+Gd4ZdqugfWoQAiRZ4x3gHuCWHJg7LiPH2eudgGlv8FQTadoN2iFpSXJhpXo4=
X-Received: by 2002:a05:690e:1487:b0:635:4ed0:5722 with SMTP id
 956f58d0204a3-63e16225bf2mr10798873d50.26.1760997101257; Mon, 20 Oct 2025
 14:51:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0c4bc190-7049-4753-b88e-479a3ff584fc@oss.nxp.com> <aPEtEnd3kG_pxWPf@pluto>
In-Reply-To: <aPEtEnd3kG_pxWPf@pluto>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 20 Oct 2025 23:51:28 +0200
X-Gm-Features: AS18NWA4FdGF7CF4cd4_wWTv_JtZlgqANoY89SKPmaKzU6AhIdj0GgLszFkIkII
Message-ID: <CACRpkdYgv1czD-GjcnZvq25TYxjaMpa9VjyzXJ3zVtaFc=cBJg@mail.gmail.com>
Subject: Re: pinctrl-scmi: Support for pin-only mode when groups are unavailable
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>, arm-scmi@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 16, 2025 at 7:37=E2=80=AFPM Cristian Marussi
<cristian.marussi@arm.com> wrote:
> On Thu, Oct 16, 2025 at 07:05:21PM +0300, Ciprian Marian Costea wrote:

> > I=E2=80=99m currently exploring a solution to improve the 'pinctrl-scmi=
' [1] driver
> > so it can better support SCMI platforms that only provide individual pi=
n
> > control. At the moment, the driver handles only group-based operations,
> > which means platforms without pin groups run into limitations.
> >
> > According to the SCMI v4.0 specification (section 3.11.2.8), both
> > group-based and per-pin control modes should be supported. However, on
> > pin-only platforms, the current implementation cannot enumerate groups,
> > configure pinmux, or assign functions per pin. This results in probe
> > failures and '-EINVAL' errors when trying to configure non-existent gro=
ups.

First: it is usually not true that no grouping exist. They are usually
there in the hardware, it is just that the fact that the programming
reference document document a register for each pin and you just
cannot see the forest because of all the trees (pins) literally.

I.e. just because pins *can* be controlled individually, this does
not mean that it is a good idea for the SCMI-back firmware
to *expose* them as individually controlled.

Example:

Pins 0, 1, 2, 3

Function uart0:
Poke 0x3 into register A to turn pin 0 into UART RX
Poke 0x3 into register A+4 to turn pin 1 into UART TX
Poke 0x3 into register A+8 to turn pin 2 into UART RTS
Poke 0x3 into register A+12 to turn pin 3 into UART CTS

Some people will see "4 pins with individual controls"

Some people will see "4 pins in a group exposing a UART
with RX, TX, RTS, CTS" and create a group of these
4 pins called uart0_grp =3D { 0, 1, 2, 3 }

Now, often RTS and CTS isn't used, so maybe these
need their own group and the intended use is more like
uart0_rx_tx =3D {0, 1}
uart0_rts_cts =3D {2, 3}

Now the usual complaint from the software engineer
implementing a FW driver or Linux kernel driver is
"I don't know what use cases and groups are appropriate".

But this complaint is coming from the same company,
the same legal body, that produced the whole SoC.

And this is not to act as a coherent company.

This is overall a clear symptom of throw-over-the-wall
engineering.
https://en.wikipedia.org/wiki/Traditional_engineering

So I would take a step back and talk to some hardware
engineers about this before proceeding. The SCMI
exposure of groups and functions look like they do for
a reason: per-pin muxing is use sometimes by hobbyists
and consultants to SoC companies who have no direct
insight to the hardware and cannot really communicate
with HW engineers.

But for a *firmware* we certainly expect the people writing
that to have talked to the engineer who designed the
grouping inherent in the hardware. At least try hard.

Then there is the last resort which I would think twice
before implementing:

What the Qualcomm driver does is to create a group
for every single pin, e.g.

gpio0_grp =3D {0}
gpio1_grp =3D {1}
....

Yours,
Linus Walleij

