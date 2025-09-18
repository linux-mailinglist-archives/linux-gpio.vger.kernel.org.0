Return-Path: <linux-gpio+bounces-26333-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D732B85B6A
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Sep 2025 17:44:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 064D1581E2F
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Sep 2025 15:41:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B44803128A0;
	Thu, 18 Sep 2025 15:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="1aa9FizU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C8A2264CB;
	Thu, 18 Sep 2025 15:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758209968; cv=none; b=Ahnvib/cegqgIxIF/GcPL70TwgJ1AGGwy3leM5R6clsWrDaYcgJ/XgewsYsV9DE10nqNtQKI0KhFDsySU0YjhvG72dql1W7M823Py6gK0RH5pvwgyq6re7E3XLyiVP+Sy9yURwiUmV6updbeK/U7R6gBu4zu5nGi2aQ6cqOPX70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758209968; c=relaxed/simple;
	bh=yvI9WRkjNziIXHyfBCi1gP81tPaI2N+ll5YHyYNoVjc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c8ZEz64NREkeMSYmjryGQ45GyKB3DteRPL7IiLS2QuPZEzPB6rMziGi5Q2Nfu8GsVCond77lndwYiF4fhKfrtsrntJTNXoKHqBUX8p05vMA+StFcBmVhypXg93weMaDyaW1vbmOT2rr2EdTUOkwHhG1BEzwOiz/qfP8Wz67f2KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=1aa9FizU; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D433FC003C9;
	Thu, 18 Sep 2025 15:39:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6B13E6062C;
	Thu, 18 Sep 2025 15:39:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F0891102F1C44;
	Thu, 18 Sep 2025 17:39:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758209962; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=InX4ZyyyQ3lwpi3O5HldT8d6M7sTdq7qs7JdDj+/BfM=;
	b=1aa9FizUUgy64yybBnZ798MRxNA8gZqKHgPuwTmUrk+vkDf7F7k3nQmaYJV1rgZikTtzxd
	FHBuUbQH/I0z8FzDSrXr8Vf0WYlgw7dJdfyXmkvOTH3OdvCzwEXN+/cxV7DRvjXEmeW3Hz
	J3OcWzOjQsC8hNzVIkDZL4Pfv06qLxLPB033RQ6S4KxAWEp4nFW6rUargjO/3tt2WoRicB
	rjNUS8ByL4uSjJ7VRufQ+AB9ceWnown2hD3wQRDUYdL8zy8lSxof1A/S8WyO6sEMLOwiCb
	8Wjz7+wQudvx5I4Awzb7hbqVPyyg/2G3cfljRgjHyrGKV+YPRZxaG+j7rvE4rw==
Date: Thu, 18 Sep 2025 17:39:15 +0200
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
Subject: Re: [PATCH v3 6/8] dt-bindings: soc: renesas: Add the Renesas RZ/N1
 GPIO Interrupt Multiplexer
Message-ID: <20250918173915.730bc3db@bootlin.com>
In-Reply-To: <20250918-education-resource-aac71b87e979@spud>
References: <20250918104009.94754-1-herve.codina@bootlin.com>
	<20250918104009.94754-7-herve.codina@bootlin.com>
	<20250918-majestic-mockup-0a0e090db0a7@spud>
	<20250918171502.411c3527@bootlin.com>
	<20250918-education-resource-aac71b87e979@spud>
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

On Thu, 18 Sep 2025 16:26:59 +0100
Conor Dooley <conor@kernel.org> wrote:

> On Thu, Sep 18, 2025 at 05:15:02PM +0200, Herve Codina wrote:
> > Hi Conor,
> > 
> > On Thu, 18 Sep 2025 16:06:04 +0100
> > Conor Dooley <conor@kernel.org> wrote:
> >   
> > > On Thu, Sep 18, 2025 at 12:40:04PM +0200, Herve Codina (Schneider Electric) wrote:  
> > > > On the Renesas RZ/N1 SoC, GPIOs can generate interruptions. Those
> > > > interruption lines are multiplexed by the GPIO Interrupt Multiplexer in
> > > > order to map 32 * 3 GPIO interrupt lines to 8 GIC interrupt lines.
> > > > 
> > > > The GPIO interrupt multiplexer IP does nothing but select 8 GPIO
> > > > IRQ lines out of the 96 available to wire them to the GIC input lines.
> > > > 
> > > > Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
> > > > ---
> > > >  .../soc/renesas/renesas,rzn1-gpioirqmux.yaml  | 87 +++++++++++++++++++
> > > >  1 file changed, 87 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/soc/renesas/renesas,rzn1-gpioirqmux.yaml    
> > > 
> > > This is an interrupt controller, please move it to that subdirectory.  
> > 
> > Not so sure. It is a nexus node. It routes interrupt signals to the
> > interrupt controller (interrupt-map) but it is not an interrupt controller
> > itself.
> > 
> > I am not sure that it should be moved to the interrupt-controller
> > directory.  
> 
> Your node name choice disagrees with you!

Oups, you're right, my bad.

What do you think if I change the node name from "interrupt-controller" to
"interrupt-mux" in the next iteration?

Best regards,
Hervé

