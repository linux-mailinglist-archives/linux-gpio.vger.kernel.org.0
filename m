Return-Path: <linux-gpio+bounces-27019-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B45BD2A36
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 12:50:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BAFA134A1B9
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 10:50:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70A8E30499B;
	Mon, 13 Oct 2025 10:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dIbJQqA3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886273043B8
	for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 10:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760352572; cv=none; b=s+IhpOUc6ODfB2V9Db9sWsp+zQk0V667ig9A1pqA2ks5ahGF45rEjJXNGs8ODmcmissqvPEDlko6OEQllUbQMt/8F8WJ8HUxorJzZFOn8g3x7RiXyoGcS1rn/OG4q1AySqdqE+nA++jVf88J01rWKAzS1BW8ffNYHXaDEPAF6bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760352572; c=relaxed/simple;
	bh=OBRTBgdQa0ezTgOG0fekcSASOaIs/eav1o10bLNrjYg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=huxa1rqbuM6xbcpCFac9nldrnKd4iFDJT7Kxgwm48bRg52EenlepJr2oDy0rnK3EixOoj3y3WLXpEXGdRvJP7yrY+R04TW1KG/sJo5Zf3DVvs2pDZ5u4nXsX60rZNXGNqrMrOLv+yhhZu9MYL/7OKV2XMqkd0tLHX8xfQFbLcuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dIbJQqA3; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3682ac7f33fso47053951fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 03:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760352559; x=1760957359; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OBRTBgdQa0ezTgOG0fekcSASOaIs/eav1o10bLNrjYg=;
        b=dIbJQqA3hv0qH5S8ffwtW5xd5mp3nBvNThC5DatwFba/UINk/1v+qPAEDYGVm9zCy/
         xk9aAmgF30hBHLUwOGGiqQ4t5ysmrvL/VVRJ4msftFxWNNZoYlHfqXRYePlhJkWgQ+Iz
         XeCa+cGGrlndMAxORngQjOLKggc1Pgz2W9uN2GsleeNeXFfCuQQOqwCriEBIqAfoVF8M
         /KGLseoR13gLcvq8NCJdutHcIVIyTNWLgnGtrljn+TR9sjb3oKNgq/BFXl2RsR2zgKhi
         F28rGpqYQygsoV4x1oFDUSDUa1kZDDdYZfnJ55GUQOL0LielO0oqaaxCHwgeOS+0jCkt
         9epA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760352559; x=1760957359;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OBRTBgdQa0ezTgOG0fekcSASOaIs/eav1o10bLNrjYg=;
        b=kiMbFpCcroi+HTHzQcoWTMuq7C6RcChpArNWnOEerj72G/o1dyEfle8W7VlO4hkInC
         YEIlFi1l/I5EKkb1h94czMAKkAloE4R8WOgUOprU7KjTdvmWgFLm2UQ3jXPTjo6bBhuq
         Xp0XJdVErl/6sUgX8n8RCb9NaZPVRSFo4FwNUWKJ1bz3eiIKpK3YPesCtXy/Z+BkxCgy
         KyAVAh5/N17W1kOJz306Ir8sheGN06N4dXL7eQVZymc+zqQPDxkcY3cWDyOdXtbttB27
         jx5yFgjKNHhjG90o2L5IsMZpHuz0Kw2ciBPKxxMLAPoG0dPXSwKUG+t/LwdCmZLPoTUv
         G2SQ==
X-Forwarded-Encrypted: i=1; AJvYcCUREWEAdEanG0/p8TVU6dR/dUJa1BLOulACRj7EL94hrNcjBgvV2Ietw6pH05/JrUWmQoQ8P/zi/C5x@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+4KU2H40leu5556ik3cP51RZa55nKvteiISEj//EYtNJgIipr
	AXHTTns2JVW1OyGAR1KXMG3dnTvIwy5qBc2c0+fkp2PO1xpYfH5gwflkUmj4aCqIllHmBieNqHT
	1JVu9IGxGDGqhQXJi17ZwJcumz1uwMpun1bxAjWJO4Q==
X-Gm-Gg: ASbGncsGiD14ikWIiWLRtWO8vRJxf0a0ifw+6kqCwdD60yvSFSuYKlTTn9rGWMypcx/
	oAkBTSYii5ZnNz44XYdeUjlKaXdhmQxRArU49bWjlgn2XjUkPy4w0Kx2WRT0eWUjusbqG+ITlLL
	Ge9ydc+1MUyvYGL4uNDE1M+MGFevwqZikIv1sm8uysmcUOyUK7kGmMZ/hmx+v/jdePtAEW1PYaR
	FV6QlQYNMglbNR3e0XcEtg/2Oq1+Q==
X-Google-Smtp-Source: AGHT+IFOq8r2+x8j+n2o4YPgt0yqTqrdILP4XzCLFJtq6Qxm8iqZG0/oseSlJ2uW/NV8gJqb/q55XZ6vH5Q9BXkHEkY=
X-Received: by 2002:a2e:a54a:0:b0:373:c272:d986 with SMTP id
 38308e7fff4ca-375f526e5b0mr67942651fa.17.1760352558762; Mon, 13 Oct 2025
 03:49:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250922152640.154092-1-herve.codina@bootlin.com>
 <20250922152640.154092-8-herve.codina@bootlin.com> <CACRpkdZPURiag1cUQZ319_QA83u+qOCSRALxpe10_+cTcevy+Q@mail.gmail.com>
 <20251001174205.71a08017@bootlin.com>
In-Reply-To: <20251001174205.71a08017@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Oct 2025 12:49:06 +0200
X-Gm-Features: AS18NWCu7OuRtExFxAHo2mGL4pkxRIov06rPInvhQDpr6xWeLGLTOcCLnJNvizg
Message-ID: <CACRpkdZ1qg6ecA5DyVEGUHQxLh0SnC=GC5JZdevT99YVWU0ypA@mail.gmail.com>
Subject: Re: [PATCH v4 7/8] soc: renesas: Add support for Renesas RZ/N1 GPIO
 Interrupt Multiplexer
To: Herve Codina <herve.codina@bootlin.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Saravana Kannan <saravanak@google.com>, Serge Semin <fancer.lancer@gmail.com>, 
	Phil Edworthy <phil.edworthy@renesas.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 1, 2025 at 5:42=E2=80=AFPM Herve Codina <herve.codina@bootlin.c=
om> wrote:
> On Wed, 1 Oct 2025 13:08:57 +0200
> Linus Walleij <linus.walleij@linaro.org> wrote:

> I don't see how IRQ_DOMAIN_HIERARCHY would help.
>
> The irq-mux only muxes irq signal without performing any operations usual=
ly
> done by an interrupt controller.
>
> That's why I used interrupt-map in the irq-mux.
>
> The only information needed by the irq-mux is the interrupt line muxing t=
hat
> needs to be applied. This information is available in the interrupt-map.
>
> If we introduce IRQ_DOMAIN_HIERARCHY, either it is done at gpio controlle=
r
> level to route gpio interrupts to GIC interrupts and, in that case, the
> irq-mux is skipped and cannot apply the muxing.

I meant to introduce the muxing code directly into the
GPIO driver instead of using a separate muxing driver,
using the struct gpio_irq_chip supplanted by IRQ_DOMAIN_HIERARCHY.

Are these IRQ lines ever muxed for anything else than
GPIO? In that case go ahead with this solution, I guess.
But the title of your patch seems to suggest it is
only used by GPIO.

If it is only used for GPIO, why make it a separate
driver instead of just putting the muxing into the
GPIO driver?

> Or it is introduced at irq-mux level and irq-mux need to be an interrupt
> controller but is component is not an interrupt controller.

It is a hierarchy, as all interrupts are routed through
it. Just becaus you don't have to ACK every IRQ in the
hierarchy doesn't mean it's not a hierarchy.

> Maybe I missed some points or I misunderstood the purpose of
> IRQ_DOMAIN_HIERARCHY.
>
> Can you give me some details on how IRQ_DOMAIN_HIERARCHY should be
> used in my case?

The gpio_irq_chip ->child_to_parent_hwirq() is called
as part of the translation of each IRQ and in this callback
you can set up your mux. You can return
negative if you run out of muxable GPIO lines.
This means the irqdomain hierarchy fits as abstraction
for this usecase.

Yours,
Linus Walleij

