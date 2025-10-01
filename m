Return-Path: <linux-gpio+bounces-26726-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B78BB1202
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Oct 2025 17:42:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3372618936E8
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Oct 2025 15:42:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3254427D780;
	Wed,  1 Oct 2025 15:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="eAoGuViM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9757D27A904
	for <linux-gpio@vger.kernel.org>; Wed,  1 Oct 2025 15:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759333353; cv=none; b=t7gdLcbpI6P/Gu+VK/x7Y4h+XrCzKabFOKZ9Xa05ruNIIBcGStAnW7XzSOPK5BgA/rz0nmJuUjLQmyM/fF96RMf61vJvhWIIBR/AG4SzR8d+LTHfxG0nfS3rjvNPgnKLxsevd3QjJ53tjt2inT7LYH1fNn0ifNcXR3T1OnWmsCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759333353; c=relaxed/simple;
	bh=IFmXaUEVCdfmu4h7uBdcd60/SgHLRG5fK16lXlhnfi4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XHx8a/DKfqYloKVjOdwPeKlJ2/JYNZYuRB1JTa6eDm3iC6jve24XkAARjSZ3ivYdJ68urE4VmZ+nacBvISACNXD//qEPh0iWkKrQ2O+CrKxksIq9UMDhhwZPUL3OWenca7CRGvNGsgQ7h94psTqeXLgeJF62jjLbCvIqxJo5fLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=eAoGuViM; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A5DBBC02465;
	Wed,  1 Oct 2025 15:42:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 45EC5606BF;
	Wed,  1 Oct 2025 15:42:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E6375102F1A3E;
	Wed,  1 Oct 2025 17:42:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759333340; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HMmBhCThKM49GDvXBon6ScZQqtxnNu2vGA60ajonRrk=;
	b=eAoGuViMv3sS/djX+80W2N/Ha4y8f5AGU5UP/SVorMoE++0n7PUkIOEIhAJ3hAUMlMayQ6
	IOdTySEdA7fFUHanPA+atTEYIdbylUSKo+TCCmVeoP802o0D0sQ6ZEsUanqPU5oUdUIM83
	RJ7WEkk1ls21EfWl3VczG/x7TjlqiqUnTUQ6IL1lt2Ex4ioelt2njhvQfTaeQ8/1hPLRtw
	YLHBqIRoABDSq86ueI3rRxrc1ghmNYCOKTQeDC14gL46PiObRnjWla5q7noyxMhvS/jg3N
	jLGGWdTh4gcLW2wLshAmpfSrRqLkDzfjsC6tHMAXNusHQHLrKXvKLXsTnpZ6nA==
Date: Wed, 1 Oct 2025 17:42:05 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Hoan Tran
 <hoan@os.amperecomputing.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Saravana Kannan
 <saravanak@google.com>, Serge Semin <fancer.lancer@gmail.com>, Phil
 Edworthy <phil.edworthy@renesas.com>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Pascal Eberhard
 <pascal.eberhard@se.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 7/8] soc: renesas: Add support for Renesas RZ/N1 GPIO
 Interrupt Multiplexer
Message-ID: <20251001174205.71a08017@bootlin.com>
In-Reply-To: <CACRpkdZPURiag1cUQZ319_QA83u+qOCSRALxpe10_+cTcevy+Q@mail.gmail.com>
References: <20250922152640.154092-1-herve.codina@bootlin.com>
	<20250922152640.154092-8-herve.codina@bootlin.com>
	<CACRpkdZPURiag1cUQZ319_QA83u+qOCSRALxpe10_+cTcevy+Q@mail.gmail.com>
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

Hi Linus,

On Wed, 1 Oct 2025 13:08:57 +0200
Linus Walleij <linus.walleij@linaro.org> wrote:

> Hi Herve,
> 
> thanks for your patch!
> 
> On Mon, Sep 22, 2025 at 5:27 PM Herve Codina (Schneider Electric)
> <herve.codina@bootlin.com> wrote:
> 
> > On the Renesas RZ/N1 SoC, GPIOs can generate interruptions. Those
> > interruption lines are multiplexed by the GPIO Interrupt Multiplexer in
> > order to map 32 * 3 GPIO interrupt lines to 8 GIC interrupt lines.
> >
> > The GPIO interrupt multiplexer IP does nothing but select 8 GPIO
> > IRQ lines out of the 96 available to wire them to the GIC input lines.
> >
> > Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>  
> 
> This looks like some complicated code to reimplement hierarchical
> irq domains.
> 
> Can't you just select IRQ_DOMAIN_HIERARCHY and let
> the existing infrastructure in GPIOLIB_IRQCHIP handle
> this?
> 
> This kind of remapping and handling is exactly what the
> .child_to_parent_hwirq() callback in struct gpio_irq_chip
> is for. This function can fail if you run out if IRQ lines.
> 
> Inspect drivers/gpio/Kconfig driver that select
> IRQ_DOMAIN_HIERARCHY for examples of how to
> do this.
> 
> Even if your GPIO driver is not using GPIOLIB_IRQCHIP (in that
> case: why not?) I think you still need to use IRQ_DOMAIN_HIERARCHY
> for this.
> 

I don't see how IRQ_DOMAIN_HIERARCHY would help.

The irq-mux only muxes irq signal without performing any operations usually
done by an interrupt controller.

That's why I used interrupt-map in the irq-mux.

The only information needed by the irq-mux is the interrupt line muxing that
needs to be applied. This information is available in the interrupt-map.

If we introduce IRQ_DOMAIN_HIERARCHY, either it is done at gpio controller
level to route gpio interrupts to GIC interrupts and, in that case, the
irq-mux is skipped and cannot apply the muxing.

Or it is introduced at irq-mux level and irq-mux need to be an interrupt
controller but is component is not an interrupt controller.

Maybe I missed some points or I misunderstood the purpose of
IRQ_DOMAIN_HIERARCHY.

Can you give me some details on how IRQ_DOMAIN_HIERARCHY should be
used in my case?

Best regards,
Hervé

