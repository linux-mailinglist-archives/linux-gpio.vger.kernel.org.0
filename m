Return-Path: <linux-gpio+bounces-26328-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F21BB8588E
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Sep 2025 17:21:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F7AB1891F67
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Sep 2025 15:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F33330EF99;
	Thu, 18 Sep 2025 15:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="S2QRPGDs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D5A30DD29;
	Thu, 18 Sep 2025 15:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758208525; cv=none; b=plbmu9Jbe44J4Y7j00AbLqa8iFN4jy02moRnyOX9dbX11vDpXP6kdFr3o263hGMGmJ5V23QheVSx4ckHa+EmDkFLTnI7NK0YqrknFRxMkDL9eFfYmCGpXVb8bmOkod9Slpyi3LeHb6lYpM6Yt7xTjASqqCTT1QD0VJnEeqgU52s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758208525; c=relaxed/simple;
	bh=ykNt9ik5AHQfEDNEYgj4XVFufl8SXg51nFMFWRD/dvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hPY12ZT7Wtq2yMZDLHqLbB6Vtdv+wWqYWqTun2zsi7sIPG3WTBVxqnZb93S4NpDeKCz+vYOcCDWrFXj6hWsLruV7qOlKeecxrqYO+HxQgDZpcXlI7IZ6KUit3WqvILyvB+QdUZsaJeFahJztIlpKQFF/ut+s1OWyb0YlGGLwVX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=S2QRPGDs; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5D24AC003C9;
	Thu, 18 Sep 2025 15:15:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C20756062C;
	Thu, 18 Sep 2025 15:15:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 91341102F1704;
	Thu, 18 Sep 2025 17:15:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758208518; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bBz84TZkfDLLhPGBTU9pbGWLejx7qAV5GjzUkaLGTDs=;
	b=S2QRPGDsWgskQ9R2aBDQIzYoTJlPbeMnY822QlcaVGz0DjmmLRZ0VT2WDVd3K578tGsiUE
	FZ0lKu0Ji8Kp384+VNLkqxnH0jBCTPyae4nq6WAa4IWP48kntCA/iCwRFJqjutj6t9XjVS
	vlL6gGYJ2i56+CzKuwocDEoamTaSVNKFCCpO3aHeoAXSB+op/bH9j0B1PuJ8OGad/k+QsG
	OHpW2JFvBXFNPNah2LYAcKcOfTsHDg6v+wKtzNASfRZhLPCPvOvriugzKKdfHfFBBAh7J2
	hi2c/ADc0cWTiG8dQScE89zEQo/wecOEhn6iYVysqikg3zeXQnuodwaj9QRFXA==
Date: Thu, 18 Sep 2025 17:15:02 +0200
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
Message-ID: <20250918171502.411c3527@bootlin.com>
In-Reply-To: <20250918-majestic-mockup-0a0e090db0a7@spud>
References: <20250918104009.94754-1-herve.codina@bootlin.com>
	<20250918104009.94754-7-herve.codina@bootlin.com>
	<20250918-majestic-mockup-0a0e090db0a7@spud>
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

On Thu, 18 Sep 2025 16:06:04 +0100
Conor Dooley <conor@kernel.org> wrote:

> On Thu, Sep 18, 2025 at 12:40:04PM +0200, Herve Codina (Schneider Electric) wrote:
> > On the Renesas RZ/N1 SoC, GPIOs can generate interruptions. Those
> > interruption lines are multiplexed by the GPIO Interrupt Multiplexer in
> > order to map 32 * 3 GPIO interrupt lines to 8 GIC interrupt lines.
> > 
> > The GPIO interrupt multiplexer IP does nothing but select 8 GPIO
> > IRQ lines out of the 96 available to wire them to the GIC input lines.
> > 
> > Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
> > ---
> >  .../soc/renesas/renesas,rzn1-gpioirqmux.yaml  | 87 +++++++++++++++++++
> >  1 file changed, 87 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/soc/renesas/renesas,rzn1-gpioirqmux.yaml  
> 
> This is an interrupt controller, please move it to that subdirectory.

Not so sure. It is a nexus node. It routes interrupt signals to the
interrupt controller (interrupt-map) but it is not an interrupt controller
itself.

I am not sure that it should be moved to the interrupt-controller
directory.

> Otherwise,
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Best regards,
Hervé

