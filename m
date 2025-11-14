Return-Path: <linux-gpio+bounces-28489-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D78DC5CFB0
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 13:00:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BDC064E23A4
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 11:58:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08682315D26;
	Fri, 14 Nov 2025 11:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="unbHMvVu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2AC31FF7C7;
	Fri, 14 Nov 2025 11:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763121502; cv=none; b=O9LviqadTnslV0olLzn0sjQfykTi0YqJRIY4gNmq7xa+2o3NuuYnCETBbaOwqNmjRUl2GWKJWrBLa93a7egy9OrKQ/WL0FmsgeHGuT0zYbcjwTCqWeu4Il6a4fi+81ppVRt/WiJpNagUamcBczH3uvOMCyDcWDedVeSNJhlLpnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763121502; c=relaxed/simple;
	bh=ez6uMmEsqC+UhiDyqz7RtFIoyVvC68GqNUlxW31YwK0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SjMG9sbT3Lu4LlQ428B1pjA3SiltfChgI4D/5uoQI7pBb0fpgCIHLNaVbhGZPXbBItrQIsXaUk762VAp/LGvv2mgfyRcBUJ1xMr8WjYM1b7VZKrr7Bg3qO2q7uUULqFuYbrEFAqszMAvef1C4k+4jckx6ULCGTL48dVo0dX08Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=unbHMvVu; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2AD851A1A9D;
	Fri, 14 Nov 2025 11:58:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DC4226060E;
	Fri, 14 Nov 2025 11:58:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AD11B102F292F;
	Fri, 14 Nov 2025 12:58:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763121496; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QuVm+6ZbJdSuSJWtighoJei2I/BVldxbu06wyLONX00=;
	b=unbHMvVu5i/AacXZo1M868WW6U8uo0bnQiTfzVkP4y6qjJmAdxra6mThqR37Nb/MoUBKz/
	sub7vB5y4oD72Fgm3P+RunANq5qXL1FxKYeNgjRjrLm7JI0WjXdXMYShBwimrbV4ea2H4J
	nmKIl/+zaP4/Jh3vWvLqKmaSWz74JzbFifYsQFknvlem0FoMEs4AlXGoUc9unPqUvRpAtE
	hJZHGqPF7GDBE8bnVvSvnRlOY6Ebf3ObUJO3g5ExXDMsuo5VCFgkAUpNhdhStYcxPnct2Q
	fz+lp+8ThHTRk/hiEIZF15R9rIUfem62iyW2COE2NZpNda1SnttUyaKFQbUgoA==
Date: Fri, 14 Nov 2025 12:58:10 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Hoan Tran
 <hoan@os.amperecomputing.com>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Saravana Kannan
 <saravanak@google.com>, Serge Semin <fancer.lancer@gmail.com>, Phil
 Edworthy <phil.edworthy@renesas.com>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Pascal Eberhard
 <pascal.eberhard@se.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v6 5/8] ARM: dts: r9a06g032: Add GPIO controllers
Message-ID: <20251114125810.629e8931@bootlin.com>
In-Reply-To: <CAMuHMdUicJjXkkNs7FhZ0-jyuv9pzr_Q0AZNXs7tiv-MBGTkbg@mail.gmail.com>
References: <20251027123601.77216-1-herve.codina@bootlin.com>
	<20251027123601.77216-6-herve.codina@bootlin.com>
	<CAMuHMdUicJjXkkNs7FhZ0-jyuv9pzr_Q0AZNXs7tiv-MBGTkbg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Geert,

On Fri, 14 Nov 2025 10:04:10 +0100
Geert Uytterhoeven <geert@linux-m68k.org> wrote:
...

> > +               gpio0: gpio@5000b000 {
> > +                       compatible = "snps,dw-apb-gpio";  
> 
> Don't we want an SoC-specific compatible value, too?
> 

I had added a specific compatible string in my v1 iteration but it was
rejected by Rob [1].

[1] https://lore.kernel.org/lkml/20250729181151.GA530390-robh@kernel.org/

Best regards,
Hervé

