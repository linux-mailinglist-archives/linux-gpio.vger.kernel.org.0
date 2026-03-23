Return-Path: <linux-gpio+bounces-34014-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CL1aMNcdwWmTQwQAu9opvQ
	(envelope-from <linux-gpio+bounces-34014-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 12:02:47 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 508D02F0C19
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 12:02:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1EC5E300B5BE
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 11:02:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B75039479D;
	Mon, 23 Mar 2026 11:02:02 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E884D3914F1;
	Mon, 23 Mar 2026 11:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774263721; cv=none; b=akxO6+TZ6n9aQ6oSf6ARklgk0p8ool51iE3+1i2Ma1pJsqMiVRqlaQRvnI/ibVB2wXkTdJCJllGfbqHx3z3fCohF4px9x+X+sYTEwIW8psyd8z0x9aXOJ5cfb+VxQuO62MQyVWN0RRwTD6U8PdbJDRNtGa8dyd+RXoLdvkJ19TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774263721; c=relaxed/simple;
	bh=KGn7ow0sVWPR71bv7k3DKDdIDvhx0C/rXTysye933pY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G+/QrIDxE+k9UL7we3GJUqIzbwV4L7mIXAbOfLHrKJ29cvPOb8z/6/1JkNGFaXPEZEG7tFoylEMtLT+KtG7ozjvHyy5Phg5GFGTbegFMN5Wc2mLmhfibwBsahS70L/PyFTZqkjPF7cvKMcVgHOuuZ92OFmkfuv8J3m89dX3TDG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6EB131516;
	Mon, 23 Mar 2026 04:01:53 -0700 (PDT)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CCB103F73B;
	Mon, 23 Mar 2026 04:01:56 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Michal Piekos <michal.piekos@mmpsystems.pl>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] pinctrl: sunxi: fix A523 GPIO IRQ blunder
Date: Mon, 23 Mar 2026 12:01:46 +0100
Message-ID: <20260323110151.2352832-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,csie.org,gmail.com,sholland.org];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34014-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[andre.przywara@arm.com,linux-gpio@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,arm.com:mid]
X-Rspamd-Queue-Id: 508D02F0C19
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When playing around with an Allwinner A527 board, I noticed that the
GPIO IRQ operation was broken, evident by not working SD card detect
functionality. The GPIO line reflected the CD pin correctly (as shown in
/sys/kernel/debug/gpio), but the core code just wouldn't react to those
changes.
This is admittedly mostly my fault, due to misunderstanding the IRQ
assocication in the original A523 DT submission.

Digging a bit deeper I found three bugs around this whole operation:
1) The A523 was marked as needing the "irq_read_needs_mux" workaround,
   even though this is not true. This itself wouldn't be too critical, if
   not:
2) The irq_read_needs_mux workaround routine assumes that the IRQ mux is
   always using value 0x6, which is not true for newer SoCs (D1, A523).
3) The association between GPIO IRQ banks and their interrupts is
   off-by-one for the A523. Interrupts are triggered, but the wrong ones.

This series fixes all those issues. Due to dependencies between DT and
code this is a bit involved:
- Patch 2/5 drops the irq_read_needs_mux workaround for the non-affected
  SoCs, which fixes one part of the problem by masking bug #2 above.
- Patch 4/5 adds the missing IRQ line for the (non-implemented!) PortA
  GPIO bank to the DT, which corrects the IRQ association.

Those two patches alone are fixing the immediate issue. If people agree,
these should be taken ASAP, I added Fixes: lines for the backports.

However there is more:
- The DT binding only describes 10 IRQs for the A523, so patch 3/5
  corrects that value, to make the new DT pass DT validation.
- The pinctrl code would only expect 10 IRQs, so would now be missing
  the one for the last bank (PortK). Patch 5/5 fixes that number, but
  is more elaborate since it needs now to cater for old DTs carrying
  just 10 interrupts. Not too happy or convinced about that workaround,
  eager to hear about better solutions here. Please note that no board
  so far uses PortK interrupts, so this isn't too criticial right now.
- For good measure, patch 1/5 fixes the workaround to cope with IRQ mux
  values other than 0x6. This is now more robust, not requiring to know
  the IRQ mux value at all, also saving one MMIO read and fixing a
  potential race with other pinctrl mux code.

This applies on top of v7.0-rc5 (really the .get_direction callback
fix[1] merged into v7.0-rc3), plus the two patches from Michal's series[2],
which I assume would be applied shortly.

Please have a look and test, especially on A523/A527/T527 boards!

Cheers,
Andre

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=01e10d0272b9
[2] https://lore.kernel.org/linux-sunxi/20260320-rc2-boot-hang-v6-0-74dca70dd60e@mmpsystems.pl

Andre Przywara (5):
  pinctrl: sunxi: Rework IRQ remuxing to avoid fixed mux value
  pinctrl: sunxi: Remove unneeded IRQ remuxing for some SoCs
  dt-bindings: pinctrl: sun55i-a523: increase IRQ bank number
  arm64: dts: allwinner: a523: Add missing GPIO interrupt
  pinctrl: sunxi: a523: add missing IRQ bank (plus old DT workaround)

 .../allwinner,sun55i-a523-pinctrl.yaml        |  8 ++--
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi |  3 +-
 drivers/pinctrl/sunxi/pinctrl-sun50i-h5.c     |  2 -
 drivers/pinctrl/sunxi/pinctrl-sun50i-h6.c     |  1 -
 drivers/pinctrl/sunxi/pinctrl-sun50i-h616.c   |  1 -
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c |  1 -
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c   |  3 +-
 drivers/pinctrl/sunxi/pinctrl-sunxi.c         | 45 ++++++++++++-------
 drivers/pinctrl/sunxi/pinctrl-sunxi.h         |  1 -
 9 files changed, 37 insertions(+), 28 deletions(-)


base-commit: c369299895a591d96745d6492d4888259b004a9e
prerequisite-patch-id: dcb1e8190ce649778193c3b391f759d4bcba9a28
prerequisite-patch-id: e003cee1830cf260b932fd6503a62270a1930310
-- 
2.43.0


