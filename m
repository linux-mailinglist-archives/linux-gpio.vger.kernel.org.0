Return-Path: <linux-gpio+bounces-11561-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DFC9A2741
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 17:46:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9552F2839FB
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 15:46:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D6E21DED69;
	Thu, 17 Oct 2024 15:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GJaNefFk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C681D47AC;
	Thu, 17 Oct 2024 15:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729180006; cv=none; b=t5tJghe5HfDEdQ5hiNbeDRm9ruN/+EPWO4zSUpY1G0PCkqCgBvOe+Hp0Ai97SmuegAfgOwS2PpCRY/ANQPBbB43Jb+rkg7kyaSAuW8uuQErD1CC63xoIfW9pPHhARiQ8XnSEyaiRby23oHCp+nZj6FWAbpx+uue4oUqxWZnyPyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729180006; c=relaxed/simple;
	bh=7fhD8DzgvnJTrPvWlqp3DLz4OkJ38n/tk8J6qYHYMwE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nLDa8cD22YUeOeRJ6bcWhBUQs7imzCTidt2lkrQw96ON4KeQ7XnelOGeXagAp9B8Blznj9j2yZxP5gJJ2aEVB/YS4MMSQfNmq0aS6dHCnf8/8OxK1nFn1AMNEYH7pzw2avD6owUYjze4SMc6OTLUSzIPLyAMdVVNpsDvxRGYPI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GJaNefFk; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3e4d5aef2f8so661509b6e.2;
        Thu, 17 Oct 2024 08:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729180000; x=1729784800; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qj2AtS8k+WthMhbYww8bY5MaLJ1p3Xf9L/rDjhzJSRA=;
        b=GJaNefFkNrVuHw6tLkPBoWEiICaQbXIkaptz6HFozP1YpIISDa/+iqVEaIbKam0uC2
         pcTv0PtkGSBuVtZ/C+tPL9QzxTcoHOyfFCDw2b0DaxUk8fZL3Jn3ZJfGpo1T2cijSJSH
         YfaMKooog3lil033qWVJbgianeJDmPolMtiC6E7ql0N3wwpbI4kuBDtk64G6bVq8Z45H
         eFBlemZU9qOXAJUWRvTyI3VClOukHooeMgNaqUaECbEVh367Ml21SLs/QBbPHMTtvuWJ
         6GkhBvS9byn3hhA9oYTTF1UeM2/N5CHzLm6BjKXESKCE1n7aKu+yDFGGf/cwDzhPVPyR
         DtEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729180000; x=1729784800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qj2AtS8k+WthMhbYww8bY5MaLJ1p3Xf9L/rDjhzJSRA=;
        b=dJ7erntUE3zKKmOr8pd37mjScn5/Cd+utNcAwBuddzdndUaMh+RvXU9cifIHJMgmDn
         31cceQuiTfobBU2Yl+XMp9IrnPBWZxEAxQOgBI+MfG+w/55uD1yIV7oOKfMG+BjwYrmE
         x57CNFeigpi3vATmx3hTMbxsght+tKYy8DUgXzY0yh1+9yoQlPaG2yGkG+IvA4h9tumy
         jWQralvs3KIZ400lCH4P9G7nHGK/DCcGnwB2wyRDGu2PamiZyffZNYOAKm1A/UdHY6Ec
         lqfngYOpGSFkFQnnKgKKqnSFSXHOhVs0MHb2Ffq9zWQZ8KgCvWvZnh+BGh6SVYBTZGZA
         f0wg==
X-Forwarded-Encrypted: i=1; AJvYcCU67PuWhYakOom+LgyvJUBipSFl/Yusi4/qWvC8rYU7+pG2FjPO3Y7y43bg1SYvGW1MFpd4DJ8KATbe@vger.kernel.org, AJvYcCUjH87UvSyjqCqd1CN4rjdwuqzdhuyW9a270xd76EGpP1cMQPMJOGTAahsqlFffskMQfxoTm1niE+1lX2gd@vger.kernel.org, AJvYcCWloTpxVxv8iaK8WkBO/6H+tttzpPsyV7MPyolt5ccA/yCwrwetwVQF9ujqxNyIM8RLBseb3QtWQWsXcw==@vger.kernel.org, AJvYcCXyiG9LCF3xL2XZ4f9s43UCUSSj4f11TuDftXCHY4Iyok3AqM/6E47OIA48uCFk1zzVh3ZocUtujBZ8SsmlVa1VTPI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx61KhzcZKL7ci/tF1zjeuavKuOZtf7n+gd2jP4YJtamRpS/EVL
	001T1y8xuROOaR2Rg/lKHrDxvtDMQyPSWosu5o2M28VqU4DAWtrF60ay6TEs0QVYHXH9LhbW+wG
	JqdYD8GB+k5PHXWMEOfExdtY9OY4=
X-Google-Smtp-Source: AGHT+IFfr3e2SW1rBIG74HlsEssXu0mG7pq8YCvKR7sxGUkhvAUnuoVxItiL1E3PEzrLF5mWB2fOR/bqV48xqwQ90WY=
X-Received: by 2002:a05:6808:2f0f:b0:3e5:fd5e:6506 with SMTP id
 5614622812f47-3e5fd5e6667mr1738371b6e.0.1729180000072; Thu, 17 Oct 2024
 08:46:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241017113942.139712-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241017113942.139712-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdUBWTOzB4p-YAo_HDA4wmebUcQ7tvLFvgMXR+U9M5Zf-A@mail.gmail.com>
In-Reply-To: <CAMuHMdUBWTOzB4p-YAo_HDA4wmebUcQ7tvLFvgMXR+U9M5Zf-A@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 17 Oct 2024 16:46:13 +0100
Message-ID: <CA+V-a8ugYOP=-DrGvy0Nk4V=Urqx40kog_q5JO7+yYGOc5m5cw@mail.gmail.com>
Subject: Re: [PATCH 2/7] pinctrl: renesas: rzg2l: Use gpiochip_populate_parent_fwspec_twocell
 helper
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Thu, Oct 17, 2024 at 2:04=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> On Thu, Oct 17, 2024 at 1:39=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail=
.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> "Because rzg2l_gpio_populate_parent_fwspec() and
>  gpiochip_populate_parent_fwspec_twocell() are identical."
>
Ouch, thanks for taking care of it.

Cheers,
Prabhakar

> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-pinctrl for v6.13.
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

