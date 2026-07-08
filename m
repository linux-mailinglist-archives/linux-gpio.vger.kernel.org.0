Return-Path: <linux-gpio+bounces-39643-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id M7vkAoomTmqsEAIAu9opvQ
	(envelope-from <linux-gpio+bounces-39643-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 12:29:30 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E71B72454D
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 12:29:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=jlFd1uYn;
	dmarc=pass (policy=reject) header.from=bootlin.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39643-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39643-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC7C7313C4D0
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2026 10:16:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E47173A8741;
	Wed,  8 Jul 2026 10:15:51 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC9739A05C
	for <linux-gpio@vger.kernel.org>; Wed,  8 Jul 2026 10:15:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783505751; cv=none; b=FeyxVHSg/idp9AtnEk9cElx/8HjnMuvCztzhk++YBHeK6YTmJuY4AydLmG3VqS3FshpQTnvAJ30Bzpbi3ScHHV9ykKv804iJ5xCR0A4PBNZE6Wh0tLcl+DLW/Z8F8L1CxShMcmd0nouHFq9659z96vCQAQicK7BnLbFaNp2hi40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783505751; c=relaxed/simple;
	bh=3mw24PdZ/MnLAdgaavO1HCjV8HURiuVJHNRuMIows9s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VwnaijsEjvTpKh//5sE6aVc20M7NxpLejvfXcwLQazuSgxNJMevzyB74A4DMfMSA1Yf17nWETtV+zXO7kkmxQsLiJIlF8JAq7+9a1ZNPDXMNGaUjvWZNkxtZlyKxbfZIk0bTrA8/LyXy7wM09CNWaxizji2gNMETddBb4sAD+lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jlFd1uYn; arc=none smtp.client-ip=185.171.202.116
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3270FC8F448;
	Wed,  8 Jul 2026 10:16:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 47BE760337;
	Wed,  8 Jul 2026 10:15:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EFF6711BC3422;
	Wed,  8 Jul 2026 12:15:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783505745; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=vAvPgJKH8E5PMa+rzxmboQbVEpCqkKMOdwuf26Tm0K8=;
	b=jlFd1uYn2yV2CPBYgVByiNDZQVn+1Kpebd2p4SHFTj/6APevVxQac56sRg/ftHrvki0SEk
	TPL0Vm8+WFLZJ/9LRiQcWKjwwV8MXGDrrN2uJUQzLeOXI4Sa2niDSKYsa04pTn5CIMUoD0
	KyFhOHEOcIzvJK+2+p9NigRBDv1pMDuC/O1TZGyKiHWXyHtTD6+tj0tbCHWvdKY1dVXdNA
	m5yfzIufseA2G4jO+M1T08/49wubZ37ZJtZY8uzqnSqGB1zKoxWCrpuVdxZJfCNcPYZKCc
	bmOrBuoLbYuI+hGHHB6L8fgLDpLAyMR4uv1TYZg38DPmwPnTS+cHUQ3HBLm3pA==
From: Paul Louvel <paul.louvel@bootlin.com>
Subject: [PATCH v2 00/10] soc: fsl: qe: QE PIC improvement and add support
 of IRQs to QUICC ENGINE GPIOs
Date: Wed, 08 Jul 2026 12:15:13 +0200
Message-Id: <20260708-qe-pic-gpios-v2-0-1972044cfbd1@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23OQQ6CMBAF0KuYrq1pp9BWV97DuKBl0DFKkSLRG
 O4uxY2iy5/M+3+eLGJLGNlm8WQt9hQp1GOA5YL5Y1EfkFM5ZgYCtMil4lfkDXl+aChELoxCsJm
 WeaHYSJoWK7pPdbv9O8ebO6HvUke6OFLsQvuY9nqZ7t7VWsyqe8kFr5T1CJUAi9nWhdCdqV75c
 ElNEzN/mfYKjdAIpvRfLP3Uw+dqNuOQ+LpwKKWtysz9cvXJ8xlXI7cCtZPOlA7UNx+G4QWo3SB
 mcQEAAA==
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
 Herve Codina <herve.codina@bootlin.com>, stable@kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Christophe Leroy <chleroy@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783505738; l=4530;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=3mw24PdZ/MnLAdgaavO1HCjV8HURiuVJHNRuMIows9s=;
 b=pdrtt4GhhaY6xcboT+i0fyq42dyNHqHy5xcjYiq0zPAb3adp1yM5GcBdpgFU3U49Vj4rHUtvJ
 kK9jcVgfRkGDRqsTyU6D3iVuO+6kFpBIrtSULIyzkr4pYqa6fna31Ta
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
	TAGGED_FROM(0.00)[bounces-39643-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[nxp.com,kernel.org,linux.ibm.com,ellerman.id.au,gmail.com];
	FORGED_SENDER(0.00)[paul.louvel@bootlin.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_RECIPIENTS(0.00)[m:qiang.zhao@nxp.com,m:chleroy@kernel.org,m:tglx@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:paul.louvel@bootlin.com,m:herve.codina@bootlin.com,m:stable@kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:dkim,bootlin.com:mid,bootlin.com:from_mime,bootlin.com:url,bootlin.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3E71B72454D

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
Changes in v2:
- Applied Christophe two patches before this series [3] [4].
- Fix a miscalculation in patch 6 when iterating over bits set in
  CEPIER. Old ffs() is 1-indexed, but for_each_set_bit() is 0-indexed.
- Add in patch 3 commit message more info about the changes introduced
  by the conversion to DT schema.
- In patch 4, keep the existing example without any IRQ supports, and
  add only one new example. Also fix the DTS coding style that was wrong.
- Add raw spinlock guard to mask and unmasking hook since multiple CPUs
  can modify different IRQs concurrently. Also add it to set_type hook.
- Drop usage of register offset in irq_chip_type. It requires additional
  load instruction with no real benefit since irq_gc_* functions are not
  used.
- A race condition can occurs if an interrupt fires immediately after
  the domain is initialised, because gc is NULL.
  Instead, do not carry gc in the struct qepic_data. Add the domain in
  the handler data, and retrieve gc with irq_data_get_irq_chip_data() in
  hook functions.
  Because of this modification, patch 10 and 11 are dropped.
- Link to v1: https://patch.msgid.link/20260703-qe-pic-gpios-v1-0-6c3e706e27dc@bootlin.com

[3] https://lore.kernel.org/all/b08f76c1d8ff864774246f1e2c2158c223c001be.1783435914.git.chleroy@kernel.org/
[4] https://lore.kernel.org/all/cd46aec4b325745d38ac7992e4d3d5b4f4c4e95f.1783435914.git.chleroy@kernel.org/

---
Christophe Leroy (1):
      dt-bindings: soc: fsl: qe: Convert QE GPIO to DT schema

Paul Louvel (9):
      soc: fsl: qe: Add chained_irq_{enter,exit}() calls in cascade handler
      dt-bindings: soc: fsl: qe: Set #interrupt-cells to 2 to support interrupt type encoding
      dt-bindings: soc: fsl: qe: Add support of IRQ in QE GPIO
      soc: fsl: qe: Use generic_handle_domain_irq()
      soc: fsl: qe: Iterate over all pending interrupts in cascade handler
      soc: fsl: qe: Handle spurious interrupts
      soc: fsl: qe: Convert to generic IRQ chip
      soc: fsl: qe: Rename irq variable to parent_irq
      soc: fsl: qe: Add support of IRQs in QE GPIO

 .../bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml   |  84 ++++++++++++
 .../interrupt-controller/fsl,qe-ports-ic.yaml      |   4 +-
 .../bindings/soc/fsl/cpm_qe/qe/par_io.txt          |  26 +---
 drivers/soc/fsl/qe/Kconfig                         |   1 +
 drivers/soc/fsl/qe/gpio.c                          |  28 +++-
 drivers/soc/fsl/qe/qe_ports_ic.c                   | 145 +++++++++++++--------
 6 files changed, 208 insertions(+), 80 deletions(-)
---
base-commit: c34b47a17bc566c7113679e6ae095d5510b4f1c6
change-id: 20260513-qe-pic-gpios-073e284615a3

Best regards,
--  
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


