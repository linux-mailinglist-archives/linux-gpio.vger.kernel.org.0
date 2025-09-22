Return-Path: <linux-gpio+bounces-26456-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A57B919DB
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 16:16:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FECD423694
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 14:16:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AF5E1DFE09;
	Mon, 22 Sep 2025 14:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="konAnS3U"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A911DE3AC;
	Mon, 22 Sep 2025 14:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758550610; cv=none; b=kIlGbLaHmn72dYv+nrWSVQVcr7eqlx3o5VTmxVrtTyVFDX8weoxIRrmwIufPMtIXaPIuzlX6A+5xr3sUiMOd0C/prBl9GI0EOCYUJ/9z+oyhLhBCvXS0EuqL4dP6cJijJhQS01XsHd3e+OC6sETA7pb7w8DuRRlM7yf4bWPPH8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758550610; c=relaxed/simple;
	bh=uNppTuam3Us42pG36glkkl2XG4QsQhRzg9RzTUlo9+I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Gj4vvLuaM/sFBWbc6/3zuREfrMjt9xvoK85DbMND+QesonC34ZGtpEiSNvME29NuPL9Afb7acgjZMKD8KbZXQSGEGNPn7xIbzUP/jSQitdXgQNg12AvxCn7aD+wAEf2BO1b7bUIHjZ/b7EIyiQBwLAGW63hwk+4nojdNocUyCzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=konAnS3U; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9B2884E40D20;
	Mon, 22 Sep 2025 14:16:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 520D660634;
	Mon, 22 Sep 2025 14:16:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8DE15102F1929;
	Mon, 22 Sep 2025 16:16:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758550598; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Jebq9t143raDKfgvx6YsnmKGCNR8DfJDEIED3irNcJk=;
	b=konAnS3UHmYMPEtgcRx33Q19DB+JYfmTijrplkBupkL7pfdxJ7kFVVY6/Qhv/0/ZJDSBSM
	yG93VSXZJ570DGEnaoGO7PAkI8d7Tfd6q0qNty8TrWf5hV7YYxvl5O5GgkZpuovxa7VMQ0
	GK6RsUToXHHQrFvu4zRzFCQV2grW6VYh53vC4ypvmgnXd5AyUJRLe+c766IH3USzhjoyp5
	yNr3EkPzDbpHXdvFGdf8y2e5llHMMT0yqLCbgxGwT2N6rQ5INF31NGF8ziILh3TNHA2d4Z
	prw9+SYKXJs689jNZI1Qt0cPApV3gd0xePEAMadsx+mxnmt8YIv97Hl/Wphnpg==
Date: Mon, 22 Sep 2025 16:16:20 +0200
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
Message-ID: <20250922161620.03fa8d8e@bootlin.com>
In-Reply-To: <20250919191211.0ed4c976@bootlin.com>
References: <20250918104009.94754-1-herve.codina@bootlin.com>
	<20250918104009.94754-9-herve.codina@bootlin.com>
	<aM0llhn054OI9rA8@ninjato>
	<20250919155910.4d106256@bootlin.com>
	<aM1rgY9CCF54c_Pg@shikoro>
	<20250919191211.0ed4c976@bootlin.com>
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

On Fri, 19 Sep 2025 19:12:11 +0200
Herve Codina <herve.codina@bootlin.com> wrote:

> On Fri, 19 Sep 2025 16:41:05 +0200
> Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:
> 
> > > 'interrupt-map' is a required property. If the board doesn't use any interrupt
> > > GPIO, its dts has no reason to set the interrupt-map.    
> > 
> > Why is 'interrupt-map' then a required property? Can we drop it from the
> > requirements?
> >   
> 
> I need to check in details but 'interrupt-map' should be kept required.
> Indeed, irq-mux needs this property to work. It is not an optional one.
> 
> I need to look at the 'make CHECK_DTBS=y' behavior when required property is
> missing in a not enabled node (node with status = "disabled").
> 
> Also, got some:
>    Warning (interrupts_property): /soc/interrupt-controller@51000480: Missing interrupt-controller or interrupt-map property
> 
> This could be due to the presence of #interrupt-cells or the node name (not
> sure). As I need to rename the node (Conor's comment), I will see if the
> warning disappear. If the warning is due to #interrupt-cells, I don't think
> that removing #interrupt-cells is the right solution to avoid the warning.
> 
> That's said, I need to perform some local tries. I will keep you informed.
> 

If I remove the 'interrupt-map', I still have warnings from DTC:
  r9a06g032.dtsi:647.45-664.5: Warning (interrupts_property): /soc/interrupt-controller@51000480: Missing interrupt-controller or interrupt-map property
  r9a06g032.dtsi:647.45-664.5: Warning (interrupts_property): /soc/interrupt-controller@51000480: Missing interrupt-controller or interrupt-map property
  r9a06g032.dtsi:647.45-664.5: Warning (interrupts_property): /soc/interrupt-controller@51000480: Missing interrupt-controller or interrupt-map property
  r9a06g032.dtsi:647.45-664.5: Warning (interrupt_provider): /soc/interrupt-controller@51000480: '#interrupt-cells' found, but node is not an interrupt provider
  r9a06g032-rzn1d400-eb.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'

Indeed, the irq-mux node is referenced (interrupt-parent) in the gpio nodes.
DTC checks that in that case irq-mux is correctly set. It has to be either
an interrupt controller ('interrupt-controller' property) or a interrupt
nexus node ('interrupt-map' property).

If I remove, the 'interrupt-map' property, DTC is not happy.

Also in that case, my node has '#interrupt-cells' set without being an
interrupt controller of a interrupt nexus node and this leads to a warning too.

The only way to avoid warnings is to fully remove the irq-mux node and related
references available in gpio nodes.

IHMO, I think we can leave with a reduce 'interrupt-map' array set in the irq-mux
node in r9a06g032.dtsi file such as follow.
--- 8< ---
	interrupt-controller@51000480 {
		compatible = "renesas,r9a06g032-gpioirqmux", "renesas,rzn1-gpioirqmux";
		reg = <0x51000480 0x20>;
		#interrupt-cells = <1>;
		#address-cells = <0>;
		interrupt-map-mask = <0x7f>;

		/*
		 * interrupt-map has to be updated according to GPIO
		 * usage. The src irq (0 field) has to be updated with
		 * the needed GPIO interrupt number.
		 * More items can be added (up to 8). Those items must
		 * define a GIC SPI interrupt in the range 103 to 110.
		 */
		interrupt-map = <0 &gic GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;

		status = "disabled";
	};
--- 8< ---

Could this modification be ok on your side?

Best regards,
Hervé

