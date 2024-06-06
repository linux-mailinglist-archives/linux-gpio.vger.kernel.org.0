Return-Path: <linux-gpio+bounces-7224-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEB58FE158
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2024 10:44:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CE6D1F21FAE
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2024 08:44:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49BEE13C69A;
	Thu,  6 Jun 2024 08:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GCBrD5a8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25633C28;
	Thu,  6 Jun 2024 08:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717663443; cv=none; b=NhhT+xXzveU5p/Iw3aRkP2eCLcJ23AbpeH1QIk3jZLvvw3p5sfZzxFK+M6vzgmHXMiTZ7cj0Rv5nyBPAlliwtuZJDjUMi4FvK+58Xx1veS2QG4Kb62Nks0tJEvB87bIEfRwT0F28xXVf5CY+l8A/yn2bH6IL0xA0UWjkQBGSF50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717663443; c=relaxed/simple;
	bh=9Wjn0rKQIsqEkygiKupj4QiFc9X5IGn0hTrtv+A3hjs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cSE3ii6or9gDiGtzkV6LJY7Ok5FWh6UzJN5ovXg+Kw1gH9WOSnvpjusJXOARxzi7lesRUYz3Izh/4YttaLremRMqEiRcLLoorFHjDzhvOlZM315xvf3eoB/kNycS5ZbapPORaUW0SuyqyVOkj+QWGqlN4Cvr3GJ7vgPPKIonwuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GCBrD5a8; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-4eb12b7702cso203149e0c.3;
        Thu, 06 Jun 2024 01:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717663440; x=1718268240; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Wjn0rKQIsqEkygiKupj4QiFc9X5IGn0hTrtv+A3hjs=;
        b=GCBrD5a8v2KgW8F2/0Gtle9LIh+OH+E8Rhctm0t8kkDwY8IsPSg7viLA0P5QObFU0R
         gng5wpgCLcI5D1R3Zolwd1fmRh/vJpLM83Krh1q9f+wuPy1tsBpPj+yFDK6Q0CffJsf3
         tV+F3Sex6ZLIr9QRWmIqmsdErg0rvafqzpjcZP3E/MgzD9wN92tBnrsBlq28UjCRYvBk
         RukJzOENvdYj8mvHfJCyEDuBFhzXvx3D18ffmQaJUwVyNnl5OZNcbTS7mdvAeh3rjJR+
         iH+GoRdW0PjLy/+PCAjXEFooL0iqGPQ1LgUpgGLZs0J2v9PsjdoTE4PIXswZFY8gwCvc
         shnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717663440; x=1718268240;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Wjn0rKQIsqEkygiKupj4QiFc9X5IGn0hTrtv+A3hjs=;
        b=Xfb+YVRQqYHxuFlHOEHBsxqPIrDJk2PQDP8CwrK5RybkeZcFLsr7W1YfvD1fV37mw1
         yBuc6fN1iH/9XZm09bRS3hWCIlN1lkePonLgXBnsZZU/RkD5x8uZldCNXEh2Ah9gRNJo
         cygGmdDrYSr17LE2tR4vmJjMZLM1PTmUt6yXTpk2IahshgthRhpeTmu24GVIfrsa726a
         ot6swggQ8a8OrcApTpIdeiP4sOu4mzgEUvBNEHr1ZEnv4sBd8Y1ILXeth1d4oMhkEuuZ
         BUAq+T+/XBh4m+oZ30KL0s/8NqXubKtnrIh/8+WTCIHzd2E4MMi/q9w35ThG8CjlceMx
         MG9g==
X-Forwarded-Encrypted: i=1; AJvYcCWbx0bu23/vj2MRch9vaRGxR7n3IW5QrzkRpJ1EG6+b3/dS9nUv1KqdgvMsd0AuBq7BVGYV+JRwiI0squT4eg9Qpy/iSjFaozjl+HPw8cm2nvDjvDKU6WbZTeZZvk68I3hYSrcpQEkP7dpB0IwDU1ZvXvU1kZvdiowVcS3z2tqkGTWFpgAiy1+JjNGwniZ3M6OTVth4jrDYkhX41rOyuKbkhB5UCAcB7w==
X-Gm-Message-State: AOJu0YweEPDo6nQ0BWisFx1qhGHm1S0nHyz1Ucg/2ZsmXGwmwRK26djU
	95P2hc5R4N7scBS9UoiW/+ejtCmSQz3Yl1qLGrgbw6TMbMUtw1B0GRi8nnAYrg2n6rwrkhq4YlU
	jAKi9PC7ilHodEDbxxkyFghWOV5o=
X-Google-Smtp-Source: AGHT+IHU0aLExsKVLD858HqQEhLFIENgyEE8ujTbs/GcflFqQ3FAyiSnMUqPgKP9mID96GkxwS/CDjfZXQqq4w3tsFE=
X-Received: by 2002:a05:6122:31a4:b0:4dc:b486:e4a5 with SMTP id
 71dfb90a1353d-4eb3a27fe04mr6435825e0c.0.1717663439051; Thu, 06 Jun 2024
 01:43:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240530173857.164073-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240530173857.164073-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240604153612.GA839371-robh@kernel.org> <CA+V-a8tWxGBkuOY=G3RaB_0NXS3ShE-nL+5t49=_mJGvo6j6yQ@mail.gmail.com>
 <CAMuHMdWvdvmt42Wy=5Do2MeCRNbLOd2c8Nra2RFQtumnmZod_g@mail.gmail.com>
 <CA+V-a8sbjD=KghOmw6OEWXxbbPkmW-ycwuxFxh43GL3nKhLWxQ@mail.gmail.com> <CAMuHMdWE3ZsNZ_WgwhmOEEqCMNUdoskVf6C=QJgThsK0kJK8Jw@mail.gmail.com>
In-Reply-To: <CAMuHMdWE3ZsNZ_WgwhmOEEqCMNUdoskVf6C=QJgThsK0kJK8Jw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 6 Jun 2024 09:43:33 +0100
Message-ID: <CA+V-a8uLjUTadK17rpwG8iW9Vh=WQ4WdccuccMkQnGue9Yqbiw@mail.gmail.com>
Subject: Re: [PATCH v3 01/15] dt-bindings: pinctrl: renesas: Document
 RZ/V2H(P) SoC
To: Geert Uytterhoeven <geert@linux-m68k.org>
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

Hi Geert,

On Thu, Jun 6, 2024 at 9:41=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Thu, Jun 6, 2024 at 10:38=E2=80=AFAM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> > On Thu, Jun 6, 2024 at 8:13=E2=80=AFAM Geert Uytterhoeven <geert@linux-=
m68k.org> wrote:
> > > On Wed, Jun 5, 2024 at 11:39=E2=80=AFAM Lad, Prabhakar
> > > <prabhakar.csengg@gmail.com> wrote:
> > > > OK, I will fix the above and send a v6 series.
> > >
> > > Please don't drag it out that long ;-)
> > Oops, that was a typo.
> >
> > > As the rest of the series looks fine, a v4 should be sufficient.
> > > Actually a v4 of just the first patch would be fine for me, too.
> > >
> > As agreed patch 02/15 needs dropping, with that patch 07/14 ("pinctrl:
> > renesas: pinctrl-rzg2l: Add function pointer for locking/unlocking the
> > PFC register") does not apply cleanly anymore. Maybe I'll just send v4
> > for the entire patches?
>
> Fine for me, and up to you.
> I can easily drop 02/15, and do a s/BOWI/B0WI/g before applying.
>
Thanks, in that case I'll send a v4 for patch #1 only.

Cheers,
Prabhakar

