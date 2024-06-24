Return-Path: <linux-gpio+bounces-7650-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98694914F44
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2024 15:55:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 192C31F23015
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2024 13:55:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF7061422D2;
	Mon, 24 Jun 2024 13:55:22 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEB113A894;
	Mon, 24 Jun 2024 13:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719237322; cv=none; b=CEavXy0Pw4sUbIoWMWlUEp3ZTo9UmtSV8p67ITmvkAIocDxawyur7dV8YMg4RND57zr01uux8JDVeUhi3eyGaJTrCgH83YKMwMoPsFy6pdNA2dLM1Cny6DcH8BrO9k9dULY6tTo2WFn0w5DyCW3wuKpDRKCIDpE+3JJorHgKwJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719237322; c=relaxed/simple;
	bh=BZFUuflI2rt5qDzRo1hJ9iNczov2fZ28ct7WuAUVQZU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dNaMpIKRuJzEsnRz7yRWX3kKt4m+8zpI6EOi2vZb5vl4EntWjQhnmTRRaevV6UOoh6r5eHOAoLU4GBSehlW316TKKdSOhQ6n6Y7OhW0zMy2J2YKDa+L/jvwJ6iSQ1+yhZr9LAbaB2wpbjfTMEw7ozOKNUbuv1YW0vPF7k2O3F2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-63036fa87dbso34394657b3.1;
        Mon, 24 Jun 2024 06:55:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719237319; x=1719842119;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=86JZrQvm++3Ut9SWrAYYU+OyHNvZFlbwr3DIXcudg9E=;
        b=KDiFa/0G26eJTMFX124afEwx6x2LbdzzpqW4vJvVgT+TZgJ5x73ACPOsIdwsRjFL5l
         Y6h2E5TVlmfiC/Bz3+Ls4upLrS3T4SznBdTv8whJbunNPjXvuzkhWy9I6aS4xsXAGJ2i
         85u3XSjDAg1rynjg8rCKOxAe77d+I1J3uENxU0a27fgh0gby+2nnk7oXfX7FkXeLuH8g
         2dv/l2AREhsZs3VUa7bZlNg3CI37sZKSLeIQ/qulPdz0chIg0Qac16LJPKslVHDHUCn2
         TpHalJeMBubUs/1ig5M9CK3kvxi+xDMDZyEXhqO80Ya5flpNiLZW8AEu6JkagltWD7xp
         MIdA==
X-Forwarded-Encrypted: i=1; AJvYcCVzCnJ6wNV0bngXbsqESSi5Ahxsu8jmyWstRQxyos4K/TTIktR786TBkUnIIQjMpa3oBtzgaOWB63Qf1LbR9ktL86O0+8px37UdArI2km5XZKKO58det0ybyJGzFm6Xkl8ToKj2ec97BVMKX4sYb/uBbu5nlYPItoLaX+POxU8ukGhJ5iCjtnB42CYf7J+VkxmcD/sK4rrpy+7JryseS7EvMLlhl+B12A==
X-Gm-Message-State: AOJu0YylOMuExREgIJ4BBPZxTPDanuSQZWVEtcIBUvwuEYV/PZJa2Eo0
	z+RMVYsVCjxKOEItT6kIj+8DPu6gjlCBjlhveqZ/g6FzOk4UIQe5vf2L12ex
X-Google-Smtp-Source: AGHT+IHZTjk2LJYgW/me3bBQBc74ptlMmaYYFi/pk94B8+07T3oyZmjgYSQf1dQzbA9uF/7BRBSAFA==
X-Received: by 2002:a81:d809:0:b0:61b:153:8d98 with SMTP id 00721157ae682-6424c9eea51mr34621717b3.21.1719237319360;
        Mon, 24 Jun 2024 06:55:19 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-63f12699541sm27799567b3.66.2024.06.24.06.55.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 06:55:18 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-63bce128c70so31207627b3.0;
        Mon, 24 Jun 2024 06:55:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWr6D8PWeQu59XCJqHFykQ3SrKiCZNpH/pMzwQdxQkFVV98Q6SPCADELX/ImpG4x3lqQiQqLBInqZsXQU08t2tg9mlQq9bvIBUk9BS+lcmowQeKVqowkN0nrTi8+F6kY3HgNu9qdsabPwvWx8CL85sTnbStQhM8s4ChrkS3/lVjVEnDa5kEGdER4lmrINDzm6xtJVpskDtSvz+daZy0qIE4USZtneZG/Q==
X-Received: by 2002:a81:8d4d:0:b0:631:399f:2e87 with SMTP id
 00721157ae682-6424bf5370emr31660657b3.16.1719237318457; Mon, 24 Jun 2024
 06:55:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1716974502.git.geert+renesas@glider.be>
In-Reply-To: <cover.1716974502.git.geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Jun 2024 15:55:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWQo6y+6Be1cu=3qRuQ5BDB6_8is0C6T0eVgvHkN+8fJA@mail.gmail.com>
Message-ID: <CAMuHMdWQo6y+6Be1cu=3qRuQ5BDB6_8is0C6T0eVgvHkN+8fJA@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] Add R-Car fuse support
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 29, 2024 at 11:29=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> R-Car Gen3/Gen4 SoCs contain fuses indicating hardware support or
> hardware parameters.  Unfortunately the various SoCs require different
> mechanisms to read the state of the fuses:
>   - On R-Car Gen3, the fuse monitor registers are in the middle of the
>     Pin Function Controller (PFC) register block,
>   - On R-Car V3U and S4-8, the E-FUSE non-volatile memory is accessible
>     through a separate register block in the PFC,
>   - On R-Car V4H and V4M, the E-FUSE non-volatile memory is accessible
>     through the second register block of OTP_MEM.
>
> This patch series adds support for all 3 variants.  It provides an
> in-kernel API to read the fuses' states, as well as userspace access
> through the nvmem subsystem and sysfs:
>   - R-Car Gen3:    /sys/bus/platform/devices/rcar_fuse/fuse/nvmem
>   - R-Car V3U/S4:  /sys/bus/platform/devices/e6078800.fuse/fuse/nvmem
>   - R-Car V4H/V4M: /sys/bus/platform/devices/e61be000.otp/fuse/nvmem
>
> This has been tested on R-Car H3 ES2.0, M3-W and M3-W+, M3-N, V3M, V3H
> and V3H2, D3, E3, V3U, S4-8 ES1.0 and ES1.2, V4H, and V4M.
>
> For SoCs where E-FUSE is accessed through the PFC, it is not clear from
> the documentation if any PFC module clock needs to be enabled for fuse
> access.  According to experiments on R-Car S4-8, the module clock and
> reset only impact the GPIO functionality of the PFC, not the pinmux or
> fuse monitor functionalities.  So perhaps the clock/power-domains/resets
> properties should be dropped from the DT bindings and DTS, as well as
> the Runtime PM handling from the driver?
>
> Changes compared to v1[1]:
>   - Drop RFC state and broaden audience,
>   - Fix typo in one-line summary,
>   - Add Reviewed-by.
>
> Thanks for your comments!
>
> [1] https://lore.kernel.org/r/cover.1714642390.git.geert+renesas@glider.b=
e
>
> Geert Uytterhoeven (8):
>   dt-bindings: fuse: Document R-Car E-FUSE / PFC
>   dt-bindings: fuse: Document R-Car E-FUSE / OTP_MEM
>   soc: renesas: Add R-Car fuse driver
>   pinctrl: renesas: Add R-Car Gen3 fuse support
>   arm64: dts: renesas: r8a779a0: Add E-FUSE node
>   arm64: dts: renesas: r8a779f0: Add E-FUSE node
>   arm64: dts: renesas: r8a779g0: Add OTP_MEM node
>   arm64: dts: renesas: r8a779h0: Add OTP_MEM node

I plan to queue these in renesas-devel/pinctrl for v6.11.

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

