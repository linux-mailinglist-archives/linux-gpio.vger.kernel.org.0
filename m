Return-Path: <linux-gpio+bounces-26337-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 999E8B85E02
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Sep 2025 18:04:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E81A81CC07B3
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Sep 2025 15:58:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E87E0314D1A;
	Thu, 18 Sep 2025 15:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="phDbi24B"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A131D314B8F;
	Thu, 18 Sep 2025 15:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758211048; cv=none; b=IpyQvL5sRuK5r/vnwulU/uD4uCHoiX4jvpwXmUmGOTT5ztS4KBWrYyKKj1SKILFCgehoFERXIr7spXJ+iaDpE6ZhGglYVO9MSMWiOrYTcb8uIC1teAYdf9sn11RkMfYeE8jhRUgDySagR5BRvfTmRq0aTJCst9nH1dcY7Pn8kck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758211048; c=relaxed/simple;
	bh=7szmy2OW+pKdnxlLQgL5ZyztXZVlULEeY328f0dD5nM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MU31y+XAc6v6wsaowpgLQFVEW4VM8q07UBYXzxXB5C2mJeS8tQniNMsR3twW6RegNMJdQ/Q1wI8AKCAljtt5awPazND3b3BM4GLGLiNIo7v5bqr0cerTgxiy1QFUfVvX11GvgeIjCoPgxh6NT5qawks35D/WCJss9492AugoByM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=phDbi24B; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 47C94C003C9;
	Thu, 18 Sep 2025 15:57:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C8AAF606A8;
	Thu, 18 Sep 2025 15:57:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B467D102F1D0B;
	Thu, 18 Sep 2025 17:57:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758211043; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TxZksMSppeoI1kAjsorjjiU9ZV35lEO/QcgVtoJNdhk=;
	b=phDbi24B+Am3HE81Qq/HYW6qFlByZ7uAfZgeuWMxFldWNrdNRyQ0Zz2upRDUHbSwCpqTuy
	vBL5KxbtcXkaKq+rpt8meuUoefi3LQhDnd4/qdIbVQxdLgDPmur11ePGZGoRidCjg6ajLO
	G7nac19LjQ+C7tZOR5spe+Vc51uSgaXvxrV/D6EDMJAAClWYlkJGtVeTX4/GhRg3IlDKJK
	0xY6ixodMhtL36QoPnvxcrnRYnrp6t5EXuqLFYCI79znuQPsXAdAu6/2C37dT7O9CfZPUE
	GEwhxeqCrUYtC8mAt6fjRj77g9PNxd8xmSUqOFGfIWLUCwxkemqhNI0UU2YS8w==
Date: Thu, 18 Sep 2025 17:57:16 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Conor Dooley <conor@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Hoan Tran
 <hoan@os.amperecomputing.com>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus
 Damm <magnus.damm@gmail.com>, Saravana Kannan <saravanak@google.com>, Serge
 Semin <fancer.lancer@gmail.com>, Phil Edworthy <phil.edworthy@renesas.com>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Pascal
 Eberhard <pascal.eberhard@se.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 0/8] gpio: renesas: Add support for GPIO and related
 interrupts in RZ/N1 SoC
Message-ID: <20250918175716.6c3fd406@bootlin.com>
In-Reply-To: <20250918-sterilize-malt-b0f182256617@spud>
References: <20250918104009.94754-1-herve.codina@bootlin.com>
	<20250918-sterilize-malt-b0f182256617@spud>
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

Hi Conor,

On Thu, 18 Sep 2025 16:37:39 +0100
Conor Dooley <conor@kernel.org> wrote:

> On Thu, Sep 18, 2025 at 12:39:58PM +0200, Herve Codina (Schneider Electric) wrote:
> > Hi,
> > 
> > This series adds support for GPIO and GPIO IRQ mux available in the
> > RZ/N1 SoCs.
> > 
> > The first patches in this series are related to a new helper introduced
> > to parse an interrupt-map property.
> >   - patch 1: Introduce the helper (for_each_of_imap_item)
> >   - patch 2: Add a unittest for the new helper
> >   - patch 3 and 4: convert existing drivers to use this new helper
> > 
> > Patch 4 will conflicts with commit 40c26230a1bf ("irqchip: Use int type
> > to store negative error codes") available in linux-next.
> > 
> > Patch 5 adds support for GPIO (device-tree description)
> > 
> > The last patches (6, 7 and 8) of the series are related to GPIO
> > interrupts and GPIO IRQ multiplexer.
> > 
> > In the RZ/N1 SoCs, GPIO interrupts are wired to a GPIO IRQ multiplexer.
> > 
> > This multiplexer does nothing but select 8 GPIO IRQ lines out of the 96
> > available to wire them to the GIC input lines.
> > 
> > One upstreaming attempt have been done previously by Phil Edworthy [1]
> > but the series has never been applied.
> > 
> > Based on my understanding, I have fully reworked the driver proposed by
> > Phil and removed the IRQ domain. Indeed, the device doesn't handle
> > interrupts. It just routes signals.
> > 
> > Also, as an interrupt-map property is used, the driver cannot be
> > involved as an interrupt controller itself. It is a nexus node.
> > 
> > With that in mind,
> >   - Patch 6 is related to the irq-mux binding.
> > 
> >   - Patch 7 introduces the irq-mux driver.
> >     This driver uses the 'for_each_of_imap_item' helper introduced
> >     previously. Indeed, the lines routing is defined by the
> >     interrupt-map property and the driver needs to set registers to
> >     apply this routing.
> > 
> >   - Patch 8 is the RZ/N1 device-tree description update to have the
> >     support for the GPIO interrupts.
> > 
> > [1] https://lore.kernel.org/all/20190219155511.28507-1-phil.edworthy@renesas.com/
> > 
> > Best regards,
> > Hervé  
> 
> This whole thing is super interesting to me. I have a gpio irq mux of my
> own with a driver that is massively more complex than what you have here
> (it's a full on irqchip driver). I'm definitely gonna have to see if I
> can ape what you have done here and simplify what I have.

Glad to see that this is giving some ideas!

Best regards,
Hervé

