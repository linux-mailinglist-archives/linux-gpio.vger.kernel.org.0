Return-Path: <linux-gpio+bounces-28473-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D5BC5C353
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 10:19:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3B312341D97
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 09:12:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40AE73016F5;
	Fri, 14 Nov 2025 09:12:16 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05812E719E
	for <linux-gpio@vger.kernel.org>; Fri, 14 Nov 2025 09:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763111536; cv=none; b=KOWAJ04Qcxia2qFQWMx5atWS8xk+s5rnHki5/gG2SlsDENLGqZJitld1SY8hA6NyCmD1BSJsb5WAm5tD9bSwwRwDPnCtsRR7p9t9dshGsiNUAi1pkAp1EzylREG10vLVvWpWcW5LmHRxgTMFBO5ofxBeQwPGqbpAwiTqTngN+b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763111536; c=relaxed/simple;
	bh=6lZcA5s325b3JaYAV6k1Lpy8uNvHDPn6vlQjTmP5MHM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OqWy9/inlJIxALT074HytKHFMSG+Jx0mDuyRqWVB3apzItMdvDCD2DMXMaBGaJQthHp/yQBoPS3wnijH4EpZyE5PZe/dw2CQr9fXQpTpa0FUv0TDqt+Hkf9ahak6vDLhuBG5GGkm6Fb4amtgQrQFnm7hufmotgXoCuSFQEfln7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-93723104137so521270241.3
        for <linux-gpio@vger.kernel.org>; Fri, 14 Nov 2025 01:12:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763111533; x=1763716333;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gv3Uev07oiPCCagTwkGrE74OxJVh/RcOn9HWVQLzIzM=;
        b=wLUNchkp9y38z4LNRflj3ZZOmQecGkDdvJ9r1FnW9pl2qYElUzIaAf6K4MTT1IIEqZ
         y76+Bd3D8m9XTZCWZ/oG9deoof9/WMkr80S+nkIeK3sFDWhTj8ntCIbkhbXBk3PFg72l
         LiYFpiy6y03KdPQuJ9rtwxB5WsKHu3UTItfk2c5FlU8EXKbG/VSlNuAjPAK6iJK11fXg
         KGW2H22whEYhhvl80sss30rET27nBA0oDESnz2slQmDAWSIw+vDh6a3kOjwRGyXbDO54
         gZhVob6ZTnbEuvxBoFMviTNRYKX0AJP7lHNu3fcvCzd9Xg47by69S7/OE7BYs82Kk+it
         YFRg==
X-Forwarded-Encrypted: i=1; AJvYcCXmJj57rgcEAX8jZqJNaFbDzqaJ/MhMASQQDZJRA0fkITOUeI7kOJYgSVZLy0w5SCuP18ly7/g/j5my@vger.kernel.org
X-Gm-Message-State: AOJu0Yyliy40yDUNq3awBQMjy0xni1/XJUnoqwkudR5A4gh1Es+/Zyv4
	AOX0pQrA+sa0ibUQ2fTW9O+dsC5oG2dRxHSOxOoIzbGhjY32CVwgSJeA41yNK+S5
X-Gm-Gg: ASbGncu6mGkig7+5Jt6w3YgBtumyRYng/PGnV3kWAq4l+9CCMsNhC8EEmrljKTn+ToU
	qvjD3BfBTn5uCaDLiH4inSDcy2t7sS/oc02wTyLqvYhb3jNns+aylMjfIP5zQlXayvkNvD57SiR
	OPlm4WD5U9cFwM7th1e1YyR3g8QRlcU08VVhg6UNfGBM0z4o8t5/15fscKVy0chIPnTUYABa+Zq
	ftXLNzPNn1wvJW2Oks6ku8c9zBOMzkUvLuN3GRUrBrCKFK1EHPJTD6dnm1yvJ7O0UHjDjLIeiyH
	46p/UvXgv06S4zOOHC6KIpon+kiMC09RkV6PoOrOccCC3DNVlYNPyR5dm30Qw/wLdZABRjYUOxN
	MkYNlP8ABCD0+T3Sk5KjzjwyLQDmBF0Y324OgDA9shTWl21hPZw5mqi2KZw6d80t6NjFj8DZiBy
	rHujOTXJpXPe6Qq0ZuwUyz0QrWAD0Pa7SQRnOpc26X2tJil6p9S+J0
X-Google-Smtp-Source: AGHT+IHCTXqD29hPjasnW0tgitAhP4kMpWxBwfkJtW0+4RMnp7dOePdPJd5CWRGjDjGgZTEoErhxRw==
X-Received: by 2002:a05:6102:b0b:b0:5df:c34a:5a00 with SMTP id ada2fe7eead31-5dfc554b51bmr974486137.11.1763111532984;
        Fri, 14 Nov 2025 01:12:12 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-93761119965sm1315191241.6.2025.11.14.01.12.12
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 01:12:12 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5dbddd71c46so650113137.2
        for <linux-gpio@vger.kernel.org>; Fri, 14 Nov 2025 01:12:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV9mAJVsEdR6q61OAsT5tJKaYdK7p6DwMdyuIk6hyxSLt4qYRYWQc1oiU12iWjJaHMYnZ5OW+/rlqbA@vger.kernel.org
X-Received: by 2002:a05:6102:2b8c:b0:5db:27b9:c20b with SMTP id
 ada2fe7eead31-5dfc5b6dee9mr1034309137.34.1763111532050; Fri, 14 Nov 2025
 01:12:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251027123601.77216-1-herve.codina@bootlin.com> <20251027123601.77216-7-herve.codina@bootlin.com>
In-Reply-To: <20251027123601.77216-7-herve.codina@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Nov 2025 10:12:00 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXOC1mRU161697uzeyQhGGoSUJ78RwUQx0sux0b32e8tw@mail.gmail.com>
X-Gm-Features: AWmQ_bnE7cyD8HOjUEBb9GnZU2_7AmUXi8_jlBj6QbgjeCbjQVJHA15hzW0yJVo
Message-ID: <CAMuHMdXOC1mRU161697uzeyQhGGoSUJ78RwUQx0sux0b32e8tw@mail.gmail.com>
Subject: Re: [PATCH v6 6/8] dt-bindings: soc: renesas: Add the Renesas RZ/N1
 GPIO Interrupt Multiplexer
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Saravana Kannan <saravanak@google.com>, 
	Serge Semin <fancer.lancer@gmail.com>, Phil Edworthy <phil.edworthy@renesas.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Pascal Eberhard <pascal.eberhard@se.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Oct 2025 at 13:36, Herve Codina (Schneider Electric)
<herve.codina@bootlin.com> wrote:
> On the Renesas RZ/N1 SoC, GPIOs can generate interruptions. Those
> interruption lines are multiplexed by the GPIO Interrupt Multiplexer in
> order to map 32 * 3 GPIO interrupt lines to 8 GIC interrupt lines.
>
> The GPIO interrupt multiplexer IP does nothing but select 8 GPIO
> IRQ lines out of the 96 available to wire them to the GIC input lines.
>
> Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

