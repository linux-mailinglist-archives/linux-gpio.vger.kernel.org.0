Return-Path: <linux-gpio+bounces-7332-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F2A902BC4
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 00:37:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 80E101C216B4
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2024 22:37:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61B2915098E;
	Mon, 10 Jun 2024 22:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bpWvbY2Z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out-176.mta0.migadu.com (out-176.mta0.migadu.com [91.218.175.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49EB5466B
	for <linux-gpio@vger.kernel.org>; Mon, 10 Jun 2024 22:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718059029; cv=none; b=u8Of3HL+puLJkkUE6lt2g24dRcwDJQY4pJHId4XUh/Qlz3EDBBi0fI9MW0/xwYR0/EXhh1qtDpJMRdiVJ97vMNK+0fm+fK5LIG6JF22dljHlJO6I6nj/2JlgdVJIeU6M1n9MOoAq8VVjVYzHB71XzMpKyAaTkcg7sIFgNFp0g9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718059029; c=relaxed/simple;
	bh=UUjGE1dIt3wWHQK4CxFnESTgMlrvmbty3Vi61/QzSVY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=A1Z58raimuYaaTmStuYmbs2K6j3f6zAlBmd6bO7/TVhCt9onaxS3UiL/wlFfJsYuKmFA75WUwHuiZrba9dxQ15A5NiiBvFUu7++PG2DozbOOeuexfEv+EzkRx2AVvtrms+TgHUbloAVGsWjzpkZe3Kp695SFIgpDPWDMEFTdJlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bpWvbY2Z; arc=none smtp.client-ip=91.218.175.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linus.walleij@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1718059024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BTtVyjqMEOKamwROfc4Uav8Qw2izbw3MOKMVpFlCw1o=;
	b=bpWvbY2Zo9ZZ0d/80dKuV323LLrIOyzoDfyi2p235pdmXX0u1tiSnVwjooaFiFvCQw0X0P
	ihP6lagDjt8iryw33TT7lVLOrDX6marvKLp8oeNnb5ha+U9QkgHWEgFEBrZvbPf8dIf1fu
	MI2xh1rbi04uUKT8UHSDzBdRZRKZCTM=
X-Envelope-To: michal.simek@amd.com
X-Envelope-To: linux-gpio@vger.kernel.org
X-Envelope-To: andy.shevchenko@gmail.com
X-Envelope-To: sai.krishna.potthuri@amd.com
X-Envelope-To: linux-arm-kernel@lists.infradead.org
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: sean.anderson@linux.dev
X-Envelope-To: conor+dt@kernel.org
X-Envelope-To: krzk+dt@kernel.org
X-Envelope-To: robh@kernel.org
X-Envelope-To: devicetree@vger.kernel.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
To: Linus Walleij <linus.walleij@linaro.org>,
	Michal Simek <michal.simek@amd.com>,
	linux-gpio@vger.kernel.org
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Krishna Potthuri <sai.krishna.potthuri@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sean Anderson <sean.anderson@linux.dev>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v3 0/2] pinctrl: zynqmp: Support muxing individual pins
Date: Mon, 10 Jun 2024 18:35:48 -0400
Message-Id: <20240610223550.2449230-1-sean.anderson@linux.dev>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

This series adds support for muxing individual pins, instead of
requiring groups to be muxed together. See [1] for additional
discussion.

[1] https://lore.kernel.org/linux-arm-kernel/5bb0dc7e-4c89-4f3d-abc6-41ae9ded5ae9@linux.dev/

Changes in v3:
- Express groups/pins exclusivity using oneOf
- Fix zynqmp_pinmux_set_mux and zynqmp_pinconf_group_set not handling
  "pin" groups (thanks Sai Krishna).

Changes in v2:
- Use __set_bit instead of set_bit
- Use size_add when calculating the number of kcalloc members
- Expand commit message with some more motivation

Sean Anderson (2):
  dt-bindings: pinctrl: xilinx: Add support for function with pins
  pinctrl: zynqmp: Support muxing individual pins

 .../bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml | 349 +++++++++---------
 drivers/pinctrl/pinctrl-zynqmp.c              |  83 +++--
 2 files changed, 234 insertions(+), 198 deletions(-)

-- 
2.35.1.1320.gc452695387.dirty


