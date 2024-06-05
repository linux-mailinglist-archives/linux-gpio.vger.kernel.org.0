Return-Path: <linux-gpio+bounces-7176-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B50768FD1EE
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 17:43:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6700E1F26050
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 15:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B09F3143C76;
	Wed,  5 Jun 2024 15:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N+yKihqw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1221319D8B5;
	Wed,  5 Jun 2024 15:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717602211; cv=none; b=g6NLKwsSEh51TK1kFyso+cAUIz3npvQFaOnePDu9yFmlCBixLbds0R2ca+cQ+LTqk3X65+HpfYW01nDuLj3G3a6Yz0bPkM74uD824na0w6kPEKMuFaAeVmuic8bsOWmiMe6mxb1ynx6NsT5S0DxBXhHq03+zRS01kzlCsbCzPfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717602211; c=relaxed/simple;
	bh=L9Xf6PXsxrK28lKVkxl+Fbpc9v74XyBLrtMzS4Zf/eU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ncsYJu2nqFvhy0OlicjgbUAeHwtnaywMJa9n3cdAITtu22LPNYlCKRjsIH0a77c5EY4+xiO1SptEnOeWNX8ZC7fylZXHxOZ6uGaPsSWTzLiqGUBrk+isNHvVGzKijI5gUvhop4+uT9iDAu8uVxjK4ZhzPd5He5feSh2tGo73Duo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N+yKihqw; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-4eafded3c66so1253e0c.0;
        Wed, 05 Jun 2024 08:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717602209; x=1718207009; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L9Xf6PXsxrK28lKVkxl+Fbpc9v74XyBLrtMzS4Zf/eU=;
        b=N+yKihqw7vBYAZzJr76IeTZzyuPpA+ecvUsvlrDDDkP3rt1djEi9g1CXtf0kt516J8
         uGCcaPKwH5zw6OerukWDDcAKzPCy+yLe5ljeaOlHX4GP6ugckdn5e3MrQWyyH8V+4Z6/
         DH8d/M4BXmFqfkCupzFfahrQO18pHPQATKKrDLorXUVyvxJ5kluI6v22Q1W+auV+Tg8Z
         36TUkV/BnrXbbReDdHFZ6kVVYQIuL9YumYN3eGlTvvt4pkXWodT2IKNok3/q845eEchx
         KWWca1bG4cs63lEALWH4ScaYDHuPP/ZqBV12MBt6Jd47kKqJdT+RPuIYEzZYjXfuwGDI
         3Paw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717602209; x=1718207009;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L9Xf6PXsxrK28lKVkxl+Fbpc9v74XyBLrtMzS4Zf/eU=;
        b=ncJjUZZsZasNWL48A022ZcEtN7mObNC1/lFwKkn/fMyJ0SCge60KtwLye3oPSCdQM1
         KXuOPGfXYMH8L0ZX+iw/4QZe7cHSclMdsFcOWtsnpJhJynA0xpNPi73Z9haP9m9rXmpc
         iPPZICBRngbxTEfHGk2NCh9cbmm07qyFhA8O+LEVLzX7K69nvJ/mxRGWAMywwfMzS0d8
         4cpTB/AurP74GR+FO5HBM+uy05jADXnhebZw/ekMoAUPuLsD8EP+BTRkDpRP+HQwr+HI
         nKA2bPcCd7cdJwzc+vINxjEgmOg7A3eZCsAkD2Ayg5KSRbSn3uhhwNRsyri+Kc591b7M
         Mt4g==
X-Forwarded-Encrypted: i=1; AJvYcCWtr1NcJgRsXteFn1gR9U5dCmhFqtqojIYmfcMfH1sCm9eYdMyQ2/eE21qmOFRoUb4M8IfBCj+OEETXusIkSjuNgdowEOG5MmPjNp9Di2GteJbE26Ksd9j/+PfHqRWLsYSUywdrgHGQ/kuO8v0f8K0h+VUp7zJ8uY4wqIx10VxtWM47uZnaRcm4ISWQLDNJtikeWuE47GB86g6K2HjVjN1MyjQmvcexaw==
X-Gm-Message-State: AOJu0YzfABnnlo4A5QpcdCE3jMVTV4BJHUIqQBgdj7iGHWG+NDfvO0gd
	yzI97sXsPlz/HqdteJ0MK4ChwCpvA7MsvGB4N9h6tvrtOCTMPZUcgP9xbfuDmrhWYn/Dng1YU0R
	Hs+GnzjIYakP9RegtWa1Lu6+qfek=
X-Google-Smtp-Source: AGHT+IFbKVGpxnWyLukW0L51CPBZAE2I91fvGI5gnu4wKwcHZDQJqT47u6gvVpFdG9lysjKyfMMpNCv7OK8tnXQewdk=
X-Received: by 2002:a05:6122:2669:b0:4e4:ecf6:c7fa with SMTP id
 71dfb90a1353d-4eb3a51434fmr2555298e0c.15.1717602207449; Wed, 05 Jun 2024
 08:43:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240530173857.164073-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240530173857.164073-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdX2F=PzmPhPyGFs_kZZBuTYjBQ-n88pEqo3aQh4=-oHiA@mail.gmail.com>
In-Reply-To: <CAMuHMdX2F=PzmPhPyGFs_kZZBuTYjBQ-n88pEqo3aQh4=-oHiA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 5 Jun 2024 16:42:59 +0100
Message-ID: <CA+V-a8t5SO-iGJA5CT8ZY_C0z8yYoiRiCNBEiBHLWuA5dDem5g@mail.gmail.com>
Subject: Re: [PATCH v3 02/15] pinctrl: renesas: pinctrl-rzg2l: Rename B0WI to BOWI
To: Geert Uytterhoeven <geert@linux-m68k.org>
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

Hi Geert,

Thank you for the review.

On Wed, Jun 5, 2024 at 12:39=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Thu, May 30, 2024 at 7:41=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail=
.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Fix the typo B0WI -> BOWI to match with the RZ/G2L HW manual.
> >
> > Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v2->v3
> > - New patch
>
> Thanks for your patch!
>
> I had a deeper look, as the name "B0WI" (with zero) is also present
> in drivers/pinctrl/renesas/pinctrl-rza2.c, and because Section 41.4.2
> ("Operation for Peripheral Function") in the RZ/G2L Group Hardware
> User's Manual does talk about the "B0WI" (with zero) bit.
>
> Apparently Rev. 0.51 of the RZ/A2M Group Hardware User's Manual used
> both variants. Later (Rev. 1.00) revisions replaced the O-based
> variant by the zero-based variant. So it looks like "B0WI" (with
> zero) is correct, and the RZ/G2L, RZ/V2L, RZ/G2UL, and RZ/Five HW
> manuals should be fixed instead. The RZ/G3S manual already uses
> the correct naming.
>
Ok I'll drop this patch and create a request with the HW manual team
to correct it.

Cheers,
Prabhakar

