Return-Path: <linux-gpio+bounces-6563-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F3B8CC0B7
	for <lists+linux-gpio@lfdr.de>; Wed, 22 May 2024 13:53:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 672C21F216A6
	for <lists+linux-gpio@lfdr.de>; Wed, 22 May 2024 11:53:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B66E13D539;
	Wed, 22 May 2024 11:53:22 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D941757FD;
	Wed, 22 May 2024 11:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716378802; cv=none; b=Wr/BVbEFikonvjSrLUxlHzmvwp3fDYi/JAeoFZpaoGDmc6+RzkI8FPPPdGbdomInwM5wdDw3gqzVrSmH3ZGj0vxmeqb2HzPlYG17MsiRowRTAH/0NL9KfvYUZlYGRl7IAcNhGk+xz1oLvSkR8jLL4MxJFweEeE2TvSRGhV1ihMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716378802; c=relaxed/simple;
	bh=nHaKxWnZ7ZoVioz3cSGjqK/WJoTRjQS4uony9gE9rbU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fICwNtH4YfzZKBh17Gqb19MMZOf8Ij6km/9Bpm6szvtzaaJdy6r3Ryr/YP524fzUNybQCIHh/ffTREwKxz5m+fjd5wN2ow2kSUPWoWzqngBCZfldphvFSbEYb87y1U/0RK+9LwDXcb/AHCNZaGZ/auXTepIDEIwGpOnNafPYiO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-627788ce780so7722677b3.0;
        Wed, 22 May 2024 04:53:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716378798; x=1716983598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y+wJPAvX2rvsN9POIfJJaJwUowjV47uuTkOe0U9Ejy4=;
        b=hgRJUGry7SOTbNwryRU+B4vdRHY8FGA+LQXzaz/5sdvyNIR0qqruYorcodd+5Phov6
         9qemsfLd+0hDLaCwPbwFgqMOzoJeILedm8j7dCUs7DYwaRR9U9VhUQ4Ug3efgHJx6yso
         Y7yufAvCSVJfgX94wZm129KaFIoMu1Ebh+V7jLlGYP+FhFQk+ulFvP2uaNDwFYxXqlOw
         DyV/AzqQjFcXpnPxCDJDfBBrQ3wNJVyZXY5aX9Th+VWCyuaexrkygnkqyYN6OP5Dogf7
         sU0ao/x0kcFHGehPlgUHAoGa6H1Obn8ys4h4/HhDe3tLr+UdcakHV5BUJtKjBNk+yYZ3
         mb5g==
X-Forwarded-Encrypted: i=1; AJvYcCUQpofwDLBpNmGJe171tfbpR6x4YIqOm2yjkvWjnUZEH5tI61k5yAB0Hwj5rrUd2ka0odbRPBshZeg+nRh0cxoCDQrD0B9zxIlX3wuf9N0gE5LAArhycrnYSij6/DfnLdEeDEoPcx9eRGVBJrgKJn5xCkMpwgUZQuTp6BCzQg7crJZEqqIy7o9OMNVblEAwf7NN2tP0H/dOpJP1/ptb3Pwu1eF/6WRLlA==
X-Gm-Message-State: AOJu0Yw/r4p2X9emcXqwDtgKA9GzM0K+cwOAoF9BiI7J1e9HXqOg3OWs
	togA+K8IaVegx5ujX/oMo5B+7FAOhbqsNXNYZQeXql34uOO98QHmdIqFAuue
X-Google-Smtp-Source: AGHT+IE0RZMH1KfJO8H325240c4UyqBaNkwq90qYh92/9hVBO2k+ZuhA+0/TpOjVmoYNzwx3ohWFnw==
X-Received: by 2002:a81:ab4b:0:b0:618:8e3e:8675 with SMTP id 00721157ae682-627e46d4287mr18084767b3.22.1716378798541;
        Wed, 22 May 2024 04:53:18 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62784541f41sm22600387b3.143.2024.05.22.04.53.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 May 2024 04:53:17 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-627788ce780so7722367b3.0;
        Wed, 22 May 2024 04:53:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXIhnsbaPzsGbShUoJ7cNjDHvC9hzo87Uf5SVt4mNySJyHpxkyBpV9KoiNrvbTIl6x6YgmU9YFRDPARGXjFwyCn4tX9BVZT7Bzeqi696GTaNm1ndcoiTpH3Cm4B8V2EAkz0af90HFrvGCyqfoYP3Ngvt9nNIZ7f/tUaXWdtTWi+qtj64GLAzfIB6BS5DCiXyJXImy/YuyHyu7tsp/hpgeRV2VYDzggZ8Q==
X-Received: by 2002:a81:92cc:0:b0:617:d49f:d5b9 with SMTP id
 00721157ae682-627e46b248cmr18936437b3.14.1716378796782; Wed, 22 May 2024
 04:53:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240423175900.702640-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240423175900.702640-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240423175900.702640-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 May 2024 13:53:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXhkWgy1bJtfzFXWNUXHLJfMA-tXcMRYtR7GfaejoD+ig@mail.gmail.com>
Message-ID: <CAMuHMdXhkWgy1bJtfzFXWNUXHLJfMA-tXcMRYtR7GfaejoD+ig@mail.gmail.com>
Subject: Re: [PATCH v2 05/13] pinctrl: renesas: pinctrl-rzg2l: Validate power
 registers for SD and ETH
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2024 at 7:59=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> On RZ/V2H(P) SoC, the power registers for SD and ETH do not exist,
> resulting in invalid register offsets. Ensure that the register offsets
> are valid before any read/write operations are performed. If the power
> registers are not available, both SD and ETH will be set to '0'.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> RFC->v2
> - Update check to !=3D 0 instead of -EINVAL

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

