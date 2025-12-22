Return-Path: <linux-gpio+bounces-29795-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CB601CD6C52
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Dec 2025 18:11:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A6189300EE7B
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Dec 2025 17:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C59734D4CC;
	Mon, 22 Dec 2025 17:09:14 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F6934D4C6
	for <linux-gpio@vger.kernel.org>; Mon, 22 Dec 2025 17:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766423354; cv=none; b=RhXFuJkUHB+sk0wbBLEXfQ04bsrb14MMFi+QSNc8oEFsbfXHnrcQpSqbQdYQu/sbdEDGH1i+eZgSCw81PnvuC0ojD73xDnoJgReDA5fg4gDZ3ZMl1nsPk1Eqppl3rW4ZUx6Xr3JkTNkw4fKFbE0RGJerGxWa0qJDpYUje0uY5rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766423354; c=relaxed/simple;
	bh=ARCeP+FjHLyRQ/TFOxypXSIG5GzrN1OmBElkgW/ggfU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uBYXuGEwgN/woFYLWRmaBkzTa3J85pilENiVMZ6+sEV9mDtpW8QT43ghziHKGg2Xt/Ckx6LMHQfAkk2V2Zx6zxLepLysZ3XRqsG0+k9S8xVgHnQ8Ey09WyeYPvcfF62hum3xM5yKRR6toav8W1nlRSmCn7F3s9bVt3OzbbhQYfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-88059c28da1so39320606d6.2
        for <linux-gpio@vger.kernel.org>; Mon, 22 Dec 2025 09:09:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766423350; x=1767028150;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sE9KE2Jyhtg/iXF/CUsw7RlDbWGUrFQq1WT3oqM9mXY=;
        b=mZD2hKRAkMXeS0AEv0zhbEL4DnAsHl3WwYFtfwoGXkpASLt/AT3MUnolsVeQkWQahT
         gsfidCyBiwlSDzmJkKC8lofkBeRzoADcf29Mxk5O4/DOTm9kH9QBOuQsHm5+jDAWSz22
         AfXSAFA9ShEeYuZKwqIm1Cz/nQUasREZ1TB3jd6cqjlt9V4xNt84aqrE0rI+54OJ1Al5
         jIbWBHOs59mvDU1nd3bg8BPg0H9Hc6X+i+u5QuBZH+bpU7vAwE8bkmJAFqHuoIQxZVK6
         uj69X/Rp6PObXKTuiWBqYznNFaCxbX954z3B4tvu1+2Gpr+tSaF3hQD8tLG7ZHMGUuqh
         T8nQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYoj2y80JiYEwcfKA5UaDC5sOoHfkQ4nTSDHxlrAUSJ1ZwtYSfbaHXNZGl+1NXtg4ruXzr8hLhqXak@vger.kernel.org
X-Gm-Message-State: AOJu0YxgC5mzowdO56G5IPuCS4af9cmsnynHrFDuq5YbDLP5cNOLD7LM
	V8RYcOfpdVJqxoZ6idjY72h7K/usGMI+lwWnQ0LMU1UUSNgULOF9R2JLl4pgWAla
X-Gm-Gg: AY/fxX65IeDkRL9G4Kc68UUmJd5R/ZR9pwgAia981ZxzNdJidIG0CU+7D4Areg8xvtr
	Is2n8kjhiuKs46vY5X3e8MFd5M9QKBsZSz7ear+xu30bjN4U/EZmypI+fe4aguLzdSJCAwEaE5u
	GOiCxLv7EVYZDBKsI7bhGuFlibM7zIvEswj/ekP2aSapxXQFM22ooOv6vJKzHgeE7sPccbCuInS
	jkqeHE3UI2vKjUc9RTP+p/ANeSpWkr4WH9WOSEVmsPchZMy6fet5PxNHUCrIKtZ5aNSPPtRMPKC
	W5faf1E4wrYnkQ/23DP8OJ/N8+JyKAjWbyxOA/6HGt74AyTbuZGfo477uAiw6NtHpMt+GcrRFjV
	YC6cgVvV01sBhvL5qGegNLdMj61TqUVK6V1TQnPs4uqCkME9cvdwCgOdDZw2FW9HeMjSlVSP5jb
	1yIDLGaZyOIVjglqHi6Xo27PKsR8Y5CFfEg7SoqALt0IBfxUn6dKUD
X-Google-Smtp-Source: AGHT+IH5Lwl1wcgcKP3PrBv7MesVcgI+d7mFYqfLYZgITLFjaM9NbKuC+GcJjNliKQ49z4CNyCHf2A==
X-Received: by 2002:a05:6102:6a93:b0:5de:31b1:2005 with SMTP id ada2fe7eead31-5eb1a85565emr3666900137.43.1766417749540;
        Mon, 22 Dec 2025 07:35:49 -0800 (PST)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5eb1aa8c125sm3524516137.6.2025.12.22.07.35.48
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 07:35:48 -0800 (PST)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-55b1dde0961so2982536e0c.2
        for <linux-gpio@vger.kernel.org>; Mon, 22 Dec 2025 07:35:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX2lhgvNrbn2jhxr8JW2AFNs3jrMPS3+fdwr9+dwaWdnonBULL8efx+DxZJc99kD0rSGkpbSqN4zcUM@vger.kernel.org
X-Received: by 2002:a05:6122:4f97:b0:557:c697:a30c with SMTP id
 71dfb90a1353d-5615be24746mr3595228e0c.15.1766417747921; Mon, 22 Dec 2025
 07:35:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251215142836.167101-1-herve.codina@bootlin.com> <aUZEHSNqiMuHrCWb@shikoro>
In-Reply-To: <aUZEHSNqiMuHrCWb@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Dec 2025 16:35:35 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXTZ2LDs-nFQRh+Q5YAW_LD+j6j=Mzv0RxyB-1wnJgbuQ@mail.gmail.com>
X-Gm-Features: AQt7F2qPotDDz05zRLM4l-WdqTP8Y-ChrCcklHPqoMfDZgCa2sIooFyMFfI1kSs
Message-ID: <CAMuHMdXTZ2LDs-nFQRh+Q5YAW_LD+j6j=Mzv0RxyB-1wnJgbuQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/8] gpio: renesas: Add support for GPIO and related
 interrupts in RZ/N1 SoC
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Rob Herring <robh@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>
Cc: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Saravana Kannan <saravanak@google.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram, Rob, Thomas,

On Sat, 20 Dec 2025 at 07:37, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > This series adds support for GPIO and GPIO IRQ mux available in the
> > RZ/N1 SoCs.
> >
> > The first patches in this series are related to a new helper introduced
> > to parse an interrupt-map property.
> >   - patch 1: Introduce the helper (for_each_of_imap_item)
> >   - patch 2: Add a unittest for the new helper
> >   - patch 3 and 4: convert existing drivers to use this new helper
> >
> > Patch 5 adds support for GPIO (device-tree description)
> >
> > The last patches (6, 7 and 8) of the series are related to GPIO
> > interrupts and GPIO IRQ multiplexer.
>
> I think this series is ready and I would really like to see it upstream
> soon. I wonder, however, if the path to upstream has already been
> discussed? It touches various subsystems, so I don't see immediately who
> should pick the whole series? Or if parts should go to different
> subsystems offering immutable branches? I bring this up because I want
> to avoid losing a cycle just because this is unclear...

We actually did[1]. Unfortunately that plan was never executed.
The DTS patches I can easily take through renesas-devel, as they have
no hard dependencies.
For the remaining patches, I see two options:
  A. Rob takes the first two patches, and provides an immutable branch.
     Then Thomas takes the irqchip patches, and I take the rest.
  B. Rob and Thomas provide acks, and I take the whole series.

Thanks!

[1] https://lore.kernel.org/20251114124045.16204839@bootlin.com

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

