Return-Path: <linux-gpio+bounces-7222-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 910008FE145
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2024 10:41:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90DB41C24DAF
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2024 08:41:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EA1E13CF9C;
	Thu,  6 Jun 2024 08:41:10 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8331213C69A;
	Thu,  6 Jun 2024 08:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717663270; cv=none; b=sVR/Vp/Y9PyRd5vEf0GYfSmMyB8nEFxsY2jm3PHsIVl7v5mWHDoXr2pIm4HCur+ecdL7M8Y9rJv+EvPUgVYeCZtsQcJiHI8QeN5eizKtuzBnayMP9N6FnObxyxZOnCc8QQacZK8TuEyFMSSbrmz8Zj5CuCLJ709jIXQ3S0141as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717663270; c=relaxed/simple;
	bh=kLTF0LF86rZ6TPdKMpFHXRAynse2+A4IFt/K7Y1MS70=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uiIK6IDn+DWQTo0oOqUBjCsNChZ6HX0uv6lZC9N5qIM39O2/eOWX8b3kC5uP0u42JW4fTEdi+wMAD15+kVllunVrY+Egy91gjNoZJkU3GBjpGcuKbwPGnHb6S1svfGWnoyPy8/Cu5VCD3t7+VRhtaVANs5fhn+mrjYLA11nBujM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-df771b6cc9cso769464276.3;
        Thu, 06 Jun 2024 01:41:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717663267; x=1718268067;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7rJJ6wIAGO4z93hTC8lSOsbCqJndTTd+qtAeIcf8Fus=;
        b=f5kyYoLvcn5+GN0aS8N90BrEcw65dfRkwKqHtfN0fuFDSecYxTggcsqTe0I8zon435
         YTurHrtkjcQ8171JaHIA/oo6nDCB3UUR4cwomfCW/wk763amrYxr1mmQVHyYKs/izpFP
         R6zQtT/2cqHQnJ7fGfTL1baHMp38z+qknXKXr/KCEtB3Led1D2j54NLqJDG7IM9TBbfd
         XQPsqf17mQMO8SJ1r3ME74y9xpOM3iMuYgxrSYR1oHJL/J9ldeR2E9W2SGqS/dX8upjo
         +s5aYaoGBjDbXD7XXiFgo3S/OjB0MKRXmUrHyDxXyIJVp3FBg7Zx72C64a0KTdnSAZ4I
         r7sA==
X-Forwarded-Encrypted: i=1; AJvYcCXEsM6s7WwTnlDG4SMTCqaT/uN7CU+wxSEJN+BJ89ZkttsvZFXltUrg2qGrSEGiW90pB/3WuU2B5hnbAPRnNCuJFZ+CYIopwavv0iMuc98mTb8Gb9apuFmXbOy8tARqG4I3bvKws5QYhTAxpgSSeZKrfMc7C7Jj6dZib3HADutTZovnf3SghugNfVwH32G2yDralUhMkFVWGJmmIxxkshd67vLyZqzHiA==
X-Gm-Message-State: AOJu0YxW9xvht2r6iCxXy6zIfmYFFsK3/RGy7TrbOMqN2MbOYxIUZV99
	fOsl/YE2Yo/gzEItKcSHYCQvtUrAnUXrIGg/xBY/eIG1DQSK2SytJ+SlX4L6
X-Google-Smtp-Source: AGHT+IFj2XrgSOkLCdkhrx7rLI/AhecH+wnyPU0ydigPIFlIDaLicwSVWuTSA8MkE4PaXgGrdk6d7w==
X-Received: by 2002:a25:6fc5:0:b0:de6:1a66:3e4d with SMTP id 3f1490d57ef6-dfacad0c760mr5104885276.59.1717663266640;
        Thu, 06 Jun 2024 01:41:06 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-dfae52bc078sm204469276.7.2024.06.06.01.41.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jun 2024 01:41:06 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dfab4779d95so736549276.0;
        Thu, 06 Jun 2024 01:41:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVa09VyOL9KZ0WRNH6u9h8ll9Qr641bTFkvUl9lnm2CLAbgMD4Giq4G3Qgp6Y3MuAcX9yJ5+ir50F6xkdYnq7jhQYuOvGYeSgB8LEdtdbuc2TU6QA6FuwFWQDa27uT0jjh7gT9arOeSR2X98tKUiJ0rmXeqpcCSC4EKKwVRY1wu90OfpkdlxTfz6SDr5p9/iVQsmSvaGiCfTQZEtvsHmaO8ObG8IIIqdA==
X-Received: by 2002:a25:948:0:b0:de5:507a:7378 with SMTP id
 3f1490d57ef6-dfacacedf3emr5460184276.45.1717663266094; Thu, 06 Jun 2024
 01:41:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240530173857.164073-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240530173857.164073-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240604153612.GA839371-robh@kernel.org> <CA+V-a8tWxGBkuOY=G3RaB_0NXS3ShE-nL+5t49=_mJGvo6j6yQ@mail.gmail.com>
 <CAMuHMdWvdvmt42Wy=5Do2MeCRNbLOd2c8Nra2RFQtumnmZod_g@mail.gmail.com> <CA+V-a8sbjD=KghOmw6OEWXxbbPkmW-ycwuxFxh43GL3nKhLWxQ@mail.gmail.com>
In-Reply-To: <CA+V-a8sbjD=KghOmw6OEWXxbbPkmW-ycwuxFxh43GL3nKhLWxQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Jun 2024 10:40:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWE3ZsNZ_WgwhmOEEqCMNUdoskVf6C=QJgThsK0kJK8Jw@mail.gmail.com>
Message-ID: <CAMuHMdWE3ZsNZ_WgwhmOEEqCMNUdoskVf6C=QJgThsK0kJK8Jw@mail.gmail.com>
Subject: Re: [PATCH v3 01/15] dt-bindings: pinctrl: renesas: Document
 RZ/V2H(P) SoC
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Paul Barker <paul.barker.ct@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Thu, Jun 6, 2024 at 10:38=E2=80=AFAM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Thu, Jun 6, 2024 at 8:13=E2=80=AFAM Geert Uytterhoeven <geert@linux-m6=
8k.org> wrote:
> > On Wed, Jun 5, 2024 at 11:39=E2=80=AFAM Lad, Prabhakar
> > <prabhakar.csengg@gmail.com> wrote:
> > > OK, I will fix the above and send a v6 series.
> >
> > Please don't drag it out that long ;-)
> Oops, that was a typo.
>
> > As the rest of the series looks fine, a v4 should be sufficient.
> > Actually a v4 of just the first patch would be fine for me, too.
> >
> As agreed patch 02/15 needs dropping, with that patch 07/14 ("pinctrl:
> renesas: pinctrl-rzg2l: Add function pointer for locking/unlocking the
> PFC register") does not apply cleanly anymore. Maybe I'll just send v4
> for the entire patches?

Fine for me, and up to you.
I can easily drop 02/15, and do a s/BOWI/B0WI/g before applying.

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

