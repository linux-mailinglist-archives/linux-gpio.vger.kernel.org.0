Return-Path: <linux-gpio+bounces-30682-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B1DD38E1B
	for <lists+linux-gpio@lfdr.de>; Sat, 17 Jan 2026 12:17:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 66F09301B801
	for <lists+linux-gpio@lfdr.de>; Sat, 17 Jan 2026 11:17:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6B5C31C576;
	Sat, 17 Jan 2026 11:17:27 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF75830DD00;
	Sat, 17 Jan 2026 11:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768648647; cv=none; b=hrwj5NA1JvasuODaIWPqIzMAYr2VAzooLJ3AltnQIauQlvjWh3eg6D5KCOVRWtIKiWQX7Wojr9omCFyzN/+AmNoGmVUvfrY/8CQceLWhbOOQYSK1H8RqM88d6wM0auSWpKqWa12PI7yV2K/284LkUZRVT6OF/Qe/UsMse3mm+is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768648647; c=relaxed/simple;
	bh=syKloVSJGr/1yuFRDdDYloNrIqJLgRzrsOb/bxn/5bY=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=XsjoMdIuqPNMKznaKRdgcc4ulVUqE0+W30WdeTdU6GN66Gzy4TJmva/Nts1I6bHWTz92O5N0Z7/NPijQOluX7xzes0aqBcosSH7kax/DCaoa1qYj8V7LnYX2dGF0uAIW0r8E1zvzZn9+sQkUhMaPjYrZOQ9F0E+WbsH1oaZ7x7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Sat, 17 Jan
 2026 19:17:17 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Sat, 17 Jan 2026 19:17:17 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: [PATCH 0/5] Add Aspeed G7 sgpio support
Date: Sat, 17 Jan 2026 19:17:07 +0800
Message-ID: <20260117-upstream_sgpio-v1-0-850ef3ffb680@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALNva2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDIyNj3dKC4pKi1MTc+OL0gsx8XXODFAtD02Qzk0RDSyWgpoKi1LTMCrC
 B0bG1tQBUzvydYAAAAA==
X-Change-ID: 20251223-upstream_sgpio-70d815c64a19
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
CC: <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>, "Andrew
 Jeffery" <andrew@aj.id.au>, <devicetree@vger.kernel.org>,
	<bmc-sw@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768648637; l=1293;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=syKloVSJGr/1yuFRDdDYloNrIqJLgRzrsOb/bxn/5bY=;
 b=72wgdRhf4CDRIKM/L9ALE3tUal9GCgSr0Cm0kA96rAZOo2xGE3onq/yk0CwAszlTsr6znYAYR
 z2pPD9SNsdMCltfNKlV45uuE9G7UfKwWHVtooaYXto0ujaarpHgbHY8
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=

The Aspeed 7th generation SoC features two SGPIO master controllers: both
with 256 serial inputs and outputs. The main difference from the previous
generation is that the control logic has been updated to support
per-pin control, allowing each pin to have its own 32-bit register for
configuring value, interrupt type, and more.
This patch serial also add low-level operations (llops) to abstract the
register access for SGPIO registers making it easier to extend the driver
to support different hardware register layouts.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
Billy Tsai (5):
      gpio: aspeed-sgpio: Change the macro to support deferred probe
      gpio: aspeed-sgpio: Remove unused bank name field
      gpio: aspeed-sgpio: Create llops to handle hardware access
      dt-bindings: gpio: aspeed,sgpio: Support ast2700
      gpio: aspeed-sgpio: Support G7 Aspeed sgpiom controller

 .../devicetree/bindings/gpio/aspeed,sgpio.yaml     |   4 +-
 drivers/gpio/gpio-aspeed-sgpio.c                   | 364 +++++++++++++--------
 2 files changed, 228 insertions(+), 140 deletions(-)
---
base-commit: dd9b004b7ff3289fb7bae35130c0a5c0537266af
change-id: 20251223-upstream_sgpio-70d815c64a19

Best regards,
-- 
Billy Tsai <billy_tsai@aspeedtech.com>


