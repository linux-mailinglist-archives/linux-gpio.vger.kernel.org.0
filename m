Return-Path: <linux-gpio+bounces-33832-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id COuhFb0ivGnQswIAu9opvQ
	(envelope-from <linux-gpio+bounces-33832-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 17:22:21 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3822CEB53
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 17:22:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F93F31C9488
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 16:10:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12B163E0C65;
	Thu, 19 Mar 2026 16:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b="mKnlwfOR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from s106b.cyber-folks.pl (s106b.cyber-folks.pl [195.78.66.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84603E95B4;
	Thu, 19 Mar 2026 16:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.78.66.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773936616; cv=none; b=OSzcsYdo31gmX86B/Hc5mrzP/VPBOb+AH+Hm9BSh2g0DYd+ufL3gy89GWzxKiTkOGQCRrtWexx/6CqD9WdhEln6GZXS0TFOQyDHgGZJunYEiw76CGOMeZzIxm/vUCfvyWqXAL1jBjvN8yUtIlZ1qp8+q2hD9whO/j6lPaCEADFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773936616; c=relaxed/simple;
	bh=X618LDl6oihfX9XvQfeP5YEB9hQhTmC8j8fHXX3AuYI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rMlgVnRS9tRaVV/UE1ZWoXRMjIasSy9lAL2HdU93PSfDBoK+qGBy05XQPUlwEbu3ttgOqlK6Bb7OynL4Gyd2eBIxtFEOArPoewEMn+Lzs/Num3nIJapeKSliJ6ghDnqipCddRIFZ1Ky12BacZZAdIz+dRjSgoK7ks0Pmo1x6gtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl; spf=pass smtp.mailfrom=mmpsystems.pl; dkim=pass (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b=mKnlwfOR; arc=none smtp.client-ip=195.78.66.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mmpsystems.pl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=Cc:To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=i6aCP6zJnJx4EQRslaN4d0mkrrJwIP99Qrq0hsBKi0A=; b=mKnlwfORvzbytI2ytPJx7RMdUC
	XvK1bD+3WbrsFGFNHgkPK6sE8xC1WIMx+C2AHgaeVEdkIudvpcicF8MdJ7QsviFqis+kPR7JHuqkg
	5qC7ewXqcYgb2w829lcQy5Nez3W24HuzDuDXasupjDNMqHWhfSdoXNlVvN8MQUVw/VaFFzinsG3gy
	GFy4SYbcZ4zsSXrH+Zht3D9StQuWxdt/Qr9VLuTnrUr/heCxVfEbekJ5L0jDz20LT1gXkFTjeIiwC
	Ghw+e4PLFtOo9S8BnhRdF5uhRuQItSHHI+p018K/MC2YOLxmoNNHpbcfoh7JOI2AZ/B8KpYB2CVUV
	+5jz+ncA==;
Received: from user-5-173-16-20.play-internet.pl ([5.173.16.20] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1w3Fwl-0000000FeN1-2qWE;
	Thu, 19 Mar 2026 17:10:07 +0100
From: michal.piekos@mmpsystems.pl
Subject: [PATCH v4 0/2] fix gpiochip_lock_as_irq() failure when pinmux is
 unknown
Date: Thu, 19 Mar 2026 17:09:53 +0100
Message-Id: <20260319-rc2-boot-hang-v4-0-4372f47cb6b8@mmpsystems.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIANEfvGkC/33MQQ6CMBCF4auQrh3TmUIprryHcQG0SBOhpCVEQ
 ri7hZUh6vKfyfsWFoy3JrBLsjBvJhus62Okp4TVbdk/DFgdmxEnyQVX4GuCyrkRti+QLIzKUil
 FVrG4Gbxp7Gv3bvfYrQ2j8/POT7hdf0kTAgedF6SxzJVu9LXrhjCH0XThPDzZpk30VyBAyFA2u
 lLEi0x8E8SHgOlREFHgVaqIEBWWxVFY1/UNHAGO2jIBAAA=
To: Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Andre Przywara <andre.przywara@arm.com>, 
 Michal Piekos <michal.piekos@mmpsystems.pl>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773936605; l=1560;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=X618LDl6oihfX9XvQfeP5YEB9hQhTmC8j8fHXX3AuYI=;
 b=cU8/br0AMSP7o0y3wIRzsTF1nxXOjKMspUymQr054KgmdUNiCkej+d6KbcyM8KJ9IlX3G0x50
 YL/2ORoflzCAo5lSAajvTKpi+4A15qSzl/01lM1loxquJpMDvsXcdp9
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
	TAGGED_FROM(0.00)[bounces-33832-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,sholland.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[mmpsystems.pl:-];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.279];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mmpsystems.pl:email,mmpsystems.pl:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EC3822CEB53
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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

 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 42 +++++++++++++++++++++++++++--------
 drivers/pinctrl/sunxi/pinctrl-sunxi.h |  4 +++-
 2 files changed, 36 insertions(+), 10 deletions(-)
---
base-commit: 8a30aeb0d1b4e4aaf7f7bae72f20f2ae75385ccb
change-id: 20260308-rc2-boot-hang-269e8546635b

Best regards,
-- 
Michal Piekos <michal.piekos@mmpsystems.pl>


