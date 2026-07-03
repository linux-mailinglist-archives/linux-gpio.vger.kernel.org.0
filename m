Return-Path: <linux-gpio+bounces-39403-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JChOKhS7R2pqeQAAu9opvQ
	(envelope-from <linux-gpio+bounces-39403-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 15:37:24 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C72E702F12
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 15:37:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=PKJdgbvB;
	dmarc=pass (policy=reject) header.from=bootlin.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39403-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39403-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 659503008750
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jul 2026 13:30:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 177B23D566B;
	Fri,  3 Jul 2026 13:30:34 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7E93C9890;
	Fri,  3 Jul 2026 13:30:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783085433; cv=none; b=qfJ1bsWSokJBLDdnCELBukNn7ej36DPg15ivdWsq6xO/WhJ7XJnxjaK0jQSxMe0ir4ZxuCoxBcc+hJFBnJFP85rqPiA2lTbHXPpBQljR/HovA6KBEcpqipjtngjamszntncJ2tCBzgs3LirNGKQG0PnvNqN7ugCuALTZK4ZPl+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783085433; c=relaxed/simple;
	bh=1yGfD2Bn0HIgjtbHahbjnqvrsiBGIr12/iGNAQIsO4E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GTXVLRHcxj+BDhN9P23U8h2BRydNgR2wFNF+GDXwD0RYQF5JEGRDs9X7jl8/z2zFrpnNjd9OilXN2MQHjCMqJjD1DYvZi6Mv3Z35VBp2byK2W3OpxsI9zcDNQEdZqsj6x2Lv5suq9bv9EtrV/AX7gTVNZRW9orVhE+cnowsBG5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=PKJdgbvB; arc=none smtp.client-ip=185.171.202.116
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 61215C49F56;
	Fri,  3 Jul 2026 13:30:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 81ADA60300;
	Fri,  3 Jul 2026 13:30:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8C201104C94BE;
	Fri,  3 Jul 2026 15:30:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783085428; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=5mFtqUYrNt5Jtcz5Xx0Xzx69WhDueky464L1flUsojc=;
	b=PKJdgbvBwLLqmMSoSaXjSkq3tGVHqMcjpjd5puIh6yH03DJX7vw96fFOdAarNP7f+BhGHn
	+9NyGhDJqf2uueK1833RPQDkoYzHmOtLhAF9erYuWoLt6e/H2eRA1cpjoqkzUCarHYbJl2
	BNoHXFDd1X5M+z4/dRUlZ38YcFKsK7NduHk3fXp2uONjAolnyPCH5ulcC+IiQPvkG18mKl
	VPMk//ST+d4Q0zlz5XwGvCiV5dy5OnOp2TNPy44DoT5KEQ55tNTfD4vg1YWVGtsGA4H18l
	zLT98L+qt+ZUUt0rY7Hu726czmiwsF3cb20OnGFHVgoR4A8rIBS87WBmw6C+Yw==
From: Paul Louvel <paul.louvel@bootlin.com>
Subject: [PATCH 00/12] soc: fsl: qe: QE PIC improvement and add support of
 IRQs to QUICC ENGINE GPIOs
Date: Fri, 03 Jul 2026 15:30:08 +0200
Message-Id: <20260703-qe-pic-gpios-v1-0-6c3e706e27dc@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XNTQ6CMBCG4auQrq3pD5TqynsYF7QMMkYptkg0h
 LtbYIO4/JJ53hlIAI8QyDEZiIceA7omDr5LiK2L5goUy7iJYEKxjEv6BNqipdcWXaAslyB0qnh
 WSBJJ66HC95w7X5YdXuYGtpsa00WNoXP+M//r+XS3pBXbpHtOGa2ktiAqJjSkJ+Ncd8dmb92DT
 PFerHm64SJydSgMcK6rMjX/XK55tuEycs1AGW7y0gj5y8dx/ALAq6umOgEAAA==
X-Change-ID: 20260513-qe-pic-gpios-073e284615a3
To: Qiang Zhao <qiang.zhao@nxp.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Paul Louvel <paul.louvel@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, stable@kernel.org, 
 Christophe Leroy <chleroy@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783085423; l=3216;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=1yGfD2Bn0HIgjtbHahbjnqvrsiBGIr12/iGNAQIsO4E=;
 b=t2Y0LBJysR5oFAc3K2X2asCnqDjMttKGixZaUW0InOOvdj8WRyWoVMgiIRfx74m+Uoi1nrRnF
 O217geOIZWNCZVj68BVRyl0OWCN/WB+0HXOC0pdo0xoA6YKiO/eAq+r
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39403-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[nxp.com,kernel.org,linux.ibm.com,ellerman.id.au,gmail.com];
	FORGED_SENDER(0.00)[paul.louvel@bootlin.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:qiang.zhao@nxp.com,m:chleroy@kernel.org,m:tglx@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:paul.louvel@bootlin.com,m:thomas.petazzoni@bootlin.com,m:stable@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[paul.louvel@bootlin.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:dkim,bootlin.com:mid,bootlin.com:from_mime,bootlin.com:url,bootlin.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1C72E702F12

This series modernizes the QUICC Engine Port Interrupt Controller (QE
PIC) driver and adds the ability for QE GPIO pins to generate interrupts
through the QE PIC, completing Christophe Leroy's prior work [1].

Christophe's series was partially merged; patches 4, 6 and 7 did not
make it to mainline.

The series is organized in three parts:

1) Add missing chained_irq_{enter,exit}() calls

   - In a chained handler, the parent controller need to mask and ack
     the interrupt source.

2) DT binding updates

   - Update #interrupt-cells from 1 to 2 in the QE PIC binding so
     consumers can encode the interrupt type (falling-edge or
     both-edges).

   - Convert the QE GPIO binding from freeform text to DT schema.

   - Extend the QE GPIO binding with an interrupt-map (nexus node) that
     maps GPIO lines to parent QE PIC interrupts.  This approach was
     suggested by Rob Herring [2] as an alternative to using compatible
     strings and driver data to specify which pins support interrupts in
     a given bank.

3) QE PIC driver refactoring

   - The QE PIC is a perfect fit to use the generic irq framework
     instead. Perform the necessary changes to the driver to convert it.

   - Minor cleanups.

4) QE GPIO interrupt support

   - Add a to_irq() method to the QE GPIO driver that perform the
     mapping of the GPIO pin to the parent interrupt domain, allowing
     GPIO pins to be used as interrupt sources through the QE PIC via
     gpio_to_irq().

[1] https://lore.kernel.org/all/cover.1758212309.git.christophe.leroy@csgroup.eu/
[2] https://lore.kernel.org/all/20250919152414.GB852815-robh@kernel.org/

Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>

---
Christophe Leroy (1):
      dt-bindings: soc: fsl: qe: Convert QE GPIO to DT schema

Paul Louvel (11):
      soc: fsl: qe: Add chained_irq_{enter,exit}() calls in cascade handler
      dt-bindings: soc: fsl: qe: Set #interrupt-cells to 2 to support interrupt type encoding
      dt-bindings: soc: fsl: qe: Add support of IRQ in QE GPIO
      soc: fsl: qe: Use generic_handle_domain_irq()
      soc: fsl: qe: Iterate over all pending interrupts in cascade handler
      soc: fsl: qe: Handle spurious interrupts
      soc: fsl: qe: Convert to generic IRQ chip
      soc: fsl: qe: Rename irq variable to parent_irq
      soc: fsl: qe: Rename host member to domain in struct qepic_data
      soc: fsl: qe: Remove useless struct member
      soc: fsl: qe: Add support of IRQs in QE GPIO

 .../bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml   | 108 ++++++++++++++++
 .../interrupt-controller/fsl,qe-ports-ic.yaml      |   4 +-
 .../bindings/soc/fsl/cpm_qe/qe/par_io.txt          |  26 +---
 arch/powerpc/platforms/Kconfig                     |   1 +
 drivers/soc/fsl/qe/gpio.c                          |  28 +++-
 drivers/soc/fsl/qe/qe_ports_ic.c                   | 144 +++++++++++++--------
 6 files changed, 232 insertions(+), 79 deletions(-)
---
base-commit: f1b7f9c6e1a7fc549f37cafb48d233c9f7c26adc
change-id: 20260513-qe-pic-gpios-073e284615a3

Best regards,
--  
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


