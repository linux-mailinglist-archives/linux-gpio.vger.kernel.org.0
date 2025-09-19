Return-Path: <linux-gpio+bounces-26392-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 285E8B89C26
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 15:59:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A4E021C8825A
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 14:00:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ACB5313293;
	Fri, 19 Sep 2025 13:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="S8U1p6lk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D66B313D48;
	Fri, 19 Sep 2025 13:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758290376; cv=none; b=PoE11hclhN90S/Bl330/c/SDmrHOh6F8hHPZG6Dn+pWY0UqBxwEeWxSZC5x7exK8G5LFLRSY6YLXERwuv7vhw3WLFUx1tnapsFOSCVVH6Gh5Lduvk0IDlecC6JU/aPuRYgE/qsbGMNS6OgMeZ060B4KFHZFKbQf/YlGb7hwygD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758290376; c=relaxed/simple;
	bh=rYm7TDSt7m3UIo26WMvRENt6r9Gc+DAQRE/S6hKjId4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kOD5gz5TqzXSHL9TA3hJVbFHKMQC5Ye+RFT8DIbpH1w1PGztVPZAyOrTsE/61AcZ+GGnhn43QEw8smYsoaU8J9sBAQjeJb6phKnT7/1rUrukqtJgqbKcylqjpMTrJ+sbIpls7QbeompGo5LKgq5PUOdGNSgRotFkXgN/n3duKpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=S8U1p6lk; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E2DB41A0F18;
	Fri, 19 Sep 2025 13:59:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B6B02606A8;
	Fri, 19 Sep 2025 13:59:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 757D2102F1BCB;
	Fri, 19 Sep 2025 15:59:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758290370; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dWYgA9dXzIHOPv9DWHE+oxQc2sRvSmlPdD1Mhljo75M=;
	b=S8U1p6lkz1TkcMx0Lx7dsXI7Kddmg+uVELN9GHpySFHyJ2gk1ThiVW0Ya+PpybT6exc9ir
	wIbyd/ulU+97JOw74n87KFkRy2DwhRKtueVABl1T4qIL8gyh7hWyH5b1zwBUig4Uj5+qF+
	wBUbg8bHk6dIV4ydjeSwxjXKSMAI/WFc4zzB9bodtyq0MM7BUh6IuYi/AhSiwVZstgnFTo
	rGoYqdY/RafwrWkZRO3L7Yhavyw4azaKKvM+itxgU5CFgpv9YsidHU9AjU7xbERlbPW6D8
	PpD1EfNJvk7BY5MFrpomAw46ybV6NP/ps8+UcccH7gEU1RO8YZXoNhbGyVcKTg==
Date: Fri, 19 Sep 2025 15:59:10 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Hoan Tran
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
Subject: Re: [PATCH v3 8/8] ARM: dts: r9a06g032: Add support for GPIO
 interrupts
Message-ID: <20250919155910.4d106256@bootlin.com>
In-Reply-To: <aM0llhn054OI9rA8@ninjato>
References: <20250918104009.94754-1-herve.codina@bootlin.com>
 <20250918104009.94754-9-herve.codina@bootlin.com>
 <aM0llhn054OI9rA8@ninjato>
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

On Fri, 19 Sep 2025 11:42:46 +0200
Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:

> > +			/*
> > +			 * interrupt-map has to be updated according to GPIO
> > +			 * usage. The order has to be kept. Only the src irq
> > +			 * (0 field) has to be updated with the needed GPIO
> > +			 * interrupt number.
> > +			 */
> > +			interrupt-map = <0 &gic GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>,
> > +					<0 &gic GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
> > +					<0 &gic GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
> > +					<0 &gic GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
> > +					<0 &gic GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
> > +					<0 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
> > +					<0 &gic GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
> > +					<0 &gic GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;  
> 
> I'd think this should be dropped from the include and added in the board
> file instead. I did this with my board and it works fine.
> 

I can only reduce the table but I need to keep the interrupt-map property.

'interrupt-map' is a required property. If the board doesn't use any interrupt
GPIO, its dts has no reason to set the interrupt-map.

In that case, if I fully remove 'interrupt-map' in the dtsi, dtbs_check
will not be happy. Indeed, a required property is missing.

Also, having the full table containing the 8 items with the correct GIC
interrupt number and the correct order could help a user to route the
GPIO line to one of those 8 items.

The '0' field use as interrupt source matches the registers reset value
of the irq-mux controller.

With that in mind, do you still think that I should reduce this table?

Best regards,
Hervé

