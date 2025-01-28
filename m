Return-Path: <linux-gpio+bounces-15081-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C10D4A20D73
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jan 2025 16:47:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA34C16802A
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jan 2025 15:47:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A975B1D47B4;
	Tue, 28 Jan 2025 15:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NxBpCUpb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9561AF9F8
	for <linux-gpio@vger.kernel.org>; Tue, 28 Jan 2025 15:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738079252; cv=none; b=Oji8tOf6RzK2/palLKh3w/fBfQk9IXEoKVNOmRm9X+Jjpf7u1EVmB77CARAxEr8LvYQr1qlvt1pX4a2euOyJe7ir1+5WpFbJZgkeG6DgxOLoHtoq9NmLiKfGnhhw6BRG2qyBVPaRWmYCcLBSXycqSgTqBq38peKcy9g1dY7hAUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738079252; c=relaxed/simple;
	bh=ORpfm8gqz7BJwSi63RXYjOXHuDS2RzlvCyhJKnf9cco=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=smk1ptIrKCr98/lzQrVe3sqf/E+mYVCP/3bbf5SJZiHZHPvbh7yecmAa3BfDQZ1bObIDAgICWcEjxLU4LCPFyJivcO1X5W4rsfBj7aEDh6y9h4K9C4HRosZ23if+lHGzv3dqtEb24zm1m8DRgpcLzK2g/7TOqkAzhqxVBamk0oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NxBpCUpb; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30761be8fa7so58193061fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jan 2025 07:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738079249; x=1738684049; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ORpfm8gqz7BJwSi63RXYjOXHuDS2RzlvCyhJKnf9cco=;
        b=NxBpCUpbTd37+jRA4l5TsQ4NW4iaAg1mBr2hYu8v/WMNc/Rq5w6wQ5KCK1TPajNeGs
         QSb92YLGFhffN9LktqByjZsUMDYZ+0gJW0m4wQqebzBzZEmXeyiovBqmYKh6ojuju1b1
         Ewy0faaYc9Gzyr0Q3itBmnm4Y6vjYiHPjzb2nlAYN4RneqPydmqrwP3aKL8sJ6c2z9wm
         w+uqU7YR5yJuIiNOsVx2SHszb6l1ZGm6b/Q3dHF/978LBZ1XBaxXUnR8bHJlYz6NqwZi
         ci4VO3VXQvmg6sspSFDO6F73bAdldMx5aWr6l1tswziMp8dlQ6hA7nemSFUkXhVHKk60
         iavg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738079249; x=1738684049;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ORpfm8gqz7BJwSi63RXYjOXHuDS2RzlvCyhJKnf9cco=;
        b=LlTOugyjtsXGIy/hJL3oauZI3eV5yV7OQlIZhC/1RfymNqXe34jUa66rJS0Oo1Uiwo
         2/MJc+oOXKqN41S8CdJSWhgu6fo4Emtd54pXSHz2s7GthtzCSk6Ki8pVWszK1/Ao6DFh
         743hP1YnLzWMG6vyfXPrh6ppnkRqFX29L6MrzEvk/VkWbrFiS6XCF5v44hM+oH02klpv
         OTbBIXnc/GVJa1MQtEGDnadlMgYWNlVGNvkFSRssRmkofyn79y5WRktU/t+DpoxoorGx
         8F4r59fBtRgGdX46p71NKld/f9yM08hk0tJB1bLdO8fUiQFt4XolndpUNrKCxyL7TwRb
         0ZEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRryFN+tggq0QhsiWomJxRTbUn+jNLGBol8SPVx12nkJJZ0cQK6LhECO50RRj1MOzkj7xul+ZAcTJj@vger.kernel.org
X-Gm-Message-State: AOJu0YwhTCnPTN5rByhdO6VaWAMn29m/v4ToG/z9UKuB1XBkKh335q9H
	b0RPAH7/kPGsY3T75vdX3FXvGEQCGdrGydPomkwrAtYuRDUzLXEJhy+zNXGESfciji+c14fbDsQ
	KGRNSMTk/OjHNX2UFcNsvrDEBPJbn+ngltWcDiA==
X-Gm-Gg: ASbGncvhQvzE3f+yBW5wmDvh4DpT2wItHVFLhwUXJBCHnERfc98mLTVtRTo8Ufdrebs
	TwHcevGpkkDMrcapHcIg5CvCbtlalEsvUGujwzYXSXfyLeMn+CIO5M8DN6PFma14t97Fnf1w=
X-Google-Smtp-Source: AGHT+IFzJzZ2trars/DKC2OeK820bAEA4OESZ8xv0fZ7CNGPrWwWN85tqO2dBttYZ+HZbEEhgHIzk9XO6G2yur8X4WM=
X-Received: by 2002:a2e:be27:0:b0:302:4132:499 with SMTP id
 38308e7fff4ca-3072cb22561mr176573531fa.25.1738079248573; Tue, 28 Jan 2025
 07:47:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250121-03-k1-gpio-v4-0-4641c95c0194@gentoo.org>
 <20250121-03-k1-gpio-v4-1-4641c95c0194@gentoo.org> <Z5FPJLzAEVXGWJnE@chonkvm.lixom.net>
 <20250123113042-GYA38135@gentoo> <Z5LOdh-4UxRtteOy@chonkvm.lixom.net> <20250127181726.GA538260-robh@kernel.org>
In-Reply-To: <20250127181726.GA538260-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 28 Jan 2025 16:47:17 +0100
X-Gm-Features: AWEUYZnoc3lmDNNFG2cVuqRGGhatacTuYZ1Uow9WWWXEfz68QbxO7Kxh6hOpHpw
Message-ID: <CACRpkdaj+cJFsYqJF5OY0v=Och6nxnBKV0C9aWb6-aLZhZobdg@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: gpio: spacemit: add support for K1 SoC
To: Rob Herring <robh@kernel.org>
Cc: Olof Johansson <olof@lixom.net>, Yixun Lan <dlan@gentoo.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Yangyu Chen <cyy@cyyself.name>, 
	Jisheng Zhang <jszhang@kernel.org>, Jesse Taube <mr.bossman075@gmail.com>, 
	Inochi Amaoto <inochiama@outlook.com>, Icenowy Zheng <uwu@icenowy.me>, 
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 27, 2025 at 7:17=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
> [Olof]
> > It seems worse to me to misdescribe the hardware as separate blocks
> > with a device-tree binding that no longer describes the actual hardware=
,
> > but it's not up to me.
>
> I agree. It's clearly 1 block given the first 3 banks are interleaved.
>
> If Linux can't handle 1 node for N gpio_chip's, then that's a Linux
> problem. Maybe it can, IDK. The lookup from a DT node to gpio_chip just
> needs to match on more than just DT node pointer, but look at the node
> ptr and arg cells.

Any operating system benefits from modeling the GPIOs such that
one set of 32bit registers [r0, r1 .. rn] becomes a discrete entity for
the OS.

Reasoning: any OS will want to be able to control several lines in
a single hardware operation, such as a register write, for example
to shake a clock and data line with a single write_to_register()
operation. If the hardware is described in chunks of 32 bit registers,
this is easy - Data Out Register, Data In Register, Direction
Register n bits, if an multiple-write/read operation hits this entity, we
know it can be handled with a single register write or read.

Yes, the same can be achieved by hardcoding this split into the
driver. But having the binding like such encourages it.

foo-gpios =3D <&gpio2 0>, <&gpio2 7>;

both need to be set high at outset, well they are in the same
entity and controlled by a single register, so (+/- overhead):

fooreg =3D fooreg | (1 << 0) | (1 << 7);

I agree this hardware is harder to classify as such since the blocks
share a single IRQ line - if they had individual IRQ lines it would be
a done deal, they are subblocks - yet shared IRQ lines are not *that*
uncommon.

Does this modeling reflect how the hardware actually looks? Likely.

The way GPIOs are built up from silicon io-cells are not that complex.
All the 32 bits from the set of registers will be routed to consecutive
pins, looking at the pin layout of the SoC would confirm if subsequent
bits map to subsequent pins.

Yours,
Linus Walleij

