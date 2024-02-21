Return-Path: <linux-gpio+bounces-3556-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFC385DB2A
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Feb 2024 14:38:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 103601F23104
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Feb 2024 13:38:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92B9C7BB18;
	Wed, 21 Feb 2024 13:37:37 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D4769D21;
	Wed, 21 Feb 2024 13:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708522657; cv=none; b=jHNuBpNg0TIIri87evNEimDvZe2rtuLNkWAIwTUH09Tmoz0pkM04gyYRi2hll5Vr3zI8gnBdw9khzqzAtlpYkw6QBL1RqlBZUz4HxZCby7LQKUNl/9LJB/CHzQdBaf+mYEetRIuB2ums4ONYceYoN7Tk3cC3vcTCQQ5CQ72w5ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708522657; c=relaxed/simple;
	bh=iS804qs1h4BEJoxoWjKIrQm3dxskVLa9Ro3Ap/QBM1Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YJCFnsWPSt1x4t8DlESep5hO+dWbIhPVEwyEWxR53rNAsabgFqCMvXeakf7ZSu3zaq9lfSybaVhkYNSGfZTi4cQu/PqZ+HVwqXOnORTAHwmlSVpDk12iWiO413lwRFP9nNp6MRxHo4o3uIZy/q5qs6HNewtvqchFwHJvcKlIQuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6002317a427so55196807b3.2;
        Wed, 21 Feb 2024 05:37:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708522654; x=1709127454;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K0bSkTgLYcWEHzX3S9xi2L2EAG2cNN8/2Y17PgGgwfY=;
        b=L2aZUlch4Xu/vU02gkS+drNhHK/vD0ABvUQ7rFx4GBuMzOSdHa5hRONe8YHBY2qIRw
         3dD5XDdF/me6wcrIJAJt7BZoB3QH3t8gpD+LicrQx64t1X3NqqScllvGpKzmWkVZUBGF
         qOoveVCmScVan/pyf0qr8rve9znT/MgAHzWxPKET2eS+XpLOQH9wgLUFfq2OgpiI3Vo5
         OXXuUcBkyCzCRokwJdli6TEXr5jFwYI1drfsJO+AChTM3w3tfDpwzq8ShyRFidxI0lLI
         frl/YCMRB1I0TThiN84G1xcyGXHUmBA3c2f9MPcQV5jux5Mv+IGDdSN/wxnah+rIkez5
         UhTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXZ3YUUhKFwizKQ7+cySoJBdStahniqrMUpEq1vPdFfGFwFIF1LX+GlzrHhOg5EeW82C3qvzmdsAqpgqCpsUpeje0Hxi65d8XksnS8TyC047nRwlZV6fgGQofFYRGLqwlM2aDNoTQdI5PbJ7Ao
X-Gm-Message-State: AOJu0YwSAD4AjHVTyOBNea/S6KbgeTFd9ZTR3I2+awfrSQ7JUke20neA
	MqHUC9+LfVnJWH2C/85St9SPyMcSfscsGPT1g8CuECxTZ2zLM8JudWMHqzdC94k=
X-Google-Smtp-Source: AGHT+IEwkKFiCXz+BSXK6AZRpQnEhZ33uMgdYf+neLVtSffCsz1AzY3Q9Ls57V30kseHZ1wcPoz0Nw==
X-Received: by 2002:a81:c252:0:b0:607:9e4b:f0e9 with SMTP id t18-20020a81c252000000b006079e4bf0e9mr18995256ywg.31.1708522653969;
        Wed, 21 Feb 2024 05:37:33 -0800 (PST)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id m8-20020a81ae08000000b00607b6c0065fsm2590040ywh.43.2024.02.21.05.37.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Feb 2024 05:37:33 -0800 (PST)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-607f8482b88so50303457b3.0;
        Wed, 21 Feb 2024 05:37:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUZayQoJWLoOBmMwzyQF/CF3NkJgOBJ1Dy9XOl0qu92Jb1kx5dUmiE1i+OPwysvohD9y7R1TgZ3BAF3TQbAUnXdUTlmDfRA5ZC7FnSePjUq9lrY/vIsuRMz2TllbJsSji3fo/CKOy/IiyhUYGXi
X-Received: by 2002:a81:6f41:0:b0:607:7c29:8f4f with SMTP id
 k62-20020a816f41000000b006077c298f4fmr17059093ywc.13.1708522653640; Wed, 21
 Feb 2024 05:37:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6238a78e32fa21f0c795406b6cba7bce7af92577.1708513940.git.geert+renesas@glider.be>
 <ZdX4SFXv53QyF49N@smile.fi.intel.com>
In-Reply-To: <ZdX4SFXv53QyF49N@smile.fi.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 21 Feb 2024 14:37:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWA-q+O3hg=1KfsF5yZqr8x=Pf7ofT27s6nv1u+1TEO_w@mail.gmail.com>
Message-ID: <CAMuHMdWA-q+O3hg=1KfsF5yZqr8x=Pf7ofT27s6nv1u+1TEO_w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: Allow the compiler to optimize away sh_pfc_pm
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Paul Cercueil <paul@crapouillou.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

Cc Paul

On Wed, Feb 21, 2024 at 2:19=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Wed, Feb 21, 2024 at 12:13:59PM +0100, Geert Uytterhoeven wrote:
> > The conversion to DEFINE_NOIRQ_DEV_PM_OPS() lost the ability of the
> > compiler to optimize away the struct dev_pm_ops object when it is not
> > needed.
> >
> > Fix this by replacing the use of pm_sleep_ptr() by a custom wrapper.
> >
> > Fixes: 727eb02eb753375e ("pinctrl: renesas: Switch to use DEFINE_NOIRQ_=
DEV_PM_OPS() helper")
>
> Is this a new requirement (I mean more than 12 digits of SHA)?

Nah, better safe than sorry, as 12 is becoming a bit small.
(Yes, I have to rework/resubmit patches related to that)

> > ---
> > To be queued in renesas-pinctrl for v6.9.
> >
> > Alternatively, one could add a unified definition:
> >
> >     #define pm_psci_sleep_ptr(_ptr)        PTR_IF(IS_ENABLED(CONFIG_PM_=
SLEEP) && \
> >                                         IS_ENABLED(CONFIG_ARM_PSCI_FW),=
 (_ptr))
> >
> > Since there are already separate sections for CONFIG_ARM_PSCI_FW enable=
d
> > vs. disabled, I split in two and simplified the definition.
>
> I'm fine with current approach, IIUC we discussed this that time and the
> 727eb02eb753 was not the first version (or I can be mistaken, I don't rem=
ember
> exact driver that the discussion was about during the DEFINE_NOIRQ_DEV_PM=
_OPS()
> conversions).

Thanks, I had forgotten about that discussion...

> FWIW,
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks!

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

