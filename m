Return-Path: <linux-gpio+bounces-27178-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 6900DBDE534
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Oct 2025 13:49:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 156E535766C
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Oct 2025 11:49:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF568322DB5;
	Wed, 15 Oct 2025 11:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="24QDWAP1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707B1322DAA;
	Wed, 15 Oct 2025 11:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760528938; cv=none; b=nmUHTFMUlV8+D1nHH+K5QGlzEDjLHJuih0rEmzo5LjvPivTJ7ZdK2eKEe9Lclp01VIPXdDm7Iehcm7+8fDxt5pHjXzuMBJCcin0zyWV5vtTUkJMO3j9AAKsa4/b56uo4xnQmL26yuLz2u3ilpDZtigwXveeRMeRVtF3S4zjD+WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760528938; c=relaxed/simple;
	bh=5xkKQaCJcLNKjjAggEjnjUaHxOikgF03tyhL/q4hdLA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A3etAgBusAPb4ZVh+lF1pwhYnYG3NeubwpY7EMqvNXM/lj0c80CF93JDLgvva60DX7LzJB/KKuWmPsYkXOUbc4Hg42uOd98zjbcN+hTIPUVYr4WcNDirSmHVvl2YYGBoB2hnmkSddpfDpL/8pDjK5Do9rYnGlQa2QzItMfcGsP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=24QDWAP1; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CB4881A13CD;
	Wed, 15 Oct 2025 11:48:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9CEBF606F9;
	Wed, 15 Oct 2025 11:48:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C41D9102F22B7;
	Wed, 15 Oct 2025 13:48:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760528931; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=q2qoYp02/jZuYlfxVRjrpV1dQgL3PSlbw/Em+FLVpf4=;
	b=24QDWAP1A1lGjyfEDs5xwM2YU5G0VB4komtmvS3SROem458VxFSnTBkz+AvZagMZPyRtXC
	9LvHXjBfv4OObeqmp1YJE3F4s2KP37uSiS38soVDWNvSTdKTRhgE9SIrupD+qN2OBfQSa4
	QBGFhNoFPddsTVuOXTSIsiyMANfhnimB9QuoeQBa5g+DOvLd0pnRBn5Nt0N0v1Rc1/E20K
	sHpcXdaZ0MXrCxGp4P8t1/N3XJeiVJzlDU3wdAf8HKOFoIPqb+TR3Z06oiaMiaPQmn7wwC
	clBVZ8Cy+gqzeKpb968crH5T7hTYRnVckcKNJ9J5UDGY2npS57KLruSRv80mLQ==
Date: Wed, 15 Oct 2025 13:48:39 +0200
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
Subject: Re: [PATCH v4 7/8] soc: renesas: Add support for Renesas RZ/N1 GPIO
 Interrupt Multiplexer
Message-ID: <20251015134839.1b71fe28@bootlin.com>
In-Reply-To: <aNQ7UOniYss92EIS@ninjato>
References: <20250922152640.154092-1-herve.codina@bootlin.com>
	<20250922152640.154092-8-herve.codina@bootlin.com>
	<aNQ7UOniYss92EIS@ninjato>
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

On Wed, 24 Sep 2025 20:41:20 +0200
Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:

> Hi Herve,
> 
> On Mon, Sep 22, 2025 at 05:26:38PM +0200, Herve Codina (Schneider Electric) wrote:
> > On the Renesas RZ/N1 SoC, GPIOs can generate interruptions. Those
> > interruption lines are multiplexed by the GPIO Interrupt Multiplexer in
> > order to map 32 * 3 GPIO interrupt lines to 8 GIC interrupt lines.
> > 
> > The GPIO interrupt multiplexer IP does nothing but select 8 GPIO
> > IRQ lines out of the 96 available to wire them to the GIC input lines.
> > 
> > Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>  
> 
> Thanks for improving the driver and removing the requirement of a fixed
> ordering!
> 
> > +static u32 rzn1_irqmux_output_lines[] = {  
> 
> const?

Yes, will be added in the next iteration.

> 
> > +	103, 104, 105, 106, 107, 108, 109, 110
> > +};  
> 
> ...
> 
> > +	for (i = 0; i < ARRAY_SIZE(rzn1_irqmux_output_lines); i++) {
> > +		if (parent_args->args[1] == rzn1_irqmux_output_lines[i])
> > +			return i;
> > +	}  
> 
> Do we want a check here if the index has already been used in cases of
> an improper 'interrupt-map'? I'd think it would be nice to have but I
> would also not really require it.

Agree, it will be a good improvement.

I will add this check in the next iteration.

> 
> ...
> 
> > +	ret = rzn1_irqmux_setup(dev, np, regs);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "failed to setup mux\n");
> > +
> > +	return 0;  
> 
> Maybe just
> 
> 	return rzn1_irqmux_setup(dev, np, regs);
> 
> The driver core will report a failed probe already.

Yes

> 
> It still works, so:
> 
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

With update planned (new check for already been used indexes), a
re-test will be probably needed.

Best regards,
Hervé

