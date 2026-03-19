Return-Path: <linux-gpio+bounces-33843-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gCnuDWIxvGnxuQIAu9opvQ
	(envelope-from <linux-gpio+bounces-33843-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 18:24:50 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 944002CFE83
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 18:24:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 54A00319A608
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 17:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0BDD30FC1E;
	Thu, 19 Mar 2026 17:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b="NWGxTAcd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from s106b.cyber-folks.pl (s106b.cyber-folks.pl [195.78.66.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DD22750E6;
	Thu, 19 Mar 2026 17:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.78.66.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773940750; cv=none; b=oLPCsr6+YHKdMwl6Dt6s+cbqLoo0vR4o0eNQbiay4+9gDIQonNZGXiAPn6fIBO5vkvlWg41MBlNhAxj1+cLFii5zcMaCQUGqWVERMtY/fcj/hSQ/vm6v2Tfk271EHP1OQy+1CinSOeoO/9e7mVoLyeif9luCJEoGdNQyg0GkNB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773940750; c=relaxed/simple;
	bh=BLMwvRHUCJBf2SLh4bB60WcZTkJkyLDetQMOjzc0K/E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Jd6seAs/nnz8MXWgaaGCS/f35lsZP4xL2EFWzNlDPdILQgOTEgwkQOkdxnuiWQRKxt33hpTpZqRldnOGRq2Z6RYoR05FZhqY/UcXSEjYBzN6jXM6nvI6UUnsFHEDGgllnRCluo/SetEv0GyGZp9jDcoiNl0R/m8Tl8cPaGPIkNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl; spf=pass smtp.mailfrom=mmpsystems.pl; dkim=pass (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b=NWGxTAcd; arc=none smtp.client-ip=195.78.66.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mmpsystems.pl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=Cc:To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=kUeQmG9FhX/cMcuw0LEztvn1MHuDJz/7nCjsKRvE1IY=; b=NWGxTAcdBwuKuoKi3KG8gMmMKH
	AZt8frgQXPlGDEpODFJgkn621Z4Lx4GJJGO2XVXyysjCjegdRbygla8ahEXTQNRXDQrsx95sP75dC
	us5NRdHbVh4ctamVtzZ8xuqyRU+Y8ZqAc3KPkAFHwKkmFlQ8ry7Uvs0N+NuVSP1NLHjj7RXAIw9eg
	H4UhOaJ1EF8EwR/ue3rLbipdXOEFhYlkiQ2kHJSIdIMp9vUs1tIfP6RoRy0Hv/exc+J4bSjsvgYTH
	GG9hawNGxBpkAKiJkzeGgjOrPHM1a1o+iaIHipVsQZOt9FbHUmM34Ksi737ig45rn4Vn7Fep+ns3k
	nq4hYp+Q==;
Received: from user-5-173-16-20.play-internet.pl ([5.173.16.20] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1w3H1U-0000000HLyQ-0q68;
	Thu, 19 Mar 2026 18:19:04 +0100
From: michal.piekos@mmpsystems.pl
Subject: [PATCH v5 0/2] fix gpiochip_lock_as_irq() failure when pinmux is
 unknown
Date: Thu, 19 Mar 2026 18:19:01 +0100
Message-Id: <20260319-rc2-boot-hang-v5-0-092834a882b1@mmpsystems.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAUwvGkC/33PzQrCMAzA8VeRno006cdaT76HeFjXTgvOjXYMR
 fbudp5kqMd/Qn6QJ8shxZDZfvNkKUwxx/5WQm03rLnUt3OA6Esz4qS54AZSQ+D6foRlC6RtMEp
 qLZRj5WZIoY33t3c8lb7EPPbp8eYnXKa/pAmBg68seawr41t/6LohP/IYurwbrmzRJvorECAo1
 K13hrhV4psgPgSUa0EUgTtpiBAN1vabID8FuxZk+UKKilpZNU47sxbmeX4BVXane3QBAAA=
To: Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Andre Przywara <andre.przywara@arm.com>, 
 Michal Piekos <michal.piekos@mmpsystems.pl>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773940742; l=1819;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=BLMwvRHUCJBf2SLh4bB60WcZTkJkyLDetQMOjzc0K/E=;
 b=aG/Y+Jn2VL5c5JIfCQWW0pJSq5pjWBFV3ZLTNmBCI1toiwJIJrrp1x6n+BQTczIcsuw1qrF4w
 qOkznbs3uNPAg40T3YPxsLyIauBRritHvgRTfleNW1g8+ZhQ1VbPqn8
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
	TAGGED_FROM(0.00)[bounces-33843-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,sholland.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[mmpsystems.pl:-];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.174];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mmpsystems.pl:email,mmpsystems.pl:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 944002CFE83
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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

 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 44 ++++++++++++++++++++++++++---------
 drivers/pinctrl/sunxi/pinctrl-sunxi.h |  4 +++-
 2 files changed, 36 insertions(+), 12 deletions(-)
---
base-commit: 8a30aeb0d1b4e4aaf7f7bae72f20f2ae75385ccb
change-id: 20260308-rc2-boot-hang-269e8546635b

Best regards,
-- 
Michal Piekos <michal.piekos@mmpsystems.pl>


