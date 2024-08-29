Return-Path: <linux-gpio+bounces-9406-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE6B964E99
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 21:16:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0CBBA1C22961
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 19:16:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADB911B86C5;
	Thu, 29 Aug 2024 19:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TL6UCmDy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D1D1465AB;
	Thu, 29 Aug 2024 19:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724958957; cv=none; b=X/yxTZ20f/oN1/nKES6nvDLbQhhPnpYtaqOtTNaQE3zeXT56lD2QrVorf4U/6eY2/kg1S1+pWMBwe6+c5S4CyeNdh14gTWLRoeqnzrigJYVS2y76lIzmuZP/x1BdYSQjq3LNUqSITAIOIySF1lsavam8ZzbA7LGbqcwqa06z7TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724958957; c=relaxed/simple;
	bh=0jXi7+7QMhF/FyYgxjssnc7RbxbhImRq/78BKVAp2XA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iizfL0EP6SnoEl9R3m4SCvKuiKvUYbq8gJpATgQbIuv0T+xcJz6TSAg9nNDA9FCEJFqJZqxrpzzhqn/vWR+AvX1L0AyiOV16cURwjkYoStfS1J4JdfGC9VPLxQSANeE4YdoHPHZn2nJfIb2OluCJjZtDKpgPpUGYT0fma0W0Zk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TL6UCmDy; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-4feb60e525bso587477e0c.0;
        Thu, 29 Aug 2024 12:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724958955; x=1725563755; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nR0JuAwLuIKu+YZbSZKkpBbfbZUDSLztLsb5RIpWmB4=;
        b=TL6UCmDylPiyrTNyc68n+ztq5Q5WISuBLZ3rVeXdtIG3NvsNWHfPbpznFDe2Qmb4fc
         4PPuZogz3Es95t7FsJBZE4G1eCUPKEnLjmri7iT0BMTf9s6N8xCpisSNogzjvvDH4Rdv
         InQpRbd3M+3CdL71h5ouKmQcQSg3imt6cs3wTZt0tKItQsHQpa6vHJE0e+gWduxVigEt
         ukKT0iQ40uSMbOCi9VAlpE0QkDnYh7XV+EQ1WOJst49v3jqnFIaaKTCiWcfFWk81W6vZ
         +mhwLC8Sr/pWQgR1RqESUVvXQqf03ASa/PUpLNlVjqeg5N/E0rSS7WMdNQH8CSq0BlKI
         +LkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724958955; x=1725563755;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nR0JuAwLuIKu+YZbSZKkpBbfbZUDSLztLsb5RIpWmB4=;
        b=mtLI3IAVQpRBwdBy+7b9ge/L/ylWm/4VdXYaRbebl4okJ6U6KQGclNUlXHZUU6GJXZ
         3b+af683t+D/Bt6XVM+r/XmQHqNOmcajlOcow+Jd1Ydjo/aRdPm0u4XCQhYDlgad6dP5
         clqO2NWkQ4A3mWxDibDCh2ZZ9m8VYPp/18zwQXO/05BCaYxpXl0jCx9st0jE8gkFDXcq
         h6CuYQYyObrW6SZohkURiOq7Jh4g21MpIjtQrgaYFDF0GaMiZur34h00SAMEViOD+J9Y
         pnGrXslUHHsnwZUkA2Fa1vdlE2ugQiUZoNW/ZjfoEUoXUSUppOjhip9XSq+05/vDEXYE
         iedg==
X-Forwarded-Encrypted: i=1; AJvYcCV0PYGWBNOlgkucYkDoRXFVkVpraGKcOxinnPIEaaCdwplPamK2ZxL5nHtsSRA+lBLXPU2oTbarBKtyLwYyQYL7taA=@vger.kernel.org, AJvYcCX0Se00CoimizG5uycWsLJCaQoCp+hWmtxw494XqH6jCNbI9/7gqD4iBVlZud486VT1VJf1CkWbJQcF@vger.kernel.org, AJvYcCXVUfmj0ybzMslaeZMm7C6iASPc8ONspSE7CDlWy6Vy8AO/ZKYETvWYwg0B/f/fCOj6DOorjm4tMDR8mVj2@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4G71YBs1l5FdmIM2YwUwR8cRlNmKYsfcQI72BlaTGPUv3fIEH
	+qkAVMHGPERzHVOr4ZVFLS3EEmCjfl5UjSjpWevYc4OmkUK4sEjajQROj1fZf9CHs5kI/IjeyGV
	uRg0fMJimEUSAIWqwL+hHFK+JjQE=
X-Google-Smtp-Source: AGHT+IHgv7JcjoF2hykAtWUI6o2nnP5h2u8BmIiAGNCkjmIUGko5XrcSIvgWtonot4VZ8C5CT7i2yskb+aCm7ARQRYA=
X-Received: by 2002:ac5:c4d2:0:b0:4f9:a30:d855 with SMTP id
 71dfb90a1353d-5003b09d2f7mr3094385e0c.3.1724958954636; Thu, 29 Aug 2024
 12:15:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240827131722.89359-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240827131722.89359-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdU739fyGhF4WGo-REEus82h0VVz+jQtgXk5qUaTqvu6hg@mail.gmail.com>
In-Reply-To: <CAMuHMdU739fyGhF4WGo-REEus82h0VVz+jQtgXk5qUaTqvu6hg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 29 Aug 2024 20:15:24 +0100
Message-ID: <CA+V-a8uU2UfhB7JhSKOuOQrOxaGtyuKAMWW-ZC+xDrfYRpHekA@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: renesas: rzg2l: Introduce single macro for
 digital noise filter configuration
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Thu, Aug 29, 2024 at 2:09=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> Thanks for your patch!
>
> On Tue, Aug 27, 2024 at 3:17=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail=
.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > When enabling the digital noise filter for the pins, it is necessary to
> > configure both the noise filter stages (via the FILNUM register) and th=
e
> > sampling interval (via the FILCLKSEL register). To simplify this proces=
s,
> > we introduce a single macro for configuring the digital noise filter.
>
> Currently the pin control tables just declare which pins support
> digital noise filter configuration, but the driver does not support
> configuring the digital noise filters yet, right?
>
Yes that's right.

> So I'd reword the paragraph above to something like:
>
>     Support for enabling the digital noise filter, and support for
>     configuring the noise filter stages (via the FILNUM register) and the
>     sampling interval (via the FILCLKSEL register) are related: a pin
>     supports either all or none of them.  Hence simplify declaring digita=
l
>     noise filter support for a pin by using a single feature flag instead=
 of
>     three separate flags.
>
Ok, I'll update the commit description as above.

Cheers,
Prabhakar

> > This patch removes the PIN_CFG_FILNUM and PIN_CFG_FILCLKSEL configurati=
on
> > macros and renames PIN_CFG_FILONOFF to PIN_CFG_NF.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> For the actual patch contents:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds

