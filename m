Return-Path: <linux-gpio+bounces-26376-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E94FB897DB
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 14:40:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 28B415A384C
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 12:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8102E1F03C9;
	Fri, 19 Sep 2025 12:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="AuqWETXe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586701E3769
	for <linux-gpio@vger.kernel.org>; Fri, 19 Sep 2025 12:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758285615; cv=none; b=PPX/na605mzLIje5So8UlJai4XaZKFjOJBILTmqMgaspjuQSNKCiVz1bf3n7uH6xf7GizW++WU6eCI6Hecksyxtb1xd3VP6L0GIb64iquli9DO4qjCANHmn2uIu/sm8iGtoOGf7w7EwGDs8CIxLjA1nPUODm3VYfqJAFg8l3KWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758285615; c=relaxed/simple;
	bh=DSsKSdHuufHzAGTSQtvAWgVv0FxqTvtqiK5WHmKVQ4g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WkgqGvic7wbkL129Bl7m134yFP7fIJw88FWz7sxmLecMHBW0xhA1lHKxXhwn9qicCOCBVp3IStM8Jva66WjJw/uoe7DlPhKQQRQRrVHfvOvIuBwCqvfpa5njjfKQDCj/1tOGbnbjtOReENBKgTkISGUBLCGvI1CxVXzYtsRqoTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=AuqWETXe; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C223FC8F1C5;
	Fri, 19 Sep 2025 12:39:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 65297606A8;
	Fri, 19 Sep 2025 12:40:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AD3FD102F1C98;
	Fri, 19 Sep 2025 14:39:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758285609; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=I/Pe5qOhDxLMMUTgQVYyG2nRgbxXtQ8qXCPs6Wd2cUo=;
	b=AuqWETXeUarHezFGbq2vVyHeR0fm0mGPzoxJSNsnyuyJDb3A8hskSO4A0xBJx2dVO7K8nw
	sX35hXyxsYCS9i6fhoWx6uYufk+f+vQ9xtWDpHubiV/E9nH3TaSopqcXTjhYLHDJHzG718
	RzP6I4gME8qDEo1wk/bjvYJg684Q85D3QkD+fwNOZL8WeA0muaFXcVAExot8bfoFBO92DH
	IiPdODvDzT1jWoFeZ6hKJrGTFNeQG3JJnqIdDKYpQoM1q7PUkhDKAd1T4kBUBMcxbJy/z4
	V8HwDoA5LUKQPTRhO6N89xKJfTCJiz49vkFlNu9p48y9IIhCdkXk8OZWC1c63g==
Date: Fri, 19 Sep 2025 14:39:51 +0200
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
Subject: Re: [PATCH v3 6/8] dt-bindings: soc: renesas: Add the Renesas RZ/N1
 GPIO Interrupt Multiplexer
Message-ID: <20250919143951.15a1b4e6@bootlin.com>
In-Reply-To: <aM0ju74JJbjliQAl@ninjato>
References: <20250918104009.94754-1-herve.codina@bootlin.com>
	<20250918104009.94754-7-herve.codina@bootlin.com>
	<aM0ju74JJbjliQAl@ninjato>
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

Hi Wolfram,

On Fri, 19 Sep 2025 11:34:51 +0200
Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:

> > +  interrupt-map:
> > +    description:
> > +      Specifies the mapping from external GPIO interrupt lines to the output
> > +      interrupts. The array items have to be ordered with the first item
> > +      related to the output line 0 (IRQ 103), the next one to the output line 1
> > +      (IRQ 104) and so on up to the output line 8 (IRQ 110).  
> 
> maxItems 8?

Yes indeed and probably both
  minItems: 1
  maxItems: 8

> 
> > +        /*
> > +         * The child interrupt number is computed using the following formula:
> > +         *    gpio_bank * 32 + gpio_number
> > +         *
> > +         * with:
> > +         *    - gpio_bank: The GPIO bank number
> > +         *          - 0 for GPIO0A,
> > +         *          - 1 for GPIO1A,
> > +         *          - 2 for GPIO2A
> > +         *    - gpio_number: Number of the gpio in the bank (0..31)
> > +         */  
> 
> I wonder if this comment wouldn't be better in the interrupt-map
> description above?
> 

I will move in the description.

Best regards,
Hervé

