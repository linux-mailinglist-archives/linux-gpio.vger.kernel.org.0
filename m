Return-Path: <linux-gpio+bounces-29025-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBC2C80F72
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 15:20:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7AF053443CD
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 14:20:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 943B330EF92;
	Mon, 24 Nov 2025 14:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QKwMy0c+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E213064B8
	for <linux-gpio@vger.kernel.org>; Mon, 24 Nov 2025 14:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763994015; cv=none; b=bpd2DzbFKQmLiZ823r2SNteeHwQOg6+MtdCwemx+HHXPRZ7oY9u2dmh/2JhMUkjwZtmvRisH0Jqk4vC7IQ4pGuj3sSdLoFXX87x3p5R04m9oWTNSK3802r4n+xkaoWdmHVKNuhL2BnT2JRxF/O2IvZvreVvzT/oy8DnMHSa6MXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763994015; c=relaxed/simple;
	bh=46kRvVWyQXGS9pUlZvBUnKc8mKLrg8La7QYi4qmVpWQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UNaHF4/fJoxWFRXlrlDnH4296d2ZLsydAA5HXl56UezEYLWWh9mq1Uhct0RQ+YB7hjHybR97Giwv0Vq+ny58OqqzJmzmKe2A8PCy8jVWaGQdVPUdmgKjam83itW0/imh9yCCr4isoFCscck5TmjRKvLbIfPe35+2AGgZWT8Ifm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QKwMy0c+; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7815092cd0bso40020607b3.2
        for <linux-gpio@vger.kernel.org>; Mon, 24 Nov 2025 06:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763994013; x=1764598813; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eTsU3/VBT7OkJy6nyHJhlew8G/sSBpilG7m0hm09+DI=;
        b=QKwMy0c+8Q0ASvsyO9VePV2vkdnZ84h+ZNZ2XqauHK5+1RnhdYasm/6/0t0a/VJ8QM
         f35tqCYcQzG0bM3j4ZgRLAaaDqhJy+TWPTggS/WplfcStCgO2A9VDOfqEBiYfeIRQCAR
         Xxm59qsc+gBHq6ptJ8boxaGA8dPDDnIL80GkaYG0wiKotKDKG2LRPcwVV5JTZfgbfQaG
         ET3xW0RP73aUyhWOB3RJLwUuLqN58vlFyhWtuUVo3sASfH16TTc/jV4F8Q2/VQpi0XLK
         2nMaGhH1Nhy1sHYu+kNATPL20USDIKFsNd+qBgNzaHpP56ktnbanmyuxnXPeqaYBL6dd
         t6eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763994013; x=1764598813;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eTsU3/VBT7OkJy6nyHJhlew8G/sSBpilG7m0hm09+DI=;
        b=oIsp9cCbWH0MI8hn3PytPgORHEMJ1/q2otbCccHVfkxu446D0bpAadd4VJg4y4Ryfg
         NDnF5xph5VszwODnMDWf+e4847GTaH6lOGS2ZxYQUwksKfU4bWD3HUeyfxO4t3w9Tf+Q
         YyhIWaF/GVFmU4cS4XtPNSglsxUb6RW6dB4PLK8baAFxs3YTGEVdU97P4xa5o+tSxjVt
         kRgYYGxBO+t39zE0+Dm/GGwFZqIJ7Ctf+w8XsGJMwz11CiGoXq+dNwKVDgjkvlttrU9Y
         kbkra0i6QgGlN40WDdDQuRrhg7D2yyBzwYxoNe69TFQ9Tab1JQNER9vA+92xqOtzHjg7
         e6Yw==
X-Forwarded-Encrypted: i=1; AJvYcCUAniaF2Wvf78xpVDzEEuMuOiQWP203SAT2ePI244AEEUEX6Ab1TaLOBDMq60CwdNXgUgfHhfZwoNks@vger.kernel.org
X-Gm-Message-State: AOJu0Yzob0rc/5ToLFb+BV42PIy3t4PYRBFpeja+yQcEu/ncs8j6/jvw
	GDWfOPCu3k+0Uyeg+qB5DoETidTVpLRWRI+SCaZ1AIns+Mq966JrbxoxR9zQA3LQUwdj5QsXfXA
	9SD5EEwmJRkb+Ap5qXkqdbXDzTJDXGCg=
X-Gm-Gg: ASbGncseZBMI5JXIrgWN7Q5YrUcrgjcpN8O9n8/Ls1nq4kM2pEjEu9SZVFTo7lgzVZ+
	t5fdqXIb7i4cYIvhpAuZbYerSd1Kn/h+vKDSmb3Hj3QBx9sS3tolUHzUJS/rG80NkoNyP5dQZg9
	4/ZZ1VmnvdIwRoqC6TWe+L9LioX1nF0aCVtBaktckpzJ4m6OyOwQxvNEtnGCA/rqi8VRlZdcubE
	lyv5PFG1uGZP4izajsBGdZ8onK9glSzgqQU4WEFF3PZlSinCz2WsSTL8eAy5mQlRQpchw==
X-Google-Smtp-Source: AGHT+IGXDHAnoYqNvGl6qbUdw4DMm1fGVB/3Tpw1uJs9W3Glb48smmRl2MqryTURWd1WdtrIiMUU5XKD2nAkGvh+X6Q=
X-Received: by 2002:a05:690c:74c5:b0:786:5712:46b8 with SMTP id
 00721157ae682-78a8b47af0bmr176562577b3.5.1763994012509; Mon, 24 Nov 2025
 06:20:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251124002105.25429-1-jszhang@kernel.org> <20251124002105.25429-3-jszhang@kernel.org>
 <CAOiHx==ttP2T=VLsSE9nLr5Cai_D+Khr6ePJVdOEim8ThWSdmA@mail.gmail.com> <CAHp75VcRWODpL2DjAiPm0=bhTJfjs6RdNgtroRbvEW7ong3ALg@mail.gmail.com>
In-Reply-To: <CAHp75VcRWODpL2DjAiPm0=bhTJfjs6RdNgtroRbvEW7ong3ALg@mail.gmail.com>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Mon, 24 Nov 2025 15:20:00 +0100
X-Gm-Features: AWmQ_bmwAL8s4vZ9H815tlfRFg29LQmJQkA9Zmf12Y25EoI_zAX2FlKPyt9VVWc
Message-ID: <CAOiHx==5TkW_-3yoqN_MzhdLKbMFvXRj-pWpuS5ahTM_ccVekw@mail.gmail.com>
Subject: Re: [PATCH v5 02/14] gpio: brcmstb: Use modern PM macros
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Jisheng Zhang <jszhang@kernel.org>, Doug Berger <opendmb@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Andy Shevchenko <andy@kernel.org>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, 
	Michal Simek <michal.simek@amd.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2025 at 2:52=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Mon, Nov 24, 2025 at 2:40=E2=80=AFPM Jonas Gorski <jonas.gorski@gmail.=
com> wrote:
> > On Mon, Nov 24, 2025 at 1:39=E2=80=AFAM Jisheng Zhang <jszhang@kernel.o=
rg> wrote:
>
> ...
>
> > >  static const struct dev_pm_ops brcmstb_gpio_pm_ops =3D {
> > > -       .suspend_noirq  =3D brcmstb_gpio_suspend,
> > > -       .resume_noirq =3D brcmstb_gpio_resume,
> > > +       .suspend_noirq =3D pm_sleep_ptr(brcmstb_gpio_suspend),
> > > +       .resume_noirq =3D pm_sleep_ptr(brcmstb_gpio_resume),
> > >  };
>
> ...
>
> > > -               .pm =3D &brcmstb_gpio_pm_ops,
> > > +               .pm =3D pm_sleep_ptr(&brcmstb_gpio_pm_ops),
> >
> > won't this cause a "brcmstb_gpio_pm_ops is unused" compile warning for
> > !CONFIG_PM_SLEEP?
> >
> > You probably need to add a __maybe_unused to brcmstb_gpio_pm_ops
> > (which incidentally DEFINE_NOIRQ_DEV_PM_OPS() also doesn't set, but
> > all other *_DEV_PM_OPS() macros do).
>
> Shouldn't it be covered by the same trick as pm_sleep_ptr() does for func=
tions?

pm_sleep_ptr() becomes NULL for !CONFIG_PM_SLEEP, so there is no
reference then anymore to brcmstb_gpio_pm_ops. You would need a
wrapper for brcmstb_gpio_pm_ops itself to conditionally define it to
avoid the warning, or add __maybe_unused to it to silence it.

Note how SIMPLE_DEV_PM_OPS() and UNIVERSAL_DEV_PM_OPS() tag the struct
with it (for that reason I assume).

Best regards,
Jonas

