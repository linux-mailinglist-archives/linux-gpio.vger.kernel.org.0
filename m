Return-Path: <linux-gpio+bounces-29791-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D40B9CD5EE0
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Dec 2025 13:09:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D2CF93002487
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Dec 2025 12:09:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 749C2221554;
	Mon, 22 Dec 2025 12:09:41 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A96A1DE8AF;
	Mon, 22 Dec 2025 12:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766405381; cv=none; b=qVarsB78xop7/tvzdCeeUU0hBPN1u8leE2MLo/Za1R1/r7i1N/9b8J345fihd0Vf6a4FdzmLhj/JRd4qM2vUml63Ib7MTexAulueOKSFLstXrcVo9Hx3Nyy0bf7WBnxK+xuRV4tQWoe+dSIdFDtrkezUurC8rjuVwPTuPHJJX3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766405381; c=relaxed/simple;
	bh=MxAUc30lY0ZVTV1TxW0DLWInUg2EQAPZTWnhohxQjyk=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=nzMZiqDZBAePQznbxM/shEFWMX3RKdZKAJvsmkA9Oxnq314wuz8fQeshKJqiu59axTIql1p6MosdqMs/bV1kKsMOwcawD/MzCUqm2uGbgTyBild0ARKF5iwl/IkedQOttQOrnRBacnXeZifs8CKXXdDeWRY0IOcJMjQwKoC+gS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 22 Dec
 2025 20:04:29 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 22 Dec 2025 20:04:29 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: [PATCH 0/3] pinctrl: single: bit-per-mux DT flexibility, probe
 robustness, and consistent pinconf offsets
Date: Mon, 22 Dec 2025 20:04:25 +0800
Message-ID: <20251222-upstream_pinctrl_single-v1-0-e4aaa4eeb936@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMkzSWkC/x3MQQqDMBBG4avIrBtoBgrGq0gRq390wMYwo1IQ7
 97g8lu8d5JBBUZNdZLiEJM1FfhHRcPcpwlOxmLiJ788M7s926bov12WNGy6dCZpWuBCQD1GH8G
 fQKXOiii/+9y+r+sPwiYqu2kAAAA=
X-Change-ID: 20251222-upstream_pinctrl_single-99e8df1fe2b9
To: Tony Lindgren <tony@atomide.com>, Haojian Zhuang
	<haojian.zhuang@linaro.org>, Linus Walleij <linusw@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<andrew@codeconstruct.com.au>, <BMC-SW@aspeedtech.com>, Billy Tsai
	<billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766405069; l=1471;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=MxAUc30lY0ZVTV1TxW0DLWInUg2EQAPZTWnhohxQjyk=;
 b=ihkcVXvoKMMsN5sgT9VKTh+61Jy1UWM8XbsOLhVUip3f5ih3MdjCw2Qc6mlRaJdapSGOkunAX
 4HGYFNmwjWYDbGb/si/04AZt0GRDg44y0zEuf6i7odgjr7us7gRNOeK
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=

This series updates pinctrl-single to behave more predictably on
bit-per-mux platforms by making its DT interface more flexible, its probe
path more tolerant of pre-reserved resources, and its pin configuration
register addressing consistent with pinmux.
It extends the driver to accept a per-pin <pin_index func_sel> style
description for bit-per-mux users while keeping the existing
pinctrl-single,bits binding as the preferred input when available. It also
relaxes probe failure when the I/O memory region cannot be reserved
exclusively, allowing initialization to proceed with a warning on systems
where that region is already reserved. Finally, it aligns pinconf register
offset computation with the pinmux logic so that both muxing and pin
configuration access the same register offsets, avoiding incorrect pinconf
operations on bit-per-mux configurations.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
Billy Tsai (3):
      pinctrl: single: add per-pin binding support for bit-per-mux
      pinctrl: single: Allow probe to continue if mem region busy
      pinctrl: single: unify pinconf offset mapping with pinmux

 drivers/pinctrl/pinctrl-single.c | 150 ++++++++++++++++++++++++++++-----------
 1 file changed, 110 insertions(+), 40 deletions(-)
---
base-commit: dd9b004b7ff3289fb7bae35130c0a5c0537266af
change-id: 20251222-upstream_pinctrl_single-99e8df1fe2b9

Best regards,
-- 
Billy Tsai <billy_tsai@aspeedtech.com>


