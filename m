Return-Path: <linux-gpio+bounces-33942-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFjGL4GKvWnY+wIAu9opvQ
	(envelope-from <linux-gpio+bounces-33942-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 18:57:21 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 652042DEFF3
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 18:57:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DAFB63096F87
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 17:53:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3F153D330B;
	Fri, 20 Mar 2026 17:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b="y0o0LBel"
X-Original-To: linux-gpio@vger.kernel.org
Received: from s106b.cyber-folks.pl (s106b.cyber-folks.pl [195.78.66.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217E5282F0B;
	Fri, 20 Mar 2026 17:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.78.66.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774029204; cv=none; b=H+kZfAjgpj8lAA15NNOxQomdvrjUJb+1PutXapDmNeZDL5z/9x63s/lgSkx+cQmncvhGXv/lURrTk+ysvAJg6LiiCmSjlYBxVzd3YvmJPjg9lA3DSviZNhMbbYAE9R0ajVT874bz1Vh9MYymjy7c1+hWC3aHJVCrQmt8vtL/qBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774029204; c=relaxed/simple;
	bh=k9F41jJZIQUEKOrkxHW0L9DgDw5GS92zrvfM2OhHIN0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MKGNk1Wr6/53Ch6kOIqP0NvcyAzscYcXBHUiB7MJPtv6NqAMyxYt5jn+bMUClEPzl/q6lLxo+1Draki96I2XIapWqLzwUeSQEgjuqxIP1NYnKzK8q8Tt1xBquKWq94DZIJKttUemBwpz0YaRFnUQzJ4ZC303hYq2gqZ/49nOPcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl; spf=pass smtp.mailfrom=mmpsystems.pl; dkim=pass (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b=y0o0LBel; arc=none smtp.client-ip=195.78.66.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mmpsystems.pl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=Cc:To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hu8cSIJgaA5j8PHqbuRYeZhxADCzKx/MGE68F0ebP60=; b=y0o0LBeliT117qWt21Q751gxBX
	86ki38Za8pOAyjhtvNRhEpL7OU4chKDBzMUW9B8rZ5/rZ/Fk+vy6lBoPHRJ1Ht9tSUcJkOtdpnYTm
	yQWys42E+pwoynI67fWGnQsdkqWzST9BnJT1rMDkM7WTYtRckiPRyzsgNjaRP2LrPR7rwvpM/FaWL
	hy6WZcDOuZkhwFk4VDV5X0rvl195kQG5MOQsMbYIxEDoRL9fAjcgNgb0yIyYrsofgkEwnG5BHe6ba
	xs2IfNJ+Ajn9vptF7GFZH0xfssYxixO/8iBTQDyrTXMzpmJ5o9ZJZziJbhldo5UtGhlZ+cVCW1HKV
	QZd7eAUw==;
Received: from user-5-173-16-20.play-internet.pl ([5.173.16.20] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1w3e28-00000005NVC-2Qsn;
	Fri, 20 Mar 2026 18:53:16 +0100
From: michal.piekos@mmpsystems.pl
Subject: [PATCH v6 0/2] fix gpiochip_lock_as_irq() failure when pinmux is
 unknown
Date: Fri, 20 Mar 2026 18:52:29 +0100
Message-Id: <20260320-rc2-boot-hang-v6-0-74dca70dd60e@mmpsystems.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAF2JvWkC/33PzWrDMAzA8VcpPk/Dkj8i97T3GDvEsbMalibYI
 ayUvPucnkrIevxL6Ae6ixJzikWcT3eR45JKGq817NtJdJf2+h0hhdqCJFmpJEPuCPw4zrBtgay
 LbLS1ynhRb6Yc+/T78D6/al9Smcd8e/ALbtP/pAVBQmgcBWwbDn34GIap3Moch/I+/YhNW+ilQ
 IBg0PbBM0ln1JGgngTUe0FVQXrNRIiMrTsS9LPg9oKuX2jVUK+bzlvPR4J5KZgqSEesdMtMHvf
 Cuq5/3II5XLYBAAA=
To: Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Andre Przywara <andre.przywara@arm.com>, 
 Michal Piekos <michal.piekos@mmpsystems.pl>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774029161; l=1993;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=k9F41jJZIQUEKOrkxHW0L9DgDw5GS92zrvfM2OhHIN0=;
 b=tP6LpwnW+/Y3yGU0EM7yOx+g/1YMdIZJHyqH/1QfipXfP3mO/GmJtyUD8AnqiqPR+reOxocjt
 PVJRPtmjro3DtbYMtx4+9BZk72GIkp/NaJH4TWuiBPFwteA7cZmDMWC
X-Developer-Key: i=michal.piekos@mmpsystems.pl; a=ed25519;
 pk=Aixyx03If7ZDamiKKN0lsa+0mtA+WjIuIf2ZQVYNBqg=
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[mmpsystems.pl:s=x];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[mmpsystems.pl : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[michal.piekos@mmpsystems.pl,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-33942-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,sholland.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[mmpsystems.pl:-];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.196];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mmpsystems.pl:email,mmpsystems.pl:mid]
X-Rspamd-Queue-Id: 652042DEFF3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Changes in v6:
- Fixed w/s
- Grouped variables in reverse christmas tree
- Link to v5: https://lore.kernel.org/r/20260319-rc2-boot-hang-v5-0-092834a882b1@mmpsystems.pl

Changes in v5:
- Simplified logic checking pinmux layout
- Remove unneded curly braces
- Replace subtraction with one variable
- Fix typo in commit message
- Link to v4: https://lore.kernel.org/r/20260319-rc2-boot-hang-v4-0-4372f47cb6b8@mmpsystems.pl

Changes in v4:
- Fixed check for pinmux disabled value based on pinctrl layout
- Cherry picked
  https://lore.kernel.org/linux-arm-kernel/20250821004232.8134-3-andre.przywara@arm.com/
  to have flags for pinctrl layout recognition
- Link to v3: https://lore.kernel.org/r/20260314-rc2-boot-hang-v3-1-0b48221181a9@mmpsystems.pl

Changes in v3:
- Drop v2 solution which was returning input instead of error when pin
  is not initialized.
- Add checking pinmux configuration in
  sunxi_pinctrl_irq_request_resources() and set pin to input if
  uninitialized
- Link to v2: https://lore.kernel.org/r/20260308-rc2-boot-hang-v2-1-516fdb820953@mmpsystems.pl

Changes in v2:
- Dropped the previous faulty solution which was forcing the axp313 to
  use r_pio as interrupt controller as pointed out by Jernej Škrabec.
- Implemented suggestion from Andrey Skvortsov to return default
  direction as input
- Link to v1: https://lore.kernel.org/r/20260308-rc2-boot-hang-v1-0-d792d1a78dfd@mmpsystems.pl

---
Andre Przywara (1):
      pinctrl: sunxi: pass down flags to pinctrl routines

Michal Piekos (1):
      pinctrl: sunxi: fix gpiochip_lock_as_irq() failure when pinmux is unknown

 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 43 ++++++++++++++++++++++++++---------
 drivers/pinctrl/sunxi/pinctrl-sunxi.h |  4 +++-
 2 files changed, 35 insertions(+), 12 deletions(-)
---
base-commit: 8a30aeb0d1b4e4aaf7f7bae72f20f2ae75385ccb
change-id: 20260308-rc2-boot-hang-269e8546635b

Best regards,
-- 
Michal Piekos <michal.piekos@mmpsystems.pl>


