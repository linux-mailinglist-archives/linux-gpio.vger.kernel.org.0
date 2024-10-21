Return-Path: <linux-gpio+bounces-11711-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2759A5DEA
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Oct 2024 10:03:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3F034B20FCA
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Oct 2024 08:03:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A6291E1A24;
	Mon, 21 Oct 2024 08:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dF3GVBCk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646641E1A10;
	Mon, 21 Oct 2024 08:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729497823; cv=none; b=mRGkZ0CdKq+wyVNsAz1Ke6xteaW9W/1U4oKBOHicMeAvTktZeF+ob+8F5+gLxzjwCSL2mRqnKSUoPv/45rW3SZlNQ59oTFFqgx65rVNfJYirEwnwfnigcBDYG9uw+EYBxQjR6usDYSEb/ddEy2i4lz1mDxbBm5YnNHKzsp9PNfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729497823; c=relaxed/simple;
	bh=KgAIXUs05191QaNtu9pGGKwFB2SqVezhtO6euGlPyFg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IP5f/FNsfu+8OcNiF67Mt8YtLT6S8Cu7BYILYIaIeU1s+amR+ufeKBwEJP12Nmrf0RdFoYYsXY12opULfPFSstFH1HFN4XIAVsjjoN+oLiwkYdH1sbSxHye81eqLHUCIuVHqOcw0iKSF4+Kv8OFjRJjn2J2vQjMEC0UArpiFzWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dF3GVBCk; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-50d564df009so984638e0c.0;
        Mon, 21 Oct 2024 01:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729497820; x=1730102620; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LmLiVjCm6BrpElJZFJzCFlvvrKj+ExXxnl83gGrmXew=;
        b=dF3GVBCkDGZ8LUQ76MvzmNgGJhNG7yXO29/ea1Nn7J1VwbsG1u2/hVqYEb7BWUY/d7
         JdkDhP0guNfi3VB8ArQUT7/pFQ0Q9y4azLmYT0lvGvV+0y5xTUL5KtFwHuHMmmnxQcYi
         Mienbc3o89EU2YD4jsULg7rzU6mtUjJ6vMpWmpiiRqOUJNxb2FYNBUU3sEFdfk77uSUk
         0MO2Uz2CcpYhqaeJEh11rmZnIH3NtZaBYwaN8kmHgLeJ5S+qL0VR4MRgPHuoIPMWHsi7
         UOFe5a4JzH5ZzTT3HEy5bJRmOMKVnmG7MKVrIbPcGQZFSRbKpYcn9k1mbNjVaGlc7WXw
         yxGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729497820; x=1730102620;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LmLiVjCm6BrpElJZFJzCFlvvrKj+ExXxnl83gGrmXew=;
        b=dOL2g8B5P1NwKGsdkWhueWbdDmfvBHbsZHNNxqXLUL2OtdC5HyCzaCuvkCvFP2yC8u
         uC6SCVYXegJ1eD8a6oxK060QO/6ocL35A/56Mbq3o9F/iGSES2fPOoJ656Lef8eXfKxL
         A/VQWNghpg7qamxkhXRXP6pL+CJ75iZ3qV+na1fJ4C0JwQURhISGJpng8QEs91hX7az6
         Pci9ulSQIdyuzGMN3zo+BbSHHxg0A59+kF7jsA5p9ZuAkFNqa9kY4zGEOcsV3vjAJ8nF
         KzwZmg415vu01Ms2S3BUhSuu7WfVEd+AJxMtuFimnRk9q1tSz6W+ZBNCvxfCG4Tidwtp
         Ea3w==
X-Forwarded-Encrypted: i=1; AJvYcCV0QSkSbUT1CVvDFQkIM6HRrIfIx+WyU0FqBmMYbkfmJQEiPKcDn8iD28Bt6prg3CzDqTug3R81FDV5@vger.kernel.org, AJvYcCVeYa2SL/TclbkTMk6J6XzG3TDX8//qdBsthMIeYVP2QZbNO5zaRjFj8fc2uliiI/To1EGHlI5CxkD9EjLR/g9dt20=@vger.kernel.org, AJvYcCXzaWkBm3sCMqyJt/L2GbLEzhVfpPwg9lKpuXcpIGlRuNrZT+yIuullv+6dtRwGjgL8YcuKXId8EwoLOnZe@vger.kernel.org, AJvYcCXzr5t0ubpQ3nBbdkYwazi10UdhkcrzJIzXMFH2kLY0Akfy56YtoypCodVyI0trhmcPwb4zPTYN+tJIHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCNmvMSGrNgF3GZyTEJb7Yfvz7AkCjxhmWB8iRLEu9o06WjOBo
	meeSibUzoB3UD2+qeCJK3GEWeb1lrfa3pGsPIqvTTPdH9LCPl0NyPKvIKnOnvoeaNIIvcyw9u3Q
	8beXQJOkQ1/XaaHIsQNi3DaOJL28=
X-Google-Smtp-Source: AGHT+IFaf5QXzgvX4q8OtkMMLm0vqchKeiRBZxbB4QCD32p4ybwwulaCZrAphTIjSIGjvpmbA+2UKBB8hP9/SD7rZF4=
X-Received: by 2002:a05:6122:2a4d:b0:50d:6756:5464 with SMTP id
 71dfb90a1353d-50dda2eb997mr7139854e0c.4.1729497820241; Mon, 21 Oct 2024
 01:03:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241017113942.139712-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241017113942.139712-7-prabhakar.mahadev-lad.rj@bp.renesas.com> <CACRpkdYAynE2k6LEYrmcvJcO1gJW+NH4wv-S7F_xa-SvsueDZQ@mail.gmail.com>
In-Reply-To: <CACRpkdYAynE2k6LEYrmcvJcO1gJW+NH4wv-S7F_xa-SvsueDZQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 21 Oct 2024 09:03:14 +0100
Message-ID: <CA+V-a8vq4K1R_uPW5yf5gX85pO=LNU6_GT4xSLSWZaVqAMewFw@mail.gmail.com>
Subject: Re: [PATCH 6/7] pinctrl: pinmux: Introduce API to check if a pin is requested
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Sat, Oct 19, 2024 at 7:22=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Thu, Oct 17, 2024 at 1:39=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail=
.com> wrote:
>
> > @@ -100,6 +101,10 @@ static inline void pinmux_disable_setting(const st=
ruct pinctrl_setting *setting)
> >  {
> >  }
> >
> > +bool pin_requested(struct pinctrl_dev *pctldev, int pin)
> > +{
> > +       return false;
> > +}
> >  #endif
>
> You need "static inline" in front of the stub, that's why the robot is
> complaining.
>
Agreed, If there are no other comments for the rest of the patches
I'll just send an updated patch for this or include it as part of the
whole series.

Cheers,
Prabhakar

