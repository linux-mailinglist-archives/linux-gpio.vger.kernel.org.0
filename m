Return-Path: <linux-gpio+bounces-17822-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F925A6A2EA
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Mar 2025 10:46:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D39C63B2365
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Mar 2025 09:46:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48D59221DBD;
	Thu, 20 Mar 2025 09:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MUDszkGw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607DD220687;
	Thu, 20 Mar 2025 09:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742463969; cv=none; b=tO4Z/IlKVa5wXm2bFbq0tDPaYF+XePcMmKHE7TDoqpT86f80nZx/PL/TedOfUFwClLiiQFHhHNTNVn8rqjAaJnWLIKe7VjlelSuKxk7cb158kUfxOwDeMFXpGut7rXK4iCIOdr8JKCwfM9pIPmdXtfuAGo5rBHErqz0lAaqoOaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742463969; c=relaxed/simple;
	bh=9KEnR66BBq0/OEh9u1+50TsTpEWKW5YWZxaSBSaTBiA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VJLiHbJWLKO/PuaEAGWKGv6fcPHDJaEZE4xsrGePGfReSp0CPjxv7yoOQezvNrfdo8WsaZrveMYLbqbLAQsVxKJRQFMrOmYaMWOkEbzEw9IjQuKuOap0JNUwk5eC1NfFBYybHc0B5cbnny7dete9yKIX7ov2sLquZaSnfygq57E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MUDszkGw; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac2963dc379so101240266b.2;
        Thu, 20 Mar 2025 02:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742463964; x=1743068764; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9KEnR66BBq0/OEh9u1+50TsTpEWKW5YWZxaSBSaTBiA=;
        b=MUDszkGwFMj8AuVudQ41vCczeoEnb9lOCDWELKk1A/sLDWb/2Z8sZRIZuDvLjzV586
         8cHAoDlcaFPL6kDXQJsh5pGlx3xYIKfTs44NSEfYvcPKhJh1VgsXUk5ju4m7drDbem0s
         SiZuLGAYBCuGu73N/Hm/KzfBq9htGwpRTZCgqlLT3Jsa+RpKm8q5JwNWQftznmvkwx95
         Oztj/2aXuGK+ZliHC/N4k+1frRxkIsztXMwKcTg+EX1Ti2FLKiOGuvkb6Hb+9Mra7i2b
         7tADp3loj/LkwByw9i3+KL3dZL7X963TJS9he6olJMTrjywsA3Zd3Anl2rNkpyBFkCiQ
         xTAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742463964; x=1743068764;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9KEnR66BBq0/OEh9u1+50TsTpEWKW5YWZxaSBSaTBiA=;
        b=R3phdFU5vExbTdrGkd/2TTGHN6NYjwDliNAO7VB4oVAvH3Cn2DE/V4riCPgU0JmWA4
         N0ngUwhVhOGTZSqSeLxP78m4vt+o6J4Z7qnSDigpACdRvpLXihSp84J7mI23uOvOvQdF
         HFlgnrJgi5RiUix8oqzDmi6VzK5WfQ3N+wgoPVvwQBg+j0NOYuhCuj+3UxOenUMbEBYW
         9JEqjOYVa1Zo2CF+t8BGfoyU66FJ4pZt/LOLq3jwrxGnFq6B6eFasa5E595+gKMMbSlo
         h2KwZc4lIi3k2Vp3QVlVo11K4Ef4i9iWQ9h7wUmnlvmOL0cIPRESfOo2xlHvFPBbM3pU
         i5FQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyX5XUPmw+Gzd/rBkzlXxVQ481vbteVK4p8Yc5Cb2CUt3oZ9L5ak0t6rhYvHxx2oc7ixnKTOyDjAW7@vger.kernel.org, AJvYcCXmvEp210Lc8GCycM5lp3mPCsxUbqpDs4I9jAARuoLn6ycKnliFR6PJti7ZYxKt1Hc4+XHnU9SsEqRQWSAw@vger.kernel.org
X-Gm-Message-State: AOJu0YwyTrl12G4CwM7v1wnjx6dto8Carx0fy8MGfwtLErIyzCbg3wYX
	RP9Br6NdjeSxfuMmpleml3rUBKM12lWFuwx0/3Y91QN6kGMGllTEO9yzd7WS1Z27OTKEVDC9ZNg
	fYruaR1E8D+03W2jqZdFASq0YZAd+gGjghr8HKw==
X-Gm-Gg: ASbGnctHouC1znGnQzC/vuQNjsJPUCDkilRQxpNwN4NB+FN8+2Z5fG0j2Tnu5WWDspE
	J1NuD8IgTwnQ0OTNHaZLKdVCap9JDPAIJPgyW60nlcHx00YZsDUBSn8mIvgR1AuGuqjH4jyhxBR
	97SdJ1/DQSaj4j9B6EME0F9b2XlpqoIYKyFX6W
X-Google-Smtp-Source: AGHT+IH0WgeCzcPbZMZ7RcmmYI5xx52o7t7ZMdyfRJZKbVhCltB5dB5p47huOWOMje9qXnxDbQEClo4vl/rS3uHSu3A=
X-Received: by 2002:a17:907:980f:b0:ac3:cad2:9e53 with SMTP id
 a640c23a62f3a-ac3cad29f08mr325129066b.55.1742463964281; Thu, 20 Mar 2025
 02:46:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250318105932.2090926-1-andriy.shevchenko@linux.intel.com> <CACRpkdbTKytFgdqyDajpcfENagSXPZhG5hbpQiGF23VHqLd9_A@mail.gmail.com>
In-Reply-To: <CACRpkdbTKytFgdqyDajpcfENagSXPZhG5hbpQiGF23VHqLd9_A@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 20 Mar 2025 11:45:28 +0200
X-Gm-Features: AQ5f1JoOVMLoM1UFlrLmLsYwzq3tsN7OH81VeBc-t7MFZOdMOMyvVlUp33ImP1g
Message-ID: <CAHp75Ve_cF=zdZuZxSO6H1FXrCbAc1EXyHhCWw8K3Tc_Q2p8tA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] pinctrl: nuvoton: A few cleanups and a fix
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Jacky Huang <ychuang3@nuvoton.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, Shan-Chun Hung <schung@nuvoton.com>, 
	Avi Fishman <avifishman70@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 20, 2025 at 10:15=E2=80=AFAM Linus Walleij <linus.walleij@linar=
o.org> wrote:
> On Tue, Mar 18, 2025 at 11:59=E2=80=AFAM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:

> > Convert Nuvoton drivers to use pin control provided data types
> > and more of device property APIs.
> >
> > While doing that, fix one non-critical issue that sparse complains abou=
t.
> >
> > Compile tested only.
>
> Patches LGTM and we are close to the merge window so I have
> just applied them.
>
> If there are any issues we can surely fix it up in -next.
>
> Thanks Andy!

Thank you!


--=20
With Best Regards,
Andy Shevchenko

