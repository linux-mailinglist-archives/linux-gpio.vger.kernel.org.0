Return-Path: <linux-gpio+bounces-31649-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIKHK03ejmlSFgEAu9opvQ
	(envelope-from <linux-gpio+bounces-31649-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 09:18:21 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4624133E75
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 09:18:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 66E8C3014886
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 08:18:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A8213161A2;
	Fri, 13 Feb 2026 08:18:06 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FAA29D269;
	Fri, 13 Feb 2026 08:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770970686; cv=none; b=NgQl+8T4RiAdRpgsC4uTiYyrVFGnNaCJrbmc2qpG6eAc/n4LZY8ZoTnoCGT5nclzIjOM0HoFZUvpY7OzPMgUIRt+6XVbQ/XMf5RHgq0NhDYh8WFke7fMjZcVvRDPXD2WBVE58iBTDCYwlC1ffAaAyMwqcu3vESgMEZoPhF+8jm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770970686; c=relaxed/simple;
	bh=GyucnYRddM+KPEwtfmXcesurg0IS8btBZhDNqZcs91M=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=BC2UziZeQzgsaMvFHhI78zuxHeR6zzUFjzhqF0OPZdidnfUq5101TVMMiPR38+7AprQo3Xka0Ldi9b0e8ABz/h4o0XpGN1xG83GUZVTXc9uo9EImoK4xrSXCGrkhpiF/kqhNjhw7buBxS+uMev6g5v4wvIe/zehd4A5ddphZC2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 13 Feb
 2026 16:17:55 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 13 Feb 2026 16:17:55 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: [PATCH RFC 0/2] pinctrl: add syscon-backed packed-field pinctrl
 driver and DT bindings
Date: Fri, 13 Feb 2026 16:17:41 +0800
Message-ID: <20260213-pinctrl-single-bit-v1-0-c60f2fb80efb@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACXejmkC/x3MwQpAQBCA4VfRnE3ZEeGqPICrHNgdTGlpV1Lad
 7c5fof/f8GzE/bQJC84vsXLYSNUmoDeJrsyiokGyqjMSCk8xerL7ejFrjvjLBeaiVS+UEW6LiC
 Gp+NFnn86QN+1MIbwAdRy5kxpAAAA
X-Change-ID: 20260211-pinctrl-single-bit-da213f282c95
To: Linus Walleij <linusw@kernel.org>, Tony Lindgren <tony@atomide.com>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@codeconstruct.com.au>, Bartosz Golaszewski <brgl@kernel.org>
CC: <patrickw3@meta.com>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<BMC-SW@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770970675; l=2131;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=GyucnYRddM+KPEwtfmXcesurg0IS8btBZhDNqZcs91M=;
 b=wnr8PkYCiaj6qIxDNo2bobprHQFZzxKZe4ITj4bP2A7etp7tWDxgaI1FFV0ZkCF8v/Mzh9EvQ
 i9jFMJZ6T+wBt80YTsSiVUTiqGAEBSJYEh8C4XVx4HGcMDlWw2KJ+jV
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[aspeedtech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[billy_tsai@aspeedtech.com,linux-gpio@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31649-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: D4624133E75
X-Rspamd-Action: no action

This work follows earlier review discussions around extending
pinctrl-single for bit-per-mux / packed-field controllers. Based on
feedback from Linus Walleij and Tony Lindgren, the direction was changed
towards introducing a separate targeted driver instead of further
increasing the complexity of pinctrl-single.

The prior pinctrl-single series is at:
https://lore.kernel.org/all/20260123-upstream_pinctrl_single-v2-0-40f8063cc5a2@aspeedtech.com/

This series is a replacement of that approach., targeted pinctrl driver
for controllers where pinmux and/or pin configuration are represented as
fixed-width fields packed sequentially within shared registers
(packed-field / bit-per-pin style controllers).

Although pinctrl-single contains support for some bit-per-mux use cases,
it was originally designed around direct MMIO ownership and has grown
in complexity over time. For SoCs where the pin controller lives inside
a larger SCU/syscon register block, using syscon + regmap-mmio provides
a clearer ownership model and naturally avoids MMIO resource conflicts.

The new driver is designed to be instantiated as a subnode of a syscon
device (e.g. SCU). It obtains a regmap from the parent and uses the
child node 'reg' as a window into the syscon register space.

This series includes:
  1. A generic Devicetree binding for packed-field pin controllers.
  2. The new pinctrl-packed driver (derived from pinctrl-single).

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
Billy Tsai (2):
      dt-bindings: pinctrl: Add pinctrl-packed
      pinctrl: add syscon-backed packed-field pin controller driver

 .../bindings/pinctrl/pinctrl-packed.yaml           |  166 +++
 drivers/pinctrl/Kconfig                            |   13 +
 drivers/pinctrl/Makefile                           |    1 +
 drivers/pinctrl/pinctrl-packed.c                   | 1168 ++++++++++++++++++++
 4 files changed, 1348 insertions(+)
---
base-commit: ea24857a76ad90632f86f1e8c8465f96c9f2e407
change-id: 20260211-pinctrl-single-bit-da213f282c95

Best regards,
-- 
Billy Tsai <billy_tsai@aspeedtech.com>


