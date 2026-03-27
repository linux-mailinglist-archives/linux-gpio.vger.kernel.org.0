Return-Path: <linux-gpio+bounces-34260-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GB/RM8ZqxmmkJwUAu9opvQ
	(envelope-from <linux-gpio+bounces-34260-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 12:32:22 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 536FF3437F0
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 12:32:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 57E5C3006F34
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 11:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3130D2571BE;
	Fri, 27 Mar 2026 11:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="BnWLeM3N"
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A93713E51C9;
	Fri, 27 Mar 2026 11:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774611019; cv=none; b=YmjbQdGJXCzwsoXNs50CWjD7fBRyIk13CNNldNjX0gwg+3iCvsEWsPSdxgOeuCL0ATEBZKDNHues6xyHJUdKyNcpA9meZJCjIQpgFaZdrj05n1rrhPqxq3aGn1CALOMBXLZ8fw+yfX0vguNyJAwto8o0hDZdCR7YnNDQs7/AY4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774611019; c=relaxed/simple;
	bh=MMb9BnVpjNbWZz9tCergxLjjgMHGFtK7m0OvUVEMGrM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bGcVSgYYn7b0fw3RLUvHUMUfeCGLLiptlML6DslBHdOtf5sLjl5F3FCfJrSqRM97kNWnz53BzS7w52Jt9Tvxow0IpXSVffJGsTaXodRFu0kg0Cuqk/5JucOKafjUO7Q9LoQHCmNnNkfDJ6QwhHJB84n9c4Ih+9dHMoWRr8v4Lv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=BnWLeM3N; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B9F0F359D;
	Fri, 27 Mar 2026 04:30:08 -0700 (PDT)
Received: from e142021.cambridge.arm.com (e142021.arm.com [10.1.36.137])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0F5693F915;
	Fri, 27 Mar 2026 04:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774611014; bh=MMb9BnVpjNbWZz9tCergxLjjgMHGFtK7m0OvUVEMGrM=;
	h=From:To:Cc:Subject:Date:From;
	b=BnWLeM3Nh8OnJQBZPCMX27PzeF5hJTWwdA863sFdQWdr/tEn+99Sk8wMGNJAuiFtv
	 mjEVIexjfBXmPQvRjQd8PMofU96qQmTL+06Hs85K0o9UaCnA5IrJ+sVZB82EbJnCGA
	 MP+GN0HXZ7iz7MBqQ6s6pB3Syf6rnojVvJcqp1P4=
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] pinctrl: sunxi: a523: fix GPIO IRQ operation
Date: Fri, 27 Mar 2026 11:30:03 +0000
Message-ID: <20260327113006.3135663-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,sholland.org];
	TAGGED_FROM(0.00)[bounces-34260-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andre.przywara@arm.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,arm.com:dkim,arm.com:mid]
X-Rspamd-Queue-Id: 536FF3437F0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

this is the minimal fix version for the GPIO IRQ operation on the
Allwinner A523/A527/T527 SoCs. SD card detection is broken as a result,
which is a major annoyance. Those patches here fix that problem, and
should go into v7.0 still, if possible.
I dropped the more involved fixes from v1, the risk for regressions is
now very low:
- The quirk flag is just dropped from the A523, not the other SoCs. I
  confirmed this again with an experiment, for both the primary and
  secondary pincontroller. This avoids fixing the workaround code for
  now, which is more involved, but for now unneeded.
- The DT patch just adds the missing interrupt. The IRQ association was
  always wrong and never worked, so this can't make it possibly worse.
Together those two patches (plus the required binding change) fix the
problem, I would appreciate if this could be taken ASAP, into v7.0 still.
The generic pinctrl code is now untouched, which makes this also much
easier to backport, and drops the dependencies on other v7.0-rc fixes.

Bases on v7.0-rc1, but applies on later revisions as well.

Please have a look and test, especially on A523/A527/T527 boards!

Changelog v1 .. v2:
- drop generic pinctrl fixes (for now)
- drop quirk removal from other SoCs (for now)
- add Chen-Yu's tag

Cheers,
Andre

Andre Przywara (3):
  pinctrl: sunxi: a523: Remove unneeded IRQ remuxing flag
  dt-bindings: pinctrl: sun55i-a523: increase IRQ banks number
  arm64: dts: allwinner: a523: Add missing GPIO interrupt

 .../bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml   | 8 ++++----
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi            | 3 ++-
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c             | 1 -
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c               | 1 -
 4 files changed, 6 insertions(+), 7 deletions(-)

base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
-- 
2.43.0


