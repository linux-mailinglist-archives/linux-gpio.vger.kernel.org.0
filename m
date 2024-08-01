Return-Path: <linux-gpio+bounces-8524-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB15944F04
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2024 17:21:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8BDB11C21F21
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2024 15:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 016D81A4F2C;
	Thu,  1 Aug 2024 15:21:34 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B0F13B7B3;
	Thu,  1 Aug 2024 15:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722525693; cv=none; b=eIM6aTemkgPsYs/uAXC6CqtwSEom0lHSZ1VR8o3k2dyXvc8uaparfH6YUZxNyC1V+WtHhXPbVXUOcGE8BbD0GCeyNKVTW0BB/wZ7Zuw2JsAOeVQpnhX5SZZaueAhAyTt6ho+Y/+w5JwociqnT0xmZCa743l1aB/h9n4W+x5N2Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722525693; c=relaxed/simple;
	bh=tQ8+AzUBcM0AwjI6oj62U4wnpDCToEASjdQt71nCQ/Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X35Xus0QJjG3gs6qaT2WUdYOC2108WtNh5wwzUeLtpWQShkYVTfqeKVMv23+BOYG3sKDmo/bI30v/jTC/3jnRMUnZa5BbEBZGOVvu9pz4oJBZylq8Ws64lxXjop1hxpLi0KybKz9COrjcNcRnvErl+1+z47G3FWaiC2Vc2AmkCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e0875f1e9edso5321797276.1;
        Thu, 01 Aug 2024 08:21:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722525689; x=1723130489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OdXnupxniBHctTimlSN25YFj+anspPAiyBuoWR/U+8s=;
        b=HmarQzEfm6Vn1SL2hzrcy0nHGYxF4pRTss6RAsU8oxsHiHTlq9C4FG0X3NrL1A4Uoq
         NCo7VKN20teMfEa+J2E6Q1rp5gk6/G71yoyU+GMWCV76vQkfk6xOB8JfnvcHd91U87h9
         jYK4mHtJmgv941S1R9MLpC2TXPTYWywyu8p/lx2ajWYTIIl9+HWLDIRpkg0XBBGJ4wGq
         262FU24U0VzFEDmg96T2A9Osy+Nx4qS0yvt2h+uNTnQISze2VvMNJyk9CO8HCxG85iau
         IhEl4/m6PwxKO2nA4fPr2j4MFLI22JyLVFtv+3QHnLhm/3hDUhUP3eH2iC6pklP1YEQ0
         9+PA==
X-Forwarded-Encrypted: i=1; AJvYcCXWBvN7Bp1DS2+ZiT2/uapaZxfv++frYRPJ85gHzlMIcbDflxifDZv4l4mUbdfELUMhATaJ12tT6F7/uJjl+H1q1rbc2AF6ZeJDV5tEg/T5MubCF4Tgjqouh+dmmNVy2lTuK+AA89s1LCpkdkZb
X-Gm-Message-State: AOJu0YyU8mOVUgJitXcOCg6YyHKEjU7V/xmEKYMSv2fy16Xoy9jNM6SI
	n/C/HdF55mMHsrNsssYu9KC6fAtMBQ/Afi9emkzNhbwq5oKxxdlhwABRoq4h
X-Google-Smtp-Source: AGHT+IHXIUS7qOJ8qQSNpvfSA6ZPLkhe1/qBzFYl2aEhZs2+s6Vk5GlG0zM5QQDnkj4gbwuzz4lDaw==
X-Received: by 2002:a05:6902:1021:b0:e0b:28ce:6153 with SMTP id 3f1490d57ef6-e0bde290ae5mr490045276.12.1722525689276;
        Thu, 01 Aug 2024 08:21:29 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e0b29f54b11sm3227436276.21.2024.08.01.08.21.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Aug 2024 08:21:28 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e0871f82ff8so5664075276.3;
        Thu, 01 Aug 2024 08:21:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXJ3RTkW2c2Yw5OeDA1SEBjJ3rVXR/gUtZssTYbqUEdXXjRnyrnyQ3+VYl/xGo9RLo/RCSl8LUbH7I1z+Zp3sWqMpogIdh063sRY/Uf1a9RFk+CsnEfgGCYXwRcDOWMpVZVz7twr/t7UR/W4QTB
X-Received: by 2002:a05:6902:c01:b0:e0b:cc76:5a09 with SMTP id
 3f1490d57ef6-e0bde4e089bmr559784276.48.1722525688498; Thu, 01 Aug 2024
 08:21:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240728090421.7136-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240728090421.7136-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 1 Aug 2024 17:21:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdURy_4BdkZpj4z+umwE6QTrFHVLydRJx0hnu-_YUuwO=A@mail.gmail.com>
Message-ID: <CAMuHMdURy_4BdkZpj4z+umwE6QTrFHVLydRJx0hnu-_YUuwO=A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: rzg2l: Use dev_err_probe()
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 28, 2024 at 11:04=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.c=
om> wrote:
> Replace dev_err()->dev_err_probe() to simpilfy probe
> helper functions.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v6.12.

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

