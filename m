Return-Path: <linux-gpio+bounces-7162-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 362218FCA8C
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 13:39:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A88E4B21F94
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 11:39:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1965018C325;
	Wed,  5 Jun 2024 11:39:48 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C687346E;
	Wed,  5 Jun 2024 11:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717587587; cv=none; b=ZNN/j6Zse48Z/b3X0JKpPjUBKY+y60LT2B5KbmQ6hWHNUB+61a8QzQcVwLK0ofmi4Eed7GbhWi1m1NlU5XBLWomMzyX+rsJGlTSX611DYdJhRIaseqpPQcGnUYFEI6eAFfddCEb7UsBnh0LVkLKnnanzgdAKc+TyJ92qPYv6CeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717587587; c=relaxed/simple;
	bh=QIdMPvRUV/iW8tgmVykAUwTW86GBixqbzUfSTWX5mw0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uPEbvMRi1suxI5o4SG5a+JEvBl1j+KV9htrcg/t+ldJFydHswN/GMclL/7RQNFSzami3wWjjbrP9b2gtRvhhqC9Gcv+PF7CljtOvGxNs/zMV5Kfhd/EZsbA9mGP0m7fhTzpGXH0qqyY59oYAOPl9fwd1aYfRK3J2miFRvUqCoIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dfab4375f94so2784729276.1;
        Wed, 05 Jun 2024 04:39:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717587584; x=1718192384;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ocNukeStRfqnDvkiMwT8a2HHUpIF8MI3vRxZB4NsmU=;
        b=P0Z1vz1QTBT04rzwPx0fdH4RBj9TTOm6P1hwQnCJkEMOG3tNduCCGt39YxZn8NymYV
         2npZJwy0P7gYd8jXmSoyYlcItU5Yu5mk2Kj3zJXQxKP6Vq+BD9yvHKPkjshct3OY7jVm
         dH5S/37GaZF2FUoTz7yXQ4SVYO9kdIav1Wg5NbpLI1KEqn6sU7RQEkxf1hvhhPWpGt9U
         q/7i/cqVPWeG4Hxj4Jjo5CO3nujPUDmOUXM9Uz4GS+2ckyMfyo0xylEsg0lkU9BaN1+2
         ayhOt3ulJi3F3DGanx18JhWjKYORtLrmCdRZV4JtEU6bFkeFnRQ1bP/p9rQykr9uyRkq
         /6DQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUz6HxUsNGtJfw1Op4SQX1GfrPhxj5HGwslGEqktzpsM+xYSjwLj1baNq9OxoS7ODyf9feO+HSLKkSNsUB20abhchRcY2gzQik1l/jsh+dGRqXAh9i5bkvguzOqUDx/NCkwVGAj6S5TTrDOYLpWWkiuucyRGguJF2/4h5nSctCOlZQLqE6sOAMU0nT8r3MzC6d/BfAhAvaHhwmsYtc9ab5/l+Htod4DQ==
X-Gm-Message-State: AOJu0Yz95J2FqT/IOC7xZNVW+r7hFugXx9xT1yxHhJtjujFRLAhDGWup
	9sOH12okiI/2uo+6SJgEHABZ49nox/zESMZ1m5VCqm6aNqTWEmCOmroG5P1X
X-Google-Smtp-Source: AGHT+IGFrLKORaAAq1V7LItSndmuiFm6cniIOCIrdjJl8cUIV1cGKe0DV2O2/ZZ8CzL0POaUbDfGSQ==
X-Received: by 2002:a25:68cf:0:b0:dcc:bea8:8335 with SMTP id 3f1490d57ef6-dfacad2a782mr2041171276.62.1717587583715;
        Wed, 05 Jun 2024 04:39:43 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-dfa884bb84bsm2104059276.10.2024.06.05.04.39.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jun 2024 04:39:43 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-df7722171bcso6676817276.3;
        Wed, 05 Jun 2024 04:39:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWuYQq55tapaIlIjMcHrnV180b2RNh1e0CDaoJowwQuwPCn2RlpiPuasNNJRsfSrP+Qcp2MHiJf7Ynzep3ehap89brJRLWvrCLp4IGyquevjtvcPIWr/VzZJsf5AKBanVCgGqB0iR0vulfDgwLN6laA6X3JcJ78I1QVXsJ0dow/tWWC79+pHvUBhBdCQBY5ubBGDEgd1DMaoSqZGw8CjL6ucbzHLyHWRQ==
X-Received: by 2002:a25:c7c1:0:b0:dfa:5a2a:b75f with SMTP id
 3f1490d57ef6-dfacab32061mr2387013276.10.1717587582865; Wed, 05 Jun 2024
 04:39:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240530173857.164073-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240530173857.164073-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240530173857.164073-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Jun 2024 13:39:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX2F=PzmPhPyGFs_kZZBuTYjBQ-n88pEqo3aQh4=-oHiA@mail.gmail.com>
Message-ID: <CAMuHMdX2F=PzmPhPyGFs_kZZBuTYjBQ-n88pEqo3aQh4=-oHiA@mail.gmail.com>
Subject: Re: [PATCH v3 02/15] pinctrl: renesas: pinctrl-rzg2l: Rename B0WI to BOWI
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
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

On Thu, May 30, 2024 at 7:41=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Fix the typo B0WI -> BOWI to match with the RZ/G2L HW manual.
>
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3
> - New patch

Thanks for your patch!

I had a deeper look, as the name "B0WI" (with zero) is also present
in drivers/pinctrl/renesas/pinctrl-rza2.c, and because Section 41.4.2
("Operation for Peripheral Function") in the RZ/G2L Group Hardware
User's Manual does talk about the "B0WI" (with zero) bit.

Apparently Rev. 0.51 of the RZ/A2M Group Hardware User's Manual used
both variants. Later (Rev. 1.00) revisions replaced the O-based
variant by the zero-based variant. So it looks like "B0WI" (with
zero) is correct, and the RZ/G2L, RZ/V2L, RZ/G2UL, and RZ/Five HW
manuals should be fixed instead. The RZ/G3S manual already uses
the correct naming.

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

